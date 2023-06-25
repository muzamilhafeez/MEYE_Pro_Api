from datetime import datetime, timedelta
from datetime import datetime
import os
from threading import Thread

import cv2
import Model.CheckTime as mchecktime
import ApiFunctions.CheckTime as apichecktime
from LiveVideoDetails import LiveVideoDetails
import Model.TeacherSlots as mteacherslots
import ApiFunctions.TeacherSlots as apiteacherslots
import Model.CheckTimeDetails as mchecktimedetails
import ApiFunctions.CheckTimeDetails as apichecktimedetails
import Model.ActivityDetails as mactivitydetails
import ApiFunctions.ActivityDetails as apiactivitydetails
import Model.Recordings as mrecordings
import ApiFunctions.Recordings as apirecordings

class LiveStreaming():
    def __init__(self):
        self.codec = cv2.VideoWriter_fourcc(*'h264')
        self.frame_width = 400
        self.frame_height = 200
    def update(self,st,et,model,teacherName,slotId,ip,start_recording,mid_recording,end_recording,full_recording):
        self.slotId=slotId
        self.s=start_recording
        self.m=mid_recording
        self.e=end_recording
        self.f=full_recording
        # cap = cv2.VideoCapture(ip)
        # fullVideoCodec = cv2.VideoWriter_fourcc(*'mp4v')
        # Fullvideo = cv2.VideoWriter(f'Recordings/FullLectureVideos/{slotId},full_recording.mp4', fullVideoCodec, 30, (1920, 1080))
        # while True:
        #     if datetime.now().time()>st.time() and datetime.now().time()<et.time():
        #         _,frame = cap.read()
        #         Fullvideo.write(frame)
        #     else:
        #         Fullvideo.release()
        self.video_file='D:/New folder/videos/siramir 1.mp4'
        self.object = LiveVideoDetails(self.video_file,model,teacherName,st,et,slotId)
        response =self.object.update()
        print(response)
        video_thread = Thread(target=self.check_time, args=(self.video_file,))
        video_thread.start()


        directory = f"{slotId}"  
        parent_dir = "Recordings/RecordingDetails/"
        path = os.path.join(parent_dir, directory)
        os.mkdir(path)

        path_sit = os.path.join(f'{parent_dir}{slotId}/','Sit')
        path_stand = os.path.join(f'{parent_dir}{slotId}/','Stand')
        path_timein = os.path.join(f'{parent_dir}{slotId}/','TimeIn')
        path_timeout = os.path.join(f'{parent_dir}{slotId}/','TimeOut')

        os.mkdir(path_sit)
        os.mkdir(path_stand)
        os.mkdir(path_timein)
        os.mkdir(path_timeout)

        lstTimeIn=[]
        for timein,timeout in zip(response['temptimeInDetails'],response['temptimeOutDetails']):
            lstTimeIn.append([timein,timeout])
        
        currentlstTimeIn=[]
        for timein,timeout in zip(response['timeInDetails'],response['timeOutDetails']):
            currentlstTimeIn.append([timein,timeout])
        
        lstTimeOut=[]
        for i in range(1,len(lstTimeIn)):
            lstTimeOut.append([lstTimeIn[i-1][1], lstTimeIn[i][0]])

        currentlstTimeOut=[]
        for i in range(1,len(currentlstTimeIn)):
            currentlstTimeOut.append([currentlstTimeIn[i-1][1], currentlstTimeIn[i][0]])
    
        videoDuration = self.object.getFullVideoDuration(video_path=self.video_file)
        if lstTimeIn[-1][1] < videoDuration:
            lstTimeOut.append([lstTimeIn[-1][1], videoDuration])
            currentlstTimeOut.append([currentlstTimeIn[-1][1],currentlstTimeIn[-1][1]+timedelta(seconds=lstTimeIn[-1][1]-videoDuration)])

        sit_thread = Thread(target=self.extract_frames,args=(self.video_file, response['tempactivitySitDetails'],f'{parent_dir}{slotId}/Sit/',response['activitySitDetails']))    
        stand_thread= Thread(target=self.extract_frames,args=(self.video_file, response['tempactivityStandDetails'],f'{parent_dir}{slotId}/Stand/',response['activityStandDetails']))
        timein_thread=Thread(target=self.extract_frames,args=(self.video_file, lstTimeIn,f'{parent_dir}{slotId}/TimeIn/',currentlstTimeIn))
        timeout_thread=Thread(target=self.extract_frames,args=(self.video_file, lstTimeOut,f'{parent_dir}{slotId}/TimeOut/',currentlstTimeOut))

        sit_thread.start()
        stand_thread.start()
        timein_thread.start()
        timeout_thread.start()
                #break
        checktime_object =  apichecktime.CheckTimeApi(checktime=mchecktime)
        ctime = mchecktime.CheckTime(id=0,teacherSlotID=slotId,totaltimein=response['totalTimeIn'],totaltimeout=response['totalTimeOut'],
                                    date=str(datetime.now().date()),sit=response['sitTime'],stand=response['standTime'])
        checktime_object.add_checktime(checktime=ctime)

        checktime =checktime_object.checksingletime_details(teacherSlotID=slotId)
        checktimedata = checktime
        teacherslot_object = apiteacherslots.TeacherSlots(teacherslots=mteacherslots)
        
        teacherSlot = mteacherslots.TeacherSlot
        teacherSlot.id=slotId
        teacherSlot.timetableId=0
        teacherSlot.status=response['status']
        teacherSlot.slot = 0
    
        teacherslot_object.update_teacherslots_details(teacherslots=teacherSlot)

        for (timein,timeout) in zip(response['timeInDetails'],response['timeOutDetails']):                
            checktimedetails_object =  apichecktimedetails.CheckTimeDetailsApi(checktimedetails=mchecktimedetails)
            ctimedetails = mchecktimedetails.CheckTimeDetails(id=0,checkTimeID=checktimedata.id,timein=timein,timeout=timeout)
            datetime.now()
            checktimedetails_object.add_checktimedetails(checktimedetails=ctimedetails) 
            
        
        for data in response['activitySitDetails']:
            activity_object =  apiactivitydetails.ActivityDetailsApi()
            activity = mactivitydetails.ActivityDetails(id=0,checkTimeID=checktimedata.id,timein=data[0],timeout=data[1],status=data[2])
            datetime.now()
            activity_object.add_activity_details(activitydetails=activity) 

        for data in response['activityStandDetails']:
            activity_object =  apiactivitydetails.ActivityDetailsApi()
            activity = mactivitydetails.ActivityDetails(id=0,checkTimeID=checktimedata.id,timein=data[0],timeout=data[1],status=data[2])
            datetime.now()
            activity_object.add_activity_details(activitydetails=activity)
        #break
    def extract_frames(self,video_path, time_intervals, output_path,current_time_interval):
        video = cv2.VideoCapture(video_path)
        fourcc = cv2.VideoWriter_fourcc(*"h264") 
        fps = video.get(cv2.CAP_PROP_FPS) 
        print(video_path)

        for interval,current_interval in zip(time_intervals,current_time_interval):
            start_time, end_time = interval
            print(start_time,end_time)
            # Convert time to frame index
            start_frame = int(start_time * fps)
            end_frame = int(end_time * fps)

            video.set(cv2.CAP_PROP_POS_FRAMES, start_frame)
            isThumbnail=True
            thumbnail=None
            temp_start_time = str(current_interval[0]).split(" ")[1].split(".")[0]
            temp_end_time = str(current_interval[1]).split(" ")[1].split(".")[0]
            print(f'output_path={output_path}{temp_start_time.split(":")[0]} {temp_start_time.split(":")[1]} {temp_start_time.split(":")[2]},{temp_end_time.split(":")[0]} {temp_end_time.split(":")[1]} {temp_end_time.split(":")[2]}.mp4')
            video_writer = cv2.VideoWriter(f'{output_path}{temp_start_time.split(":")[0]} {temp_start_time.split(":")[1]} {temp_start_time.split(":")[2]},{temp_end_time.split(":")[0]} {temp_end_time.split(":")[1]} {temp_end_time.split(":")[2]}.mp4', fourcc, fps, (self.frame_width, self.frame_height))
            while start_frame <= end_frame:
                ret, frame = video.read()
                if isThumbnail:
                    isThumbnail=False
                    thumbnail=frame
                if not ret:
                    break

                # Process the frame (e.g., perform operations, write to video)
                frame = cv2.resize(frame, (self.frame_width,self.frame_height))
                video_writer.write(frame)

                start_frame += 1
            cv2.imwrite(f'{output_path}{temp_start_time.split(":")[0]} {temp_start_time.split(":")[1]} {temp_start_time.split(":")[2]},{temp_end_time.split(":")[0]} {temp_end_time.split(":")[1]} {temp_end_time.split(":")[2]}.jpg',thumbnail)
            video_writer.release()

        video.release()


    def start_recording(self,video_path):
        fname = f'Recordings/file,{self.slotId},start_recording.mp4'
        video = cv2.VideoCapture(video_path)
        fps = video.get(cv2.CAP_PROP_FPS)
        start_time=0
        end_time=60
        start_frame = int(start_time * fps)
        end_frame = int(end_time * fps)
        isThumbnail=True
        start_video = cv2.VideoWriter(fname, self.codec, fps, (self.frame_width, self.frame_height))
        
        while start_frame <= end_frame:
            ret, frame = video.read()
            if isThumbnail:
                isThumbnail=False
                thumbnail=frame
            if not ret:
                break
            frame = cv2.resize(frame, (self.frame_width, self.frame_height))
            start_video.write(frame)
            start_frame+=1
            
        cv2.imwrite(f'Recordings/Thumbnails/file,{self.slotId},start_recording.jpg',thumbnail)
        start_video.release()
        video.release()
        
        recording = mrecordings.Recordings(id=0,teacherSlotID=self.slotId,filename=fname,date=str(datetime.now().date()))
        rec_obj= apirecordings.RecordingsApi(recordings=mrecordings)
        rec_obj.add_recordings(recordings=recording)
          

    def mid_recording(self,video_path):
        fname = f'Recordings/file,{self.slotId},mid_recording.mp4'
        video = cv2.VideoCapture(video_path)
        fps = video.get(cv2.CAP_PROP_FPS)
        start_time=60
        end_time=90
        start_frame = int(start_time * fps)
        end_frame = int(end_time * fps)
        isThumbnail=True

        start_video = cv2.VideoWriter(fname, self.codec, fps, (self.frame_width, self.frame_height))
        
        while start_frame <= end_frame:
            ret, frame = video.read()
            if isThumbnail:
                isThumbnail=False
                thumbnail=frame
            if not ret:
                break
            frame = cv2.resize(frame, (self.frame_width, self.frame_height))
            start_video.write(frame)
            start_frame+=1
            
        cv2.imwrite(f'Recordings/Thumbnails/file,{self.slotId},mid_recording.jpg',thumbnail)
        start_video.release()
        video.release()
        
        recording = mrecordings.Recordings(id=0,teacherSlotID=self.slotId,filename=fname,date=str(datetime.now().date()))
        rec_obj= apirecordings.RecordingsApi(recordings=mrecordings)
        rec_obj.add_recordings(recordings=recording)


    def end_recording(self,video_path):
        fname = f'Recordings/file,{self.slotId},end_recording.mp4'
        video = cv2.VideoCapture(video_path)
        fps = video.get(cv2.CAP_PROP_FPS)
        videoDuration = self.object.getFullVideoDuration(self.video_file)
        start_time=videoDuration-60
        end_time=videoDuration
        start_frame = int(start_time * fps)
        end_frame = int(end_time * fps)
        isThumbnail=True

        start_video = cv2.VideoWriter(fname, self.codec, fps, (self.frame_width, self.frame_height))
        
        while start_frame <= end_frame:
            ret, frame = video.read()
            if isThumbnail:
                isThumbnail=False
                thumbnail=frame
            if not ret:
                break
            frame = cv2.resize(frame, (self.frame_width, self.frame_height))
            start_video.write(frame)
            start_frame+=1
            
        cv2.imwrite(f'Recordings/Thumbnails/file,{self.slotId},end_recording.jpg',thumbnail)
        start_video.release()
        video.release()
        
        recording = mrecordings.Recordings(id=0,teacherSlotID=self.slotId,filename=fname,date=str(datetime.now().date()))
        rec_obj= apirecordings.RecordingsApi(recordings=mrecordings)
        rec_obj.add_recordings(recordings=recording)

    def complete_recording(self,video_path):
        fname = f'Recordings/file,{self.slotId},full_recording.mp4'
        video = cv2.VideoCapture(video_path)
        fps = video.get(cv2.CAP_PROP_FPS)
        videoDuration = self.object.getFullVideoDuration(self.video_file)
        start_time=0
        end_time=videoDuration
        start_frame = int(start_time * fps)
        end_frame = int(end_time * fps)
        isThumbnail=True

        start_video = cv2.VideoWriter(fname, self.codec, fps, (self.frame_width, self.frame_height))
        
        while start_frame <= end_frame:
            ret, frame = video.read()
            if isThumbnail:
                isThumbnail=False
                thumbnail=frame
            if not ret:
                break
            frame = cv2.resize(frame, (self.frame_width, self.frame_height))
            start_video.write(frame)
            start_frame+=1
            
        cv2.imwrite(f'Recordings/Thumbnails/file,{self.slotId},full_recording.jpg',thumbnail)
        start_video.release()
        video.release()
        
        recording = mrecordings.Recordings(id=0,teacherSlotID=self.slotId,filename=fname,date=str(datetime.now().date()))
        rec_obj= apirecordings.RecordingsApi(recordings=mrecordings)
        rec_obj.add_recordings(recordings=recording)

    def check_time(self,video_path):
        if self.s == 1:
            sth = Thread(target=self.start_recording, args=(video_path,))
            sth.start()
        if self.m == 1:
            mth = Thread(target=self.mid_recording, args=(video_path,))
            mth.start()
        if self.e == 1:
            eth = Thread(target=self.end_recording, args=(video_path,))
            eth.start()
        if self.f== 1:
            cth = Thread(target=self.complete_recording, args=(video_path,))
            cth.start()
            
  
        

              
  