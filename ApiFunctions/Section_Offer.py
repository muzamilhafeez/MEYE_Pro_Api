

from sql import MySQL
from Model.Section_Offer import SectionOfferDetails

class SectionOfferApi:
    def __init__(self,sectionOffer) -> None:
        self.sectionOffer = sectionOffer
        
    def add_SectionOffer(self,sectionOffer):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(
            f'''
            INSERT INTO SECTION_OFFER VALUES
            ('{sectionOffer.courseOfferId}','{sectionOffer.discipline}')
            '''
        )
    def SectionOffer_Details(self):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(
            f'''
            SELECT so.ID,oc.CourseName,oc.CourseCode,
            so.Discipline FROM SECTION_OFFER so 
            INNER JOIN OFFERED_COURSES oc 
            ON so.CourseOfferId=oc.ID 
            AND oc.SessionId=
            (SELECT TOP 1 SESSION.ID FROM SESSION ORDER BY ID DESC)

            '''
        )
        lstSectionOffer =[]
        for row in cursor.fetchall():
            lstSectionOffer.append(SectionOfferDetails(courseCode=row.CourseCode,
                                                       courseName=row.CourseName,
                                                       discipline=row.Discipline,
                                                       id=row.ID))
        return lstSectionOffer
        