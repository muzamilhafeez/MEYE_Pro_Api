from pydantic import BaseModel

class OfferedCourse(BaseModel):
    id:int
    sessionId:int
    courseCode:str
    courseName:str

class OfferedCourseDetails(BaseModel):
    courseName:str
    courseCode:str
    sesssionName:str