
from pydantic import BaseModel

class SectionOffer(BaseModel):
    id:int
    courseOfferId:int
    discipline:str

class SectionOfferDetails(BaseModel):
    id:int
    courseName:str
    courseCode:str
    discipline:str