from pydantic import BaseModel


class DVR(BaseModel):
    id:int
    ip:str
    name:str
    channel:str
    host:str
    password:str
    