
from sql import MySQL
import Model.User as mUser
from datetime import datetime
class SwappingApi:
    def __init__(self,swapping) -> None:
        self.swapping = swapping
        
    def add_swapping(self,swapping):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        if swapping.startTime.name == swapping.endTime.name:
            cursor.execute(f'''
                    INSERT INTO SWAPPING
                    VALUES
                    ('{swapping.timeTableIdFrom}','{swapping.timeTableIdTo}'
                    ,'{swapping.date}','{swapping.day.value}'
                    ,'{swapping.startTime.value}','{swapping.endTime.value}'
                    ,'{swapping.status}')
                    ''')
            return {"data":"okay"}
        else:
             return {"data":"Time Miss Match"}
    
    def getSwappingTeacherData(self,day,startTime,endTime,timeTableId):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                      Select * FROM SWAPPING WHERE TimeTableIdFrom='{timeTableId}' 
                       
                       ''')
        

        for row in cursor.fetchall():
            date_format = "%Y-%m-%d"
            current_date = datetime.now().date()
            given_date = datetime.strptime(row.Date, date_format).date()
            if given_date > current_date:
                return "Class Already Swapped"
            
        cursor.execute(f'''             
                Select DISTINCT t.TeacherName as 'Name',t.ID  as 'TimeTableId', 
                t.Venue,t.Discipline, u.ID,u.Password,u.Image,u.UserID,u.Role
                from TIMETABLE t Left Join MEYE_USER u on 
                u.Name=t.TeacherName Where t.TeacherName not Like '%,%'
                And t.Day='{day}' And t.StartTime='{startTime}:00.0000000'
                And t.EndTime='{endTime}:00.0000000'
                AND  t.SessionId=(SELECT TOP 1 
                SESSION.ID FROM SESSION ORDER BY ID DESC)
                       ''')
        lst=[]
        for row in cursor.fetchall():
            lst.append(mUser.SwappingUser(
               id=row.ID,userID=row.UserID,
               name=row.Name,password=row.Password,
               image=row.Image,role="Teacher",
               timeTableId=row.TimeTableId,venue=row.Venue,
               discipline=row.Discipline
            ))
        
        return lst