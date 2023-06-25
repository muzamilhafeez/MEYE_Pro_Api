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
import ApiFunctions.ActivityDetailsSit as apiactivitydetails
import Model.Recordings as mrecordings
import ApiFunctions.Recordings as apirecordings


class LiveSitFrameReport():

    def update(self, st, et, model, teacherName, slotId,video_path):
        self.slotId = slotId
        # cap = cv2.VideoCapture(ip)
        # fullVideoCodec = cv2.VideoWriter_fourcc(*'mp4v')
        # Fullvideo = cv2.VideoWriter(f'Recordings/FullLectureVideos/{slotId},full_recording.mp4', fullVideoCodec, 30, (1920, 1080))
        # while True:
        #     if datetime.now().time()>st.time() and datetime.now().time()<et.time():
        #         _,frame = cap.read()
        #         Fullvideo.write(frame)
        #     else:
        #         Fullvideo.release()
        self.video_file = 'video_path/siramir 1.mp4'
        self.object = LiveVideoDetails(self.video_file, model, teacherName, st, et, slotId)
        response = self.object.update()
        print(response)
        directory = f"{slotId}"
        parent_dir = "Recordings/RecordingSitFrame/"
        path = os.path.join(parent_dir, directory)
        os.mkdir(path)

        path_sit = os.path.join(f'{parent_dir}{slotId}/', 'Sit')
        path_stand = os.path.join(f'{parent_dir}{slotId}/', 'Stand')

        os.mkdir(path_sit)
        os.mkdir(path_stand)


        lstTimeIn = []
        for timein, timeout in zip(response['temptimeInDetails'], response['temptimeOutDetails']):
            lstTimeIn.append([timein, timeout])

        currentlstTimeIn = []
        for timein, timeout in zip(response['timeInDetails'], response['timeOutDetails']):
            currentlstTimeIn.append([timein, timeout])

        lstTimeOut = []
        for i in range(1, len(lstTimeIn)):
            lstTimeOut.append([lstTimeIn[i - 1][1], lstTimeIn[i][0]])

        currentlstTimeOut = []
        for i in range(1, len(currentlstTimeIn)):
            currentlstTimeOut.append([currentlstTimeIn[i - 1][1], currentlstTimeIn[i][0]])

        videoDuration = self.object.getFullVideoDuration(video_path=self.video_file)
        if lstTimeIn[-1][1] < videoDuration:
            lstTimeOut.append([lstTimeIn[-1][1], videoDuration])
            currentlstTimeOut.append([currentlstTimeIn[-1][1],
                                      currentlstTimeIn[-1][1] + timedelta(seconds=lstTimeIn[-1][1] - videoDuration)])

        sit_thread = Thread(target=self.extract_frames, args=(
        self.video_file, response['tempactivitySitDetails'], f'{parent_dir}{slotId}/Sit/',
        response['activitySitDetails']))
        stand_thread = Thread(target=self.extract_frames, args=(
        self.video_file, response['tempactivityStandDetails'], f'{parent_dir}{slotId}/Stand/',
        response['activityStandDetails']))


        sit_thread.start()
        stand_thread.start()

        # break
        checktime_object = apichecktime.CheckTimeApi(checktime=mchecktime)
        ctime = mchecktime.CheckTime(id=0, teacherSlotID=slotId, totaltimein=response['totalTimeIn'],
                                     totaltimeout=response['totalTimeOut'],
                                     date=str(datetime.now().date()), sit=response['sitTime'],
                                     stand=response['standTime'])
        checktime_object.add_checktime(checktime=ctime)

        checktime = checktime_object.checksingletime_details(teacherSlotID=slotId)
        checktimedata = checktime
        teacherslot_object = apiteacherslots.TeacherSlots(teacherslots=mteacherslots)

        teacherSlot = mteacherslots.TeacherSlot
        teacherSlot.id = slotId
        teacherSlot.timetableId = 0
        teacherSlot.status = response['status']
        teacherSlot.slot = 0

        teacherslot_object.update_teacherslots_details(teacherslots=teacherSlot)


        for data in response['activitySitDetails']:
            activity_object = apiactivitydetails.ActivityDetailsApi()
            activity = mactivitydetails.ActivityDetails(id=0, checkTimeID=checktimedata.id, timein=data[0],
                                                        timeout=data[1], status=data[2])
            datetime.now()
            activity_object.add_activity_details(activitydetails=activity)

        for data in response['activityStandDetails']:
            activity_object = apiactivitydetails.ActivityDetailsApi()
            activity = mactivitydetails.ActivityDetails(id=0, checkTimeID=checktimedata.id, timein=data[0],
                                                        timeout=data[1], status=data[2])
            datetime.now()
            activity_object.add_activity_details(activitydetails=activity)

        # break

    def extract_frames(self, video_path, time_intervals, output_path, current_time_interval):
        video = cv2.VideoCapture(video_path)
        # fourcc = cv2.VideoWriter_fourcc(*"h264")
        fps = video.get(cv2.CAP_PROP_FPS)
        print(video_path)

        for interval, current_interval in zip(time_intervals, current_time_interval):
            start_time, end_time = interval
            print(start_time, end_time)
            mid_time = (start_time+end_time)/2
            # Convert time to frame index
            start_frame = int(start_time * fps)
            end_frame = int(end_time * fps)
            mid_fram=int(mid_time*fps)

            video.set(cv2.CAP_PROP_POS_FRAMES, start_frame)
            isThumbnail = True
            thumbnail = None
            temp_start_time = str(current_interval[0]).split(" ")[1].split(".")[0]
            temp_end_time = str(current_interval[1]).split(" ")[1].split(".")[0]
            print(
                f'output_path={output_path}{temp_start_time.split(":")[0]} {temp_start_time.split(":")[1]} {temp_start_time.split(":")[2]},{temp_end_time.split(":")[0]} {temp_end_time.split(":")[1]} {temp_end_time.split(":")[2]}.mp4')
            # video_writer = cv2.VideoWriter(
            #     f'{output_path}{temp_start_time.split(":")[0]} {temp_start_time.split(":")[1]} {temp_start_time.split(":")[2]},{temp_end_time.split(":")[0]} {temp_end_time.split(":")[1]} {temp_end_time.split(":")[2]}.mp4',
            #     fourcc, fps, (self.frame_width, self.frame_height))
            while start_frame <= end_frame:
                ret, frame = video.read()
                if mid_fram<=start_time:
                    # thumbnail = False
                    thumbnail = frame
                    break
                if not ret:
                    break

                # Process the frame (e.g., perform operations, write to video)
                frame = cv2.resize(frame, (self.frame_width, self.frame_height))
                # video_writer.write(frame)

                start_frame += 1
            cv2.imwrite(
                f'{output_path}{temp_start_time.split(":")[0]} {temp_start_time.split(":")[1]} {temp_start_time.split(":")[2]},{temp_end_time.split(":")[0]} {temp_end_time.split(":")[1]} {temp_end_time.split(":")[2]}.jpg',
                thumbnail)
            # video_writer.release()

        video.release()




