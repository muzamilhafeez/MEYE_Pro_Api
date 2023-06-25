import Model.TimeTable as mtimetable
from sql import MySQL
import Model.TimeTable as mtimetable
from pydantic import BaseModel

class PrescheduleApi:
    def __init__(self,preschedule) -> None:
        self.preschedule = preschedule
        
    def add_preschedule(self,preschedule):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        if preschedule.starttime.name == preschedule.endtime.name:
            cursor.execute(f'''
                    INSERT INTO PRESCHEDULE
                    VALUES
                    ('{preschedule.timeTableId}','{preschedule.date}',
                    '{preschedule.day.value}','{preschedule.starttime.value}'
                    ,'{preschedule.endtime.value}','{preschedule.venueName}'
                    ,'{preschedule.status}')
                    ''')
            return {"data":"okay"}
        else:
             return {"data":"Time Miss Match"}

