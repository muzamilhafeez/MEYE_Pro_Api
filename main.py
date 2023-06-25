import datetime
from datetime import datetime, timedelta
import os
from pathlib import Path
import threading
from typing import List
from fastapi import Depends, FastAPI, HTTPException, Header, Response,File, UploadFile
from pydantic import BaseModel
import uvicorn
from fastapi.responses import FileResponse,StreamingResponse
import cv2
from LiveVideo import LiveStreaming
import Model.DVR as mdvr
import Model.User as muser
import ApiFunctions.DVR as apidvr
import ApiFunctions.User as apiuser
import Model.TimeTable as mtimetable
import ApiFunctions.TimeTable as apitimetable
import Model.Camera as mcamera
import ApiFunctions.Camera as apicamera
import Model.Enroll as menroll
import ApiFunctions.Enroll as apienroll
import Model.Section as msection
import ApiFunctions.Section as apisection
import Model.Venue as mvenue
import ApiFunctions.Venue as apivenue
import Model.Recordings as mrecordings
import ApiFunctions.Recordings as apirecordings
import Model.Reschedule as mreschedule
import ApiFunctions.Reshedule as apireschedule
import Model.Preschedule as mpreschedule
import ApiFunctions.Preschedule as apipreschedule
import Model.TeacherSlots as mteacherslots
import ApiFunctions.Offered_Courses as apiOfferedCourses
import Model.Offered_Courses as mOfferedCourses
import ApiFunctions.Section_Offer as apiSectionOffer
import Model.Section_Offer as mSectionOffer
import ApiFunctions.TeacherSlots as apiteacherslots
import ApiFunctions.Student as apiStudent
import ApiFunctions.Attendance as apiAttendance
import Model.Attendance as mAttendance
import ApiFunctions.Rules as apiRules
import Model.Rules as mRules
import ApiFunctions.Swapping as apiSwapping
import Model.Swapping as mSwapping
import ApiFunctions.CheckTimeDetails as apiCheckTimeDetails
import Model.CheckTimeDetails as mCheckTimeDetails
from VideoAttendance import VideoAttendance
from VideoDemo import DemoVideo
# import nest_asyncio
from VideoRecording import RTSPVideoWriterObject
from parse_excel import Parse_Excel
from sql import MySQL
from fastapi.middleware.cors import CORSMiddleware
import face_recognition
import requests
import fcmKey
from ultralytics import YOLO
import warnings
from LiveSitFrameReport import LiveSitFrameReport 


networkip = '192.168.100.10'
networkport = 8000
# 'rtsp://192.168.0.108:8080/h264_ulaw.sdp'
app = FastAPI()
model = YOLO('ActivityRecognition/xbest.pt')

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)


# templates = Jinja2Templates(directory="templates")
# @app.get("/", response_class=HTMLResponse)
# async def read_item(request: Request):
#     return templates.TemplateResponse("indexweb.html", {"request": request})

#rtsp://{timetable.HOST}:{timetable.PASSWORD}@{timetable.IP}/user={timetable.HOST}&password={timetable.PASSWORD}&channel={timetable.CHANNEL}&stream={timetable.PortNumber}.sdp', timetable.StartRecord, timetable.EndRecord, timetable.FullRecord,timetable.StartTime,timetable.EndTime,timetable.Day,timetable.TeacherName,timetable.TimeTableId

# CHUNK_SIZE = 1024*1024
file_path = "Recordings/file,63,complete_recording.mp4"


# @app.get("/video")
# async def video_feed():
#    return FileResponse("Recordings/file,64,start_recording.mp4")

CHUNK_SIZE = 1024*1024

FCM_ENDPOINT = "https://fcm.googleapis.com/fcm/send"

FCM_SERVER_KEY =fcmKey.key

@app.post("/send-notification/{device_token}")
async def send_notification(device_token: str, message: str):
    device_token = "fgHx-IjbQs-max0L3xjOf5:APA91bGMXTbfuFQiTdXHZOsf7Lcm032b4Lx5JhXuhfTNB2lLMtUyHRvikCbTTU2v4DyP7jng6Rva0R3VSXlG-gcC8N48RAFH3cyNw4SKR-MbgZJceN9uU5Jisuh3ex8O6HJlN157NZCZ"
    payload = {
        "notification": {
            "title": "Attendance",
            "body": message,
            "click_action": "FLUTTER_NOTIFICATION_CLICK"
        },
        "to": device_token
    }

    headers = {
        "Authorization": f"key={FCM_SERVER_KEY}",
        "Content-Type": "application/json"
    }

    response = requests.post(FCM_ENDPOINT, json=payload, headers=headers)

    if response.status_code == 200:
        return {"message": "Notification sent successfully!"}
    else:
        raise HTTPException(status_code=500, detail=f"Error sending notification: {response.text}")



@app.get("/video")
async def video_endpoint(range: str = Header(None),path:str=None):
    video_path = Path(path)
    if range==None:
        range = "bytes=0-"
    start, end = range.replace("bytes=", "").split("-")
    start = int(start)
    end = int(end) if end else start + CHUNK_SIZE
    print(range)
    with open(video_path, "rb") as video:
        video.seek(start)
        data = video.read(end - start)
        filesize = str(video_path.stat().st_size)
        headers = {
            "content-type": "video/mp4",
            "content-encoding": "identity",
            'Content-Range': f'bytes {str(start)}-{str(end)}/{filesize}',
            'Accept-Ranges': 'bytes',
            "content-length"  : filesize,
            "access-control-expose-headers": (
            "content-type, accept-ranges, content-length, "
            "content-range, content-encoding"
        ),
        }
        warnings.filterwarnings('ignore')
        return Response(data, status_code=206, headers=headers, media_type="video/mp4")
    
#---------------------------Camera-----------------------------------------

    
# def connect(websocket,count):
#         asyncio.set_event_loop(asyncio.new_event_loop())
#         async def  connect(websocket,count):
#             await websocket.accept()
#             camera = cv2.VideoCapture('rtsp://192.168.235.103:8080/h264_ulaw.sdp')
#             # if count==1:
#             #     camera = cv2.VideoCapture('rtsp://192.168.43.228:8080/h264_ulaw.sdp')
#             #     count+=1
#             # else:
#             #     camera = cv2.VideoCapture('rtsp://192.168.43.118:8080/h264_ulaw.sdp')
#             while True:
#                 success, frame = camera.read()
#                 if not success:
#                     break
#                 else:
#                     ret, buffer = cv2.imencode('.jpg', frame)
#                     await websocket.send_bytes(buffer.tobytes()) 
#         asyncio.get_event_loop().run_until_complete(connect(websocket,count))
        
# async def  connect1(websocket,count):
#         await websocket.accept()
#         if count==1 or count==2:
#             camera = cv2.VideoCapture('rtsp://192.168.43.228:8080/h264_ulaw.sdp')
#             count+=1
#         else:
#             camera = cv2.VideoCapture('rtsp://192.168.43.118:8080/h264_ulaw.sdp')
#         while True:
#             success, frame = camera.read()
#             if not success:
#                 break
#             else:
#                 ret, buffer = cv2.imencode('.jpg', frame)
#                 await websocket.send_bytes(buffer.tobytes()) 

# @app.websocket("/{count}/ws")
# async def get_stream(websocket: WebSocket,count: int):
#     try:
#         connect(websocket,count)
#         # Thread(target=asyncio.run,args=(connect1(websocket=websocket,count=count))).start()
#     except WebSocketDisconnect:
#         print("Client disconnected")   


#------------------------------------------------Video Recordings----------------------------------------------------------------

def iterfile(id,record):
    video_path=f'Recordings/file,{id},{record}_recording.mp4'
    outputFrame = cv2.VideoCapture(video_path)
    while True:
        status,img= outputFrame.read()
        if status==False:
            break
        (flag, encodedImage) = cv2.imencode(".jpg", img)
        if not flag:
            continue
        yield (b'--frame\r\n' b'Content-Type: image/jpeg\r\n\r\n' +
               bytearray(encodedImage) + b'\r\n')

@app.get('/get-video-recordings/{id}/{record}')
def getvideo(id:str,record:str):
    return StreamingResponse(iterfile(id,record), media_type="multipart/x-mixed-replace;boundary=frame")


def cam(ip, s, e, f,stime,etime,day,teacherName,timetableId):
    teacherslot_object = apiteacherslots.TeacherSlots(teacherslots=mteacherslots)
    teacherSlot = mteacherslots.TeacherSlot
    teacherSlot.id=0
    teacherSlot.timetableId=timetableId
    teacherSlot.status="Not Held"
    teacherSlot.slot=0
    lst = teacherslot_object.teacherslots_details(timetableId=timetableId)
    for i in lst:
        teacherSlot.slot=i.slot
    teacherSlot.slot=teacherSlot.slot+1
    teacherslot_object.add_teacherslots(teacherslots=teacherSlot)
    sql = MySQL()
    sql.__enter__()
    cursor = sql.conn.cursor()
    cursor.execute(f'''
            SELECT ID FROM TeacherSlots WHERE TimeTableId='{timetableId}'
            AND Slot='{teacherSlot.slot}'
                ''')
    slotid=-1
    for row in cursor.fetchall():
        slotid=row.ID
    img = cv2.imread('temp895 - Copy.JPG')
    model.predict(img,stream=True, imgsz=640)
    st = datetime.now()
    et = st + timedelta(minutes=2)
    stime= st
    etime =  et
    s=1
    e=0
    f=0
    m=1
    print(ip, s, e, f,stime,etime,day,teacherName)
    
    video_stream_widget = LiveStreaming()
    video_stream_widget.update(st=stime,et=etime,model=model,teacherName=teacherName,slotId=slotid,ip=ip,start_recording=s,mid_recording=m,end_recording=e,full_recording=f)


def camSitTask(ip, s, e, f, stime, etime, day, teacherName, timetableId):
    teacherslot_object = apiteacherslots.TeacherSlots(teacherslots=mteacherslots)
    teacherSlot = mteacherslots.TeacherSlot
    teacherSlot.id = 0
    teacherSlot.timetableId = timetableId
    teacherSlot.status = "Not Held"
    teacherSlot.slot = 0
    lst = teacherslot_object.teacherslots_details(timetableId=timetableId)
    for i in lst:
        teacherSlot.slot = i.slot
    teacherSlot.slot = teacherSlot.slot + 1
    teacherslot_object.add_teacherslots(teacherslots=teacherSlot)
    sql = MySQL()
    sql.__enter__()
    cursor = sql.conn.cursor()
    cursor.execute(f'''
            SELECT ID FROM TeacherSlots WHERE TimeTableId='{timetableId}'
            AND Slot='{teacherSlot.slot}'
                ''')
    slotid = -1
    for row in cursor.fetchall():
        slotid = row.ID
    img = cv2.imread('temp895 - Copy.JPG')
    model.predict(img, stream=True, imgsz=640)
    st = datetime.now()
    et = st + timedelta(minutes=2)
    stime = st
    etime = et
    s = 1
    e = 0
    f = 0
    m = 1
    print(ip, s, e, f, stime, etime, day, teacherName)

    video_stream_widget = LiveSitFrame()
    video_stream_widget.update(st=stime, et=etime, model=model, teacherName=teacherName, slotId=slotid, ip=ip,
                               start_recording=s, mid_recording=m, end_recording=e, full_recording=f)
@app.get("/api/videos")
async def get_video(id:str,type:str):
    video_path = f"Recordings/file,{id},{type}"
    return FileResponse(video_path, media_type="video/mp4")





# @app.get("/")
# def startServer():
#     sql = MySQL()
#     sql.__enter__()
#     cursor = sql.conn.cursor()
#     cursor.execute(f'''
#                    Select * From TIMETABLE t left Join TEACHERSLOTS ts 
#                    on ts.TimeTableId=t.ID
#                    left Join RESCHEDULE r on ts.ID=r.TeacherSlotId
#                    ''')
#     for row in cursor.fetchall():
#         if row[6]=='Monday':
#             print(row)


        
@app.get('/stream')
def start_stream():
    sql = MySQL()
    sql.__enter__()
    cursor = sql.conn.cursor()
    cursor.execute(f'''
                   SELECT * FROM TEMPORARY_TIMETABLE  INNER JOIN 
                   TIMETABLE t On TEMPORARY_TIMETABLE.TimeTableId = t.ID 
                   Inner Join VENUE v On t.Venue=v.NAME INNER JOIN CAMERA 
                   C ON  C.VenueId = v.ID INNER JOIN DVR d ON d.ID=C.DvrID
                   Where t.ID=490
                   ''')
    for timetable in cursor.fetchall():
        t1 = threading.Thread(target=cam, args=(f'rtsp://{timetable.IP}:8080/h264_ulaw.sdp', timetable.StartRecord, timetable.EndRecord, timetable.FullRecord,timetable.StartTime,timetable.EndTime,timetable.Day,timetable.TeacherName,timetable.TimeTableId))
        t1.start()
    
@app.get('/task')
def start_stream(videopath:str):
    sql = MySQL()
    sql.__enter__()
    cursor = sql.conn.cursor()
    cursor.execute(f'''
                   SELECT * FROM TEMPORARY_TIMETABLE  INNER JOIN 
                   TIMETABLE t On TEMPORARY_TIMETABLE.TimeTableId = t.ID 
                   Inner Join VENUE v On t.Venue=v.NAME INNER JOIN CAMERA 
                   C ON  C.VenueId = v.ID INNER JOIN DVR d ON d.ID=C.DvrID
                   Where teacherName=={videopath.split(' ')[0]}
                   ''')
    for timetable in cursor.fetchall():
        t1 = threading.Thread(target=cam, args=(f'Data/{videopath}', timetable.StartRecord, timetable.EndRecord, timetable.FullRecord,timetable.StartTime,timetable.EndTime,timetable.Day,timetable.TeacherName,timetable.TimeTableId))
        t1.start()
        t1.join()
        break
    return 'Report Generate'
#---------------------------DVR-----------------------------------------
#
@app.get('/api/taskreport')
def taskreport():
    lstFolder = os.listdir('Recordings/RecordingSitFrame')
    lst=[]
    for i in lstFolder:
        sql= MySQL()
        sql.__enter__()
        cursor= sql.conn.cursor()
        cursor.execute(f'''''')

        index=-1
        isShow=False
        for row in cursor.fetchall():
            if row.ActivityStatus=='Sit':
                lstSit =  os.listdir(f'Recordings/RecordingSitFrame/{i}/Sit/')
                for sit in lstSit:
                    hour,min,sec = sit.split(',')[0].split(' ')
                    originalhour,originalmin,originalsec = str(row.TimeIn).split(' ')[1].split('.')[0].split(':')
                    if originalhour==hour and originalmin==min and originalsec==sec:
                        isShow=True
                        temp  = mCheckTimeDetails.TeacherCHRActivityDetailsSit(timein=row.TimeIn,
                                                                               timeout=row.TimeOut,
                                                                               status=row.ActivityStatus,
                                                                               image=f'Recordings/RecordingSitFrame/{i}/Sit/{sit}')
                        for d in lst:
                            if d.id==row.ID:
                                index=0
                                d.teacherCHRActivityDetails.append(temp)
            else:
                lstStand =  os.listdir(f'Recordings/RecordingSitFrame/{i}/Stand/')
                for stand in lstStand:
                    hour,min,sec = stand.split(',')[0].split(' ')
                    originalhour,originalmin,originalsec = str(row.TimeIn).split(' ')[1].split('.')[0].split(':')
                    if originalhour==hour and originalmin==min and originalsec==sec:
                        temp  = mCheckTimeDetails.TeacherCHRActivityDetailsSit(timein=row.TimeIn,
                                                                               timeout=row.TimeOut,
                                                                               status=row.ActivityStatus,
                                                                               image=f'Recordings/RecordingSitFrame/{i}/Stand/{stand}')
                        for d in lst:
                            if d.id==row.ID:
                                index=0
                                d.teacherCHRActivityDetails.append(temp)
            if index==-1:
                lst.append(mCheckTimeDetails.TeacherCHRDetailsSit(
                    id=row.ID,
                    courseName=row.CourseName,
                    day=row.Day,
                    discipline=row.Discipline,
                    startTime=row.StartTime,
                    endTime=row.EndTime,
                    totalTimeIn=row.TotalTimeIn,
                    totalTimeOut=row.TotalTimeOut,
                    status=row.Status,
                    date=row.Date,
                    teacherName=row.TeacherName,
                    image=row.Image,
                    venue=row.Venue,
                    sit=row[5],
                    stand=row[6],
                    teacherSlotId=row.TeacherSlotID,
                    isShown=isShow,
                    teacherCHRActivityDetails=[temp]))
    return lst
    #

@app.post('/api/add-dvr') 
def adddvr(dvr : mdvr.DVR):
    return dvr_object.add_dvr(dvr=dvr)

@app.get('/api/dvr-details') 
def dvrdetails():
    return dvr_object.dvr_details()
    
@app.put('/api/update-dvr-details') 
def updatedvrdetails(dvr : mdvr.DVR):
    return dvr_object.update_dvr_details(dvr=dvr)
    
    
@app.delete('/api/delete-dvr-details') 
def deletedvrdetails(dvr : mdvr.DVR):
    return dvr_object.delete_dvr_details(dvr=dvr)

#---------------------------------Camera---------------------------------

@app.post('/api/add-camera') 
def addcamera(camera : mcamera.Camera):
    return camera_object.add_camera(camera=camera)

@app.get('/api/camera-details/{dvrID}') 
def cameradetails(dvrID:int):
    return camera_object.camera_details(dvrID)
    
@app.put('/api/update-camera-details') 
def updatecameradetails(camera : mcamera.Camera):
    return camera_object.update_camera_details(camera=camera)
    
    
@app.delete('/api/delete-camera-details') 
def deletecameradetails(camera : mcamera.Camera):
    return camera_object.delete_camera_details(camera=camera)


#---------------------------User-----------------------------------------
@app.post('/api/add-user') 
def adduser(user : muser.User=Depends(),file: UploadFile = File(...)):
    try:
        contents = file.file.read()
        foldername = user.role.value
        path=f"UserImages/{foldername}/{file.filename}"
        with open(path, 'wb') as f:
            f.write(contents)
        user.image = file.filename
        return user_object.add_user(user=user)
    except Exception:
        return {"data": "There was an error uploading the file"}
    finally:
        file.file.close()
    

@app.get('/api/user-details') 
def userdetails():
    return user_object.teacher_details()
    
@app.get('/api/get-user-image/UserImages/{foldername}/{imagename}') 
def getuserimage(foldername:str,imagename:str):
    return FileResponse(f'UserImages/{foldername}/{imagename}')


    
@app.put('/api/update-user-details') 
def updateuserdetails(user : muser.User):
    return user_object.update_user_details(user=user)
    
    
@app.delete('/api/delete-user-details') 
def deleteuserdetails(user : muser.User):
    return user_object.delete_user_details(user=user)

#----------------------------------------Student----------------------------

@app.post('/api/add-student')
def addStudent(student: muser.Student=Depends(),file: UploadFile = File(...)):
    try:
        contents = file.file.read()
        path=f"UserImages/Student/{file.filename}"
        with open(path, 'wb') as f:
            f.write(contents)
        student.image = file.filename
        test_image =  face_recognition.load_image_file(path)
        face_locations = face_recognition.face_locations(test_image)
        face_encodings = face_recognition.face_encodings(test_image,face_locations)
        return student_object.addStudent(student=student)
    except Exception:
        os.remove(f'UserImages/Student/{student.image}')
        return {"data": "There was an error uploading the file"}
    finally:
        file.file.close()
        
@app.get('/api/student-details')
def studentDetails():
    return student_object.studentDetails()

@app.get('/api/get-student-image/UserImages/Student/{imagename}') 
def getuserimage(imagename:str):
    return FileResponse(f'UserImages/Student/{imagename}')

@app.post('/api/student-offered-courses')
def studentCourseOffered(studentCourseOffered: List[str]):
    return student_object.studentCourseOffered(studentCourseOffered=studentCourseOffered)

@app.get('/api/get-student-courses')
def getStudentCourses(aridNumber:str):
    return student_object.getStudentCourses(aridNumber=aridNumber)

@app.get('/api/get-course-attendance')
def getCourseAttendance(aridNumber:str,courseName:str):
    return student_object.getCourseAttendance(aridNumber=aridNumber,courseName=courseName)
    

#---------------------------------TimeTable---------------------------------

@app.post('/api/add-timetable') 
def addtimetable(file: UploadFile = File(...)):
    try:
        contents = file.file.read()
        path=f"{file.filename}"
        print(path)
        with open(path, 'wb') as f:
            f.write(contents)
        #Parse_Excel.parse_excel(path)
        return {
            "data":"TimeTable Updated"
        }
    except Exception:
        print(Exception.args)
        return {"data": "There was an error uploading the file"}
    finally:
        os.remove(path)
        file.file.close()
        

@app.get('/api/timetable-details') 
def timetabledetails():
    return timetable_object.timetable_details()

@app.get('/api/timetable-details-by-date') 
def timetabledetailsbydate(startdate:str,enddate:str):
    return timetable_object.timetable_details_by_date(startDate=startdate,endDate=enddate)

@app.get('/api/teacher-timetable-details/{teacherName}') 
def timetabledetails(teacherName : str):
    return timetable_object.getTeacherTimeTable(teacherName=teacherName)
    
@app.put('/api/update-timetable-details') 
def updatetimetabledetails(timetable : mtimetable.TimeTable):
    return timetable_object.update_timetable_details(timetable=timetable)
    
   
@app.delete('/api/delete-timetable-details') 
def deletetimetabledetails(timetable : mtimetable.TimeTable):
    return timetable_object.delete_timetable_details(timetable=timetable)

#---------------------------------Enroll---------------------------------

@app.post('/api/add-enroll') 
def addenroll(enroll : menroll.Enroll):
    return enroll_object.add_enroll(enroll=enroll)

@app.post('/api/student-enroll') 
async def enrollStudent(enroll : List[menroll.Enroll]):
    return enroll_object.student_enroll(enroll=enroll)

@app.get('/api/enroll-details') 
def enrolldetails():
    return enroll_object.enroll_details()
    
@app.put('/api/update-enroll-details') 
def updateenrolldetails(enroll : menroll.Enroll):
    return enroll_object.update_enroll_details(enroll=enroll)
    
    
@app.delete('/api/delete-enroll-details') 
def deleteenrolldetails(enroll : menroll.Enroll):
    return enroll_object.delete_enroll_details(enroll=enroll)


#---------------------------------Venue---------------------------------
@app.post('/api/add-venue') 
def addvenue(venue : mvenue.Venue):
    return venue_object.add_venue(venue=venue)

@app.get('/api/venue-details') 
def venuedetails():
    return venue_object.venue_details()
    
@app.put('/api/update-venue-details') 
def updatevenuedetails(venue : mvenue.Venue):
    return venue_object.update_venue_details(venue=venue)
    
    
@app.delete('/api/delete-venue-details') 
def deletevenuedetails(venue : mvenue.Venue):
    return venue_object.delete_venue_details(venue=venue)

#---------------------------------Section---------------------------------
@app.post('/api/add-section') 
def addsection(section : msection.Section):
    return section_object.add_section(section=section)

@app.get('/api/section-details') 
def sectiondetails():
    return section_object.section_details()
    
@app.put('/api/update-section-details') 
def updatesectiondetails(section : msection.Section):
    return section_object.update_section_details(section=section)
    
    
@app.delete('/api/delete-section-details') 
def deletesectiondetails(section : msection.Section):
    return section_object.delete_section_details(section=section)

#---------------------------------Recordings---------------------------------
@app.post('/api/add-recordings') 
def addrecordings(recordings : mrecordings.Recordings):
    return recordings_object.add_recordings(recordings=recordings)

@app.get('/api/recordings-details') 
def recordingsdetails():
    return recordings_object.recordings_details()

@app.get('/api/recordings-details-by-teachername/{teacherName}') 
def recordingsdetailsbyteacherid(teacherName:str):
    return recordings_object.recordings_details_byteacherid(teacherName=teacherName)

@app.get('/api/get-video-thumbnail/{imagename}') 
def getuserimage(imagename:str):
    return FileResponse(f'Recordings/Thumbnails/{imagename}')
  
@app.put('/api/update-recordings-details') 
def updaterecordingsdetails(recordings : mrecordings.Recordings):
    return recordings_object.update_recordings_details(recordings=recordings)
    
    
@app.delete('/api/delete-recordings-details') 
def deleterecordingsdetails(recordings : mrecordings.Recordings):
    return recordings_object.delete_recordings_details(recordings=recordings)

#---------------------------------ReSchedule---------------------------------
@app.post('/api/add-reschedule') 
def addreschedule(reschedule : mreschedule.Reschedule):
    return reschedule_object.add_reschedule(reschedule=reschedule)

@app.get('/api/reschedule-details') 
def rescheduledetails():
    return reschedule_object.reschedule_details()

@app.get('/api/get-timetable') 
def gettimetable():
    return reschedule_object.getTimetable()

@app.get('/api/check-teacher-reschedule')
def checkTeacherRescheduleClass(teacherName:str):
    return reschedule_object.checkTeacherRescheduleClass(teacherName=teacherName)

class lststr(BaseModel):
    lstday : List[str]
    startdate:str
    enddate:str
@app.post('/api/get-timetable-bydates') 
def gettimetablebydates(data: lststr):
    return reschedule_object.gettimetablebydates(startdate=data.startdate,enddate=data.enddate,lstday=data.lstday)
    
@app.put('/api/update-reschedule') 
def updaterescheduledetails(reschedule : mreschedule.Reschedule):
    return reschedule_object.update_reschedule_details(reschedule=reschedule)
    
    
@app.delete('/api/delete-reschedule') 
def deleterescheduledetails(reschedule : mreschedule.Reschedule):
    return reschedule_object.delete_reschedule_details(reschedule=reschedule)

#----------------------------------------------SECTION OFFER------------------------------------------
@app.get('/api/section-offer-details') 
def sectionOfferDetails():
    return sectionOffer_object.SectionOffer_Details()

#----------------------------------------------OFFERED COURSES------------------------------------------
@app.get('/api/offered-courses-details') 
def offeredCoursesDetails():
    return offeredCourses_object.OfferedCourses_Details()

#----------------------------------------------SignIn----------------------------------------------------
@app.get('/api/signin')
def signin(userId:str,password:str):
    return user_object.user_details_by_id(userId=userId,password=password)

#----------------------------------------------Attendance------------------------------------------------
@app.post('/api/mark-attendance') 
def markAttendance(file: UploadFile = File(...)):
    try:
        contents = file.file.read()
        path=f"{file.filename}" 
 
        with open(path, 'wb') as f:
            f.write(contents)
        return attendance_object.mark_attendance(img=path)
    except Exception:
        return {"data": "There was an error uploading the file"}
    finally:
        os.remove(path)
        file.file.close()

@app.post('/api/add-attendance')
def addAttendance(attendance:List[mAttendance.Attendance]):
    response =   attendance_object.add_attendance(attendance=attendance)
    return response

@app.get('/api/update-attendance')
def updateAttendance(attendanceId:int,status:bool):
    response =  attendance_object.update_attendance_details(attendanceId=attendanceId,status=status)
    return response


@app.get('/api/get-attendance-notification')
def push_notification(aridNumber:str):
    return attendance_object.push_notification(aridNumber=aridNumber)

@app.get('/api/get-student-notification-data')
def getStudentNotificationData(aridNumber:str):
    return attendance_object.student_notification_data(aridNumber)

@app.get('/api/get-teacher-notification-data')
def getStudentNotificationData(teacherName:str):
    return attendance_object.teacher_notification_data(teacherName)

@app.post('/api/student-attendance-claim')
def claim_attendance(claim:mAttendance.Claim):
    return attendance_object.claim_attendance(claim=claim)

#-----------------------------------------------------------CheckTimeDetails------------------------------------------
@app.get('/api/get-teacher-chr')
def getTeacherCHR(teacherName:str):
    return checkTimeDetails_object.getTeacherCHR(teacherName=teacherName)

@app.get('/api/get-all-teacher-chr')
def getAllTeacherCHR():
    return checkTimeDetails_object.getAllTeacherCHR()


@app.get('/api/claim-video-thumbnails')
def getThumbnail(file:str):
    return FileResponse(file)


class ClaimVideo(BaseModel):
    file:str
    thumbnail:str
    folder:str
    
@app.get('/api/teacher-claim')
def getclaimVideos(teacherSlotId:int):
    directory = f'Recordings/RecordingDetails/{teacherSlotId}/'
    lst = os.listdir(directory)
    lst_thumbnail=[]
    lst_video=[]
    lst_folder=[]
    final_lst=[]
    for data in lst:
        templst = os.listdir(f'{directory}{data}/')
        count=0
        for temp in templst:
            count+=1
            if temp.split('.')[1]=='jpg':
                lst_thumbnail.append(f'{directory}{data}/{temp}')
            elif temp.split('.')[1]=='mp4':
                lst_video.append(f'{directory}{data}/{temp}')
            if count==2:
                lst_folder.append(data)
                count=0
    for (thumbnail,video,folder) in zip(lst_thumbnail,lst_video,lst_folder):
        final_lst.append(ClaimVideo(file=video,thumbnail=thumbnail,folder=folder))
    return final_lst

@app.get('/api/get-claim-video')
def getClaimVideo(file:str):
    return FileResponse(file)
#------------------------------------------------------------Rules------------------------------------------------------

@app.post('/api/add-rules/{teacherName}')
def getAllTeacherCHR(rules:List[mRules.Rules],teacherName:str):
    return rules_object.add_rules(rules=rules,teacherName=teacherName)

@app.get('/api/get-rules-timetable/{teacherName}')
def getTeacherRulesTimeTable(teacherName:str):
    return rules_object.getTeacherRulesTimeTable(teacherName=teacherName)

#------------------------------------------------------------Preschedule------------------------------------------------------ 
@app.post('/api/add-preschedule') 
def addpreschedule(preschedule : mpreschedule.Preschedule):
    return preschedule_object.add_preschedule(preschedule=preschedule)


#------------------------------------------------------------Swapping------------------------------------------------------ 
@app.post('/api/add-swapping') 
def addswapping(swapping : mSwapping.Swapping):
    return swaping_object.add_swapping(swapping=swapping)


@app.get('/api/get-swapping-teacher-data')
def getSwappingTeacherData(day:str,startTime:str,endTime:str,timeTableId:int):
    return swaping_object.getSwappingTeacherData(day=day,startTime=startTime,endTime=endTime,timeTableId=timeTableId)

#------------------------------------------------------------Demo------------------------------------------------------ 

class Demo(BaseModel):
    file:str
    thumbnail:str
@app.get('/api/demo')
def getDemo():
    videoList = os.listdir('Data/videos')
    videoThumbnails = os.listdir('Data/Thumbnails/')
    demoList = []
    for i in range(len(videoList)):
        demoList.append(Demo(file=videoList[i],thumbnail=videoThumbnails[i]))
    return demoList


@app.get("/api/demovideos")
async def get_video(file:str):
    object = DemoVideo(f'Data/videos/{file}',model,file.split(' ')[0])
    response =object.update()
    return response


@app.get("/api/demothumbnail")
async def get_video(file:str):
    video_path = f"Data/Thumbnails/{file}"
    return FileResponse(video_path)
       
@app.get("/api/demo_video_attendance")
async def get_video(file:str):
    file=f'Data/attendance_videos/{file}'
    object = VideoAttendance()
    response =object.markAttendance(videoFile=file,startTime=10,midTime=20,endTime=40)
    return response

if __name__=='__main__':
    dvr_object =  apidvr.DVRApi(dvr=mdvr)
    camera_object =  apicamera.CameraApi(cam=mcamera)
    user_object = apiuser.UserApi(user=muser)
    timetable_object = apitimetable.TimeTableApi(timetable=mtimetable)
    enroll_object = apienroll.EnrollApi(enroll=menroll)
    venue_object = apivenue.VenueApi(venue=mvenue)
    section_object = apisection.SectionApi(section=msection)
    recordings_object = apirecordings.RecordingsApi(recordings=mrecordings)
    reschedule_object = apireschedule.RescheduleApi(reschedule=mreschedule)
    preschedule_object = apipreschedule.PrescheduleApi(preschedule=mpreschedule)
    sectionOffer_object = apiSectionOffer.SectionOfferApi(sectionOffer=mSectionOffer)
    offeredCourses_object = apiOfferedCourses.OfferedCoursesApi(offeredCourses=mOfferedCourses)
    student_object = apiStudent.StudentApi(student=muser)
    attendance_object = apiAttendance.AttendanceApi(attendance=mAttendance)
    checkTimeDetails_object = apiCheckTimeDetails.CheckTimeDetailsApi(checktimedetails=mCheckTimeDetails)
    rules_object = apiRules.RulesApi(rules=mRules)
    swaping_object = apiSwapping.SwappingApi(swapping=mSwapping)
    uvicorn.run(app, host=networkip,port=networkport)
    
    
    
    
    
    
    
    
    
    
    
   