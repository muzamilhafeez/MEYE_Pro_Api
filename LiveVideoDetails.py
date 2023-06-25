from datetime import  timedelta
import os
import threading
import cv2
import face_recognition
import numpy as np
from collections import Counter
import Model.User as muser
import ApiFunctions.User as apiuser

class LiveVideoDetails(object):
    def __init__(self,ip,model,teacherName,st,et,slotId):
        self.model = model
        self.capture = cv2.VideoCapture(ip)
        self.teacherName=teacherName
        self._key_lock = threading.Lock() 
        self.teachertimeinframes=0
        self.teachertimeoutframes=0
        self.totalteachertimeframes=0
        self.image_encodings=None
        self.teacherin = False
        self.tempFrameCount=0
        self.tempFrame=None
        self.readImageCount=0
        self.status=False
        self.ip=ip
        self.activityLabel=[]
        self.isEntry=True
        self.st=st
        self.et=et
        self.slotId=slotId
        
    def update(self):
        self.lsttimein=[]
        lsttimeout=[]
        self.lstActivityLabel=[]
        self.lstActivityTime=[]
        self.templstActivityLabel=[]
        self.templstActivityTime=[]
        user_object =  apiuser.UserApi(user=muser)
        user=  user_object.single_user_details(teacherName=self.teacherName,role='Teacher')
        userdata = user['data']
        image =  face_recognition.load_image_file(f'UserImages/Teacher/{userdata.image}')
        self.image_encodings = face_recognition.face_encodings(image)[0]
        self.temporaryTime=None
        while True:
            if self.capture.isOpened():
                (self.status, self.frame) = self.capture.read()  
                if self.status:
                    if self.tempFrameCount>10:
                            if self.isEntry:
                                current_time = self.capture.get(cv2.CAP_PROP_POS_MSEC) / 1000
                                print(f'Current Time={current_time}')
                                self.temporaryTime=current_time
                                self.isEntry=False
                            self.tempFrameCount=0
                            self.thread2 = threading.Thread(target=self.check_time_using_facial_recognition, args=())
                            self.thread2.daemon = True
                            self.thread2.start()
                        #self.check_time_using_facial_recognition(tempFrame=tempFrame)
                    else:
                        self.tempFrameCount+=1
                    if self.totalteachertimeframes>=5:
                        if self.teachertimeinframes>0:
                            if self.teacherin==False:
                                self.teacherin=True
                                self.lsttimein.append(self.temporaryTime)
                                self.isEntry=True
                                print(f'lst of timein={self.lsttimein}')
                            else:
                                self.isEntry=True

                        elif self.teachertimeinframes==0 and self.teacherin==True:
                            lsttimeout.append(self.temporaryTime)
                            if len(self.activityLabel)>0:
                                counted = Counter(self.activityLabel)
                                most_common = counted.most_common(1)
                                print(f'Common Label={most_common}')
                                print(f'at Time{current_time}')
                                if len(self.templstActivityLabel)==0:
                                    self.templstActivityLabel.append(most_common[0][0])
                                    self.templstActivityTime.append(self.temporaryTime)
                                self.templstActivityLabel.append(most_common[0][0])
                                self.templstActivityTime.append(current_time)
                                self.activityLabel=[]
                            self.lstActivityTime.append(self.templstActivityTime)
                            self.lstActivityLabel.append(self.templstActivityLabel)
                            self.templstActivityLabel=[]
                            self.templstActivityTime=[]
                            self.teacherin= False
                            self.isEntry=True
                        
                        else:
                            self.isEntry=True
                        self.totalteachertimeframes=0
                        self.teachertimeinframes=0
                        self.teachertimeoutframes=0



                if self.status==False:
                    if self.totalteachertimeframes>10:
                        if self.teachertimeinframes>0:
                            if self.teacherin==False:
                                self.teacherin=True
                                self.lsttimein.append(self.temporaryTime)
                                self.isEntry=True
                                print(f'lst of timein={self.lsttimein}')

                        elif self.teachertimeinframes==0 and self.teacherin==True:
                            lsttimeout.append(self.temporaryTime)
                            self.teacherin= False
                            self.isEntry=True
                        self.totalteachertimeframes=0
                        self.teachertimeinframes=0
                        self.teachertimeoutframes=0
                    
                    print(self.lsttimein)
                    if self.teacherin==True :
                        current_time = self.getFullVideoDuration(self.ip)
                        print(f'Video End Time={current_time}')
                        lsttimeout.append(current_time)
                        if len(self.activityLabel)>0:
                            counted = Counter(self.activityLabel)
                            most_common = counted.most_common(1)
                            print(f'Common Label={most_common}')
                            print(f'at Time{current_time}')
                            if len(self.templstActivityLabel)==0:
                                self.templstActivityLabel.append(most_common[0][0])
                                self.templstActivityTime.append(self.temporaryTime)
                            self.templstActivityLabel.append(most_common[0][0])
                            self.templstActivityTime.append(current_time)
                            self.activityLabel=[]
                        self.lstActivityTime.append(self.templstActivityTime)
                        self.lstActivityLabel.append(self.templstActivityLabel)
                       
                        self.teacherin= False
                    self.activityLabel=[]
                    self.totalteachertimeframes=0
                    self.teachertimeinframes=0
                    self.teachertimeoutframes=0
                    totaltimein =''
                    totaltimeout =''
                    overalltimemin=0
                    totalsec=0
                    if self.lsttimein!=[]:  
                        if len(self.lsttimein)!=len(lsttimeout):
                            current_time = self.getFullVideoDuration(self.ip)
                            print(f'Video End Time..={current_time}')
                            lsttimeout.append(current_time)
                            if len(self.activityLabel)>0:
                                counted = Counter(self.activityLabel)
                                most_common = counted.most_common(1)
                                print(f'Common Label={most_common}')
                                print(f'at Time{current_time}')
                                if len(self.templstActivityLabel)==0:
                                    self.templstActivityLabel.append(most_common[0][0])
                                    self.templstActivityTime.append(self.temporaryTime)
                                self.templstActivityLabel.append(most_common[0][0])
                                self.templstActivityTime.append(current_time)
                                self.activityLabel=[]
                            self.lstActivityTime.append(self.templstActivityTime)
                            self.lstActivityLabel.append(self.templstActivityLabel)
                            
                    else:
                        lsttimeout=[]
                        self.lsttimein=[]
                    overalltime = self.getFullVideoDuration(self.ip)
                    print(f'OverAll Time={overalltime}')
                    # if (float(overalltime/60)-int(overalltime/60)) > 0.5:
                    #     overalltimemin = int(overalltime/60) + 1
                    # else:
                    #     overalltimemin = int(overalltime/60)
                    #print(f'OverAll Time in minutes={overalltimemin}')
                    for (timein,timeout) in zip(self.lsttimein,lsttimeout):
                        time = timeout-timein
                        print(f'time in loop..{timein}')
                        print(f'time out loop..{timeout}')
                        print(f'time loop..{time}')
                        totalsec += time
                        print(f'total sec loop..{totalsec}')
                    #totalsec+=20
                    # if (float(totalsec/60)-int(totalsec/60)) > 0.5:
                    #     totaltimein = int(totalsec/60) + 1
                    # else:
                    #     totaltimein = int(totalsec/60)
                    totaltimeinMin=totalsec/60
                    totaltimeinSec=totalsec%60
                    totaltimein=f'{int(totaltimeinMin)} Min {int(totaltimeinSec)} Sec'
                    print(f'total time in={totaltimein}')
                    totaltimeout_sec = overalltime-totalsec
                    totaltimeOutMin=totaltimeout_sec/60
                    totaltimeOutSec=totaltimeout_sec%60
                    totaltimeout=f'{int(totaltimeOutMin)} Min {int(totaltimeOutSec)} Sec'
                    print(f'total time out={totaltimeout}')
                    current_time = self.getFullVideoDuration(self.ip)
                    if len(self.templstActivityTime)>0 and len(self.templstActivityLabel)>0:
                        self.lstActivityLabel.pop()
                        self.lstActivityTime.pop()
                        self.templstActivityTime.append(lsttimeout[-1])
                        if len(self.activityLabel)>0:
                            self.templstActivityLabel.append(self.activityLabel[-1])
                        else:
                            self.templstActivityLabel.append(self.templstActivityLabel[-1])
                        self.lstActivityTime.append(self.templstActivityTime)
                        self.lstActivityLabel.append(self.templstActivityLabel)
                    sit=0
                    stand=0
                    print(self.lstActivityTime)
                    print(self.lstActivityLabel)
                    
                    for i in range(len(self.lstActivityTime)):
                        # threshhold=0
                        # for time in range(len(lsttimeout)):
                        #     if lsttimeout[time]<self.lstActivityTime[time]:
                        #         threshhold=self.lsttimein[time+1]-lsttimeout[time]
                        for j in range(1,len(self.lstActivityTime[i])):
                            if self.lstActivityLabel[i][j].replace(" ", "") == 'Sit':
                                sit+= self.lstActivityTime[i][j] - self.lstActivityTime[i][j-1]
                            else:
                                stand+=self.lstActivityTime[i][j] - self.lstActivityTime[i][j-1]
                            print(f'Sit={sit} and Stand={stand}')

                    activitySitTimeInterval = []  
                    activityStandTimeInterval = []

                    tempactivitySitTimeInterval = [] 
                    tempactivityStandTimeInterval = []
                    for i in range(len(self.lstActivityTime)):
                        for j in range(1, len(self.lstActivityTime[i])):
                            start_time = self.lstActivityTime[i][j-1]  # Start time of the interval
                            end_time = self.lstActivityTime[i][j]  # End time of the interval
                            activity_label =  self.lstActivityLabel[i][j].strip()  # Remove leading/trailing spaces from the label

                            if activity_label == 'Sit':
                                if len(activitySitTimeInterval)>0:
                                    if activitySitTimeInterval[-1][1]==self.st+timedelta(seconds=start_time):
                                        activitySitTimeInterval[-1][1]=self.st+timedelta(seconds=end_time)
                                        tempactivitySitTimeInterval[-1][1]=end_time
                                    else:
                                        activitySitTimeInterval.append([self.st+timedelta(seconds=start_time), self.st+timedelta(seconds=end_time),'Sit'])
                                        tempactivitySitTimeInterval.append([start_time,end_time])
                                else:
                                    activitySitTimeInterval.append([self.st+timedelta(seconds=start_time), self.st+timedelta(seconds=end_time),'Sit'])
                                    tempactivitySitTimeInterval.append([start_time,end_time])
                            else:
                                if len(activityStandTimeInterval)>0:
                                    if activityStandTimeInterval[-1][1]==self.st+timedelta(seconds=start_time):
                                        activityStandTimeInterval[-1][1]=self.st+timedelta(seconds=end_time)
                                        tempactivityStandTimeInterval[-1][1]=end_time
                                    else:
                                        activityStandTimeInterval.append([self.st+timedelta(seconds=start_time), self.st+timedelta(seconds=end_time),'Stand'])
                                        tempactivityStandTimeInterval.append([start_time,end_time])
                                else:
                                    activityStandTimeInterval.append([self.st+timedelta(seconds=start_time), self.st+timedelta(seconds=end_time),'Stand'])
                                    tempactivityStandTimeInterval.append([start_time,end_time])
                        
                    status=''  
                    if totaltimeinMin==0:
                        status="Not Held"
                    else:
                        if totaltimeOutMin>=1:
                            status="Late"
                        else:
                            status="Held"
                    lstFinalTimeIn=[]
                    lstFinalTimeOut=[]
                    for (timein,timeout) in zip(self.lsttimein,lsttimeout):                
                        print(timein,timeout)
                        tempTime=self.st+timedelta(seconds=timein)
                        lstFinalTimeIn.append(tempTime)
                        tempTime=self.st+timedelta(seconds=timeout)
                        lstFinalTimeOut.append(tempTime)
                    # sitMin=0
                    # standMin=0
                    # if (float(sit/60)-int(sit/60)) > 0.5:
                    #         sitMin = int(sit/60) + 1
                    # else:
                    #     sitMin = int(sit/60)
                    
                    # if (float(stand/60)-int(stand/60)) > 0.5:
                    #         standMin = int(stand/60) + 1
                    # else:
                    #     standMin = int(stand/60)

                    sitTimeMin = sit/60
                    sitTimeSec = sit%60
                    sitTime = f'{int(sitTimeMin)} Min {int(sitTimeSec)} Sec'

                    standTimeMin = stand/60
                    standTimeSec = stand%60
                    standTime = f'{int(standTimeMin)} Min {int(standTimeSec)} Sec'
                    
                    return {
                        'totalTimeIn':totaltimein,
                        'totalTimeOut':totaltimeout,
                        'sit':sit,
                        'stand':stand,
                        'sitTime':sitTime,
                        'standTime':standTime,
                        "status":status,
                        "timeInDetails":lstFinalTimeIn,
                        "timeOutDetails":lstFinalTimeOut,
                        "temptimeInDetails":self.lsttimein,
                        "temptimeOutDetails":lsttimeout,
                        "activitySitDetails":activitySitTimeInterval,
                        "activityStandDetails":activityStandTimeInterval,
                        "tempactivitySitDetails":tempactivitySitTimeInterval,
                        "tempactivityStandDetails":tempactivityStandTimeInterval,
                    }
            

        
  
    def check_time_using_facial_recognition(self):
        if self._key_lock.locked():
            pass
        else:
            self._key_lock.acquire()
            label=''
            temp_image_path = f'temp.JPG'
            cv2.imwrite(temp_image_path,self.frame)
            image = cv2.imread(temp_image_path)
            try:
                test_image = cv2.imread(temp_image_path)
                test_image = cv2.resize(test_image, (0, 0), fx=0.5, fy=0.5)
            except:
                test_image =  face_recognition.load_image_file(temp_image_path)
            #test_image =  face_recognition.load_image_file(temp_image_path)
            face_encodings = face_recognition.face_encodings(test_image)
            count=-1
            print(f'Face found={len(face_encodings)}')
            for face_encoding in face_encodings:
                #print(np.linalg.norm(np.expand_dims(self.image_encodings,axis=0) - face_encoding, axis=1))
                matches = face_recognition.compare_faces(np.expand_dims(self.image_encodings,axis=0),face_encoding)
                if True in matches:
                    print('Face Matched')
                    label = self.checkActivity(image)
                    print(f'label={label}')
                    cv2.imwrite('zz.jpg',image)
                    #label='Sit'
                    if label!=None and label!='':
                        self.activityLabel.append(label)
                    if len(self.activityLabel)>2:
                        counted = Counter(self.activityLabel)
                        most_common = counted.most_common(1)
                        print(f'Common Label={most_common}')
                        current_time = self.capture.get(cv2.CAP_PROP_POS_MSEC) / 1000
                        while current_time==0.0:
                            print(f'at Time{current_time}')
                            current_time = self.capture.get(cv2.CAP_PROP_POS_MSEC) / 1000
                        print(f'at Time{current_time}')
                        # print(self.templstActivityLabel)
                        # print(self.lsttimein)
                        if len(self.templstActivityLabel)==0:
                            self.templstActivityLabel.append(most_common[0][0])
                            if len(self.lsttimein)>0 and len(self.lstActivityTime)==0:
                                self.templstActivityTime.append(self.lsttimein[0])
                            else:
                                self.templstActivityTime.append(self.temporaryTime)
                        self.templstActivityLabel.append(most_common[0][0])
                        self.templstActivityTime.append(current_time)
                        self.activityLabel=[]
                    self.teachertimeinframes+=1
                else:
                    self.teachertimeoutframes+=1
                count=0
            if count==-1:
                self.teachertimeoutframes+=1
                
            self.totalteachertimeframes+=1
            print(f'''
                Total Frames={self.totalteachertimeframes}
                Time In Frames={self.teachertimeinframes}
                Time Out Frames={self.teachertimeoutframes}
                ''')
            self._key_lock.release()
       
        
        
    def checkActivity(self,image):
        results = self.model.predict(image,stream=True, imgsz=640)
        label = self.get_label(results)
        return label
        
        
    def get_label(self,results):
        class_names=['Sit','Stand']
        for r in results:
            label=''
            try:
                for c in r[0].boxes.cls:
                    label = f'{class_names[int(c)]} '
                    return label
            except:
                for c in r.boxes.cls:
                    label = f'{class_names[int(c)]} '
                    return label
    
    def getFullVideoDuration(self,video_path):
        cap = cv2.VideoCapture(video_path)

        if not cap.isOpened():
            print("Failed to open the video file.")
            exit()

        frame_count = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
        fps = cap.get(cv2.CAP_PROP_FPS)
        duration = frame_count / fps

        print("Video duration: {} seconds".format(duration))
        
        cap.release()
        cv2.destroyAllWindows()
        return duration
    
   