
from sql import MySQL


class EnrollApi:
    def __init__(self,enroll) -> None:
        self.enroll = enroll
        
    def enroll_details(self):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                SELECT * FROM ENROLL
                    ''')
        lst=[]
        for row in cursor.fetchall():
            lst.append(self.enroll.Enroll(courseCode=row.CourseID,studentID=row.StudentID,id=row.ID))

    
        return {"data":lst
               }
    def update_enroll_details(self,enroll):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   UPDATE ENROLL SET 
                   CourseID='{enroll.courseCode}' ,  StudentID='{enroll.studentID}'
                   WHERE  ID='{enroll.id}'
                   ''')
        return {"data":enroll}
    def delete_enroll_details(self,enroll):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   DELETE FROM ENROLL WHERE ID = '{enroll.id}'
                    ''')
    
        return {"data":"okay"}
    def add_enroll(self,enroll):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                INSERT INTO ENROLL
                VALUES
                ('{enroll.courseCode}','{enroll.studentID}')
                ''')
        return {"data":"okay"}
    
    def student_enroll(self,enroll):
        sql = MySQL()
        sql.__enter__() 
        cursor = sql.conn.cursor()
        for i in enroll:
            for data in i.sectionOfferId:
                cursor.execute(f'''
                                SELECt DISTINCT so.ID as 'SectionOfferId' FROM SECTION_OFFER so Inner Join OFFERED_COURSES oc on 
                                oc.ID=so.CourseOfferId Inner join TIMETABLE t on t.CourseCode=oc.CourseCode
                                Where so.ID={data} and t.Discipline='{i.discipline}'

                                ''')
                for value in cursor.fetchall():
                    cursor.execute(f'''
                        INSERT INTO ENROLL
                        VALUES
                        ('{value.SectionOfferId}','{i.studentID}')
                        ''')
        return "Enrolled Succesfully"
