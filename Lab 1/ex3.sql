USE AdventureWorks2019
SELECT * FROM HumanResources.Employee
GO

DECLARE @deptID INT
SELECT @deptID=1
SELECT Name, GroupName FROM HumanResources.Department WHERE DepartmentID = @deptID
GO

SELECT @@LANGUAGE
SELECT @@VERSION

SELECT SUM(StandardCost) FROM production.ProductCostHistory

SELECT AVG(StandardCost) FROM production.ProductCostHistory

SELECT MAX(StandardCost) FROM production.ProductCostHistory

SELECT count(*) FROM production.ProductPhoto

SELECT getdate()

SELECT datepart(hh,getdate())

SELECT convert(varchar(50),getdate(),103)

SELECT db_id('AdventureWorks2019')

CREATE DATABASE example

USE example

CREATE TABLE Contacts
(MailID VARCHAR(20),
Name NTEXT,
TelephoneNumber INT)

ALTER TABLE Contacts ADD Address NVARCHAR(50)

INSERT INTO Contacts VALUES ('askdo@haha.com','Nguyen Van A',92389283,'hanoi')
INSERT INTO Contacts VALUES ('hasuhe1@haha.com','Nguyen Van b',12512,'hanoi1')
INSERT INTO Contacts VALUES ('hasuhe3@haha.com','Nguyen Van c',1524,'hanoi2')
INSERT INTO Contacts VALUES ('hasuhe4@haha.com','Nguyen Van d',125124,'hanoi3')

SELECT * FROM Contacts

DELETE FROM Contacts WHERE MailID='hasuhe3@haha.com'

UPDATE Contacts SET name=N'Ngao' WHERE MailID='hasuhe4@haha.com'

CREATE login example WITH password='123456'

CREATE USER example FROM login example

REVOKE ALL ON Contacts FROM example

GRANT SELECT ON Contacts TO example

