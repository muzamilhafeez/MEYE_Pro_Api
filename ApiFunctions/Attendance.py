from datetime import datetime
from typing import List
import cv2
import face_recognition
import numpy as np
from sql import MySQL
import Model.Attendance as mattendace
import main 
class AttendanceApi:
    def __init__(self,attendance) -> None:
        self.attendance = attendance
        
    def attendance_details(self,dvrID):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                SELECT * FROM ATTENDANCE 
                    ''')
        lst=[]
        for row in cursor.fetchall():
           lst.append(self.cam.Attendance(id=row.ID,dvrID=row.DvrID,venueID=row.VenueID,portNumber=row.PortNumber))
        
        return {"data":lst}
        
    def update_attendance_details(self,attendanceId,status):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   UPDATE ATTENDANCE SET Status = '{status}'
                   WHERE ID ='{attendanceId}'
                   ''')
        cursor.execute(f'''
                       Delete From Claim Where AttendanceId='{attendanceId}'
                       ''')
    
        return "okay"
    def delete_attendance_details(self,attendance):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   DELETE FROM ATTENDANCE WHERE ID = '{attendance.id}'
                    ''')
    
        return {"data":"okay"}
    def add_attendance(self,attendance:List[mattendace.Attendance]):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        for data in attendance:
            cursor.execute(f'''
                    INSERT INTO ATTENDANCE
                    VALUES
                    ('{data.enrollId}','{data.status}','{data.date}','{data.startTime}','{data.endTime}','{data.day}','{data.teacherName}')
                    ''')
            # if data.status==False:
            #     await  main.send_notification("","Absent")
            if data.status==False:
                cursor.execute(f'''
                Select ID FROM Attendance Where EnrollId='{data.enrollId}'
                and status='{data.status}' and date ='{data.date}'
                ''')
                id=-1
                for i in cursor.fetchall():
                    id=i[0]
                cursor.execute(f'''
                        INSERT INTO TempAttendance
                        VALUES
                        ('{id}','{data.startTime}','{data.endTime}','{data.date}','{data.day}','{data.teacherName}')
                        ''')
        return "Attendance Marked"
    
    def add_temp_attendance(self,attendance:List[mattendace.Attendance]):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        for data in attendance:
            cursor.execute(f'''
                    INSERT INTO TempAttendance
                    VALUES
                    ('{data.enrollId}','{data.status}','{data.date}','{data.day}','{data.startTime}','{data.endTime}','{data.teacherName}')
                    ''')
            # if data.status==False:
            #     await  main.send_notification("","Absent")
        return "Attendance Marked"
    
    def mark_attendance(self,img):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        # test_image =  face_recognition.load_image_file(img)
        # face_encodings = face_recognition.face_encodings(test_image)
        test_image = cv2.imread(img)
        test_image = cv2.resize(test_image, (0, 0), fx=0.5, fy=0.5)
        face_locations = face_recognition.face_locations(test_image)
        face_encodings = face_recognition.face_encodings(test_image,face_locations)
        lst=[]
        cursor.execute(f'''                 
                       SELECT  s.*,e.ID,t.StartTime,t.EndTime,t.TeacherName,t.Day
                        FROM TIMETABLE t Inner Join OFFERED_COURSES oc On
                       oc.CourseCode=t.CourseCode Inner Join SECTION_OFFER so On so.CourseOfferId=oc.ID Inner Join
                       ENROLL e on e.SectionOfferID=so.ID Inner Join STUDENT s on
                       s.AridNo = e.StudentID WHERE t.TeacherName Like 'Dr. Hassan%' AND
                       t.Day='Friday' AND t.StartTime='11:30:00.000000'
                       ''')
        
        for row in cursor.fetchall():
            lst.append(self.mark_and_save_attendance(face_encodings,row.Image,row.ID,row.Name,
                                                     row.StartTime,row.EndTime,row.TeacherName,row.Day))
            print(f'''
                  {row.Name} Attendance Marked
                  ''')
        return lst
    


    def mark_attendance_by_video(self,img,lstAttendance,index):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        # test_image =  face_recognition.load_image_file(img)
        # face_encodings = face_recognition.face_encodings(test_image)
        # test_image = cv2.imread(img)
        test_image=img
        test_image = cv2.resize(test_image, (0, 0), fx=0.5, fy=0.5)
        face_locations = face_recognition.face_locations(test_image)
        face_encodings = face_recognition.face_encodings(test_image,face_locations)
        lst=[]
        cursor.execute(f'''                 
                       SELECT  s.*,e.ID,t.StartTime,t.EndTime,t.TeacherName,t.Day
                        FROM TIMETABLE t Inner Join OFFERED_COURSES oc On
                       oc.CourseCode=t.CourseCode Inner Join SECTION_OFFER so On so.CourseOfferId=oc.ID Inner Join
                       ENROLL e on e.SectionOfferID=so.ID Inner Join STUDENT s on
                       s.AridNo = e.StudentID WHERE t.TeacherName Like 'Dr. Hassan%' AND
                       t.Day='Friday' AND t.StartTime='11:30:00.000000'
                       ''')
        
        for row in cursor.fetchall():
            lst.append(self.mark_and_save_attendance(face_encodings,row.Image,row.ID,row.Name,
                                                     row.StartTime,row.EndTime,row.TeacherName,row.Day))
            print(f'''
                  {row.Name} Attendance Marked
                  ''')
        lstAttendance[index]=lst
    
    def mark_and_save_attendance(self,face_encodings,Image,ID,Name,StartTime,EndTime,TeacherName,Day):
        try:
            image = cv2.imread(f'UserImages/Student/{Image}')
            image = cv2.resize(image, (0, 0), fx=0.5, fy=0.5)
            image_encodings = face_recognition.face_encodings(image)[0]
        except:
            image =  face_recognition.load_image_file(f'UserImages/Student/{Image}')
            image_encodings = face_recognition.face_encodings(image)[0]
        # img = cv2.imread(f'UserImages/Student/{Image}')
        # height, width = img.shape[:2]
        # new_width = 640
        # new_height = int(new_width * height / width)
        # img = cv2.resize(img, (new_width, new_height))
        # image_encodings = face_recognition.face_encodings(img)
        count=0
        for face_encoding in face_encodings:
            matches = face_recognition.compare_faces(np.expand_dims(image_encodings,axis=0),face_encoding,tolerance=0.55)
            if True in matches:
                print(np.linalg.norm(np.expand_dims(image_encodings,axis=0) - face_encoding, axis=1))
                count+=1
                return mattendace.Attendance(id=0,enrollId=ID,date=str(datetime.now().date()),status=True,name=Name,startTime=StartTime,
                                             endTime=EndTime,day=Day,teacherName=TeacherName)
                
        if count==0:
            return mattendace.Attendance(id=0,enrollId=ID,date=str(datetime.now().date()),status=False,name=Name,startTime=StartTime,
                                             endTime=EndTime,day=Day,teacherName=TeacherName)
    
    def push_notification(self,aridNumber):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                       Select t.AttendanceId From TempAttendance t Inner Join
                       Attendance a on a.ID=t.AttendanceId Inner Join ENROLL e 
                       on a.EnrollId=e.ID Inner Join STUDENT s on s.AridNo=e.StudentID
                       Where s.AridNo='{aridNumber}' and a.Status='False'
                       ''') 
        id=-1
        for row in cursor.fetchall():
            id=row.AttendanceId
        return id
    

    def student_notification_data(self,aridNumber):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''       
                Select t.AttendanceId, tt.TeacherName,tt.CourseName,tt.Day,tt.StartTime,tt.EndTime, 
                t.Date From TempAttendance t Inner Join ATTENDANCE a on a.ID=t.AttendanceId inner Join ENROLL e on e.ID=a.EnrollId 
                Inner Join STUDENT s on s.AridNo=e.StudentID Inner Join SECTION_OFFER so on so.ID=e.SectionOfferID
                Inner Join OFFERED_COURSES oc on oc.ID=so.CourseOfferId Inner Join TIMETABLE tt on tt.CourseCode=oc.CourseCode
                and tt.Discipline=so.Discipline WHERE tt.TeacherName=t.TeacherName AND
                tt.Day=t.Day AND tt.StartTime=t.StartTime and s.AridNo='{aridNumber}'
                                ''')
        lst=[]
        for row in cursor.fetchall():
            image =''
            name = str(row.TeacherName).split(',')[0]
            sql1 = MySQL()
            sql1.__enter__()
            cursor1 = sql1.conn.cursor()
            cursor1.execute(f'''
                            Select Image From Meye_User where name='{name}'
                            ''')
            for img in cursor1.fetchall():
                image=img[0]
                break
            lst.append(mattendace.NotificationData(
                id=row.AttendanceId,
                name=row.TeacherName,startTime=row.StartTime,
                                                      courseName=row.CourseName,date=row.Date,day=row.Day,
                                                      endTime=row.EndTime,
                                                      image=image))
        return lst
    

    def teacher_notification_data(self,teacherName):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''       
                Select s.AridNo,s.Image,s.Name, a.ID, tt.TeacherName,tt.CourseName,tt.Day,tt.StartTime,tt.EndTime, 
                a.Date From  ATTENDANCE a Inner Join Claim c on c.AttendanceId=a.ID  inner Join ENROLL e on e.ID=a.EnrollId 
                Inner Join STUDENT s on s.AridNo=e.StudentID Inner Join SECTION_OFFER so on so.ID=e.SectionOfferID
                Inner Join OFFERED_COURSES oc on oc.ID=so.CourseOfferId Inner Join TIMETABLE tt on tt.CourseCode=oc.CourseCode
                and tt.Discipline=so.Discipline WHERE tt.TeacherName=a.TeacherName AND
                tt.Day=a.Day AND tt.StartTime=a.StartTime and tt.TeacherName Like '{teacherName}%'
                                ''')
        lst=[]
        for row in cursor.fetchall():
            lst.append(mattendace.NotificationData(
                id=row.ID,
                name=row.Name,startTime=row.StartTime,
                                                      courseName=row.CourseName,date=row.Date,day=row.Day,
                                                      endTime=row.EndTime,
                                                      image=row.Image))
        return lst
    def claim_attendance(self,claim:mattendace.Claim):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                       Insert Into Claim Values ('{claim.attendanceId}','{claim.teacherName}')
                       ''')
        cursor.execute(f'''
                       Delete From TempAttendance Where AttendanceId='{claim.attendanceId}'
                       ''')
        return 'okay'
        
