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

set dateformat dmy


insert into NHAN_VIEN values('AD00', N'Phạm Hoàng Nhân', N'Bình Dương', '0387860889','Nam' ,'17/09/2003','123456789','admin','admin123','False' , 'True');
insert into NHAN_VIEN values('NV01', N'Nguyên Văn Nguyên', N'Quảng Trị', '0387851489','Nam' ,'20/04/2003','123356789','nguyennv','nguyennv','False' , 'False');
insert into NHAN_VIEN values('NV02', N'Trần Hữu Tiến', N'Quảng Bình', '0987851489','Nam' ,'10/01/2001','123354719','tienth','tienth','False' , 'False');
insert into NHAN_VIEN values('NV03', N'Phùng Văn Duy', N'TP HCM', '0987851389','Nam' ,'20/03/2003','223356789','duypv','duypv','False' , 'True');
insert into NHAN_VIEN values('NV04', N'Nguyễn Minh Quân', N'Hà Tĩnh', '0357851489','Nam' ,'10/04/2003','123356789','quannm','quannm','False' , 'True');
insert into NHAN_VIEN values('NV05', N'Nguyễn Anh Quân', N'Long Thành', '0287851489','Nam' ,'15/11/2003','126156789','quannm1','quannm1','False' , 'False');

insert into LOAI_MAT_HANG values('BANG',N'BẢNG',0)
insert into LOAI_MAT_HANG values('BIA',N'BIA',0)
insert into LOAI_MAT_HANG values('BUT',N'BÚT',1)
insert into LOAI_MAT_HANG values('CAP',N'CẶP',0)
insert into LOAI_MAT_HANG values('GIAY',N'GIẤY',1)
insert into LOAI_MAT_HANG values('KEO',N'BĂNG KEO',0)
insert into LOAI_MAT_HANG values('MT',N'MÁY TÍNH',0)
insert into LOAI_MAT_HANG values('PHAN',N'PHẤN',0)
insert into LOAI_MAT_HANG values('THUOC',N'THƯỚC',0)

insert into MAT_HANG values ('BA001',N'BẢNG TRẺ EM',12000,N'CÁI','BANG',N'2 mặt, một mặt dùng bút lông bảng, một mặt dùng phấn',0)
insert into MAT_HANG values ('BA002',N'BẢNG MICA',7000,N'CÁI','BANG',N'Mặt bảng bằng MICA bền đẹp',0)
insert into MAT_HANG values ('BA003',N'BẢNG HỌC SINH',30000,N'CHIẾC','BANG',N'Bảng độ bền cao',0)
insert into MAT_HANG values ('BA004',N'BẢNG KẺ Ô LI TIỂU HỌC',740000,N'CÁI','BANG',N'Bảng độ bền cao, có thể điều chỉnh lên xuống',0)


select * from MAT_HANG
select * from LOAI_MAT_HANG
select * from NHAN_VIEN



select TENDANGNHAP,TENHANVIEN, SDT, GIOITINH, NGAYSINH from NHAN_VIEN where LAQUANLY = 0

select TENLOAI, MAMH, TENMH, GIABAN, DVT, MOTA from MAT_HANG, LOAI_MAT_HANG where LOAI_MAT_HANG.MALOAI = MAT_HANG.MALOAI 
Select MALOAI from LOAI_MAT_HANG where TENLOAI = N'BẢNG'

Select MALOAI from LOAI_MAT_HANG where TENLOAI = N'BẢNG'


update MAT_HANG set TENMH = N'Bảng Nhựa LA', GIABAN = 15000 where MAMH = 'BA005'