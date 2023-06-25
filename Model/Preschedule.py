from pydantic import BaseModel

from Model.TimeTable import Day,StartTime,EndTime

class Preschedule(BaseModel):
    id:int
    timeTableId:int
    date:str
    day:Day
    starttime : StartTime
    endtime : EndTime
    venueName:str
    status:bool=False
    