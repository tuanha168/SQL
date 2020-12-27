USE adventureworks2019
GO

CREATE VIEW V_Contact_Info AS
SELECT FirstName, MiddleName, LastName FROM person.Person
GO

ALTER VIEW V_Contact_Info AS
SELECT p.FirstName,p.LastName,e.BusinessEntityID,e.HireDate,e.BirthDate FROM humanresources.Employee e JOIN person.Person p ON e.BusinessEntityID = p.BusinessEntityID
GO

SELECT * FROM sys.views

EXEC sp_helptext 'V_Contact_Info'

EXEC sp_depends 'V_Contact_Info'
GO

CREATE VIEW V_Employee_Contact AS
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate FROM humanresources.Employee e JOIN person.Person p ON e.BusinessEntityID = p.BusinessEntityID WHERE p.FirstName LIKE 'A%'
WITH CHECK OPTION
GO

SELECT * FROM V_Employee_Contact
GO

DROP VIEW V_Contact_Info
GO

DROP VIEW V_Employee_Contact
GO