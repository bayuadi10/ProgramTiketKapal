-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Des 2018 pada 19.50
-- Versi server: 10.1.30-MariaDB
-- Versi PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiket_kapal`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`username`, `password`) VALUES
('uyee', '202cb962ac59075b964b07152d234b70'),
('anisa', '202cb962ac59075b964b07152d234b70'),
('a', '0cc175b9c0f1b6a831c399e269772661'),
('Bayu', '58b4e38f66bcdb546380845d6af27187');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kapal`
--

CREATE TABLE `kapal` (
  `nama_kapal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kapal`
--

INSERT INTO `kapal` (`nama_kapal`) VALUES
('Argo Parahyangan'),
('Lodaya'),
('Malabar'),
('Senja Utama'),
('Taksaka');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penumpang`
--

CREATE TABLE `penumpang` (
  `nik` varchar(16) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penumpang`
--

INSERT INTO `penumpang` (`nik`, `nama`, `gender`) VALUES
('1234', 'bayu', 'Laki - Laki'),
('1781912', 'Bayu Adi Pratama', 'Laki - Laki'),
('7676', 'Intan', 'Perempuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayatpembelian`
--

CREATE TABLE `riwayatpembelian` (
  `id_tiket` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `tgl_beli` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `riwayatpembelian`
--

INSERT INTO `riwayatpembelian` (`id_tiket`, `nik`, `tgl_beli`) VALUES
(19, '7676', '2018-12-15 04:11:00'),
(17, '1234', '2018-12-30 12:11:00'),
(19, '1781912', '2018-12-30 10:21:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rute`
--

CREATE TABLE `rute` (
  `id_rute` int(11) NOT NULL,
  `berangkat` varchar(50) NOT NULL,
  `tujuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rute`
--

INSERT INTO `rute` (`id_rute`, `berangkat`, `tujuan`) VALUES
(1, 'Surabaya', 'Makasar'),
(2, 'Makasar', 'Surabaya'),
(3, 'Banjarmasin', 'Semarang'),
(4, 'Semarang', 'Banjarmasin'),
(5, 'Sorong', 'Ternate'),
(6, 'Ternate', 'Sorong');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` int(11) NOT NULL,
  `nama_kapal` varchar(50) DEFAULT NULL,
  `id_rute` int(11) NOT NULL,
  `waktu` datetime NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tiket`
--

INSERT INTO `tiket` (`id_tiket`, `nama_kapal`, `id_rute`, `waktu`, `harga`) VALUES
(11, 'Malabar', 3, '2018-12-12 07:10:10', 100000),
(17, 'Argo Parahyangan', 1, '2018-03-03 03:30:00', 450000),
(19, 'Lodaya', 2, '2018-02-02 13:30:00', 350000),
(20, 'Taksaka', 1, '2018-12-08 14:21:00', 100000),
(21, 'Argo Parahyangan', 1, '2019-09-09 04:42:00', 120000),
(22, 'Argo Parahyangan', 1, '2019-09-27 18:13:00', 200000),
(23, 'Senja Utama', 1, '2019-02-08 00:00:00', 200000),
(24, 'Argo Parahyangan', 6, '2019-02-08 00:00:00', 2000000),
(25, 'Argo Parahyangan', 1, '2019-05-05 00:00:00', 500000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kapal`
--
ALTER TABLE `kapal`
  ADD PRIMARY KEY (`nama_kapal`);

--
-- Indeks untuk tabel `penumpang`
--
ALTER TABLE `penumpang`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `riwayatpembelian`
--
ALTER TABLE `riwayatpembelian`
  ADD KEY `id_tiket` (`id_tiket`),
  ADD KEY `nik` (`nik`);

--
-- Indeks untuk tabel `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`id_rute`);

--
-- Indeks untuk tabel `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `nama_kereta` (`nama_kapal`),
  ADD KEY `id_rute` (`id_rute`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `rute`
--
ALTER TABLE `rute`
  MODIFY `id_rute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id_tiket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `riwayatpembelian`
--
ALTER TABLE `riwayatpembelian`
  ADD CONSTRAINT `riwayatpembelian_ibfk_1` FOREIGN KEY (`id_tiket`) REFERENCES `tiket` (`id_tiket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `riwayatpembelian_ibfk_2` FOREIGN KEY (`nik`) REFERENCES `penumpang` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`nama_kapal`) REFERENCES `kapal` (`nama_kapal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tiket_ibfk_2` FOREIGN KEY (`id_rute`) REFERENCES `rute` (`id_rute`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
