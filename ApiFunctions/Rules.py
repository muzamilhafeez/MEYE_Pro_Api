    
from sql import MySQL
import Model.TimeTable as mTimeTable


class RulesApi:
    def __init__(self,rules) -> None:
        self.rules = rules
        
    def add_rules(self,rules,teacherName):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        lstTimetableId=[]
        for timetable in rules:
            lstTimetableId.append(timetable.timeTableId)
        cursor.execute(f'''
                     SELECT r.TimetableId FROM RULES r Inner JOin 
                     TIMETABLE t on t.ID=r.TimetableId Where t.TeacherName Like '{teacherName}%'  
                       ''')
        for row in cursor.fetchall():
            if row.TimetableId not in lstTimetableId:
                cursor.execute(f'''
                        Delete FROM RULES  Where TimetableId={row.TimetableId}  
                        ''')
        for i in rules:
            cursor.execute(f'''
                       SELECT * FROM RULES WHERE TimeTableId='{i.timeTableId}'
                       ''')
            count=0
            for row in cursor.fetchall():
                count+=1
                cursor.execute(f'''
                       Update RULES Set StartRecord='{i.startRecord}',
                       MidRecord='{i.midRecord}',EndRecord='{i.endRecord}',
                       FullRecord='{i.fullRecord}'
                       WHERE TimeTableId='{i.timeTableId}'
                       ''')
            if count==0: 
                cursor.execute(f'''
                        INSERT INTO RULES
                        VALUES
                        ('{i.timeTableId}','{i.startRecord}','{i.midRecord}',
                        '{i.endRecord}','{i.fullRecord}')
                        ''')

        return "Added"
    def getTeacherRulesTimeTable(self,teacherName):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''                     
                        SELECT * FROM TIMETABLE t Left Join Rules r 
                        on t.ID=r.TimetableId WHERE 
                        t.TeacherName Like '%{teacherName}%' AND t.SessionId=
                        (SELECT TOP 1 SESSION.ID FROM SESSION ORDER BY ID DESC)
                        ''')
        lstTimeTable=[]
        startRecord=False
        midRecord=False
        endRecord=False
        fullRecord=False
        for row in cursor.fetchall():  
            st = row.StartTime.split(':')
            et = row.EndTime.split(':')
            st = f'{st[0]}:{st[1]}'
            et = f'{et[0]}:{et[1]}'
            if row.StartRecord==None:
                lstTimeTable.append(mTimeTable.TimeTableRules(id=row[0],discipline=row.Discipline
                                                    ,starttime=st,
                                                    endtime=et,
                                                    day=row.Day,
                                                    courseCode=row.CourseCode,
                                                    venue=row.Venue,
                                                    teacherName=row.TeacherName,
                                                    courseName=row.CourseName,
                                                    isSelected=False,
                                                    sessionName="",
                                                    sessionId=row.SessionId))
            else:
                startRecord=row.StartRecord
                endRecord=row.EndRecord
                midRecord=row.MidRecord
                fullRecord=row.FullRecord
                lstTimeTable.append(mTimeTable.TimeTableRules(id=row[0],discipline=row.Discipline
                                                    ,starttime=st,
                                                    endtime=et,
                                                    day=row.Day,
                                                    courseCode=row.CourseCode,
                                                    venue=row.Venue,
                                                    teacherName=row.TeacherName,
                                                    courseName=row.CourseName,
                                                    isSelected=True,
                                                    sessionName="",
                                                    sessionId=row.SessionId))
        return {
            'data':lstTimeTable,
            'startRecord':startRecord,
            'midRecord':midRecord,
            'endRecord':endRecord,
            'fullRecord':fullRecord
        }