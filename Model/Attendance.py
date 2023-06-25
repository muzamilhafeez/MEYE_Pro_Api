from pydantic import BaseModel
from datetime import datetime
class Attendance(BaseModel):
    id:int
    enrollId :int 
    date : str
    status : bool
    name:str
    day:str
    startTime:str
    endTime:str
    teacherName:str

class NotificationData(BaseModel):
    id:int
    name:str
    startTime:str
    endTime:str
    courseName:str
    day:str
    date:str
    image:str

class Claim(BaseModel):
    id:int
    attendanceId:int
    teacherName:str