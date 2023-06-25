from pydantic import BaseModel

from Model.TimeTable import Day,StartTime,EndTime

class Reschedule(BaseModel):
    id:int
    teacherSlotId:int
    date:str
    day:Day
    starttime : StartTime
    endtime : EndTime
    venueName:str
    status:bool=False
    