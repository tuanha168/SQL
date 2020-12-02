USE master
GO

IF (DB_ID('EXAMPLE4') IS NOT NULL)
DROP DATABASE EXAMPLE4

CREATE DATABASE EXAMPLE4
	ON PRIMARY
(	name=N'Customer_DB',
	filename=N'C:\FPT\SQL\Lab 1\EXAMPLE4.mdf')

LOG ON
(	name=N'Customer_DB_log',
	filename=N'C:\FPT\SQL\Lab 1\EXAMPLE4_log.ldf')

COLLATE SQL_Latin1_General_CP1_CI_AS
GO

use EXAMPLE4
go
alter database EXAMPLE4 modify name = EXAMPLE4TEST
go

use EXAMPLE4TEST
go
execute sp_changedbowner @loginame='sa'
exec sp_changedbowner 'sa'
go

use EXAMPLE4TEST
go
alter database EXAMPLE4TEST set auto_shrink on
go

use master
go

if(DB_ID('Example4') is not null)
drop database Example4
go

create database Example4
	ON PRIMARY
(	name=N'Customer_DB',
	filename=N'C:\FPT\SQL\Lab 1\EXAMPLE4.mdf',
	size=4MB,
	maxsize=10MB,
	filegrowth=1MB),
filegroup Example4_FG1
(	
	name='Example4_FG1_Dat1',
	filename=N'C:\FPT\SQL\Lab 1\EXAMPLE4_FG1_1.ndf',
	size=1MB,
	maxsize=10MB,
	filegrowth=1MB
),
(	
	name='Example4_FG1_Dat2',
	filename=N'C:\FPT\SQL\Lab 1\EXAMPLE4_FG1_2.ndf',
	size=1MB,
	maxsize=10MB,
	filegrowth=1MB
)
