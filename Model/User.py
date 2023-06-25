from enum import Enum
from typing import List, Optional
from pydantic import BaseModel

class Role(Enum):
    ROLE_1 = 'Teacher'
    ROLE_2 = 'Admin'
    ROLE_3 = 'Student'
    ROLE_4 = 'Director'

class User(BaseModel):
    id:Optional[int]=None
    userID:Optional[str]=None
    name:Optional[str]=None
    image:Optional[str] = None
    password:Optional[str]=None
    role:Role

class Student(BaseModel):
    aridNo:str
    name:str
    image:str
    password:str
    
class StudentCourses(BaseModel):
    teacherName:str
    courseName:str
    discipline:str
    image:str
    percentage:float
    
class SwappingUser(BaseModel):
    id:Optional[int]=None
    userID:Optional[str]=None
    name:Optional[str]=None
    image:Optional[str] = None
    password:Optional[str]=None
    role:Role
    timeTableId:int
    venue:str
    discipline:str

