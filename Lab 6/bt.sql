-- IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'test')
-- 	DROP DATABASE [test]
-- GO

-- CREATE DATABASE [test]
-- GO

-- USE [test]

-- CREATE TABLE SanPham (
-- 	MaSP int IDENTITY,
-- 	TenSP Nvarchar(40),
-- 	Unit Nvarchar(10),
-- 	Price float,
-- 	SoLuong int,
-- 	Status int DEFAULT (1),
-- 	Description Nvarchar(100),
-- 	MaLoaiSP int,
-- 	CONSTRAINT pk_masp PRIMARY KEY (MaSP),
-- )

-- CREATE TABLE LoaiSP (
-- 	MaLoaiSP int IDENTITY,
-- 	TenLoaiSP Nvarchar(40),
-- )

-- CREATE TABLE DonHang (
-- 	MaDH int IDENTITY,
-- 	MaKH int,
-- 	Status int DEFAULT (1),
-- 	DateOrder Datetime DEFAULT (getdate()),
-- 	CONSTRAINT pk_madh PRIMARY KEY (MaDH),
-- )

-- CREATE TABLE KhachHang (
-- 	MaKH int IDENTITY,
-- 	TenKH Nvarchar(40),
-- 	DiaChi Nvarchar(100),
-- 	SoDT Nvarchar(15),
-- 	CONSTRAINT pk_makh PRIMARY KEY (MaKH),
-- )

-- CREATE TABLE ChiTietDonHang (
-- 	MaDH int,
-- 	MaSP int,
-- 	SoLuong int,
-- 	Price float
-- )

-- ALTER TABLE DonHang
-- 	ADD CONSTRAINT fk_makh FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)

-- ALTER TABLE ChiTietDonHang
-- 	ADD CONSTRAINT fk_madh_details FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH)

-- ALTER TABLE ChiTietDonHang
-- 	ADD CONSTRAINT fk_masp FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)

-- -- 3
-- INSERT INTO KhachHang VALUES
-- 	(N'Nguyễn Văn An 1',N'Linh Đàm','0976543210'),
-- 	(N'Nguyễn Văn An 2',N'Linh Đàm','0976543210'),
-- 	(N'Nguyễn Văn An 3',N'Linh Đàm','0976543210'),
-- 	(N'Nguyễn Văn An 4',N'Linh Đàm','0976543210'),
-- 	(N'Nguyễn Văn An 5',N'Linh Đàm','0976543210')

-- INSERT INTO DonHang VALUES
-- 	(1,DEFAULT,DEFAULT),
-- 	(1,DEFAULT,DEFAULT),
-- 	(2,DEFAULT,DEFAULT),
-- 	(3,DEFAULT,DEFAULT),
-- 	(4,DEFAULT,DEFAULT)

-- INSERT INTO LoaiSP VALUES
-- 	(N'Điện Thoại'),
-- 	(N'LapTop'),
-- 	(N'Computer'),
-- 	(N'Kính Lúp'),
-- 	(N'Haha')

-- INSERT INTO SanPham VALUES
-- 	(N'Nokia 1110i',N'Chiếc',10,500,DEFAULT,N'Cục gạch bền nhất thế kỷ',1),
-- 	(N'Nokia 1200',N'Chiếc',10,500,DEFAULT,N'Cục gạch bền nhì thế kỷ',1),
-- 	(N'Mouse',N'Chiếc',100,500,DEFAULT,N'Chuột',2),
-- 	(N'Kính Lúp 5M',N'Chiếc',9999,500,DEFAULT,N'Kính Lúp dầy 5m bao trâu',4),
-- 	(N'BM 350',N'Chiếc',1000,500,DEFAULT,N'BM 2500 kháng nguyên tích xanh XMDN bao trâu bảo hảnh 100d',1)

-- INSERT INTO ChiTietDonHang VALUES
-- 	(1,1,1,10),
-- 	(2,2,1,10),
-- 	(3,3,1,100),
-- 	(4,4,50,9999),
-- 	(5,5,2,1000)


-- -- 4
-- SELECT * FROM KhachHang
-- SELECT * FROM SanPham
-- SELECT * FROM DonHang

-- -- 5
-- SELECT * FROM KhachHang ORDER BY TenKH
-- SELECT * FROM SanPham ORDER BY Price DESC
-- SELECT * FROM SanPham WHERE MaSP in (SELECT MaSP FROM ChiTietDonHang WHERE MaDH in (SELECT MaDH FROM DonHang WHERE MaKH in (SELECT MaKH FROM KhachHang WHERE TenKH like N'Nguyễn Văn An 1')))

-- -- 6
-- SELECT COUNT(MaKH) AS N'Số khách hàng đã mua' FROM KhachHang WHERE MaKH in (SELECT MaKH FROM DonHang)
-- SELECT TenLoaiSP AS N'Loại sản phẩm đã bán' FROM LoaiSP WHERE MaLoaiSP in (SELECT MaLoaiSP FROM SanPham WHERE MaSP in (SELECT MaSP FROM ChiTietDonHang))
-- SELECT MaDH,SoLuong*Price AS N'Tổng Tiền' FROM ChiTietDonHang

-- -- 7
-- ALTER TABLE SanPham
-- 	ADD CONSTRAINT chk_price CHECK (Price > 0)
-- ALTER TABLE DonHang
-- 	ADD CONSTRAINT chk_dateorder CHECK (DateOrder < getdate())
-- ALTER TABLE SanPham
-- 	ADD NgayXuatHien Datetime

-- -- 8
