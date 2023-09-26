-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Sep 2023 pada 10.32
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mod2_kel09_sbd`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(3) NOT NULL,
  `nama_admin` varchar(30) NOT NULL,
  `alamat` varchar(15) DEFAULT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `alamat`, `username`, `password`) VALUES
(1, 'burhan', 'semarang', 'burburr', 'burhan123'),
(2, 'pramono', 'demak city', 'prampokan', 'rampok123'),
(3, 'sam', 'salatiga', 'samwell', '123'),
(4, 'azzam', 'bulusan', 'azzammdev', 'wow123'),
(5, 'rafly', 'manyaran', 'raphly', 'geberbor'),
(6, 'fatan', 'mbalang city', 'atmin', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `doswal`
--

CREATE TABLE `doswal` (
  `NIP` int(3) NOT NULL,
  `nama_dosen` varchar(255) NOT NULL,
  `alamat_dosen` varchar(255) NOT NULL,
  `usia` varchar(3) NOT NULL,
  `konsentrasi` varchar(255) NOT NULL,
  `id_doswal` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `doswal`
--

INSERT INTO `doswal` (`NIP`, `nama_dosen`, `alamat_dosen`, `usia`, `konsentrasi`, `id_doswal`) VALUES
(111, 'samwel', 'salatiga', '19', 'android', 1),
(222, 'rafli', 'semarang city', '19', 'program', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` int(3) NOT NULL,
  `id_doswal` int(3) NOT NULL,
  `nama_mahasiswa` varchar(255) NOT NULL,
  `alamat_mahasiswa` varchar(255) NOT NULL,
  `usia` varchar(3) NOT NULL,
  `uk_sepatu` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `id_doswal`, `nama_mahasiswa`, `alamat_mahasiswa`, `usia`, `uk_sepatu`) VALUES
(1, 111, 'sam', 'salatiga', '19', '40'),
(2, 222, 'fat', 'semarang', '19', '40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(3) NOT NULL,
  `merk` varchar(25) NOT NULL,
  `stock` int(3) NOT NULL,
  `harga` int(8) NOT NULL,
  `id_admin` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `merk`, `stock`, `harga`, `id_admin`) VALUES
(1, 'relaxa', 30, 5000, 1),
(2, 'indomie', 25, 7000, 2),
(3, 'mie sedap', 20, 6000, 3),
(4, 'big babol', 15, 3000, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `doswal`
--
ALTER TABLE `doswal`
  ADD PRIMARY KEY (`NIP`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`),
  ADD KEY `FK_doswal` (`id_doswal`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `FK_admin` (`id_admin`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `FK_doswal` FOREIGN KEY (`id_doswal`) REFERENCES `doswal` (`NIP`);

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `FK_admin` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
