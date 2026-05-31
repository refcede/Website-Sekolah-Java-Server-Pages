-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Bulan Mei 2026 pada 08.22
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_manajemen_siswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id_absensi` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('Hadir','Izin','Sakit','Alpa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`id_absensi`, `id_siswa`, `tanggal`, `status`) VALUES
(20, 20, '2025-11-11', 'Hadir'),
(22, 20, '2025-11-29', 'Hadir'),
(27, 20, '2025-11-12', 'Hadir'),
(75, 20, '2025-11-13', 'Hadir'),
(85, 20, '2025-11-14', 'Hadir'),
(97, 20, '2025-11-15', 'Hadir'),
(98, 20, '2025-11-17', 'Hadir'),
(100, 36, '2025-12-12', 'Hadir'),
(103, 20, '2025-12-16', 'Hadir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(1, 'Rekayasa Perangkat Lunak'),
(2, 'Teknik Komputer dan Jaringan'),
(3, 'Desain Komunikasi Visual'),
(6, 'Desain Grafis & Multimedia'),
(7, 'Otomotif'),
(8, 'Keperawatan'),
(10, 'IPS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan_mapel`
--

CREATE TABLE `jurusan_mapel` (
  `id` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan_mapel`
--

INSERT INTO `jurusan_mapel` (`id`, `id_jurusan`, `id_mapel`) VALUES
(634, 1, 1),
(635, 1, 2),
(636, 1, 3),
(637, 1, 4),
(638, 1, 5),
(639, 1, 6),
(640, 1, 7),
(641, 1, 8),
(642, 1, 9),
(697, 1, 200),
(698, 1, 201),
(699, 1, 202),
(700, 1, 203),
(701, 1, 204),
(702, 1, 205),
(703, 1, 206),
(643, 2, 1),
(644, 2, 2),
(645, 2, 3),
(646, 2, 4),
(647, 2, 5),
(648, 2, 6),
(649, 2, 7),
(650, 2, 8),
(651, 2, 9),
(704, 2, 220),
(705, 2, 221),
(706, 2, 222),
(707, 2, 223),
(708, 2, 224),
(709, 2, 225),
(710, 2, 226),
(652, 3, 1),
(653, 3, 2),
(654, 3, 3),
(655, 3, 4),
(656, 3, 5),
(657, 3, 6),
(658, 3, 7),
(659, 3, 8),
(660, 3, 9),
(711, 3, 120),
(712, 3, 121),
(713, 3, 122),
(714, 3, 123),
(715, 3, 124),
(716, 3, 125),
(717, 3, 126),
(718, 3, 127),
(719, 3, 128),
(670, 6, 1),
(671, 6, 2),
(672, 6, 3),
(673, 6, 4),
(674, 6, 5),
(675, 6, 6),
(676, 6, 7),
(677, 6, 8),
(678, 6, 9),
(728, 6, 120),
(729, 6, 121),
(730, 6, 122),
(731, 6, 123),
(732, 6, 124),
(733, 6, 125),
(734, 6, 126),
(735, 6, 127),
(736, 6, 128),
(679, 7, 1),
(680, 7, 2),
(681, 7, 3),
(682, 7, 4),
(683, 7, 5),
(684, 7, 6),
(685, 7, 7),
(686, 7, 8),
(687, 7, 9),
(737, 7, 160),
(738, 7, 161),
(739, 7, 162),
(740, 7, 163),
(741, 7, 164),
(742, 7, 165),
(743, 7, 166),
(688, 8, 1),
(689, 8, 2),
(690, 8, 3),
(691, 8, 4),
(692, 8, 5),
(693, 8, 6),
(694, 8, 7),
(695, 8, 8),
(696, 8, 9),
(744, 8, 140),
(745, 8, 141),
(746, 8, 142),
(747, 8, 143),
(748, 8, 144),
(749, 8, 145),
(750, 8, 146);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `id_jurusan`, `nama_kelas`) VALUES
(1, 1, '10-RPL'),
(2, 1, '11-RPL'),
(3, 1, '12-RPL'),
(4, 2, '10-TKJ'),
(5, 2, '11-TKJ'),
(7, 7, '10-Otomotif-1'),
(10, 6, '10-DKV-1'),
(11, 6, '11-DKV-1'),
(12, 3, '12-DKV-1'),
(13, 7, '12-Otomotif-1'),
(15, 8, '10-Keperawatan-1'),
(16, 6, '10-DKV-1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `id_mapel` int(11) NOT NULL,
  `nama_mapel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`id_mapel`, `nama_mapel`) VALUES
(1, 'Pendidikan Agama dan Budi Pekerti'),
(2, 'Pendidikan Pancasila dan Kewarganegaraan'),
(3, 'Bahasa Indonesia'),
(4, 'Matematika (Wajib)'),
(5, 'Sejarah Indonesia'),
(6, 'Bahasa Inggris'),
(7, 'Pendidikan Jasmani, Olahraga, dan Kesehatan (PJOK)'),
(8, 'Seni Budaya'),
(9, 'Pendidikan Kewirausahaan (PKK)'),
(100, 'Ekonomi Bisnis'),
(101, 'Administrasi Umum'),
(102, 'Akuntansi Dasar'),
(103, 'Praktikum Akuntansi Perusahaan Jasa & Dagang'),
(104, 'Praktikum Akuntansi Perusahaan Manufaktur'),
(105, 'Akuntansi Keuangan'),
(106, 'Komputer Akuntansi (MYOB/Zahir)'),
(107, 'Administrasi Pajak'),
(120, 'Dasar-dasar Seni Rupa'),
(121, 'Desain Grafis Percetakan'),
(122, 'Komputer Grafis (Photoshop & Illustrator)'),
(123, 'Tipografi'),
(124, 'Fotografi'),
(125, 'Videografi dan Sinematografi'),
(126, 'Editing Video (Premiere & After Effects)'),
(127, 'Animasi 2D dan 3D Dasar'),
(128, 'Desain Media Interaktif (UI/UX)'),
(140, 'Anatomi dan Fisiologi'),
(141, 'Kebutuhan Dasar Manusia (KDM)'),
(142, 'Etika Keperawatan'),
(143, 'Keterampilan Dasar Tindakan Keperawatan (KDTK)'),
(144, 'Ilmu Penyakit dan Pencegahannya'),
(145, 'Farmakologi Dasar'),
(146, 'Kesehatan Reproduksi'),
(160, 'Gambar Teknik Otomotif'),
(161, 'Pekerjaan Dasar Otomotif (PDO)'),
(162, 'Dasar-dasar Otomotif'),
(163, 'Pemeliharaan Mesin Kendaraan Ringan'),
(164, 'Pemeliharaan Sasis dan Pemindah Tenaga'),
(165, 'Pemeliharaan Kelistrikan Kendaraan Ringan'),
(166, 'Manajemen Bengkel Otomotif'),
(200, 'Sistem Komputer'),
(201, 'Pemrograman Dasar'),
(202, 'Basis Data (Database)'),
(203, 'Pemrograman Berorientasi Objek (PBO)'),
(204, 'Pemrograman Web (HTML, CSS, JS, PHP/Node.js)'),
(205, 'Pemrograman Perangkat Bergerak (Mobile)'),
(206, 'Desain Grafis Dasar untuk UI/UX'),
(220, 'Sistem Komputer'),
(221, 'Pemrograman Dasar'),
(222, 'Jaringan Dasar (Networking)'),
(223, 'Teknologi Jaringan (LAN, WAN)'),
(224, 'Administrasi Sistem Jaringan (Linux & Windows Server)'),
(225, 'Administrasi Infrastruktur Jaringan (Routing & Switching)'),
(226, 'Keamanan Jaringan (Network Security)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi`
--

CREATE TABLE `materi` (
  `id` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pertemuan_ke` int(11) NOT NULL,
  `nama_file` varchar(255) NOT NULL,
  `tanggal_upload` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `materi`
--

INSERT INTO `materi` (`id`, `id_guru`, `id_kelas`, `id_mapel`, `judul`, `pertemuan_ke`, `nama_file`, `tanggal_upload`) VALUES
(1, 1, 2, 221, 'Pengenalan Algorithma', 1, '1763119331937_PPT PERTEMUAN 1 - ALGORITMA DAN STRUKTUR DATA.pptx', '2025-11-14 11:22:11'),
(2, 2, 11, 102, 'JAVA WEB PROGRAMING', 1, '1765506974448_JAVA WEB PROGRAM.pdf', '2025-12-12 02:36:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `nilai_angka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_siswa`, `id_mapel`, `nilai_angka`) VALUES
(7, 20, 225, 100),
(8, 20, 1, 77),
(9, 20, 226, 100),
(20, 36, 4, 90),
(22, 20, 223, 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_tagihan` int(11) NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `bulan` int(2) DEFAULT NULL,
  `tahun` int(4) DEFAULT NULL,
  `jumlah_bayar` decimal(10,2) NOT NULL,
  `id_user_admin` int(11) DEFAULT NULL,
  `status` enum('pending','lunas','gagal') NOT NULL DEFAULT 'lunas',
  `metode_pembayaran` varchar(50) DEFAULT 'Manual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_siswa`, `id_tagihan`, `tanggal_bayar`, `bulan`, `tahun`, `jumlah_bayar`, `id_user_admin`, `status`, `metode_pembayaran`) VALUES
(34, 20, 2, '2025-11-13', 1, 2026, 1000000.00, 1, 'lunas', 'Tunai (Admin)'),
(35, 20, 1, '2025-11-13', 11, 2025, 150000.00, 1, 'lunas', 'Tunai (Admin)'),
(36, 20, 5, '2025-11-13', 1, 2026, 1000000.00, 1, 'lunas', 'Tunai (Admin)'),
(40, 20, 1, '2025-11-13', 2, 2026, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(41, 20, 1, '2025-11-13', 7, 2025, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(43, 20, 3, '2025-11-13', 1, 2026, 50000.00, 1, 'lunas', 'Tunai (Admin)'),
(44, 20, 1, '2025-11-13', 4, 2026, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(45, 20, 1, '2025-11-13', 10, 2025, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(53, 20, 1, '2025-11-13', 12, 2025, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(54, 20, 1, '2025-11-13', 2, 2026, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(58, 20, 1, '2025-11-14', 7, 2025, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(59, 20, 1, '2025-11-18', 3, 2026, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(60, 20, 1, '2025-11-29', 5, 2026, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(62, 20, 1, '2025-12-06', 7, 2025, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(63, 20, 1, '2025-12-06', 12, 2025, 150000.00, NULL, 'pending', 'Transfer Bank (VA)'),
(64, 20, 1, '2025-12-06', 7, 2025, 150000.00, NULL, 'pending', 'Transfer Bank (VA)'),
(65, 20, 1, '2025-12-06', 2, 2026, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(66, 20, 1, '2025-12-06', 11, 2025, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(67, 20, 1, '2025-12-06', 3, 2026, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(68, 20, 1, '2025-12-06', 8, 2025, 150000.00, NULL, 'pending', 'Transfer Bank (VA)'),
(69, 20, 1, '2025-12-06', 2, 2027, 150000.00, NULL, 'pending', 'Transfer Bank (VA)'),
(70, 20, 1, '2025-12-06', 2, 2027, 150000.00, NULL, 'pending', 'Transfer Bank (VA)'),
(71, 20, 1, '2025-12-06', 2, 2027, 150000.00, NULL, 'pending', 'Transfer Bank (VA)'),
(72, 20, 1, '2025-12-06', 1, 2027, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(73, 20, 1, '2025-12-06', 1, 2025, 1000000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(74, 30, 1, '2025-12-06', 1, 2026, 1000000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(75, 30, 1, '2025-12-06', 12, 2025, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(77, 36, 1, '2025-12-12', 6, 2027, 150000.00, NULL, 'lunas', 'Transfer Bank (VA)'),
(78, 20, 1, '2025-12-16', 10, 2025, 150000.00, NULL, 'pending', 'Transfer Bank (VA)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text DEFAULT NULL,
  `tanggal_post` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `judul`, `isi`, `tanggal_post`) VALUES
(1, 'Selamat Datang!', 'Selamat datang Website Sekolah SMK NAIRI 04 OHIO. BERILMU, BERBUDAYA, BERJAYA', '2025-11-11 16:43:44'),
(2, 'PPDB 2026', 'PPDB GELOMBANG 2 TELAH DIBUKA', '2025-11-12 18:51:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `id_jurusan` int(11) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `tanggal_pendaftaran` timestamp NOT NULL DEFAULT current_timestamp(),
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `nis`, `nama`, `email`, `no_telp`, `id_jurusan`, `id_kelas`, `tanggal_pendaftaran`, `foto`) VALUES
(20, '241091700546', 'AHMAD RIJAL MAULIDINA', 'ahmadrijalmaulidina@gmail.com', '089673356618', 2, 4, '2025-11-11 16:43:44', '0b8c99c7-efcd-47ba-8646-f65825095338.png'),
(27, '241091700463', 'SYAHID YASIN', 'syahidclik21@gmail.com', '087685984763', 7, 7, '2025-11-14 14:09:11', '02d45f62-5151-44a3-a256-c8247f9ebe23.png'),
(28, '241091700480', 'MUHAMMAD FADILAH ARKAN', 'Arkancina55@gmail.com', '086668766645', 2, 4, '2025-11-14 14:11:51', '20ce5d09-c670-48ca-8c07-95a021662e49.png'),
(30, '2410917005433', 'BINTANG RAMADAN', 'bintangskibiditubuy@gmail.com', '083337865433', 8, 15, '2025-11-14 14:17:31', '4d30558f-18bd-471b-a3d7-437d04065c8d.jpeg'),
(33, '241091700520', 'NOVAL ARYA DWI ALAMSYAH', 'novalresink@gmail.com', '087776583928', 2, 4, '2025-12-06 12:30:01', '7be97912-4ce8-41c9-b877-73843f0ae00a.png'),
(36, '24109170541', 'abdul', 'abdul@gmail.com', '0987876532656', NULL, NULL, '2025-12-12 02:29:52', '6f8705d3-2201-4c74-8451-03af02831e0b.jpg'),
(37, '326666666666', 'IBNU CARTI', 'ibnucarti@gmail.com', '0897675446577', 3, 10, '2025-12-13 17:07:02', 'default.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `nama_tagihan` varchar(255) NOT NULL,
  `nominal` decimal(10,2) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `nama_tagihan`, `nominal`, `keterangan`) VALUES
(1, 'SPP Bulanan 2025-2026', 150000.00, 'SPP wajib untuk semua siswa'),
(2, 'Uang Pangkal 2025', 1000000.00, 'Uang gedung / pendaftaran siswa baru'),
(3, 'Biaya Ujian Semester', 50000.00, 'Biaya untuk ujian semester ganjil'),
(4, 'SPP Bulanan 2025-2026', 150000.00, 'SPP wajib untuk semua siswa'),
(5, 'Uang Pangkal 2025', 1000000.00, 'Uang gedung / pendaftaran siswa baru'),
(6, 'Biaya Ujian Semester', 50000.00, 'Biaya untuk ujian semester ganjil');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihan_siswa`
--

CREATE TABLE `tagihan_siswa` (
  `id` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_tagihan` int(11) NOT NULL,
  `bulan` int(2) NOT NULL,
  `tahun` int(4) NOT NULL,
  `status` enum('Belum Lunas','Lunas') NOT NULL DEFAULT 'Belum Lunas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tagihan_siswa`
--

INSERT INTO `tagihan_siswa` (`id`, `id_siswa`, `id_tagihan`, `bulan`, `tahun`, `status`) VALUES
(218, 20, 5, 1, 2025, 'Lunas'),
(219, 30, 2, 1, 2026, 'Lunas'),
(220, 30, 1, 7, 2025, 'Belum Lunas'),
(221, 30, 1, 8, 2025, 'Belum Lunas'),
(222, 30, 1, 9, 2025, 'Belum Lunas'),
(223, 30, 1, 10, 2025, 'Belum Lunas'),
(224, 30, 1, 11, 2025, 'Belum Lunas'),
(225, 30, 1, 12, 2025, 'Lunas'),
(226, 30, 1, 1, 2026, 'Lunas'),
(227, 30, 1, 2, 2026, 'Belum Lunas'),
(228, 30, 1, 3, 2026, 'Belum Lunas'),
(229, 30, 1, 4, 2026, 'Belum Lunas'),
(230, 30, 1, 5, 2026, 'Belum Lunas'),
(231, 30, 1, 6, 2026, 'Belum Lunas'),
(256, 36, 1, 7, 2026, 'Belum Lunas'),
(257, 36, 1, 8, 2026, 'Belum Lunas'),
(258, 36, 1, 9, 2026, 'Belum Lunas'),
(259, 36, 1, 10, 2026, 'Belum Lunas'),
(260, 36, 1, 11, 2026, 'Belum Lunas'),
(261, 36, 1, 12, 2026, 'Belum Lunas'),
(262, 36, 1, 1, 2027, 'Belum Lunas'),
(263, 36, 1, 2, 2027, 'Belum Lunas'),
(264, 36, 1, 3, 2027, 'Belum Lunas'),
(265, 36, 1, 4, 2027, 'Belum Lunas'),
(266, 36, 1, 5, 2027, 'Belum Lunas'),
(267, 36, 1, 6, 2027, 'Lunas'),
(268, 20, 1, 7, 2025, 'Belum Lunas'),
(269, 20, 1, 8, 2025, 'Belum Lunas'),
(270, 20, 1, 9, 2025, 'Belum Lunas'),
(271, 20, 1, 10, 2025, 'Belum Lunas'),
(272, 20, 1, 11, 2025, 'Belum Lunas'),
(273, 20, 1, 12, 2025, 'Belum Lunas'),
(274, 20, 1, 1, 2026, 'Belum Lunas'),
(275, 20, 1, 2, 2026, 'Belum Lunas'),
(276, 20, 1, 3, 2026, 'Belum Lunas'),
(277, 20, 1, 4, 2026, 'Belum Lunas'),
(278, 20, 1, 5, 2026, 'Belum Lunas'),
(279, 20, 1, 6, 2026, 'Belum Lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('admin','guru','siswa') NOT NULL DEFAULT 'guru',
  `nama_lengkap` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `id_siswa`, `username`, `password`, `role`, `nama_lengkap`) VALUES
(1, NULL, 'admin', 'admin123', 'admin', 'CIBAY RESINK'),
(2, NULL, 'guru', 'guru123', 'guru', 'ILMI BALARAJA'),
(5, 20, 'rijal', 'rijal123', 'siswa', 'AHMAD RIJAL MAULIDINA'),
(7, NULL, 'ibnu', 'ibnu123', 'siswa', 'IBNU CARTI'),
(8, NULL, 'tio', 'tio123', 'siswa', 'TIO TAMAMUL IMAN'),
(9, NULL, 'cibay', 'rijal1234', 'siswa', 'IBNU CARTI'),
(11, 30, 'bintang', 'bintang123', 'siswa', 'bintang abin'),
(12, NULL, 'kiko', 'kiko123', 'siswa', 'kiko'),
(13, 36, 'abdul', 'abdul123', 'siswa', 'abdul');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absensi`),
  ADD UNIQUE KEY `uk_siswa_tanggal` (`id_siswa`,`tanggal`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `jurusan_mapel`
--
ALTER TABLE `jurusan_mapel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_jurusan_mapel` (`id_jurusan`,`id_mapel`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indeks untuk tabel `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indeks untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_tagihan` (`id_tagihan`),
  ADD KEY `id_user_admin` (`id_user_admin`);

--
-- Indeks untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_siswa_jurusan` (`id_jurusan`),
  ADD KEY `fk_siswa_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- Indeks untuk tabel `tagihan_siswa`
--
ALTER TABLE `tagihan_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_tagihan` (`id_tagihan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_user_siswa` (`id_siswa`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `jurusan_mapel`
--
ALTER TABLE `jurusan_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=751;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT untuk tabel `materi`
--
ALTER TABLE `materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tagihan_siswa`
--
ALTER TABLE `tagihan_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jurusan_mapel`
--
ALTER TABLE `jurusan_mapel`
  ADD CONSTRAINT `jurusan_mapel_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`) ON DELETE CASCADE,
  ADD CONSTRAINT `jurusan_mapel_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `mata_pelajaran` (`id_mapel`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `materi_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `materi_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE,
  ADD CONSTRAINT `materi_ibfk_3` FOREIGN KEY (`id_mapel`) REFERENCES `mata_pelajaran` (`id_mapel`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `mata_pelajaran` (`id_mapel`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`id_tagihan`) REFERENCES `tagihan` (`id_tagihan`),
  ADD CONSTRAINT `pembayaran_ibfk_3` FOREIGN KEY (`id_user_admin`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `fk_siswa_jurusan` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_siswa_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tagihan_siswa`
--
ALTER TABLE `tagihan_siswa`
  ADD CONSTRAINT `tagihan_siswa_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tagihan_siswa_ibfk_2` FOREIGN KEY (`id_tagihan`) REFERENCES `tagihan` (`id_tagihan`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
