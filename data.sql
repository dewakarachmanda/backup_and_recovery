-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 05, 2023 at 11:59 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `basdatlan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbbarang`
--

CREATE TABLE `tbbarang` (
  `KodeBarang` varchar(5) NOT NULL,
  `KodeJenis` varchar(2) NOT NULL,
  `KodeMerk` varchar(2) NOT NULL,
  `NamaBarang` varchar(70) DEFAULT NULL,
  `KodeSatuan` varchar(2) DEFAULT NULL,
  `HargaJual` double DEFAULT NULL,
  `HargaBeli` double DEFAULT NULL,
  `Banyak` int(11) DEFAULT NULL,
  `KodeSupplier` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbbarang`
--

INSERT INTO `tbbarang` (`KodeBarang`, `KodeJenis`, `KodeMerk`, `NamaBarang`, `KodeSatuan`, `HargaJual`, `HargaBeli`, `Banyak`, `KodeSupplier`) VALUES
('B1', 'J1', 'M1', 'Macbook Pro 2022', 'S1', 2500000, 2000000, 1, 'SP1'),
('B2', 'J2', 'M2', 'Milo', 'S2', 70000, 60000, 10, 'SP2');

-- --------------------------------------------------------

--
-- Table structure for table `tbbelidetail`
--

CREATE TABLE `tbbelidetail` (
  `FakturBeli` varchar(6) NOT NULL,
  `KodeBarang` varchar(5) NOT NULL,
  `banyakbeli` int(11) DEFAULT NULL,
  `hargabeli` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbbelidetail`
--

INSERT INTO `tbbelidetail` (`FakturBeli`, `KodeBarang`, `banyakbeli`, `hargabeli`) VALUES
('01', 'B1', 1, 20000000),
('02', 'B2', 10, 60000);

-- --------------------------------------------------------

--
-- Table structure for table `tbbelimaster`
--

CREATE TABLE `tbbelimaster` (
  `FakturBeli` varchar(4) NOT NULL,
  `tanggalbeli` date DEFAULT NULL,
  `KodeSupplier` varchar(4) NOT NULL,
  `subtotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbbelimaster`
--

INSERT INTO `tbbelimaster` (`FakturBeli`, `tanggalbeli`, `KodeSupplier`, `subtotal`) VALUES
('01', '2023-01-03', 'SP1', 25000000),
('02', '2023-01-05', 'SP2', 700000);

-- --------------------------------------------------------

--
-- Table structure for table `tbjenis`
--

CREATE TABLE `tbjenis` (
  `KodeJenis` varchar(2) NOT NULL,
  `NamaJenis` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbjenis`
--

INSERT INTO `tbjenis` (`KodeJenis`, `NamaJenis`) VALUES
('J1', 'Electronic'),
('J2', 'Food');

-- --------------------------------------------------------

--
-- Table structure for table `tbjualdetail`
--

CREATE TABLE `tbjualdetail` (
  `FakturJual` varchar(6) NOT NULL,
  `KodeBarang` varchar(5) NOT NULL,
  `BanyakJual` int(11) DEFAULT NULL,
  `HargaJual` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbjualdetail`
--

INSERT INTO `tbjualdetail` (`FakturJual`, `KodeBarang`, `BanyakJual`, `HargaJual`) VALUES
('001', 'B1', 1, 25000000),
('002', 'B2', 10, 70000);

-- --------------------------------------------------------

--
-- Table structure for table `tbjualmaster`
--

CREATE TABLE `tbjualmaster` (
  `FakturJual` varchar(4) NOT NULL,
  `TanggalJual` date DEFAULT NULL,
  `KodeKonsumen` varchar(4) NOT NULL,
  `subtotal` double DEFAULT NULL,
  `diskon` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbjualmaster`
--

INSERT INTO `tbjualmaster` (`FakturJual`, `TanggalJual`, `KodeKonsumen`, `subtotal`, `diskon`) VALUES
('001', '2023-01-05', 'K01', 25000000, 0.1),
('002', '2023-01-06', 'K02', 700000, 0.1);

-- --------------------------------------------------------

--
-- Table structure for table `tbkonsumen`
--

CREATE TABLE `tbkonsumen` (
  `KodeKonsumen` varchar(4) NOT NULL,
  `NamaKonsumen` varchar(40) DEFAULT NULL,
  `AlamatKonsumen` varchar(100) DEFAULT NULL,
  `kotaKonsumen` varchar(20) DEFAULT NULL,
  `telpKonsumen` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbkonsumen`
--

INSERT INTO `tbkonsumen` (`KodeKonsumen`, `NamaKonsumen`, `AlamatKonsumen`, `kotaKonsumen`, `telpKonsumen`) VALUES
('K01', 'Alex Turner', 'Jl. Sukabirus', 'Bandung', '0812666999'),
('K02', 'Yorudomo Xenophile', 'Jl. Sukapura', 'Bandung', '0851000333');

-- --------------------------------------------------------

--
-- Table structure for table `tbmerk`
--

CREATE TABLE `tbmerk` (
  `KodeMerk` varchar(2) NOT NULL,
  `NamaMerk` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbmerk`
--

INSERT INTO `tbmerk` (`KodeMerk`, `NamaMerk`) VALUES
('M1', 'Apple'),
('M2', 'Nestle');

-- --------------------------------------------------------

--
-- Table structure for table `tbsatuan`
--

CREATE TABLE `tbsatuan` (
  `KodeSatuan` varchar(2) NOT NULL,
  `NamaSatuan` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbsatuan`
--

INSERT INTO `tbsatuan` (`KodeSatuan`, `NamaSatuan`) VALUES
('S1', 'Kg'),
('S2', 'Kg');

-- --------------------------------------------------------

--
-- Table structure for table `tbsupplier`
--

CREATE TABLE `tbsupplier` (
  `KodeSupplier` varchar(4) NOT NULL,
  `NamaSupplier` varchar(60) DEFAULT NULL,
  `AlamatSupplier` varchar(100) DEFAULT NULL,
  `KotaSupplier` varchar(20) DEFAULT NULL,
  `TelpSupplier` varchar(25) DEFAULT NULL,
  `FaxSupplier` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbsupplier`
--

INSERT INTO `tbsupplier` (`KodeSupplier`, `NamaSupplier`, `AlamatSupplier`, `KotaSupplier`, `TelpSupplier`, `FaxSupplier`) VALUES
('SP1', 'Apple Authorized ', 'Jl. Sudirman', 'Jakarta', '021666543', '11223'),
('SP2', 'Nestle Indonesia', 'Jl. Tb. Simatupang', 'Jakarta', '021342123', '12502');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbbarang`
--
ALTER TABLE `tbbarang`
  ADD PRIMARY KEY (`KodeBarang`),
  ADD KEY `KodeJenis` (`KodeJenis`),
  ADD KEY `KodeMerk` (`KodeMerk`),
  ADD KEY `KodeSupplier` (`KodeSupplier`);

--
-- Indexes for table `tbbelidetail`
--
ALTER TABLE `tbbelidetail`
  ADD KEY `FakturBeli` (`FakturBeli`),
  ADD KEY `KodeBarang` (`KodeBarang`);

--
-- Indexes for table `tbbelimaster`
--
ALTER TABLE `tbbelimaster`
  ADD PRIMARY KEY (`FakturBeli`),
  ADD KEY `KodeSupplier` (`KodeSupplier`);

--
-- Indexes for table `tbjenis`
--
ALTER TABLE `tbjenis`
  ADD PRIMARY KEY (`KodeJenis`);

--
-- Indexes for table `tbjualdetail`
--
ALTER TABLE `tbjualdetail`
  ADD KEY `FakturJual` (`FakturJual`),
  ADD KEY `KodeBarang` (`KodeBarang`);

--
-- Indexes for table `tbjualmaster`
--
ALTER TABLE `tbjualmaster`
  ADD PRIMARY KEY (`FakturJual`),
  ADD KEY `KodeKonsumen` (`KodeKonsumen`);

--
-- Indexes for table `tbkonsumen`
--
ALTER TABLE `tbkonsumen`
  ADD PRIMARY KEY (`KodeKonsumen`);

--
-- Indexes for table `tbmerk`
--
ALTER TABLE `tbmerk`
  ADD PRIMARY KEY (`KodeMerk`);

--
-- Indexes for table `tbsatuan`
--
ALTER TABLE `tbsatuan`
  ADD PRIMARY KEY (`KodeSatuan`);

--
-- Indexes for table `tbsupplier`
--
ALTER TABLE `tbsupplier`
  ADD PRIMARY KEY (`KodeSupplier`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbbarang`
--
ALTER TABLE `tbbarang`
  ADD CONSTRAINT `tbbarang_ibfk_1` FOREIGN KEY (`KodeJenis`) REFERENCES `tbjenis` (`KodeJenis`),
  ADD CONSTRAINT `tbbarang_ibfk_2` FOREIGN KEY (`KodeMerk`) REFERENCES `tbmerk` (`KodeMerk`),
  ADD CONSTRAINT `tbbarang_ibfk_3` FOREIGN KEY (`KodeSupplier`) REFERENCES `tbsupplier` (`KodeSupplier`);

--
-- Constraints for table `tbbelidetail`
--
ALTER TABLE `tbbelidetail`
  ADD CONSTRAINT `tbbelidetail_ibfk_1` FOREIGN KEY (`FakturBeli`) REFERENCES `tbbelimaster` (`FakturBeli`),
  ADD CONSTRAINT `tbbelidetail_ibfk_2` FOREIGN KEY (`KodeBarang`) REFERENCES `tbbarang` (`KodeBarang`);

--
-- Constraints for table `tbbelimaster`
--
ALTER TABLE `tbbelimaster`
  ADD CONSTRAINT `tbbelimaster_ibfk_1` FOREIGN KEY (`KodeSupplier`) REFERENCES `tbsupplier` (`KodeSupplier`);

--
-- Constraints for table `tbjualdetail`
--
ALTER TABLE `tbjualdetail`
  ADD CONSTRAINT `tbjualdetail_ibfk_1` FOREIGN KEY (`FakturJual`) REFERENCES `tbjualmaster` (`FakturJual`),
  ADD CONSTRAINT `tbjualdetail_ibfk_2` FOREIGN KEY (`KodeBarang`) REFERENCES `tbbarang` (`KodeBarang`);

--
-- Constraints for table `tbjualmaster`
--
ALTER TABLE `tbjualmaster`
  ADD CONSTRAINT `tbjualmaster_ibfk_1` FOREIGN KEY (`KodeKonsumen`) REFERENCES `tbkonsumen` (`KodeKonsumen`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
