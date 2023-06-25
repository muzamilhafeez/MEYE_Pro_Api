from pydantic import BaseModel

class CheckTime(BaseModel):
    id:int
    teacherSlotID:int
    totaltimein:str
    totaltimeout:str
    date:str
    sit:str
    stand:str
    