USE master

IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'test')
	DROP DATABASE test
GO

CREATE DATABASE test
GO

USE test

CREATE TABLE Products (
	ProductID int NOT NULL,
	Name Nvarchar(50),
	Description Nvarchar(50),
	Unit Nvarchar(7),
	Price money,
	Quantity int,
	CompanyID int,
	CategoryID int
)

CREATE TABLE Company (
	CompanyID int NOT NULL,
	CompanyName Nvarchar(20),
	Tel varchar(15),
	Address Nvarchar(100)
)

CREATE TABLE Category (
	CategoryID int NOT NULL,
	CategoryName Nvarchar(20)
)



INSERT INTO Company VALUES
(123,'DELL','0987654321','USA'),
(124,'ASUS','0123456789','TaiWan'),
(125,'APPLE','0543872623','California'),
(126,'MOUSE','0986453732','Japan'),
(127,'MSI','0484376324','China')

INSERT INTO Category VALUES
(1,'Computer'),
(2,'Laptop'),
(3,'NoteBook'),
(4,'Desktop'),
(5,'Mobile'),
(6,'Others')

INSERT INTO Products VALUES
(1,N'Máy Tính T450',N'Máy nhập cũ',N'Chiếc',2000000,20,123,1),
(2,N'Điện Thoại Nokia 5670',N'Điện thoại đang hot',N'Chiếc',1400000,200,125,1),
(3,N'Máy In SamSung',N'Máy in loại trung bình',N'Cái',2200000,15,124,6)

-- 4
SELECT * FROM Company
SELECT * FROM Products

-- 5
SELECT * FROM Company ORDER BY CompanyName DESC
SELECT * FROM Products ORDER BY Price DESC
SELECT * FROM Company WHERE CompanyName LIKE 'ASUS'
SELECT * FROM Products WHERE Quantity < 11
SELECT * FROM Products WHERE CompanyID IN (SELECT CompanyID FROM Company WHERE CompanyName LIKE 'ASUS')

-- 6
SELECT DISTINCT COUNT(CompanyID) AS N'Số hãng sản phẩm' FROM Products
SELECT COUNT(ProductID) AS N'Số mặt hàng' FROM Products
SELECT Company.CompanyName,COUNT(Products.ProductID) AS N'Số sản phẩm' FROM Company JOIN Products ON Company.CompanyID = Products.CompanyID GROUP BY Company.CompanyName
SELECT COUNT(CategoryID) AS N'Tổng số đầu sản phẩm' FROM Category WHERE CategoryID IN (SELECT CategoryID FROM Products)

-- 7
ALTER TABLE Products
	ADD CONSTRAINT chk_Price CHECK (Price > 0)
ALTER TABLE Company
	ADD CONSTRAINT chk_Tel CHECK (Tel LIKE '0%')
ALTER TABLE Products
	ADD CONSTRAINT PK_ProductID PRIMARY KEY (ProductID)
ALTER TABLE Company
	ADD CONSTRAINT PK_CompanyID PRIMARY KEY (CompanyID)
ALTER TABLE Category
	ADD CONSTRAINT PK_CategoryID PRIMARY KEY (CategoryID)
ALTER TABLE Products
	ADD CONSTRAINT FK_CompanyID FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
ALTER TABLE Products
	ADD CONSTRAINT FK_CategoryID FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)

-- 8
CREATE INDEX IX_ProductName ON Products(Name)
CREATE INDEX IX_ProductDescription ON Products(Description)