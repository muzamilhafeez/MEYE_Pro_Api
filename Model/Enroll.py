from typing import List
from pydantic import BaseModel

class Enroll(BaseModel):
    id:int
    sectionOfferId:List[int]
    studentID:str
    discipline:str