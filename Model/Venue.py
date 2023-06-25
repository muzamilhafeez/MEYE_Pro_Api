from pydantic import BaseModel

class Venue(BaseModel):
    id:int
    name:str
