-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Apr 2021 pada 07.27
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(7) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `no_telepon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `username`, `password`, `no_telepon`) VALUES
(1, 'admin', 'admin', 'admin', '088882738'),
(7946417, 'lalapo', 'lala', 'lala', '547389'),
(10877582, 'hayu', 'hayu', 'hayu', '94'),
(3015594, 'jojo', 'jojo', 'jojo', '223'),
(9353940, 'wo', 'wo', 'wo', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(7) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `tahun` varchar(20) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `stok` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `pengarang`, `penerbit`, `tahun`, `genre`, `stok`) VALUES
(11111110, 'Mandalika', 'JJ. Thompson', 'Sinarpadiu', '2019', 'Novel', 7),
(11111111, 'Data Mining', 'Dr gunawan', 'Informatika Bandung', '2021', 'Pelajaran', 2),
(11111112, 'Dear Nathan', 'J.Andika', 'Gramedia', '2018', 'Novel', 12),
(11111113, 'Permrograman Web', 'wilis', 'Yudistira', '2005', 'Pelajaran', 14);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tanggal_bergabung` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nama`, `tanggal_bergabung`) VALUES
(2113191070, 'Adistia Ramadhani', '2021-04-24 00:00:00'),
(2113191071, 'T. Taufiq ali', '2021-04-24 00:00:00'),
(2113191072, 'M Taufiq ilham', '2021-04-23 00:00:00'),
(2113191073, 'Dara atria', '2021-04-22 00:00:00'),
(2113191079, 'Isep Lutpi Nur', '2021-04-29 00:00:00'),
(2113191080, 'Irfan Ramdani', '2021-04-24 17:29:57'),
(2113191085, 'Cece Supriatna', '2021-04-25 12:10:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(7) NOT NULL,
  `npm` int(11) DEFAULT NULL,
  `status` enum('Dipinjam','Dikembalikan','Dikembalikan Separuh') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `npm`, `status`) VALUES
(43, 2113191070, 'Dikembalikan'),
(44, 2113191072, 'Dikembalikan Separuh'),
(45, 2113191071, 'Dikembalikan'),
(46, 2113191070, 'Dikembalikan Separuh'),
(47, 2113191079, 'Dipinjam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman_detail`
--

CREATE TABLE `peminjaman_detail` (
  `id` int(11) NOT NULL,
  `id_peminjaman` int(11) DEFAULT NULL,
  `npm` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tenggat_pinjam` date NOT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status` enum('Dipinjam','Dikembalikan') NOT NULL,
  `denda` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjaman_detail`
--

INSERT INTO `peminjaman_detail` (`id`, `id_peminjaman`, `npm`, `id_buku`, `tanggal_pinjam`, `tenggat_pinjam`, `tanggal_kembali`, `status`, `denda`) VALUES
(38, 43, 2113191070, 11111113, '2021-04-25', '2021-05-09', '0000-00-00', 'Dikembalikan', 0),
(39, 43, 2113191070, 11111112, '2021-04-25', '2021-05-09', NULL, 'Dikembalikan', 0),
(40, 43, 2113191070, 11111111, '2021-04-25', '2021-05-09', NULL, 'Dikembalikan', 0),
(41, 44, 2113191072, 11111110, '2021-04-25', '2021-05-09', '2021-04-26', 'Dikembalikan', 0),
(42, 44, 2113191072, 11111111, '2021-04-25', '2021-05-09', NULL, 'Dipinjam', 0),
(43, 44, 2113191072, 11111112, '2021-04-25', '2021-05-09', NULL, 'Dipinjam', 0),
(44, 45, 2113191071, 11111111, '2021-04-25', '2021-04-01', '2021-04-26', 'Dikembalikan', 25000),
(45, 46, 2113191070, 11111111, '2021-04-25', '2021-05-09', NULL, 'Dipinjam', 0),
(46, 46, 2113191070, 11111113, '2021-04-25', '2021-05-09', '2021-04-26', 'Dikembalikan', 0),
(47, 46, 2113191070, 11111112, '2021-04-25', '2021-05-09', NULL, 'Dipinjam', 0),
(48, 47, 2113191079, 11111111, '2021-04-26', '2021-05-10', NULL, 'Dipinjam', 0),
(49, 47, 2113191079, 11111113, '2021-04-26', '2021-05-10', NULL, 'Dipinjam', 0),
(50, 47, 2113191079, 11111112, '2021-04-26', '2021-05-10', NULL, 'Dipinjam', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `npm` (`npm`);

--
-- Indeks untuk tabel `peminjaman_detail`
--
ALTER TABLE `peminjaman_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peminjaman_detail_ibfk_1` (`id_buku`),
  ADD KEY `npm` (`npm`),
  ADD KEY `id_peminjaman` (`id_peminjaman`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `peminjaman_detail`
--
ALTER TABLE `peminjaman_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `peminjaman_detail`
--
ALTER TABLE `peminjaman_detail`
  ADD CONSTRAINT `peminjaman_detail_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_detail_ibfk_2` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_detail_ibfk_3` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
