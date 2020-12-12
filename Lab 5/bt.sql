IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'test')
	DROP DATABASE [test]
GO

CREATE DATABASE [test]
GO

USE [test]

CREATE TABLE PhongBan (
	MaPB varchar(7),
	TenPB Nvarchar(50),
	CONSTRAINT pk_mapb PRIMARY KEY (MaPB)
)

CREATE TABLE NhanVien (
	MaNV varchar(7),
	TenNV Nvarchar(50),
	NgaySinh Datetime,
	SoCMND char(9),
	GioiTinh char(1) DEFAULT ('M'),
	DiaChi Nvarchar(100),
	NgayVaoLam Datetime,
	MaPB varchar(7),
	CONSTRAINT pk_manv PRIMARY KEY (MaNV),
	CONSTRAINT fk_mapb FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB),
	CONSTRAINT chk_ngaysinh CHECK (NgaySinh < getdate()),
	CONSTRAINT chk_cmnd CHECK (ISNUMERIC(SoCMND) = 1),
	CONSTRAINT chk_gioitinh CHECK (GioiTinh = 'M' OR GioiTinh = 'F'),
	CONSTRAINT chk_ngayvaolam CHECK (DATEDIFF(YEAR, NgaySinh, NgayVaoLam) >= 20)
)

CREATE TABLE LuongDA (
	MaDA Nvarchar(8),
	MaNV varchar(7),
	NgayNhan Datetime NOT NULL DEFAULT (getdate()),
	SoTien money,
	CONSTRAINT pk_mada PRIMARY KEY (MaDA,MaNV),
	CONSTRAINT fk_manv FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
	CONSTRAINT chk_sotien CHECK (SoTien > 0)
)
GO

-- 1
INSERT INTO PhongBan VALUES
	('1',N'Đào Tạo'),
	('2',N'Biên Tập'),
	('3',N'Hành Chính'),
	('4',N'Kinh Doanh'),
	('5',N'Ăn Chơi Trác Táng')

INSERT INTO NhanVien VALUES
	('1111111',N'Anh Tuấn','08-16-1975',111111,'M',N'Linh Đàm','10-10-2020',1),
	('2222222',N'NEUCHE','08-16-1987',222222,'F',N'Linh Đàm','10-10-2020',5),
	('3333333',N'Lsoei 1','08-16-2000',3333339,'F',N'Linh Đàm','10-10-2020',2),
	('4444444',N'leocnsi 2','08-16-1979',4444444,'F',N'Linh Đàm','10-10-2020',4),
	('5555555',N'Nseucu 3','08-16-1962',5555559,'M',N'Linh Đàm','10-10-2020',5)

INSERT INTO LuongDA VALUES
	('DXD02',1111111,'05-09-2003',1000000),
	('1235',2222222,DEFAULT,5000000),
	('456',3333333,DEFAULT,800000),
	('1234',3333333,'01-01-2003',2000000),
	('1234',5555555,DEFAULT,2000000),
	('DXD02',5555555,DEFAULT,1800000)

-- 2
SELECT * FROM PhongBan
SELECT * FROM NhanVien
SELECT * FROM LuongDA

-- 3
SELECT * FROM NhanVien WHERE (GioiTinh = 'F')

-- 4
SELECT MaDA FROM LuongDA

-- 5
SELECT NhanVien.TenNV, SUM(LuongDA.SoTien) AS N'Tổng Lương' FROM NhanVien JOIN LuongDA ON NhanVien.MaNV = LuongDA.MaNV GROUP BY NhanVien.TenNV

-- 6
SELECT NhanVien.TenNV,(SELECT TenPB FROM PhongBan WHERE MaPB LIKE '5') AS N'Phòng Ban' FROM NhanVien JOIN PhongBan ON PhongBan.MaPB = NhanVien.MaPB WHERE PhongBan.MaPB LIKE '5' GROUP BY NhanVien.TenNV

-- 7
SELECT NhanVien.TenNV,SUM(LuongDA.SoTien) AS N'Mức Lương',(SELECT TenPB FROM PhongBan WHERE MaPB LIKE '5') AS N'Tên Phòng Ban' FROM NhanVien INNER JOIN LuongDA ON NhanVien.MaNV = LuongDA.MaNV WHERE NhanVien.MaPB LIKE '5' GROUP BY NhanVien.TenNV

-- 8
SELECT PhongBan.TenPB,COUNT(MaNV) AS N'Số Nhân Viên' FROM NhanVien JOIN PhongBan ON PhongBan.MaPB = NhanVien.MaPB GROUP BY PhongBan.TenPB

-- 9
SELECT NhanVien.TenNV,LuongDA.MaDA FROM NhanVien JOIN LuongDA ON LuongDA.MaNV = NhanVien.MaNV

-- 10
SELECT TOP 1 TenPB FROM PhongBan ORDER BY MaPB DESC

-- 11
SELECT COUNT(NhanVien.MaPB) AS 'Số Nhân Viên',PhongBan.TenPB FROM NhanVien JOIN PhongBan ON PhongBan.MaPB = NhanVien.MaPB WHERE NhanVien.MaPB = '1' GROUP BY PhongBan.TenPB

-- 12
SELECT * FROM NhanVien WHERE SoCMND LIKE '%9'

-- 13
SELECT TOP 1 NhanVien.TenNV,LuongDA.SoTien FROM LuongDA JOIN NhanVien ON NhanVien.MaNV = LuongDA.MaNV ORDER BY LuongDA.SoTien DESC

-- 14
SELECT NhanVien.TenNV FROM NhanVien WHERE MaNV IN (SELECT MaNV FROM LuongDA WHERE (SoTien > 1200000)) AND GioiTinh LIKE 'F'

-- 15
SELECT PhongBan.TenPB,SUM(LuongDA.SoTien) AS N'Tổng Lương' FROM LuongDA JOIN NhanVien ON LuongDA.MaNV = NhanVien.MaNV JOIN PhongBan ON NhanVien.MaPB = PhongBan.MaPB WHERE LuongDA.MaNV IN (SELECT MaNV FROM NhanVien WHERE MaPB IN (SELECT MaPB FROM PhongBan)) GROUP BY PhongBan.TenPB

-- 16
SELECT MaDA,COUNT(MaNV) AS N'Số Nhân Viên' FROM LuongDA GROUP BY MaDA HAVING (COUNT(MaNV) >= 2)

-- 17
SELECT * FROM NhanVien WHERE TenNV like 'N%'

-- 18
SELECT * FROM NhanVien WHERE MaNV in (SELECT MaNV FROM LuongDA WHERE NgayNhan >= '01-01-2003' AND NgayNhan < '01-01-2004')

-- 19
SELECT * FROM NhanVien WHERE MaNV NOT IN (SELECT MaNV FROM LuongDA)

-- 20
DELETE FROM LuongDA WHERE MaDA LIKE 'DXD02'

-- 21
DELETE FROM LuongDA WHERE SoTien = 2000000

-- 22
UPDATE LuongDA SET SoTien = SoTien*10/100 + SoTien WHERE MaDA like 'XDX01'

-- 23
DELETE FROM NhanVien WHERE MaNV not in (SELECT MaNV FROM LuongDA)

-- 24
UPDATE NhanVien SET NgayVaoLam='02-12-1999' WHERE MaPB in (SELECT MaPB FROM PhongBan WHERE TenPB like N'Hành Chính')