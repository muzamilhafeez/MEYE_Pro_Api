
from pydantic import BaseModel
from Model.TimeTable import Day,StartTime,EndTime

class Swapping(BaseModel):
    id:int
    timeTableIdFrom:int
    timeTableIdTo:int
    date:str
    day:Day
    startTime:StartTime
    endTime:EndTime
    status:bool=False
