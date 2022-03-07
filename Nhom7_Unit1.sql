CREATE DATABASE QuanLyMuaHang;

USE QuanLyMuaHang;

CREATE TABLE CUSTOMER
(
	MaKH CHAR(10) NOT NULL PRIMARY KEY,
	TenKH NVARCHAR(150),
	Email VARCHAR(100),
	SoDT VARCHAR(12),
	DiaChi NVARCHAR(100)
);

CREATE TABLE PRODUCT
(
	MaSP CHAR(10) NOT NULL PRIMARY KEY,
	TenSP NVARCHAR(150),
	MoTa NVARCHAR(150),
	GiaSP FLOAT,
	SoLuong INT
);

CREATE TABLE PAYMENT
(
	MaPTTT CHAR(10) NOT NULL PRIMARY KEY,
	TenPTTT NVARCHAR(100),
	PhiTT FLOAT
);

CREATE TABLE ORDER_
(
	MaDH CHAR(10) NOT NULL PRIMARY KEY,
	MaPTTT CHAR(10) NOT NULL,
	MaKH CHAR(10) NOT NULL,
	NgayDatHang DATE,
	TrangThaiDH NVARCHAR(20),
	TongTien FLOAT
);

CREATE TABLE ORDER_DETAIL
(
	MaCTDH CHAR(10) PRIMARY KEY NOT NULL,
	MaDH CHAR(10) NOT NULL,
	MaSP CHAR(10) NOT NULL,
	SoLuongMua INT,
	GiaSP FLOAT
);

ALTER TABLE dbo.ORDER_ 
ADD FOREIGN KEY(MaKH) REFERENCES dbo.CUSTOMER(MaKH);

ALTER TABLE dbo.ORDER_ 
ADD FOREIGN KEY(MaPTTT) REFERENCES dbo.PAYMENT(MaPTTT);

ALTER TABLE dbo.ORDER_DETAIL 
ADD FOREIGN KEY(MaDH) REFERENCES dbo.ORDER_(MaDH);

ALTER TABLE dbo.ORDER_DETAIL  
ADD FOREIGN KEY(MaSP) REFERENCES dbo.PRODUCT(MaSP);

INSERT INTO CUSTOMER (MaKH, TenKH, Email, SoDT, DiaChi)
VALUES
	('KH01', 'Nguyen Van Trung', 'trung123@gmail.com','0906452326', 'Lien Chieu'),
	('KH02', 'Dinh Vu Ngoc Huy', 'huy235@gmail.com', '0923478965', 'Hai Chau'),
	('KH03', 'Tran Ngoc Vinh', 'Vinh345@gmail.com','0947892112', 'Son Tra'),
	('KH04', 'Le Van Luyen', 'luyen809@gmail.com','0987654324','Thanh Khe'),
	('KH05', 'Nguyen Thi Hanh', 'hanh689@gmail.com', '0987654325','Cam Le'),
	('KH06', 'Tran Ngoc Duy',  'duy908@gmail.com','0987654326', 'Ngu Hanh Son'),
	('KH07', 'Le Thi Nuong',  'nuong789@gmail.com','0987654327', 'Hoa Khanh'),
	('KH08', 'Vo Van Kiet',  'kiet654@gmail.com','0987654328', 'Hoa Khanh'),
	('Kh09', 'Tran Dinh Hoi',  'hoi290@gmail.com','0987654329', 'Hai Chau'),
	('KH10', 'Nguyen Xuan Hong',  'hong435@gmail.com','0987654329', 'Thanh Khe')
GO

INSERT INTO PRODUCT (MaSP, TenSP, MoTa, GiaSP, SoLuong)
VALUES 
	('TS01', 'Tra sua truyen thong', 'M', '15000', '1'),
	('TS02', 'Tra sua truyen thong', 'L', '22000', '1'),
	('TS03', 'Tra sua Cookie', 'M', '18000', '1'),
	('TS04', 'Tra sua Cookie', 'L', '28000', '1'),
	('TS05', 'Tra sua cu nang', 'M', '23000', '1'),
	('TS06', 'Tra sua cu nang', 'L', '33000', '1'),
	('TS07', 'Tra sua dac biet', 'M', '29000', '1'),
	('TS08', 'Tra sua dac biet', 'L', '39000', '1'),
	('TS09', 'Tra sua RaiBow', 'M', '23000', '1'),
	('TS10', 'Tra sua RaiBow', 'L', '32000', '1'),
	('TS11', 'Tra sua bong', 'M', '29000', '1'),
	('TS12', 'Tra sua bong', 'M', '39000', '1')
GO

INSERT INTO PAYMENT (MaPTTT, TenPTTT, PhiTT)
VALUES
	('TT01', 'Momo', '0'),
	('TT02', 'ShopeePay', '1000'),
	('TT03', 'ZaloPay', '500')
GO

INSERT INTO ORDER_ (MaDH, MaPTTT, MaKH, NgayDatHang, TrangThaiDH, TongTien)
VALUES
	('DH01', 'TT02', 'KH03', '2020-02-09', 'Da nhan hang', 58000),
	('DH02', 'TT02', 'KH02', '2020-03-08', 'Chua nhan hang', 45000),
	('DH03', 'TT01', 'KH05', '2020-07-15', 'Dang giao hang', 39000),
	('DH04', 'TT03', 'KH01', '2020-10-21', 'Dang giao hang', 116000),
	('DH05', 'TT02', 'KH07', '2020-10-07', 'Da nhan hang', 90000),
	('DH06', 'TT03', 'KH09', '2021-01-14', 'Da nhan hang', 46000),
	('DH07', 'TT02', 'KH10', '2021-05-26', 'Dang giao hang', 90000),
	('DH08', 'TT01', 'KH01', '2021-08-30', 'Da nhan hang', 22000),
	('DH09', 'TT01', 'KH04', '2021-12-22', 'Da nhan hang', 290000),
	('DH10', 'TT03', 'KH08', '2022-03-05', 'Dang giao hang', 116000)
GO

INSERT INTO ORDER_DETAIL (MaCTDH, MaDH, MaSP, SoLuongMua, GiaSP)
VALUES
	('MCTD01', 'DH01', 'TS01', 3, 15000),
	('MCTD02', 'DH02', 'TS06', 2, 33000),
	('MCTD03', 'DH03', 'TS07', 1, 29000),
	('MCTD04', 'DH04', 'TS03', 5, 18000),
	('MCTD05', 'DH05', 'TS11', 4, 29000),
	('MCTD06', 'DH05', 'TS09', 2, 23000),
	('MCTD07', 'DH06', 'TS08', 4, 39000),
	('MCTD08', 'DH07', 'TS03', 5, 18000),
	('MCTD09', 'DH07', 'TS07', 10, 29000),
	('MCTD10', 'DH08', 'TS12', 2, 39000),
	('MCTD11', 'DH08', 'TS01', 1, 15000),
	('MCTD12', 'DH08', 'TS02', 2, 22000),
	('MCTD13', 'DH09', 'TS12', 2, 39000),
	('MCTD14', 'DH09', 'TS06', 3, 25000),
	('MCTD15', 'DH10', 'TS05', 4, 23000),
	('MCTD16', 'DH10', 'TS12', 2, 39000)
GO

-- TẠO KHUNG NHÌN HIỂN THỊ THÔNG TIN CÁC KHÁCH HÀNG TRONG BẢNG CUSTOMER CÓ ĐỊA CHỈ LÀ ĐÀ NẴNG VÀ CÓ TỔNG TIỀN LỚN HƠN 50000

CREATE VIEW CHITIETKHACHHANG50 AS 
	SELECT DBO.CUSTOMER.MaKH, DBO.CUSTOMER.TenKH, DBO.CUSTOMER.Email, DBO.ORDER_.TongTien FROM dbo.CUSTOMER 
	INNER JOIN DBO.ORDER_ ON DBO.CUSTOMER.MaKH=DBO.ORDER_.MaKH 
	WHERE dbo.CUSTOMER.DiaChi = 'Thanh Khe' AND DBO.ORDER_.TongTien > 50000

select * from CHITIETKHACHHANG50

-- TẠO KHUNG NHÌN HIỂN THỊ THÔNG TIN CÁC SẢN PHẨM TRONG BẢNG PRODUCT CÓ GIASANPHAM LỚN HƠN 20000 VÀ CÓ SỐ LƯỢNG MUA LỚN HƠN 5

CREATE VIEW CHITIETSANPHAM5 AS 
	SELECT DBO.PRODUCT.TenSP, DBO.PRODUCT.MaSP, DBO.PRODUCT.GiaSP, DBO.ORDER_DETAIL.SoLuongMua FROM dbo.PRODUCT 
	INNER JOIN DBO.ORDER_DETAIL ON DBO.PRODUCT.MaSP=DBO.ORDER_DETAIL.MaSP 
	WHERE DBO.PRODUCT.GiaSP > 20000 AND DBO.ORDER_DETAIL.SoLuongMua > 5;

select * from CHITIETSANPHAM5

-- Hàm trả về doanh thu của ngày hôm nay

create function doanhThu() 
returns float
as
	begin
		declare @doanhThu float

		select @doanhThu = case when sum(SoLuongMua * GiaSP) is null then 0 else sum(SoLuongMua * GiaSP) end from ORDER_DETAIL od
		inner join ORDER_ o on o.MaDH = od.MaDH
		where convert(date, NgayDatHang) = convert(date, getdate())

		return @doanhThu
	end

select dbo.doanhThu() as DoanhThuNgay

-- Hàm đếm tổng số lượng đã bán được của một sản phẩm nào đó

create function tongSanPhamBan(@maSP varchar(10))
returns int
as
	begin
		declare @tongSP int

		select @tongSP = sum(SoLuongMua) from ORDER_DETAIL
		where MaSP = @maSP

		return @tongSP
	end

select dbo.tongSanPhamBan('TS01') as DaBan

-- Hàm trả về thông tin các khách hàng đã mua trên 5 sản phẩm

create function khachHangThanThiet() 
returns table
as
	return select c.* from CUSTOMER c
	where c.MaKH in (select MaKH from ORDER_ o 
					inner join ORDER_DETAIL od on o.MaDH = od.MaDH
					group by MaKH
					having sum(SoLuongMua) > 5)

select * from dbo.khachHangThanThiet()

-- Thủ tục bổ sung thêm bản ghi mới vào bảng ORDER_DETAIL với nguyên tắc là không được trùng khóa chính 
-- và đảm bảo toàn vẹn dữ liệu tham chiếu đến các bảng có liên quan. 

create proc insertOrderDetail (@MaCTDH CHAR(10),
								@MaDH CHAR(10),
								@MaSP CHAR(10),
								@SoLuongMua INT,
								@GiaSP FLOAT)
as
	begin
		if @MaCTDH is not null
			if @MaCTDH not in (select MaCTDH from ORDER_DETAIL)
				if (@MaDH is null or @MaDH in (select MaDH from ORDER_)) and (@MaSP is null or @MaSP in (select MaSP from PRODUCT))
					insert into ORDER_DETAIL
					values
						(@MaCTDH, @MaDH, @MaSP, @SoLuongMua, @GiaSP)
	end

execute insertOrderDetail null, 'DH01', 'TS02', 4, 15000
execute insertOrderDetail 'MCTD16', 'DH01', 'TS02', 4, 15000
execute insertOrderDetail 'MCTD17', 'DH01', 'TS02', 4, 15000

-- Thủ tục trả về thông tin khách hàng mua hàng nhiều nhất trong năm 2021

CREATE PROC khachHangVIP
AS
	BEGIN
		select CUSTOMER.*, SoLuongMua from CUSTOMER
		inner join (select top 1 dh.MaKH, sum(od.SoLuongMua) as "SoLuongMua" from CUSTOMER kh
					inner join ORDER_ dh on dh.MaKH = kh.MaKH
					inner join ORDER_DETAIL od on od.MaDH = dh.MaDH
					group by dh.MaKH
					order by sum(od.SoLuongMua) desc) as a 
		on CUSTOMER.MaKH = a.MaKH 
	END

execute khachHangVIP


-- proc thêm mới khách hàng
alter proc insertCustomer (@MaKH CHAR(10),
								@TenKH NVARCHAR(150),
								@Email NVARCHAR(100),
								@SoDT varchar(12),
								@DiaChi NVARCHAR(100))
as
	begin
		if @MaKH is not null
			if @MaKH not in (select MaKH from CUSTOMER)
					insert into CUSTOMER values (@MaKH, @TenKH, @Email, @SoDT, @DiaChi)
	end
--thêm mới sản phẩm
create proc insertProduct (@MaSP CHAR(10),
								@TenSP NVARCHAR(150),
								@MoTa NVARCHAR(150),
								@GiaSP float,
								@SoLuong int)
as
	begin
		if @MaSP is not null
			if @MaSP not in (select MaSP from PRODUCT)
					insert into CUSTOMER values (@MaSP, @TenSP, @MoTa, @GiaSP, @SoLuong)
	end
--xoá bản ghi khách hàng theo mã khách hàng
create proc deleteCustomer (@MaKH CHAR(10))
as
	begin
		if @MaKH is not null
			if @MaKH in (select MaKH from CUSTOMER)
					delete from CUSTOMER where MaKH = @MaKH
	end
--xoá bản ghi khách hàng theo mã khách hàng
create proc deleteProduct (@MaSP CHAR(10))
as
	begin
		if @MaSP is not null
			if @MaSP in (select MaSP from PRODUCT)
					delete from PRODUCT where MaSP = @MaSP
	end

