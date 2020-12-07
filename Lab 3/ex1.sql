IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'example3')
	DROP DATABASE example3
GO
CREATE DATABASE example3
GO
USE example3

CREATE TABLE LopHoc (
	MaLopHoc INT PRIMARY KEY IDENTITY,
	TenLopHoc varchar(10)
)
GO
INSERT INTO LopHoc (TenLopHoc) VALUES ("T1801A")
INSERT INTO LopHoc (TenLopHoc) VALUES ("T1902A")
INSERT INTO LopHoc (TenLopHoc) VALUES ("T2003A")
GO
SELECT * FROM LopHoc
GO

CREATE TABLE SinhVien (
	MaSV int PRIMARY KEY,
	TenSV varchar(40),
	MaLopHoc int,
	CONSTRAINT fk_Cla_Stu FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLopHoc)
)
GO

INSERT INTO SinhVien(MaSV,TenSV,MaLopHoc) VALUES (100,"ha anh tuan",1)
GO
SELECT * FROM SinhVien

CREATE TABLE Category (
	ID int PRIMARY KEY IDENTITY,
	Name varchar(10)
)
GO

INSERT INTO Category(Name) VALUES
("Type 1")
GO

CREATE TABLE Product (
	ID int PRIMARY KEY IDENTITY,
	Name Nvarchar(40),
	Price money NOT NULL DEFAULT (100),
	Catid int,
	CONSTRAINT fk_Cat_Prod FOREIGN KEY (Catid) REFERENCES Category(ID)
)
GO

INSERT INTO Product(Name,Price,Catid) VALUES (N'Ngáo',100000,1)
INSERT INTO Product(Name,Price,Catid) VALUES (N'Ngáo2',20,1)
GO

SELECT * FROM Category
SELECT * FROM Product

CREATE TABLE ContactPhone (
	Person_ID int identity(50,10) NOT NULL,
	MobileNumber bigint NOT NULL
)
GO

CREATE TABLE CellularPhone (
	Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
	PersonName varchar(60) NOT NULL
)
GO

INSERT INTO CellularPhone(PersonName) VALUES
('William Smith')
GO

SELECT * FROM ContactPhone
SELECT * FROM CellularPhone

CREATE TABLE ContactPhone (
	Person_ID int identity(50,10) NOT NULL PRIMARY KEY,
	MobileNumber bigint UNIQUE,
	ServiceProvider varchar(30),
	LandlineNumber bigint UNIQUE,
	RentalCharges int NULL
)
GO

INSERT INTO ContactPhone VALUES (9833456774, 'Hutch', 1234, NULL)
INSERT INTO ContactPhone VALUES (98334567741, 'Alex', NULL, NULL)
GO

CREATE TABLE PhoneExpenses (
	Expense_ID int PRIMARY KEY,
	Person_ID int FOREIGN KEY REFERENCES ContactPhone(Person_ID),
	Amount bigint CHECK (Amount > 0)
)
GO

SELECT * FROM ContactPhone

ALTER TABLE ContactPhone
	ALTER COLUMN ServiceProvider varchar(45)
GO

ALTER TABLE ContactPhone
	DROP COLUMN ServiceProvider
GO

ALTER TABLE ContactPhone
	ADD CONSTRAINT CHK_RC CHECK (RentalCharges > 2)
GO

ALTER TABLE ContactPhone
	DROP CONSTRAINT CHK_RC

SELECT * FROM ContactPhone
