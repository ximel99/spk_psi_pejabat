-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2023 at 10:14 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `psi`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternatif`
--

CREATE TABLE IF NOT EXISTS `alternatif` (
`id_alternatif` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alternatif`
--

INSERT INTO `alternatif` (`id_alternatif`, `nama`) VALUES
(16, 'JOKOWI'),
(17, 'PRABOWO'),
(18, 'PUAN MAHARANI'),
(19, 'MEGAWATI'),
(20, 'SBY'),
(21, 'AHOK'),
(22, 'ANIS'),
(23, 'ROCKY GERUNG'),
(24, 'AHMAD DANI'),
(25, 'KAKA SLANK');

-- --------------------------------------------------------

--
-- Table structure for table `bobot`
--

CREATE TABLE IF NOT EXISTS `bobot` (
`id_bobot` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai` float(10,4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bobot`
--

INSERT INTO `bobot` (`id_bobot`, `id_kriteria`, `nilai`) VALUES
(1, 22, 0.2739),
(2, 23, 0.3189),
(3, 24, 0.0638),
(4, 25, 0.2739),
(5, 26, 0.0695);

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE IF NOT EXISTS `hasil` (
`id_hasil` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `nilai` float(10,4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `id_alternatif`, `nilai`) VALUES
(1, 16, 0.7719),
(2, 17, 0.7179),
(3, 18, 0.8223),
(4, 19, 0.8229),
(5, 20, 0.8223),
(6, 21, 0.9452),
(7, 22, 0.7968),
(8, 23, 0.6571),
(9, 24, 0.8289),
(10, 25, 0.6660);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE IF NOT EXISTS `kriteria` (
`id_kriteria` int(11) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `kode_kriteria` varchar(100) NOT NULL,
  `jenis` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `keterangan`, `kode_kriteria`, `jenis`) VALUES
(22, 'PENGALAMAN', 'C1', 'Benefit'),
(23, 'PERILAKU', 'C2', 'Benefit'),
(24, 'KERJA NYATA', 'C3', 'Benefit'),
(25, 'B.INGGRIS', 'C4', 'Benefit'),
(26, 'KORUPSI', 'C5', 'Benefit');

-- --------------------------------------------------------

--
-- Table structure for table `normalisasi`
--

CREATE TABLE IF NOT EXISTS `normalisasi` (
`id_normalisasi` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai` float(6,1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `normalisasi`
--

INSERT INTO `normalisasi` (`id_normalisasi`, `id_kriteria`, `nilai`) VALUES
(1, 22, 1.0),
(2, 23, 0.8),
(3, 24, 1.0),
(4, 25, 0.4),
(5, 26, 1.0),
(6, 22, 0.8),
(7, 23, 0.4),
(8, 24, 0.8),
(9, 25, 1.0),
(10, 26, 0.7),
(11, 22, 0.8),
(12, 23, 0.8),
(13, 24, 0.8),
(14, 25, 1.0),
(15, 26, 0.3),
(16, 22, 0.4),
(17, 23, 1.0),
(18, 24, 0.8),
(19, 25, 1.0),
(20, 26, 1.0),
(21, 22, 0.8),
(22, 23, 0.8),
(23, 24, 0.8),
(24, 25, 1.0),
(25, 26, 0.3),
(26, 22, 1.0),
(27, 23, 1.0),
(28, 24, 1.0),
(29, 25, 0.8),
(30, 26, 1.0),
(31, 22, 0.8),
(32, 23, 0.8),
(33, 24, 0.4),
(34, 25, 1.0),
(35, 26, 0.3),
(36, 22, 0.4),
(37, 23, 0.6),
(38, 24, 0.2),
(39, 25, 1.0),
(40, 26, 1.0),
(41, 22, 0.6),
(42, 23, 1.0),
(43, 24, 0.4),
(44, 25, 1.0),
(45, 26, 0.7),
(46, 22, 0.6),
(47, 23, 0.8),
(48, 24, 0.2),
(49, 25, 0.6),
(50, 26, 1.0);

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE IF NOT EXISTS `penilaian` (
`id_penilaian` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`id_penilaian`, `id_alternatif`, `id_kriteria`, `nilai`) VALUES
(101, 16, 22, 81),
(102, 16, 23, 87),
(103, 16, 24, 91),
(104, 16, 25, 99),
(105, 17, 22, 82),
(106, 17, 23, 89),
(107, 17, 24, 92),
(108, 17, 25, 96),
(109, 18, 22, 82),
(110, 18, 23, 87),
(111, 18, 24, 92),
(112, 18, 25, 96),
(113, 19, 22, 84),
(114, 19, 23, 86),
(115, 19, 24, 92),
(116, 19, 25, 96),
(117, 20, 22, 82),
(118, 20, 23, 87),
(119, 20, 24, 92),
(120, 20, 25, 96),
(121, 21, 22, 81),
(122, 21, 23, 86),
(123, 21, 24, 91),
(124, 21, 25, 97),
(125, 22, 22, 82),
(126, 22, 23, 87),
(127, 22, 24, 94),
(128, 22, 25, 96),
(129, 23, 22, 84),
(130, 23, 23, 88),
(131, 23, 24, 95),
(132, 23, 25, 96),
(133, 24, 22, 83),
(134, 24, 23, 86),
(135, 24, 24, 94),
(136, 24, 25, 96),
(137, 25, 22, 83),
(138, 25, 23, 87),
(139, 25, 24, 95),
(140, 25, 25, 98),
(141, 16, 26, 101),
(142, 17, 26, 102),
(143, 18, 26, 103),
(144, 19, 26, 101),
(145, 20, 26, 103),
(146, 21, 26, 101),
(147, 22, 26, 103),
(148, 23, 26, 101),
(149, 24, 26, 102),
(150, 25, 26, 101);

-- --------------------------------------------------------

--
-- Table structure for table `preferensi`
--

CREATE TABLE IF NOT EXISTS `preferensi` (
`id_preferensi` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai` float(10,4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `preferensi`
--

INSERT INTO `preferensi` (`id_preferensi`, `id_kriteria`, `nilai`) VALUES
(1, 22, 0.0784),
(2, 23, 0.0000),
(3, 24, 0.1296),
(4, 25, 0.2304),
(5, 26, 0.0729),
(6, 22, 0.0064),
(7, 23, 0.1600),
(8, 24, 0.0256),
(9, 25, 0.0144),
(10, 26, 0.0036),
(11, 22, 0.0064),
(12, 23, 0.0000),
(13, 24, 0.0256),
(14, 25, 0.0144),
(15, 26, 0.1600),
(16, 22, 0.1024),
(17, 23, 0.0400),
(18, 24, 0.0256),
(19, 25, 0.0144),
(20, 26, 0.0729),
(21, 22, 0.0064),
(22, 23, 0.0000),
(23, 24, 0.0256),
(24, 25, 0.0144),
(25, 26, 0.1600),
(26, 22, 0.0784),
(27, 23, 0.0400),
(28, 24, 0.1296),
(29, 25, 0.0064),
(30, 26, 0.0729),
(31, 22, 0.0064),
(32, 23, 0.0000),
(33, 24, 0.0576),
(34, 25, 0.0144),
(35, 26, 0.1600),
(36, 22, 0.1024),
(37, 23, 0.0400),
(38, 24, 0.1936),
(39, 25, 0.0144),
(40, 26, 0.0729),
(41, 22, 0.0144),
(42, 23, 0.0400),
(43, 24, 0.0576),
(44, 25, 0.0144),
(45, 26, 0.0036),
(46, 22, 0.0144),
(47, 23, 0.0000),
(48, 24, 0.1936),
(49, 25, 0.0784),
(50, 26, 0.0729);

-- --------------------------------------------------------

--
-- Table structure for table `sub_kriteria`
--

CREATE TABLE IF NOT EXISTS `sub_kriteria` (
`id_sub_kriteria` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `nilai` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_kriteria`
--

INSERT INTO `sub_kriteria` (`id_sub_kriteria`, `id_kriteria`, `deskripsi`, `nilai`) VALUES
(81, 22, 'Sangat Baik', 5),
(82, 22, 'Baik', 4),
(83, 22, 'Cukup', 3),
(84, 22, 'Kurang Baik', 2),
(85, 22, 'Tidak Baik', 1),
(86, 23, 'Sangat Baik', 5),
(87, 23, 'Baik', 4),
(88, 23, 'Cukup', 3),
(89, 23, 'Kurang Baik', 2),
(90, 23, 'Tidak Baik', 1),
(91, 24, 'Sangat Baik', 5),
(92, 24, 'Baik', 4),
(93, 24, 'Cukup', 3),
(94, 24, 'Kurang Baik', 2),
(95, 24, 'Tidak Baik', 1),
(96, 25, 'Sangat Baik', 5),
(97, 25, 'Baik', 4),
(98, 25, 'Cukup', 3),
(99, 25, 'Kurang Baik', 2),
(100, 25, 'Tidak Baik', 1),
(101, 26, 'Sedikit', 3),
(102, 26, 'Cukup', 2),
(103, 26, 'Sangat Banyak Bnaget', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id_user` int(11) NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_user_level`, `nama`, `email`, `username`, `password`) VALUES
(1, 1, 'Admin', 'admin@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(7, 2, 'User', 'user@gmail.com', 'user', 'ee11cbb19052e40b07aac0ca060c23ee');

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE IF NOT EXISTS `user_level` (
`id_user_level` int(11) NOT NULL,
  `user_level` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`id_user_level`, `user_level`) VALUES
(1, 'Administrator'),
(2, 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternatif`
--
ALTER TABLE `alternatif`
 ADD PRIMARY KEY (`id_alternatif`);

--
-- Indexes for table `bobot`
--
ALTER TABLE `bobot`
 ADD PRIMARY KEY (`id_bobot`), ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
 ADD PRIMARY KEY (`id_hasil`), ADD KEY `id_alternatif` (`id_alternatif`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
 ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `normalisasi`
--
ALTER TABLE `normalisasi`
 ADD PRIMARY KEY (`id_normalisasi`), ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
 ADD PRIMARY KEY (`id_penilaian`), ADD KEY `id_alternatif` (`id_alternatif`), ADD KEY `id_kriteria` (`id_kriteria`), ADD KEY `nilai` (`nilai`);

--
-- Indexes for table `preferensi`
--
ALTER TABLE `preferensi`
 ADD PRIMARY KEY (`id_preferensi`), ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
 ADD PRIMARY KEY (`id_sub_kriteria`), ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id_user`), ADD KEY `id_user_level` (`id_user_level`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
 ADD PRIMARY KEY (`id_user_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternatif`
--
ALTER TABLE `alternatif`
MODIFY `id_alternatif` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `bobot`
--
ALTER TABLE `bobot`
MODIFY `id_bobot` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `normalisasi`
--
ALTER TABLE `normalisasi`
MODIFY `id_normalisasi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT for table `preferensi`
--
ALTER TABLE `preferensi`
MODIFY `id_preferensi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
MODIFY `id_sub_kriteria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
MODIFY `id_user_level` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bobot`
--
ALTER TABLE `bobot`
ADD CONSTRAINT `bobot_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasil`
--
ALTER TABLE `hasil`
ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `normalisasi`
--
ALTER TABLE `normalisasi`
ADD CONSTRAINT `normalisasi_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `penilaian_ibfk_3` FOREIGN KEY (`nilai`) REFERENCES `sub_kriteria` (`id_sub_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `preferensi`
--
ALTER TABLE `preferensi`
ADD CONSTRAINT `preferensi_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
ADD CONSTRAINT `sub_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_user_level`) REFERENCES `user_level` (`id_user_level`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
