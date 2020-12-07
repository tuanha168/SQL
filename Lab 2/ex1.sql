USE AdventureWorks2019
SELECT * FROM HumanResources.Employee
GO

DECLARE @deptID INT
SELECT @deptID=1
SELECT Name, GroupName FROM HumanResources.Department
WHERE DepartmentID = @deptID
GO

SELECT @@LANGUAGE
SELECT @@VERSION
GO

