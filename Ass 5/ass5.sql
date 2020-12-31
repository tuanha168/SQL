-- USE master

-- IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'test')
-- 	DROP DATABASE test
-- GO

-- CREATE DATABASE test
-- GO

-- USE test

-- CREATE TABLE KhachHang (
-- 	MaKH int IDENTITY,
-- 	TenKH Nvarchar(40),
-- 	DiaChi Nvarchar(100),
-- 	NgaySinh DATETIME
-- )

-- CREATE TABLE DanhBa (
-- 	MaKH int,
-- 	SoDT varchar(15)
-- )

-- ALTER TABLE KhachHang
-- 	ADD CONSTRAINT PK_makh PRIMARY KEY (MaKH)

-- ALTER TABLE DanhBa
-- 	ADD CONSTRAINT FK_danhba_khachhang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)

-- -- 3
-- INSERT INTO KhachHang VALUES
-- 	(N'Nguyễn Văn An',N'40 vtv','01-01-1994'),
-- 	(N'Hà Anh Tuấn',N'40 vtv','01-01-1995'),
-- 	(N'meonsiếu',N'40 vtv','01-01-1993'),
-- 	(N'áeníue',N'40 vtv','01-01-1992')

-- INSERT INTO DanhBa VALUES
-- 	(1,'987654321'),
-- 	(1,'09873452'),
-- 	(1,'09832323'),
-- 	(2,'09434343'),
-- 	(2,'0123892231'),
-- 	(3,'51401805213')

-- -- 4
-- SELECT * FROM KhachHang WHERE MaKH in (SELECT MaKH FROM DanhBa)
-- SELECT SoDT FROM DanhBa

-- -- 5
-- SELECT * FROM KhachHang WHERE MaKH in (SELECT MaKH FROM DanhBa) ORDER BY TenKH DESC
-- SELECT SoDT FROM DanhBa WHERE MaKH in (SELECT MaKH FROM KhachHang WHERE TenKH like N'Nguyễn Văn An')
-- SELECT * FROM KhachHang WHERE NgaySinh = '12-12-09'

-- -- 6
-- SELECT KhachHang.TenKH, COUNT(DanhBa.SoDT) AS N'Số lượng SĐT' FROM KhachHang JOIN DanhBa on KhachHang.MaKH = DanhBa.MaKH GROUP BY KhachHang.TenKH
-- SELECT * FROM KhachHang WHERE MONTH(NgaySinh) = 12
-- SELECT * FROM KhachHang JOIN DanhBa on KhachHang.MaKH = DanhBa.MaKH
-- SELECT * FROM KhachHang JOIN DanhBa on KhachHang.MaKH = DanhBa.MaKH WHERE DanhBa.SoDT LIKE '123456789'

-- -- 7
-- ALTER TABLE KhachHang
-- 	ADD CONSTRAINT chk_ngaysinh CHECK (NgaySinh < getdate())
-- SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
-- ALTER TABLE DanhBa
-- 	ADD BatDau DATETIME DEFAULT (getdate())

-- -- 8
-- -- A
-- CREATE INDEX IX_HoTen ON KhachHang(TenKH)
-- CREATE INDEX IX_SoDienThoai ON DanhBa(SoDT)
-- GO

-- -- B
-- CREATE VIEW V_SoDienthoai AS
-- SELECT KhachHang.TenKH,DanhBa.SoDT FROM KhachHang JOIN DanhBa on DanhBa.MaKH = KhachHang.MaKH
-- GO
-- CREATE VIEW V_SinhNhat AS
-- SELECT KhachHang.TenKH, KhachHang.NgaySinh, DanhBa.SoDT FROM KhachHang JOIN DanhBa on DanhBa.MaKH = KhachHang.MaKH WHERE MONTH(KhachHang.NgaySinh) = MONTH(getdate())
-- GO

-- -- C
-- CREATE PROCEDURE sp_Them_Danhba
-- 	@TenKH Nvarchar(40),
-- 	@DiaChi Nvarchar(100),
-- 	@NgaySinh DATETIME
-- AS
-- BEGIN
-- 	BEGIN TRY
-- 		INSERT INTO KhachHang VALUES
-- 			(@TenKH,@DiaChi,@NgaySinh)
-- 	END TRY
-- 	BEGIN CATCH
-- 		PRINT N'Có Lỗi'
-- 	END CATCH
-- 	PRINT N'Done'
-- END
-- GO

-- CREATE PROCEDURE sp_Tim_Danhba
-- 	@TenKH Nvarchar(40)
-- AS
-- BEGIN
-- 	BEGIN TRY
-- 		SELECT * FROM KhachHang WHERE TenKH LIKE @TenKH
-- 	END TRY
-- 	BEGIN CATCH
-- 		PRINT N'Có lỗi'
-- 	END CATCH
-- 	PRINT 'Done'
-- END
-- GO
