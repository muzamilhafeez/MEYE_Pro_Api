from pydantic import BaseModel

class Section(BaseModel):
    id:int
    name:str
