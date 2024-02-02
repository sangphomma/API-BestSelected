-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2024 at 07:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bestshop6702`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `published`, `created_at`, `updated_at`) VALUES
(1, 'เครื่องใช้ไฟฟ้า', NULL, 1, '2024-02-02 02:05:42', '2024-02-02 02:05:42'),
(2, 'เครื่องมือช่าง', 1, 1, '2024-02-02 02:06:15', '2024-02-02 02:06:15'),
(3, 'เครื่องใช้ไฟฟ้าในครัวเรือน', 1, 1, '2024-02-02 05:08:33', '2024-02-02 05:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2014_10_12_200000_add_two_factor_columns_to_users_table', 2),
(6, '2024_01_31_051556_create_sessions_table', 2),
(7, '2024_02_02_084233_create_categories_table', 3),
(8, '2024_02_02_084922_create_posts_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `desc` text DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `desc`, `cover`, `images`, `tags`, `category_id`, `published`, `created_at`, `updated_at`) VALUES
(2, 'สติกเกอร์วอลเปเปอร์โฟม ลายอิฐ มีกาวในตัว กันน้ํา สําหรับติดตกแต่งผนังห้องนอ', 'ผลการลดเสียงรบกวนที่ดีขึ้น ฟรี DIY ออกแบบติดตั้งง่ายติดตั้งจับแพะชนแกะแบบสบาย ๆ ตัดโดยพลการ โฟมนุ่มตกแต่งสามมิติป้องกันการชนกันสำหรับเด็กดูแลครอบครัวของคุณให้ปลอดภัย เอฟเฟกต์ลวดลายอิฐธรรมชาติเหมือนจริงสไตล์เรียบง่ายและทันสมัย ความปลอดภัยและการปกป้องสิ่งแวดล้อมปลอดสารพิษปราศจากกลิ่นเหมาะสำหรับบ้านที่ปลอดภัยสำหรับครอบครัว พื้นที่. แพ็คเกจ \nรวม: \n               วอลล์เปเปอร์อิฐ 1x3D\nหมายเหตุ:\n💥1.เมื่อวางโปรดเก็บด้านหน้าด้านหลังซ้ายและขวาของวอลล์เปเปอร์ให้เรียบร้อย\n\n💥2.วอลล์เปเปอร์บางแห่งอาจมีข้อผิดพลาดความยาวน้อยกว่าหนึ่งเซนติเมตร เมื่อติดในเวลานี้เพื่อให้ล้างออกคุณสามารถวางส่วนเสริมบนวอลล์เปเปอร์อื่น (จะมีคำแนะนำในภาพ)\n\n💥3. หากเกิดการประดิษฐ์ว่าวอลล์เปเปอร์ไม่เรียบแล้วขอคืนสินค้าจะถูกปฏิเสธโปรดระวัง!', 'products-cover/cover-สติกเกอร์วอลเปเปอร์โฟม ลายอิฐ มีกาวในตัว กันน้ํา สําหรับติดตกแต่งผนังห้องนอ-1706892122.jpg', '[\"products-images\\/01HNNB5P0SFG2KEYJFK39M3R6N.jpg\",\"products-images\\/01HNNB5P0YW2EFJEN4GEP6NTQH.jpg\",\"products-images\\/01HNNB5P12FEASWMA5DC2NSJD5.jpg\",\"products-images\\/01HNNB5P15TSHSY6RZEDSCM3M0.jpg\",\"products-images\\/01HNNB5P1AR78QNBCY6D51CYE6.jpg\",\"products-images\\/01HNNB5P1EX8VZKYRN5ZQ3F0X5.jpg\",\"products-images\\/01HNNB5P1HS9W5KDFETBZMEN10.jpg\",\"products-images\\/01HNNB5P1MVVRC9Q881K3ZRWVG.jpg\"]', '[\"wallpaper\"]', 1, 1, '2024-02-02 09:42:02', '2024-02-02 09:42:02'),
(3, 'ราวตากผ้าสแตนเลส แข็งแรง พับเก็บง่าย รูปทรงตัว X จัดเก็บสะดวกแข็งแรง ทนทาน', 'ท่อสแตนเลสใหญ่ แข็งแรง ทนทาน รับน้ำหนักได้มากเหมาะกับใช้งานในครัวเรือน หอพัก โรงแรม และทุกพื้นที่ที่ต้องการราวตากผ้าทำจากสแตนเลสคุณภาพสูง ไม่ทำให้เกิดสนิมหลังจากเปียกฝนราวตากผ้าบาร์คู่ แข็งแรง คุ้มค่า ประหยัดพื้นที่ เคลื่อนย้ายสะดวกดีไซน์ทันสมัย ประกอบง่าย จัดเก็บสะดวก ตอบสนองความต้องการที่หลากหลาย***ขนาดอาจจะคลาดเคลื่อน เล็กน้อย งดดราม่านะจ๊ะ***โปรดทราบว่ามีความแตกต่างไม่กี่เซ็นติเมตร เมื่อเทียบกับผลิตภัณฑ์จริงเนื่องจากการวัดด้วยตนเอง***หากลูกค้าได้รับสินค้าไม่ครบ ชิ้นส่วนอะไรขาด ประกอบสินค้าไม่ได้ หรือสินค้ามีปัญหาอื่นๆ รบกวนติดต่อทางแชทของร้านได้เลยค่ะ ขอบคุณค่ะ', 'products-cover/cover-ราวตากผ้าสแตนเลส แข็งแรง พับเก็บง่าย รูปทรงตัว X จัดเก็บสะดวกแข็งแรง ทนทาน-1706893221.jpg', '[\"products-images\\/01HNNC77GCRWJ55JYPZ29KJ1XJ.jpg\",\"products-images\\/01HNNC77GFWK1TK0HVB9AAHFSF.jpg\",\"products-images\\/01HNNC77GJZC5HSP4GBG9SB3VB.jpg\",\"products-images\\/01HNNC77GNN7G2R4QHJTCK95AH.jpg\",\"products-images\\/01HNNC77GRPPB9K163DS0W7439.jpg\"]', '[\"\\u0e23\\u0e32\\u0e27\\u0e41\\u0e02\\u0e27\\u0e19\\u0e1c\\u0e49\\u0e32\",\"\\u0e23\\u0e32\\u0e27\\u0e15\\u0e32\\u0e01\\u0e1c\\u0e49\\u0e32\"]', 3, 1, '2024-02-02 10:00:21', '2024-02-02 10:00:21');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
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
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('AzJplhweYxPa72S7lMlsRqpxDkhffJRwAh6cY5WY', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiVUhodk81Rko0WEdPWldPQXpyMzVURUpXWFFNVmozY28xOFFhRW15TiI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJDFTMzF2ZkRYQjJiWVdtNC96blZtOXVoQTVGb2F6RTlwTHc5Rzk3RWFXOXFrVWc4eG5yLi4yIjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL3Bvc3RzLzMvZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6ODoiZmlsYW1lbnQiO2E6MDp7fX0=', 1706893233);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Korn.S', NULL, 'sirikorn.s@outlook.com', NULL, '$2y$12$1S31vfDXB2bYWm4/znVm9uhA5FoazE9pLw9G97EaW9qkUg8xnr..2', NULL, NULL, NULL, 'FtS15HGbgjNeK6f7myHjkLp4tYrsi5r5a9xsdkw9i6Q0Xm0NyzBICh8aHjJ8', '2024-01-30 22:11:48', '2024-01-30 22:11:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_cagetory_id_foreign` (`category_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_cagetory_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
