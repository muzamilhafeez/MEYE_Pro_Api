

from sql import MySQL
from Model.Offered_Courses import OfferedCourseDetails

class OfferedCoursesApi:
    def __init__(self,offeredCourses) -> None:
        self.offeredCourses = offeredCourses
        
    def add_offeredCourses(self,offeredCourses):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(
            f'''
            INSERT INTO OFFERED_COURSES VALUES
            ('{offeredCourses.sessionId}','{offeredCourses.courseCode}','{offeredCourses.courseName}')
            '''
        )
    def OfferedCourses_Details(self):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(
            f'''
            SELECT oc.CourseCode,oc.CourseName,s.Name
            FROM OFFERED_COURSES oc 
            INNER JOIN SESSION S ON oc.SessionId=S.ID 
            AND oc.SessionId=
            (SELECT TOP 1 SESSION.ID FROM SESSION ORDER BY ID DESC)
            '''
        )
        lstOfferedCourses =[]
        for row in cursor.fetchall():
            lstOfferedCourses.append(OfferedCourseDetails(courseCode=row.CourseCode,
                                                       courseName=row.CourseName,
                                                       sesssionName=row.Name))
        return {"data":lstOfferedCourses}
        