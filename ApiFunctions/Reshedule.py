import Model.TimeTable as mtimetable
from sql import MySQL
import Model.TimeTable as mtimetable
from pydantic import BaseModel

class RescheduleApi:
    def __init__(self,reschedule) -> None:
        self.reschedule = reschedule
        
    def getTimetable(self):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                SELECT * FROM TIMETABLE
                    ''')
        lsttimetable = []
        for row in cursor.fetchall():
            st = row.START_TIME.split(':')
            et = row.END_TIME.split(':')
            st = f'{st[0]}:{st[1]}'
            et = f'{et[0]}:{et[1]}'
            lsttimetable.append(mtimetable.TimeTable(id=row.ID,sectionID=row.SectionID
                                                ,starttime=st,
                                                endtime=et,
                                                day=row.DAY,courseCode=row.CourseID,
                                                venueID=row.VenueID))
       
        # self.conn.commit()
        return {"data":lsttimetable,
                }
        
    def reschedule_details(self):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                SELECT * FROM RESCHEDULE
                    ''')
        lst=[]
        for row in cursor.fetchall():
            lst.append(self.reschedule.Reschedule(id=row.ID,teachID=row.TeachID,
                                                  venueID=row.VenueID,status=row.STATUS,
                                                  date=row.DATE))
        
        return {"data":lst}
    def update_reschedule_details(self,reschedule):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   UPDATE RESCHEDULE SET 
                   TeachID='{reschedule.teachID}',VenueID='{reschedule.venueID}',
                   STATUS ='{reschedule.status}',
                   DATE='{reschedule.date}'
                   WHERE  ID='{reschedule.id}'
                   ''')
    
        return {
                "data":reschedule
                }
    def delete_reschedule_details(self,reschedule):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   DELETE FROM RESCHEDULE WHERE ID = '{reschedule.id}'
                    ''')
    
        return {"data":"okay"}
    
    def add_reschedule(self,reschedule):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        if reschedule.starttime.name == reschedule.endtime.name:
            cursor.execute(f'''
                    INSERT INTO RESCHEDULE
                    VALUES
                    ('{reschedule.teacherSlotId}','{reschedule.date}',
                    '{reschedule.day.value}','{reschedule.starttime.value}'
                    ,'{reschedule.endtime.value}','{reschedule.venueName}'
                    ,'{reschedule.status}')
                    ''')
            return {"data":"okay"}
        else:
             return {"data":"Time Miss Match"}


    def checkTeacherRescheduleClass(self,teacherName):
        
       class Data(BaseModel):
           id:int
           discipline:str
           
       sql = MySQL()
       sql.__enter__()
       cursor = sql.conn.cursor()
       cursor.execute(f'''
                    SELECT ts.ID,r.Status,t.Discipline  FROM  TEACHERSLOTS ts left Join RESCHEDULE r
                    on r.TeacherSlotId=ts.ID Inner Join TIMETABLE t 
                    on t.ID=ts.TimeTableId Where t.TeacherName='{teacherName}' 
                    And ts.Status='Not Held'
                    ''')
       lst=[]
       for row in cursor.fetchall():
           if row.Status!=0:
               count=0
               for i in lst:
                   if row.Discipline==i.discipline:
                       count+=1
               if count==0:
                    lst.append(Data(id=row.ID,discipline=row.Discipline))
               
       if lst==[]:
            return "No Class Missed"
       return lst