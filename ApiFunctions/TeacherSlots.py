    
from sql import MySQL

class TeacherSlots:
    def __init__(self,teacherslots) -> None:
        self.teacherslots = teacherslots
        
    def teacherslots_details(self,timetableId):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                SELECT * FROM TeacherSlots WHERE TimeTableId='{timetableId}'
                    ''')
        lst=[]
        for row in cursor.fetchall():
            lst.append(self.teacherslots.TeacherSlot(id=row.ID,timetableId=row.TimeTableId,slot=row.Slot,status=row.Status))
            
        return lst
    def update_teacherslots_details(self,teacherslots):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   UPDATE TEACHERSLOTS SET Status = '{teacherslots.status}'
                   WHERE  ID = '{teacherslots.id}' 
                   ''')
    
        return {
               "data":teacherslots
                }
    def delete_teacherslots_details(self,teacherslots):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   DELETE FROM TEACHERSLOTS WHERE TeachID = '{teacherslots.teachID}'
                    ''')
    
        return {"data":"okay"}
    def add_teacherslots(self,teacherslots):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                           INSERT INTO TEACHERSLOTS VALUES ('{teacherslots.timetableId}'
                           ,'{teacherslots.slot}','{teacherslots.status}')
                            ''')
        
