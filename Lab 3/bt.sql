IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'BookLibrary')
	DROP DATABASE BookLibrary
GO
CREATE DATABASE BookLibrary
GO
USE BookLibrary

CREATE TABLE Book (
	BookCode int IDENTITY,
	BookTitle Nvarchar(100) NOT NULL,
	Author Nvarchar(50) NOT NULL,
	Edition int,
	BookPrice money,
	Copies int
	CONSTRAINT pk_bc PRIMARY KEY (BookCode)
)

CREATE TABLE Member (
	MemberCode int IDENTITY,
	Name Nvarchar(50) NOT NULL,
	Address Nvarchar(100) NOT NULL,
	PhoneNumber varchar(15)
	CONSTRAINT pk_mc PRIMARY KEY (MemberCode)
)
GO

CREATE TABLE IssueDetails (
	BookCode int,
	MemberCode int,
	IssueDate datetime,
	ReturnDate datetime,
	CONSTRAINT fk_iss_book FOREIGN KEY (BookCode) REFERENCES Book(BookCode),
	CONSTRAINT fk_iss_mem FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode)

)

GO


ALTER TABLE IssueDetails
	DROP CONSTRAINT fk_iss_mem,fk_iss_book
GO

ALTER TABLE Book
	DROP CONSTRAINT pk_bc
GO

ALTER TABLE Member
	DROP CONSTRAINT pk_mc
GO

ALTER TABLE Book
	ADD CONSTRAINT pk_bc PRIMARY KEY (BookCode)
GO

ALTER TABLE Member
	ADD CONSTRAINT pk_mc PRIMARY KEY (MemberCode)
GO

ALTER TABLE IssueDetails
	ADD CONSTRAINT fk_iss_mem FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode)
GO

ALTER TABLE IssueDetails
	ADD CONSTRAINT fk_iss_book FOREIGN KEY (BookCode) REFERENCES Book(BookCode)
GO

ALTER TABLE Book
	ADD CONSTRAINT chk_bp CHECK (BookPrice > 0 AND BookPrice < 200000)
GO

ALTER TABLE member
	ADD CONSTRAINT uni_phnum UNIQUE (PhoneNumber)
GO

ALTER TABLE IssueDetails
	ALTER COLUMN BookCode int NOT NULL
GO

ALTER TABLE IssueDetails
	ALTER COLUMN MemberCode int NOT NULL
GO

ALTER TABLE IssueDetails
	ADD CONSTRAINT pk_issue PRIMARY KEY (BookCode,MemberCode)
GO

INSERT INTO Book VALUES (N'Sách Giáo Khoa',N'Hà Anh Tuấn',1,1000,4)
INSERT INTO Member VALUES (N'Hà Anh Tuấn',N'Linh Đàm','0979797977')
INSERT INTO IssueDetails VALUES (1,1,'02-02-2020','10-02-2020')
GO

SELECT * FROM Book
SELECT * FROM Member
SELECT * FROM IssueDetails

SELECT name FROM sys.key_constraints