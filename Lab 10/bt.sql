-- USE master

-- IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'test')
-- 	DROP DATABASE test
-- GO

-- CREATE DATABASE test
-- GO

-- USE test

-- CREATE TABLE Toys (
-- 	ProductCode int IDENTITY,
-- 	Name varchar(30),
-- 	Category varchar(30),
-- 	Manufacturer varchar(40),
-- 	AgeRange varchar(15),
-- 	UnitPrice money,
-- 	Netweight int,
-- 	QtyOnHand int
-- )
-- GO

-- INSERT INTO Toys VALUES
-- 	('Do choi 5+','Do Choi','Cua Hang Do Choi','5+',5000,200,21),
-- 	('Do choi 6+','Do Choi','Cua Hang Do Choi','6+',6000,300,21),
-- 	('Do choi 7+','Do Choi','Cua Hang Do Choi','7+',7000,400,21),
-- 	('Do choi 8+','Do Choi','Cua Hang Do Choi','8+',8000,500,21),
-- 	('Do choi 9+','Do Choi','Cua Hang Do Choi','9+',9000,600,21),
-- 	('Do choi 10+','Do Choi','Cua Hang Do Choi','10+',10000,700,21)
-- GO

-- CREATE PROC sp_HeavyToys
-- 	@weight int
-- AS
-- BEGIN
-- 	SELECT COUNT(*) FROM Toys WHERE Netweight >= @weight
-- END
-- GO

-- CREATE PROC sp_PriceIncrease
-- 	@money money
-- AS
-- BEGIN
-- 	UPDATE Toys SET UnitPrice+=@money
-- END
-- GO

-- CREATE PROC sp_QtyOnHand
-- 	@number int
-- AS
-- BEGIN
-- 	UPDATE Toys SET QtyOnHand+=@number
-- END
-- GO

-- EXEC sp_HeavyToys 500
-- EXEC sp_PriceIncrease 10
-- EXEC sp_QtyOnHand -5

-- -- 1
-- EXEC sp_helptext 'sp_HeavyToys'
-- SELECT * FROM sys.sql_modules WHERE definition like '%sp_HeavyToys%'
-- SELECT OBJECT_DEFINITION(OBJECT_ID('sp_HeavyToys'))

-- EXEC sp_helptext 'sp_PriceIncrease'
-- SELECT * FROM sys.sql_modules WHERE definition like '%sp_PriceIncrease%'
-- SELECT OBJECT_DEFINITION(OBJECT_ID('sp_PriceIncrease'))

-- EXEC sp_helptext 'sp_QtyOnHand'
-- SELECT * FROM sys.sql_modules WHERE definition like '%sp_QtyOnHand%'
-- SELECT OBJECT_DEFINITION(OBJECT_ID('sp_QtyOnHand'))

-- -- 2
-- EXEC sp_depends 'sp_HeavyToys'
-- EXEC sp_depends 'sp_PriceIncrease'
-- EXEC sp_depends 'sp_QtyOnHand'
-- GO

-- -- 3
-- ALTER PROC sp_PriceIncrease
-- 	@money money
-- AS
-- BEGIN
-- 	SELECT * FROM Toys
-- 	UPDATE Toys SET UnitPrice+=@money
-- 	SELECT * FROM Toys
-- END
-- GO

-- ALTER PROC sp_QtyOnHand
-- 	@number int
-- AS
-- BEGIN
-- 	SELECT * FROM Toys
-- 	UPDATE Toys SET QtyOnHand+=@number
-- 	SELECT * FROM Toys
-- END
-- GO

-- -- 4
-- CREATE PROC sp_SpecificPriceIncrease
-- AS
-- BEGIN
-- 	UPDATE Toys SET UnitPrice+=QtyOnHand
-- END
-- GO

-- -- 5
-- ALTER PROC sp_SpecificPriceIncrease
-- AS
-- BEGIN
-- 	UPDATE Toys SET UnitPrice+=QtyOnHand
-- 	SELECT * FROM Toys
-- END
-- GO

-- -- 6
-- ALTER PROC sp_SpecificPriceIncrease
-- AS
-- BEGIN
-- 	UPDATE Toys SET UnitPrice+=QtyOnHand
-- 	SELECT * FROM Toys
-- 	EXEC sp_HeavyToys 500
-- END
-- GO

-- -- 7
-- ALTER PROC sp_PriceIncrease
-- 	@money money
-- AS
-- BEGIN
-- 	BEGIN TRY
-- 		SELECT * FROM Toys
-- 		UPDATE Toys SET UnitPrice+=@money
-- 		SELECT * FROM Toys
-- 	END TRY
-- 	BEGIN CATCH
-- 		PRINT N'Có lỗi'
-- 	END CATCH
-- 	PRINT N'Done'
-- END
-- GO

-- ALTER PROC sp_QtyOnHand
-- 	@number int
-- AS
-- BEGIN
-- 	BEGIN TRY
-- 		SELECT * FROM Toys
-- 		UPDATE Toys SET QtyOnHand+=@number
-- 		SELECT * FROM Toys
-- 	END TRY
-- 	BEGIN CATCH
-- 		PRINT N'Có lỗi'
-- 	END CATCH
-- 	PRINT N'Done'
-- END
-- GO

-- ALTER PROC sp_SpecificPriceIncrease
-- 	@gram int
-- AS
-- BEGIN
-- 	BEGIN TRY
-- 		UPDATE Toys SET UnitPrice+=QtyOnHand
-- 		SELECT * FROM Toys
-- 		EXEC sp_HeavyToys @gram
-- 	END TRY
-- 	BEGIN CATCH
-- 		PRINT N'Có lỗi'
-- 	END CATCH
-- 	PRINT N'Done'
-- END
-- GO
