-- USE master

-- IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'test')
-- 	DROP DATABASE test
-- GO

-- CREATE DATABASE test
-- GO

-- USE test

-- CREATE TABLE Class (
-- 	ClassCode int IDENTITY,
-- 	HeadTeacher Nvarchar(30),
-- 	Room Nvarchar(30),
-- 	TimeSlot char,
-- 	CloseDate Datetime
-- )

-- CREATE TABLE Student (
-- 	RollNo int IDENTITY,
-- 	ClassCode int,
-- 	FullName Nvarchar(30),
-- 	Male bit,
-- 	BirthDate Datetime,
-- 	Address Nvarchar(30),
-- 	Provice char(2),
-- 	Email Nvarchar(30) NULL
-- )

-- CREATE TABLE Subject (
-- 	SubjectCode int IDENTITY,
-- 	SubjectName Nvarchar(40),
-- 	WMark bit,
-- 	PMark bit,
-- 	WTest_per int,
-- 	PTest_per int
-- )

-- CREATE TABLE Mark (
-- 	RollNo int NOT NULL,
-- 	SubjectCode int NOT NULL,
-- 	WMark float,
-- 	PMark float,
-- 	Mark float
-- )

-- ALTER TABLE Class
-- 	ADD CONSTRAINT PK_Class PRIMARY KEY (ClassCode)

-- ALTER TABLE Student
-- 	ADD CONSTRAINT PK_Student PRIMARY KEY (RollNo)

-- ALTER TABLE Subject
-- 	ADD CONSTRAINT PK_Subject PRIMARY KEY (SubjectCode)

-- ALTER TABLE Mark
-- 	ADD CONSTRAINT PK_Mark PRIMARY KEY (RollNo,SubjectCode)

-- ALTER TABLE Mark
-- 	ADD CONSTRAINT FK_Mark_Student FOREIGN KEY (RollNo) REFERENCES Student(RollNo)

-- ALTER TABLE Mark
-- 	ADD CONSTRAINT FK_Mark_Subject FOREIGN KEY (SubjectCode) REFERENCES Subject(SubjectCode)

-- ALTER TABLE Student
-- 	ADD CONSTRAINT FK_Student_Class FOREIGN KEY (ClassCode) REFERENCES Class(ClassCode)

-- -- 1

-- INSERT INTO Class VALUES
-- 	(N'Hà Anh Tuấn','A101','A','01-01-2021'),
-- 	(N'Nínénccs','A102','B','01-01-2021'),
-- 	(N'Oimeoi','A103','C','01-01-2021'),
-- 	(N'Nupakachi','A104','D','01-01-2021'),
-- 	(N'Saikikun','A105','E','01-01-2021')

-- INSERT INTO Student VALUES
-- 	(1,N'Ngáo Đá Nghỉ Dịch',1,'01-02-2000','40 vtv','HN',NULL),
-- 	(1,N'Haneui kiki',1,'11-12-1990','40 vtv','HN',NULL),
-- 	(2,N'Poméni cnehui',0,'10-19-1992','40 vtv','HN',NULL),
-- 	(3,N'Pikachu',1,'10-10-1990','40 vtv','HN',NULL),
-- 	(5,N'Aneinuemoiu',0,'01-02-2000','40 vtv','HN',NULL)

-- INSERT INTO Subject VALUES
-- 	('Elementary Programing with C',1,1,40,60),
-- 	(N'Bóng Chày Bãi Biển',1,1,40,60),
-- 	('Python',1,1,40,60),
-- 	('SQL',1,1,40,60),
-- 	(N'Đeo Kính Râm',1,1,40,60)

-- INSERT INTO Mark VALUES
-- 	(1,2,80,100,9.0),
-- 	(1,5,40,50,7.0),
-- 	(2,2,20,20,5.0),
-- 	(3,1,10,70,5.5),
-- 	(4,5,60,80,7.2),
-- 	(5,4,80,80,8.9)
-- GO

-- -- 2
-- CREATE VIEW V_2baithitrolen AS
-- SELECT * FROM Student WHERE RollNo in (SELECT RollNo FROM Mark GROUP BY RollNo HAVING COUNT(SubjectCode)>=2)
-- GO

-- -- 3

-- -- 4
-- CREATE VIEW V_TimeSlotG AS
-- SELECT * FROM Student WHERE ClassCode in (SELECT ClassCode FROM Class WHERE TimeSlot like 'G')

-- -- 5

-- -- 6


-- SELECT * FROM V_TimeSlotG