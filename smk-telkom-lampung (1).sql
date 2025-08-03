-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Agu 2025 pada 17.44
-- Versi server: 11.7.2-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smk-telkom-lampung`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `about_sections`
--

CREATE TABLE `about_sections` (
  `id` char(36) NOT NULL,
  `judul` text NOT NULL,
  `deskripsi_1` longtext DEFAULT NULL,
  `deskripsi_2` longtext DEFAULT NULL,
  `gambar_urls` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`gambar_urls`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `about_sections`
--

INSERT INTO `about_sections` (`id`, `judul`, `deskripsi_1`, `deskripsi_2`, `gambar_urls`, `created_at`, `updated_at`) VALUES
('27bb6e52-1e69-4ade-b86f-a5710d7a63e5', 'Tentang SMK Telkom Lampung', 'SMK Telkom Lampung merupakan sekolah menengah kejuruan yang berfokus pada bidang Teknologi Informasi dan Telekomunikasi. Dengan kurikulum yang selalu update mengikuti perkembangan industri, kami mempersiapkan siswa untuk menjadi tenaga ahli yang kompeten dan siap kerja.', 'Didukung oleh fasilitas modern dan tenaga pengajar berpengalaman, SMK Telkom Lampung telah menghasilkan ribuan alumni yang sukses berkarir di berbagai perusahaan teknologi terkemuka.', '[\"http:\\/\\/localhost:8000\\/storage\\/about-images\\/8N6QINqn1E6Hk8n53rM6ebYdUBYsG7gHt2UfIuhK.jpg\",\"http:\\/\\/localhost:8000\\/storage\\/about-images\\/nF0Rr6a6WN40bcivwavhgD8MrCRwE3GBwcWKk9jF.jpg\",\"http:\\/\\/localhost:8000\\/storage\\/about-images\\/NgcOxwkCV4TIwweU0Zbg5nMWeMpRBMdJOwqqiuyB.jpg\",\"http:\\/\\/localhost:8000\\/storage\\/about-images\\/WxPlZj5CuPXIfxs9izYOLKoKZLxAnq2XSELURjsB.jpg\"]', '2025-06-06 22:38:40', '2025-06-06 22:56:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `beritas`
--

CREATE TABLE `beritas` (
  `id` char(36) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `kategori_berita_id` char(36) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `konten` longtext NOT NULL,
  `gambar_utama` varchar(255) DEFAULT NULL,
  `status` enum('published','draft') NOT NULL DEFAULT 'draft',
  `meta_judul` varchar(255) DEFAULT NULL,
  `meta_deskripsi` text DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `beritas`
--

INSERT INTO `beritas` (`id`, `user_id`, `kategori_berita_id`, `judul`, `slug`, `konten`, `gambar_utama`, `status`, `meta_judul`, `meta_deskripsi`, `tags`, `created_at`, `updated_at`) VALUES
('06a6a365-11e2-4da6-ac85-cf9ddaad6d4d', NULL, NULL, '{gambarUtama}', 'gambarutama-688e51aecbd84', '<p>{gambarUtama}</p>', 'http://localhost:8000/storage/images/GaC2V7fIscUCwFz4IQ58l5U6HWO3yCMWNLL1UAMx.jpg', 'published', '{gambarUtama}', '{gambarUtama}', '{gambarUtama}', '2025-08-02 10:58:06', '2025-08-02 10:58:06'),
('4c27795f-770c-49a3-b6e6-e1f50fb8de44', NULL, '6680a625-a193-46da-845c-66511063bdf2', 'test', 'test-688f760e02259', '<p>test</p>', NULL, 'published', 'test', 'test', 'test', '2025-08-03 07:45:34', '2025-08-03 08:20:39'),
('5b97714d-c8bd-4007-bcb9-80f8bc4b9229', NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-688e5107d075c', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit</p>', 'http://localhost:8000/storage/images/3ggCqCLjVq4WleJMW7iImW3QcRYnQFWutAw7MqDb.jpg', 'published', 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'asasas', '2025-08-02 10:55:19', '2025-08-02 10:55:19'),
('987018d1-f55d-4692-b607-b5b7c6b4ddf4', '0f59c2d2-b707-4b55-8a0e-e5b4edef20ab', '6680a625-a193-46da-845c-66511063bdf2', 'SMK Telkom Lampung Raih Juara 1 Lomba Programming Tingkat Provinsi', 'smk-telkom-lampung-raih-juara-1-lomba-programming-tingkat-provinsi-688f832debcb1', '<p>SMK Telkom Lampung kembali mengukir prestasi membanggakan di bidang teknologi informasi. Tim programming yang terdiri dari siswa-siswa terpilih berhasil meraih juara 1 dalam kompetisi programming tingkat provinsi yang diselenggarakan di Universitas Lampung pada tanggal 10-12 Januari 2024.</p><p></p><p>Kompetisi yang diikuti oleh 50 tim dari seluruh SMK di Provinsi Lampung ini menguji kemampuan siswa dalam memecahkan masalah algoritma, pengembangan aplikasi, dan database management. Tim SMK Telkom Lampung yang beranggotakan Ahmad Rizki (XII RPL 1), Sari Indah (XII RPL 2), dan Budi Santoso (XII TKJ 1) berhasil mengungguli pesaing dengan solusi inovatif mereka.</p><p></p><p>\"Prestasi ini adalah hasil dari kerja keras siswa-siswa dan dukungan penuh dari sekolah. Kami terus berkomitmen untuk mengembangkan talenta di bidang IT,\" ujar Kepala Sekolah SMK Telkom Lampung, Drs. Wijaya Kusuma, M.Pd.</p><p></p><p>Selain juara 1, SMK Telkom Lampung juga meraih penghargaan Best Innovation Award untuk solusi aplikasi manajemen sekolah yang dikembangkan tim. Prestasi ini semakin memperkuat posisi SMK Telkom Lampung sebagai sekolah unggulan di bidang teknologi informasi dan telekomunikasi.</p><p></p><p>Ke depannya, sekolah berencana untuk mengikuti kompetisi tingkat nasional dan terus mengembangkan program-program unggulan untuk mempersiapkan siswa menghadapi tantangan industri 4.0.</p>', 'http://localhost:8000/storage/images/V1pe9H5uMpuL6svYwZzEqCKOquQ7d88W65RsCq1I.jpg', 'published', 'SMK Telkom Lampung Raih Juara 1 Lomba Programming Tingkat Provinsi', 'SMK Telkom Lampung Raih Juara 1 Lomba Programming Tingkat Provinsi', 'ppdb', '2025-08-03 08:41:33', '2025-08-03 08:41:33'),
('b49700ff-4142-433a-bf74-3033431b2aa9', NULL, 'aaa390a5-06e5-41a0-9678-b09b5548f7eb', 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-b49700ff-4142-433a-bf74-3033431b2aa9', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit</p><img src=\"http://localhost:8000/storage/images/ZglTgaSnFWhzQZVDqHrJZxlK1AoETw1H3kmNK1ks.jpg\"><p></p>', 'http://localhost:8000/storage/images/vCuwusWyCPiT5ON8wPXJ93IrZeTLaDJrGo1medFn.png', 'published', 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'asass', '2025-08-02 10:59:47', '2025-08-03 08:25:42'),
('bf10c700-281d-4294-a22e-6770be06134e', NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-688e4d58195c4', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit</p>', NULL, 'published', 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'as', '2025-08-02 10:39:36', '2025-08-02 10:39:36'),
('df3e1efd-6648-48aa-a23a-746c999798fd', NULL, 'aaa390a5-06e5-41a0-9678-b09b5548f7eb', 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-df3e1efd-6648-48aa-a23a-746c999798fd', '<p><strong>Lorem </strong>ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p><p></p><p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p><p></p><p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p><p></p><p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p><p></p><p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>', NULL, 'draft', 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'ppdb, spmb', '2025-08-02 10:37:12', '2025-08-03 08:25:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `configs`
--

CREATE TABLE `configs` (
  `id` char(36) NOT NULL,
  `nama_sekolah` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `configs`
--

INSERT INTO `configs` (`id`, `nama_sekolah`, `alamat`, `telepon`, `email`, `instagram`, `facebook`, `youtube`, `website`, `created_at`, `updated_at`) VALUES
('1f33d0f3-161a-4117-a03a-d7aef11297ed', 'SMK Telkom Lampung', 'Gadingrejo', '082185903635', 'admin@smktelkom-lpg.sch.id', 'https://www.instagram.com/smktelkom.lpg', 'https://www.facebook.com/smktelkomlampung', 'https://www.youtube.com/@smktelkomlampung988', 'https://smktelkom-lpg.sch.id', '2025-06-06 11:20:04', '2025-06-06 17:42:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hero_slides`
--

CREATE TABLE `hero_slides` (
  `id` char(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `hero_slides`
--

INSERT INTO `hero_slides` (`id`, `title`, `subtitle`, `image`, `order`, `status`, `created_at`, `updated_at`) VALUES
('3b148358-82b9-4a6b-8d39-e0acab820f70', 'Program Keahlian Unggulan', 'Software Engineering, Network Engineering, Animation', 'http://localhost:8000/storage/hero-slides/npgQExPQ9k4SY9IUNWGzO23q5PVUz6ST32391y3c.jpg', 0, 1, '2025-06-08 01:51:32', '2025-06-08 01:51:32'),
('40fc3420-0f19-48ca-a1b2-1bf834a75534', 'Prestasi Membanggakan', 'Juara Nasional Kompetisi IT & Telekomunikasi', 'http://localhost:8000/storage/hero-slides/kvrcucDt9FaNMjbVxvK0mH3LNYE1Kx77bZhmAx4f.jpg', 0, 1, '2025-06-08 01:51:54', '2025-06-08 01:51:54'),
('e82467a8-1a5f-4c3c-afa9-e24aa9b5a9ea', 'Tenaga Pendidik Profesional', 'Bersertifikasi Internasional', 'http://localhost:8000/storage/hero-slides/Mh84GOyx5jbJ4G9ZuRqwPMf8hSXp3IpRg7hR8X17.jpg', 0, 1, '2025-06-08 02:13:04', '2025-06-08 02:13:04'),
('f670e8ce-244b-4b54-90f9-30cced953d15', 'Selamat Datang di SMK Telkom Lampung', 'Mencetak Generasi IT & Telekomunikasi Terdepan', 'http://localhost:8000/storage/hero-slides/QUXV9cnk2ShfqH9TGOWLilVIQxVh75vB0MB1xbT9.jpg', 0, 1, '2025-06-08 01:50:27', '2025-06-08 01:50:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_beritas`
--

CREATE TABLE `kategori_beritas` (
  `id` char(36) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori_beritas`
--

INSERT INTO `kategori_beritas` (`id`, `nama_kategori`, `slug`, `created_at`, `updated_at`) VALUES
('6680a625-a193-46da-845c-66511063bdf2', 'Berita', 'berita', '2025-08-03 07:45:15', '2025-08-03 07:45:15'),
('aaa390a5-06e5-41a0-9678-b09b5548f7eb', 'PPDB', 'ppdb', '2025-08-03 07:45:05', '2025-08-03 07:45:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `icon`, `parent_id`, `order`, `status`, `created_at`, `updated_at`) VALUES
('01974f12-5fed-71da-b076-586690199191', 'sdjkjkjk', 'jksjdksj', 'Network', NULL, 1, 1, '2025-06-08 03:24:53', '2025-06-08 03:24:53'),
('01974f12-7919-71f4-94f0-23b40e24d7f1', 'asdasd', 'asdasda', 'Cpu', NULL, 2, 1, '2025-06-08 03:25:00', '2025-06-08 03:25:00'),
('01974f12-9569-702e-ba73-47415414ca4a', 'asdasd', 'adasdsa', 'Code', NULL, 1, 1, '2025-06-08 03:25:07', '2025-06-08 03:25:07'),
('01974f12-b789-72a5-bbae-dd51d9bbbbc2', 'asdas', 'dasd', 'Code', '01974f12-9569-702e-ba73-47415414ca4a', 3, 1, '2025-06-08 03:25:16', '2025-06-08 03:25:16'),
('01974f12-e411-70e2-98c3-4df0a42d731f', 'sadasd', 'asdasd', 'Radio', NULL, 2, 1, '2025-06-08 03:25:27', '2025-06-08 03:25:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_06_173000_create_personal_access_tokens_table', 1),
(5, '2025_06_06_181247_create_configs_table', 2),
(6, '2025_06_07_053043_create_about_sections_table', 3),
(7, '2025_06_07_061939_create_program_keahlians_table', 4),
(8, '2025_06_08_064530_create_hero_slides_table', 5),
(9, '2025_06_08_094649_create_menus_table', 6),
(10, '2025_08_02_172733_create_beritas_table', 7),
(11, '2025_08_03_142707_create_kategori_beritas_table', 8),
(12, '2025_08_03_142738_add_kategori_id_to_beritas_table', 8),
(13, '2025_08_03_153313_add_user_id_to_beritas_table', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(4, 'App\\Models\\User', '0f59c2d2-b707-4b55-8a0e-e5b4edef20ab', 'smk-token', 'c84ab96077390cf60258cc27d4945f092f6c0deb8ea7bf0fc7b565031e3eac97', '[\"*\"]', '2025-06-06 11:22:17', NULL, '2025-06-06 11:07:01', '2025-06-06 11:22:17'),
(7, 'App\\Models\\User', '0f59c2d2-b707-4b55-8a0e-e5b4edef20ab', 'smk-token', 'bdfc8bf93288d36bb1d131635f20bfe4628a77996053b22d1bf8eeaa30140e9f', '[\"*\"]', '2025-06-07 01:38:05', NULL, '2025-06-07 01:32:24', '2025-06-07 01:38:05'),
(10, 'App\\Models\\User', '0f59c2d2-b707-4b55-8a0e-e5b4edef20ab', 'smk-token', 'a06d87d3aa6322aac39de83d0a84caa1ff7a05d2fb82305278293e4e8ba9ca66', '[\"*\"]', '2025-06-08 05:06:37', NULL, '2025-06-08 04:14:31', '2025-06-08 05:06:37'),
(11, 'App\\Models\\User', '0f59c2d2-b707-4b55-8a0e-e5b4edef20ab', 'smk-token', '958404030b9deb0f3a38c6307aa7d1e7c8e8baa7ff52df65be0740c1ab5fa4f3', '[\"*\"]', '2025-08-03 08:43:23', NULL, '2025-08-02 10:16:21', '2025-08-03 08:43:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `program_keahlians`
--

CREATE TABLE `program_keahlians` (
  `id` char(36) NOT NULL,
  `judul_program_keahlian` varchar(255) NOT NULL,
  `sub_judul` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `yang_dipelajari` text DEFAULT NULL,
  `prospek_karir` text DEFAULT NULL,
  `warna_header` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `program_keahlians`
--

INSERT INTO `program_keahlians` (`id`, `judul_program_keahlian`, `sub_judul`, `icon`, `deskripsi`, `yang_dipelajari`, `prospek_karir`, `warna_header`, `status`, `created_at`, `updated_at`) VALUES
('2749a804-3f34-4e93-8cbe-5a8cb3f6ed60', 'Teknik Komputer dan Jaringan', 'Computer and Network Engineering', 'Network', 'Program keahlian yang mengkhususkan pada teknologi jaringan komputer dan infrastruktur IT.', 'Networking, Server Administration, Cybersecurity, Hardware', 'Network Administrator, IT Support, Cybersecurity Specialist, System Engineer', 'bg-green-600', 1, '2025-06-07 00:01:02', '2025-06-07 19:58:30'),
('8d7841f2-c117-47a5-b89e-701f2acf40fa', 'Animasi', 'Animation', 'BookOpen', 'Program keahlian yang mengembangkan kreativitas dalam bidang animasi dan multimedia.', '2D Animation, 3D Modeling, Video Editing, Digital Arts', 'Animator, Motion Graphics Designer, Video Editor, Multimedia Designer', 'bg-purple-600', 1, '2025-06-07 00:06:03', '2025-06-07 20:00:31'),
('9079f2ad-45c8-4a16-885e-8c5289dee5b8', 'Teknik Jaringan Akses Telekomunikasi', 'Telecommunication Access Network Engineering', 'Radio', 'Program keahlian yang fokus pada teknologi telekomunikasi dan jaringan akses modern.', 'Fiber Optic, Wireless Technology, Telecommunication, Network Infrastructure', 'Telecom Engineer, Field Engineer, Network Planner, RF Engineer', 'bg-red-600', 1, '2025-06-07 00:04:04', '2025-06-07 20:01:34'),
('aad286d9-d26f-4fb1-a61b-079267bed5eb', 'Rekayasa Perangkat Lunak', 'Software Engineering', 'Code', 'Program keahlian yang fokus pada pengembangan aplikasi dan sistem perangkat lunak modern.', 'Programming, Web Development, Mobile Apps, Database', 'Software Developer, Web Developer, Mobile Developer, System Analyst', 'bg-blue-600', 1, '2025-06-06 23:51:53', '2025-06-07 20:02:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('c7b5pTRS83BNv3B6jP296PUl4asiWFPg9LpikGo8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGtmQ1FBVVZDdUxMczVybG50MmFKdVRwVHFDSmUxZW9SVElXMVlYTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752993081),
('gYFC2OM0OspRoX7ERfeJboXDJGu5a8amEViKD7M3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXoxWkU1UElRckpseUFOOXJnTEpMQkhoOTlyeVd5TXRZTmlkaEFsWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749256597),
('HC2zHz26i3SRmHMDbSOIuMNMb5sDJMKFtlrsRCGE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRk9uMm1kdkVURFR1NjFkYjB6c0tmdkdwTUNpV05wNmtkdWdnVUZPRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749362079);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
('0f59c2d2-b707-4b55-8a0e-e5b4edef20ab', 'Admin SMK', 'admin@smktelkomlampung.sch.id', NULL, '$2y$12$JnGkiKFh/U5CYAzwfsZ2gu1BsBzZBxLrrHjMsfTHj.1gjJOpkYzcm', NULL, '2025-06-06 11:04:54', '2025-06-06 11:04:54');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `about_sections`
--
ALTER TABLE `about_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `beritas`
--
ALTER TABLE `beritas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `beritas_slug_unique` (`slug`),
  ADD KEY `beritas_kategori_berita_id_foreign` (`kategori_berita_id`),
  ADD KEY `beritas_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `hero_slides`
--
ALTER TABLE `hero_slides`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_beritas`
--
ALTER TABLE `kategori_beritas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kategori_beritas_slug_unique` (`slug`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`),
  ADD KEY `menus_parent_id_foreign` (`parent_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `program_keahlians`
--
ALTER TABLE `program_keahlians`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `beritas`
--
ALTER TABLE `beritas`
  ADD CONSTRAINT `beritas_kategori_berita_id_foreign` FOREIGN KEY (`kategori_berita_id`) REFERENCES `kategori_beritas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `beritas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
