

import cv2
import ApiFunctions.Attendance as apiAttendance
import Model.Attendance as mattendace
import threading


class VideoAttendance():

    def markAttendance(self,videoFile,startTime,midTime,endTime):
        cap = cv2.VideoCapture(videoFile)
        markAttendanceStart=True
        markAttendanceMid=True
        markAttendanceEnd=True
        recordingType=3
        lstAttendance=[None] * recordingType
        threads = [None] * recordingType
        while True:
            status,img = cap.read()

            if status:
                current_time = cap.get(cv2.CAP_PROP_POS_MSEC) / 1000

                if current_time>startTime and markAttendanceStart:
                    markAttendanceStart=False
                    attendance_object = apiAttendance.AttendanceApi(attendance=mattendace)

                    cv2.imwrite('thread1.jpg',img=img)
                    threads[0]=threading.Thread(target=attendance_object.mark_attendance_by_video,args=(img,lstAttendance,0))
                    threads[0].start()
                    

                if current_time>midTime and markAttendanceMid:
                    markAttendanceMid=False
                    attendance_object = apiAttendance.AttendanceApi(attendance=mattendace)

                    cv2.imwrite('thread2.jpg',img=img)
                    threads[1]=threading.Thread(target=attendance_object.mark_attendance_by_video,args=(img,lstAttendance,1))
                    threads[1].start()

                if current_time>endTime and markAttendanceEnd:
                    markAttendanceEnd=False
                    attendance_object = apiAttendance.AttendanceApi(attendance=mattendace)

                    cv2.imwrite('thread3.jpg',img=img)
                    threads[2]=threading.Thread(target=attendance_object.mark_attendance_by_video,args=(img,lstAttendance,2))
                    threads[2].start()
                for i in range(recordingType):
                    if threads[i]!=None:
                        threads[i].join()
            else:
                new_list = []

                for i in range(len(lstAttendance[0])):
                    status_count = 0
                    for j in range(len(lstAttendance)):
                        if lstAttendance[j][i].status:
                            status_count += 1
                    if status_count >= 2:
                        lstAttendance[j][i].status=True
                        new_list.append(lstAttendance[j][i])
                    else:
                        lstAttendance[j][i].status=False
                        new_list.append(lstAttendance[j][i])

                attendance_object.add_attendance(new_list)

                return new_list




