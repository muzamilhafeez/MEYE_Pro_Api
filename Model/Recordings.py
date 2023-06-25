
import datetime
from pydantic import BaseModel

class RecordingsDetail(BaseModel):
    courseCode:str
    courseName:str
    teacherName:str
    discipline:str
    venue:str
    day:str
    startTime:str
    endTime:str
    date:str
    status:str
    slot:int
    fileName:str
    thumbnail:str
class Recordings(BaseModel):
    id:int
    teacherSlotID:int
    filename:str
    date:str
    
