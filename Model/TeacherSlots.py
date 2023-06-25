

from pydantic import BaseModel
    
class TeacherSlot(BaseModel):
    id:int
    timetableId:int
    slot:int
    status:str