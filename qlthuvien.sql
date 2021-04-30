-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 20, 2020 at 01:43 AM
-- Server version: 5.5.34-cll-lve
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `quanlithuvien`
--

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_phieu_muon`
--

CREATE TABLE `chi_tiet_phieu_muon` (
  `MaPM` varchar(10) NOT NULL,
  `MaSach` varchar(10) NOT NULL,
  `SoLuong` integer NOT NULL,
  PRIMARY KEY (`MaPM`,`MaSach`),
  KEY `MaSach` (`MaSach`),
  CONSTRAINT `chi_tiet_phieu_muon_ibfk_1` FOREIGN KEY (`MaPM`) REFERENCES `phieu_muon` (`MaPM`),
  CONSTRAINT `chi_tiet_phieu_muon_ibfk_2` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chi_tiet_phieu_muon`
--

INSERT INTO `chi_tiet_phieu_muon` VALUES ('M1','SA12',10),('M1','SA13',10),('M2','SA01',1),('M3','SA04',1),('M4','SA04',1),('M5','SA13',20),('M6','SA07',1),('M6','SA13',15),('M7','SA03',1);

-- --------------------------------------------------------
--
-- Table structure for table `loai_sach`
--

CREATE TABLE `loai_sach` (
  `MaLoai` varchar(10) NOT NULL,
  `TenLoai` varchar(50) NOT NULL,
  PRIMARY KEY (`MaLoai`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loai_sach`
--

INSERT INTO `loai_sach` VALUES ('S01','Chinh tri-phap luat'),('S02','Khoa hoc cong nghe - kinh te'),('S03','Van hoc nghe thuat'),('S04','Van hoa xa hoi - lich su'),('S05','Giao trinh'),('S06','Truyen tieu thuyet');
-- --------------------------------------------------------
--
-- Table structure for table `phieu_muon`
--

CREATE TABLE `phieu_muon` (
  `MaPM` varchar(10) NOT NULL,
  `NgayMuon` date NOT NULL,
  `NgayTra` date NOT NULL,
  `MaSV` varchar(10) NOT NULL,
  PRIMARY KEY (`MaPM`),
  KEY `MaSV` (`MaSV`),
  CONSTRAINT `phieu_muon_ibfk_1` FOREIGN KEY (`MaSV`) REFERENCES `sinh_vien` (`MaSV`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phieu_muon`
--

INSERT INTO `phieu_muon` VALUES ('M1','2023-08-10','2023-08-20','20210789'),('M2','2023-08-10','2023-08-20','20210001'),('M3','2023-09-10','2023-09-20','20210002'),('M4','2023-09-22','2023-09-30','20210002'),('M5','2023-09-05','2023-09-20','20220012'),('M6','2023-09-05','2023-09-20','20230001'),('M7','2023-08-12','2023-08-20','20211230');
-- --------------------------------------------------------
--
-- Table structure for table `sach`
--

CREATE TABLE `sach` (
  `MaSach` varchar(10) NOT NULL,
  `TenSach` varchar(50) NOT NULL,
  `TacGia` varchar(50) DEFAULT NULL,
  `NhaXuatBan` varchar(50) DEFAULT NULL,
  `SoLuong` int NOT NULL,
  `Gia` float DEFAULT NULL,
  `Vitri` varchar(50) NOT NULL,
  `MaLoai` varchar(10) NOT NULL,
  PRIMARY KEY (`MaSach`),
  KEY `MaLoai` (`MaLoai`),
  CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`MaLoai`) REFERENCES `loai_sach` (`MaLoai`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sach`
--

INSERT INTO `sach` VALUES ('SA01','Bo luat hinh su','Nhieu Nguoi','Chinh tri quoc gia su that',50,240000,'Khu A','S01'),('SA02','Bo luat lao dong','Nhieu Nguoi','Lao Dong',40,40000,'Khu A1','S01'),('SA03','Chay dua voi ro bot','Joseph E. Aoun','The Gioi',49,60000,'Khu B1','S02'),('SA04','Ung dung big data trong kinh doanh','Bill Schmarzo','Cong Thuong',48,34000,'Khu B2','S02'),('SA05','Muon dam duong hoa','Tran Thuy Linh','The Gioi',47,34000,'Khu C1','S03'),('SA06','Ha Noi,Mu rom va tem phieu','Trung Sy','Lao Dong',45,60000,'Khu C2','S03'),('SA07','Su ket thuc cua thoi dai gia kim','Mervyn King','The Gioi',30,60000,'Khu D1','S04'),('SA08','Nhung nguoi nhat that vi tha','Isoda Michifumi','The Gioi',30,60000,'Khu D2','S04'),('SA09','Dai Cuong Truyen Thong Quoc Te','Le Thanh Binh','Thong Tin Truyen Thong',10,55000,'Khu E1','S05'),('SA10','Lap Trinh Co So','Pham Phuong Anh - Le Thi Ngoc Van','Thong Tin Truyen Thong',9,45000,'Khu E1','S05'),('SA11','Toan Cao Cap','Nguyen Dinh Tri','Giao Duc Viet Nam',30,100000,'Khu E2','S05'),('SA12','Conan','Gosho Aoyama','Kim Dong',91,20000,'Khu F1','S06'),('SA13','Naruto','Kishimoto Masashi','Kim Dong',700,20000,'Khu F1','S06');
-- --------------------------------------------------------
--
-- Table structure for table `sinh_vien`
--

CREATE TABLE `sinh_vien` (
  `MaSV` varchar(10) NOT NULL,
  `TenSV` varchar(50) NOT NULL,
  `NgayHetHan` date NOT NULL,
  `ChuyenNganh` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `SDT` varchar(13) NOT NULL,
  PRIMARY KEY (`MaSV`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sinh_vien`
--

INSERT INTO `sinh_vien` VALUES ('20210001','Bui Van Anh','2025-08-24','Cong Nghe Thong Tin','bva@gmail.com','0123456789'),('20210002','Tran Van Binh','2025-08-24','Cong Nghe Thong Tin','tvb@gmail.com','0123456780'),('20210003','Doan Xuan Cong','2025-08-24','Ki thuat dien','dxc@gmail.com','0123456781'),('20210004','Hoang Lam Dong','2025-08-24','Co dien tu','hld@gmail.com','0123456782'),('20210123','Trinh Khanh Phuong','2025-08-24','Cong Nghe Thong Tin','tkp@gmail.com','0123456729'),('20210789','Pham Mai Thuy','2025-08-24','Thuc Pham','pmt@gmail.com','0123456739'),('20211230','Bui Diem My','2025-08-24','Tieng Anh','bdm@gmail.com','0123456749'),('20211231','Tran Khanh Linh','2025-08-24','Tieng Anh','tkl@gmail.com','0123456759'),('20220001','Hua Van Hoang','2025-08-24','Co dien tu','hvh@gmail.com','0123456784'),('20220005','Ngo Van Giang','2026-08-24','Co dien tu','nvg@gmail.com','0123456783'),('20220012','Phung Dinh Khanh','2026-08-24','Ki thuat hoa hoc','pdk@gmail.com','0123456785'),('20220015','Nguyen Thi Linh','2026-08-24','Cong Nghe Sinh Hoc','ntl@gmail.com','0123456786'),('20220016','Tran Van Minh','2026-08-24','Toan Tin','tvm@gmail.com','0123456787'),('20230001','Bui Phuong Anh','2027-08-24','Det May','bpa@gmail.com','0123456788'),('20230045','Luu Van Nam','2027-08-24','Cong Nghe Thong Tin','lvn@gmail.com','0123456719');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
