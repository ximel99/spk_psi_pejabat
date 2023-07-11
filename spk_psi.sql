-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 13 Jul 2021 pada 05.45
-- Versi Server: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk_psi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alternatif`
--

CREATE TABLE IF NOT EXISTS `alternatif` (
  `id_alternatif` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `alternatif`
--

INSERT INTO `alternatif` (`id_alternatif`, `nama`) VALUES
(16, 'Alternatif 1'),
(17, 'Alternatif 2'),
(18, 'Alternatif 3'),
(19, 'Alternatif 4'),
(20, 'Alternatif 5'),
(21, 'Alternatif 6'),
(22, 'Alternatif 7'),
(23, 'Alternatif 8'),
(24, 'Alternatif 9'),
(25, 'Alternatif 10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bobot`
--

CREATE TABLE IF NOT EXISTS `bobot` (
  `id_bobot` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai` float(10,4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bobot`
--

INSERT INTO `bobot` (`id_bobot`, `id_kriteria`, `nilai`) VALUES
(1, 22, 0.2874),
(2, 23, 0.3078),
(3, 24, 0.2194),
(4, 25, 0.1854);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil`
--

CREATE TABLE IF NOT EXISTS `hasil` (
  `id_hasil` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `nilai` float(10,4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `id_alternatif`, `nilai`) VALUES
(1, 16, 0.9384),
(2, 17, 0.6768),
(3, 18, 0.6887),
(4, 19, 0.7095),
(5, 20, 0.7628),
(6, 21, 0.9258),
(7, 22, 0.7931),
(8, 23, 0.7424),
(9, 24, 0.7601),
(10, 25, 0.6479);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE IF NOT EXISTS `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `kode_kriteria` varchar(100) NOT NULL,
  `jenis` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `keterangan`, `kode_kriteria`, `jenis`) VALUES
(22, 'Kinerja', 'C1', 'Benefit'),
(23, 'Kompetensi', 'C2', 'Benefit'),
(24, 'Disipilin', 'C3', 'Benefit'),
(25, 'Loyalitas', 'C4', 'Benefit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `normalisasi`
--

CREATE TABLE IF NOT EXISTS `normalisasi` (
  `id_normalisasi` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai` float(6,1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `normalisasi`
--

INSERT INTO `normalisasi` (`id_normalisasi`, `id_kriteria`, `nilai`) VALUES
(1, 22, 1.0),
(2, 23, 0.8),
(3, 24, 1.0),
(4, 25, 1.0),
(5, 22, 0.8),
(6, 23, 0.4),
(7, 24, 0.8),
(8, 25, 0.8),
(9, 22, 0.8),
(10, 23, 0.8),
(11, 24, 0.8),
(12, 25, 0.2),
(13, 22, 0.4),
(14, 23, 1.0),
(15, 24, 0.8),
(16, 25, 0.6),
(17, 22, 0.8),
(18, 23, 0.8),
(19, 24, 0.8),
(20, 25, 0.6),
(21, 22, 1.0),
(22, 23, 1.0),
(23, 24, 1.0),
(24, 25, 0.6),
(25, 22, 0.8),
(26, 23, 0.8),
(27, 24, 0.6),
(28, 25, 1.0),
(29, 22, 0.6),
(30, 23, 0.8),
(31, 24, 0.8),
(32, 25, 0.8),
(33, 22, 0.6),
(34, 23, 1.0),
(35, 24, 0.6),
(36, 25, 0.8),
(37, 22, 0.6),
(38, 23, 0.8),
(39, 24, 0.2),
(40, 25, 1.0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian`
--

CREATE TABLE IF NOT EXISTS `penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penilaian`
--

INSERT INTO `penilaian` (`id_penilaian`, `id_alternatif`, `id_kriteria`, `nilai`) VALUES
(101, 16, 22, 81),
(102, 16, 23, 87),
(103, 16, 24, 91),
(104, 16, 25, 96),
(105, 17, 22, 82),
(106, 17, 23, 89),
(107, 17, 24, 92),
(108, 17, 25, 97),
(109, 18, 22, 82),
(110, 18, 23, 87),
(111, 18, 24, 92),
(112, 18, 25, 100),
(113, 19, 22, 84),
(114, 19, 23, 86),
(115, 19, 24, 92),
(116, 19, 25, 98),
(117, 20, 22, 82),
(118, 20, 23, 87),
(119, 20, 24, 92),
(120, 20, 25, 98),
(121, 21, 22, 81),
(122, 21, 23, 86),
(123, 21, 24, 91),
(124, 21, 25, 98),
(125, 22, 22, 82),
(126, 22, 23, 87),
(127, 22, 24, 93),
(128, 22, 25, 96),
(129, 23, 22, 83),
(130, 23, 23, 87),
(131, 23, 24, 92),
(132, 23, 25, 97),
(133, 24, 22, 83),
(134, 24, 23, 86),
(135, 24, 24, 93),
(136, 24, 25, 97),
(137, 25, 22, 83),
(138, 25, 23, 87),
(139, 25, 24, 95),
(140, 25, 25, 96);

-- --------------------------------------------------------

--
-- Struktur dari tabel `preferensi`
--

CREATE TABLE IF NOT EXISTS `preferensi` (
  `id_preferensi` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai` float(10,4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `preferensi`
--

INSERT INTO `preferensi` (`id_preferensi`, `id_kriteria`, `nilai`) VALUES
(1, 22, 0.0676),
(2, 23, 0.0004),
(3, 24, 0.0676),
(4, 25, 0.0676),
(5, 22, 0.0036),
(6, 23, 0.1764),
(7, 24, 0.0036),
(8, 25, 0.0036),
(9, 22, 0.0036),
(10, 23, 0.0004),
(11, 24, 0.0036),
(12, 25, 0.2916),
(13, 22, 0.1156),
(14, 23, 0.0324),
(15, 24, 0.0036),
(16, 25, 0.0196),
(17, 22, 0.0036),
(18, 23, 0.0004),
(19, 24, 0.0036),
(20, 25, 0.0196),
(21, 22, 0.0676),
(22, 23, 0.0324),
(23, 24, 0.0676),
(24, 25, 0.0196),
(25, 22, 0.0036),
(26, 23, 0.0004),
(27, 24, 0.0196),
(28, 25, 0.0676),
(29, 22, 0.0196),
(30, 23, 0.0004),
(31, 24, 0.0036),
(32, 25, 0.0036),
(33, 22, 0.0196),
(34, 23, 0.0324),
(35, 24, 0.0196),
(36, 25, 0.0036),
(37, 22, 0.0196),
(38, 23, 0.0004),
(39, 24, 0.2916),
(40, 25, 0.0676);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_kriteria`
--

CREATE TABLE IF NOT EXISTS `sub_kriteria` (
  `id_sub_kriteria` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `nilai` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sub_kriteria`
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
(100, 25, 'Tidak Baik', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
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
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `id_user_level`, `nama`, `email`, `username`, `password`) VALUES
(1, 1, 'Admin', 'admin@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(7, 2, 'User', 'user@gmail.com', 'user', 'ee11cbb19052e40b07aac0ca060c23ee');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_level`
--

CREATE TABLE IF NOT EXISTS `user_level` (
  `id_user_level` int(11) NOT NULL,
  `user_level` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_level`
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
  ADD PRIMARY KEY (`id_bobot`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `id_alternatif` (`id_alternatif`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `normalisasi`
--
ALTER TABLE `normalisasi`
  ADD PRIMARY KEY (`id_normalisasi`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_penilaian`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_kriteria` (`id_kriteria`),
  ADD KEY `nilai` (`nilai`);

--
-- Indexes for table `preferensi`
--
ALTER TABLE `preferensi`
  ADD PRIMARY KEY (`id_preferensi`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  ADD PRIMARY KEY (`id_sub_kriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user_level` (`id_user_level`);

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
  MODIFY `id_bobot` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `normalisasi`
--
ALTER TABLE `normalisasi`
  MODIFY `id_normalisasi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `preferensi`
--
ALTER TABLE `preferensi`
  MODIFY `id_preferensi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  MODIFY `id_sub_kriteria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
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
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bobot`
--
ALTER TABLE `bobot`
  ADD CONSTRAINT `bobot_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `normalisasi`
--
ALTER TABLE `normalisasi`
  ADD CONSTRAINT `normalisasi_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penilaian_ibfk_3` FOREIGN KEY (`nilai`) REFERENCES `sub_kriteria` (`id_sub_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `preferensi`
--
ALTER TABLE `preferensi`
  ADD CONSTRAINT `preferensi_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  ADD CONSTRAINT `sub_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_user_level`) REFERENCES `user_level` (`id_user_level`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
