USE [MEYEPRO]
GO
/****** Object:  Table [dbo].[ActivityDetails]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CheckTimeId] [int] NULL,
	[TimeIn] [datetime] NULL,
	[TimeOut] [datetime] NULL,
	[Status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityDetailsSit]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityDetailsSit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CheckTimeId] [int] NULL,
	[TimeIn] [datetime] NULL,
	[TimeOut] [datetime] NULL,
	[Status] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ATTENDANCE]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATTENDANCE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnrollId] [int] NULL,
	[Status] [bit] NULL,
	[Date] [date] NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[Day] [varchar](50) NULL,
	[TeacherName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAMERA]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAMERA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DvrID] [int] NULL,
	[VenueId] [int] NULL,
	[PortNumber] [varchar](50) NULL,
	[Status] [nchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHECKTIME]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHECKTIME](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherSlotId] [int] NULL,
	[TotalTimeIn] [varchar](50) NULL,
	[TotalTimeOut] [varchar](50) NULL,
	[Date] [date] NULL,
	[Sit] [varchar](50) NULL,
	[Stand] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHECKTIMEDETAILS]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHECKTIMEDETAILS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CheckTimeId] [int] NULL,
	[TimeIn] [datetime] NULL,
	[TimeOut] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claim]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claim](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AttendanceId] [int] NULL,
	[TeacherName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DVR]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IP] [varchar](100) NULL,
	[NAME] [varchar](100) NULL,
	[CHANNEL] [varchar](100) NULL,
	[HOST] [varchar](50) NULL,
	[PASSWORD] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENROLL]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENROLL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SectionOfferID] [int] NULL,
	[StudentID] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEYE_USER]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEYE_USER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](100) NULL,
	[Name] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[Image] [varchar](max) NULL,
	[Role] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OFFERED_COURSES]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFERED_COURSES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SessionId] [int] NULL,
	[CourseCode] [varchar](100) NULL,
	[CourseName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRESCHEDULE]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRESCHEDULE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TimeTableId] [int] NULL,
	[Date] [date] NULL,
	[Day] [varchar](50) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[Venue] [varchar](50) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RECORDINGS]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECORDINGS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherSlotId] [int] NULL,
	[FILENAME] [varchar](max) NULL,
	[DATE] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESCHEDULE]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESCHEDULE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherSlotId] [int] NULL,
	[Date] [date] NULL,
	[Day] [varchar](50) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[Venue] [varchar](30) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RULES]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RULES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TimetableId] [int] NULL,
	[StartRecord] [bit] NULL,
	[MidRecord] [bit] NULL,
	[EndRecord] [bit] NULL,
	[FullRecord] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SECTION]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SECTION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SECTION_OFFER]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SECTION_OFFER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseOfferId] [int] NULL,
	[Discipline] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SESSION]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SESSION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STUDENT]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STUDENT](
	[AridNo] [varchar](100) NOT NULL,
	[Name] [varchar](100) NULL,
	[Image] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AridNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SWAPPING]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SWAPPING](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TimeTableIdFrom] [int] NULL,
	[TimeTableIdTo] [int] NULL,
	[Date] [date] NULL,
	[Day] [varchar](50) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TEACHERSLOTS]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEACHERSLOTS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TimeTableId] [int] NULL,
	[Slot] [int] NULL,
	[Status] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempAttendance]    Script Date: 7/18/2023 12:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempAttendance](
	[AttendanceId] [int] NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[Date] [varchar](50) NULL,
	[Day] [varchar](50) NULL,
	[TeacherName] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TEMPORARY_TIMETABLE]    Script Date: 7/18/2023 12:20:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEMPORARY_TIMETABLE](
	[TimeTableId] [int] NULL,
	[StartRecord] [bit] NULL,
	[MidRecord] [bit] NULL,
	[EndRecord] [bit] NULL,
	[FullRecord] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIMETABLE]    Script Date: 7/18/2023 12:20:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIMETABLE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [varchar](100) NULL,
	[CourseName] [varchar](100) NULL,
	[TeacherName] [varchar](100) NULL,
	[Discipline] [varchar](100) NULL,
	[Venue] [varchar](100) NULL,
	[Day] [varchar](20) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[SessionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENUE]    Script Date: 7/18/2023 12:20:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENUE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActivityDetails] ON 

INSERT [dbo].[ActivityDetails] ([ID], [CheckTimeId], [TimeIn], [TimeOut], [Status]) VALUES (90, 126, CAST(N'2023-06-10T15:20:00.000' AS DateTime), CAST(N'2023-06-10T15:21:44.000' AS DateTime), N'Sit')
INSERT [dbo].[ActivityDetails] ([ID], [CheckTimeId], [TimeIn], [TimeOut], [Status]) VALUES (91, 126, CAST(N'2023-06-10T15:21:44.000' AS DateTime), CAST(N'2023-06-10T15:23:04.000' AS DateTime), N'Stand')
INSERT [dbo].[ActivityDetails] ([ID], [CheckTimeId], [TimeIn], [TimeOut], [Status]) VALUES (92, 127, CAST(N'2023-06-10T15:58:18.000' AS DateTime), CAST(N'2023-06-10T15:59:46.000' AS DateTime), N'Sit')
INSERT [dbo].[ActivityDetails] ([ID], [CheckTimeId], [TimeIn], [TimeOut], [Status]) VALUES (93, 127, CAST(N'2023-06-10T15:57:30.000' AS DateTime), CAST(N'2023-06-10T15:58:18.000' AS DateTime), N'Stand')
INSERT [dbo].[ActivityDetails] ([ID], [CheckTimeId], [TimeIn], [TimeOut], [Status]) VALUES (94, 128, CAST(N'2023-06-10T16:09:09.000' AS DateTime), CAST(N'2023-06-10T16:10:47.000' AS DateTime), N'Sit')
INSERT [dbo].[ActivityDetails] ([ID], [CheckTimeId], [TimeIn], [TimeOut], [Status]) VALUES (95, 128, CAST(N'2023-06-10T16:08:34.000' AS DateTime), CAST(N'2023-06-10T16:09:09.000' AS DateTime), N'Stand')
INSERT [dbo].[ActivityDetails] ([ID], [CheckTimeId], [TimeIn], [TimeOut], [Status]) VALUES (101, 130, CAST(N'2023-06-10T16:38:18.000' AS DateTime), CAST(N'2023-06-10T16:39:53.000' AS DateTime), N'Sit')
INSERT [dbo].[ActivityDetails] ([ID], [CheckTimeId], [TimeIn], [TimeOut], [Status]) VALUES (102, 130, CAST(N'2023-06-10T16:40:55.000' AS DateTime), CAST(N'2023-06-10T16:41:20.000' AS DateTime), N'Sit')
INSERT [dbo].[ActivityDetails] ([ID], [CheckTimeId], [TimeIn], [TimeOut], [Status]) VALUES (103, 130, CAST(N'2023-06-10T16:39:53.000' AS DateTime), CAST(N'2023-06-10T16:40:55.000' AS DateTime), N'Stand')
INSERT [dbo].[ActivityDetails] ([ID], [CheckTimeId], [TimeIn], [TimeOut], [Status]) VALUES (104, 131, CAST(N'2023-06-10T17:01:16.000' AS DateTime), CAST(N'2023-06-10T17:02:19.000' AS DateTime), N'Stand')
INSERT [dbo].[ActivityDetails] ([ID], [CheckTimeId], [TimeIn], [TimeOut], [Status]) VALUES (105, 132, CAST(N'2023-06-12T12:35:17.000' AS DateTime), CAST(N'2023-06-12T12:36:26.000' AS DateTime), N'Sit')
INSERT [dbo].[ActivityDetails] ([ID], [CheckTimeId], [TimeIn], [TimeOut], [Status]) VALUES (106, 132, CAST(N'2023-06-12T12:32:51.000' AS DateTime), CAST(N'2023-06-12T12:35:17.000' AS DateTime), N'Stand')
SET IDENTITY_INSERT [dbo].[ActivityDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ATTENDANCE] ON 

INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (1, 274, 1, CAST(N'2023-06-13' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (2, 280, 1, CAST(N'2023-06-13' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (3, 292, 1, CAST(N'2023-06-13' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (4, 309, 1, CAST(N'2023-06-13' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (5, 311, 1, CAST(N'2023-06-13' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (6, 312, 0, CAST(N'2023-06-13' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (7, 314, 0, CAST(N'2023-06-13' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (8, 315, 1, CAST(N'2023-06-13' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (9, 316, 0, CAST(N'2023-06-13' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (10, 318, 0, CAST(N'2023-06-13' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (11, 319, 1, CAST(N'2023-06-13' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (12, 320, 0, CAST(N'2023-06-13' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (13, 274, 0, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (14, 312, 0, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (15, 280, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (16, 292, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (17, 309, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (18, 311, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (19, 314, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (20, 315, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (21, 316, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (22, 318, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (23, 319, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (24, 320, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (25, 274, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (26, 312, 0, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (27, 280, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (28, 292, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (29, 309, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (30, 311, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (31, 314, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (32, 315, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (33, 316, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (34, 318, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (35, 319, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (36, 320, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (37, 274, 0, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (38, 312, 0, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (39, 280, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (40, 292, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (41, 309, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (42, 311, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (43, 314, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (44, 315, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (45, 316, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (46, 318, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (47, 319, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[ATTENDANCE] ([ID], [EnrollId], [Status], [Date], [StartTime], [EndTime], [Day], [TeacherName]) VALUES (48, 320, 1, CAST(N'2023-06-14' AS Date), CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'Friday', N'Dr. Hassan,Waseem')
SET IDENTITY_INSERT [dbo].[ATTENDANCE] OFF
GO
SET IDENTITY_INSERT [dbo].[CAMERA] ON 

INSERT [dbo].[CAMERA] ([ID], [DvrID], [VenueId], [PortNumber], [Status]) VALUES (3, 1, 174, N'6', NULL)
INSERT [dbo].[CAMERA] ([ID], [DvrID], [VenueId], [PortNumber], [Status]) VALUES (4, 1, 179, N'1', NULL)
INSERT [dbo].[CAMERA] ([ID], [DvrID], [VenueId], [PortNumber], [Status]) VALUES (5, 3, 165, N'1', NULL)
INSERT [dbo].[CAMERA] ([ID], [DvrID], [VenueId], [PortNumber], [Status]) VALUES (13, 1, 166, N'3', NULL)
INSERT [dbo].[CAMERA] ([ID], [DvrID], [VenueId], [PortNumber], [Status]) VALUES (15, 1, 167, N'5', NULL)
INSERT [dbo].[CAMERA] ([ID], [DvrID], [VenueId], [PortNumber], [Status]) VALUES (25, 19, 176, N'1', NULL)
INSERT [dbo].[CAMERA] ([ID], [DvrID], [VenueId], [PortNumber], [Status]) VALUES (26, 1, 177, N'2', NULL)
INSERT [dbo].[CAMERA] ([ID], [DvrID], [VenueId], [PortNumber], [Status]) VALUES (27, 1, 170, N'6', NULL)
INSERT [dbo].[CAMERA] ([ID], [DvrID], [VenueId], [PortNumber], [Status]) VALUES (28, 19, 175, N'3', N'Front                                             ')
SET IDENTITY_INSERT [dbo].[CAMERA] OFF
GO
SET IDENTITY_INSERT [dbo].[CHECKTIME] ON 

INSERT [dbo].[CHECKTIME] ([ID], [TeacherSlotId], [TotalTimeIn], [TotalTimeOut], [Date], [Sit], [Stand]) VALUES (125, 351, N'2 Min 10 Sec', N'0 Min 0 Sec', CAST(N'2023-06-10' AS Date), N'1 Min 15 Sec', N'0 Min 55 Sec')
INSERT [dbo].[CHECKTIME] ([ID], [TeacherSlotId], [TotalTimeIn], [TotalTimeOut], [Date], [Sit], [Stand]) VALUES (126, 352, N'3 Min 3 Sec', N'0 Min 0 Sec', CAST(N'2023-06-10' AS Date), N'1 Min 44 Sec', N'1 Min 19 Sec')
INSERT [dbo].[CHECKTIME] ([ID], [TeacherSlotId], [TotalTimeIn], [TotalTimeOut], [Date], [Sit], [Stand]) VALUES (127, 353, N'2 Min 15 Sec', N'0 Min 0 Sec', CAST(N'2023-06-10' AS Date), N'1 Min 28 Sec', N'0 Min 47 Sec')
INSERT [dbo].[CHECKTIME] ([ID], [TeacherSlotId], [TotalTimeIn], [TotalTimeOut], [Date], [Sit], [Stand]) VALUES (128, 354, N'2 Min 12 Sec', N'0 Min 52 Sec', CAST(N'2023-06-10' AS Date), N'1 Min 37 Sec', N'0 Min 35 Sec')
INSERT [dbo].[CHECKTIME] ([ID], [TeacherSlotId], [TotalTimeIn], [TotalTimeOut], [Date], [Sit], [Stand]) VALUES (130, 359, N'3 Min 1 Sec', N'0 Min 0 Sec', CAST(N'2023-06-10' AS Date), N'1 Min 59 Sec', N'1 Min 2 Sec')
INSERT [dbo].[CHECKTIME] ([ID], [TeacherSlotId], [TotalTimeIn], [TotalTimeOut], [Date], [Sit], [Stand]) VALUES (131, 360, N'1 Min 2 Sec', N'1 Min 0 Sec', CAST(N'2023-06-10' AS Date), N'0 Min 0 Sec', N'1 Min 2 Sec')
INSERT [dbo].[CHECKTIME] ([ID], [TeacherSlotId], [TotalTimeIn], [TotalTimeOut], [Date], [Sit], [Stand]) VALUES (132, 367, N'3 Min 34 Sec', N'0 Min 0 Sec', CAST(N'2023-06-12' AS Date), N'1 Min 8 Sec', N'2 Min 26 Sec')
SET IDENTITY_INSERT [dbo].[CHECKTIME] OFF
GO
SET IDENTITY_INSERT [dbo].[CHECKTIMEDETAILS] ON 

INSERT [dbo].[CHECKTIMEDETAILS] ([ID], [CheckTimeId], [TimeIn], [TimeOut]) VALUES (116, 126, CAST(N'2023-06-10T15:20:00.000' AS DateTime), CAST(N'2023-06-10T15:23:04.000' AS DateTime))
INSERT [dbo].[CHECKTIMEDETAILS] ([ID], [CheckTimeId], [TimeIn], [TimeOut]) VALUES (117, 127, CAST(N'2023-06-10T15:57:30.000' AS DateTime), CAST(N'2023-06-10T15:59:46.000' AS DateTime))
INSERT [dbo].[CHECKTIMEDETAILS] ([ID], [CheckTimeId], [TimeIn], [TimeOut]) VALUES (118, 128, CAST(N'2023-06-10T16:08:34.000' AS DateTime), CAST(N'2023-06-10T16:10:47.000' AS DateTime))
INSERT [dbo].[CHECKTIMEDETAILS] ([ID], [CheckTimeId], [TimeIn], [TimeOut]) VALUES (120, 130, CAST(N'2023-06-10T16:38:18.000' AS DateTime), CAST(N'2023-06-10T16:41:20.000' AS DateTime))
INSERT [dbo].[CHECKTIMEDETAILS] ([ID], [CheckTimeId], [TimeIn], [TimeOut]) VALUES (121, 131, CAST(N'2023-06-10T17:01:16.000' AS DateTime), CAST(N'2023-06-10T17:02:19.000' AS DateTime))
INSERT [dbo].[CHECKTIMEDETAILS] ([ID], [CheckTimeId], [TimeIn], [TimeOut]) VALUES (122, 132, CAST(N'2023-06-12T12:32:51.000' AS DateTime), CAST(N'2023-06-12T12:36:26.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[CHECKTIMEDETAILS] OFF
GO
SET IDENTITY_INSERT [dbo].[Claim] ON 

INSERT [dbo].[Claim] ([ID], [AttendanceId], [TeacherName]) VALUES (3, 0, N'string')
INSERT [dbo].[Claim] ([ID], [AttendanceId], [TeacherName]) VALUES (4, 38, N'Dr. Hassan')
SET IDENTITY_INSERT [dbo].[Claim] OFF
GO
SET IDENTITY_INSERT [dbo].[DVR] ON 

INSERT [dbo].[DVR] ([ID], [IP], [NAME], [CHANNEL], [HOST], [PASSWORD]) VALUES (1, N'192.168.43.35', N'DVR12', N'16', N'admin', N'biit12')
INSERT [dbo].[DVR] ([ID], [IP], [NAME], [CHANNEL], [HOST], [PASSWORD]) VALUES (3, N'192.168.1.1', N'Dvrrm45', N'9', N'Admin', N'123')
INSERT [dbo].[DVR] ([ID], [IP], [NAME], [CHANNEL], [HOST], [PASSWORD]) VALUES (19, N'192.168.1.19', N'admin', N'16', N'admin', N'123')
INSERT [dbo].[DVR] ([ID], [IP], [NAME], [CHANNEL], [HOST], [PASSWORD]) VALUES (20, N'128', N'admin', N'15', N'admin', N'aaddsd')
SET IDENTITY_INSERT [dbo].[DVR] OFF
GO
SET IDENTITY_INSERT [dbo].[ENROLL] ON 

INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (273, 1, N'2019-ARID-2931')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (274, 8, N'2019-ARID-2931')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (275, 39, N'2019-ARID-2931')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (276, 113, N'2019-ARID-2931')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (277, 158, N'2019-ARID-2931')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (278, 162, N'2019-ARID-2931')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (279, 1, N'2019-ARID-2945')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (280, 8, N'2019-ARID-2945')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (281, 39, N'2019-ARID-2945')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (282, 113, N'2019-ARID-2945')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (283, 158, N'2019-ARID-2945')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (284, 162, N'2019-ARID-2945')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (285, 1, N'2019-ARID-2963')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (287, 39, N'2019-ARID-2963')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (288, 113, N'2019-ARID-2963')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (289, 158, N'2019-ARID-2963')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (290, 162, N'2019-ARID-2963')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (291, 1, N'2019-ARID-3040')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (292, 8, N'2019-ARID-3040')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (293, 39, N'2019-ARID-3040')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (294, 113, N'2019-ARID-3040')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (295, 158, N'2019-ARID-3040')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (296, 162, N'2019-ARID-3040')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (303, 1, N'2019-ARID-3015')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (304, 39, N'2019-ARID-3015')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (305, 113, N'2019-ARID-3015')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (306, 68, N'2019-ARID-3092')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (307, 108, N'2019-ARID-3092')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (308, 137, N'2019-ARID-3092')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (309, 8, N'Roman123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (311, 8, N'Muzamil123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (312, 8, N'MSaadKamran123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (314, 8, N'2019-ARID-3015')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (315, 8, N'2019-ARID-3092')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (316, 8, N'aliahmad123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (318, 8, N'shahid123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (319, 8, N'usama1234')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (320, 8, N'umair123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (321, 100, N'2019-ARID-2963')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (322, 135, N'2019-ARID-2963')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (323, 100, N'Binyamin123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (324, 135, N'Binyamin123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (325, 100, N'Nazaid123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (326, 135, N'Nazaid123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (327, 100, N'shahid123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (328, 135, N'shahid123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (331, 21, N'2019-ARID-2945')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (332, 25, N'2019-ARID-2945')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (333, 21, N'2019-ARID-2963')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (334, 25, N'2019-ARID-2963')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (335, 107, N'2019-ARID-2931')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (336, 107, N'2019-ARID-2945')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (337, 107, N'2019-ARID-2963')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (338, 107, N'2019-ARID-3040')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (339, 107, N'2019-ARID-3015')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (341, 107, N'Ali123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (342, 107, N'Baqir123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (343, 107, N'aliahmad123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (344, 107, N'Bashir123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (345, 107, N'Binyamin123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (346, 107, N'MSaadKamran123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (347, 107, N'Muzamil123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (348, 107, N'Nazaid123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (350, 107, N'Roman123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (351, 107, N'shahid123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (352, 107, N'umair123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (353, 107, N'usama1234')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (354, 107, N'Zia123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (355, 26, N'2019-ARID-2931')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (356, 26, N'2019-ARID-3015')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (357, 26, N'2019-ARID-3092')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (358, 26, N'aliahmad123')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (360, 144, N'2019-ARID-3015')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (361, 10, N'2019-ARID-2945')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (362, 57, N'2019-ARID-2945')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (363, 111, N'2019-ARID-2945')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (364, 10, N'2019-ARID-2963')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (365, 57, N'2019-ARID-2963')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (366, 111, N'2019-ARID-2963')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (367, 10, N'2019-ARID-3015')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (368, 57, N'2019-ARID-3015')
INSERT [dbo].[ENROLL] ([ID], [SectionOfferID], [StudentID]) VALUES (369, 111, N'2019-ARID-3015')
SET IDENTITY_INSERT [dbo].[ENROLL] OFF
GO
SET IDENTITY_INSERT [dbo].[MEYE_USER] ON 

INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (1, N'DrNaseer123', N'Dr. Naseer', N'123', N'image_picker1231572622.jpg', N'Teacher')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (2, N'MrShahid234', N'Shahid Jamil', N'123', N'image_picker1729879042.jpg', N'Teacher')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (3, N'MrNaveed254', N'Naveed', N'123', N'image_picker677584985.jpg', N'Teacher')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (4, N'MrTahir678', N'Tahir', N'123', N'image_picker308567798.jpg', N'Teacher')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (5, N'MrShahid676', N'Shahid Abid', N'123', N'image_picker2046249177.jpg', N'Teacher')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (6, N'AbdulSami123', N'Abdul Sami', N'123', N'image_picker1988187421526006098.jpg', N'Teacher')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (8, N'2019-ARID-3040', N'Muhammad Osama Shakeel', N'123', N'IMG_0701.jpeg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (9, N'2019-ARID-3092', N'Saud Gul', N'123', N'IMG_0747.jpeg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (11, N'2019-ARID-2963', N'Ehsan Rafi', N'123', N'IMG_0690.jpeg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (12, N'2019-ARID-3015', N'Muhammad Arsalan Khan', N'123', N'IMG_E0817.JPG', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (14, N'Admin', N'Admin', N'123', NULL, N'Admin')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (15, N'MrUmer123', N'Umer', N'123', N'image_picker-53148365.jpg', N'Teacher')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (16, N'drhassan123', N'Dr. Hassan', N'123', N'image_picker1128525661.jpg', N'Teacher')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (17, N'2019-ARID-2931', N'Abdul Sami', N'123', N'image_picker-982315689.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (19, N'Director', N'Director', N'123', N'', N'Director')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (20, N'Nazaid123', N'Nazaid', N'123', N'image_picker2616793540933660038.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (21, N'Roman123', N'Roman ', N'123', N'image_picker1357825165438949160.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (22, N'Binyamin123', N'Binyamin', N'123', N'image_picker6222701847905744859.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (23, N'MSaadKamran123', N'Muhammad Saad', N'123', N'image_picker2041820021397949050.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (24, N'Muzamil123', N'Muhammad Muzamil', N'123', N'image_picker602227560103253536.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (26, N'aliahmad123', N'Ali Ahmad', N'123', N'image_picker3697854668776368990.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (27, N'umair123', N'M Umair', N'123', N'image_picker4828089175400742455.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (28, N'usama1234', N'Osama', N'123', N'image_picker7149004103217965685.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (29, N'shahid123', N'M Shahid', N'123', N'image_picker4836423344263563662.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (30, N'Zia123', N'Ziaimdad', N'123', N'image_picker818577649273841634.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (31, N'Baqir123', N'Baqir Ismail', N'123', N'image_picker9183926794617913683.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (32, N'Bashir123', N'M Bashir', N'123', N'image_picker5588996047235738448.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (33, N'Ali123', N'Ali Kiyani', N'123', N'image_picker3370121879854342436.jpg', N'Student')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (35, N'AliHusnain123', N'Ali Husnain', N'123', N'image_picker987648101.jpg', N'Teacher')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (37, N'MrZahid123', N'Zahid', N'123', N'sirzahid.jpg', N'Teacher')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (38, N'MrNoman123', N'Noman', N'123', N'sirnoman.jpg', N'Teacher')
INSERT [dbo].[MEYE_USER] ([ID], [UserID], [Name], [Password], [Image], [Role]) VALUES (39, N'MrAmir123', N'Amir', N'123', N'FB_IMG_1686041757067.jpg', N'Teacher')
SET IDENTITY_INSERT [dbo].[MEYE_USER] OFF
GO
SET IDENTITY_INSERT [dbo].[OFFERED_COURSES] ON 

INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (43, 1, N'CS542', N'AA')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (44, 1, N'CS632', N'AI')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (45, 1, N'PHY403', N'AP')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (46, 1, N'MTH310', N'CAG')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (47, 1, N'CS636', N'CC')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (48, 1, N'CS577', N'CN')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (49, 1, N'CS530', N'COAL')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (50, 1, N'ENG325', N'CPS')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (51, 1, N'CS597', N'CSC')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (52, 1, N'CS601', N'DAM')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (53, 1, N'CS400', N'DBS')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (54, 1, N'CS430', N'DLD')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (55, 1, N'CS335', N'DS')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (56, 1, N'CS443', N'DSA')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (57, 1, N'ENG305', N'EC')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (58, 1, N'MGT322', N'FA')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (59, 1, N'CS698', N'FYP-I')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (60, 1, N'CS497', N'INS')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (61, 1, N'IS302', N'IS')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (62, 1, N'CS555', N'ITI')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (63, 1, N'MGT411', N'ITM')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (64, 1, N'MTH435', N'LA')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (65, 1, N'CS693', N'MAP')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (66, 1, N'CS404', N'ML')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (67, 1, N'MTH315', N'MVC')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (68, 1, N'CS572', N'NA')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (69, 1, N'CS423', N'OOP')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (70, 1, N'CS687', N'PDC')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (71, 1, N'CS323', N'PF')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (72, 1, N'SSH307', N'PP')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (73, 1, N'MTH201', N'PRECAG-I')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (74, 1, N'MTH201', N'PRECAG-II')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (75, 1, N'SSH302', N'PS')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (76, 1, N'CS453', N'SE')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (77, 1, N'STT500', N'STP')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (78, 1, N'ENG315', N'TBW')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (79, 1, N'TOQ301', N'TOQ-I')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (80, 1, N'TOQ302', N'TOQ-II')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (81, 1, N'CS692', N'VP')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (82, 1, N'CS655', N'VSS')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (83, 1, N'CS666', N'WE')
INSERT [dbo].[OFFERED_COURSES] ([ID], [SessionId], [CourseCode], [CourseName]) VALUES (84, 1, N'CS566', N'WT')
SET IDENTITY_INSERT [dbo].[OFFERED_COURSES] OFF
GO
SET IDENTITY_INSERT [dbo].[PRESCHEDULE] ON 

INSERT [dbo].[PRESCHEDULE] ([ID], [TimeTableId], [Date], [Day], [StartTime], [EndTime], [Venue], [Status]) VALUES (1, 895, CAST(N'2023-06-22' AS Date), N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'DLDLab', 0)
SET IDENTITY_INSERT [dbo].[PRESCHEDULE] OFF
GO
SET IDENTITY_INSERT [dbo].[RECORDINGS] ON 

INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (235, 351, N'Recordings/file,351,start_recording.mp4', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (236, 351, N'Recordings/file,351,end_recording.mp4', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (237, 352, N'Recordings/file,352,start_recording.mp4', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (238, 352, N'Recordings/file,352,end_recording.mp4', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (239, 353, N'Recordings/file,353,mid_recording.mp4', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (240, 353, N'Recordings/file,353,start_recording.mp4', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (241, 354, N'Recordings/file,354,mid_recording.mp4', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (242, 354, N'Recordings/file,354,start_recording.mp4', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (249, 359, N'Recordings/file,359,mid_recording.mp4', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (250, 359, N'Recordings/file,359,start_recording.mp4', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (251, 360, N'Recordings/file,360,mid_recording.mp4', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (252, 360, N'Recordings/file,360,start_recording.mp4', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (253, 367, N'Recordings/file,367,mid_recording.mp4', CAST(N'2023-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[RECORDINGS] ([ID], [TeacherSlotId], [FILENAME], [DATE]) VALUES (254, 367, N'Recordings/file,367,start_recording.mp4', CAST(N'2023-06-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[RECORDINGS] OFF
GO
SET IDENTITY_INSERT [dbo].[RULES] ON 

INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (3, 517, 1, 0, 1, 0)
INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (9, 728, 1, 0, 1, 0)
INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (11, 658, 1, 0, 1, 0)
INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (12, 749, 1, 0, 1, 0)
INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (14, 676, 1, 0, 1, 0)
INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (16, 862, 1, 0, 1, 0)
INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (23, 557, 1, 0, 1, 0)
INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (24, 596, 1, 0, 1, 0)
INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (28, 895, 1, 0, 1, 0)
INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (52, 623, 1, 1, 0, 0)
INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (53, 721, 1, 1, 0, 0)
INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (54, 459, 1, 0, 0, 1)
INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (55, 842, 1, 0, 0, 1)
INSERT [dbo].[RULES] ([ID], [TimetableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (56, 526, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[RULES] OFF
GO
SET IDENTITY_INSERT [dbo].[SECTION_OFFER] ON 

INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (1, 43, N'BCS-5A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (2, 44, N'BAI-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (3, 44, N'BAI-4A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (4, 44, N'BCS-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (5, 44, N'BCS-4A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (6, 44, N'BCS-4B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (7, 44, N'BCS-4C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (8, 44, N'BCS-5A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (9, 45, N'BCS-1A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (10, 45, N'BCS-1B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (11, 45, N'BSSE-1A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (12, 46, N'BCS-1A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (13, 46, N'BCS-1B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (14, 46, N'BSSE-1A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (15, 47, N'BCS-6A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (16, 47, N'BCS-6B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (17, 47, N'BCS-6C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (18, 47, N'BCS-6D')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (19, 47, N'BCS-7A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (20, 48, N'BAI-4A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (21, 48, N'BCS-4A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (22, 48, N'BCS-4B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (23, 48, N'BCS-4C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (24, 49, N'BAI-4A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (25, 49, N'BCS-4A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (26, 49, N'BCS-4B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (27, 49, N'BCS-4C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (28, 50, N'BAI-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (29, 50, N'BAI-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (30, 50, N'BCS-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (31, 50, N'BCS-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (32, 50, N'BCS-2C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (33, 50, N'BCS-2D')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (34, 50, N'BCS-2E')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (35, 50, N'BSSE-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (36, 50, N'BSSE-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (37, 51, N'BIT-6A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (38, 51, N'BIT-6B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (39, 52, N'BCS-5A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (40, 53, N'BAI-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (41, 53, N'BAI-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (42, 53, N'BCS-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (43, 53, N'BCS-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (44, 53, N'BCS-2C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (45, 53, N'BCS-2D')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (46, 53, N'BCS-2E')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (47, 53, N'BSSE-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (48, 53, N'BSSE-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (49, 54, N'BAI-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (50, 54, N'BCS-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (51, 55, N'BCS-1A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (52, 55, N'BCS-1B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (53, 55, N'BSSE-1A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (54, 56, N'BAI-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (55, 56, N'BCS-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (56, 57, N'BCS-1A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (57, 57, N'BCS-1B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (58, 57, N'BSSE-1A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (59, 58, N'BAI-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (60, 58, N'BCS-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (61, 59, N'BCS-7A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (62, 59, N'BIT-7A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (63, 60, N'BCS-7A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (64, 61, N'BCS-6A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (65, 61, N'BCS-6B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (66, 61, N'BCS-6C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (67, 61, N'BCS-6D')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (68, 62, N'BIT-6A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (69, 62, N'BIT-6B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (70, 62, N'BIT-7A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (71, 63, N'BAI-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (72, 63, N'BCS-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (73, 64, N'BAI-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (74, 64, N'BAI-4A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (75, 64, N'BCS-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (76, 64, N'BCS-4A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (77, 64, N'BCS-4B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (78, 64, N'BCS-4C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (79, 65, N'Flutter')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (80, 65, N'react-native')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (81, 66, N'BAI-4A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (82, 67, N'BAI-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (83, 67, N'BAI-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (84, 67, N'BCS-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (85, 67, N'BCS-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (86, 67, N'BCS-2C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (87, 67, N'BCS-2D')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (88, 67, N'BCS-2E')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (89, 67, N'BSSE-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (90, 67, N'BSSE-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (91, 68, N'BCS-6A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (92, 68, N'BCS-6B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (93, 68, N'BCS-6C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (94, 68, N'BCS-6D')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (95, 69, N'BAI-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (96, 69, N'BAI-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (97, 69, N'BCS-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (98, 69, N'BCS-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (99, 69, N'BCS-2C')
GO
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (100, 69, N'BCS-2D')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (101, 69, N'BCS-2E')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (102, 69, N'BSSE-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (103, 69, N'BSSE-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (104, 70, N'BCS-6A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (105, 70, N'BCS-6B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (106, 70, N'BCS-6C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (107, 70, N'BCS-6D')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (108, 70, N'BIT-6A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (109, 70, N'BIT-6B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (110, 71, N'BCS-1A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (111, 71, N'BCS-1B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (112, 71, N'BSSE-1A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (113, 72, N'BCS-5A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (114, 72, N'BCS-6A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (115, 72, N'BCS-6B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (116, 72, N'BCS-6C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (117, 72, N'BCS-6D')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (118, 73, N'BCS-1A,BSSE-1A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (119, 74, N'BCS-1A,BAI-2A,BCS-2B,BSSE-1A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (120, 75, N'BCS-6A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (121, 75, N'BCS-6B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (122, 75, N'BCS-6C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (123, 75, N'BCS-6D')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (124, 75, N'BIT-6A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (125, 75, N'BIT-6B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (126, 76, N'BAI-4A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (127, 76, N'BCS-4A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (128, 76, N'BCS-4B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (129, 76, N'BCS-4C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (130, 77, N'BAI-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (131, 77, N'BAI-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (132, 77, N'BCS-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (133, 77, N'BCS-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (134, 77, N'BCS-2C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (135, 77, N'BCS-2D')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (136, 77, N'BCS-2E')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (137, 77, N'BIT-6A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (138, 77, N'BIT-6B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (139, 77, N'BSSE-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (140, 77, N'BSSE-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (141, 78, N'BCS-8A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (142, 78, N'BCS-8B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (143, 78, N'BCS-8C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (144, 78, N'BIT-8A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (145, 78, N'BIT-8B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (146, 78, N'BIT-8C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (147, 79, N'BAI-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (148, 79, N'BAI-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (149, 79, N'BCS-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (150, 79, N'BCS-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (151, 79, N'BCS-2C')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (152, 79, N'BCS-2D')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (153, 79, N'BCS-2E')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (154, 79, N'BSSE-2A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (155, 79, N'BSSE-2B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (156, 80, N'BAI-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (157, 80, N'BCS-3A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (158, 81, N'BCS-5A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (159, 82, N'BIT-6A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (160, 82, N'BIT-6B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (161, 82, N'BIT-7A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (162, 83, N'BCS-5A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (163, 84, N'BCS-4A')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (164, 84, N'BCS-4B')
INSERT [dbo].[SECTION_OFFER] ([ID], [CourseOfferId], [Discipline]) VALUES (165, 84, N'BCS-4C')
SET IDENTITY_INSERT [dbo].[SECTION_OFFER] OFF
GO
SET IDENTITY_INSERT [dbo].[SESSION] ON 

INSERT [dbo].[SESSION] ([ID], [Name]) VALUES (1, N'Fall-2023')
SET IDENTITY_INSERT [dbo].[SESSION] OFF
GO
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'2019-ARID-2931', N'Abdul Sami', N'image_picker-982315689.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'2019-ARID-2945', N'Ali Husnain', N'image_picker1601870313.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'2019-ARID-2963', N'Ehsan Rafi', N'IMG_0690.jpeg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'2019-ARID-3015', N'Muhammad Arsalan Khan', N'IMG_E0817.JPG', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'2019-ARID-3040', N'Muhammad Osama Shakeel', N'IMG_0701.jpeg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'2019-ARID-3092', N'Saud Gul', N'IMG_0747.jpeg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'Ali123', N'Ali Kiyani', N'image_picker3370121879854342436.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'aliahmad123', N'Ali Ahmad', N'image_picker3697854668776368990.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'Baqir123', N'Baqir Ismail', N'image_picker9183926794617913683.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'Bashir123', N'M Bashir', N'image_picker5588996047235738448.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'Binyamin123', N'Binyamin', N'image_picker6222701847905744859.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'MSaadKamran123', N'Muhammad Saad', N'image_picker2041820021397949050.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'Muzamil123', N'Muhammad Muzamil', N'image_picker602227560103253536.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'Nazaid123', N'Nazaid', N'image_picker2616793540933660038.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'Roman123', N'Roman ', N'image_picker1357825165438949160.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'shahid123', N'M Shahid', N'image_picker4836423344263563662.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'umair123', N'M Umair', N'image_picker4828089175400742455.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'usama1234', N'Osama', N'image_picker7149004103217965685.jpg', N'123')
INSERT [dbo].[STUDENT] ([AridNo], [Name], [Image], [Password]) VALUES (N'Zia123', N'Ziaimdad', N'image_picker818577649273841634.jpg', N'123')
GO
SET IDENTITY_INSERT [dbo].[SWAPPING] ON 

INSERT [dbo].[SWAPPING] ([ID], [TimeTableIdFrom], [TimeTableIdTo], [Date], [Day], [StartTime], [EndTime], [Status]) VALUES (4, 895, 453, CAST(N'2023-06-05' AS Date), N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 0)
INSERT [dbo].[SWAPPING] ([ID], [TimeTableIdFrom], [TimeTableIdTo], [Date], [Day], [StartTime], [EndTime], [Status]) VALUES (5, 895, 448, CAST(N'2023-06-12' AS Date), N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 0)
INSERT [dbo].[SWAPPING] ([ID], [TimeTableIdFrom], [TimeTableIdTo], [Date], [Day], [StartTime], [EndTime], [Status]) VALUES (6, 633, 627, CAST(N'2023-06-21' AS Date), N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 0)
INSERT [dbo].[SWAPPING] ([ID], [TimeTableIdFrom], [TimeTableIdTo], [Date], [Day], [StartTime], [EndTime], [Status]) VALUES (7, 633, 627, CAST(N'2023-06-21' AS Date), N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 0)
SET IDENTITY_INSERT [dbo].[SWAPPING] OFF
GO
SET IDENTITY_INSERT [dbo].[TEACHERSLOTS] ON 

INSERT [dbo].[TEACHERSLOTS] ([ID], [TimeTableId], [Slot], [Status]) VALUES (351, 458, 1, N'Held')
INSERT [dbo].[TEACHERSLOTS] ([ID], [TimeTableId], [Slot], [Status]) VALUES (352, 459, 1, N'Held')
INSERT [dbo].[TEACHERSLOTS] ([ID], [TimeTableId], [Slot], [Status]) VALUES (353, 485, 1, N'Held')
INSERT [dbo].[TEACHERSLOTS] ([ID], [TimeTableId], [Slot], [Status]) VALUES (354, 456, 1, N'Held')
INSERT [dbo].[TEACHERSLOTS] ([ID], [TimeTableId], [Slot], [Status]) VALUES (359, 895, 1, N'Held')
INSERT [dbo].[TEACHERSLOTS] ([ID], [TimeTableId], [Slot], [Status]) VALUES (360, 896, 1, N'Late')
INSERT [dbo].[TEACHERSLOTS] ([ID], [TimeTableId], [Slot], [Status]) VALUES (367, 490, 2, N'Held')
SET IDENTITY_INSERT [dbo].[TEACHERSLOTS] OFF
GO
INSERT [dbo].[TempAttendance] ([AttendanceId], [StartTime], [EndTime], [Date], [Day], [TeacherName]) VALUES (14, CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'2023-06-14', N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[TempAttendance] ([AttendanceId], [StartTime], [EndTime], [Date], [Day], [TeacherName]) VALUES (6, CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'2023-06-13', N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[TempAttendance] ([AttendanceId], [StartTime], [EndTime], [Date], [Day], [TeacherName]) VALUES (26, CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'2023-06-14', N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[TempAttendance] ([AttendanceId], [StartTime], [EndTime], [Date], [Day], [TeacherName]) VALUES (9, CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'2023-06-13', N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[TempAttendance] ([AttendanceId], [StartTime], [EndTime], [Date], [Day], [TeacherName]) VALUES (37, CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'2023-06-14', N'Friday', N'Dr. Hassan,Waseem')
INSERT [dbo].[TempAttendance] ([AttendanceId], [StartTime], [EndTime], [Date], [Day], [TeacherName]) VALUES (12, CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), N'2023-06-13', N'Friday', N'Dr. Hassan,Waseem')
GO
INSERT [dbo].[TEMPORARY_TIMETABLE] ([TimeTableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (895, 1, 1, 1, 1)
INSERT [dbo].[TEMPORARY_TIMETABLE] ([TimeTableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (896, 1, 1, 0, 0)
INSERT [dbo].[TEMPORARY_TIMETABLE] ([TimeTableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (668, 1, 1, 0, 0)
INSERT [dbo].[TEMPORARY_TIMETABLE] ([TimeTableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (458, 0, 0, 1, 1)
INSERT [dbo].[TEMPORARY_TIMETABLE] ([TimeTableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (485, 0, 0, 1, 1)
INSERT [dbo].[TEMPORARY_TIMETABLE] ([TimeTableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (459, 0, 0, 1, 1)
INSERT [dbo].[TEMPORARY_TIMETABLE] ([TimeTableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (456, 0, 1, 1, 0)
INSERT [dbo].[TEMPORARY_TIMETABLE] ([TimeTableId], [StartRecord], [MidRecord], [EndRecord], [FullRecord]) VALUES (490, 1, 1, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[TIMETABLE] ON 

INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (448, N'ENG325', N'CPS', N'Naeem', N'BCS-2E', N'Lt3', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (449, N'MGT322', N'FA', N'Adeel', N'BAI-3A', N'Lt6', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (450, N'MTH201', N'PRECAG-II', N'Dr. Mohsin', N'BCS-1A,BAI-2A,BCS-2B,BSSE-1A', N'Lt4', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (451, N'CS423', N'OOP', N'Afrasiab', N'BCS-2C', N'Lt12', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (452, N'CS530', N'COAL', N'Azeem', N'BCS-4A', N'Lt1', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (453, N'CS566', N'WT', N'Sanam Mir', N'BCS-4C', N'Lab7', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (454, N'CS577', N'CN', N'Dr. Saeed', N'BCS-4B', N'Lt13', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (455, N'CS430', N'DLD', N'Noor', N'BCS-3A', N'Lt10', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (456, N'CS692', N'VP', N'Tahir', N'BCS-5A', N'Lab6', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (457, N'CS572', N'NA', N'Dr. Zeeshan', N'BCS-6A', N'Lt2', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (458, N'CS687', N'PDC', N'Umer', N'BCS-6B', N'Lt11', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (459, N'CS636', N'CC', N'Zahid', N'BCS-6D', N'Lt5', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (460, N'CS655', N'VSS', N'Waqar', N'BIT-6A', N'Lab2', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (461, N'CS632', N'AI', N'Dr. Sadaf,Rifhat', N'BAI-4A', N'Lab4', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (462, N'CS400', N'DBS', N'Abdul Rehman', N'BSSE-2A', N'Lab1', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (463, N'CS400', N'DBS', N'Tayyaba', N'BSSE-2B', N'Lt9', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (464, N'PHY403', N'AP', N'Ali', N'BSSE-1A', N'Lt4', N'Monday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (465, N'TOQ301', N'TOQ-I', N'Naeem Ullah', N'BCS-2C', N'Lt1', N'Monday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (466, N'MTH315', N'MVC', N'Irfan', N'BSSE-2B', N'Lt2', N'Monday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (467, N'CS400', N'DBS', N'Abdul Rehman', N'BCS-2E', N'Lab6', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (468, N'ENG315', N'TBW', N'Sumaira', N'BIT-8B', N'Lt9', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (469, N'CS430', N'DLD', N'Noor', N'BAI-3A', N'Lt12', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (470, N'TOQ301', N'TOQ-I', N'Naeem Ullah', N'BAI-2A', N'Lt1', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (471, N'MTH310', N'CAG', N'Irfan', N'BSSE-1A', N'Lt4', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (472, N'CS323', N'PF', N'Sadiqa', N'BCS-1A', N'Lab2', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (473, N'MTH315', N'MVC', N'Shahid Rasheed', N'BCS-2B', N'Lt13', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (474, N'CS423', N'OOP', N'Afrasiab,Waqar', N'BCS-2C', N'Lab1', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (475, N'CS577', N'CN', N'Dr. Saeed', N'BCS-4A', N'Lt7', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (476, N'CS577', N'CN', N'Hamza', N'BCS-4C', N'DLDLab', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (477, N'CS632', N'AI', N'Azhar', N'BCS-4B', N'Lt5', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (478, N'CS632', N'AI', N'Dr. Sadaf,Rifhat', N'BCS-3A', N'Lab3', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (479, N'PHY403', N'AP', N'Ali', N'BCS-1B', N'Lt3', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (480, N'SSH302', N'PS', N'M. Khalid', N'BCS-6A', N'Lt2', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (481, N'CS572', N'NA', N'Dr. Zeeshan', N'BCS-6B', N'Lt11', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (482, N'CS636', N'CC', N'Tehmima', N'BCS-6D', N'Lab7', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (483, N'CS423', N'OOP', N'Waseem', N'BAI-2B', N'Lab4', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (484, N'MTH435', N'LA', N'Dr. Mohsin', N'BAI-4A', N'Lt6', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (485, N'CS423', N'OOP', N'Noman', N'BSSE-2A', N'Lt8', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (486, N'ENG325', N'CPS', N'Naeem', N'BSSE-2B', N'Lt10', N'Monday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (487, N'STT500', N'STP', N'Qasim', N'BCS-2E', N'Lt13', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (488, N'CS443', N'DSA', N'Tahir', N'BAI-3A', N'Lab2', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (489, N'CS400', N'DBS', N'Tayyaba', N'BAI-2A', N'Lt8', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (490, N'CS335', N'DS', N'Amir', N'BSSE-1A', N'Lt4', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (491, N'PHY403', N'AP', N'Ali', N'BCS-1A', N'Lt2', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (492, N'CS400', N'DBS', N'Noman', N'BCS-2B', N'Lt5', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (493, N'ENG325', N'CPS', N'Asma', N'BCS-2C', N'Lt6', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (494, N'CS530', N'COAL', N'Azeem,Sadiqa', N'BCS-4A', N'Lab3', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (495, N'CS453', N'SE', N'Naveed', N'BCS-4C', N'Lt11', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (496, N'MTH435', N'LA', N'Dr. Mohsin,Waseem', N'BCS-3A', N'Lab7', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (497, N'CS692', N'VP', N'Azhar', N'BCS-5A', N'Lt1', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (498, N'MTH310', N'CAG', N'Irfan', N'BCS-1B', N'Lt3', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (499, N'CS687', N'PDC', N'Waqar', N'BCS-6A', N'Lab4', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (500, N'CS687', N'PDC', N'Sanam Mir', N'BCS-6D', N'Lab6', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (501, N'CS555', N'ITI', N'Shahid Abid', N'BIT-6A', N'Lt10', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (502, N'CS636', N'CC', N'Dr. Naseer', N'BCS-7A', N'Lt7', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (503, N'CS632', N'AI', N'Rifhat', N'BAI-4A', N'Lab1', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (504, N'TOQ301', N'TOQ-I', N'Naeem Ullah', N'BSSE-2A', N'Lt9', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (505, N'STT500', N'STP', N'Sadia', N'BSSE-2B', N'Lt12', N'Monday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (506, N'CS423', N'OOP', N'Waseem', N'BCS-2E', N'Lab4', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (507, N'ENG315', N'TBW', N'Sumaira', N'BIT-8C', N'Lt11', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (508, N'ENG305', N'EC', N'Asma', N'BCS-1A', N'Lt2', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (509, N'CS400', N'DBS', N'Noman,Abdul Rehman', N'BCS-2B', N'Lab1', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (510, N'MTH315', N'MVC', N'Shahid Rasheed', N'BCS-2C', N'Lt4', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (511, N'CS566', N'WT', N'Amir', N'BCS-4A', N'Lt7', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (512, N'CS530', N'COAL', N'Azeem', N'BCS-4C', N'Lt10', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (513, N'CS577', N'CN', N'Dr. Saeed,Hamza', N'BCS-4B', N'DLDLab', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (514, N'MTH435', N'LA', N'Dr. Mohsin', N'BCS-3A', N'Lt8', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (515, N'CS692', N'VP', N'Azhar,Tahir', N'BCS-5A', N'Lab2', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (516, N'CS323', N'PF', N'Sadiqa', N'BCS-1B', N'Lab7', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (517, N'CS636', N'CC', N'Dr. Naseer', N'BCS-6A', N'Lt3', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (518, N'SSH307', N'PP', N'Ihsan', N'BCS-6B', N'Lt6', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (519, N'CS572', N'NA', N'Dr. Zeeshan', N'BCS-6D', N'Lt13', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (520, N'SSH302', N'PS', N'M. Khalid', N'BIT-6A', N'Lt1', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (521, N'CS636', N'CC', N'Tehmima', N'BCS-7A', N'Lab6', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (522, N'TOQ301', N'TOQ-I', N'Naeem Ullah', N'BAI-2B', N'Lt12', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (523, N'CS453', N'SE', N'Naveed', N'BAI-4A', N'Lt5', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (524, N'STT500', N'STP', N'Qasim', N'BSSE-2A', N'Lt9', N'Monday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (525, N'CS423', N'OOP', N'ZerAfshan', N'BCS-2E', N'Lt5', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (526, N'MGT322', N'FA', N'Adeel', N'BAI-3A', N'Lt13', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (527, N'MTH310', N'CAG', N'Dr. Mohsin', N'BCS-1A', N'Lt2', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (528, N'CS400', N'DBS', N'Noman', N'BCS-2B', N'Lt10', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (529, N'TOQ301', N'TOQ-I', N'Naeem Ullah', N'BCS-2D', N'Lt7', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (530, N'CS577', N'CN', N'Hamza', N'BCS-4A', N'DLDLab', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (531, N'MTH435', N'LA', N'Shahid Rasheed,Waqar', N'BCS-4C', N'Lab2', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (532, N'CS632', N'AI', N'Waseem', N'BCS-4B', N'Lab4', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (533, N'CS632', N'AI', N'Rifhat', N'BCS-3A', N'Lab3', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (534, N'CS666', N'WE', N'Amir,Tehmima', N'BCS-5A', N'Lab6', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (535, N'CS323', N'PF', N'Dr. Munir', N'BCS-1B', N'Lt3', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (536, N'CS687', N'PDC', N'Umer', N'BCS-6A', N'Lt8', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (537, N'CS572', N'NA', N'Dr. Zeeshan', N'BCS-6B', N'Lt12', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (538, N'CS636', N'CC', N'Zahid', N'BCS-6C', N'Lt6', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (539, N'CS655', N'VSS', N'Afrasiab', N'BIT-7A', N'Lt1', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (540, N'CS497', N'INS', N'Dr. Qamar', N'BCS-7A', N'Lt9', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (541, N'ENG325', N'CPS', N'Naeem', N'BAI-2B', N'Lt11', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (542, N'CS632', N'AI', N'Dr. Sadaf', N'BAI-4A', N'Lt4', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (543, N'CS423', N'OOP', N'Abdul Rehman', N'BSSE-2A', N'Lab7', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (544, N'CS400', N'DBS', N'Tayyaba,Sanam Mir', N'BSSE-2B', N'Lab1', N'Tuesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (545, N'TOQ301', N'TOQ-I', N'Naeem Ullah', N'BCS-2E', N'Lt2', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (546, N'CS632', N'AI', N'Dr. Sadaf', N'BAI-3A', N'Lt4', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
GO
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (547, N'CS423', N'OOP', N'ZerAfshan', N'BAI-2A', N'Lt10', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (548, N'MTH201', N'PRECAG-I', N'Dr. Mohsin', N'BCS-1A,BSSE-1A', N'Lt7', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (549, N'CS423', N'OOP', N'Aftab', N'BCS-2B', N'Lt5', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (550, N'CS400', N'DBS', N'Abdul Rehman', N'BCS-2D', N'Lab6', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (551, N'CS577', N'CN', N'Dr. Saeed', N'BCS-4A', N'Lt13', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (552, N'MTH435', N'LA', N'Shahid Rasheed', N'BCS-4C', N'Lt6', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (553, N'CS530', N'COAL', N'Azeem', N'BCS-4B', N'Lt12', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (554, N'CS443', N'DSA', N'Tahir', N'BCS-3A', N'Lab4', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (555, N'CS601', N'DAM', N'Jannat', N'BCS-5A', N'Lab2', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (556, N'CS323', N'PF', N'Dr. Munir,Sadiqa', N'BCS-1B', N'Lab7', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (557, N'CS636', N'CC', N'Dr. Naseer', N'BCS-6A', N'Lt11', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (558, N'CS572', N'NA', N'Rifhat', N'BCS-6C', N'Lab3', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (559, N'CS555', N'ITI', N'Shahid Abid', N'BIT-6B', N'Lt8', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (560, N'CS400', N'DBS', N'Amir', N'BAI-2B', N'Lt1', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (561, N'CS577', N'CN', N'Hamza', N'BAI-4A', N'DLDLab', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (562, N'ENG325', N'CPS', N'Naeem', N'BSSE-2A', N'Lt3', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (563, N'CS423', N'OOP', N'Noman', N'BSSE-2B', N'Lt9', N'Tuesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (564, N'ENG315', N'TBW', N'Sumaira', N'BIT-8A', N'Lt6', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (565, N'CS430', N'DLD', N'Noor,Hamza', N'BAI-3A', N'DLDLab', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (566, N'CS400', N'DBS', N'Noman', N'BCS-2A', N'Lt2', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (567, N'ENG325', N'CPS', N'Naeem', N'BAI-2A', N'Lt7', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (568, N'CS323', N'PF', N'Dr. Munir', N'BSSE-1A', N'Lt4', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (569, N'CS423', N'OOP', N'Aftab,Tahir', N'BCS-2B', N'Lab4', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (570, N'MTH315', N'MVC', N'Shahid Rasheed', N'BCS-2D', N'Lt5', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (571, N'CS566', N'WT', N'Amir,Tehmima', N'BCS-4A', N'Lab1', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (572, N'CS632', N'AI', N'Waseem', N'BCS-4C', N'Lab7', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (573, N'MGT322', N'FA', N'Adeel', N'BCS-3A', N'Lt10', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (574, N'CS601', N'DAM', N'Jannat', N'BCS-5A', N'Lt1', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (575, N'CS335', N'DS', N'Maryam', N'BCS-1B', N'Lt3', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (576, N'CS572', N'NA', N'Dr. Zeeshan,Rifhat', N'BCS-6A', N'Lab6', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (577, N'SSH307', N'PP', N'Ihsan', N'BCS-6B', N'Lt8', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (578, N'CS655', N'VSS', N'Waqar', N'BIT-6B', N'Lab2', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (579, N'CS636', N'CC', N'Dr. Naseer', N'BCS-7A', N'Lt11', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (580, N'STT500', N'STP', N'Sadia', N'BAI-2B', N'Lt13', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (581, N'MTH435', N'LA', N'Dr. Mohsin,Abdul Rehman', N'BAI-4A', N'Lab3', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (582, N'MTH315', N'MVC', N'Irfan', N'BSSE-2A', N'Lt9', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (583, N'TOQ301', N'TOQ-I', N'Naeem Ullah', N'BSSE-2B', N'Lt12', N'Tuesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (584, N'MTH315', N'MVC', N'Irfan', N'BCS-2E', N'Lt12', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (585, N'MTH435', N'LA', N'Shahid Rasheed', N'BAI-3A', N'Lt7', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (586, N'CS423', N'OOP', N'Aftab', N'BCS-2A', N'Lt4', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (587, N'CS423', N'OOP', N'Abdul Rehman', N'BAI-2A', N'Lab7', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (588, N'CS323', N'PF', N'Waseem', N'BSSE-1A', N'Lab4', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (589, N'ENG305', N'EC', N'Asma', N'BCS-1A', N'Lt2', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (590, N'CS423', N'OOP', N'Tahir', N'BCS-2B', N'Lab3', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (591, N'CS530', N'COAL', N'Azeem', N'BCS-4A', N'Lt6', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (592, N'CS632', N'AI', N'Azhar', N'BCS-4C', N'Lt5', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (593, N'CS577', N'CN', N'Dr. Saeed', N'BCS-4B', N'Lt8', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (594, N'CS430', N'DLD', N'Hamza', N'BCS-3A', N'DLDLab', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (595, N'CS666', N'WE', N'Amir', N'BCS-5A', N'Lt1', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (596, N'CS636', N'CC', N'Dr. Naseer,Tehmima', N'BCS-6A', N'Lab1', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (597, N'CS572', N'NA', N'Rifhat', N'BCS-6B', N'Lab2', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (598, N'STT500', N'STP', N'Sadia', N'BIT-6B', N'Lt13', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (599, N'CS698', N'FYP-I', N'Naveed', N'BIT-7A', N'Lt11', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (600, N'CS423', N'OOP', N'ZerAfshan', N'BAI-2B', N'Lt10', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (601, N'CS530', N'COAL', N'Sadiqa', N'BAI-4A', N'Lab6', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (602, N'CS423', N'OOP', N'Noman', N'BSSE-2A', N'Lt9', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (603, N'CS400', N'DBS', N'Tayyaba', N'BSSE-2B', N'Lt3', N'Tuesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (604, N'CS443', N'DSA', N'Dr. Munir,Tahir', N'BAI-3A', N'Lab7', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (605, N'CS400', N'DBS', N'Noman,Sanam Mir', N'BCS-2A', N'Lab1', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (606, N'STT500', N'STP', N'Sadia', N'BAI-2A', N'Lt13', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (607, N'TOQ301', N'TOQ-I', N'Naeem Ullah', N'BCS-2B', N'Lt4', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (608, N'CS423', N'OOP', N'Waseem', N'BCS-2D', N'Lab6', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (609, N'CS577', N'CN', N'Dr. Saeed,Hamza', N'BCS-4A', N'DLDLab', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (610, N'CS530', N'COAL', N'Azeem', N'BCS-4C', N'Lt6', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (611, N'MTH435', N'LA', N'Shahid Rasheed', N'BCS-4B', N'Lt5', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (612, N'MGT411', N'ITM', N'Ihsan', N'BCS-3A', N'Lt7', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (613, N'CS692', N'VP', N'Azhar', N'BCS-5A', N'Lt1', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (614, N'CS572', N'NA', N'Dr. Zeeshan', N'BCS-6A', N'Lt9', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (615, N'CS687', N'PDC', N'Waqar', N'BCS-6B', N'Lab3', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (616, N'SSH302', N'PS', N'M. Khalid', N'BIT-6B', N'Lt2', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (617, N'CS636', N'CC', N'Dr. Naseer,Tehmima', N'BCS-7A', N'Lab4', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (618, N'ENG315', N'TBW', N'Sumaira', N'BCS-8A', N'Lt12', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (619, N'ENG315', N'TBW', N'Asma', N'BCS-8C', N'Lt10', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (620, N'MTH315', N'MVC', N'Irfan', N'BAI-2B', N'Lt3', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (621, N'CS400', N'DBS', N'Tayyaba', N'BSSE-2A', N'Lt11', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (622, N'CS423', N'OOP', N'Abdul Rehman', N'BSSE-2B', N'Lab2', N'Tuesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (623, N'CS400', N'DBS', N'Ahsan,Abdul Rehman', N'BCS-2E', N'Lab6', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (624, N'CS443', N'DSA', N'Dr. Munir', N'BAI-3A', N'Lt10', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (625, N'CS423', N'OOP', N'Tahir', N'BCS-2A', N'Lab4', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (626, N'MTH201', N'PRECAG-II', N'Dr. Mohsin', N'BCS-1A,BAI-2A,BCS-2B,BSSE-1A', N'Lt11', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (627, N'STT500', N'STP', N'Qasim', N'BCS-2C', N'Lt13', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (628, N'CS423', N'OOP', N'Noman,Waseem', N'BCS-2D', N'Lab1', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (629, N'CS453', N'SE', N'Maryam', N'BCS-4A', N'Lt8', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (630, N'MTH435', N'LA', N'Shahid Rasheed', N'BCS-4C', N'Lt7', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (631, N'CS566', N'WT', N'Amir', N'BCS-4B', N'Lt4', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (632, N'TOQ302', N'TOQ-II', N'Naeem Ullah', N'BCS-3A', N'Lt2', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (633, N'SSH307', N'PP', N'Adeel', N'BCS-5A', N'Lt1', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (634, N'IS302', N'IS', N'M. Shabir', N'BCS-6A', N'Lt3', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (635, N'CS687', N'PDC', N'Sadiqa', N'BCS-6C', N'Lab7', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (636, N'CS636', N'CC', N'Zahid', N'BCS-6D', N'Lt5', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (637, N'CS597', N'CSC', N'Noor', N'BIT-6A', N'Lt9', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (638, N'CS655', N'VSS', N'Afrasiab,Waqar', N'BIT-7A', N'Lab2', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (639, N'CS632', N'AI', N'Dr. Sadaf', N'BAI-4A', N'Lt12', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (640, N'CS400', N'DBS', N'Tayyaba', N'BSSE-2A', N'Lt6', N'Wednesday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (641, N'CS423', N'OOP', N'ZerAfshan', N'BCS-2E', N'Lt13', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (642, N'TOQ302', N'TOQ-II', N'Naeem Ullah', N'BAI-3A', N'Lt7', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (643, N'CS400', N'DBS', N'Noman', N'BCS-2A', N'Lt10', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (644, N'CS400', N'DBS', N'Tayyaba,Sanam Mir', N'BAI-2A', N'Lab3', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (645, N'CS335', N'DS', N'Amir', N'BSSE-1A', N'Lt4', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (646, N'CS335', N'DS', N'Maryam', N'BCS-1A', N'Lt2', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
GO
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (647, N'ENG325', N'CPS', N'Naeem', N'BCS-2D', N'Lt12', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (648, N'MTH435', N'LA', N'Shahid Rasheed', N'BCS-4A', N'Lt11', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (649, N'CS577', N'CN', N'Hamza', N'BCS-4B', N'DLDLab', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (650, N'MTH435', N'LA', N'Dr. Mohsin', N'BCS-3A', N'Lt6', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (651, N'CS601', N'DAM', N'Jannat', N'BCS-5A', N'Lt1', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (652, N'CS323', N'PF', N'Dr. Munir', N'BCS-1B', N'Lt3', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (653, N'SSH307', N'PP', N'Adeel', N'BCS-6A', N'Lt8', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (654, N'IS302', N'IS', N'M. Shabir', N'BCS-6C', N'Lt5', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (655, N'CS687', N'PDC', N'Shahid Jamil,Sadiqa', N'BIT-6A', N'Lab6', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (656, N'CS597', N'CSC', N'Noor', N'BIT-6B', N'Lt9', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (657, N'CS693', N'MAP', N'Aftab', N'react-native', N'Lab7', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (658, N'CS693', N'MAP', N'Umer', N'Flutter', N'Lab4', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (659, N'CS404', N'ML', N'Dr. Hassan,Tahir', N'BAI-4A', N'Lab1', N'Wednesday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (660, N'CS423', N'OOP', N'ZerAfshan,Waseem', N'BCS-2E', N'Lab3', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (661, N'CS632', N'AI', N'Dr. Sadaf,Rifhat', N'BAI-3A', N'Lab6', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (662, N'TOQ301', N'TOQ-I', N'Naeem Ullah', N'BCS-2A', N'Lt1', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (663, N'MTH315', N'MVC', N'Irfan', N'BAI-2A', N'Lt10', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (664, N'ENG305', N'EC', N'Naeem', N'BSSE-1A', N'Lt4', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (665, N'CS323', N'PF', N'Dr. Munir', N'BCS-1A', N'Lt2', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (666, N'CS400', N'DBS', N'Ahsan', N'BCS-2C', N'Lt5', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (667, N'CS423', N'OOP', N'Noman', N'BCS-2D', N'Lt13', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (668, N'CS632', N'AI', N'Dr. Hassan', N'BCS-4A', N'Lt11', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (669, N'CS577', N'CN', N'Dr. Saeed', N'BCS-4C', N'Lt9', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (670, N'MTH435', N'LA', N'Shahid Rasheed', N'BCS-4B', N'Lt7', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (671, N'CS430', N'DLD', N'Noor,Hamza', N'BCS-3A', N'DLDLab', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (672, N'CS601', N'DAM', N'Jannat', N'BCS-5A', N'Lab1', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (673, N'CS335', N'DS', N'Maryam', N'BCS-1B', N'Lt3', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (674, N'CS572', N'NA', N'Dr. Zeeshan', N'BCS-6C', N'Lt6', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (675, N'CS693', N'MAP', N'Aftab', N'react-native', N'Lab7', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (676, N'CS693', N'MAP', N'Umer,Waqar', N'Flutter', N'Lab4', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (677, N'MTH435', N'LA', N'Dr. Mohsin', N'BAI-4A', N'Lt12', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (678, N'STT500', N'STP', N'Qasim', N'BSSE-2A', N'Lt8', N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (679, N'CS400', N'DBS', N'Ahsan', N'BCS-2E', N'Lt5', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (680, N'MTH435', N'LA', N'Shahid Rasheed', N'BAI-3A', N'Lt12', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (681, N'CS400', N'DBS', N'Sanam Mir', N'BCS-2A', N'Lab4', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (682, N'STT500', N'STP', N'Sadia', N'BAI-2A', N'Lt13', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (683, N'MTH310', N'CAG', N'Irfan', N'BSSE-1A', N'Lt4', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (684, N'MTH310', N'CAG', N'Dr. Mohsin', N'BCS-1A', N'Lt2', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (685, N'CS423', N'OOP', N'Afrasiab', N'BCS-2C', N'Lt1', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (686, N'CS566', N'WT', N'Amir', N'BCS-4A', N'Lt7', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (687, N'CS577', N'CN', N'Dr. Saeed,Hamza', N'BCS-4C', N'DLDLab', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (688, N'CS632', N'AI', N'Azhar', N'BCS-4B', N'Lt11', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (689, N'CS443', N'DSA', N'ZerAfshan,Tahir', N'BCS-3A', N'Lab7', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (690, N'CS632', N'AI', N'Waseem', N'BCS-5A', N'Lab1', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (691, N'ENG305', N'EC', N'Asma', N'BCS-1B', N'Lt3', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (692, N'CS572', N'NA', N'Rifhat', N'BCS-6A', N'Lab2', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (693, N'CS636', N'CC', N'Zahid,Tehmima', N'BCS-6C', N'Lab6', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (694, N'CS687', N'PDC', N'Umer', N'BCS-6D', N'Lt6', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (695, N'CS687', N'PDC', N'Shahid Jamil', N'BIT-6A', N'Lt10', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (696, N'CS555', N'ITI', N'Shahid Abid', N'BIT-7A', N'Lt9', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (697, N'CS404', N'ML', N'Dr. Hassan', N'BAI-4A', N'Lt8', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (698, N'CS400', N'DBS', N'Tayyaba,Abdul Rehman', N'BSSE-2A', N'Lab3', N'Wednesday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (699, N'MGT411', N'ITM', N'Ihsan', N'BAI-3A', N'Lt13', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (700, N'ENG325', N'CPS', N'Asma', N'BCS-2A', N'Lt8', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (701, N'CS400', N'DBS', N'Tayyaba', N'BAI-2A', N'Lt10', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (702, N'MTH201', N'PRECAG-I', N'Dr. Mohsin', N'BCS-1A,BSSE-1A', N'Lt4', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (703, N'STT500', N'STP', N'Qasim', N'BCS-2D', N'Lt7', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (704, N'MTH435', N'LA', N'Shahid Rasheed', N'BCS-4A', N'Lt6', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (705, N'CS530', N'COAL', N'Hamza', N'BCS-4C', N'Lab4', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (706, N'CS632', N'AI', N'Azhar,Waseem', N'BCS-4B', N'Lab6', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (707, N'CS443', N'DSA', N'ZerAfshan', N'BCS-3A', N'Lt3', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (708, N'CS632', N'AI', N'Dr. Hassan', N'BCS-5A', N'Lt1', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (709, N'CS636', N'CC', N'Tehmima', N'BCS-6A', N'Lab3', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (710, N'SSH302', N'PS', N'M. Khalid', N'BCS-6C', N'Lt2', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (711, N'CS572', N'NA', N'Dr. Zeeshan', N'BCS-6D', N'Lt11', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (712, N'STT500', N'STP', N'Sadia', N'BIT-6A', N'Lt12', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (713, N'CS687', N'PDC', N'Shahid Jamil', N'BIT-6B', N'Lt9', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (714, N'CS693', N'MAP', N'Waqar', N'Flutter', N'Lab2', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (715, N'CS577', N'CN', N'Shahid Abid', N'BAI-4A', N'Lt5', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (716, N'CS423', N'OOP', N'Noman,Abdul Rehman', N'BSSE-2A', N'Lab7', N'Wednesday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (717, N'CS443', N'DSA', N'Dr. Munir', N'BAI-3A', N'Lt10', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (718, N'ENG325', N'CPS', N'Asma', N'BCS-2A', N'Lt12', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (719, N'CS335', N'DS', N'Maryam', N'BCS-1A', N'Lt2', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (720, N'CS423', N'OOP', N'Aftab', N'BCS-2B', N'Lt7', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (721, N'CS400', N'DBS', N'Ahsan,Abdul Rehman', N'BCS-2C', N'Lab6', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (722, N'CS423', N'OOP', N'Noman', N'BCS-2D', N'Lt8', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (723, N'MTH435', N'LA', N'Shahid Rasheed,Tahir', N'BCS-4A', N'Lab1', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (724, N'CS566', N'WT', N'Amir', N'BCS-4C', N'Lt9', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (725, N'CS453', N'SE', N'Naveed', N'BCS-4B', N'Lt11', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (726, N'CS632', N'AI', N'Dr. Sadaf', N'BCS-3A', N'Lt6', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (727, N'SSH307', N'PP', N'Adeel', N'BCS-5A', N'Lt1', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (728, N'CS687', N'PDC', N'Umer,Waqar', N'BCS-6A', N'Lab7', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (729, N'IS302', N'IS', N'M. Shabir', N'BCS-6B', N'Lt4', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (730, N'CS636', N'CC', N'Zahid', N'BCS-6C', N'Lt5', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (731, N'CS572', N'NA', N'Dr. Zeeshan,Rifhat', N'BCS-6D', N'Lab4', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (732, N'CS555', N'ITI', N'Shahid Abid', N'BIT-6B', N'Lt3', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (733, N'CS497', N'INS', N'Dr. Qamar', N'BCS-7A', N'Lt13', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (734, N'CS530', N'COAL', N'Azeem,Sadiqa', N'BAI-4A', N'Lab2', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (735, N'CS400', N'DBS', N'Sanam Mir', N'BSSE-2B', N'Lab3', N'Thursday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (736, N'ENG315', N'TBW', N'Sumaira', N'BIT-8C', N'Lt10', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (737, N'CS632', N'AI', N'Dr. Sadaf', N'BAI-3A', N'Lt9', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (738, N'CS423', N'OOP', N'Aftab,Tahir', N'BCS-2A', N'Lab7', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (739, N'PHY403', N'AP', N'Ali', N'BSSE-1A', N'Lt4', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (740, N'CS323', N'PF', N'Dr. Munir,Sadiqa', N'BCS-1A', N'Lab6', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (741, N'STT500', N'STP', N'Qasim', N'BCS-2C', N'Lt8', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (742, N'ENG325', N'CPS', N'Naeem', N'BCS-2D', N'Lt2', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (743, N'CS530', N'COAL', N'Azeem,Hamza', N'BCS-4C', N'Lab3', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (744, N'CS566', N'WT', N'Amir', N'BCS-4B', N'Lt7', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (745, N'MGT411', N'ITM', N'Ihsan', N'BCS-3A', N'Lt12', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (746, N'CS542', N'AA', N'Maryam', N'BCS-5A', N'Lt1', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
GO
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (747, N'SSH307', N'PP', N'Adeel', N'BCS-6A', N'Lt11', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (748, N'CS636', N'CC', N'Zahid', N'BCS-6B', N'Lt6', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (749, N'CS687', N'PDC', N'Umer', N'BCS-6C', N'Lt13', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (750, N'IS302', N'IS', N'M. Shabir', N'BCS-6D', N'Lt3', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (751, N'CS655', N'VSS', N'Afrasiab', N'BIT-6A', N'Lt5', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (752, N'CS687', N'PDC', N'Shahid Jamil,Waqar', N'BIT-6B', N'Lab1', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (753, N'CS423', N'OOP', N'ZerAfshan,Waseem', N'BAI-2B', N'Lab4', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (754, N'CS423', N'OOP', N'Noman,Abdul Rehman', N'BSSE-2B', N'Lab2', N'Thursday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (755, N'CS430', N'DLD', N'Noor', N'BAI-3A', N'Lt7', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (756, N'STT500', N'STP', N'Qasim', N'BCS-2A', N'Lt13', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (757, N'ENG305', N'EC', N'Naeem', N'BSSE-1A', N'Lt4', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (758, N'CS323', N'PF', N'Dr. Munir', N'BCS-1A', N'Lt2', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (759, N'ENG325', N'CPS', N'Asma', N'BCS-2B', N'Lt6', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (760, N'CS400', N'DBS', N'Ahsan', N'BCS-2C', N'Lt5', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (761, N'MTH315', N'MVC', N'Shahid Rasheed', N'BCS-2D', N'Lt8', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (762, N'CS632', N'AI', N'Dr. Hassan,Waseem', N'BCS-4A', N'Lab7', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (763, N'CS566', N'WT', N'Amir,Sanam Mir', N'BCS-4B', N'Lab1', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (764, N'PHY403', N'AP', N'Ali', N'BCS-1B', N'Lt3', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (765, N'SSH307', N'PP', N'Ihsan', N'BCS-6C', N'Lt10', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (766, N'CS572', N'NA', N'Rifhat', N'BCS-6D', N'Lab4', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (767, N'CS655', N'VSS', N'Afrasiab', N'BIT-6B', N'Lt11', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (768, N'CS693', N'MAP', N'Aftab,Tahir', N'react-native', N'Lab3', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (769, N'CS693', N'MAP', N'Umer', N'Flutter', N'Lab6', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (770, N'CS423', N'OOP', N'ZerAfshan', N'BAI-2B', N'Lt1', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (771, N'CS530', N'COAL', N'Azeem', N'BAI-4A', N'Lt12', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (772, N'MTH315', N'MVC', N'Irfan', N'BSSE-2B', N'Lt9', N'Thursday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (773, N'ENG315', N'TBW', N'Sumaira', N'BIT-8B', N'Lt12', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (774, N'MTH435', N'LA', N'Shahid Rasheed,Abdul Rehman', N'BAI-3A', N'Lab1', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (775, N'CS423', N'OOP', N'Aftab', N'BCS-2A', N'Lt9', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (776, N'CS323', N'PF', N'Dr. Munir', N'BSSE-1A', N'Lt4', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (777, N'PHY403', N'AP', N'Ali', N'BCS-1A', N'Lt2', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (778, N'STT500', N'STP', N'Qasim', N'BCS-2B', N'Lt13', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (779, N'CS400', N'DBS', N'Ahsan', N'BCS-2D', N'Lt1', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (780, N'CS632', N'AI', N'Waseem', N'BCS-4A', N'Lab6', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (781, N'CS577', N'CN', N'Dr. Saeed', N'BCS-4C', N'Lt11', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (782, N'CS530', N'COAL', N'Azeem,Sadiqa', N'BCS-4B', N'Lab4', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (783, N'MTH310', N'CAG', N'Irfan', N'BCS-1B', N'Lt3', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (784, N'CS687', N'PDC', N'Umer', N'BCS-6A', N'Lt7', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (785, N'CS636', N'CC', N'Tehmima', N'BCS-6B', N'Lab3', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (786, N'CS687', N'PDC', N'Shahid Jamil', N'BIT-6A', N'Lt8', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (787, N'CS655', N'VSS', N'Afrasiab,Waqar', N'BIT-6B', N'Lab7', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (788, N'CS693', N'MAP', N'Tahir', N'react-native', N'Lab2', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (789, N'ENG315', N'TBW', N'Asma', N'BCS-8B', N'Lt10', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (790, N'CS400', N'DBS', N'Amir', N'BAI-2B', N'Lt6', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (791, N'CS404', N'ML', N'Dr. Hassan', N'BAI-4A', N'Lt5', N'Thursday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (792, N'MTH315', N'MVC', N'Shahid Rasheed', N'BCS-2A', N'Lt4', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (793, N'CS323', N'PF', N'Dr. Munir,Waseem', N'BSSE-1A', N'Lab6', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (794, N'CS400', N'DBS', N'Abdul Rehman', N'BCS-2B', N'Lab3', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (795, N'CS423', N'OOP', N'Waqar', N'BCS-2C', N'Lab2', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (796, N'CS632', N'AI', N'Dr. Hassan', N'BCS-4A', N'Lt6', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (797, N'CS632', N'AI', N'Azhar', N'BCS-4C', N'Lt8', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (798, N'CS566', N'WT', N'Sanam Mir', N'BCS-4B', N'Lab7', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (799, N'CS666', N'WE', N'Amir', N'BCS-5A', N'Lt1', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (800, N'ENG305', N'EC', N'Asma', N'BCS-1B', N'Lt3', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (801, N'SSH302', N'PS', N'M. Khalid', N'BCS-6B', N'Lt13', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (802, N'CS687', N'PDC', N'Umer,Sadiqa', N'BCS-6C', N'Lab4', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (803, N'SSH307', N'PP', N'Ihsan', N'BCS-6D', N'Lt12', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (804, N'CS555', N'ITI', N'Shahid Abid', N'BIT-6A', N'Lt10', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (805, N'CS687', N'PDC', N'Shahid Jamil', N'BIT-6B', N'Lt2', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (806, N'CS655', N'VSS', N'Afrasiab', N'BIT-7A', N'Lt9', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (807, N'CS698', N'FYP-I', N'Naveed', N'BCS-7A', N'Lt11', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (808, N'MTH315', N'MVC', N'Irfan', N'BAI-2B', N'Lt7', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (809, N'CS404', N'ML', N'Tahir', N'BAI-4A', N'Lab1', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (810, N'CS423', N'OOP', N'Noman', N'BSSE-2B', N'Lt5', N'Thursday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (811, N'CS400', N'DBS', N'Ahsan', N'BCS-2E', N'Lt2', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (812, N'CS430', N'DLD', N'Hamza', N'BAI-3A', N'DLDLab', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (813, N'CS423', N'OOP', N'ZerAfshan,Abdul Rehman', N'BAI-2A', N'Lab1', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (814, N'MTH315', N'MVC', N'Shahid Rasheed', N'BCS-2C', N'Lt7', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (815, N'STT500', N'STP', N'Qasim', N'BCS-2D', N'Lt3', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (816, N'CS566', N'WT', N'Tehmima', N'BCS-4A', N'Lab7', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (817, N'CS632', N'AI', N'Azhar,Waseem', N'BCS-4C', N'Lab3', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (818, N'CS530', N'COAL', N'Sadiqa', N'BCS-4B', N'Lab4', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (819, N'CS430', N'DLD', N'Noor', N'BCS-3A', N'Lt4', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (820, N'CS542', N'AA', N'Maryam', N'BCS-5A', N'Lt1', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (821, N'CS636', N'CC', N'Zahid', N'BCS-6B', N'Lt5', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (822, N'CS572', N'NA', N'Dr. Zeeshan,Rifhat', N'BCS-6C', N'Lab2', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (823, N'CS687', N'PDC', N'Umer', N'BCS-6D', N'Lt8', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (824, N'CS655', N'VSS', N'Afrasiab', N'BIT-6A', N'Lt9', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (825, N'CS555', N'ITI', N'Shahid Abid', N'BIT-7A', N'Lt10', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (826, N'ENG315', N'TBW', N'Asma', N'BCS-8B', N'Lt13', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (827, N'CS400', N'DBS', N'Amir,Sanam Mir', N'BAI-2B', N'Lab6', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (828, N'CS453', N'SE', N'Naveed', N'BAI-4A', N'Lt11', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (829, N'ENG325', N'CPS', N'Naeem', N'BSSE-2A', N'Lt6', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (830, N'STT500', N'STP', N'Sadia', N'BSSE-2B', N'Lt12', N'Friday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (831, N'MGT411', N'ITM', N'Ihsan', N'BAI-3A', N'Lt12', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (832, N'CS423', N'OOP', N'ZerAfshan', N'BAI-2A', N'Lt2', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (833, N'STT500', N'STP', N'Qasim', N'BCS-2B', N'Lt5', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (834, N'CS400', N'DBS', N'Ahsan', N'BCS-2D', N'Lt8', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (835, N'CS530', N'COAL', N'Sadiqa', N'BCS-4A', N'Lab3', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (836, N'CS566', N'WT', N'Amir,Sanam Mir', N'BCS-4C', N'Lab6', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (837, N'MTH435', N'LA', N'Shahid Rasheed,Abdul Rehman', N'BCS-4B', N'Lab2', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (838, N'CS632', N'AI', N'Dr. Sadaf', N'BCS-3A', N'Lt13', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (839, N'CS632', N'AI', N'Dr. Hassan', N'BCS-5A', N'Lt1', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (840, N'CS572', N'NA', N'Dr. Zeeshan,Rifhat', N'BCS-6B', N'Lab7', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (841, N'CS687', N'PDC', N'Umer', N'BCS-6C', N'Lt11', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (842, N'CS636', N'CC', N'Zahid,Tehmima', N'BCS-6D', N'Lab1', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (843, N'CS597', N'CSC', N'Noor', N'BIT-6A', N'Lt10', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (844, N'CS655', N'VSS', N'Afrasiab', N'BIT-6B', N'Lt7', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (845, N'CS655', N'VSS', N'Waqar', N'BIT-7A', N'Lab4', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (846, N'ENG315', N'TBW', N'Asma', N'BCS-8C', N'Lt4', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
GO
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (847, N'ENG325', N'CPS', N'Naeem', N'BAI-2B', N'Lt6', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (848, N'CS577', N'CN', N'Shahid Abid', N'BAI-4A', N'Lt3', N'Friday', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (849, N'STT500', N'STP', N'Qasim', N'BCS-2E', N'Lt8', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (850, N'CS632', N'AI', N'Rifhat', N'BAI-3A', N'Lab6', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (851, N'MTH315', N'MVC', N'Shahid Rasheed', N'BCS-2A', N'Lt3', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (852, N'MTH315', N'MVC', N'Irfan', N'BAI-2A', N'Lt7', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (853, N'ENG325', N'CPS', N'Asma', N'BCS-2C', N'Lt4', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (854, N'CS400', N'DBS', N'Ahsan,Abdul Rehman', N'BCS-2D', N'Lab3', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (855, N'CS453', N'SE', N'Maryam', N'BCS-4A', N'Lt9', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (856, N'CS566', N'WT', N'Amir', N'BCS-4C', N'Lt5', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (857, N'CS530', N'COAL', N'Azeem', N'BCS-4B', N'Lt2', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (858, N'MGT322', N'FA', N'Adeel', N'BCS-3A', N'Lt13', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (859, N'CS632', N'AI', N'Dr. Hassan,Waseem', N'BCS-5A', N'Lab2', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (860, N'CS636', N'CC', N'Zahid,Tehmima', N'BCS-6B', N'Lab1', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (861, N'CS572', N'NA', N'Dr. Zeeshan', N'BCS-6C', N'Lt11', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (862, N'CS687', N'PDC', N'Umer,Sanam Mir', N'BCS-6D', N'Lab4', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (863, N'CS655', N'VSS', N'Afrasiab,Waqar', N'BIT-6A', N'Lab7', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (864, N'CS597', N'CSC', N'Noor', N'BIT-6B', N'Lt10', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (865, N'ENG315', N'TBW', N'Sumaira', N'BCS-8A', N'Lt6', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (866, N'STT500', N'STP', N'Sadia', N'BAI-2B', N'Lt12', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (867, N'CS577', N'CN', N'Shahid Abid,Hamza', N'BAI-4A', N'DLDLab', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (868, N'ENG325', N'CPS', N'Naeem', N'BSSE-2B', N'Lt1', N'Friday', CAST(N'11:30:00' AS Time), CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (869, N'ENG325', N'CPS', N'Naeem', N'BCS-2E', N'Lt10', N'Friday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (870, N'CS400', N'DBS', N'Sanam Mir', N'BAI-2A', N'Lab1', N'Friday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (871, N'ENG325', N'CPS', N'Asma', N'BCS-2B', N'Lt7', N'Friday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (872, N'CS400', N'DBS', N'Abdul Rehman', N'BCS-2C', N'Lab2', N'Friday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (873, N'CS453', N'SE', N'Naveed', N'BCS-4B', N'Lt11', N'Friday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (874, N'CS443', N'DSA', N'ZerAfshan', N'BCS-3A', N'Lt5', N'Friday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (875, N'CS687', N'PDC', N'Umer', N'BCS-6B', N'Lt2', N'Friday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (876, N'CS636', N'CC', N'Tehmima', N'BCS-6C', N'Lab6', N'Friday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (877, N'SSH307', N'PP', N'Ihsan', N'BCS-6D', N'Lt6', N'Friday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (878, N'STT500', N'STP', N'Sadia', N'BIT-6A', N'Lt13', N'Friday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (879, N'CS687', N'PDC', N'Waqar', N'BIT-6B', N'Lab7', N'Friday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (880, N'CS530', N'COAL', N'Azeem', N'BAI-4A', N'Lt8', N'Friday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (881, N'MTH315', N'MVC', N'Irfan', N'BSSE-2A', N'Lt1', N'Friday', CAST(N'01:30:00' AS Time), CAST(N'03:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (882, N'MTH315', N'MVC', N'Irfan', N'BCS-2E', N'Lt4', N'Friday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (883, N'ENG315', N'TBW', N'Sumaira', N'BIT-8A', N'Lt12', N'Friday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (884, N'STT500', N'STP', N'Qasim', N'BCS-2A', N'Lt2', N'Friday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (885, N'ENG325', N'CPS', N'Naeem', N'BAI-2A', N'Lt10', N'Friday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (886, N'MTH315', N'MVC', N'Shahid Rasheed', N'BCS-2B', N'Lt5', N'Friday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (887, N'CS453', N'SE', N'Naveed', N'BCS-4C', N'Lt11', N'Friday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (888, N'CS666', N'WE', N'Tehmima', N'BCS-5A', N'Lab6', N'Friday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (889, N'CS687', N'PDC', N'Umer,Waqar', N'BCS-6B', N'Lab2', N'Friday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (890, N'SSH307', N'PP', N'Ihsan', N'BCS-6C', N'Lt3', N'Friday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (891, N'SSH302', N'PS', N'M. Khalid', N'BCS-6D', N'Lt1', N'Friday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (892, N'CS687', N'PDC', N'Sadiqa', N'BIT-6A', N'Lab1', N'Friday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (893, N'STT500', N'STP', N'Sadia', N'BIT-6B', N'Lt13', N'Friday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (894, N'CS400', N'DBS', N'Sanam Mir', N'BAI-2B', N'Lab7', N'Friday', CAST(N'03:00:00' AS Time), CAST(N'04:30:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (895, N'ENG325', N'CPS', N'Abdul Sami', N'BCS-8B', N'Lt3', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[TIMETABLE] ([ID], [CourseCode], [CourseName], [TeacherName], [Discipline], [Venue], [Day], [StartTime], [EndTime], [SessionId]) VALUES (896, N'MGT322', N'FA', N'Ali Husnain', N'BAI-3A', N'Lt6', N'Monday', CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[TIMETABLE] OFF
GO
SET IDENTITY_INSERT [dbo].[VENUE] ON 

INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (161, N'DLDLab')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (162, N'Lab1')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (163, N'Lab2')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (164, N'Lab3')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (165, N'Lab4')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (166, N'Lab6')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (167, N'Lab7')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (168, N'Lt1')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (169, N'Lt10')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (170, N'Lt11')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (171, N'Lt12')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (172, N'Lt13')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (173, N'Lt2')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (174, N'Lt3')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (175, N'Lt4')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (176, N'Lt5')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (177, N'Lt6')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (178, N'Lt7')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (179, N'Lt8')
INSERT [dbo].[VENUE] ([ID], [NAME]) VALUES (180, N'Lt9')
SET IDENTITY_INSERT [dbo].[VENUE] OFF
GO
ALTER TABLE [dbo].[ActivityDetails]  WITH CHECK ADD FOREIGN KEY([CheckTimeId])
REFERENCES [dbo].[CHECKTIME] ([ID])
GO
ALTER TABLE [dbo].[ActivityDetailsSit]  WITH CHECK ADD FOREIGN KEY([CheckTimeId])
REFERENCES [dbo].[CHECKTIME] ([ID])
GO
ALTER TABLE [dbo].[ATTENDANCE]  WITH CHECK ADD FOREIGN KEY([EnrollId])
REFERENCES [dbo].[ENROLL] ([ID])
GO
ALTER TABLE [dbo].[CAMERA]  WITH CHECK ADD FOREIGN KEY([DvrID])
REFERENCES [dbo].[DVR] ([ID])
GO
ALTER TABLE [dbo].[CAMERA]  WITH CHECK ADD FOREIGN KEY([VenueId])
REFERENCES [dbo].[VENUE] ([ID])
GO
ALTER TABLE [dbo].[CHECKTIME]  WITH CHECK ADD FOREIGN KEY([TeacherSlotId])
REFERENCES [dbo].[TEACHERSLOTS] ([ID])
GO
ALTER TABLE [dbo].[CHECKTIMEDETAILS]  WITH CHECK ADD FOREIGN KEY([CheckTimeId])
REFERENCES [dbo].[CHECKTIME] ([ID])
GO
ALTER TABLE [dbo].[ENROLL]  WITH CHECK ADD FOREIGN KEY([SectionOfferID])
REFERENCES [dbo].[SECTION_OFFER] ([ID])
GO
ALTER TABLE [dbo].[ENROLL]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[STUDENT] ([AridNo])
GO
ALTER TABLE [dbo].[OFFERED_COURSES]  WITH CHECK ADD FOREIGN KEY([SessionId])
REFERENCES [dbo].[SESSION] ([ID])
GO
ALTER TABLE [dbo].[PRESCHEDULE]  WITH CHECK ADD FOREIGN KEY([TimeTableId])
REFERENCES [dbo].[TIMETABLE] ([ID])
GO
ALTER TABLE [dbo].[RECORDINGS]  WITH CHECK ADD FOREIGN KEY([TeacherSlotId])
REFERENCES [dbo].[TEACHERSLOTS] ([ID])
GO
ALTER TABLE [dbo].[RESCHEDULE]  WITH CHECK ADD FOREIGN KEY([TeacherSlotId])
REFERENCES [dbo].[TEACHERSLOTS] ([ID])
GO
ALTER TABLE [dbo].[RULES]  WITH CHECK ADD FOREIGN KEY([TimetableId])
REFERENCES [dbo].[TIMETABLE] ([ID])
GO
ALTER TABLE [dbo].[SECTION_OFFER]  WITH CHECK ADD FOREIGN KEY([CourseOfferId])
REFERENCES [dbo].[OFFERED_COURSES] ([ID])
GO
ALTER TABLE [dbo].[SWAPPING]  WITH CHECK ADD FOREIGN KEY([TimeTableIdFrom])
REFERENCES [dbo].[TIMETABLE] ([ID])
GO
ALTER TABLE [dbo].[SWAPPING]  WITH CHECK ADD FOREIGN KEY([TimeTableIdTo])
REFERENCES [dbo].[TIMETABLE] ([ID])
GO
ALTER TABLE [dbo].[TEACHERSLOTS]  WITH CHECK ADD FOREIGN KEY([TimeTableId])
REFERENCES [dbo].[TIMETABLE] ([ID])
GO
ALTER TABLE [dbo].[TempAttendance]  WITH CHECK ADD FOREIGN KEY([AttendanceId])
REFERENCES [dbo].[ATTENDANCE] ([ID])
GO
ALTER TABLE [dbo].[TEMPORARY_TIMETABLE]  WITH CHECK ADD FOREIGN KEY([TimeTableId])
REFERENCES [dbo].[TIMETABLE] ([ID])
GO
ALTER TABLE [dbo].[TIMETABLE]  WITH CHECK ADD FOREIGN KEY([SessionId])
REFERENCES [dbo].[SESSION] ([ID])
GO
