    
from sql import MySQL
import Model.User as muser
import Model.TeacherSlots as mteacherslots
import Model.Recordings as mrecordings
import Model.TimeTable as mtimetable 
import Model.Section as msection
import Model.Venue as mvenue
import os

class RecordingsApi:
    def __init__(self,recordings) -> None:
        self.recordings = recordings
        
    def recordings_details(self):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                    SELECT  t.CourseCode,t.CourseName,t.TeacherName,t.Discipline,
                    t.Venue,t.Day,t.StartTime,t.EndTime,r.DATE,ts.Status,ts.Slot,r.FILENAME 
                    FROM TIMETABLE t INNER JOIN TEACHERSLOTS ts 
                    ON t.ID=ts.TimeTableId INNER JOIN RECORDINGS r on r.TeacherSlotId=ts.ID AND t.SessionId
                    =(SELECT TOP 1 SESSION.ID FROM SESSION ORDER BY ID DESC)
                    ''')
        lstRecording=[]
        for row in cursor.fetchall():
            st = row.StartTime.split(':')
            et = row.EndTime.split(':')
            st = f'{st[0]}:{st[1]}'
            et = f'{et[0]}:{et[1]}'
            date = str(row.DATE).split(' ')[0]
            lst = os.listdir('Recordings/Thumbnails/')
            for i in lst:
                if i.split('.')[0]==row.FILENAME.split('/')[1].split('.')[0]:
                    lstRecording.append(self.recordings.RecordingsDetail(courseCode=row.CourseCode,courseName=row.CourseName,
                                                                teacherName=row.TeacherName,discipline=row.Discipline,
                                        venue = row.Venue,day=row.Day,startTime=st,endTime=et,
                                        date=date,status=row.Status,slot=row.Slot,fileName=row.FILENAME,thumbnail=i))
        return lstRecording
        

    
    def recordings_details_byteacherid(self,teacherName):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   SELECT  t.CourseCode,t.CourseName,t.TeacherName,t.Discipline,
                   t.Venue,t.Day,t.StartTime,t.EndTime,r.DATE,ts.Status,ts.Slot,r.FILENAME 
                   FROM TIMETABLE t INNER JOIN TEACHERSLOTS ts 
                   ON t.ID=ts.TimeTableId INNER JOIN RECORDINGS r on r.TeacherSlotId=ts.ID AND t.SessionId
                  =(SELECT TOP 1 SESSION.ID FROM SESSION ORDER BY ID DESC) AND t.TeacherName='{teacherName}'
                   ''')
        lstRecording=[]
        for row in cursor.fetchall():
            st = row.StartTime.split(':')
            et = row.EndTime.split(':')
            st = f'{st[0]}:{st[1]}'
            et = f'{et[0]}:{et[1]}'
            date = str(row.DATE).split(' ')[0]
            lst = os.listdir('Recordings/Thumbnails/')
            for i in lst:
                if i.split('.')[0]==row.FILENAME.split('/')[1].split('.')[0]:
                    lstRecording.append(self.recordings.RecordingsDetail(courseCode=row.CourseCode,courseName=row.CourseName,
                                                                teacherName=row.TeacherName,discipline=row.Discipline,
                                        venue = row.Venue,day=row.Day,startTime=st,endTime=et,
                                        date=date,status=row.Status,slot=row.Slot,fileName=row.FILENAME,thumbnail=i))
        return lstRecording
        
    
    def update_recordings_details(self,recordings):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   UPDATE RECORDINGS SET 
                   TeachID='{recordings.teacherSlotID}',FILENAME='{recordings.filename}',
                   DATE='{recordings.date}'
                   WHERE  ID='{recordings.id}'
                   ''')

        return {
                "data":recordings
                }
        
    def delete_recordings_details(self,recordings):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   DELETE FROM RECORDINGS WHERE ID = '{recordings.id}'
                    ''')
    
        return {"data":"okay"}
    def add_recordings(self,recordings):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                INSERT INTO RECORDINGS
                VALUES
                ('{recordings.teacherSlotID}','{recordings.filename}','{recordings.date}')
                ''')
        return {"data":"okay"}
