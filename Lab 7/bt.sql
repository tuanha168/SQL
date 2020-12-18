USE master

IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'test')
	DROP DATABASE test
GO

CREATE DATABASE test
GO

USE test

CREATE TABLE Student (
	StudentNo int,
	StudentName Nvarchar(50),
	StudentAddress Nvarchar(100),
	PhoneNo int,
	CONSTRAINT PK_StudentNo PRIMARY KEY (StudentNo)
)

CREATE TABLE Department (
	DeptNo int,
	DeptName Nvarchar(50),
	ManagerName char(30),
	CONSTRAINT PK_DeptNo PRIMARY KEY (DeptNo)
)

CREATE TABLE ASSIGNMENT (
	AssignmentNo int,
	Description Nvarchar(100),
	CONSTRAINT PK_AssignmentNo PRIMARY KEY (AssignmentNo)
)

CREATE TABLE Works_Assign (
	JobID int,
	StudentNo int,
	AssignmentNo int,
	TotalHours int,
	JobDetails XML,
	CONSTRAINT PK_JobID PRIMARY KEY (JobID),
	CONSTRAINT FK_StudentNo FOREIGN KEY (StudentNo) REFERENCES Student(StudentNo),
	CONSTRAINT FK_AssignmentNo FOREIGN KEY (AssignmentNo) REFERENCES Assignment(AssignmentNo)
)

-- 1
ALTER TABLE Works_Assign
	DROP FK_StudentNo
ALTER TABLE Student
	DROP PK_StudentNo
CREATE CLUSTERED INDEX IX_Student ON Student(StudentNo)

-- 2
ALTER INDEX IX_Student on Student REBUILD

-- 3
ALTER TABLE Department
	DROP PK_DeptNo
CREATE CLUSTERED INDEX IX_DeptNo ON Department(DeptNo)
CREATE NONCLUSTERED INDEX IX_Dept ON Department(DeptName,ManagerName)