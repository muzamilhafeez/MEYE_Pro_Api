

from datetime import datetime
from pydantic import BaseModel


class ActivityDetails(BaseModel):
    id:int
    checkTimeID:int
    timein:datetime
    timeout:datetime
    status:str
