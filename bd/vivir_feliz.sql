-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for vivir_feliz
CREATE DATABASE IF NOT EXISTS `vivir_feliz` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `vivir_feliz`;

-- Dumping structure for table vivir_feliz.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.cities: ~2 rows (approximately)
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`id`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Santa Cruz', '2024-05-28 09:26:18', '2024-05-28 09:26:18'),
	(2, 'La Paz', '2024-05-28 09:26:25', '2024-05-28 09:26:25');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.migrations: ~13 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_100000_create_password_resets_table', 1),
	(2, '2019_08_19_000000_create_failed_jobs_table', 1),
	(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(4, '2024_05_06_090817_create_users_table', 1),
	(5, '2024_05_06_095817_create_cities_table', 1),
	(6, '2024_05_06_096817_create_professions_table', 1),
	(7, '2024_05_06_104205_create_people_table', 1),
	(8, '2024_05_06_120748_create_therapists_table', 1),
	(9, '2024_05_06_141401_create_schools_table', 1),
	(10, '2024_05_06_155251_create_patients_table', 1),
	(11, '2024_05_06_166251_create_services_table', 1),
	(12, '2024_05_14_032736_create_queries_table', 1),
	(13, '2024_05_17_034839_create_permission_tables', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.model_has_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.model_has_roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(3, 'App\\Models\\User', 2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.patients
CREATE TABLE IF NOT EXISTS `patients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `names` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surnames` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `course` int(11) NOT NULL DEFAULT '0',
  `phone` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `school_id` bigint(20) unsigned DEFAULT NULL,
  `people_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patients_email_unique` (`email`),
  KEY `patients_school_id_foreign` (`school_id`),
  KEY `patients_people_id_foreign` (`people_id`),
  FULLTEXT KEY `names` (`names`),
  FULLTEXT KEY `surnames` (`surnames`),
  CONSTRAINT `patients_people_id_foreign` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `patients_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.patients: ~67 rows (approximately)
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` (`id`, `names`, `surnames`, `birthdate`, `course`, `phone`, `email`, `status`, `school_id`, `people_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Alexandrea', 'Schaden', '2019-05-31', 15, '+1.747.826.3122', 'felipe.halvorson@example.net', 1, 49, 2, '2024-05-28 13:31:14', '2024-05-28 13:31:14', NULL),
	(2, 'Reinhold', 'Gulgowski', '1985-07-06', 6, '1-878-685-1625', 'dhand@example.com', 1, 48, 1, '2024-05-28 13:31:14', '2024-05-28 13:31:14', NULL),
	(3, 'Tyshawn', 'Weimann', '1982-11-25', 14, '(650) 622-1562', 'qfeil@example.net', 1, 47, 1, '2024-05-28 13:31:14', '2024-05-28 13:31:14', NULL),
	(4, 'Leland', 'Dach', '1998-11-24', 8, '(505) 242-2981', 'xquigley@example.net', 1, 49, 1, '2024-05-28 13:31:14', '2024-05-28 13:31:14', NULL),
	(5, 'Bernita', 'Dare', '2020-05-21', 10, '+1-248-551-9507', 'zcole@example.org', 1, 38, 1, '2024-05-28 13:31:14', '2024-05-28 13:31:14', NULL),
	(6, 'Quinten', 'Balistreri', '1970-03-27', 12, '(662) 531-4631', 'percy.durgan@example.com', 1, 45, 1, '2024-05-28 13:31:14', '2024-05-28 13:31:14', NULL),
	(7, 'Shaniya', 'Treutel', '1981-01-08', 1, '+1-682-761-1850', 'eda.witting@example.org', 1, 49, 2, '2024-05-28 13:31:14', '2024-05-28 13:31:14', NULL),
	(8, 'Sabina', 'Walsh', '1973-02-03', 12, '317-553-6559', 'christelle30@example.com', 1, 43, 1, '2024-05-28 13:31:14', '2024-05-28 13:31:14', NULL),
	(9, 'Clinton', 'Simonis', '1987-01-19', 12, '+12815481300', 'emedhurst@example.com', 1, 48, 1, '2024-05-28 13:31:14', '2024-05-28 13:31:14', NULL),
	(10, 'Malvina', 'Larson', '1973-11-11', 9, '+1-937-634-6880', 'ihaag@example.org', 1, 50, 2, '2024-05-28 13:31:46', '2024-05-28 13:31:46', NULL),
	(11, 'Zella', 'Hartmann', '2007-07-28', 9, '+1-747-657-8788', 'adeline.swaniawski@example.com', 1, 46, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(12, 'Mae', 'Zboncak', '2019-02-15', 4, '279-926-9961', 'hand.janelle@example.net', 1, 47, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(13, 'Fatima', 'Corkery', '1977-04-18', 5, '775.626.4539', 'elmo.bednar@example.com', 1, 49, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(14, 'Arch', 'Hills', '2017-07-01', 15, '516-721-0531', 'kshlerin.arely@example.net', 1, 45, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(15, 'Kendrick', 'Grady', '1991-04-26', 11, '(984) 862-1793', 'carter.allison@example.net', 1, 46, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(16, 'Georgiana', 'Ernser', '2014-04-30', 12, '1-530-581-6597', 'apouros@example.net', 1, 43, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(17, 'Nayeli', 'Williamson', '1984-10-13', 13, '+1.283.319.6186', 'sgulgowski@example.org', 1, 47, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(18, 'Alexzander', 'Christiansen', '1993-02-11', 12, '(626) 812-1956', 'lblanda@example.org', 1, 49, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(19, 'Janick', 'Bailey', '1993-10-12', 5, '+1.605.223.2178', 'greenfelder.megane@example.org', 1, 37, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(20, 'Yasmeen', 'Parker', '1982-05-20', 3, '1-574-328-5100', 'alize.okeefe@example.net', 1, 40, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(21, 'Karley', 'Wintheiser', '2019-01-08', 2, '+1-551-741-3640', 'lauryn40@example.net', 1, 48, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(22, 'Brennon', 'Davis', '1978-11-15', 13, '+1-912-609-2944', 'jarret.bayer@example.com', 1, 45, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(23, 'Aric', 'Rice', '2014-04-03', 13, '(986) 447-1129', 'taufderhar@example.org', 1, 46, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(24, 'Edison', 'Prosacco', '2018-01-30', 9, '337.233.8140', 'gbreitenberg@example.net', 1, 41, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(25, 'Makayla', 'Johnston', '2013-09-27', 9, '1-567-489-3911', 'ramon42@example.com', 1, 46, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(26, 'Ebony', 'Stamm', '2015-05-02', 1, '+1-380-206-8740', 'paucek.lawrence@example.org', 1, 41, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(27, 'Cora', 'Borer', '2019-09-28', 7, '678-643-9219', 'leola13@example.org', 1, 46, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(28, 'Susana', 'Kuphal', '1983-08-23', 4, '+1.954.914.1612', 'cheyanne04@example.net', 1, 48, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(29, 'Roxanne', 'Swift', '2006-02-19', 13, '+1-442-859-3195', 'jessie.krajcik@example.com', 1, 42, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(30, 'Gladyce', 'Murazik', '2010-05-20', 5, '+1-917-382-6102', 'kacie54@example.com', 1, 41, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(31, 'Lila', 'Durgan', '1996-09-03', 2, '214.598.4144', 'israel.white@example.com', 1, 40, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(32, 'Price', 'Kuhic', '1987-02-28', 8, '+1-586-338-4716', 'lenore.turcotte@example.org', 1, 51, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(33, 'Sydnie', 'Hill', '2008-07-04', 6, '+1.708.519.6237', 'wmorar@example.com', 1, 46, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(34, 'Leonardo', 'Leuschke', '1981-05-31', 3, '540-202-1774', 'murray79@example.com', 1, 49, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(35, 'Jerald', 'Osinski', '1995-12-09', 12, '662-775-6645', 'samantha65@example.org', 1, 46, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(36, 'Valentina', 'Marquardt', '1973-05-03', 5, '+1-351-954-3404', 'vfahey@example.net', 1, 50, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(37, 'Pierce', 'Fisher', '2014-08-28', 6, '+1-906-736-7311', 'ralph.flatley@example.net', 1, 37, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(38, 'Linda', 'Barton', '1971-08-23', 13, '847-839-5495', 'dickens.freda@example.com', 1, 46, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(39, 'Kelton', 'Wisozk', '1981-05-24', 2, '+1-731-240-9766', 'lakin.roxane@example.com', 1, 50, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(40, 'Santos', 'Walsh', '2023-07-02', 14, '1-979-629-0583', 'juwan.roob@example.org', 1, 41, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(41, 'Mathew', 'Hodkiewicz', '1971-12-14', 3, '+14058031786', 'mclaughlin.ulices@example.com', 1, 50, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(42, 'Brant', 'Tromp', '2002-01-30', 2, '804.917.9423', 'whammes@example.com', 1, 49, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(43, 'Billy', 'Barton', '2022-12-10', 1, '+1-754-650-8024', 'kadin.rogahn@example.net', 1, 43, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(44, 'Mac', 'Pollich', '2024-05-21', 13, '213-271-1228', 'kiel63@example.com', 1, 42, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(45, 'Brice', 'Huels', '1971-09-10', 2, '386-321-5514', 'merl.thompson@example.com', 1, 49, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(46, 'Sydney', 'Shanahan', '2010-12-13', 14, '+14635790020', 'cole.derrick@example.net', 1, 45, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(47, 'Astrid', 'Altenwerth', '2005-03-20', 3, '+19723194957', 'bbartell@example.net', 1, 40, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(48, 'Rod', 'Schmidt', '1975-10-21', 5, '1-850-680-8517', 'hammes.malachi@example.com', 1, 46, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(49, 'Hellen', 'Marvin', '1991-06-19', 1, '912-618-7521', 'destinee.labadie@example.com', 1, 45, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(50, 'Krystina', 'Greenfelder', '2018-08-22', 4, '1-620-908-8016', 'jacobs.karli@example.com', 1, 40, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(51, 'Stefanie', 'Brekke', '1979-01-07', 1, '1-984-596-7009', 'vallie43@example.com', 1, 49, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(52, 'Elijah', 'Haley', '1972-05-30', 6, '+1 (678) 356-8692', 'feeney.luciano@example.com', 1, 49, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(53, 'Eveline', 'Turner', '1974-12-20', 12, '+1-203-724-0921', 'grady92@example.com', 1, 49, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(54, 'Davin', 'Monahan', '1982-06-17', 12, '484-934-8658', 'pbergnaum@example.com', 1, 46, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(55, 'Reanna', 'Brown', '2020-07-20', 7, '1-860-936-4776', 'cathy.metz@example.com', 1, 40, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(56, 'Claudine', 'Deckow', '2003-07-24', 1, '774-890-0588', 'bogisich.alvena@example.org', 1, 40, 1, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(57, 'Clarabelle', 'Larson', '2024-05-18', 11, '402-567-5043', 'crist.arlie@example.org', 1, 43, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(58, 'Antonetta', 'Aufderhar', '1972-09-21', 8, '+1.925.871.0029', 'kreiger.mathias@example.org', 1, 43, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(59, 'Lavern', 'Kozey', '1984-12-01', 6, '(631) 924-8505', 'fharvey@example.com', 1, 38, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(60, 'Tierra', 'Schmeler', '2010-01-31', 5, '424-424-6100', 'belle.price@example.com', 1, 38, 2, '2024-05-28 13:32:19', '2024-05-28 13:32:19', NULL),
	(61, 'Antony', 'Morales', '2024-05-31', 7, '+59168774551', 'antony@gmail.com', 1, 46, 2, '2024-05-31 10:20:35', '2024-05-31 10:20:37', NULL),
	(67, 'Fernando', 'Cruz', '2024-05-27', 2, '68774551', 'nano@gmail.com', 1, 41, 2, '2024-06-05 18:25:31', '2024-06-05 18:25:31', NULL),
	(68, 'Gabriel1', 'Borja Inturias1', '2010-03-06', 4, '789561581', 'gabriel1@gmail.com1', 1, 41, 1, '2024-06-07 19:34:03', '2024-06-19 21:17:00', '2024-06-19 21:17:00'),
	(69, 'Fabian', 'Banegas Sanches', '2004-12-09', 13, '77365897', 'fabi@gmail.com', 1, 41, 1, '2024-06-07 20:13:41', '2024-06-19 21:16:53', '2024-06-19 21:16:53'),
	(70, 'Hector', 'Banegas', '2018-11-03', 15, '77896345', 'hector@gmail.com', 1, 49, 12, '2024-06-07 20:15:02', '2024-06-12 17:37:18', '2024-06-12 17:37:18'),
	(71, 'Katherine', 'Toledo', '2024-06-06', 15, '78958742', 'ktv@gmail.com', 1, 49, 1, '2024-06-10 16:14:38', '2024-06-12 17:37:18', '2024-06-12 17:37:18'),
	(72, 'Carla', 'Banegas', '2024-06-19', 14, '3987456', 'carla@gmail.com', 1, 38, 14, '2024-06-19 16:22:27', '2024-06-19 16:22:42', NULL);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.people
CREATE TABLE IF NOT EXISTS `people` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `names` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surnames` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `user_id` bigint(20) unsigned NOT NULL,
  `city_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ci` (`ci`),
  UNIQUE KEY `email` (`email`),
  KEY `people_user_id_foreign` (`user_id`),
  KEY `people_city_id_foreign` (`city_id`),
  FULLTEXT KEY `names` (`names`),
  FULLTEXT KEY `surnames` (`surnames`),
  FULLTEXT KEY `idx_fulltext_names_surname` (`names`,`surnames`),
  FULLTEXT KEY `ci_fulltext` (`ci`),
  CONSTRAINT `people_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `people_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.people: ~6 rows (approximately)
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` (`id`, `names`, `surnames`, `ci`, `email`, `phone`, `address`, `status`, `user_id`, `city_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Jorge', 'Banegas', '8914345', 'nano@gmail.com', '72115369', 'La Guardia', 1, 1, 1, '2024-05-28 09:28:03', '2024-05-28 09:28:03', NULL),
	(2, 'Carlos', 'Morales', '7707814', 'carlos@gmail.com', '68945278', 'La Villa', 1, 2, 1, '2024-05-28 09:28:32', '2024-05-28 09:28:32', NULL),
	(12, 'Freddy Gabriel', 'Banegas Montaño', '8963547', 'mino@gmail.com', '72115478', 'Barrio 8 de diciembre', 1, 16, 1, '2024-06-07 20:14:51', '2024-06-07 20:14:51', NULL),
	(13, 'Hugo', 'Vam Damme', '5695302', 'hugo@gmail.com', '3546298', 'Barrio 8 de Diciembre', 1, 17, 2, '2024-06-19 15:19:30', '2024-06-19 16:19:44', NULL),
	(14, 'Jose', 'Saravia Mendoza', '7852369', 'jose@gmail.com', '77065789', 'California', 1, 18, 2, '2024-06-19 16:20:34', '2024-06-19 16:20:42', NULL),
	(15, 'Gabriela', 'Medeiros', '4123650', 'gaby@gmail.com', '36987454', 'Kilometro 9', 1, 19, 2, '2024-06-19 16:21:47', '2024-06-19 16:21:47', NULL);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.permissions: ~13 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Patient.index', 'api', '2024-07-17 15:13:50', '2024-07-17 15:13:50'),
	(2, 'Patient.store', 'api', '2024-07-17 15:14:08', '2024-07-17 15:14:08'),
	(3, 'Patient.update', 'api', '2024-07-17 15:14:52', '2024-07-17 15:14:53'),
	(4, 'Patient.delete', 'api', '2024-07-17 15:15:08', '2024-07-17 15:15:09'),
	(5, 'People.index', 'api', '2024-07-17 15:15:41', '2024-07-17 15:15:43'),
	(6, 'People.store', 'api', '2024-07-17 15:15:54', '2024-07-17 15:15:54'),
	(7, 'People.update', 'api', '2024-07-17 15:16:46', '2024-07-17 15:16:46'),
	(8, 'People.delete', 'api', '2024-07-17 15:17:01', '2024-07-17 15:17:02'),
	(9, 'Therapist.index', 'api', '2024-07-17 15:17:28', '2024-07-17 15:17:28'),
	(10, 'Therapist.store', 'api', '2024-07-17 15:17:47', '2024-07-17 15:17:47'),
	(11, 'Therapist.update', 'api', '2024-07-17 15:19:49', '2024-07-17 15:19:49'),
	(12, 'Therapist.delete', 'api', '2024-07-17 15:20:04', '2024-07-17 15:20:04'),
	(13, 'MyPatient.index', 'api', '2024-07-17 16:38:36', '2024-07-17 16:38:37'),
	(14, 'Home.index', 'api', '2024-07-19 15:42:50', '2024-07-19 15:42:51'),
	(15, 'Profile.index', 'api', '2024-07-19 16:35:14', '2024-07-19 16:35:15'),
	(16, 'MyQueries.index', 'api', '2024-07-22 17:55:46', '2024-07-22 17:55:46'),
	(17, 'Mytreatments.index', 'api', '2024-07-22 17:56:28', '2024-07-22 17:56:28');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.personal_access_tokens: ~92 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\User', 1, 'auth_token', '24e559bcc909479b24d486e92c3847577cf74243895b18af0f4ec69400b3a3c7', '["*"]', NULL, NULL, '2024-05-24 16:43:43', '2024-05-24 16:43:43'),
	(2, 'App\\Models\\User', 1, 'auth_token', '94e4d677c86c7a5854b3c884cc7fae7f64d2d922e06afc1fa5ba838cb2cc0bf3', '["*"]', NULL, NULL, '2024-05-24 18:53:00', '2024-05-24 18:53:00'),
	(3, 'App\\Models\\User', 1, 'auth_token', 'c00364f497a11510265122014a999f49556dea002aca1f315cec73f2a8325751', '["*"]', NULL, NULL, '2024-05-24 19:27:59', '2024-05-24 19:27:59'),
	(4, 'App\\Models\\User', 1, 'auth_token', '51325d532aab9ab5e2ac834147393fb757245533851cc9c60409cc26ddd3e75c', '["*"]', NULL, NULL, '2024-05-24 20:06:53', '2024-05-24 20:06:53'),
	(5, 'App\\Models\\User', 1, 'auth_token', '8cca7b1d2e4aa3e6514f6aa40fc59eda6a2a2db71b55e59e2469daf7f2aa445a', '["*"]', NULL, NULL, '2024-05-24 20:08:00', '2024-05-24 20:08:00'),
	(6, 'App\\Models\\User', 1, 'auth_token', '5a008a30c7df7cc2e36080b01bf2338c2bfbab26085a35ba17267590503a72f5', '["*"]', NULL, NULL, '2024-05-24 20:08:37', '2024-05-24 20:08:37'),
	(7, 'App\\Models\\User', 1, 'auth_token', '3d372c08e859595c700a30b085f969b4b208ae25e3c70c3e2f46e360082579ba', '["*"]', NULL, NULL, '2024-05-24 20:41:23', '2024-05-24 20:41:23'),
	(8, 'App\\Models\\User', 1, 'auth_token', 'e9244b52d047548d2df738bc6edbdd891428288294cc477eb4098b41ffc01432', '["*"]', NULL, NULL, '2024-05-24 20:42:01', '2024-05-24 20:42:01'),
	(9, 'App\\Models\\User', 1, 'auth_token', 'e9da563774e42ce4873fe083da9e020a38a0f27cb5c32eb9e3e3cbc601af6001', '["*"]', NULL, NULL, '2024-05-24 21:03:54', '2024-05-24 21:03:54'),
	(10, 'App\\Models\\User', 1, 'auth_token', '227105ca9b07b0dfab3bf127f21e383e511ae69c58f89697fbf3361d1eec89c3', '["*"]', NULL, NULL, '2024-05-24 21:09:23', '2024-05-24 21:09:23'),
	(11, 'App\\Models\\User', 1, 'auth_token', '3cfb3b483564e6a4ab49b720b26568e6a39286ed6dc72fe12ae59e30bdeb55a9', '["*"]', NULL, NULL, '2024-05-24 21:23:07', '2024-05-24 21:23:07'),
	(12, 'App\\Models\\User', 1, 'auth_token', '271c431af848957a1e7bff760b7c3223f9bfc6fa4c7e72c972640827e152021c', '["*"]', NULL, NULL, '2024-05-24 21:27:03', '2024-05-24 21:27:03'),
	(13, 'App\\Models\\User', 1, 'auth_token', '669143e3c00159373a27f7e09fc133015137ec82a75e0e1ed07875b7271a8865', '["*"]', NULL, NULL, '2024-05-24 21:51:14', '2024-05-24 21:51:14'),
	(14, 'App\\Models\\User', 1, 'auth_token', '769acc1804ddb6d07061e89d2510cdad383cd16ea9724d0398335e7c12bf869d', '["*"]', NULL, NULL, '2024-05-24 21:51:40', '2024-05-24 21:51:40'),
	(15, 'App\\Models\\User', 1, 'auth_token', 'e2744c34aa70376a153c960b05c2281769005d82fd46a86d25829a74e268a7ba', '["*"]', NULL, NULL, '2024-05-24 22:02:43', '2024-05-24 22:02:43'),
	(16, 'App\\Models\\User', 1, 'auth_token', '36453e46a9ace0686fb7667c75906c1d619252caa0208a3235a00c1c1b2ee5de', '["*"]', NULL, NULL, '2024-05-24 22:03:03', '2024-05-24 22:03:03'),
	(17, 'App\\Models\\User', 1, 'auth_token', '4a9d3c71b75b21ec04c0e96bfcb840aa2f763e5170a172c1b37b26441defefad', '["*"]', NULL, NULL, '2024-05-27 14:52:28', '2024-05-27 14:52:28'),
	(18, 'App\\Models\\User', 1, 'auth_token', 'e69d620d8e9fccefc1e085f14ea4492530a9d566dc1c5d7b7e33d11a0c31a600', '["*"]', NULL, NULL, '2024-05-27 14:59:25', '2024-05-27 14:59:25'),
	(19, 'App\\Models\\User', 1, 'auth_token', 'cd80d76a112715d5c2fed62484ce148217d3b45ee140c5a403428eefe887c5f1', '["*"]', NULL, NULL, '2024-05-27 17:38:44', '2024-05-27 17:38:44'),
	(20, 'App\\Models\\User', 1, 'auth_token', 'ad43fd807deab4153a2e64b9d9c955d068093a1cf8dd33ce57086dba9b325d9b', '["*"]', '2024-05-28 15:54:04', NULL, '2024-05-28 13:20:02', '2024-05-28 15:54:04'),
	(21, 'App\\Models\\User', 1, 'auth_token', '193ceac8db957f5ebeaf71a35314da391db6308a519135c809d2661cec1ffb32', '["*"]', '2024-05-28 18:33:47', NULL, '2024-05-28 15:54:44', '2024-05-28 18:33:47'),
	(22, 'App\\Models\\User', 1, 'auth_token', 'cdb8a038ac7ffc77333fec0e07591fd77576d6f559f69c61db02a328fbefe667', '["*"]', '2024-06-01 15:24:02', NULL, '2024-05-29 19:26:23', '2024-06-01 15:24:02'),
	(23, 'App\\Models\\User', 1, 'auth_token', '27547963c5edf20a7db61010fe37fde8702bdd97f6d1263d7c21b2fa243783ec', '["*"]', '2024-06-01 15:53:53', NULL, '2024-06-01 15:27:56', '2024-06-01 15:53:53'),
	(24, 'App\\Models\\User', 1, 'auth_token', '0f114de57927253a6c309c4a5ab42243809573f9bc58b1493e03998516d3e29e', '["*"]', '2024-06-13 15:09:14', NULL, '2024-06-01 15:56:52', '2024-06-13 15:09:14'),
	(25, 'App\\Models\\User', 1, 'auth_token', 'f83a926e8b288311300867081c6dc499003b433f90e880543a13c420f19a7226', '["*"]', '2024-06-19 22:49:58', NULL, '2024-06-18 18:36:01', '2024-06-19 22:49:58'),
	(26, 'App\\Models\\User', 1, 'auth_token', 'fba87807af29cefa4dae48a0cb8cfe87e2254208f017ef34faa7754f49c875f4', '["*"]', '2024-06-28 15:55:15', NULL, '2024-06-27 15:53:31', '2024-06-28 15:55:15'),
	(27, 'App\\Models\\User', 1, 'auth_token', '51e2372a8714d8c17916a147295565ccd79e0f9c38a32dc16d7874c52eb04802', '["*"]', '2024-06-28 15:33:51', NULL, '2024-06-28 15:05:16', '2024-06-28 15:33:51'),
	(28, 'App\\Models\\User', 1, 'auth_token', '55e236601a394f8fe21d96557bd10bec1e31aef3dd9896d50a511c1e0a42f014', '["*"]', '2024-07-03 20:42:59', NULL, '2024-07-01 19:41:18', '2024-07-03 20:42:59'),
	(29, 'App\\Models\\User', 1, 'auth_token', '1047d8bafc509020182beebcc96a48d99501ffb09b90a37160e61e8fe68ab906', '["*"]', NULL, NULL, '2024-07-03 18:29:41', '2024-07-03 18:29:41'),
	(30, 'App\\Models\\User', 1, 'auth_token', '949de26a7fe07ca01d173ecfaeb11ce30912410cd43250f1d99f57b6cafeecf3', '["*"]', NULL, NULL, '2024-07-03 18:31:50', '2024-07-03 18:31:50'),
	(31, 'App\\Models\\User', 1, 'auth_token', '904e8a36e06c2ed2ac05205a9afa98aaaf2b7203b60ed1f81c5e9a34f134ff5e', '["*"]', NULL, NULL, '2024-07-03 18:32:15', '2024-07-03 18:32:15'),
	(32, 'App\\Models\\User', 1, 'auth_token', '4427e498d262bbae2e22e97f47be24d054dec6934ac1c5e97d3eb7f057c2deb4', '["*"]', NULL, NULL, '2024-07-03 20:37:55', '2024-07-03 20:37:55'),
	(33, 'App\\Models\\User', 1, 'auth_token', '95795993e1d28177df204a154bf731b4bf78649de6dba1eac3989191738adaab', '["*"]', NULL, NULL, '2024-07-03 20:38:18', '2024-07-03 20:38:18'),
	(34, 'App\\Models\\User', 1, 'auth_token', 'cf1268c41e2ea60de1efb77babca2bc6b9b5d0325eb1164fe6f7c417d0493637', '["*"]', NULL, NULL, '2024-07-03 20:45:49', '2024-07-03 20:45:49'),
	(35, 'App\\Models\\User', 1, 'auth_token', '945555096ce5064eaa0413c890f0850320a01adbd5f13605343ad2807edd9f8b', '["*"]', NULL, NULL, '2024-07-03 20:51:24', '2024-07-03 20:51:24'),
	(36, 'App\\Models\\User', 1, 'auth_token', '3b7f2eddbe251a5bdf451b8f81ab6dbe2363bd43752b7fc2ff099171b5d1bf4a', '["*"]', '2024-07-03 20:54:55', NULL, '2024-07-03 20:53:51', '2024-07-03 20:54:55'),
	(37, 'App\\Models\\User', 1, 'auth_token', '5bfc820ba5e4a8d22b125368178fa179c6ee8ad35568ced06e88c31e7f0893f0', '["*"]', '2024-07-04 16:00:36', NULL, '2024-07-03 20:55:57', '2024-07-04 16:00:36'),
	(38, 'App\\Models\\User', 1, 'auth_token', '78e28c09f88b93022c213f5328406fbb80c38e23ac07e05c31c8beb542622dee', '["*"]', '2024-07-04 16:08:50', NULL, '2024-07-04 16:00:54', '2024-07-04 16:08:50'),
	(39, 'App\\Models\\User', 1, 'auth_token', '916765ce5addcd6e00845ceeab422eb5caa7fc06b2bd5b2f1c9bc5be28f94823', '["*"]', NULL, NULL, '2024-07-04 18:05:15', '2024-07-04 18:05:15'),
	(40, 'App\\Models\\User', 1, 'auth_token', 'bab8d4332697047b9f32695dfea9daa6706afdf9564bca7af481ca871990c53c', '["*"]', NULL, NULL, '2024-07-04 18:06:06', '2024-07-04 18:06:06'),
	(41, 'App\\Models\\User', 1, 'auth_token', '6aedfaa3e36795c666f9974b5d0da2b6076cce15b9e5de76a4d4357db6b812d1', '["*"]', NULL, NULL, '2024-07-04 18:09:02', '2024-07-04 18:09:02'),
	(42, 'App\\Models\\User', 1, 'auth_token', 'd8fd92a5053b4e3dcb0013dae8dc6d40412ed7f3867d6362544c700cb1ef944b', '["*"]', NULL, NULL, '2024-07-04 18:09:17', '2024-07-04 18:09:17'),
	(43, 'App\\Models\\User', 1, 'auth_token', 'ff56a796c9c3e2bc225668d9e09a4d233cafca4ebc9ba8bce030ce25f4a642c9', '["*"]', NULL, NULL, '2024-07-04 18:09:57', '2024-07-04 18:09:57'),
	(44, 'App\\Models\\User', 1, 'auth_token', 'caba0135b39369eaa4ce7c400a5db20196f9ed142dfb9bff547bbbe686207d4d', '["*"]', NULL, NULL, '2024-07-04 18:10:16', '2024-07-04 18:10:16'),
	(45, 'App\\Models\\User', 1, 'auth_token', 'a9bcb6e51127fdbd0ef3938d390d3182e10161873b37fee0422041339c0eca4a', '["*"]', NULL, NULL, '2024-07-04 18:10:29', '2024-07-04 18:10:29'),
	(46, 'App\\Models\\User', 1, 'auth_token', '3b1afe4b17bfb8783c915a825a8ed2483a6ad6d1807d4ed958694018cd5cc158', '["*"]', NULL, NULL, '2024-07-04 18:49:58', '2024-07-04 18:49:58'),
	(47, 'App\\Models\\User', 1, 'auth_token', '2b7978b664abf8bfea15ff7762eacadaf80c145177bbff137d840127e0b2c1cb', '["*"]', NULL, NULL, '2024-07-04 19:09:57', '2024-07-04 19:09:57'),
	(48, 'App\\Models\\User', 1, 'auth_token', 'af97c412ca348a6e588a0925e8aa0890a2efe93cff63a8e9de40115a7f3ccfb6', '["*"]', NULL, NULL, '2024-07-04 19:11:05', '2024-07-04 19:11:05'),
	(49, 'App\\Models\\User', 1, 'auth_token', '89ff0415dc0e879f73c3e2b77e173507ab290210ef3d1e06ab277fba3f6e40ba', '["*"]', NULL, NULL, '2024-07-04 19:11:52', '2024-07-04 19:11:52'),
	(50, 'App\\Models\\User', 1, 'auth_token', '93b2eab72b7d808de88526a9695a75a222e52545d7a8b3a9487f264349db878d', '["*"]', NULL, NULL, '2024-07-04 19:21:26', '2024-07-04 19:21:26'),
	(51, 'App\\Models\\User', 1, 'auth_token', 'db9b3d2abe0b2459416f53e5106d01289d089f9cd07bb988bf6a8333f07ebd17', '["*"]', NULL, NULL, '2024-07-04 19:32:08', '2024-07-04 19:32:08'),
	(52, 'App\\Models\\User', 1, 'auth_token', '081b8168461c2359548f4b1bae51586a1d206ccf3eccc776f690a71a41ea114c', '["*"]', NULL, NULL, '2024-07-04 19:39:42', '2024-07-04 19:39:42'),
	(53, 'App\\Models\\User', 1, 'auth_token', 'c2da24f853b4c7790101c5a5e3f1a96801a5601cf62e69bf56c433e783847a19', '["*"]', NULL, NULL, '2024-07-04 19:39:50', '2024-07-04 19:39:50'),
	(54, 'App\\Models\\User', 1, 'auth_token', '08d06cfa210a82c76033abdcef73ce295390eb3fcad2e309c3c62d4ba161bd80', '["*"]', NULL, NULL, '2024-07-04 20:06:33', '2024-07-04 20:06:33'),
	(55, 'App\\Models\\User', 1, 'auth_token', 'f2eb509a3698c80454dbabfa631341fa1e32ad0ed3360038e98037b06012a868', '["*"]', NULL, NULL, '2024-07-04 20:07:28', '2024-07-04 20:07:28'),
	(56, 'App\\Models\\User', 1, 'auth_token', 'd52fdfe6291aa1fc7dbb77e8828388d421830b6bfcbf1d00df44cd1efca43440', '["*"]', NULL, NULL, '2024-07-04 20:08:45', '2024-07-04 20:08:45'),
	(57, 'App\\Models\\User', 1, 'auth_token', '3eb4fa3789a97f120aabf6f74d91cee2d760bbe897b429416e26354b84a839a1', '["*"]', NULL, NULL, '2024-07-04 20:12:38', '2024-07-04 20:12:38'),
	(58, 'App\\Models\\User', 1, 'auth_token', '20bf7c5bf53e394afd94795d68e39c8c2e41bad1362028a5c92a6ae51f437971', '["*"]', NULL, NULL, '2024-07-04 20:16:09', '2024-07-04 20:16:09'),
	(59, 'App\\Models\\User', 1, 'auth_token', '1aa0c1dde01822f173facc6a1e97fb4246ca4d7d6e11e382a0dd947d4f2b5e52', '["*"]', NULL, NULL, '2024-07-04 20:20:50', '2024-07-04 20:20:50'),
	(60, 'App\\Models\\User', 1, 'auth_token', '7daabbd48037ed6f0240d63ec424ac7c920e98d9117bd8cb68ef21556fe69521', '["*"]', NULL, NULL, '2024-07-04 20:21:27', '2024-07-04 20:21:27'),
	(61, 'App\\Models\\User', 1, 'auth_token', '1b371086707dadd2d3c7bc3a7edc51ff8747872257c8e41cf6ca489f09b4883b', '["*"]', NULL, NULL, '2024-07-04 20:22:36', '2024-07-04 20:22:36'),
	(62, 'App\\Models\\User', 1, 'auth_token', '8e03d035abeb89612aaacdb82a8d5e726ddda7dcb09827a541dd4391ac043013', '["*"]', NULL, NULL, '2024-07-04 20:24:24', '2024-07-04 20:24:24'),
	(63, 'App\\Models\\User', 1, 'auth_token', '1ed9b77e96cbb65dd3a139d53c38d83dd362e92895db040456f148934073ff53', '["*"]', NULL, NULL, '2024-07-04 20:24:27', '2024-07-04 20:24:27'),
	(64, 'App\\Models\\User', 1, 'auth_token', '72c622a8f0223260f87217916260bd46a07a314185f139949c6093c7eff2db5a', '["*"]', NULL, NULL, '2024-07-04 20:24:34', '2024-07-04 20:24:34'),
	(65, 'App\\Models\\User', 1, 'auth_token', 'ecbe1639863d11d2408f2681e8811a2d9c98a7a114dc2e43c0d318cd426cb3df', '["*"]', NULL, NULL, '2024-07-05 17:31:41', '2024-07-05 17:31:41'),
	(66, 'App\\Models\\User', 1, 'auth_token', '303f60fc5c95f7f6075646a5b26a7aa455b1d1cf3ab2814a5d3f8a21e3497111', '["*"]', NULL, NULL, '2024-07-05 17:31:48', '2024-07-05 17:31:48'),
	(67, 'App\\Models\\User', 1, 'auth_token', '75d81ad43b4d3b883c7a46cb1bb7f8f3b5a7ee385e02a9b2925f48c735f770a5', '["*"]', NULL, NULL, '2024-07-05 17:37:41', '2024-07-05 17:37:41'),
	(68, 'App\\Models\\User', 1, 'auth_token', '6a70b6ed607ba1b446b2fcaed611aa52c54216ac85a82229cef32a2ddf6d93e6', '["*"]', NULL, NULL, '2024-07-05 17:40:33', '2024-07-05 17:40:33'),
	(69, 'App\\Models\\User', 1, 'auth_token', 'fa32896d71793b50437599a990ba7fe79eb2603d93ff4d4c01e9ea923cc47837', '["*"]', NULL, NULL, '2024-07-05 17:40:40', '2024-07-05 17:40:40'),
	(70, 'App\\Models\\User', 1, 'auth_token', '009fc0f1d44769a315707cf8c9d09ef07be1275a30c6d8986ce1bb605c02352d', '["*"]', '2024-07-05 17:47:08', NULL, '2024-07-05 17:45:06', '2024-07-05 17:47:08'),
	(71, 'App\\Models\\User', 1, 'auth_token', 'c6d9b505a337c42712bb28aa61ddb6a0c48f55b4198facc84b608a0645abfc91', '["*"]', '2024-07-05 17:52:00', NULL, '2024-07-05 17:47:20', '2024-07-05 17:52:00'),
	(72, 'App\\Models\\User', 1, 'auth_token', '63eb6724aee80189aa38f1d5dac60b4bf1c466552f699f20f8482677dee8e024', '["*"]', '2024-07-05 17:53:44', NULL, '2024-07-05 17:52:09', '2024-07-05 17:53:44'),
	(73, 'App\\Models\\User', 1, 'auth_token', 'ba861606cef022474c399638d67a152ff0902c54be48c69e0b91ffe842446a96', '["*"]', '2024-07-05 18:17:49', NULL, '2024-07-05 17:59:03', '2024-07-05 18:17:49'),
	(74, 'App\\Models\\User', 1, 'auth_token', '29f2c846e3319dd39e5cf66fd43b7b084580a3c55819f486f734df80c3f69093', '["*"]', NULL, NULL, '2024-07-05 18:44:42', '2024-07-05 18:44:42'),
	(75, 'App\\Models\\User', 1, 'auth_token', 'a38fd7ada4e60bbee3c3a6d621942000ab7d5554f8937a0db1a595a589a5b725', '["*"]', NULL, NULL, '2024-07-05 19:02:31', '2024-07-05 19:02:31'),
	(76, 'App\\Models\\User', 1, 'auth_token', 'edf37481049bd68a7603c3eab921f3347ddaef9eec8550c1c2f8b4026cb36600', '["*"]', NULL, NULL, '2024-07-05 19:38:04', '2024-07-05 19:38:04'),
	(77, 'App\\Models\\User', 1, 'auth_token', '8141396d64378a6ca49dd7402cee197413fbd36408ba056ba90e8403a3f14f6c', '["*"]', '2024-07-05 21:25:11', NULL, '2024-07-05 20:39:14', '2024-07-05 21:25:11'),
	(78, 'App\\Models\\User', 1, 'auth_token', '2e4902892b21908cb30cb972a29c91d1fc2aefcd4253d81ac79bdd74d1898b99', '["*"]', '2024-07-05 21:26:36', NULL, '2024-07-05 21:26:16', '2024-07-05 21:26:36'),
	(79, 'App\\Models\\User', 1, 'auth_token', '7bbaef1ecb298a7ff2433dc32de2704c05723fcae9098b51989a7e430f93117c', '["*"]', '2024-07-16 20:18:10', NULL, '2024-07-11 17:53:10', '2024-07-16 20:18:10'),
	(80, 'App\\Models\\User', 1, 'auth_token', 'f14ba2bfea548e42cff0de7ebd337e9cadc708fbda17d58ba9423db9008fdfa7', '["*"]', NULL, NULL, '2024-07-16 20:47:48', '2024-07-16 20:47:48'),
	(81, 'App\\Models\\User', 1, 'auth_token', '4ba5900dd16bf711d04033a9d25980329dbd15ac2ca2b26e842cf88fb1f830b7', '["*"]', NULL, NULL, '2024-07-16 21:26:42', '2024-07-16 21:26:42'),
	(82, 'App\\Models\\User', 2, 'auth_token', '6500f9d91540e030d0796f772e8f397764ceaae9cbac4da6c05e48df1bc088d7', '["*"]', NULL, NULL, '2024-07-17 15:54:08', '2024-07-17 15:54:08'),
	(83, 'App\\Models\\User', 2, 'auth_token', '353b13dfd81f7dbab3b491ac10b029413db653dba0fe6439a531ebf03d5cf6de', '["*"]', NULL, NULL, '2024-07-17 15:54:46', '2024-07-17 15:54:46'),
	(84, 'App\\Models\\User', 2, 'auth_token', '84de2010bf59c74b3d773ba05d07de14b60828273ab1be051c4a7eeafc4f00f1', '["*"]', NULL, NULL, '2024-07-17 15:55:26', '2024-07-17 15:55:26'),
	(85, 'App\\Models\\User', 2, 'auth_token', 'bb9c5c2eeaf00b23973ce9c182052057d224c67d20c3d6dd30f4f0676566762f', '["*"]', '2024-07-17 15:56:34', NULL, '2024-07-17 15:55:56', '2024-07-17 15:56:34'),
	(86, 'App\\Models\\User', 2, 'auth_token', '82851c05eb94923fbc75b6c38aa2129553a3803a709ce598cdd90e2bd469c40d', '["*"]', NULL, NULL, '2024-07-17 15:56:58', '2024-07-17 15:56:58'),
	(87, 'App\\Models\\User', 2, 'auth_token', '4b627a00afe71333ae6c1da2fb055d7bcc75db9bb78183bbf6471170fd7f6b44', '["*"]', NULL, NULL, '2024-07-17 16:15:59', '2024-07-17 16:15:59'),
	(88, 'App\\Models\\User', 2, 'auth_token', 'ff7f8388598f8ccf4cf62365d271ecba16c7b547da7e9908a97c291c048ab08c', '["*"]', NULL, NULL, '2024-07-17 21:02:28', '2024-07-17 21:02:28'),
	(89, 'App\\Models\\User', 1, 'auth_token', '8fdae108f12a984ec4be8a5867944211e1f878fed88355610df70ce5b96d584d', '["*"]', NULL, NULL, '2024-07-17 21:05:28', '2024-07-17 21:05:28'),
	(90, 'App\\Models\\User', 2, 'auth_token', '0f0d8a769df72b1eea6e90497b5e27edc833a6dc7a6c0b14d986bfd92037dbec', '["*"]', NULL, NULL, '2024-07-17 21:10:08', '2024-07-17 21:10:08'),
	(91, 'App\\Models\\User', 2, 'auth_token', '70272bd4261bb201536d2f71be6d753fb8a770a11a6665753ac06da072aaf779', '["*"]', NULL, NULL, '2024-07-17 21:12:31', '2024-07-17 21:12:31'),
	(92, 'App\\Models\\User', 2, 'auth_token', '77395344de74ef75d3fa071dbfaec7453fbd0b1f76ee5ef686ed99d4f2eb2cd1', '["*"]', NULL, NULL, '2024-07-17 21:45:32', '2024-07-17 21:45:32'),
	(93, 'App\\Models\\User', 2, 'auth_token', 'cf06870b1d5419f557c884023e090fb31633daafca531e334a8cc15c7eba28d8', '["*"]', NULL, NULL, '2024-07-19 19:43:43', '2024-07-19 19:43:43'),
	(94, 'App\\Models\\User', 2, 'auth_token', 'd5beeaa454167a16cce815b19b8e8f31686013b59649594bd983dfb47d640ce7', '["*"]', NULL, NULL, '2024-07-19 19:44:57', '2024-07-19 19:44:57'),
	(95, 'App\\Models\\User', 2, 'auth_token', 'a55e79039fc6eed124de542df4db9c9ea8bce8067cb99093b30444dd3be74ff5', '["*"]', NULL, NULL, '2024-07-19 20:36:18', '2024-07-19 20:36:18'),
	(96, 'App\\Models\\User', 2, 'auth_token', '05b5149c2c1806aac0356677209711890277a55db0c2378d8da5e2fa01f398a1', '["*"]', NULL, NULL, '2024-07-19 21:07:00', '2024-07-19 21:07:00'),
	(97, 'App\\Models\\User', 1, 'auth_token', '765a9dd6400e5cf0a0b38dfae6c43ac68800cfb3060c568d5377c9e4598441c6', '["*"]', NULL, NULL, '2024-07-19 21:12:07', '2024-07-19 21:12:07'),
	(98, 'App\\Models\\User', 1, 'auth_token', 'bdedacdfb8027d7bc035bdac7c0a379462b0d9eb668689179a948b6710560848', '["*"]', NULL, NULL, '2024-07-19 21:36:02', '2024-07-19 21:36:02'),
	(99, 'App\\Models\\User', 1, 'auth_token', 'e5df1731546e37f101e29b0980bb6088f271e1b9361414e5c76b776cd1d81dc3', '["*"]', NULL, NULL, '2024-07-19 21:39:33', '2024-07-19 21:39:33'),
	(100, 'App\\Models\\User', 1, 'auth_token', '99c4193532b4e529adb46979a814d09590bc51614099864bfe54974922d358b7', '["*"]', NULL, NULL, '2024-07-19 21:41:45', '2024-07-19 21:41:45'),
	(101, 'App\\Models\\User', 2, 'auth_token', 'a3327244262f9962334e81c169e16cb31b3addad237ef89aefb8fb268af79ee9', '["*"]', NULL, NULL, '2024-07-19 21:45:05', '2024-07-19 21:45:05'),
	(102, 'App\\Models\\User', 2, 'auth_token', '6d493261d3ddde483fb1cba00ab7646ee3abc3db8ca123b02718ca64961ba49a', '["*"]', NULL, NULL, '2024-07-19 21:46:01', '2024-07-19 21:46:01'),
	(103, 'App\\Models\\User', 1, 'auth_token', '618424ccb4047c003ca39500771aac384fe9b3ec19d2e37bbb968e8cb6757a89', '["*"]', NULL, NULL, '2024-07-19 21:53:10', '2024-07-19 21:53:10'),
	(104, 'App\\Models\\User', 1, 'auth_token', '42e069b359767b691ed640f7841406c04a6a69015ab0dad0639dc0d32b6d1cbc', '["*"]', NULL, NULL, '2024-07-22 19:52:34', '2024-07-22 19:52:34'),
	(105, 'App\\Models\\User', 2, 'auth_token', 'e954a057413ed6ac8d65e0fb5c5a5524becfc2c11571ec7cb115e43f33b439f2', '["*"]', NULL, NULL, '2024-07-22 19:53:18', '2024-07-22 19:53:18'),
	(106, 'App\\Models\\User', 2, 'auth_token', 'bfa9d6c32551cbcfc059c0bcc2acc0965881bd706673cc11e25890a762f4e08f', '["*"]', NULL, NULL, '2024-07-22 19:53:48', '2024-07-22 19:53:48'),
	(107, 'App\\Models\\User', 1, 'auth_token', 'efd883c7f150ad445d9480797452153aeba059b86deb774ed4709037605a0717', '["*"]', NULL, NULL, '2024-07-22 19:57:43', '2024-07-22 19:57:43'),
	(108, 'App\\Models\\User', 2, 'auth_token', 'c16c10ae6b36804f30521b7132566779c190ca202852857c18986c9eff906126', '["*"]', NULL, NULL, '2024-07-22 19:57:58', '2024-07-22 19:57:58'),
	(109, 'App\\Models\\User', 1, 'auth_token', '672337a82944ea1c6031c8174efecd7b9fb10ee810a1127818984f80d57021ba', '["*"]', NULL, NULL, '2024-07-22 20:04:28', '2024-07-22 20:04:28'),
	(110, 'App\\Models\\User', 2, 'auth_token', '8d1ad534781ea45a42c5a4b7ef137281dbbe25f6d87dffbd72d3aa3a7f3ed4e3', '["*"]', NULL, NULL, '2024-07-22 20:04:57', '2024-07-22 20:04:57'),
	(111, 'App\\Models\\User', 1, 'auth_token', 'd3117ef6cb05dc8a38b405641b31a12aee97eec0456e7858e9d06886c77bfbb0', '["*"]', NULL, NULL, '2024-07-22 20:05:47', '2024-07-22 20:05:47'),
	(112, 'App\\Models\\User', 1, 'auth_token', '246fbf70cbef8fbfbc88b117733369b779dfbd7098c1d1192190a05b5158d69a', '["*"]', NULL, NULL, '2024-07-22 20:06:14', '2024-07-22 20:06:14'),
	(113, 'App\\Models\\User', 2, 'auth_token', '4187a07167e4fa02bfb92a575d9b37f0fbb265739e9dc831858171c7b3d6232e', '["*"]', NULL, NULL, '2024-07-22 20:06:46', '2024-07-22 20:06:46'),
	(114, 'App\\Models\\User', 1, 'auth_token', '77f8b657b865ebee4fc85f7cc35f9c5ddc829589b778e30f3977f9007594f2cf', '["*"]', '2024-07-22 20:09:49', NULL, '2024-07-22 20:09:37', '2024-07-22 20:09:49'),
	(115, 'App\\Models\\User', 1, 'auth_token', '556e49c51caf3767a6c7674f6a925427750fbae4adc77c71a6ad0cdb6326f1f0', '["*"]', '2024-07-22 20:11:22', NULL, '2024-07-22 20:11:16', '2024-07-22 20:11:22'),
	(116, 'App\\Models\\User', 1, 'auth_token', '0be6a641289b7d698044fde075b5bffe84b8170ef676d57a7a22dd186bbb5635', '["*"]', '2024-07-22 21:05:13', NULL, '2024-07-22 21:05:12', '2024-07-22 21:05:13'),
	(117, 'App\\Models\\User', 1, 'auth_token', '644d944b1da57fcd11d1c3de8d22a0da8bcb3741af0ef492ddcc884944e0d4c5', '["*"]', NULL, NULL, '2024-07-22 21:14:08', '2024-07-22 21:14:08'),
	(118, 'App\\Models\\User', 1, 'auth_token', '2daf5f84c5f3ad109d7d29d6afe5da6d35fc501379aab32875d9160dcde4e022', '["*"]', NULL, NULL, '2024-07-22 21:15:47', '2024-07-22 21:15:47'),
	(119, 'App\\Models\\User', 1, 'auth_token', '95440b869ddb7de3dab5648cd0f7e0ce7bf23a3f58d22cb8e289109798d4422c', '["*"]', NULL, NULL, '2024-07-22 21:16:32', '2024-07-22 21:16:32'),
	(120, 'App\\Models\\User', 2, 'auth_token', '827562fb252ae21d155c2459ef59f110dfd2c3aab2ce623622aa653df26f61ff', '["*"]', NULL, NULL, '2024-07-22 21:18:35', '2024-07-22 21:18:35'),
	(121, 'App\\Models\\User', 1, 'auth_token', '9f1f98e2482a79fcb24bf1969f47646dfa3d4d3e39e63ee110b4ac8fa0268d67', '["*"]', NULL, NULL, '2024-07-22 21:19:32', '2024-07-22 21:19:32'),
	(122, 'App\\Models\\User', 2, 'auth_token', 'e0ecde8d6c7dcb7f7669fe1249db6228c706da5265bab5757b33ac36a518c9f8', '["*"]', NULL, NULL, '2024-07-22 21:19:47', '2024-07-22 21:19:47'),
	(123, 'App\\Models\\User', 1, 'auth_token', 'bd850c582560817aeeedd4e295217678dc5f954894abd86bcd18b2ce2990ff9e', '["*"]', '2024-07-22 21:28:32', NULL, '2024-07-22 21:25:31', '2024-07-22 21:28:32'),
	(124, 'App\\Models\\User', 2, 'auth_token', '5f98f880e2fe5fe550ef1d907c95d2e1e6cd60f3ed1896e9455a47f20bdf6163', '["*"]', NULL, NULL, '2024-07-22 21:28:46', '2024-07-22 21:28:46'),
	(125, 'App\\Models\\User', 1, 'auth_token', '338fd936cabc7ef03cf6ac945c037fbe4c63bb2de59f32a7c028885176db92e4', '["*"]', NULL, NULL, '2024-07-22 21:34:47', '2024-07-22 21:34:47'),
	(126, 'App\\Models\\User', 2, 'auth_token', 'eb0744daca40f9b4e3dd310465f5c70a82f9228a4bed355a9501f141f74dcd7c', '["*"]', NULL, NULL, '2024-07-22 21:54:13', '2024-07-22 21:54:13'),
	(127, 'App\\Models\\User', 2, 'auth_token', '6c4461a20b7de9d7c444deed6552940fa14df3747cf0f6a08b113a73cc4e6f9c', '["*"]', NULL, NULL, '2024-07-22 21:57:04', '2024-07-22 21:57:04'),
	(128, 'App\\Models\\User', 2, 'auth_token', '07d9b65fe0732224c9a3f6eb9660ebacf9378f6f179fc859f88809cd8f3acae9', '["*"]', NULL, NULL, '2024-07-22 21:57:56', '2024-07-22 21:57:56');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.professions
CREATE TABLE IF NOT EXISTS `professions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.professions: ~2 rows (approximately)
/*!40000 ALTER TABLE `professions` DISABLE KEYS */;
INSERT INTO `professions` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Psicologo', NULL, '2024-06-19 13:25:30', '2024-06-19 13:25:31'),
	(2, 'Pedagogo', NULL, '2024-06-19 13:25:59', '2024-06-19 13:26:00');
/*!40000 ALTER TABLE `professions` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.queries
CREATE TABLE IF NOT EXISTS `queries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.queries: ~0 rows (approximately)
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.roles: ~3 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', 'api', '2024-07-03 14:10:46', '2024-07-03 14:10:46'),
	(2, 'Secretaria', 'api', '2024-07-17 15:33:15', '2024-07-17 15:33:15'),
	(3, 'Invitado', 'api', '2024-07-17 16:40:16', '2024-07-17 16:40:16');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.role_has_permissions: ~13 rows (approximately)
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 2),
	(8, 2),
	(9, 2),
	(10, 2),
	(11, 2),
	(12, 2),
	(13, 3),
	(14, 3),
	(15, 3),
	(16, 3),
	(17, 3);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.schools
CREATE TABLE IF NOT EXISTS `schools` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.schools: ~15 rows (approximately)
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(37, 'La Sierra', '2024-06-04 18:26:25', '2024-06-04 18:26:25'),
	(38, 'Hermanos Cavanis', '2024-06-04 18:26:37', '2024-06-04 18:26:37'),
	(39, 'Mayor San Pablo', '2024-06-04 18:26:54', '2024-06-04 18:26:54'),
	(40, 'Henry Prince', '2024-06-04 18:27:44', '2024-06-04 18:27:44'),
	(41, 'Vida Nueva', '2024-06-04 18:28:17', '2024-06-04 18:28:17'),
	(42, 'Isaac', '2024-06-07 19:33:51', '2024-06-07 19:33:51'),
	(43, 'Isabel Saavedra', '2024-06-07 19:44:46', '2024-06-07 19:44:46'),
	(44, 'monte cristo', '2024-06-07 19:52:59', '2024-06-07 19:52:59'),
	(45, 'Bilingue', '2024-06-07 19:55:00', '2024-06-07 19:55:00'),
	(46, 'britanico', '2024-06-07 19:55:55', '2024-06-07 19:55:55'),
	(47, 'aleman', '2024-06-07 19:59:27', '2024-06-07 19:59:27'),
	(48, 'Montecristo', '2024-06-07 20:01:58', '2024-06-07 20:01:58'),
	(49, 'Don Bosco', '2024-06-07 20:14:58', '2024-06-07 20:14:58'),
	(50, 'La Salle', '2024-06-07 21:06:12', '2024-06-07 21:06:12'),
	(51, 'Mateo Kuljis', '2024-06-07 21:09:04', '2024-06-07 21:09:04');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.services
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` bigint(20) unsigned DEFAULT NULL,
  `therapist_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_patient_id_foreign` (`patient_id`),
  KEY `services_therapist_id_foreign` (`therapist_id`),
  CONSTRAINT `services_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `services_therapist_id_foreign` FOREIGN KEY (`therapist_id`) REFERENCES `therapists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.services: ~1 rows (approximately)
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`id`, `uuid`, `token`, `patient_id`, `therapist_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '4e3faabe-6b62-4220-a566-8269e1858a9e', '345345345435', 72, 1, '2024-06-19 16:37:29', '2024-06-19 16:37:29', NULL);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.therapists
CREATE TABLE IF NOT EXISTS `therapists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `names` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surnames` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `user_id` bigint(20) unsigned NOT NULL,
  `profession_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ci` (`ci`),
  KEY `therapists_user_id_foreign` (`user_id`),
  KEY `therapists_profession_id_foreign` (`profession_id`),
  FULLTEXT KEY `names` (`names`),
  FULLTEXT KEY `surnames` (`surnames`),
  FULLTEXT KEY `idx_fulltext_names_surname` (`names`,`surnames`),
  FULLTEXT KEY `ci_fulltext` (`ci`),
  CONSTRAINT `therapists_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `therapists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.therapists: ~1 rows (approximately)
/*!40000 ALTER TABLE `therapists` DISABLE KEYS */;
INSERT INTO `therapists` (`id`, `names`, `surnames`, `ci`, `phone`, `address`, `status`, `user_id`, `profession_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Alejandro1', 'Olivares Moreno1', '23560781', '773698541', 'Warnes1', 1, 16, 2, '2024-06-19 13:26:38', '2024-06-19 20:18:24', NULL);
/*!40000 ALTER TABLE `therapists` ENABLE KEYS */;

-- Dumping structure for table vivir_feliz.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` tinyint(1) DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.users: ~7 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `status`, `type`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'nano', 'nano@gmail.com', '2024-05-24 12:43:19', '$2a$12$GXhnrHvi6o5htGn9gw0RC.36nOmV0o0FMqy7vabynEatuVf4El7tq', 1, 1, '1720727406.png', NULL, '2024-05-24 12:43:22', '2024-07-11 19:50:06'),
	(2, 'mono', 'mono@gmail.com', '2024-05-28 09:27:19', '$2a$12$GXhnrHvi6o5htGn9gw0RC.36nOmV0o0FMqy7vabynEatuVf4El7tq', 1, 1, NULL, NULL, '2024-05-28 09:27:22', '2024-05-28 09:27:22'),
	(3, 'fernando', 'fernando@gmail.com', '2024-05-28 09:27:34', '$2a$12$1BeUHyRRfOM6KpxxySwBrOd/RWYFfhwxy4GhJTSFMnVcq1lxa7rqS', 1, 2, NULL, NULL, '2024-05-28 09:27:36', '2024-05-28 09:27:37'),
	(16, '8963547', 'mino@gmail.com', NULL, '$2y$10$7qtzDzetBIjVa0mGUOpkY.fyChiNrvC0Y/.sG/3D7u/toQWISSOu2', 1, 2, NULL, NULL, '2024-06-07 20:14:51', '2024-06-07 20:14:51'),
	(17, '5695302', 'hugo@gmail.com', NULL, '$2y$10$cn2cvwCxG/Cq4M.5CS832OOJSV44Ua.k0OAecltb25AWyhcAvEK32', 1, 2, NULL, NULL, '2024-06-19 15:19:30', '2024-06-19 15:19:30'),
	(18, '7852369', 'jose@gmail.com', NULL, '$2y$10$A.QHpY9hvpGWq2OBsZWA2uJEHC7GqKRWelQCo8XN2e5DoIbuCE12y', 1, 2, NULL, NULL, '2024-06-19 16:20:34', '2024-06-19 16:20:34'),
	(19, '4123650', 'gaby@gmail.com', NULL, '$2y$10$VRVjFzlQtzLO/cwMriS9COaQIUbNKbBEopuawoJBQx4bNGHRUbEw2', 1, 2, NULL, NULL, '2024-06-19 16:21:47', '2024-06-19 16:21:47');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
