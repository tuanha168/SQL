USE master

IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'test')
	DROP DATABASE test
GO

CREATE DATABASE test
GO

USE test

CREATE TABLE Services (
	ServicesID int IDENTITY,
	ServicesName Nvarchar(15),
	Description Nvarchar(100),
	CONSTRAINT PK_ServicesID PRIMARY KEY (ServicesID)
)

CREATE TABLE Customer (
	CustomerID int IDENTITY,
	CustomerName Nvarchar(40),
	ID varchar(15),
	Address Nvarchar(40),
	CONSTRAINT PK_CustomerID PRIMARY KEY (CustomerID)
)

CREATE TABLE CusTel (
	CustomerID int,
	Tel varchar(15),
	ServicesID int,
	StartDate Datetime DEFAULT (getdate()),
	EndDate Datetime null,
)

ALTER TABLE CusTel
	ADD CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)

ALTER TABLE CusTel
	ADD CONSTRAINT FK_ServicesID FOREIGN KEY (ServicesID) REFERENCES Services(ServicesID)

INSERT INTO Services VALUES
	(N'Trả trước',N'Trả tiền rồi mới được dùng'),
	(N'Trả sau',N'Dùng tẹt ga rồi đi farm tiền trả nợ')

INSERT INTO Customer VALUES
	(N'Nguyễn Nguyệt Nga','0123456789',N'Hà Nội')

INSERT INTO CusTel VALUES
	(1,'0123456789',1,'12-12-2002',null)

-- 4
SELECT * FROM Customer
SELECT * FROM CusTel

-- 5
SELECT * FROM Customer JOIN CusTel on CusTel.CustomerID = Customer.CustomerID WHERE CusTel.Tel like '0123456789'
SELECT * FROM Customer WHERE ID like '0123456789'
SELECT * FROM CusTel WHERE CustomerID in (SELECT CustomerID FROM Customer WHERE ID like '0123456789')
SELECT * FROM CusTel WHERE StartDate = '12-12-2009'
SELECT * FROM CusTel WHERE CustomerID in (SELECT CustomerID FROM Customer WHERE Address like N'Hà Nội')

-- 6
SELECT COUNT(CustomerID) AS N'Tổng số khách hàng' FROM Customer 
SELECT COUNT(Tel) FROM CusTel
SELECT COUNT(Tel) FROM CusTel WHERE StartDate = '12-12-2009'
SELECT * FROM Customer JOIN CusTel on Customer.CustomerID = CusTel.CustomerID