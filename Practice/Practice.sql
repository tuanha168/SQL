USE master

IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'test')
	DROP DATABASE test
GO

CREATE DATABASE test
GO

USE test

CREATE TABLE Categories (
	CateID char(6) CONSTRAINT PK_cateid PRIMARY KEY (CateID),
	CateName nvarchar(100) NOT NULL,
	Description nvarchar(200),
)

CREATE TABLE Parts (
	PartID int IDENTITY CONSTRAINT PK_partid PRIMARY KEY (PartID),
	PartName nvarchar(100) NOT NULL,
	CateID char(6) CONSTRAINT FK_cateid FOREIGN KEY (CateID) REFERENCES Categories(CateID),
	Description nvarchar(1000),
	Price money NOT NULL DEFAULT (0),
	Quantity int DEFAULT (0),
	Warranty int DEFAULT (1),
	Photo nvarchar(200) DEFAULT ('photo/nophoto.png')
)

INSERT INTO Categories VALUES
	('SSD','SSD','Computer`s SSD'),
	('CPU','CPU','Computer`s CPU'),
	('HDD','HDD','Computer`s HDD')

INSERT INTO Parts VALUES
	('SSD 100GB','SSD','SSD have 100GB',900,50,1,DEFAULT),
	('HDD 100GB','HDD','HDD have 100GB',500,50,1,DEFAULT),
	('God CPU','CPU','Best CPU Of The Worlds',99999999,1,9999,DEFAULT)

SELECT * FROM Parts WHERE Price > 100

SELECT * FROM Parts WHERE CateID LIKE 'CPU'
GO

CREATE VIEW V_Parts AS
SELECT PartID, PartName, Price, Quantity FROM Categories JOIN Parts on Categories.CateID = Parts.CateID
GO

CREATE VIEW V_TopParts AS
SELECT TOP 5 * FROM Parts ORDER BY Price DESC
GO