from enum import Enum
from typing import Optional
from pydantic import BaseModel

class Day(Enum):
    DAY_1 = 'Monday'
    DAY_2 = 'Tuesday'
    DAY_3 = 'Wednesday'
    DAY_4 = 'Thursday'
    DAY_5 = 'Friday'

class StartTime(Enum):
    TIME_1 = '08:30'
    TIME_2 = '10:00'
    TIME_3 = '11:30'
    TIME_4 = '01:30'
    TIME_5 = '03:00'
    
class EndTime(Enum):
    TIME_1 = '10:00'
    TIME_2 = '11:30'
    TIME_3 = '01:00'
    TIME_4 = '03:00'
    TIME_5 = '04:30'

class TimeTable(BaseModel):
    id : int
    discipline : str
    starttime : StartTime
    endtime : EndTime
    day:Day
    courseCode:str
    courseName:str
    venue:str  
    teacherName:str 
    sessionId:Optional[str]=None
    sessionName:Optional[str]=None
     
class TimeTableRules(BaseModel):
    id : int
    discipline : str
    starttime : StartTime
    endtime : EndTime
    day:Day
    courseCode:str
    courseName:str
    venue:str  
    teacherName:str 
    isSelected:bool
    sessionId:Optional[str]=None
    sessionName:Optional[str]=None
    
class TempTimeTable(BaseModel):
    id : int
    discipline : str
    starttime : StartTime
    endtime : EndTime
    day:Day
    courseCode:str
    courseName:str
    venue:str  
    teacherName:str 
    sessionId:Optional[str]=None
    startRecord:bool
    endRecord:bool
    fullRecord:bool
    