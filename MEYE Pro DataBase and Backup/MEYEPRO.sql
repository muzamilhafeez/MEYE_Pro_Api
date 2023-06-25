CREATE DATABASE MEYEPRO

CREATE TABLE DVR
(
ID INT IDENTITY(1,1) PRIMARY KEY,
IP VARCHAR(100),
NAME VARCHAR(100),
CHANNEL VARCHAR(100),
HOST VARCHAR(50),
PASSWORD VARCHAR(50)
)
select * from dbo.STUDENT

CREATE TABLE CAMERA
(
ID INT IDENTITY(1,1) PRIMARY KEY,
DvrID INT FOREIGN KEY REFERENCES DVR(ID),
VenueId INT FOREIGN KEY REFERENCES VENUE(ID),
PortNumber VARCHAR(50)
)

CREATE TABLE MEYE_USER(
ID INT IDENTITY(1,1) PRIMARY KEY,
UserID VARCHAR(100),
NAME VARCHAR(100),
Password VARCHAR(100),
IMAGE VARCHAR(MAX),
ROLE VARCHAR(30)
)
select * from  RULES
CREATE TABLE VENUE(
ID INT IDENTITY(1,1) PRIMARY KEY,
NAME VARCHAR(100),
)

select * from dbo.MEYE_USER
CREATE TABLE CHECKTIME(
ID INT IDENTITY(1,1) PRIMARY KEY,
TeacherSlotId INT FOREIGN KEY REFERENCES TEACHERSLOTS(ID),
TotalTimeIn INT,
TotalTimeOut INT,
)

CREATE TABLE CHECKTIMEDETAILS(
ID INT IDENTITY(1,1) PRIMARY KEY,
CheckTimeId INT FOREIGN KEY REFERENCES CHECKTIME(ID),
TimeIn DATETIME,
TimeOut DATETIME,
Sit int,
Stand int,
Mobile int
)

CREATE TABLE SESSION(
ID INT IDENTITY(1,1) PRIMARY KEY,
Name varchar(50),
)

CREATE TABLE STUDENT(
AridNo Varchar(100) PRIMARY KEY,
Name varchar(100),
Image varchar(100)
)


CREATE TABLE OFFERED_COURSES(
ID INT PRIMARY KEY IDENTITY(1,1),
SessionId INT FOREIGN KEY REFERENCES SESSION(ID),
CourseCode VARCHAR(100),
CourseName VARCHAR(100),
)

CREATE TABLE SECTION(
ID INT IDENTITY(1,1) PRIMARY KEY,
NAME VARCHAR(100),
)

CREATE TABLE ENROLL(
 ID INT IDENTITY(1,1) PRIMARY KEY,
 SectionOfferID INT FOREIGN KEY REFERENCES SECTION_OFFER(ID),
 StudentID VARCHAR(100) FOREIGN KEY REFERENCES STUDENT(AridNo),
)

CREATE TABLE SECTION_OFFER(
ID INT PRIMARY KEY IDENTITY(1,1),
CourseOfferId INT FOREIGN KEY REFERENCES OFFERED_COURSES(ID),
Discipline Varchar(100)
)

CREATE TABLE TIMETABLE(
ID INT PRIMARY KEY IDENTITY(1,1),
CourseCode VARCHAR(100),
CourseName VARCHAR(100),
TeacherName Varchar(100),
Discipline Varchar(100),
Venue Varchar(100),
Day Varchar(20),
StartTime Time,
EndTime Time,
SessionId INT FOREIGN KEY REFERENCES SESSION(ID),
)


CREATE TABLE TEMPORARY_TIMETABLE(
TimeTableId INT FOREIGN KEY REFERENCES TIMETABLE(ID),
StartRecord BIT,
EndRecord BIT,
FullRecord BIT
)

CREATE TABLE RULES(
ID INT IDENTITY(1,1) PRIMARY KEY,
TimeTableId INT FOREIGN KEY REFERENCES TIMETABLE(ID),
StartRecord BIT,
MidRecord int,
EndRecord BIT,
FullRecord BIT
)

CREATE TABLE TEACHERSLOTS(
ID INT IDENTITY(1,1) PRIMARY KEY,
TimeTableId INT FOREIGN KEY REFERENCES TIMETABLE(ID),
Slot INT,
Status varchar(100)
)

CREATE TABLE RECORDINGS(
ID INT IDENTITY(1,1) PRIMARY KEY,
TeacherSlotId INT FOREIGN KEY REFERENCES TEACHERSLOTS(ID),
FILENAME VARCHAR(MAX),
DATE DATETIME
)

CREATE TABLE ATTENDANCE(
ID INT IDENTITY(1,1) PRIMARY KEY,
EnrollId Int Foreign Key References ENROLL(ID),
Status Bit,
Date Date
)

CREATE TABLE PRESCHEDULE(
  ID INT Primary key,
  TimeTableId INT FOREIGN KEY REFERENCES TIMETABLE(ID),
  Date date,
  Day VARCHAR(50),
  StartTime VARCHAR(7),
  EndTime VARCHAR(7),
  Venue VARCHAR(7),
  Status bit
);


CREATE TABLE SWAPPING(
  ID INT Primary key,
  timeTableIdFrom INT FOREIGN KEY REFERENCES TIMETABLE(ID),
  timeTableIdTo INT FOREIGN KEY REFERENCES TIMETABLE(ID),
  Date date,
  Day VARCHAR(50),
  StartTime VARCHAR(7),
  EndTime VARCHAR(7),
  Status bit
);
INSERT INTO TEACHERSLOTS VALUES (1
                           ,1,'Not Held')

SELECT * FROM TEMPORARY_TIMETABLE  INNER JOIN 
TIMETABLE t On TEMPORARY_TIMETABLE.TimeTableId = t.ID Inner Join VENUE v 
On t.Venue=v.NAME INNER JOIN CAMERA C ON  C.VenueId = v.ID INNER JOIN DVR d ON d.ID=C.DvrID

--INSERT INTO TEMPORARY_TIMETABLE VALUES (895,1,1,1)


--ALTER TABLE RECORDINGS ADD  DATE DATETIME
--DELETE FROM TEACH WHERE TM_ID=3
--ALTER TABLE TIMETABLE ADD  C_ID VARCHAR(100) FOREIGN KEY REFERENCES COURSE(ID)
--DELETE FROM TIMETABLE WHERE SEC_ID=1
--ALTER TABLE TIMETABLE ADD  V_ID INT FOREIGN KEY REFERENCES VENUE(ID)

--------------------------------------------------ROUGH WORK-----------------------------------------
select * from dbo.PRESCHEDULE
 UPDATE MEYE_USER SET Name='Admin' Where ID='2'
SELECT * FROM DVR
SELECT * FROM TIMETABLE
SELECT * FROM VENUE
SELECT * FROM OFFERED_COURSES
SELECT * FROM SECTION_OFFER
SELECT * FROM CAMERA
SELECT * FROM MEYE_USER
select * from dbo.ATTENDANCE
Delete from MEYE_USER where ID=4
SELECT * FROM SECTION
SELECT * FROM RESCHEDULE
SELECT * FROM ENROLL
SELECT * FROM TEACHERSLOTS
SELECT * FROM TEACHS
SELECT * FROM RULES
SELECT * FROM RECORDINGS
SELECT * FROM CHECKTIME
SELECT * FROM CHECKTIMEDETAILS
SELECT * FROM STUDY
SELECT * FROM dbo.TEMPORARY_TIMETABLE
SELECT * FROM TEACH WHERE T_ID=4

DELETE TEACHERSLOTS
DELETE RECORDINGS
DELETE CHECKTIME
DELETE CHECKTIMEDETAILS


SELECT TEACHER.NAME,TS.*,R.*,TM.*,S.NAME,C.NAME,V.NAME FROM MEYE_USER TEACHER, 
TEACHERSLOTS TS INNER JOIN RECORDINGS R ON  R.TS_ID=TS.ID , TEACH TH INNER JOIN  TIMETABLE TM ON TM.ID=TH.TM_ID 
INNER JOIN SECTION S ON TM.SEC_ID=S.ID INNER JOIN VENUE V ON TM.V_ID=V.ID INNER JOIN COURSE C ON TM.C_ID=C.ID
WHERE TH.T_ID=4 AND TEACHER.ID=4 AND TS.STATUS!=0
AND TS.TH_ID=11

SELECT * FROM TIMETABLE
--------------------------------------------------------------------------------------------------------------
SELECT DISTINCT oc.ID as 'OfferedCourseID', OFFERED_COURSES.ID as 'CourseId', TIMETABLE.SessionId, TIMETABLE.Discipline FROM TIMETABLE 
INNER JOIN OFFERED_COURSES  ON TIMETABLE.CourseCode=OFFERED_COURSES.CourseCode INNER JOIN OFFERED_COURSES oc ON oc.CourseId=COURSE.ID 
INNER JOIN SECTION ON SECTION.NAME=TIMETABLE.Discipline
AND oc.SessionId = TIMETABLE.SessionId
AND TIMETABLE.SessionId=(SELECT TOP 1 SESSION.ID FROM SESSION ORDER BY ID DESC)

----------------------------------------------------------------------------------------------------------------------------------------

SELECT c.CourseName,c.CourseCode,so.Discipline FROM SECTION_OFFER so INNER JOIN OFFERED_COURSES oc ON so.CourseOfferId=oc.ID INNER JOIN COURSE c ON c.ID=oc.CourseId

----------------------------------------------------GET DISCIPLINE-----------------------------------------------------------------------------------------

SELECT DISTINCT oc.ID, t.Discipline FROM OFFERED_COURSES oc INNER JOIN TIMETABLE t ON
t.SessionId=oc.SessionId AND oc.CourseCode = t.CourseCode AND oc.CourseName=t.CourseName AND t.SessionId=
(SELECT TOP 1 SESSION.ID FROM SESSION ORDER BY ID DESC)


---------------------------------------------GET OFFERED COURSES----------------------------------------------------------------

SELECT oc.CourseCode,oc.CourseName,s.Name
FROM OFFERED_COURSES oc 
INNER JOIN SESSION S ON oc.SessionId=S.ID 
AND oc.SessionId=
(SELECT TOP 1 SESSION.ID FROM SESSION ORDER BY ID DESC)

----------------------------------------------GET SECTION OFFER---------------------------------------------

 SELECT oc.CourseName,oc.CourseCode,
so.Discipline FROM SECTION_OFFER so 
INNER JOIN OFFERED_COURSES oc 
ON so.CourseOfferId=oc.ID 
AND oc.SessionId=
(SELECT TOP 1 SESSION.ID FROM SESSION ORDER BY ID DESC)





-----------------------------------------------------------------------------------------------------------------------

SELECT * FROM  STUDY WHERE TH_ID=1

SELECT * FROM ATTENDANCE
SELECT ID FROM TEACH WHERE T_ID=1
--DELETE FROM RECORDINGS
--DELETE FROM CHECKTIME
--DELETE FROM CHECKTIMEDETAILS
UPDATE TEACHERSLOTS SET STATUS= 1 WHERE ID=33
--Insert into SECTION  Values ('CS-6A')

--select * from TEACHER_DATA

--Delete from TEACHER_DATA where TID='tahir123'


--SELECT * FROM TEACHER_SCHEDULE

--SELECT * FROM TEACHER_SCHEDULE WHERE TID='drNaseer123'

/*DELETE FROM CAMERA_DATA*/
--Select * from DVR_DATA
--Select * from CAMERA_DATA

Insert into SESSION values('Fall-2023')

DELETE TIMETABLE
DELETE VENUE

DELETE OFFERED_COURSES

--Update dbo.TEMPORARY_TIMETABLE Set FullRecord=0 Where TimeTableId=448

SELECT * FROM TIMETABLE WHERE TeacherName Like '%Shahid Abid%' AND SessionId=
                       (SELECT TOP 1 SESSION.ID FROM SESSION ORDER BY ID DESC)
                       
                       
                       
-- Remove Coulmn 
ALTER TABLE dbo.STUDENT
ADD Password varchar(100),
    Stand int,
    Mobile int;
    
    
    
ALTER TABLE RULES
ADD MidRecord int
-- Add  Coulmn 
ALTER TABLE dbo.STUDENT
DROP COLUMN password,
            Stand,
            Mobile;
            
            
            

Select t.ID,t.TeacherName,t.CourseCode,t.CourseName,t.Discipline,r.Venue,r.StartTime,r.EndTime,r.Day,t.SessionId,s.Name From RESCHEDULE r Inner Join TEACHERSLOTS ts 
                on ts.ID=r.TeacherSlotId Inner Join TIMETABLE t on 
                t.ID=ts.TimeTableId INNER JOIN SESSION s on 
                t.SessionId = s.ID and r.Date='2023-05-16'
                


Insert Into TIMETABLE Values('MGT322','FA','Ali Husnain','BAI-3A','Lt6','Monday','08:30:00.0000000','10:00:00.0000000',1)
Insert Into TEMPORARY_TIMETABLE Values (1359,1,1,0,0)


  SELECT * FROM TEMPORARY_TIMETABLE  INNER JOIN 
                   TIMETABLE t On TEMPORARY_TIMETABLE.TimeTableId = t.ID 
                   Inner Join VENUE v On t.Venue=v.NAME INNER JOIN CAMERA 
                   C ON  C.VenueId = v.ID INNER JOIN DVR d ON d.ID=C.DvrID Where t.ID=1359


Select * From DVR
Select * FRom CAMERA
Select * From VENUE

Insert Into CAMERA values (1,37,4) 

select * from dbo.CHECKTIMEDETAILS 
select * from dbo.CHECKTIME
select * from dbo.TEACHERSLOTS