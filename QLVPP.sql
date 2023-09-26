create database QLVPP 

use QLVPP

create table NHAN_VIEN(
	MANHANVIEN varchar(4),
	TENHANVIEN nvarchar(30),
	DIACHI nvarchar(50),
	SDT nvarchar(10),
	GIOITINH nvarchar(5),
	NGAYSINH datetime, 
	CMND_CCCD varchar(12),
	TENDANGNHAP varchar(10),
	MATKHAU varchar(16), 
	VOHIEUHOA bit, 
	LAQUANLY bit
	primary key(MANHANVIEN)
)
create table LOAI_MAT_HANG(
	MALOAI varchar(5),
	TENLOAI nvarchar(50),
	VOHIEUHOA bit,
	primary key (MALOAI)
)
create table NHA_CUNG_CAP(
	MANCC varchar(5),
	TENCC nvarchar(50),
	DIACHI nvarchar(50),
	SDT char(10),
	EMAIL varchar(30),
	VOHIEUHOA bit,
	primary key (MANCC)
)
create table KHACH_HANG(
	MAKH int,
	TENKH nvarchar(30),
	GIOITINH nvarchar(5),
	SDT nvarchar(10),
	VOHIEUHOA bit,
	primary key (MAKH)
)
create table MAT_HANG(
	MAMH varchar(5),
	TENMH nvarchar(50),
	GIABAN bigint, 
	DVT nvarchar(10),
	MALOAI varchar(5),
	MOTA nvarchar(100),
	VOHIEUHOA bit,
	primary key (MAMH),
	foreign key (MALOAI) references LOAI_MAT_HANG(MALOAI)
)
create table HOA_DON(
	MAHOADON int, 
	NGAYLAP datetime, 
	MANHANVIEN varchar(4),
	MAKH int, 
	primary key (MAHOADON),
	foreign key (MANHANVIEN) references NHAN_VIEN(MANHANVIEN),
	foreign key (MAKH) references KHACH_HANG(MAKH)
)
create table DON_DAT_HANG(
	MADDH int,
	MANCC varchar(5),
	NGAYDAT datetime,
	MANV varchar(4),
	primary key (MADDH),
	foreign key (MANV) references NHAN_VIEN(MANHANVIEN),
	foreign key (MANCC) references NHA_CUNG_CAP(MANCC)
)
create table DONDATHANG_MATHANG(
	MADDH int,
	MAMH varchar(5),
	SOLUONG int,
	DONGIA float,
	primary key (MADDH,MAMH),
	foreign key (MADDH) references DON_DAT_HANG(MADDH),
	foreign key (MAMH) references MAT_HANG(MAMH)
)
create table HOADON_MATHANG(
	MAHD int,
	MAMH varchar(5),
	SOLUONGMUA int,
	THANHTIEN float,
	primary key (MAHD,MAMH),
	foreign key (MAHD) references HOA_DON(MAHOADON),
	foreign key (MAMH) references MAT_HANG(MAMH)
)