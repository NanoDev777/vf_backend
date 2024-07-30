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
	(1, 'Santa Cruz', '2024-05-28 13:26:18', '2024-05-28 13:26:18'),
	(2, 'La Paz', '2024-05-28 13:26:25', '2024-05-28 13:26:25');
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

-- Dumping data for table vivir_feliz.model_has_roles: ~0 rows (approximately)
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

-- Dumping data for table vivir_feliz.patients: ~66 rows (approximately)
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` (`id`, `names`, `surnames`, `birthdate`, `course`, `phone`, `email`, `status`, `school_id`, `people_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Alexandrea', 'Schaden', '2019-05-31', 15, '+1.747.826.3122', 'felipe.halvorson@example.net', 1, 49, 2, '2024-05-28 17:31:14', '2024-05-28 17:31:14', NULL),
	(2, 'Reinhold', 'Gulgowski', '1985-07-06', 6, '1-878-685-1625', 'dhand@example.com', 1, 48, 1, '2024-05-28 17:31:14', '2024-05-28 17:31:14', NULL),
	(3, 'Tyshawn', 'Weimann', '1982-11-25', 14, '(650) 622-1562', 'qfeil@example.net', 1, 47, 1, '2024-05-28 17:31:14', '2024-05-28 17:31:14', NULL),
	(4, 'Leland', 'Dach', '1998-11-24', 8, '(505) 242-2981', 'xquigley@example.net', 1, 49, 1, '2024-05-28 17:31:14', '2024-05-28 17:31:14', NULL),
	(5, 'Bernita', 'Dare', '2020-05-21', 10, '+1-248-551-9507', 'zcole@example.org', 1, 38, 1, '2024-05-28 17:31:14', '2024-05-28 17:31:14', NULL),
	(6, 'Quinten', 'Balistreri', '1970-03-27', 12, '(662) 531-4631', 'percy.durgan@example.com', 1, 45, 1, '2024-05-28 17:31:14', '2024-05-28 17:31:14', NULL),
	(7, 'Shaniya', 'Treutel', '1981-01-08', 1, '+1-682-761-1850', 'eda.witting@example.org', 1, 49, 2, '2024-05-28 17:31:14', '2024-05-28 17:31:14', NULL),
	(8, 'Sabina', 'Walsh', '1973-02-03', 12, '317-553-6559', 'christelle30@example.com', 1, 43, 1, '2024-05-28 17:31:14', '2024-05-28 17:31:14', NULL),
	(9, 'Clinton', 'Simonis', '1987-01-19', 12, '+12815481300', 'emedhurst@example.com', 1, 48, 1, '2024-05-28 17:31:14', '2024-05-28 17:31:14', NULL),
	(10, 'Malvina', 'Larson', '1973-11-11', 9, '+1-937-634-6880', 'ihaag@example.org', 1, 50, 2, '2024-05-28 17:31:46', '2024-05-28 17:31:46', NULL),
	(11, 'Zella', 'Hartmann', '2007-07-28', 9, '+1-747-657-8788', 'adeline.swaniawski@example.com', 1, 46, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(12, 'Mae', 'Zboncak', '2019-02-15', 4, '279-926-9961', 'hand.janelle@example.net', 1, 47, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(13, 'Fatima', 'Corkery', '1977-04-18', 5, '775.626.4539', 'elmo.bednar@example.com', 1, 49, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(14, 'Arch', 'Hills', '2017-07-01', 15, '516-721-0531', 'kshlerin.arely@example.net', 1, 45, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(15, 'Kendrick', 'Grady', '1991-04-26', 11, '(984) 862-1793', 'carter.allison@example.net', 1, 46, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(16, 'Georgiana', 'Ernser', '2014-04-30', 12, '1-530-581-6597', 'apouros@example.net', 1, 43, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(17, 'Nayeli', 'Williamson', '1984-10-13', 13, '+1.283.319.6186', 'sgulgowski@example.org', 1, 47, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(18, 'Alexzander', 'Christiansen', '1993-02-11', 12, '(626) 812-1956', 'lblanda@example.org', 1, 49, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(19, 'Janick', 'Bailey', '1993-10-12', 5, '+1.605.223.2178', 'greenfelder.megane@example.org', 1, 37, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(20, 'Yasmeen', 'Parker', '1982-05-20', 3, '1-574-328-5100', 'alize.okeefe@example.net', 1, 40, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(21, 'Karley', 'Wintheiser', '2019-01-08', 2, '+1-551-741-3640', 'lauryn40@example.net', 1, 48, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(22, 'Brennon', 'Davis', '1978-11-15', 13, '+1-912-609-2944', 'jarret.bayer@example.com', 1, 45, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(23, 'Aric', 'Rice', '2014-04-03', 13, '(986) 447-1129', 'taufderhar@example.org', 1, 46, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(24, 'Edison', 'Prosacco', '2018-01-30', 9, '337.233.8140', 'gbreitenberg@example.net', 1, 41, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(25, 'Makayla', 'Johnston', '2013-09-27', 9, '1-567-489-3911', 'ramon42@example.com', 1, 46, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(26, 'Ebony', 'Stamm', '2015-05-02', 1, '+1-380-206-8740', 'paucek.lawrence@example.org', 1, 41, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(27, 'Cora', 'Borer', '2019-09-28', 7, '678-643-9219', 'leola13@example.org', 1, 46, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(28, 'Susana', 'Kuphal', '1983-08-23', 4, '+1.954.914.1612', 'cheyanne04@example.net', 1, 48, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(29, 'Roxanne', 'Swift', '2006-02-19', 13, '+1-442-859-3195', 'jessie.krajcik@example.com', 1, 42, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(30, 'Gladyce', 'Murazik', '2010-05-20', 5, '+1-917-382-6102', 'kacie54@example.com', 1, 41, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(31, 'Lila', 'Durgan', '1996-09-03', 2, '214.598.4144', 'israel.white@example.com', 1, 40, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(32, 'Price', 'Kuhic', '1987-02-28', 8, '+1-586-338-4716', 'lenore.turcotte@example.org', 1, 51, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(33, 'Sydnie', 'Hill', '2008-07-04', 6, '+1.708.519.6237', 'wmorar@example.com', 1, 46, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(34, 'Leonardo', 'Leuschke', '1981-05-31', 3, '540-202-1774', 'murray79@example.com', 1, 49, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(35, 'Jerald', 'Osinski', '1995-12-09', 12, '662-775-6645', 'samantha65@example.org', 1, 46, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(36, 'Valentina', 'Marquardt', '1973-05-03', 5, '+1-351-954-3404', 'vfahey@example.net', 1, 50, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(37, 'Pierce', 'Fisher', '2014-08-28', 6, '+1-906-736-7311', 'ralph.flatley@example.net', 1, 37, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(38, 'Linda', 'Barton', '1971-08-23', 13, '847-839-5495', 'dickens.freda@example.com', 1, 46, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(39, 'Kelton', 'Wisozk', '1981-05-24', 2, '+1-731-240-9766', 'lakin.roxane@example.com', 1, 50, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(40, 'Santos', 'Walsh', '2023-07-02', 14, '1-979-629-0583', 'juwan.roob@example.org', 1, 41, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(41, 'Mathew', 'Hodkiewicz', '1971-12-14', 3, '+14058031786', 'mclaughlin.ulices@example.com', 1, 50, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(42, 'Brant', 'Tromp', '2002-01-30', 2, '804.917.9423', 'whammes@example.com', 1, 49, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(43, 'Billy', 'Barton', '2022-12-10', 1, '+1-754-650-8024', 'kadin.rogahn@example.net', 1, 43, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(44, 'Mac', 'Pollich', '2024-05-21', 13, '213-271-1228', 'kiel63@example.com', 1, 42, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(45, 'Brice', 'Huels', '1971-09-10', 2, '386-321-5514', 'merl.thompson@example.com', 1, 49, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(46, 'Sydney', 'Shanahan', '2010-12-13', 14, '+14635790020', 'cole.derrick@example.net', 1, 45, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(47, 'Astrid', 'Altenwerth', '2005-03-20', 3, '+19723194957', 'bbartell@example.net', 1, 40, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(48, 'Rod', 'Schmidt', '1975-10-21', 5, '1-850-680-8517', 'hammes.malachi@example.com', 1, 46, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(49, 'Hellen', 'Marvin', '1991-06-19', 1, '912-618-7521', 'destinee.labadie@example.com', 1, 45, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(50, 'Krystina', 'Greenfelder', '2018-08-22', 4, '1-620-908-8016', 'jacobs.karli@example.com', 1, 40, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(51, 'Stefanie', 'Brekke', '1979-01-07', 1, '1-984-596-7009', 'vallie43@example.com', 1, 49, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(52, 'Elijah', 'Haley', '1972-05-30', 6, '+1 (678) 356-8692', 'feeney.luciano@example.com', 1, 49, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(53, 'Eveline', 'Turner', '1974-12-20', 12, '+1-203-724-0921', 'grady92@example.com', 1, 49, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(54, 'Davin', 'Monahan', '1982-06-17', 12, '484-934-8658', 'pbergnaum@example.com', 1, 46, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(55, 'Reanna', 'Brown', '2020-07-20', 7, '1-860-936-4776', 'cathy.metz@example.com', 1, 40, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(56, 'Claudine', 'Deckow', '2003-07-24', 1, '774-890-0588', 'bogisich.alvena@example.org', 1, 40, 1, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(57, 'Clarabelle', 'Larson', '2024-05-18', 11, '402-567-5043', 'crist.arlie@example.org', 1, 43, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(58, 'Antonetta', 'Aufderhar', '1972-09-21', 8, '+1.925.871.0029', 'kreiger.mathias@example.org', 1, 43, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(59, 'Lavern', 'Kozey', '1984-12-01', 6, '(631) 924-8505', 'fharvey@example.com', 1, 38, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(60, 'Tierra', 'Schmeler', '2010-01-31', 5, '424-424-6100', 'belle.price@example.com', 1, 38, 2, '2024-05-28 17:32:19', '2024-05-28 17:32:19', NULL),
	(61, 'Antony', 'Morales', '2024-05-31', 7, '+59168774551', 'antony@gmail.com', 1, 46, 2, '2024-05-31 14:20:35', '2024-05-31 14:20:37', NULL),
	(67, 'Fernando', 'Cruz', '2024-05-27', 2, '68774551', 'nano@gmail.com', 1, 41, 2, '2024-06-05 22:25:31', '2024-06-05 22:25:31', NULL),
	(68, 'Gabriel1', 'Borja Inturias1', '2010-03-06', 4, '789561581', 'gabriel1@gmail.com1', 1, 41, 1, '2024-06-07 23:34:03', '2024-06-20 01:17:00', '2024-06-20 01:17:00'),
	(69, 'Fabian', 'Banegas Sanches', '2004-12-09', 13, '77365897', 'fabi@gmail.com', 1, 41, 1, '2024-06-08 00:13:41', '2024-06-20 01:16:53', '2024-06-20 01:16:53'),
	(70, 'Hector', 'Banegas', '2018-11-03', 15, '77896345', 'hector@gmail.com', 1, 49, 12, '2024-06-08 00:15:02', '2024-06-12 21:37:18', '2024-06-12 21:37:18'),
	(71, 'Katherine', 'Toledo', '2024-06-06', 15, '78958742', 'ktv@gmail.com', 1, 49, 1, '2024-06-10 20:14:38', '2024-06-12 21:37:18', '2024-06-12 21:37:18'),
	(72, 'Carla', 'Banegas', '2024-06-19', 14, '3987456', 'carla@gmail.com', 1, 38, 14, '2024-06-19 20:22:27', '2024-06-19 20:22:42', NULL);
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
	(1, 'Jorge', 'Banegas', '8914345', 'nano@gmail.com', '72115369', 'La Guardia', 1, 1, 1, '2024-05-28 13:28:03', '2024-05-28 13:28:03', NULL),
	(2, 'Carlos', 'Morales', '7707814', 'carlos@gmail.com', '68945278', 'La Villa', 1, 2, 1, '2024-05-28 13:28:32', '2024-05-28 13:28:32', NULL),
	(12, 'Freddy Gabriel', 'Banegas Montaño', '8963547', 'mino@gmail.com', '72115478', 'Barrio 8 de diciembre', 1, 16, 1, '2024-06-08 00:14:51', '2024-06-08 00:14:51', NULL),
	(13, 'Hugo', 'Vam Damme', '5695302', 'hugo@gmail.com', '3546298', 'Barrio 8 de Diciembre', 1, 17, 2, '2024-06-19 19:19:30', '2024-06-19 20:19:44', NULL),
	(14, 'Jose', 'Saravia Mendoza', '7852369', 'jose@gmail.com', '77065789', 'California', 1, 18, 2, '2024-06-19 20:20:34', '2024-06-19 20:20:42', NULL),
	(15, 'Gabriela', 'Medeiros', '4123650', 'gaby@gmail.com', '36987454', 'Kilometro 9', 1, 19, 2, '2024-06-19 20:21:47', '2024-06-19 20:21:47', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.permissions: ~43 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Dashboard.index', 'api', '2024-07-17 19:13:50', '2024-07-17 19:13:50'),
	(2, 'Home.index', 'api', '2024-07-17 19:14:08', '2024-07-17 19:14:08'),
	(3, 'Patients.index', 'api', '2024-07-17 19:14:52', '2024-07-17 19:14:53'),
	(4, 'Patients.detail', 'api', '2024-07-17 19:15:08', '2024-07-17 19:15:09'),
	(5, 'Patients.store', 'api', '2024-07-17 19:15:41', '2024-07-17 19:15:43'),
	(6, 'Patients.update', 'api', '2024-07-17 19:15:54', '2024-07-17 19:15:54'),
	(7, 'Patients.delete', 'api', '2024-07-17 19:16:46', '2024-07-17 19:16:46'),
	(8, 'People.index', 'api', '2024-07-17 19:17:01', '2024-07-17 19:17:02'),
	(9, 'People.detail', 'api', '2024-07-17 19:17:28', '2024-07-17 19:17:28'),
	(10, 'People.store', 'api', '2024-07-17 19:17:47', '2024-07-17 19:17:47'),
	(11, 'People.update', 'api', '2024-07-17 19:19:49', '2024-07-17 19:19:49'),
	(12, 'People.delete', 'api', '2024-07-17 19:20:04', '2024-07-17 19:20:04'),
	(13, 'Therapists.index', 'api', '2024-07-17 20:38:36', '2024-07-17 20:38:37'),
	(14, 'Therapists.detail', 'api', '2024-07-19 19:42:50', '2024-07-19 19:42:51'),
	(15, 'Therapists.store', 'api', '2024-07-19 20:35:14', '2024-07-19 20:35:15'),
	(16, 'Therapists.update', 'api', '2024-07-22 21:55:46', '2024-07-22 21:55:46'),
	(17, 'Therapists.delete', 'api', '2024-07-22 21:56:28', '2024-07-22 21:56:28'),
	(18, 'Queries.index', 'api', '2024-07-24 18:36:01', '2024-07-24 18:36:01'),
	(19, 'Queries.detail', 'api', '2024-07-24 18:37:18', '2024-07-24 18:37:18'),
	(20, 'Queries.store', 'api', '2024-07-24 18:38:20', '2024-07-24 18:38:20'),
	(21, 'Queries.update', 'api', '2024-07-24 18:38:31', '2024-07-24 18:38:32'),
	(22, 'Queries.delete', 'api', '2024-07-24 18:38:41', '2024-07-24 18:38:41'),
	(23, 'Treatments.index', 'api', '2024-07-24 18:45:22', '2024-07-24 18:45:23'),
	(24, 'Treatments.detail', 'api', '2024-07-24 18:45:35', '2024-07-24 18:45:35'),
	(25, 'Treatments.store', 'api', '2024-07-24 18:46:01', '2024-07-24 18:46:02'),
	(26, 'Treatments.update', 'api', '2024-07-24 18:46:27', '2024-07-24 18:46:27'),
	(27, 'Treatments.delete', 'api', '2024-07-24 19:35:54', '2024-07-24 19:35:54'),
	(28, 'Profile.index', 'api', '2024-07-24 19:36:24', '2024-07-24 19:36:25'),
	(29, 'MyPatients.index', 'api', '2024-07-24 19:38:32', '2024-07-24 19:38:32'),
	(30, 'MyPatients.detail', 'api', '2024-07-24 19:39:25', '2024-07-24 19:39:25'),
	(31, 'MyPatients.store', 'api', '2024-07-24 19:40:12', '2024-07-24 19:40:12'),
	(32, 'MyPatients.update', 'api', '2024-07-24 19:40:24', '2024-07-24 19:40:24'),
	(33, 'MyPatients.delete', 'api', '2024-07-24 19:40:37', '2024-07-24 19:40:37'),
	(34, 'MyQueries.index', 'api', '2024-07-24 19:41:45', '2024-07-24 19:41:45'),
	(35, 'MyQueries.detail', 'api', '2024-07-24 19:42:02', '2024-07-24 19:42:02'),
	(36, 'MyQueries.store', 'api', '2024-07-24 19:56:42', '2024-07-24 19:56:42'),
	(37, 'MyQueries.delete', 'api', '2024-07-24 19:56:52', '2024-07-24 19:56:52'),
	(38, 'MyQueries.update', 'api', '2024-07-24 19:57:06', '2024-07-24 19:57:06'),
	(39, 'MyTreatments.index', 'api', '2024-07-24 19:58:10', '2024-07-24 19:58:10'),
	(40, 'MyTreatments.detail', 'api', '2024-07-24 19:58:25', '2024-07-24 19:58:26'),
	(41, 'MyTreatments.store', 'api', '2024-07-24 19:58:36', '2024-07-24 19:58:36'),
	(42, 'MyTreatments.update', 'api', '2024-07-24 19:58:47', '2024-07-24 19:58:47'),
	(43, 'MyTreatments.delete', 'api', '2024-07-24 19:59:23', '2024-07-24 19:59:23');
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
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vivir_feliz.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(147, 'App\\Models\\User', 2, 'auth_token', 'cd7bafc8aa5693253e55cc2486e94a1d1c684f61c093654516660eb0e337b2ba', '["*"]', NULL, NULL, '2024-07-27 02:01:12', '2024-07-27 02:01:12');
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
	(1, 'Psicologo', NULL, '2024-06-19 17:25:30', '2024-06-19 17:25:31'),
	(2, 'Pedagogo', NULL, '2024-06-19 17:25:59', '2024-06-19 17:26:00');
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

-- Dumping data for table vivir_feliz.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', 'api', '2024-07-03 18:10:46', '2024-07-03 18:10:46'),
	(2, 'Secretaria', 'api', '2024-07-17 19:33:15', '2024-07-17 19:33:15'),
	(3, 'Invitado', 'api', '2024-07-17 20:40:16', '2024-07-17 20:40:16');
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

-- Dumping data for table vivir_feliz.role_has_permissions: ~16 rows (approximately)
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(2, 3),
	(28, 3),
	(29, 3),
	(30, 3),
	(31, 3),
	(32, 3),
	(33, 3),
	(34, 3),
	(35, 3),
	(36, 3),
	(37, 3),
	(38, 3),
	(39, 3),
	(40, 3),
	(41, 3),
	(42, 3),
	(43, 3);
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

-- Dumping data for table vivir_feliz.schools: ~14 rows (approximately)
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(37, 'La Sierra', '2024-06-04 22:26:25', '2024-06-04 22:26:25'),
	(38, 'Hermanos Cavanis', '2024-06-04 22:26:37', '2024-06-04 22:26:37'),
	(39, 'Mayor San Pablo', '2024-06-04 22:26:54', '2024-06-04 22:26:54'),
	(40, 'Henry Prince', '2024-06-04 22:27:44', '2024-06-04 22:27:44'),
	(41, 'Vida Nueva', '2024-06-04 22:28:17', '2024-06-04 22:28:17'),
	(42, 'Isaac', '2024-06-07 23:33:51', '2024-06-07 23:33:51'),
	(43, 'Isabel Saavedra', '2024-06-07 23:44:46', '2024-06-07 23:44:46'),
	(44, 'monte cristo', '2024-06-07 23:52:59', '2024-06-07 23:52:59'),
	(45, 'Bilingue', '2024-06-07 23:55:00', '2024-06-07 23:55:00'),
	(46, 'britanico', '2024-06-07 23:55:55', '2024-06-07 23:55:55'),
	(47, 'aleman', '2024-06-07 23:59:27', '2024-06-07 23:59:27'),
	(48, 'Montecristo', '2024-06-08 00:01:58', '2024-06-08 00:01:58'),
	(49, 'Don Bosco', '2024-06-08 00:14:58', '2024-06-08 00:14:58'),
	(50, 'La Salle', '2024-06-08 01:06:12', '2024-06-08 01:06:12'),
	(51, 'Mateo Kuljis', '2024-06-08 01:09:04', '2024-06-08 01:09:04');
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

-- Dumping data for table vivir_feliz.services: ~0 rows (approximately)
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`id`, `uuid`, `token`, `patient_id`, `therapist_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '4e3faabe-6b62-4220-a566-8269e1858a9e', '345345345435', 72, 1, '2024-06-19 20:37:29', '2024-06-19 20:37:29', NULL);
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
	(1, 'Alejandro1', 'Olivares Moreno1', '23560781', '773698541', 'Warnes1', 1, 16, 2, '2024-06-19 17:26:38', '2024-06-20 00:18:24', NULL);
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
	(1, 'nano', 'nano@gmail.com', '2024-05-24 16:43:19', '$2a$12$GXhnrHvi6o5htGn9gw0RC.36nOmV0o0FMqy7vabynEatuVf4El7tq', 1, 1, '1720727406.png', NULL, '2024-05-24 16:43:22', '2024-07-11 23:50:06'),
	(2, 'mono', 'mono@gmail.com', '2024-05-28 13:27:19', '$2a$12$GXhnrHvi6o5htGn9gw0RC.36nOmV0o0FMqy7vabynEatuVf4El7tq', 1, 1, '1721853694.png', NULL, '2024-05-28 13:27:22', '2024-07-25 00:41:34'),
	(3, 'fernando', 'fernando@gmail.com', '2024-05-28 13:27:34', '$2a$12$1BeUHyRRfOM6KpxxySwBrOd/RWYFfhwxy4GhJTSFMnVcq1lxa7rqS', 1, 2, NULL, NULL, '2024-05-28 13:27:36', '2024-05-28 13:27:37'),
	(16, '8963547', 'mino@gmail.com', NULL, '$2y$10$7qtzDzetBIjVa0mGUOpkY.fyChiNrvC0Y/.sG/3D7u/toQWISSOu2', 1, 2, NULL, NULL, '2024-06-08 00:14:51', '2024-06-08 00:14:51'),
	(17, '5695302', 'hugo@gmail.com', NULL, '$2y$10$cn2cvwCxG/Cq4M.5CS832OOJSV44Ua.k0OAecltb25AWyhcAvEK32', 1, 2, NULL, NULL, '2024-06-19 19:19:30', '2024-06-19 19:19:30'),
	(18, '7852369', 'jose@gmail.com', NULL, '$2y$10$A.QHpY9hvpGWq2OBsZWA2uJEHC7GqKRWelQCo8XN2e5DoIbuCE12y', 1, 2, NULL, NULL, '2024-06-19 20:20:34', '2024-06-19 20:20:34'),
	(19, '4123650', 'gaby@gmail.com', NULL, '$2y$10$VRVjFzlQtzLO/cwMriS9COaQIUbNKbBEopuawoJBQx4bNGHRUbEw2', 1, 2, NULL, NULL, '2024-06-19 20:21:47', '2024-06-19 20:21:47');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
