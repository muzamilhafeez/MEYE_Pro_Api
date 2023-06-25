
from sql import MySQL
import Model.User as mUser
import ApiFunctions.User as apiUser

class StudentApi:
    def __init__(self,student:mUser) -> None:
        self.student = student
        
    def studentDetails(self):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                SELECT * FROM STUDENT 
                    ''')
        lst=[]
        for row in cursor.fetchall():
           lst.append(self.student.Student(aridNo=row.AridNo,name=row.Name,
                                           image=row.Image,password=row.Password))
        
        return lst
    
    def studentCourseOffered(self,studentCourseOffered):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        if len(studentCourseOffered) >1:
            cursor.execute(f'''
                SELECT * FROM STUDENT WHERE AridNo NOT IN (SELECT s.AridNo 
                FROM OFFERED_COURSES oc INNER JOIN SECTION_OFFER so 
                ON oc.ID=so.CourseOfferId INNER JOIN ENROLL e  ON e.SectionOfferID=so.ID
                INNER JOIN STUDENT s ON s.AridNo=e.StudentID
                AND SessionId=(SELECT TOP 1 
                SESSION.ID FROM SESSION ORDER BY ID DESC)
                AND oc.CourseName IN {tuple(studentCourseOffered)})
                        ''')
        elif len(studentCourseOffered)==1:
            cursor.execute(f'''
               SELECT * FROM STUDENT WHERE AridNo NOT IN (SELECT s.AridNo 
               FROM OFFERED_COURSES oc INNER JOIN SECTION_OFFER so 
               ON oc.ID=so.CourseOfferId INNER JOIN ENROLL e  ON e.SectionOfferID=so.ID
               INNER JOIN STUDENT s ON s.AridNo=e.StudentID
               AND SessionId=(SELECT TOP 1 
               SESSION.ID FROM SESSION ORDER BY ID DESC)
               AND oc.CourseName='{studentCourseOffered[0]}')
                    ''')
        
        lst=[]
        for row in cursor.fetchall():
           lst.append(self.student.Student(aridNo=row.AridNo,name=row.Name,
                                           image=row.Image,password=row.Password))
        
        return lst
            
        
        
   
    def addStudent(self,student):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        user = mUser.User
        user.id=0
        user.userID=student.aridNo
        user.name=student.name
        user.password = student.password
        user.role="Student"
        user.image=student.image
        user_object = apiUser.UserApi(user=user)
        result = user_object.add_user(user=user)
        if result=="Added":
            cursor.execute(f'''
                    INSERT INTO STUDENT
                    VALUES
                    ('{student.aridNo}','{student.name}','{student.image}','{student.password}')
                    ''')
        return result
    
    def getStudentCourses(self,aridNumber):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                SELECT DISTINCT t.TeacherName,oc.CourseName,so.Discipline FROM OFFERED_COURSES oc INNER JOIN TIMETABLE t ON oc.CourseCode=t.CourseCode 
                AND oc.SessionId=t.SessionId INNER JOIN SECTION_OFFER so ON so.CourseOfferId=oc.ID AND so.Discipline=t.Discipline
                INNER JOIN ENROLL e ON e.SectionOfferID=so.ID INNER JOIN STUDENT s ON s.AridNo=e.StudentID
                WHERE t.SessionId=(SELECT TOP 1 
                SESSION.ID FROM SESSION ORDER BY ID DESC)
                AND e.StudentID='{aridNumber}' AND t.Venue Like 'Lt%'
                    ''')
        lst=[]
        for row in cursor.fetchall():
            cursor.execute(
                f'''
                SELECT Image FROM MEYE_USER Where Name='{row.TeacherName}'
                '''
            )
            img=''
            percentage=0
            for data in cursor.fetchall():
                img=data.Image
            sql = MySQL()
            sql.__enter__()
            cursor1 = sql.conn.cursor()
            cursor1.execute(f'''
                            SELECT oc.CourseName,a.Status,a.Date FROM ATTENDANCE 
                            a Inner Join Enroll e on a.EnrollId=e.Id 
                            Inner Join SECTION_OFFER so on so.ID=e.SectionOfferID 
                            Inner Join OFFERED_COURSES oc on 
                            oc.ID=so.CourseOfferId  Where 
                            e.StudentID='{aridNumber}' And CourseName='{row.CourseName}'  
                            ''')
            lstPresent=[]
            lstAttendance=[]
            for attendance in cursor1.fetchall():
                lstAttendance.append(attendance.Status)
                if attendance.Status==1:
                    lstPresent.append(0)
            if len(lstAttendance)>0:
                percentage=float((len(lstPresent)/len(lstAttendance)))*100.0
            lst.append(self.student.StudentCourses(teacherName=row.TeacherName,
                                                courseName=row.CourseName,
                                                discipline=row.Discipline,
                                                image=img,
                                                percentage=percentage))
    
        return lst
    def getCourseAttendance(self,aridNumber,courseName):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                            SELECT oc.CourseName,a.Status,a.Date FROM ATTENDANCE 
                            a Inner Join Enroll e on a.EnrollId=e.Id 
                            Inner Join SECTION_OFFER so on so.ID=e.SectionOfferID 
                            Inner Join OFFERED_COURSES oc on 
                            oc.ID=so.CourseOfferId  Where 
                            e.StudentID='{aridNumber}' And CourseName='{courseName}'  
                            ''')
        lst=[]
        for row in cursor.fetchall():
            lst.append({
                'Date':row.Date,
                'Status':row.Status
            })
        return lst
