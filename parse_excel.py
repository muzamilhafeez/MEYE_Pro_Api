import pandas as pd
import warnings
import Model.TimeTable as mTimeTable
import ApiFunctions.TimeTable as apiTimeTable
import Model.Venue as mVenue
import ApiFunctions.Venue as apiVenue
from sql import MySQL
import ApiFunctions.Offered_Courses as apiOfferedCourses
import Model.Offered_Courses as mOfferedCourses
import ApiFunctions.Section_Offer as apiSectionOffer
import Model.Section_Offer as mSectionOffer

class Parse_Excel:
    
    def parse_excel(path):
        df = pd.read_excel(path)

        df = df.iloc[1:]

        warnings.filterwarnings('ignore')
        for i in df.columns:
            if str(i).split('-')[0] in ('MCS','MIT') or str(i).split(':')[0]=='Unnamed':
                #print(f'{i} Column Deleted')
                df.drop(columns=i,axis=1,inplace=True)
            else:
                pass

        newdata = df.columns
        df.loc[-1] = newdata 
        df.index = df.index + 1  
        df.sort_index(inplace=True) 

        data = df.values.tolist()


        tempday=''
        temptime=''
        daysOfWeek = ('Monday','Tuesday','Wednesday','Thursday','Friday')
        section = ('BCS','BIT','BAI','BSE','BSSE')
        time = ('8:30 - 10:00','10:00 - 11:30','11:30 - 1:00','1:30 - 3:00','3:00 - 4:30','4:30 - 6:00')
        lstdays = []
        lsttime=[]
        lstcourse=[]
        for i in range(len(data)):
            for j in range(len(data[i])):
                if data[i][j] in daysOfWeek:
                    tempday=data[i][j]
                if data[i][j] in time:
                    temptime=data[i][j]
                if data[i][j]==" ":
                    pass
                elif str(data[i][j]).split('-')[0] not in section and  data[i][j] not in daysOfWeek and data[i][j] not in time:
                    if str(data[i][j])!='nan':
                        lstdays.append(tempday)
                        lstcourse.append(data[i][j])
                        lsttime.append(temptime)

        lstcoursecode=[]
        lstcoursename=[]
        lstdisp=[]
        lstteacher=[]
        lstvenue=[]

        for i,j,k in zip(lstdays,lsttime,lstcourse):
            lstcoursecode.append(k.split(' ')[0].split('_')[0])
            lstcoursename.append(k.split(' ')[0].split('_')[1])
            lstdisp.append(k.split(' ')[2].split(')')[0].split('(')[1])
            lstteacher.append(k.split('(')[2].split(')')[0])
            lstvenue.append(k.split('(')[2].split('_')[1])

        data = {
            'course_code':lstcoursecode,
            'course_name':lstcoursename,
            'discipline':lstdisp,
            'teacher_name':lstteacher,
            'venue':lstvenue,
            'day':lstdays,
            'time':lsttime
        }


        

        for cc,cn,disp,tn,v,d,t in zip(lstcoursecode,lstcoursename,lstdisp,lstteacher,lstvenue,lstdays,lsttime):
            timetable_object = apiTimeTable.TimeTableApi(timetable=mTimeTable)
            temp = mTimeTable.TimeTable
            temp.id=0
            temp.discipline=str(disp)
            temp.starttime=str(t).split('-')[0]
            temp.endtime=str(t).split('-')[1]
            temp.day=str(d)
            temp.courseCode=str(cc)
            temp.courseName=str(cn)
            temp.teacherName=str(tn)
            temp.venue=str(v)
            timetable_object.add_timetable(timetable= temp)
            
        venue_object = apiVenue.VenueApi(venue=mVenue)
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
               SELECT DISTINCT TIMETABLE.Venue FROM TIMETABLE
                ''')
        for venueData in cursor.fetchall():
            tempVenue = mVenue.Venue
            tempVenue.name = venueData.Venue
            tempVenue.id=0
            venue_object.add_venue(venue=tempVenue) 
             
        offeredCourseObject = apiOfferedCourses.OfferedCoursesApi(offeredCourses=mOfferedCourses)
        cursor.execute(f'''
               SELECT DISTINCT TIMETABLE.CourseName,TIMETABLE.CourseCode,TIMETABLE.SessionId FROM TIMETABLE WHERE 
                TIMETABLE.SessionId=  (SELECT TOP 1 SESSION.ID 
                FROM SESSION ORDER BY ID DESC)
                ''')
        for courseData in cursor.fetchall():
            tempCourse = mOfferedCourses.OfferedCourse
            tempCourse.courseName = courseData.CourseName
            tempCourse.courseCode=courseData.CourseCode
            tempCourse.id=0
            tempCourse.sessionId = courseData.SessionId
            offeredCourseObject.add_offeredCourses(offeredCourses=tempCourse)
            
         
        sectionOfferObject = apiSectionOffer.SectionOfferApi(sectionOffer=mSectionOffer)
        cursor.execute(
            f'''
            SELECT DISTINCT oc.ID, t.Discipline FROM OFFERED_COURSES oc INNER JOIN TIMETABLE t ON
            t.SessionId=oc.SessionId AND oc.CourseCode = t.CourseCode AND oc.CourseName=t.CourseName AND t.SessionId=
            (SELECT TOP 1 SESSION.ID FROM SESSION ORDER BY ID DESC)

            '''
            )
        for sectionOfferData in cursor.fetchall():
            tempSectionOffer = mSectionOffer.SectionOffer
            tempSectionOffer.courseOfferId=sectionOfferData.ID
            tempSectionOffer.discipline=sectionOfferData.Discipline
            sectionOfferObject.add_SectionOffer(sectionOffer=tempSectionOffer)
        
            
        