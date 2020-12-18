IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'test')
	DROP DATABASE [test]
GO

CREATE DATABASE [test]
GO

USE [test]

CREATE TABLE Classes (
	ClassID int IDENTITY,
	ClassName nvarchar(10),
	CONSTRAINT pk_cla PRIMARY KEY (ClassID),
	CONSTRAINT UQ_cla UNIQUE(ClassName)
)

CREATE TABLE Students (
	RollNo varchar(6) CONSTRAINT pk_stu PRIMARY KEY,
	FullName nvarchar(50) NOT NULL,
	Email varchar(100) CONSTRAINT UQ_stuema UNIQUE,
	ClassName nvarchar(10) CONSTRAINT fk_stucla FOREIGN KEY REFERENCES Classes(ClassName) ON UPDATE CASCADE
)

CREATE INDEX IX_Email ON Students(Email)

CREATE TABLE Subjects (
	SubjectID int,
	SubjectName nvarchar(100)
)

CREATE CLUSTERED INDEX IX_SubjectID ON Subjects(SubjectID)

CREATE NONCLUSTERED INDEX IX_SubjectName ON Subjects(SubjectName)

CREATE UNIQUE INDEX IX_UQ_SubjectName ON Subjects(SubjectName)

CREATE UNIQUE INDEX IX_Name_Email ON Students(FullName,Email)

DROP INDEX IX_SubjectID ON Subjects

CREATE CLUSTERED INDEX IX_SubjectID ON Subjects(SubjectID) WITH(FILLFACTOR=60)

DROP INDEX IX_SubjectID ON Subjects

CREATE CLUSTERED INDEX IX_SubjectID ON Subjects(SubjectID) WITH(PAD_INDEX=ON, FILLFACTOR=60)

EXEC sp_helpindex 'Subjects'