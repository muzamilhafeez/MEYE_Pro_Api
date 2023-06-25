
from typing import List, Optional
from pydantic import BaseModel
from datetime import datetime

class CheckTimeDetails(BaseModel):
    id:int
    checkTimeID:int
    timein:datetime
    timeout:datetime

class TeacherCHRActivityDetails(BaseModel):
    timein:Optional[datetime]
    timeout:Optional[datetime]
    sit:Optional[str]
    stand:Optional[str]
  
    
class TeacherCHRDetails(BaseModel):
    id:int
    courseName:str
    day:str
    discipline:str
    startTime:str
    endTime:str
    totalTimeIn:str
    totalTimeOut:str
    status:str
    date:str
    teacherName:str
    image:str
    sit:str
    stand:str
    venue:str
    teacherSlotId:int
    teacherCHRActivityDetails:List[TeacherCHRActivityDetails]