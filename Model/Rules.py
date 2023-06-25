
from pydantic import BaseModel

class Rules(BaseModel):
    id:int
    timeTableId:int
    startRecord : int
    midRecord:int
    endRecord:int
    fullRecord :int