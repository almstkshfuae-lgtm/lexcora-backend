-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: lexcora.c1yc80s4ipxt.us-east-2.rds.amazonaws.com
-- Generation Time: 06 Ù†ÙˆÙÙ…Ø¨Ø± 2025 Ø§Ù„Ø³Ø§Ø¹Ø© 09:08
-- Ø¥ØµØ¯Ø§Ø± Ø§Ù„Ø®Ø§Ø¯Ù…: 8.0.42
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lexcora`
--

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `annual_leaves`
--

CREATE TABLE `annual_leaves` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `total_days` int NOT NULL,
  `remaining_days` int DEFAULT '0',
  `leave_type` enum('paid','unpaid') NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `appeals_cassations`
--

CREATE TABLE `appeals_cassations` (
  `id` int NOT NULL,
  `session_id` int NOT NULL,
  `legal_period_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `app_notifications`
--

CREATE TABLE `app_notifications` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('info','warning','success','error','system') DEFAULT 'info',
  `recipient_id` int DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `related_type` enum('task','client request','employee','event','none','memo') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'none',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `assets`
--

CREATE TABLE `assets` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `branch_id` int NOT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `serial_number` varchar(150) DEFAULT NULL,
  `physical_location` varchar(255) DEFAULT NULL,
  `custodian_id` int DEFAULT NULL,
  `budget_id` int DEFAULT NULL,
  `purchase_cost` decimal(15,2) DEFAULT '0.00',
  `purchase_date` date DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `depreciation_rate` decimal(5,2) DEFAULT '0.00',
  `salvage_value` decimal(15,2) DEFAULT '0.00',
  `current_value` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `record_type` varchar(40) NOT NULL DEFAULT 'resource',
  `created_by` int DEFAULT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `assets`
--

INSERT INTO `assets` (`id`, `name`, `type`, `branch_id`, `issue_date`, `expiry_date`, `created_at`, `record_type`, `created_by`, `note`) VALUES
(3, 'dubai T 65433', 'Ù…Ù„ÙƒÙŠØ© Ù…Ø±ÙƒØ¨Ø©', 2, '2025-10-01', '2025-10-29', '2025-10-13 04:36:58', 'resource', NULL, NULL),
(4, 'Ø±Ø®ØµØ© Ø¯Ø¨ÙŠ', 'Ø±Ø®ØµØ© ', 2, '2025-10-02', '2026-01-15', '2025-10-13 07:38:14', 'office', 90, 'Ø±Ø®ØµØ© Ø¯Ø¨ÙŠ 1376543'),
(7, 'Ø±Ø®ØµØ© Ø¹Ø¬Ù…Ø§Ù†', 'Ø±Ø®ØµØ© ØªØ¬Ø§Ø±ÙŠØ©', 3, '2025-10-07', '2025-10-23', '2025-10-13 08:38:17', 'office', 90, NULL);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `asset_documents`
--

CREATE TABLE `asset_documents` (
  `id` int NOT NULL,
  `asset_id` int NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `document_url` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int NOT NULL,
  `bank_name` varchar(150) NOT NULL,
  `account_name` varchar(150) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `iban` varchar(100) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `current_balance` decimal(18,2) DEFAULT '0.00',
  `status` enum('active','inactive') DEFAULT 'active',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `bank_name`, `account_name`, `account_number`, `iban`, `branch_id`, `current_balance`, `status`, `created_by`, `created_at`) VALUES
(1, 'ADIB', 'Ø¨Ù†Ùƒ Ø£Ø¨ÙˆØ¸Ø¨ÙŠ Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠ', '14727007', '14727007', 2, '13099.15', 'active', NULL, '2025-10-16 10:44:47'),
(2, 'ENBD', 'Ø¨Ù†Ùƒ Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª Ø¯Ø¨ÙŠ Ø§Ù„ÙˆØ·Ù†ÙŠ', '1014889400501', '1014889400501', 3, '169512.66', 'active', NULL, '2025-10-16 10:46:30');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `branches`
--

CREATE TABLE `branches` (
  `id` int NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `branches`
--

INSERT INTO `branches` (`id`, `name_ar`, `name_en`, `location`, `created_at`) VALUES
(1, 'ÙØ±Ø¹ Ø§Ø¨ÙˆØ¸Ø¨ÙŠ', 'Abu Dhabi Branch', NULL, '2025-09-18 06:14:33'),
(2, 'ÙØ±Ø¹ Ø¯Ø¨ÙŠ', 'Dubai Branch', NULL, '2025-09-18 06:14:33'),
(3, 'ÙØ±Ø¹ Ø¹Ø¬Ù…Ø§Ù†', 'Ajman Branch', 'Ø¹Ø¬Ù…Ø§Ù† - Ø§Ù„Ø¬Ø±Ù - Ø´Ø§Ø±Ø¹ Ø§Ù„Ø´ÙŠØ® Ø²Ø§ÙŠØ¯', '2025-09-18 06:14:33'),
(6, 'Ø§Ù„Ø´Ø§Ø±Ù‚Ø©', 'Sharjah', 'Ø§Ù„Ù…Ø¬Ø§Ø²', '2025-10-29 23:22:36');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `call_logs`
--

CREATE TABLE `call_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `call_type` enum('outgoing','incoming') NOT NULL,
  `caller_name` varchar(150) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `call_date` date NOT NULL,
  `call_time` time NOT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `details` text,
  `duration_minutes` int DEFAULT '0',
  `file_case_number` varchar(100) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `cases`
--

CREATE TABLE `cases` (
  `id` int NOT NULL,
  `file_number` varchar(50) NOT NULL,
  `case_number` varchar(100) DEFAULT NULL,
  `police_station_id` int DEFAULT NULL,
  `public_prosecution_id` int DEFAULT NULL,
  `court_id` int DEFAULT NULL,
  `lawyer_id` int DEFAULT NULL,
  `secretary_id` int DEFAULT NULL,
  `case_classification_id` int DEFAULT NULL,
  `counter_case_id` int DEFAULT NULL,
  `case_type_id` int DEFAULT NULL,
  `legal_advisor_id` int DEFAULT NULL,
  `legal_researcher_id` int DEFAULT NULL,
  `fees` decimal(10,2) DEFAULT '0.00',
  `counterclaim_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `additional_note` text,
  `topic` varchar(255) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `is_important` tinyint(1) DEFAULT '0',
  `is_secret` tinyint(1) DEFAULT '0',
  `is_archived` tinyint(1) DEFAULT '0',
  `is_pending` tinyint(1) DEFAULT '0',
  `status` enum('active','inactive','pending') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `cases`
--

INSERT INTO `cases` (`id`, `file_number`, `case_number`, `police_station_id`, `public_prosecution_id`, `court_id`, `lawyer_id`, `secretary_id`, `case_classification_id`, `counter_case_id`, `case_type_id`, `legal_advisor_id`, `legal_researcher_id`, `fees`, `counterclaim_id`, `start_date`, `additional_note`, `topic`, `branch_id`, `is_important`, `is_secret`, `is_archived`, `is_pending`, `status`, `created_at`) VALUES
(139, '20251005192707', 'test123', 3, 3, 2, 80, 92, 2, NULL, 2, 102, 94, '120000.00', NULL, '2025-10-05', 'test', 'Ù…Ø´Ø§Ø¬Ø±Ø©', 2, 1, 1, 1, 0, 'active', '2025-10-05 15:27:07'),
(142, '20251013104136', '8765432', 3, 2, 1, 80, 92, 2, NULL, 2, 95, 94, '1000.00', NULL, '2025-09-29', '', 'Ø´ÙŠÙƒ Ù…Ø³ØªØ­Ù‚ ', 3, 0, 0, 0, 0, 'active', '2025-10-13 10:41:36'),
(143, '20251015154917', '2025', 25, 2, 1, 103, 104, 2, NULL, 1, 102, 105, '12000.00', NULL, '2025-10-15', 'Ø§Ø¹Ø¯Ø§Ø¯ Ù„Ø§Ø¦Ø­Ø© Ø¯Ø¹ÙˆÙ‰ ', 'Ù…Ø·Ø§Ù„Ø¨Ø© Ù…Ø¯Ù†ÙŠØ© 50 Ø£Ù„Ù', 3, 0, 0, 0, 0, 'active', '2025-10-15 15:49:17'),
(144, '20251017063654', '370553', 3, 1, 1, 103, 104, 2, NULL, 2, 102, 105, '12000.00', NULL, '2025-10-20', '', 'Ù…Ø·Ø§Ù„Ø¨Ø© Ù…Ø§Ù„ÙŠØ© ', 3, 0, 1, 0, 1, 'active', '2025-10-17 06:36:54'),
(147, '20251027073855', '876', 3, 2, 1, 80, 104, 2, NULL, 1, 95, 105, '6000.00', NULL, '2025-10-26', NULL, 'Ø±Ø£ÙŠ Ø¹Ø§Ù…', 1, 0, 0, 0, 0, 'active', '2025-10-27 07:38:55'),
(148, '20251027073904', '876', 3, 2, 1, 80, 104, 2, NULL, 1, 95, 105, '6000.00', NULL, '2025-10-26', NULL, 'Ø±Ø£ÙŠ Ø¹Ø§Ù…', 1, 0, 0, 0, 0, 'active', '2025-10-27 07:39:04'),
(149, '20251027073945', '876', 3, 2, 1, 80, 104, 2, NULL, 1, 95, 105, '6000.00', NULL, '2025-10-26', 'hahahah', 'Ø±Ø£ÙŠ Ø¹Ø§Ù…', 1, 0, 0, 0, 0, 'active', '2025-10-27 07:39:45'),
(156, '20251029171625', NULL, NULL, NULL, NULL, 73, 76, 2, NULL, 2, 95, 94, '0.00', NULL, '2025-10-29', NULL, NULL, 2, 0, 0, 0, 0, 'active', '2025-10-29 13:16:25'),
(157, '20251029171908', NULL, 3, 3, 2, 80, 92, 1, NULL, 2, 102, 94, '0.00', NULL, '2025-10-29', NULL, NULL, 3, 0, 0, 0, 0, 'active', '2025-10-29 13:19:08'),
(158, '20251030104824', '123456789999', 1, 2, 1, 96, 113, 1, NULL, 2, 102, 105, '1200000.00', NULL, '2025-10-30', '', '', 6, 0, 0, 0, 0, 'active', '2025-10-30 10:48:24'),
(159, '20251101062636', '1904', NULL, NULL, NULL, 73, 104, 2, NULL, 2, 102, 105, '10000.00', NULL, '2025-11-01', 'ØªÙ‚Ø¯ÙŠÙ… Ù…Ø°ÙƒØ±Ø© Ø¯ÙØ§Ø¹ ', 'Ù‚Ø¶ÙŠÙ‡ Ø¬Ø²Ø§Ø¦ÙŠØ© - Ø§Ù‡Ù…Ø§Ù„ Ø§Ù… ', 3, 0, 0, 0, 0, 'active', '2025-11-01 06:26:36'),
(160, '20251101144357', '1150', NULL, NULL, NULL, 73, 104, 2, NULL, 1, 102, 105, '0.00', NULL, '2025-11-01', NULL, 'ÙØ³Ø® Ø´Ø±Ø§ÙƒØ©', 3, 0, 0, 0, 0, 'active', '2025-11-01 14:43:57');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_classifications`
--

CREATE TABLE `case_classifications` (
  `id` int NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_classifications`
--

INSERT INTO `case_classifications` (`id`, `name_ar`, `name_en`, `created_at`) VALUES
(1, 'Ø´Ø±ÙƒØ©', 'Company', '2025-09-18 06:16:57'),
(2, 'ÙØ±Ø¯', 'Individual', '2025-09-18 06:16:57');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_degrees`
--

CREATE TABLE `case_degrees` (
  `id` int NOT NULL,
  `case_id` int NOT NULL,
  `degree` enum('first_instance','appeal','cassation') NOT NULL DEFAULT 'first_instance',
  `case_number` varchar(20) NOT NULL,
  `year` varchar(13) NOT NULL,
  `referral_date` datetime NOT NULL,
  `client_status` varchar(255) DEFAULT NULL,
  `opponent_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_degrees`
--

INSERT INTO `case_degrees` (`id`, `case_id`, `degree`, `case_number`, `year`, `referral_date`, `client_status`, `opponent_status`, `created_at`, `updated_at`) VALUES
(45, 139, 'first_instance', '212111', '2025', '2025-10-05 00:00:00', NULL, NULL, '2025-10-05 15:27:08', '2025-10-05 15:27:08'),
(47, 142, 'first_instance', '123456', '2025', '2025-10-01 00:00:00', NULL, NULL, '2025-10-13 10:41:38', '2025-10-13 10:41:38'),
(50, 144, 'first_instance', '3705', '2025', '2025-10-21 00:00:00', NULL, NULL, '2025-10-17 06:36:56', '2025-10-17 06:36:56'),
(53, 147, 'appeal', '677', '2025', '2025-10-27 00:00:00', NULL, NULL, '2025-10-27 07:38:56', '2025-10-27 07:38:56'),
(54, 148, 'appeal', '677', '2025', '2025-10-27 00:00:00', NULL, NULL, '2025-10-27 07:39:05', '2025-10-27 07:39:05'),
(55, 149, 'appeal', '677', '2025', '2025-10-27 00:00:00', NULL, NULL, '2025-10-27 07:39:46', '2025-10-27 07:39:46'),
(60, 156, 'appeal', '2020', '2020', '2025-10-28 00:00:00', NULL, NULL, '2025-10-29 13:16:27', '2025-10-29 13:16:27'),
(61, 157, 'cassation', 'Test2', '6666', '2025-10-13 00:00:00', 'hgfdsa', 'htgfdsa', '2025-10-29 13:19:10', '2025-10-29 13:19:10'),
(64, 159, 'first_instance', '1904', '2025', '2025-10-31 00:00:00', NULL, NULL, '2025-11-01 06:26:37', '2025-11-01 06:26:37'),
(65, 160, 'first_instance', '1350', '2025', '2025-10-31 00:00:00', 'Ù…Ø¯Ø¹ÙŠ', 'Ù…Ø¯Ø¹Ù‰ Ø¹Ù„ÙŠÙ‡', '2025-11-01 14:44:00', '2025-11-01 14:44:00');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_documents`
--

CREATE TABLE `case_documents` (
  `id` int NOT NULL,
  `case_id` int NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `document_url` varchar(2055) NOT NULL,
  `uploaded_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_employees_documents`
--

CREATE TABLE `case_employees_documents` (
  `id` int NOT NULL,
  `document_name` varchar(1055) NOT NULL,
  `document_url` varchar(2055) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `case_id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `created at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uploaded_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_parties`
--

CREATE TABLE `case_parties` (
  `id` int NOT NULL,
  `case_id` int NOT NULL,
  `party_id` int DEFAULT NULL,
  `type` enum('client','opponent') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'client',
  `employee_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_parties`
--

INSERT INTO `case_parties` (`id`, `case_id`, `party_id`, `type`, `employee_id`, `created_at`) VALUES
(70, 139, 17, 'opponent', NULL, '2025-10-05 15:27:07'),
(73, 139, 16, 'client', NULL, '2025-10-05 18:52:32'),
(78, 142, 52, 'client', NULL, '2025-10-13 10:41:37'),
(79, 142, 53, 'opponent', NULL, '2025-10-13 10:41:37'),
(80, 143, NULL, 'client', NULL, '2025-10-15 15:49:18'),
(81, 144, NULL, 'client', NULL, '2025-10-17 06:36:55'),
(82, 144, 53, 'opponent', NULL, '2025-10-17 06:36:55'),
(85, 147, 57, 'client', NULL, '2025-10-27 07:38:55'),
(86, 147, 53, 'opponent', NULL, '2025-10-27 07:38:56'),
(87, 148, 57, 'client', NULL, '2025-10-27 07:39:04'),
(88, 148, 53, 'opponent', NULL, '2025-10-27 07:39:05'),
(89, 149, 57, 'client', NULL, '2025-10-27 07:39:45'),
(90, 149, 53, 'opponent', NULL, '2025-10-27 07:39:46'),
(97, 156, 22, 'opponent', NULL, '2025-10-29 13:16:26'),
(98, 157, 20, 'client', NULL, '2025-10-29 13:19:09'),
(99, 157, 52, 'client', NULL, '2025-10-30 05:46:12'),
(100, 158, 20, 'client', NULL, '2025-10-30 10:48:24'),
(101, 158, 75, 'opponent', NULL, '2025-10-30 10:48:24'),
(102, 159, 76, 'opponent', NULL, '2025-11-01 06:26:37'),
(103, 159, 77, 'client', NULL, '2025-11-01 06:26:37'),
(104, 160, 78, 'client', NULL, '2025-11-01 14:43:59'),
(105, 160, 79, 'opponent', NULL, '2025-11-01 14:43:59');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_parties_documents`
--

CREATE TABLE `case_parties_documents` (
  `id` int NOT NULL,
  `case_id` int NOT NULL,
  `party_id` int DEFAULT NULL,
  `document_name` varchar(2055) NOT NULL,
  `document_url` varchar(2055) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uploaded_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_petitions`
--

CREATE TABLE `case_petitions` (
  `id` int NOT NULL,
  `case_id` int NOT NULL,
  `date` date NOT NULL,
  `type` varchar(200) NOT NULL,
  `appeal_date` date NOT NULL,
  `decision` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_petitions`
--

INSERT INTO `case_petitions` (`id`, `case_id`, `date`, `type`, `appeal_date`, `decision`, `created_at`, `updated_at`) VALUES
(44, 139, '2025-10-05', 'Ù…Ù†Ø¹ Ø³ÙØ±', '2025-10-12', 0, '2025-10-05 15:27:08', '2025-10-05 15:27:08'),
(47, 142, '2025-09-01', 'Ø§Ù…Ø± ÙØªØ­ Ø¯Ø¹ÙˆÙ‰', '2025-09-09', 1, '2025-10-13 10:41:38', '2025-10-13 10:41:38'),
(48, 144, '2025-10-13', 'Ø­Ø¬Ø² ØªØ®ÙØ¸Ù‰ ', '2025-10-20', 0, '2025-10-17 06:36:58', '2025-10-17 06:36:58'),
(51, 147, '2025-10-14', 'Hm', '2025-10-22', 1, '2025-10-27 07:38:57', '2025-10-27 07:38:57'),
(52, 148, '2025-10-14', 'Hm', '2025-10-22', 1, '2025-10-27 07:39:06', '2025-10-27 07:39:06'),
(53, 149, '2025-10-14', 'Hm', '2025-10-22', 1, '2025-10-27 07:39:47', '2025-10-27 07:39:47'),
(55, 160, '2025-10-30', 'Ù…Ù†Ø¹ Ø³ÙØ±', '2025-11-07', 1, '2025-11-01 14:44:01', '2025-11-01 14:44:01');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_petition_documents`
--

CREATE TABLE `case_petition_documents` (
  `id` int NOT NULL,
  `petition_id` int NOT NULL,
  `document_name` varchar(1055) NOT NULL,
  `document_url` varchar(2055) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_petition_documents`
--

INSERT INTO `case_petition_documents` (`id`, `petition_id`, `document_name`, `document_url`, `created_at`) VALUES
(9, 48, 'Ã™Â‚Ã˜Â±Ã˜Â§Ã˜Â± Ã˜Â§Ã™Â…Ã˜Â± Ã˜Â¹Ã™Â„Ã™Â‰ Ã˜Â¹Ã˜Â±Ã™ÂŠÃ˜Â¶Ã™Â‡.pdf', 'https://mbn.9ede59b180ea59b7a50853f00d2bebdb.r2.cloudflarestorage.com/documents/1760683016923-7q7kkiwit9x.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=6b8cec64c9c9e276a5fa25d35d6110ab%2F20251017%2Fauto%2Fs3%2Faws4_request&X-Amz-Date=20251017T063658Z&X-Amz-Expires=604800&X-Amz-Signature=bdd68038ef546429d3eb8f45cd87391bafb9d2672a81889e730ff16535ee9cb9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', '2025-10-17 06:36:58');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_types`
--

CREATE TABLE `case_types` (
  `id` int NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `case_types`
--

INSERT INTO `case_types` (`id`, `name_ar`, `name_en`, `created_at`) VALUES
(1, 'Ù…Ø¯Ù†ÙŠØ©', 'Civil ', '2025-09-18 06:16:57'),
(2, 'Ø¬Ø²Ø§Ø¦ÙŠØ©', 'Criminal ', '2025-09-18 06:16:57'),
(3, 'ØªØ¬Ø§Ø±ÙŠØ©', 'Commercial ', '2025-09-18 06:16:57'),
(32, 'Ø¹Ù…Ø§Ù„ÙŠØ©', 'work', '2025-10-30 01:36:33');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `cash_transaction_attachments`
--

CREATE TABLE `cash_transaction_attachments` (
  `id` int NOT NULL,
  `transaction_id` int NOT NULL,
  `attachment_url` varchar(1055) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `attachment_name` varchar(1055) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `clients_deals`
--

CREATE TABLE `clients_deals` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('normal','yearly') NOT NULL DEFAULT 'normal',
  `status` enum('draft','completed') NOT NULL DEFAULT 'draft',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `clients_deals`
--

INSERT INTO `clients_deals` (`id`, `client_id`, `amount`, `type`, `status`, `start_date`, `end_date`, `created_at`, `created_by`) VALUES
(2, 17, '200.00', 'yearly', 'completed', '2025-10-21', '2025-10-21', '2025-10-08 10:57:38', 90),
(3, 30, '2020.00', 'normal', 'draft', NULL, NULL, '2025-10-10 02:52:46', 90),
(4, 32, '200.00', 'yearly', 'draft', '2025-10-08', '2025-10-29', '2025-10-13 11:45:39', 90),
(6, 53, '120000.00', 'normal', 'draft', NULL, NULL, '2025-10-20 07:13:07', 90),
(7, 52, '5000.00', 'yearly', 'draft', '2025-10-06', '2025-10-13', '2025-10-21 12:28:04', 90),
(12, 20, '5432.00', 'normal', 'draft', '2025-10-07', '2025-10-06', '2025-10-26 10:23:42', 90),
(13, 57, '120000.00', 'normal', 'completed', '2025-10-01', '2025-11-01', '2025-10-30 07:16:46', 90);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `courts`
--

CREATE TABLE `courts` (
  `id` int NOT NULL,
  `court_ar` varchar(100) NOT NULL,
  `court_en` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `courts`
--

INSERT INTO `courts` (`id`, `court_ar`, `court_en`, `created_at`) VALUES
(1, 'Ù…Ø­ÙƒÙ…Ø© Ø¹Ø¬Ù…Ø§Ù†', 'ajman court', '2025-09-20 19:01:32'),
(2, 'Ù…Ø­ÙƒÙ…Ø© Ø§Ù„Ø´Ø§Ø±Ù‚Ø©', 'sharjah court', '2025-09-20 19:01:32'),
(3, 'Ù…Ø­ÙƒÙ…Ø© Ø§Ù„Ø¹ÙŠÙ†', 'alin court', '2025-09-20 19:25:18');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `court_case_documents`
--

CREATE TABLE `court_case_documents` (
  `id` int NOT NULL,
  `case_id` int NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `document_url` varchar(2055) NOT NULL,
  `uploaded_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `court_case_documents`
--

INSERT INTO `court_case_documents` (`id`, `case_id`, `document_name`, `document_url`, `uploaded_by`, `created_at`) VALUES
(28, 144, 'Ã™Â„Ã˜Â§Ã˜Â¦Ã˜Â­Ã˜Â© Ã˜Â¯Ã˜Â¹Ã™ÂˆÃ™Â‰ Ã™Â…Ã˜Â­Ã™Â…Ã˜Â¯ Ã˜Â­Ã˜Â¬Ã™Â‰.pdf', 'https://mbn.9ede59b180ea59b7a50853f00d2bebdb.r2.cloudflarestorage.com/documents/1760683012739-ohzzsxq7jt.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=6b8cec64c9c9e276a5fa25d35d6110ab%2F20251017%2Fauto%2Fs3%2Faws4_request&X-Amz-Date=20251017T063654Z&X-Amz-Expires=604800&X-Amz-Signature=e6d7858e24b0d5882aa30e9d80d4a092fba3afe4f27f103061209bd994eb49b1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', NULL, '2025-10-17 06:36:54');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `deal_documents`
--

CREATE TABLE `deal_documents` (
  `id` int NOT NULL,
  `deal_id` int NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `document_url` varchar(500) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `deal_documents`
--

INSERT INTO `deal_documents` (`id`, `deal_id`, `document_name`, `document_url`, `created_at`, `created_by`) VALUES
(6, 13, 'certificate 3d printing.pdf', 'https://lexcora.s3.us-east-2.amazonaws.com/deal-documents/1761808605547-s3xjb6pf9d.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS4GY53D5CUSO22MU%2F20251030%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20251030T071645Z&X-Amz-Expires=604800&X-Amz-Signature=9caf754e13b58fe7552a6e9879be6db3f10978df40f599d13f9b59f2832e6862&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', '2025-10-30 07:16:46', 90);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `deductions`
--

CREATE TABLE `deductions` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `deductions`
--

INSERT INTO `deductions` (`id`, `employee_id`, `date`, `amount`, `reason`, `created_by`, `created_at`) VALUES
(1, 90, '2025-10-01', '250.00', 'ØºÙŠØ§Ø¨', 73, '2025-10-12 04:16:59'),
(3, 114, '2025-10-20', '100.00', 'ØªØ£Ø®ÙŠØ±', 90, '2025-10-20 10:28:45'),
(4, 95, '2025-10-03', '100.00', 'ØªØ£Ø®ÙŠØ±', 90, '2025-10-29 22:41:11');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `departments`
--

CREATE TABLE `departments` (
  `id` int NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `departments`
--

INSERT INTO `departments` (`id`, `name_ar`, `name_en`, `created_at`) VALUES
(1, ' Ø§Ù„Ù‚Ø§Ù†ÙˆÙ†ÙŠ', 'Legal Department', '2025-09-18 06:13:07'),
(2, ' Ø§Ù„Ù…Ø­Ø§Ù…Ø§Ø©', 'Litigation', '2025-09-18 06:13:07'),
(3, ' Ø§Ù„Ø§Ø³ØªØ´Ø§Ø±Ø§Øª', 'Consultation', '2025-09-18 06:13:07'),
(4, ' Ø§Ù„Ù…Ø§Ù„ÙŠ', 'Finance', '2025-09-18 06:13:07'),
(5, ' Ø®Ø¯Ù…Ø© Ø§Ù„Ø¹Ù…Ù„Ø§Ø¡', 'Customer Service ', '2025-09-18 06:13:07'),
(6, ' Ø§Ù„Ù…ÙˆØ§Ø±Ø¯ Ø§Ù„Ø¨Ø´Ø±ÙŠØ©', 'Human Resources', '2025-09-18 06:13:07'),
(7, ' ØªÙ‚Ù†ÙŠØ© Ø§Ù„Ù…Ø¹Ù„ÙˆÙ…Ø§Øª', 'IT', '2025-09-18 06:13:07');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `deposits`
--

CREATE TABLE `deposits` (
  `id` int NOT NULL,
  `bank_account_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `deposits`
--

INSERT INTO `deposits` (`id`, `bank_account_id`, `amount`, `deposit_date`, `created_at`, `created_by`) VALUES
(3, 1, '1200.00', '2025-10-17', '2025-10-17 17:34:58', 90);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `global_settings`
--

CREATE TABLE `global_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name_ar` varchar(255) DEFAULT NULL,
  `company_name_en` varchar(255) DEFAULT NULL,
  `company_trn` varchar(50) DEFAULT NULL,
  `company_address_ar` text,
  `company_address_en` text,
  `company_phone` varchar(50) DEFAULT NULL,
  `company_email` varchar(100) DEFAULT NULL,
  `company_logo_url` varchar(500) DEFAULT NULL,
  `default_vat_rate` decimal(5,2) DEFAULT '5.00',
  `terms_conditions_ar` text,
  `terms_conditions_en` text,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `global_settings`
--

INSERT INTO `global_settings` (`company_name_ar`, `company_name_en`, `company_trn`, `company_address_ar`, `company_address_en`, `company_phone`, `company_email`, `default_vat_rate`) 
VALUES ('Ù„ÙŠÙƒØ³ÙƒÙˆØ±Ø§ Ù„Ù„Ù…Ø­Ø§Ù…Ø§Ø© ÙˆØ§Ù„Ø§Ø³ØªØ´Ø§Ø±Ø§Øª Ø§Ù„Ù‚Ø§Ù†ÙˆÙ†ÙŠØ©', 'Lexcora Advocates & Legal Consultants', '100423000000003', 'Ø¯Ø¨ÙŠØŒ Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª Ø§Ù„Ø¹Ø±Ø¨ÙŠØ© Ø§Ù„Ù…ØªØ­Ø¯Ø©', 'Dubai, United Arab Emirates', '+971 4 000 0000', 'info@lexcora.com', 5.00);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `employees`
--

CREATE TABLE `employees` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `job_id` varchar(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_id` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `username` varchar(55) NOT NULL,
  `department_id` int DEFAULT NULL,
  `eId` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `passport` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `direct_manager_id` int DEFAULT NULL,
  `password` varchar(55) NOT NULL,
  `residence_end_date` date DEFAULT NULL,
  `id_end_date` date DEFAULT NULL,
  `passport_end_date` date DEFAULT NULL,
  `labor_card_end_date` date DEFAULT NULL,
  `health_insurance_end_date` date DEFAULT NULL,
  `contract_end_date` date DEFAULT NULL,
  `basic_salary` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `contract_type` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `iban` varchar(50) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `pay_type` varchar(30) DEFAULT NULL,
  `housing_allowance` varchar(20) DEFAULT NULL,
  `transportation_allowance` varchar(20) DEFAULT NULL,
  `last_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `first_day_of_work` date DEFAULT NULL,
  `another_allowance` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `account_activation_date` date DEFAULT NULL,
  `account_close_date` date DEFAULT NULL,
  `registration_expiration_date` date DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `employees`
--

INSERT INTO `employees` (`id`, `name`, `job_id`, `role_id`, `email`, `phone`, `username`, `department_id`, `eId`, `passport`, `branch_id`, `direct_manager_id`, `password`, `residence_end_date`, `id_end_date`, `passport_end_date`, `labor_card_end_date`, `health_insurance_end_date`, `contract_end_date`, `basic_salary`, `created_at`, `status`, `contract_type`, `bank_name`, `iban`, `account_number`, `pay_type`, `housing_allowance`, `transportation_allowance`, `last_login`, `first_day_of_work`, `another_allowance`, `account_activation_date`, `account_close_date`, `registration_expiration_date`, `balance`) VALUES
(73, 'Ù…Ù†ØªØµØ± Ù…Ø­Ù…Ø¯ Ø³Ø§Ù„Ù…', '54321', 3, 'thmansai', '7654321', 'othman', 1, '87654321', NULL, NULL, NULL, '123456', '2025-11-11', '2025-11-11', '2025-11-11', '2025-11-11', '2025-11-11', '2025-11-11', '0.00', '2025-09-19 22:22:18', 'inactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-19 19:49:23', NULL, '', NULL, NULL, NULL, '-300.00'),
(76, 'Ù…Ø­Ù…ÙˆØ¯ Ø§Ø­Ù…Ø¯', '543217', 6, 'thmansai3', '7654321', 'othman33', 1, '87654321', NULL, 3, NULL, '1234563', '2025-11-11', '2025-11-11', '2025-11-11', '2025-11-11', '2025-11-11', '2025-11-11', '0.00', '2025-09-19 22:26:04', 'inactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-05 16:15:55', NULL, '', NULL, NULL, NULL, '210.00'),
(80, 'Ù…Ø±ÙˆÙ‰ Ù…Ø³Ø¹Ø¯', '54321y7', 3, 'thmansai3', '7654321', 'ytyt', 1, '87654321', NULL, 1, NULL, '1234563u', '2025-11-11', '2025-11-11', '2025-11-11', '2025-11-11', '2025-11-11', '2025-11-11', '0.00', '2025-09-19 22:28:09', 'inactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-30 02:40:40', NULL, '', NULL, NULL, NULL, '0.00'),
(90, 'admin', 'admin', 1, 'thman.saleh@gmai.lom', '0501455918', 'admin', 3, 'koijknlm', '76543265', 2, 91, 'almstkshfff111', NULL, '2029-09-30', NULL, NULL, '2029-09-30', NULL, '5000.00', '2025-09-20 13:00:56', 'active', 'Ø¬Ø²Ø¦ÙŠ', 'DIB', NULL, NULL, 'ØªØ­ÙˆÙŠÙ„ Ø¨Ù†ÙƒÙŠ', '500', '500', '2025-11-05 17:38:01', '2025-10-09', '0', '2029-09-30', '2029-09-30', '2029-09-30', '0.00'),
(91, 'ÙØ¶Ù„ Ù†Ø§ØµØ±', '81562', 3, 'THMan@4r4r.com', '0501455918', '81562', 3, '567890', '8765', 2, 76, 'othman', '2026-08-11', '2027-02-16', '2026-05-26', '2026-04-21', '2026-03-19', '2026-03-20', '7777.00', '2025-09-20 13:02:15', 'inactive', NULL, NULL, NULL, NULL, NULL, '0', '0', '2025-11-02 16:29:34', '2025-11-20', '0', NULL, NULL, '2026-02-11', '390.00'),
(92, 'Ù…Ù†ØµÙˆØ± Ø¹Ù„ÙŠ', '12323', 6, 'othman@123', '0501455918', 'othmansaleh', 5, 'iuytrdesw5', '5432df', 2, 90, 'othman', '2025-09-22', '2025-09-22', '2025-09-22', '2025-09-23', '2025-09-22', '2025-09-22', '3000.00', '2025-09-20 15:21:35', 'inactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-20 15:21:35', NULL, '', NULL, NULL, NULL, '0.00'),
(93, 'Ø¹Ø¨ÙŠØ± Ø¹Ø¨Ø¯Ø§Ù„Ø³ØªØ§Ø±', '21111', 4, 'thman.saleh@gmai.lom', '0501455918', '77168', 1, '99', '99', 2, 73, '211', '2025-09-17', '2025-09-22', '2025-09-21', '2025-09-17', '2025-09-15', '2025-09-14', '0.00', '2025-09-22 23:48:39', 'inactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-06 19:57:44', NULL, '', NULL, NULL, NULL, '-211.00'),
(94, 'Ø­Ù…Ø²Ø© Ø³ÙŠÙ', '211', 5, 'thman.saleh@gmai.lom', '211', '211', 3, '211', '211', 2, 90, '211', '2025-09-26', '2025-09-29', '2025-09-28', '2025-09-04', '2025-09-09', '2025-09-07', '211.00', '2025-09-22 23:49:45', 'inactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-22 23:49:45', NULL, '', NULL, NULL, NULL, '400.00'),
(95, 'ØªØ§Ù…Ø± ÙŠÙˆÙ†Ø³', '11', 4, 'ceo@almstkshf.com', '0585400191', 'tamer', 3, '784197941306025', 'A18899765', 3, 103, '1234', '2026-06-01', '2026-05-28', '2026-08-01', '2025-10-30', '2026-06-01', '2025-10-30', '150000.00', '2025-10-05 20:17:14', 'inactive', 'ÙƒØ§Ù…Ù„', 'adib', ' AE570351646006055158001', '16400605515001', 'wps', '1500', '1000', '2025-10-29 23:04:21', '2025-07-23', '500', '2025-07-23', NULL, '2025-11-12', '3321.00'),
(96, 'Ø±Ø§Ø´Ø¯ Ø§Ù„Ù…Ù†ØµÙˆØ±ÙŠ', '2002', 3, 'john.smith@email.com', '0501455918', '2002', 5, '098765432', '8282828', 3, 90, '278426', '2025-10-10', '2025-10-09', '2025-10-08', '2025-10-14', '2025-09-29', '2025-10-22', '4000.00', '2025-10-10 08:00:02', 'inactive', 'ÙƒØ§Ù…Ù„', 'Ø¨Ù†Ùƒ Ø¯Ø¨ÙŠ Ø§Ù„Ø§Ø³Ù„Ø§Ù…ÙŠ', '9876545678765434567', '76543245456765', 'ØªØ­ÙˆÙŠÙ„ Ø¨Ù†ÙƒÙŠ', '500', '700', '2025-10-10 12:00:02', '2025-10-22', '500', '2025-10-13', '2025-10-15', NULL, '0.00'),
(97, 'ali', '4949', 10, 'thman.saleh@gmail.com', '050145094', '4949', 6, '7765645667754', '8765438654', 2, 95, '111111', '2025-10-10', '2025-10-08', '2025-10-22', '2025-10-14', '2025-10-07', '2025-10-12', '8000.00', '2025-10-13 02:01:46', 'active', 'ÙƒØ§Ù…Ù„', 'FAB', '3456789087654', '98765456789', 'Ø´ÙŠÙƒ', '500', '500', '2025-11-05 17:38:47', '2025-10-21', '0', '2025-10-14', '2025-10-28', '2025-10-19', '0.00'),
(102, 'Ø´Ø±ÙŠÙ ', 'sherif', 4, 'essawys9999@gmail.com', '0556829149', 'sherif', 3, NULL, NULL, 3, NULL, '570000', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '2025-10-15 15:22:42', 'inactive', NULL, NULL, NULL, NULL, NULL, '0', '0', '2025-11-02 04:24:28', NULL, '0', NULL, NULL, NULL, '0.00'),
(103, 'Ù…Ø­Ù…Ø¯ Ø¨Ù†Ù‰ Ù‡Ø§Ø´Ù… ', '1', 2, 'Mohammed@mbh.com', '0506462864', '1', 1, NULL, NULL, 3, NULL, 'mbh123', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '2025-10-15 15:24:21', 'inactive', 'ÙƒØ§Ù…Ù„', NULL, NULL, NULL, NULL, '0', '0', '2025-10-29 23:16:06', NULL, '0', NULL, NULL, NULL, '180.00'),
(104, 'Ø±Ù†Ø§ ', 'rana', 6, 'rana@gmail.com', '05555555', 'rana', 5, NULL, NULL, 3, NULL, '570000', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '2025-10-15 15:37:42', 'inactive', NULL, NULL, NULL, NULL, NULL, '0', '0', '2025-10-17 10:03:32', NULL, '0', NULL, NULL, NULL, '300.00'),
(105, 'suhaa', 'suha', 5, 'suha@gmail.com', '0555555', 'suha', 1, NULL, NULL, 3, NULL, '570000', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '2025-10-15 15:40:57', 'inactive', NULL, NULL, NULL, NULL, NULL, '0', '0', '2025-10-17 10:13:47', NULL, '0', NULL, NULL, NULL, '0.00'),
(108, 'Ø´Ø±ÙŠÙ 2', '5700', 4, 'sherif@gmail.com', '0500000000', '5700', 3, NULL, NULL, 3, NULL, '339420', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '2025-10-15 15:54:28', 'inactive', NULL, NULL, NULL, NULL, NULL, '0', '0', '2025-10-15 20:07:30', NULL, '0', NULL, NULL, NULL, '0.00'),
(113, 'Ø±Ù†Ø§ Ø¹Ù„Ù‰  ', 'rana ali ', 6, 'rana@gmail.com', '0555555555', 'rana ali ', 3, NULL, NULL, 3, NULL, '221333', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '2025-10-17 05:57:36', 'inactive', NULL, NULL, NULL, NULL, NULL, '0', '0', '2025-10-17 09:57:36', NULL, '0', NULL, NULL, NULL, '0.00'),
(114, 'Ashly Philip', 'MBH-AJM/Acc/60', 7, 'ashly-accounts@mbhadvocates.com', '0501122334', 'MBH-AJM/Acc/60', 4, '784-1998-4697762-9', 'P9839936', 3, 103, '99999', '2025-10-31', NULL, '2025-10-26', '2025-10-29', '2025-10-22', '2025-10-29', '1000.00', '2025-10-20 10:17:08', 'inactive', 'ÙƒØ§Ù…Ù„', 'ADCB', NULL, NULL, 'wps', '1000', '1000', '2025-10-20 14:17:08', '2025-10-01', '1000', '2025-10-20', NULL, '2025-10-22', '0.00'),
(116, 'Ziad', '777', 4, '', '547811085', '777', 3, NULL, NULL, 3, 95, '197294', NULL, NULL, NULL, NULL, NULL, NULL, '1000.00', '2025-10-27 08:38:23', 'inactive', 'ÙƒØ§Ù…Ù„', NULL, NULL, NULL, 'ÙƒØ§Ø´', '0', '0', '2025-10-27 08:38:23', '2025-10-27', '0', NULL, NULL, NULL, '0.00'),
(117, 'Ø±Ø²Ø§Ù†', '33', 8, 'Razan@mbh.com', '0505050505', '33', 5, NULL, NULL, 3, NULL, '863346', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '2025-10-30 00:09:34', 'inactive', NULL, NULL, NULL, NULL, NULL, '0', '0', '2025-10-30 10:56:18', NULL, '0', NULL, NULL, NULL, '0.00'),
(118, 'Nour qandil', '12', 10, 'nour@mbh.com', '0545855668', '12', 6, NULL, NULL, 3, 103, '976418', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '2025-10-30 00:13:03', 'inactive', 'ÙƒØ§Ù…Ù„', NULL, NULL, NULL, 'ÙƒØ§Ø´', '0', '0', '2025-10-30 00:13:03', '2024-09-01', '0', '2026-10-31', NULL, NULL, '5000.00'),
(119, 'Umar usman', '14', 7, 'omar@mbh.com', '0504159560', '14', 4, NULL, NULL, 3, 103, 'umar123', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '2025-10-30 00:15:12', 'inactive', NULL, NULL, NULL, NULL, NULL, '0', '0', '2025-10-30 01:15:23', NULL, '0', NULL, NULL, NULL, '0.00');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `employee_attendance`
--

CREATE TABLE `employee_attendance` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `checkin` datetime NOT NULL,
  `checkout` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `employee_attendance`
--

INSERT INTO `employee_attendance` (`id`, `employee_id`, `checkin`, `checkout`, `created_at`, `created_by`) VALUES
(1, 90, '2025-10-09 04:17:00', '2025-10-09 13:00:00', '2025-10-12 03:15:58', 73),
(5, 96, '2025-10-01 08:00:00', '2025-10-01 17:00:00', '2025-10-12 08:24:36', 73),
(7, 97, '2025-10-02 09:12:00', '2025-10-02 16:00:00', '2025-10-13 02:59:57', 90),
(8, 114, '2025-10-20 05:10:00', '2025-10-20 13:00:00', '2025-10-20 10:28:25', 90),
(9, 95, '2025-10-01 08:00:00', '2025-10-01 17:00:00', '2025-10-29 22:37:29', 90),
(10, 95, '2025-10-02 08:00:00', '2025-10-02 13:00:00', '2025-10-29 22:38:32', 90),
(11, 95, '2025-10-03 08:00:00', '2025-10-03 12:00:00', '2025-10-29 22:39:15', 90);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `employee_cash_transactions`
--

CREATE TABLE `employee_cash_transactions` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `client_id` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('credit','debit') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'credit',
  `description` text COLLATE utf8mb4_0900_ai_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `employee_cash_transactions`
--

INSERT INTO `employee_cash_transactions` (`id`, `employee_id`, `client_id`, `amount`, `type`, `description`, `created_by`, `created_at`, `status`) VALUES
(4, 91, NULL, '200.00', 'credit', 'test', 90, '2025-11-22 21:54:40', 'approved'),
(5, 91, NULL, '400.00', 'credit', NULL, 90, '2025-11-01 21:55:00', 'approved'),
(7, 103, NULL, '200.00', 'credit', 'test', 90, '2025-11-01 23:30:23', 'approved'),
(8, 103, NULL, '20.00', 'debit', 'test', 90, '2025-11-02 10:09:50', 'approved'),
(9, 76, NULL, '210.00', 'credit', 'ygtfrerfr', 90, '2025-11-18 12:22:38', 'approved'),
(10, 91, NULL, '200.00', 'debit', NULL, 90, '2025-11-02 14:06:22', 'approved'),
(12, 94, NULL, '400.00', 'credit', NULL, 90, '2025-11-06 20:08:50', 'approved'),
(13, 104, NULL, '300.00', 'credit', NULL, 90, '2025-11-02 20:09:07', 'approved'),
(14, 91, NULL, '10.00', 'debit', NULL, 90, '2025-11-02 20:09:32', 'approved'),
(15, 95, NULL, '4000.00', 'credit', NULL, 90, '2025-11-09 20:10:12', 'approved'),
(16, 118, NULL, '5000.00', 'credit', NULL, 90, '2025-11-02 20:10:34', 'approved'),
(17, 95, NULL, '400.00', 'debit', NULL, 90, '2025-11-29 20:10:53', 'approved'),
(18, 95, NULL, '39.00', 'debit', NULL, 90, '2025-11-02 20:11:12', 'approved'),
(19, 95, 30, '29.00', 'debit', 'test', 90, '2025-11-03 11:03:34', 'pending'),
(20, 95, NULL, '211.00', 'debit', NULL, 90, '2025-11-03 12:53:45', 'pending'),
(21, 93, 75, '211.00', 'debit', NULL, 90, '2025-11-03 13:26:25', 'pending'),
(23, 73, NULL, '12.00', 'debit', NULL, 90, '2025-11-04 10:35:35', 'pending'),
(24, 73, NULL, '288.00', 'debit', NULL, 90, '2025-11-04 10:36:17', 'pending');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `document_type` enum('cv','id','passport','insurance','contract','others','good_conduct','work_permit','education_certificate') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `document_url` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uploaded_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `employee_documents`
--

INSERT INTO `employee_documents` (`id`, `employee_id`, `document_type`, `document_name`, `document_url`, `created_at`, `uploaded_by`) VALUES
(3, 90, 'passport', 'Ã˜Â³Ã™ÂŠÃ˜Â±Ã˜Â©.webp', 'https://mbn.9ede59b180ea59b7a50853f00d2bebdb.r2.cloudflarestorage.com/documents/1760167808496-e8t7zw6jsgj.webp?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=6b8cec64c9c9e276a5fa25d35d6110ab%2F20251011%2Fauto%2Fs3%2Faws4_request&X-Amz-Date=20251011T073010Z&X-Amz-Expires=604800&X-Amz-Signature=cc84cfc8093c8ea114368de22a9151822a3a20d454fea405e275b98905d6f700&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', '2025-10-11 07:30:10', 90),
(5, 90, 'id', 'Ã˜Â³Ã™ÂŠÃ˜Â±Ã˜Â©.webp', 'https://mbn.9ede59b180ea59b7a50853f00d2bebdb.r2.cloudflarestorage.com/documents/1760168520892-pruqc8yirt.webp?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=6b8cec64c9c9e276a5fa25d35d6110ab%2F20251011%2Fauto%2Fs3%2Faws4_request&X-Amz-Date=20251011T074202Z&X-Amz-Expires=604800&X-Amz-Signature=68f0c74b8a92a22d34afb11b96804b5fecae8b6d3664cdc61f2d10bdc0800fdc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', '2025-10-11 07:42:03', 90),
(6, 90, 'cv', 'sessions_1760147239630-6h95klq91l4.pdf', 'https://mbn.9ede59b180ea59b7a50853f00d2bebdb.r2.cloudflarestorage.com/documents/1760169125934-pl8wftqumn.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=6b8cec64c9c9e276a5fa25d35d6110ab%2F20251011%2Fauto%2Fs3%2Faws4_request&X-Amz-Date=20251011T075207Z&X-Amz-Expires=604800&X-Amz-Signature=849298709d2e38d5283317955a241d49e6af8f1c8a29b898c5bed3641f48c8ba&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', '2025-10-11 07:52:07', 90),
(21, 95, 'cv', 'TFA Agreement (Freelancer) 1 .pdf', 'https://lexcora.s3.us-east-2.amazonaws.com/documents/1761778284615-5ybps552plw.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS4GY53D5CUSO22MU%2F20251029%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20251029T225124Z&X-Amz-Expires=604800&X-Amz-Signature=9ff349e0dc5f2e30fad40d11d99ece2cb310c2996a9c00b508a958810c3dde1a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', '2025-10-29 22:51:25', 90),
(22, 95, 'id', 'Screenshot_20220627-174448_Samsung Notes_Original.jpeg', 'https://lexcora.s3.us-east-2.amazonaws.com/documents/1761778324057-cqsj6nt72v.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS4GY53D5CUSO22MU%2F20251029%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20251029T225204Z&X-Amz-Expires=604800&X-Amz-Signature=3242a1b4ddda49013e7775e89aaa16999abb1f248ea8e2014a177620e38a65e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', '2025-10-29 22:52:04', 90),
(23, 95, 'education_certificate', 'IMG_0129.jpeg', 'https://lexcora.s3.us-east-2.amazonaws.com/documents/1761778505554-unnvn5yyxh.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS4GY53D5CUSO22MU%2F20251029%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20251029T225505Z&X-Amz-Expires=604800&X-Amz-Signature=4b574f53468ea62f33a28986717ed6ff6ce639a5da37d270e49bef05732f4f48&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', '2025-10-29 22:55:06', 90);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `employee_permissions`
--

CREATE TABLE `employee_permissions` (
  `id` int NOT NULL,
  `permission_id` int NOT NULL,
  `employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `employee_permissions`
--

INSERT INTO `employee_permissions` (`id`, `permission_id`, `employee_id`) VALUES
(1251, 222, 97),
(1252, 214, 97),
(1253, 225, 97),
(1254, 217, 97),
(1255, 224, 97),
(1256, 227, 97),
(1257, 228, 97),
(1258, 223, 97),
(1259, 229, 97);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `employee_requests`
--

CREATE TABLE `employee_requests` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `type` varchar(100) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `manager_approval` enum('pending','approved','rejected') DEFAULT 'pending',
  `hr_approval` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `employee_requests`
--

INSERT INTO `employee_requests` (`id`, `employee_id`, `date`, `type`, `from_date`, `to_date`, `manager_approval`, `hr_approval`, `created_by`, `created_at`) VALUES
(1, 96, '2025-10-07', 'Ø§Ø¬Ø§Ø²Ø© Ø§Ø¨ÙˆÙŠØ©', '2025-10-10', '2025-10-23', 'approved', 'approved', 73, '2025-10-12 08:01:29'),
(2, 95, '2025-10-01', 'Ø´Ù‡Ø§Ø¯Ø© Ù„Ø§ Ù…Ø§Ù†Ø¹', NULL, NULL, 'approved', 'approved', 73, '2025-10-12 08:51:26'),
(4, 93, '2025-10-13', 'Ø§Ø®Ø±Ù‰', NULL, NULL, 'rejected', 'approved', 90, '2025-10-13 03:53:38'),
(6, 97, '2025-10-09', 'Ø´Ù‡Ø§Ø¯Ø© Ø®Ø¨Ø±Ø©', NULL, NULL, 'approved', 'approved', 90, '2025-10-13 10:52:04'),
(7, 91, '2025-10-09', 'Ø´Ù‡Ø§Ø¯Ø© Ø®Ø¨Ø±Ø©', NULL, NULL, 'rejected', 'rejected', 97, '2025-10-14 22:41:12'),
(8, 102, '2025-10-14', 'Ø§Ø¬Ø§Ø²Ø© Ù…Ø±Ø¶ÙŠØ©', '2025-10-26', '2025-10-28', 'rejected', 'rejected', 90, '2025-10-15 15:30:16'),
(9, 108, '2025-10-15', 'Ø§Ø¬Ø§Ø²Ø© Ø³Ù†ÙˆÙŠØ©', '2025-11-01', '2025-11-15', 'approved', 'approved', 108, '2025-10-15 16:04:50'),
(11, 80, '2025-10-02', 'Ø§Ø¬Ø§Ø²Ø© Ø³Ù†ÙˆÙŠØ©', '2025-10-01', '2025-10-15', 'rejected', 'approved', 90, '2025-10-20 19:08:37'),
(15, 95, '2025-10-22', 'Ø§Ø¬Ø§Ø²Ø© ØªÙØ±Øº Ù„Ø¥Ø¯Ø§Ø¡ Ø§Ù„Ø®Ø¯Ù…Ø© Ø§Ù„ÙˆØ·Ù†ÙŠØ©', '2025-10-23', '2025-10-31', 'approved', 'rejected', 90, '2025-10-22 03:59:38'),
(16, 80, '2025-10-08', 'Ø§Ø¬Ø§Ø²Ø© Ø§Ù„ÙˆØ¶Ø¹', '2025-10-08', '2025-10-30', 'rejected', 'rejected', 90, '2025-10-27 08:47:54'),
(17, 80, '2025-10-22', 'Ø´Ù‡Ø§Ø¯Ø© Ø®Ø¨Ø±Ø©', NULL, NULL, 'approved', 'approved', 90, '2025-10-30 01:04:27'),
(19, 117, '2025-11-08', 'Ø§Ø¬Ø§Ø²Ø© Ø§Ù„ÙˆØ¶Ø¹', '2025-09-30', '2025-11-01', 'approved', 'approved', 90, '2025-10-30 01:32:59'),
(20, 80, '2025-10-17', 'Ø¥Ø°Ù† Ø®Ø±ÙˆØ¬', '2025-10-23', '2025-10-23', 'pending', 'pending', 80, '2025-10-30 03:39:27'),
(21, 80, '2025-10-30', 'Ø¥Ø¬Ø§Ø²Ø© Ø·Ø§Ø±Ø¦Ø©', '2025-10-10', '2025-10-08', 'pending', 'pending', 80, '2025-10-30 03:43:40'),
(22, 80, '2025-10-30', 'ØªØ¹ÙˆÙŠØ¶ Ø³Ø§Ø¹Ø§Øª Ø¹Ù…Ù„', '2025-10-30', '2025-10-16', 'pending', 'pending', 80, '2025-10-30 03:44:37'),
(23, 80, '2025-10-30', 'Ø§Ø¬Ø§Ø²Ø© Ø³Ù†ÙˆÙŠØ©', '2025-10-31', '2025-10-30', 'rejected', 'approved', 80, '2025-10-30 03:52:17'),
(24, 80, '2025-10-30', 'Ø§Ø¬Ø§Ø²Ø© Ø§Ù„ØªÙØ±Øº Ù„Ø¥Ø¯Ø§Ø¡ Ø§Ù„Ø®Ø¯Ù…Ø© Ø§Ù„ÙˆØ·Ù†ÙŠØ©', '2025-10-30', '2025-12-04', 'approved', 'rejected', 80, '2025-10-30 03:56:05'),
(25, 91, '2025-10-30', 'Ø§Ø¬Ø§Ø²Ø© Ø§Ù„ÙˆØ¶Ø¹', '2025-10-30', '2025-10-31', 'pending', 'pending', 90, '2025-10-30 04:00:39'),
(26, 80, '2025-10-30', 'Ø´Ù‡Ø§Ø¯Ø© Ø®Ø¨Ø±Ø©', NULL, NULL, 'approved', 'approved', 80, '2025-10-30 04:04:58'),
(28, 114, '2025-10-30', 'Ø´Ù‡Ø§Ø¯Ø© Ø®Ø¨Ø±Ø©', NULL, NULL, 'approved', 'approved', 90, '2025-10-30 04:10:54'),
(32, 97, '2025-10-30', 'Ø´Ù‡Ø§Ø¯Ø© Ø®Ø¨Ø±Ø©', NULL, NULL, 'pending', 'pending', 97, '2025-10-30 07:00:03'),
(33, 97, '2025-10-30', 'Ø´Ù‡Ø§Ø¯Ø© Ù„Ø§ Ù…Ø§Ù†Ø¹', NULL, NULL, 'pending', 'pending', 97, '2025-10-30 07:02:56'),
(34, 97, '2025-10-30', 'Ø§Ø¬Ø§Ø²Ø© Ø§Ù„ÙˆØ¶Ø¹', '2025-11-01', '2025-11-26', 'approved', 'pending', 97, '2025-10-30 07:03:25');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  `event_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `events`
--

INSERT INTO `events` (`id`, `title`, `place`, `event_date`, `start_time`, `end_time`, `description`, `created_at`, `created_by`) VALUES
(2, 'ÙˆØ±Ø´Ø© Ø¹Ù…Ù„', 'ÙÙ†Ø¯Ù‚ Ø§Ù„Ø¹Ù†ÙˆØ§Ù†', '2025-10-07', '09:00:00', '11:00:00', 'meetings', '2025-10-13 05:54:04', 90),
(4, 'test', 'dubai ', '2025-10-01', '01:00:00', '01:00:00', 'test', '2025-10-30 02:39:31', NULL),
(5, 'test', 'rcdwsx', '2025-10-09', '01:00:00', '01:00:00', 'rde3wsd', '2025-10-30 02:42:08', NULL);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `event_attendance`
--

CREATE TABLE `event_attendance` (
  `id` int NOT NULL,
  `event_id` int NOT NULL,
  `employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `event_attendance`
--

INSERT INTO `event_attendance` (`id`, `event_id`, `employee_id`) VALUES
(27, 2, 73),
(28, 2, 76),
(29, 2, 80),
(30, 2, 92),
(31, 2, 97),
(47, 4, 80),
(48, 5, 80);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `executions`
--

CREATE TABLE `executions` (
  `id` int NOT NULL,
  `case_id` int NOT NULL,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `status` enum('pending','in_progress','completed','cancelled') DEFAULT 'pending',
  `employee_id` int DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `executions`
--

INSERT INTO `executions` (`id`, `case_id`, `number`, `date`, `type`, `amount`, `status`, `employee_id`, `note`, `created_at`) VALUES
(31, 139, '', '2025-10-06', 'Ù…ØµØ§Ø¯Ø±Ø© Ø§Ù…ÙˆØ§Ø§Ù„', '9000.00', 'in_progress', NULL, NULL, '2025-10-05 15:27:09'),
(33, 142, NULL, '2025-10-01', 'Ù…Ù†Ø¹ Ù…Ù† Ø§Ù„Ø³ÙØ±', '500000.00', 'in_progress', NULL, NULL, '2025-10-13 10:41:40'),
(37, 147, NULL, '2025-10-07', 'Hm', '5000.00', 'in_progress', NULL, NULL, '2025-10-27 07:38:58'),
(38, 148, NULL, '2025-10-07', 'Hm', '5000.00', 'in_progress', NULL, NULL, '2025-10-27 07:39:07'),
(39, 149, NULL, '2025-10-07', 'Hm', '5000.00', 'in_progress', NULL, NULL, '2025-10-27 07:39:48'),
(41, 160, NULL, '2025-11-01', 'Ø§Ù„ØºØ§Ø¡ Ø§Ù„Ø®Ø¬Ø² Ø§Ù„ØªÙ†ÙÙŠØ°ÙŠ Ø¹Ù„Ù‰ Ø§Ù„Ø§Ø±ØµØ¯Ù‡', '0.00', 'pending', NULL, NULL, '2025-11-01 14:44:03');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `executions_documents`
--

CREATE TABLE `executions_documents` (
  `id` int NOT NULL,
  `execution_id` int NOT NULL,
  `document_name` varchar(1055) NOT NULL,
  `document_url` varchar(2055) NOT NULL,
  `uploaded_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `external_links`
--

CREATE TABLE `external_links` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(500) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `external_links`
--

INSERT INTO `external_links` (`id`, `title`, `link`, `created_by`, `created_at`) VALUES
(1, 'ÙˆØ²Ø§Ø±Ø© Ø§Ù„Ø¯Ø§Ø®Ù„ÙŠØ©', 'https://moi.gov.ae/', 90, '2025-10-17 10:36:29'),
(2, 'Ù…Ø­Ø§ÙƒÙ… Ø¯Ø¨ÙŠ', 'https://www.dc.gov.ae/PublicServices/Home.aspx', 90, '2025-10-17 10:38:47'),
(3, 'ÙˆØ²Ø§Ø±Ø© Ø§Ù„Ø¹Ø¯Ù„', 'https://www.moj.gov.ae', 90, '2025-10-17 10:39:41'),
(4, 'Ù†ÙŠØ§Ø¨Ø© Ø¯Ø¨ÙŠ', 'https://www.dxbpp.gov.ae/', 90, '2025-10-17 10:40:15'),
(7, 'Ø§Ù„Ù…Ø³ØªÙƒØ´Ù', 'https://www.almstkshf.com', 90, '2025-11-04 10:21:19');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `forms`
--

CREATE TABLE `forms` (
  `id` int NOT NULL,
  `document_url` varchar(500) NOT NULL,
  `document_for` enum('early leave','car acknowledgement letter','annual leave encashment','employee information','emergency leave','email acknowledgement','acknowledgement letter','end of service acknowledgement','loan','leave application','sickness self certificate','short absent','salary advance','new starter','others') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `forms`
--

INSERT INTO `forms` (`id`, `document_url`, `document_for`, `created_at`) VALUES
(1, 'https://pub-287a8516365548cdb4ac9012e23f194a.r2.dev/forms/Salary%20Advance%20Form.docx', 'salary advance', '2025-10-15 01:33:06'),
(2, 'https://pub-287a8516365548cdb4ac9012e23f194a.r2.dev/forms/Annual%20Leave%20Encashment%20Letter.pdf', 'annual leave encashment', '2025-10-15 01:33:06'),
(3, 'https://pub-287a8516365548cdb4ac9012e23f194a.r2.dev/forms/Car%20Acknowledgement%20Letter.pdf', 'car acknowledgement letter', '2025-10-15 01:37:24'),
(4, 'https://pub-287a8516365548cdb4ac9012e23f194a.r2.dev/forms/Early%20Leave%20Form%20.pdf', 'early leave', '2025-10-15 01:37:24'),
(5, 'https://pub-287a8516365548cdb4ac9012e23f194a.r2.dev/forms/Email%20Acknowledgement%20Letter.docx', 'email acknowledgement', '2025-10-15 01:37:24'),
(6, 'https://pub-287a8516365548cdb4ac9012e23f194a.r2.dev/forms/Emergency%20Leave%20Form%20.pdf', 'emergency leave', '2025-10-15 01:37:24'),
(7, 'https://pub-287a8516365548cdb4ac9012e23f194a.r2.dev/forms/Employee%20Information%20Form.docx', 'employee information', '2025-10-15 01:37:24'),
(8, 'https://pub-287a8516365548cdb4ac9012e23f194a.r2.dev/forms/General%20Acknowledgement%20Letter.docx', 'acknowledgement letter', '2025-10-15 01:39:54'),
(9, 'https://pub-287a8516365548cdb4ac9012e23f194a.r2.dev/forms/Leave%20Application%20Form.pdf', 'leave application', '2025-10-15 01:39:54'),
(10, 'https://pub-287a8516365548cdb4ac9012e23f194a.r2.dev/forms/Loan%20form.docx', 'loan', '2025-10-15 01:39:54'),
(11, 'https://pub-287a8516365548cdb4ac9012e23f194a.r2.dev/forms/Short%20Absent%20Form.pdf', 'short absent', '2025-10-15 01:41:10'),
(12, 'https://pub-287a8516365548cdb4ac9012e23f194a.r2.dev/forms/Sickness%20self-certificate.pdf', 'sickness self certificate', '2025-10-15 01:41:10'),
(16, 'https://lexcora.s3.us-east-2.amazonaws.com/forms/1761799816131-gw85ltifj37.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS4GY53D5CUSO22MU%2F20251030%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20251030T045044Z&X-Amz-Expires=604800&X-Amz-Signature=190f8db43590a3df971d6b07e7c1ef00107455639e1706dbfef494146eb3ba67&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', 'others', '2025-10-30 04:50:44'),
(17, 'https://lexcora.s3.us-east-2.amazonaws.com/forms/1761842349753-6oewermvb9n.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS4GY53D5CUSO22MU%2F20251030%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20251030T163910Z&X-Amz-Expires=604800&X-Amz-Signature=7eaa50fa993f6e5cfa246c568979c52d7316c9d0b18b803451fe61b5ffa59d12&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', 'others', '2025-10-30 16:39:10'),
(18, 'https://lexcora.s3.us-east-2.amazonaws.com/forms/1762022030239-7sa7eyjyzfb.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS4GY53D5CUSO22MU%2F20251101%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20251101T183350Z&X-Amz-Expires=604800&X-Amz-Signature=4ee25fcdb4e3679b9922157c6b71d9e7c8edb64e343cd85ae35b9e5e7c77e0de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', 'others', '2025-11-01 18:33:51');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `goaml`
--

CREATE TABLE `goaml` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `status` enum('compliant','safe','under_review') DEFAULT 'under_review',
  `note` text,
  `type` varchar(55) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `goaml`
--

INSERT INTO `goaml` (`id`, `name`, `phone`, `status`, `note`, `type`, `created_by`, `created_at`) VALUES
(7, '76543', '87654', 'compliant', NULL, 'Ù…Ù†Ø¸Ù…Ø©', 90, '2025-10-22 23:43:52'),
(8, 'Ø®Ù„ÙŠÙØ© Ù…Ø­Ù…Ø¯ ØªØ±ÙƒÙŠ Ø§Ù„Ø³Ø¨ÙŠØ¹ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø³Ø¨ÙŠØ¹ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL SUBAEY\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): KHALIFA MOHD T AL SUBAEY\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1964-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù‚Ø·Ø±\nØ§Ù„Ø§Ø³Ù…: Ø®Ù„ÙŠÙØ© Ù…Ø­Ù…Ø¯ ØªØ±ÙƒÙŠ Ø§Ù„Ø³Ø¨ÙŠØ¹ÙŠ\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ù‚Ø·Ø±\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 685868\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ù‚Ø·Ø±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:19'),
(9, 'Ø¹Ø¨Ø¯ Ø§Ù„Ù…Ù„Ùƒ Ù…Ø­Ù…Ø¯ ÙŠÙˆØ³Ù Ø¹Ø¨Ø¯ Ø§Ù„Ø³Ù„Ø§Ù…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø£Ø±Ø¯Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¹Ø¨Ø¯Ø§Ù„Ø³Ù„Ø§Ù…\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDELSALAM\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDULMALIK MOHAMMAD YOUSEF ABDELSALAM\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1989-07-12\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ø¹Ø±Ø§Ù‚\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯ Ø§Ù„Ù…Ù„Ùƒ Ù…Ø­Ù…Ø¯ ÙŠÙˆØ³Ù Ø¹Ø¨Ø¯ Ø§Ù„Ø³Ù„Ø§Ù…\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ù‚Ø·Ø±\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 475336\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„Ø£Ø±Ø¯Ù†\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø¥ØµØ¯Ø§Ø±: 2012-05-28\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:20'),
(10, 'Ø£Ø´Ø±Ù Ù…Ø­Ù…Ø¯ ÙŠÙˆØ³Ù Ø¹Ø«Ù…Ø§Ù† Ø¹Ø¨Ø¯ Ø§Ù„Ø³Ù„Ø§Ù…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø£Ø±Ø¯Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¹Ø¨Ø¯Ø§Ù„Ø³Ù„Ø§Ù…\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABD AL SALAM\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ASHRAF MUHAMMAD YUSUF UTHMAN ABD ALSALAM\nØ§Ù„Ø§Ø³Ù…: Ø£Ø´Ø±Ù Ù…Ø­Ù…Ø¯ ÙŠÙˆØ³Ù Ø¹Ø«Ù…Ø§Ù† Ø¹Ø¨Ø¯ Ø§Ù„Ø³Ù„Ø§Ù…\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:21'),
(11, 'Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø¹ÙŠØ³Ù‰ Ø§Ù„Ø­Ø¬ÙŠ Ù…Ø­Ù…Ø¯ Ø§Ù„Ø¨Ø§ÙƒØ±', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¨Ø§ÙƒØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-BAKR\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): IBRAHIM \'ISA HAJJI MUHAMMAD AL-BAKR\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1977-07-11\nØ§Ù„Ø§Ø³Ù…: Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø¹ÙŠØ³Ù‰ Ø§Ù„Ø­Ø¬ÙŠ Ù…Ø­Ù…Ø¯ Ø§Ù„Ø¨Ø§ÙƒØ± (Ø£Ø¨ÙˆØ®Ù„ÙŠÙ„)\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ù‚Ø·Ø±\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 01016646\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:21'),
(12, 'Ø¹Ø¨Ø¯ Ø§Ù„Ø¹Ø²ÙŠØ² Ø¨Ù† Ø®Ù„ÙŠÙØ© Ø§Ù„Ø¹Ø·ÙŠØ©', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¹Ø·ÙŠØ©\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ALATTIYAH\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDULAZIZ BIN KHALIFA ALATTIYAH\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯ Ø§Ù„Ø¹Ø²ÙŠØ² Ø¨Ù† Ø®Ù„ÙŠÙØ© Ø§Ù„Ø¹Ø·ÙŠØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:22'),
(13, 'Ø³Ø§Ù„Ù… Ø­Ø³Ù† Ø®Ù„ÙŠÙØ© Ø±Ø§Ø´Ø¯ Ø§Ù„ÙƒÙˆØ§Ø±ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„ÙƒÙˆØ§Ø±ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-KUWARI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SALIM HASAN KHALIFA RASHID AL-KUWARI\nØ§Ù„Ø§Ø³Ù…: Ø³Ø§Ù„Ù… Ø­Ø³Ù† Ø®Ù„ÙŠÙØ© Ø±Ø§Ø´Ø¯ Ø§Ù„ÙƒÙˆØ§Ø±ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:23'),
(14, 'Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ ØºØ§Ù†Ù… Ù…Ø­ÙÙˆØ¸ Ù…Ø³Ù„Ù… Ø§Ù„Ø®ÙˆØ§Ø±', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø®ÙˆØ§Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-KHAWAR\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDALLAH GHANIM MAHFUZ MUSLIM AL-KHAWAR\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1981-12-16\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ ØºØ§Ù†Ù… Ù…Ø­ÙÙˆØ¸ Ù…Ø³Ù„Ù… Ø§Ù„Ø®ÙˆØ§Ø±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:23'),
(15, 'Ø³Ø¹Ø¯ Ø¨Ù† Ø³Ø¹Ø¯ Ù…Ø­Ù…Ø¯ Ø§Ù„ÙƒØ¹Ø¨ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„ÙƒØ¹Ø¨ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-KA\'BI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SA\'D BIN SA\'D MUHAMMAD SHARIAN AL-KA\'BI\nØ§Ù„Ø§Ø³Ù…: Ø³Ø¹Ø¯ Ø¨Ù† Ø³Ø¹Ø¯ Ù…Ø­Ù…Ø¯ Ø§Ù„ÙƒØ¹Ø¨ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:24'),
(16, 'Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ø·ÙŠÙ Ø¨Ù† Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø§Ù„ÙƒÙˆØ§Ø±ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„ÙƒÙˆØ§Ø±ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-KUWARI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABD AL-LATIF BIN ABDALLAH SALIH MUHAMMAD AL-KAWARI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1973-09-27\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ø·ÙŠÙ Ø¨Ù† Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø§Ù„ÙƒÙˆØ§Ø±ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:25'),
(17, 'Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­Ù…Ù† Ø¨Ù† Ø¹Ù…ÙŠØ± Ø§Ù„Ù†Ø¹ÙŠÙ…ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ù†Ø¹ÙŠÙ…ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-NU\'AYMI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABD AL-RAHMAN BIN \'UMAYR AL-NU\'AYMI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1951-05-05\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­Ù…Ù† Ø¨Ù† Ø¹Ù…ÙŠØ± Ø§Ù„Ù†Ø¹ÙŠÙ…ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:25'),
(18, 'Ø¹Ø¨Ø¯ Ø§Ù„ÙˆÙ‡Ø§Ø¨ Ù…Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­Ù…Ù† Ø§Ù„Ø­Ù…ÙŠÙ‚Ø§Ù†ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø­Ù…ÙŠÙ‚Ø§Ù†ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-HUMAYQANI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABD AL-WAHHAB MUHAMMAD ABD AL-RAHMAN AL-HUMAYQANI\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯ Ø§Ù„ÙˆÙ‡Ø§Ø¨ Ù…Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­Ù…Ù† Ø§Ù„Ø­Ù…ÙŠÙ‚Ø§Ù†ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:26'),
(19, 'Ø­Ø¬Ø§Ø¬ Ø¨Ù† ÙÙ‡Ø¯ Ø­Ø¬Ø§Ø¬ Ù…Ø­Ù…Ø¯ Ø§Ù„Ø¹Ø¬Ù…ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙƒÙˆÙŠØª\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¹Ø¬Ù…ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-AJMI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HAJJAJ BIN FAHD HAJJAJ MUHAMMAD AL-AJMI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1987-08-09\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙƒÙˆÙŠØª\nØ§Ù„Ø§Ø³Ù…: Ø­Ø¬Ø§Ø¬ Ø¨Ù† ÙÙ‡Ø¯ Ø­Ø¬Ø§Ø¬ Ù…Ø­Ù…Ø¯ Ø§Ù„Ø¹Ø¬Ù…ÙŠ\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 107706887\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:26'),
(20, 'ÙŠÙˆØ³Ù Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø§Ù„Ù‚Ø±Ø¶Ø§ÙˆÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ù‚Ø±Ø¶Ø§ÙˆÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-QARADAWI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): YUSUF ABDULLAH AL-QARADAWI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1963-01-12\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: ÙŠÙˆØ³Ù Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø§Ù„Ù‚Ø±Ø¶Ø§ÙˆÙŠ\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ù‚Ø·Ø±\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 5113\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:27'),
(21, 'Ø¹Ù„ÙŠ Ù…Ø­Ù…Ø¯ Ù…Ø­Ù…Ø¯ Ø§Ù„ØµÙ„Ø§Ø¨ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù„ÙŠØ¨ÙŠØ§\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„ØµÙ„Ø§Ø¨ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-SALLABI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ALI MOHAMMED MOHAMMED AL-SALLABI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1975-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù„ÙŠØ¨ÙŠØ§\nØ§Ù„Ø§Ø³Ù…: Ø¹Ù„ÙŠ Ù…Ø­Ù…Ø¯ Ù…Ø­Ù…Ø¯ Ø§Ù„ØµÙ„Ø§Ø¨ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:27'),
(22, 'Ø¹Ø¨Ø¯ Ø§Ù„Ø­ÙƒÙŠÙ… Ø¨Ù„Ø­Ø§Ø¬', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù„ÙŠØ¨ÙŠØ§\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¨Ù„Ø­Ø§Ø¬\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): BELHAJ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABD AL-HAKIM BELHAJ\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1966-04-30\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù„ÙŠØ¨ÙŠØ§\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯ Ø§Ù„Ø­ÙƒÙŠÙ… Ø¨Ù„Ø­Ø§Ø¬\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 454365\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ù„ÙŠØ¨ÙŠØ§\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø§Ù†ØªÙ‡Ø§Ø¡: 2020-09-05\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:28'),
(23, 'Ù…Ù‡Ø¯ÙŠ Ø§Ù„Ø­Ø§Ø±Ø§ØªÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù„ÙŠØ¨ÙŠØ§\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø­Ø§Ø±Ø§ØªÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-HARATI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MAHDI AL-HARATI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-05-28\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù„ÙŠØ¨ÙŠØ§\nØ§Ù„Ø§Ø³Ù…: Ù…Ù‡Ø¯ÙŠ Ø§Ù„Ø­Ø§Ø±Ø§ØªÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:28'),
(24, 'Ø¥Ø³Ù…Ø§Ø¹ÙŠÙ„ Ù…Ø­Ù…Ø¯ Ù…Ø­Ù…Ø¯ Ø§Ù„ØµÙ„Ø§Ø¨ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù„ÙŠØ¨ÙŠØ§\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„ØµÙ„Ø§Ø¨ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-SALLABI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ISMAIL MOHAMMED MOHAMMED AL-SALLABI\nØ§Ù„Ø§Ø³Ù…: Ø¥Ø³Ù…Ø§Ø¹ÙŠÙ„ Ù…Ø­Ù…Ø¯ Ù…Ø­Ù…Ø¯ Ø§Ù„ØµÙ„Ø§Ø¨ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:29'),
(25, 'Ø§Ù„ØµØ§Ø¯Ù‚ Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­Ù…Ù† Ø¹Ù„ÙŠ Ø§Ù„ØºØ±ÙŠØ§Ù†ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù„ÙŠØ¨ÙŠØ§\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„ØºØ±ÙŠØ§Ù†ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-QHRIANY\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-SADIQ ABD-ALRAHMAN ALI AL-QHRIANY\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1942-12-07\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø·Ø±Ø§Ø¨Ù„Ø³ - Ù„ÙŠØ¨ÙŠØ§\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„ØµØ§Ø¯Ù‚ Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­Ù…Ù† Ø¹Ù„ÙŠ Ø§Ù„ØºØ±ÙŠØ§Ù†ÙŠ\nØ§Ù„Ù…Ø¯ÙŠÙ†Ø©: Ø·Ø±Ø§Ø¨Ù„Ø³\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ù„ÙŠØ¨ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:30'),
(26, 'Ù…Ø­Ù…Ø¯ Ø£Ø­Ù…Ø¯ Ø´ÙˆÙ‚ÙŠ Ø§Ù„Ø¥Ø³Ù„Ø§Ù…Ø¨ÙˆÙ„ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø§Ø³Ù„Ø§Ù…Ø¨ÙˆÙ„ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ISLAMBOULI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMED AHMED SHAWQI ISLAMBOULI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1952-01-20\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù†Ø¬Ø¹ Ø­Ù…Ø§Ø¯ÙŠ-Ù‚Ù†Ø§\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø£Ø­Ù…Ø¯ Ø´ÙˆÙ‚ÙŠ Ø§Ù„Ø¥Ø³Ù„Ø§Ù…Ø¨ÙˆÙ„ÙŠ\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 304555\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ù…ØµØ±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:30'),
(27, 'Ø·Ø§Ø±Ù‚ Ø¹Ø¨Ø¯ Ø§Ù„Ù…ÙˆØ¬ÙˆØ¯ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø§Ù„Ø²Ù…Ø±', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø²Ù…Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-ZUMAR\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): TAREK ABD AL-MAWGOUD IBRAHIM AL-ZUMAR\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1959-05-14\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ø·Ø§Ø±Ù‚ Ø¹Ø¨Ø¯ Ø§Ù„Ù…ÙˆØ¬ÙˆØ¯ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø§Ù„Ø²Ù…Ø±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:31'),
(28, 'Ù…Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù…Ù‚ØµÙˆØ¯ Ù…Ø­Ù…Ø¯ Ø¹ÙÙŠÙÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¹ÙÙŠÙÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AFIFI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMED ABD AL-MAQSOUD MOHAMMED AFIFI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1947-07-13\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù…Ù‚ØµÙˆØ¯ Ù…Ø­Ù…Ø¯ Ø¹ÙÙŠÙÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:31'),
(29, 'Ù…Ø­Ù…Ø¯ Ø§Ù„ØµØºÙŠØ± Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­ÙŠÙ… Ù…Ø­Ù…Ø¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ù…Ø­Ù…Ø¯\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMED\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMAD ELSAGHEER ABD AL-RAHIM MOHAMMED\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1970-04-12\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ± - Ø§Ù„Ù‚Ø§Ù‡Ø±Ø©\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø§Ù„ØµØºÙŠØ± Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­ÙŠÙ… Ù…Ø­Ù…Ø¯\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: A08670835\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ù…ØµØ±\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø§Ù†ØªÙ‡Ø§Ø¡: 2019-12-31\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:32'),
(30, 'ÙˆØ¬Ø¯ÙŠ Ø¹Ø¨Ø¯ Ø§Ù„Ø­Ù…ÙŠØ¯ Ù…Ø­Ù…Ø¯ ØºÙ†ÙŠÙ…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): ØºÙ†ÙŠÙ…\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): GHONIEM\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): WAGDY ABDEL HAMIED MOHAMED GHONIEM\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1951-08-01\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø³ÙˆÙ‡Ø§Ø¬ - Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: ÙˆØ¬Ø¯ÙŠ Ø¹Ø¨Ø¯ Ø§Ù„Ø­Ù…ÙŠØ¯ Ù…Ø­Ù…Ø¯ ØºÙ†ÙŠÙ…\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 4155047\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ù…ØµØ±\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø§Ù†ØªÙ‡Ø§Ø¡: 2015-07-04\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:32'),
(31, 'Ø­Ø³Ù† Ø£Ø­Ù…Ø¯ Ø­Ø³Ù† Ù…Ø­Ù…Ø¯ Ø§Ù„Ø¯Ù‚ÙŠ Ø§Ù„Ù‡ÙˆØªÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø§Ù…Ø§Ø±Ø§Øª\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ù‡ÙˆØªÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-HOUTI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HASSAN AHMED HASSAN MOHAMED AL-DIQQI AL-HOUTI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1957-01-02\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ø´Ø§Ø±Ù‚Ø©\nØ§Ù„Ø§Ø³Ù…: Ø­Ø³Ù† Ø£Ø­Ù…Ø¯ Ø­Ø³Ù† Ù…Ø­Ù…Ø¯ Ø§Ù„Ø¯Ù‚ÙŠ Ø§Ù„Ù‡ÙˆØªÙŠ\nØ§Ù„Ø´Ø§Ø±Ø¹: Ø¨Ø´Ø§Ùƒ Ø´Ù‡ÙŠØ±\nØ§Ù„Ù…Ø¯ÙŠÙ†Ø©: Ø¥Ø³Ø·Ù†Ø¨ÙˆÙ„\nØ§Ù„Ø¯ÙˆÙ„Ø©: ØªØ±ÙƒÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø§Ù„Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 2116728\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„Ø§Ù…Ø§Ø±Ø§Øª\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø¥ØµØ¯Ø§Ø±: 2008-07-23\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø§Ù†ØªÙ‡Ø§Ø¡: 2013-07-22\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:33'),
(32, 'Ø­Ø§ÙƒÙ… Ø¹Ø¨ÙŠØ³Ø§Ù† Ø§Ù„Ø­Ù…ÙŠØ¯ÙŠ Ø§Ù„Ù…Ø·ÙŠØ±ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø³Ø¹ÙˆØ¯ÙŠØ© / Ø§Ù„ÙƒÙˆÙŠØª\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ù…Ø·ÙŠØ±ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-MUTAIRI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HAKEM OBAYSAN AL-HAMIDI AL-MUTAIRI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1964-11-06\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙƒÙˆÙŠØª\nØ§Ù„Ø§Ø³Ù…: Ø­Ø§ÙƒÙ… Ø¹Ø¨ÙŠØ³Ø§Ù† Ø§Ù„Ø­Ù…ÙŠØ¯ÙŠ Ø§Ù„Ù…Ø·ÙŠØ±ÙŠ\nØ§Ù„Ø´Ø§Ø±Ø¹: Ø¨Ø´Ø§Ùƒ Ø´Ù‡ÙŠØ±\nØ§Ù„Ù…Ø¯ÙŠÙ†Ø©: Ø¥Ø³Ø·Ù†Ø¨ÙˆÙ„\nØ§Ù„Ø¯ÙˆÙ„Ø©: ØªØ±ÙƒÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø§Ù„Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 3229745\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„ÙƒÙˆÙŠØª\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø¥ØµØ¯Ø§Ø±: 16/05/2011\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø§Ù†ØªÙ‡Ø§Ø¡: 2021-05-14\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:34'),
(33, 'Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ù…Ø­Ù…Ø¯ Ø¨Ù† Ø³Ù„ÙŠÙ…Ø§Ù† Ø§Ù„Ù…Ø­ÙŠØ³Ù†ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø³Ø¹ÙˆØ¯ÙŠÙ‡\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ù…Ø­ÙŠØ³Ù†ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-MUHAYSINI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDALLAH MUHAMMAD BIN SULAYMAN AL-MUHAYSINI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1987-10-29\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ù…Ø­Ù…Ø¯ Ø¨Ù† Ø³Ù„ÙŠÙ…Ø§Ù† Ø§Ù„Ù…Ø­ÙŠØ³Ù†ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:34'),
(34, 'Ø­Ø§Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø£Ø­Ù…Ø¯ Ø§Ù„Ø¹Ù„ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙƒÙˆÙŠØª\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¹Ù„ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-ALI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HAMID ABDALLAH AHMAD AL-ALI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1960-01-19\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙƒÙˆÙŠØª\nØ§Ù„Ø§Ø³Ù…: Ø­Ø§Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø£Ø­Ù…Ø¯ Ø§Ù„Ø¹Ù„ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:35'),
(35, 'Ø£ÙŠÙ…Ù† Ø£Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„ØºÙ†ÙŠ Ø­Ø³Ù†ÙŠÙ†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø­Ø³Ù†ÙŠÙ†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HASSANEIN\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AYMAN AHMED ABDUL GHANI HASSANEIN\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1964-10-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ø£ÙŠÙ…Ù† Ø£Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„ØºÙ†ÙŠ Ø­Ø³Ù†ÙŠÙ†\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ù…ØµØ±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:35'),
(36, 'Ø¹Ø§ØµÙ… Ø¹Ø¨Ø¯ Ø§Ù„Ù…Ø§Ø¬Ø¯ Ù…Ø­Ù…Ø¯ Ù…Ø§Ø¶ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ù…Ø§Ø¶ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MADI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ASSEM ABDEL-MAGED MOHAMMED MADI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-05-11\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ± (Ø§Ù„Ù…ÙŠÙ†Ø§)\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø§ØµÙ… Ø¹Ø¨Ø¯ Ø§Ù„Ù…Ø§Ø¬Ø¯ Ù…Ø­Ù…Ø¯ Ù…Ø§Ø¶ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:36'),
(37, 'ÙŠØ­ÙŠÙ‰ Ø¹Ù‚ÙŠÙ„ Ø³Ø§Ù„Ù…Ø§Ù† Ø¹Ù‚ÙŠÙ„', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¹Ù‚ÙŠÙ„\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AQEEL\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): YAHYA AQIL SALMAN AQEEL\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: ÙŠØ­ÙŠÙ‰ Ø¹Ù‚ÙŠÙ„ Ø³Ø§Ù„Ù…Ø§Ù† Ø¹Ù‚ÙŠÙ„\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:37'),
(38, 'Ù…Ø­Ù…Ø¯ Ø­Ù…Ø§Ø¯Ø© Ø§Ù„Ø³ÙŠØ¯ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ…\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): IBRAHIM\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMED HAMADA EL-SAYED IBRAHIM\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1982-01-19\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø­Ù…Ø§Ø¯Ø© Ø§Ù„Ø³ÙŠØ¯ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ…\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 11180132\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ù…ØµØ±\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø¥ØµØ¯Ø§Ø±: 2012-12-31\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:38'),
(39, 'Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­Ù…Ù† Ù…Ø­Ù…Ø¯ Ø´ÙƒØ±ÙŠ Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­Ù…Ù†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¹Ø¨Ø¯Ø§Ù„Ø±Ø­Ù…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDEL RAHMAN\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDEL RAHMAN MOHAMED SHOKRY ABDEL RAHMAN\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-04-30\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­Ù…Ù† Ù…Ø­Ù…Ø¯ Ø´ÙƒØ±ÙŠ Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­Ù…Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:38'),
(40, 'Ø­Ø³ÙŠÙ† Ù…Ø­Ù…Ø¯ Ø±Ø¶Ø§ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… ÙŠÙˆØ³Ù', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): ÙŠÙˆØ³Ù\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): YOUSSEF\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HUSSEIN MOHAMED REZA IBRAHIM YOUSSEF\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ø­Ø³ÙŠÙ† Ù…Ø­Ù…Ø¯ Ø±Ø¶Ø§ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… ÙŠÙˆØ³Ù\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:39'),
(41, 'Ø£Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ø­Ø§ÙØ¸ Ù…Ø­Ù…ÙˆØ¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù‡Ø¯Ù‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¹Ø¨Ø¯Ø§Ù„Ù‡Ø¯Ù‰\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDELHADY\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AHMED ABDELHAFID MAHMOUD ABDELHADY\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ø£Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ø­Ø§ÙØ¸ Ù…Ø­Ù…ÙˆØ¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù‡Ø¯Ù‰\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:39'),
(42, 'Ù…Ø³Ù„Ù… ÙØ¤Ø§Ø¯ Ø·Ø±ÙØ§Ù†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø·Ø±ÙØ§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): TARFAN\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MUSLIM FOUAD TARFAN\nØ§Ù„Ø§Ø³Ù…: Ù…Ø³Ù„Ù… ÙØ¤Ø§Ø¯ Ø·Ø±ÙØ§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:40'),
(43, 'Ø£ÙŠÙ…Ù† Ù…Ø­Ù…ÙˆØ¯ ØµØ§Ø¯Ù‚ Ø±ÙØ¹Øª', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø±ÙØ¹Øª\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): RIFAT\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AYMAN MAHMOUD SADEQ RIFAT\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-05-23\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ± (Ø§Ù„Ø¬ÙŠØ²Ø©)\nØ§Ù„Ø§Ø³Ù…: Ø£ÙŠÙ…Ù† Ù…Ø­Ù…ÙˆØ¯ ØµØ§Ø¯Ù‚ Ø±ÙØ¹Øª\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:41'),
(44, 'Ù…Ø­Ù…Ø¯ Ø³Ø¹Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù†Ø¹ÙŠÙ… Ø£Ø­Ù…Ø¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø£Ø­Ù…Ø¯\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AHMED\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMED SAAD ABDEL-NAIM AHMED\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø³Ø¹Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù†Ø¹ÙŠÙ… Ø£Ø­Ù…Ø¯\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:41'),
(45, 'Ù…Ø­Ù…Ø¯ Ø³Ø¹Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù…Ø·Ù„Ø¨ Ø¹Ø¨Ø¯Ù‡ Ø§Ù„Ø±Ø§Ø²ÙÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø±Ø§Ø²Ù‚ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-RAZAKI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMED SAAD ABDEL MUTTALIB ABDO AL-RAZAFI\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø³Ø¹Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù…Ø·Ù„Ø¨ Ø¹Ø¨Ø¯Ù‡ Ø§Ù„Ø±Ø§Ø²ÙÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:42'),
(46, 'Ø£Ø­Ù…Ø¯ ÙØ¤Ø§Ø¯ Ø£Ø­Ù…Ø¯ Ø¬Ø§Ø¯ Ø¨Ù„ØªØ§Ø¬ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¨Ù„ØªØ§Ø¬ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): BELTAGY\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AHMED FOUAD AHMED GAD BELTAGY\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1979-12-31\nØ§Ù„Ø§Ø³Ù…: Ø£Ø­Ù…Ø¯ ÙØ¤Ø§Ø¯ Ø£Ø­Ù…Ø¯ Ø¬Ø§Ø¯ Ø¨Ù„ØªØ§Ø¬ÙŠ\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 1147218\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ù…ØµØ±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:43'),
(47, 'Ø£Ø­Ù…Ø¯ Ø±Ø¬Ø¨ Ø±Ø¬Ø¨ Ø³Ù„ÙŠÙ…Ø§Ù†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø³Ù„ÙŠÙ…Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SOLIMAN\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AHMED RAGEB RAGEB SOLIMAN\nØ§Ù„Ø§Ø³Ù…: Ø£Ø­Ù…Ø¯ Ø±Ø¬Ø¨ Ø±Ø¬Ø¨ Ø³Ù„ÙŠÙ…Ø§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:43'),
(48, 'ÙƒØ±ÙŠÙ… Ù…Ø­Ù…Ø¯ Ù…Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ø¹Ø²ÙŠØ²', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¹Ø¨Ø¯Ø§Ù„Ø¹Ø²ÙŠØ²\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDEL AZIZ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): KARIM MOHAMED MOHAMED ABDEL AZIZ\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: ÙƒØ±ÙŠÙ… Ù…Ø­Ù…Ø¯ Ù…Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ø¹Ø²ÙŠØ²\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:44'),
(49, 'Ø¹Ù„ÙŠ Ø²ÙƒÙŠ Ù…Ø­Ù…Ø¯ Ø¹Ù„ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¹Ù„ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ALI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ALI ZAKI MOHAMMED ALI\nØ§Ù„Ø§Ø³Ù…: Ø¹Ù„ÙŠ Ø²ÙƒÙŠ Ù…Ø­Ù…Ø¯ Ø¹Ù„ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:44'),
(50, 'Ù†Ø§Ø¬ÙŠ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø§Ù„Ø¹Ø²ÙˆÙ„ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¹Ø²ÙˆÙ„ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): EZZOULI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): NAJI IBRAHIM EZZOULI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ù†Ø§Ø¬ÙŠ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø§Ù„Ø¹Ø²ÙˆÙ„ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:45'),
(51, 'Ø´Ø­Ø§ØªØ© ÙØªØ­ÙŠ Ø­Ø§ÙØ¸ Ù…Ø­Ù…Ø¯ Ø³Ù„ÙŠÙ…Ø§Ù†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø³Ù„ÙŠÙ…Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SULEIMAN\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SHEHATA FATHI HAFEZ MOHAMMED SULEIMAN\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ø´Ø­Ø§ØªØ© ÙØªØ­ÙŠ Ø­Ø§ÙØ¸ Ù…Ø­Ù…Ø¯ Ø³Ù„ÙŠÙ…Ø§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:45'),
(52, 'Ù…Ø­Ù…Ø¯ Ù…Ø­Ø±Ù… ÙÙ‡Ù…ÙŠ Ø£Ø¨Ùˆ Ø²ÙŠØ¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø£Ø¨Ùˆ Ø²ÙŠØ¯\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABU ZEID\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MUHAMMAD MUHARRAM FAHMI ABU ZEID\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ù…Ø­Ø±Ù… ÙÙ‡Ù…ÙŠ Ø£Ø¨Ùˆ Ø²ÙŠØ¯\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:46'),
(53, 'Ø¹Ù…Ø±Ùˆ Ø¹Ø¨Ø¯ Ø§Ù„Ù†Ø§ØµØ± Ø¹Ø¨Ø¯ Ø§Ù„Ø­Ù‚ Ø¹Ø¨Ø¯ Ø§Ù„Ø¨Ø§Ø±ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¹Ø¨Ø¯Ø§Ù„Ø¨Ø§Ø±ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDEL-BARRY\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AMR ABDEL NASSER ABDELHAK ABDEL-BARRY\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ø¹Ù…Ø±Ùˆ Ø¹Ø¨Ø¯ Ø§Ù„Ù†Ø§ØµØ± Ø¹Ø¨Ø¯ Ø§Ù„Ø­Ù‚ Ø¹Ø¨Ø¯ Ø§Ù„Ø¨Ø§Ø±ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:47'),
(54, 'Ø¹Ù„ÙŠ Ø­Ø³Ù† Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø¹Ø¨Ø¯ Ø§Ù„Ø¸Ø§Ù‡Ø±', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¸Ø§Ù‡Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDEL-ZAHER\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ALI HASSAN IBRAHIM ABDEL-ZAHER\nØ§Ù„Ø§Ø³Ù…: Ø¹Ù„ÙŠ Ø­Ø³Ù† Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø¹Ø¨Ø¯ Ø§Ù„Ø¸Ø§Ù‡Ø±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:47'),
(55, 'Ù…Ø±ØªØ¶Ù‰ Ù…Ø¬ÙŠØ¯ Ø§Ù„Ø³Ù†Ø¯ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø¨Ø­Ø±ÙŠÙ†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø³Ù†Ø¯ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-SINDI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MURTADHA MAJEED AL-SINDI\nØ§Ù„Ø§Ø³Ù…: Ù…Ø±ØªØ¶Ù‰ Ù…Ø¬ÙŠØ¯ Ø§Ù„Ø³Ù†Ø¯ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:48'),
(56, 'Ø£Ø­Ù…Ø¯ Ø§Ù„Ø­Ø³Ù† Ø§Ù„Ø¯Ø¹Ø³ÙƒÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø¨Ø­Ø±ÙŠÙ†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¯Ø¹Ø³ÙƒÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-DASKI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AHMED AL-HASSAN AL-DASKI\nØ§Ù„Ø§Ø³Ù…: Ø£Ø­Ù…Ø¯ Ø§Ù„Ø­Ø³Ù† Ø§Ù„Ø¯Ø¹Ø³ÙƒÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:48'),
(57, 'Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ù…Ø­Ù…Ø¯ Ø¹Ù„ÙŠ Ø§Ù„ÙŠØ²ÙŠØ¯ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„ÙŠØ²ÙŠØ¯ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-YAZIDI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDULLAH MOHAMMED AL-YAZIDI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1956-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ù…Ø­Ù…Ø¯ Ø¹Ù„ÙŠ Ø§Ù„ÙŠØ²ÙŠØ¯ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:49'),
(58, 'Ø£Ø­Ù…Ø¯ Ø¹Ù„ÙŠ Ø£Ø­Ù…Ø¯ Ø¨Ø±Ø¹ÙˆØ¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¨Ø±Ø¹ÙˆØ¯\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): BAROAUD\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AHMED ALI AHMED BAROAUD\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1964-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù…: Ø£Ø­Ù…Ø¯ Ø¹Ù„ÙŠ Ø£Ø­Ù…Ø¯ Ø¨Ø±Ø¹ÙˆØ¯\nØ§Ù„Ù…Ø¯ÙŠÙ†Ø©: Ø­Ø¶Ø±Ù…ÙˆØª\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø§Ù„ÙŠÙ…Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:50'),
(59, 'Ù…Ø­Ù…Ø¯ Ø¨ÙƒØ± Ø§Ù„Ø¯Ø¨Ø§Ø¡', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¯Ø¨Ø§Ø¡\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-DABAA\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMED BAKR AL-DABAA\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1958-01-07\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø¨ÙƒØ± Ø§Ù„Ø¯Ø¨Ø§Ø¡\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø§Ù„ÙŠÙ…Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:50'),
(60, 'Ø­Ø§Ù…Ø¯ Ø­Ù…Ø¯ Ø­Ø§Ù…Ø¯ Ø§Ù„Ø¹Ù„ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙƒÙˆÙŠØª\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¹Ù„ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-\'ALI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HAMID HAMAD HAMID AL-\'ALI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1960-02-16\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙƒÙˆÙŠØª\nØ§Ù„Ø§Ø³Ù…: Ø­Ø§Ù…Ø¯ Ø­Ù…Ø¯ Ø­Ø§Ù…Ø¯ Ø§Ù„Ø¹Ù„ÙŠ\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 101505554\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„ÙƒÙˆÙŠØª\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:51'),
(61, 'Ø§Ù„Ø³Ø§Ø¹Ø¯ÙŠ Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø£Ø¨Ùˆ Ø®Ø²ÙŠÙ…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù„ÙŠØ¨ÙŠØ§\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø£Ø¨Ùˆ Ø®Ø²ÙŠÙ…\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): BUKHAZEM\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-SAADI ABDULLAH IBRAHIM BUKHAZEM\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1981-11-20\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù„ÙŠØ¨ÙŠØ§\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø³Ø§Ø¹Ø¯ÙŠ Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø£Ø¨Ùˆ Ø®Ø²ÙŠÙ…\nØ§Ù„Ù…Ø¯ÙŠÙ†Ø©: Ø£Ø¬Ø¯Ø§Ø¨ÙŠØ§\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ù„ÙŠØ¨ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ù„ÙŠØ¨ÙŠØ§\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø¥ØµØ¯Ø§Ø±: 2019-09-10\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø§Ù†ØªÙ‡Ø§Ø¡: 2025-09-09\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:52'),
(62, 'Ø£Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ø¬Ù„ÙŠÙ„ Ø§Ù„Ø­Ø³Ù†Ø§ÙˆÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù„ÙŠØ¨ÙŠØ§\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø­Ø³Ù†Ø§ÙˆÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-HASNAWI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AHMED ABD AL-JALEEL AL-HASNAWI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù„ÙŠØ¨ÙŠØ§\nØ§Ù„Ø§Ø³Ù…: Ø£Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ø¬Ù„ÙŠÙ„ Ø§Ù„Ø­Ø³Ù†Ø§ÙˆÙŠ\nØ§Ù„Ø´Ø§Ø±Ø¹: Ø­ÙŠ Ø§Ù„Ø´Ø§Ø±Ø¨\nØ§Ù„Ù…Ø¯ÙŠÙ†Ø©: Ø£ÙˆØ¨Ø§Ø±ÙŠ\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ù„ÙŠØ¨ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 54390612\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ù„ÙŠØ¨ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:52'),
(63, 'Ù†Ø§ÙŠÙ ØµØ§Ù„Ø­ Ø³Ø§Ù„Ù… Ø§Ù„Ù‚ÙŠØ³ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ù‚ÙŠØ³ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-QAYSI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): NAYIF SALIH SALIM AL-QAYSI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-05\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù…: Ù†Ø§ÙŠÙ ØµØ§Ù„Ø­ Ø³Ø§Ù„Ù… Ø§Ù„Ù‚ÙŠØ³ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (45) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:53'),
(64, 'Ù‡Ø§Ø´Ù… Ù…Ø­Ø³Ù† Ø¹ÙŠØ¯Ø±ÙˆØ³', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¹ÙŠØ¯Ø±ÙˆØ³\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AYDARUS\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HASHIM MUHSIN AYDARUS\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1985-12-11\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¬Ø¯Ø© - Ø§Ù„Ù…Ù…Ù„ÙƒØ© Ø§Ù„Ø¹Ø±Ø¨ÙŠØ© Ø§Ù„Ø³Ø¹ÙˆØ¯ÙŠØ©\nØ§Ù„Ø§Ø³Ù…: Ù‡Ø§Ø´Ù… Ù…Ø­Ø³Ù† Ø¹ÙŠØ¯Ø±ÙˆØ³\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (45) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:54'),
(65, 'Ù†Ø´ÙˆØ§Ù† Ø§Ù„Ø¹Ø¯Ù†ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¹Ø¯Ù†ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-ADANI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): NASHWAN AL-ADANI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1988-01-12\nØ§Ù„Ø§Ø³Ù…: Ù†Ø´ÙˆØ§Ù† Ø§Ù„Ø¹Ø¯Ù†ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (45) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:54'),
(66, 'Ø®Ø§Ù„Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø§Ù„Ù…Ø±ÙØ¯ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ù…Ø±ÙØ¯ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-MARFADI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): KHALID ABDULLAH AL-MARFADI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1966-09-03\nØ§Ù„Ø§Ø³Ù…: Ø®Ø§Ù„Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø§Ù„Ù…Ø±ÙØ¯ÙŠ\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø§Ù„ÙŠÙ…Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (45) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:55'),
(67, 'Ø³ÙŠÙ Ø§Ù„Ø±Ø¨ Ø³Ø§Ù„Ù… Ø§Ù„Ø­ÙŠØ´ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø­ÙŠØ´ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-HEESHI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SAIFULRAB SALIM AL-HEESHI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1977-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù…: Ø³ÙŠÙ Ø§Ù„Ø±Ø¨ Ø³Ø§Ù„Ù… Ø§Ù„Ø­ÙŠØ´ÙŠ\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø§Ù„ÙŠÙ…Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (45) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:56'),
(68, 'Ø¹Ø§Ø¯Ù„ Ø¹Ø¨Ø¯Ù‡ ÙØ§Ø±ÙŠ Ø¹Ø«Ù…Ø§Ù† Ø§Ù„Ø°Ù‡Ø¨Ø§Ù†ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø°Ù‡Ø¨Ø§Ù†ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-THAHBANI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ADEL ABDU FARI OTHMAN AL-THAHBANI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1963-07-14\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø§Ø¯Ù„ Ø¹Ø¨Ø¯Ù‡ ÙØ§Ø±ÙŠ Ø¹Ø«Ù…Ø§Ù† Ø§Ù„Ø°Ù‡Ø¨Ø§Ù†ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (45) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:56'),
(69, 'Ø±Ø¶ÙˆØ§Ù† Ù‚Ù†Ø§Ù†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ù‚Ù†Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): QANAN\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): RADWAN QANAN\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1988-01-12\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù…: Ø±Ø¶ÙˆØ§Ù† Ù‚Ù†Ø§Ù†\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø§Ù„ÙŠÙ…Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (45) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:57'),
(70, 'ÙˆØ§Ù„ÙŠ Ù†Ø´ÙˆØ§Ù† Ø§Ù„ÙŠØ§ÙØ¹ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„ÙŠØ§ÙØ¹ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-YAFI\'I\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): WALI NASHWAN AL-YAFI\'I\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-06\nØ§Ù„Ø§Ø³Ù…: ÙˆØ§Ù„ÙŠ Ù†Ø´ÙˆØ§Ù† Ø§Ù„ÙŠØ§ÙØ¹ÙŠ\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø§Ù„ÙŠÙ…Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (45) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:57'),
(71, 'Ø®Ø§Ù„Ø¯ Ø³Ø¹ÙŠØ¯ ØºØ§Ø¨Ø´ Ø§Ù„Ø¹Ø¨ÙŠØ¯ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¹Ø¨ÙŠØ¯ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-UBAYDI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): KHALID SA\'ID GHABISH AL-UBAYDI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1986-11-17\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù…: Ø®Ø§Ù„Ø¯ Ø³Ø¹ÙŠØ¯ ØºØ§Ø¨Ø´ Ø§Ù„Ø¹Ø¨ÙŠØ¯ÙŠ\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø§Ù„ÙŠÙ…Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (45) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:58'),
(72, 'Ø¨Ù„Ø§Ù„ Ø¹Ù„ÙŠ Ø§Ù„ÙˆØ§ÙÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„ÙˆØ§ÙÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-WAFI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): BILAL ALI AL-WAFI\nØ§Ù„Ø§Ø³Ù…: Ø¨Ù„Ø§Ù„ Ø¹Ù„ÙŠ Ø§Ù„ÙˆØ§ÙÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (45) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:22:59'),
(73, 'Ø®Ø§Ù„Ø¯ Ù†Ø§Ø¸Ù… Ø¯ÙŠØ§Ø¨', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø£Ù…Ø±ÙŠÙƒØ§\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¯ÙŠØ§Ø¨\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): DIAB\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): KHALID NAZEM DIAB\nØ§Ù„Ø§Ø³Ù…: Ø®Ø§Ù„Ø¯ Ù†Ø§Ø¸Ù… Ø¯ÙŠØ§Ø¨\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (53) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:00'),
(74, 'Ø¯.Ø³Ø§Ù„Ù… Ø¬Ø§Ø¨Ø± Ø¹Ù…Ø± Ø¹Ù„ÙŠ Ø³Ù„Ø·Ø§Ù† ÙØªØ­ Ø§Ù„Ù„Ù‡ Ø¬Ø§Ø¨Ø±', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù„ÙŠØ¨ÙŠØ§\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¬Ø§Ø¨Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): JABER\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SALEM JABER OMAR ALI SULTAN FATHALLAH JABER\nØ§Ù„Ø§Ø³Ù…: Ø¯.Ø³Ø§Ù„Ù… Ø¬Ø§Ø¨Ø± Ø¹Ù…Ø± Ø¹Ù„ÙŠ Ø³Ù„Ø·Ø§Ù† ÙØªØ­ Ø§Ù„Ù„Ù‡ Ø¬Ø§Ø¨Ø±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (53) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:00'),
(75, 'Ù…ÙŠØ³Ø± Ø¹Ù„ÙŠ Ù…ÙˆØ³Ù‰ Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ Ø§Ù„Ø¬Ø¨ÙˆØ±ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¬Ø¨ÙˆØ±ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-JUBURI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MAYSAR ALI MUSA ABDALLAH AL-JUBURI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1976-05-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ø¹Ø±Ø§Ù‚\nØ§Ù„Ø§Ø³Ù…: Ù…ÙŠØ³Ø± Ø¹Ù„ÙŠ Ù…ÙˆØ³Ù‰ Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ Ø§Ù„Ø¬Ø¨ÙˆØ±ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (53) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:01'),
(76, 'Ù…Ø­Ù…Ø¯ Ø¹Ù„ÙŠ Ø³Ø¹ÙŠØ¯ Ø£ØªÙ…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø£ØªÙ…\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ATM\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMED ALI SAEED ATM\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø¹Ù„ÙŠ Ø³Ø¹ÙŠØ¯ Ø£ØªÙ…\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (53) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:02'),
(77, 'Ø­Ø³Ù† Ø¹Ù„ÙŠ Ù…Ø­Ù…Ø¯ Ø¬Ù…Ø¹Ø© Ø³Ù„Ø·Ø§Ù†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø¨Ø­Ø±ÙŠÙ†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø³Ù„Ø·Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SULTAN\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HASAN ALI MOHAMMED JUMA\'A SULTAN\nØ§Ù„Ø§Ø³Ù…: Ø­Ø³Ù† Ø¹Ù„ÙŠ Ù…Ø­Ù…Ø¯ Ø¬Ù…Ø¹Ø© Ø³Ù„Ø·Ø§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (53) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:02'),
(78, 'ÙŠØ­ÙŠÙ‰ Ø§Ù„Ø³ÙŠØ¯ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ù…Ø­Ù…Ø¯ Ù…ÙˆØ³Ù‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ù…ÙˆØ³Ù‰\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOUSA\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): YAHIA AL SAYED IBRAHIM MOHAMED MOUSA\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1984-05-04\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: ÙŠØ­ÙŠÙ‰ Ø§Ù„Ø³ÙŠØ¯ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ù…Ø­Ù…Ø¯ Ù…ÙˆØ³Ù‰\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (53) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:03'),
(79, 'Ù…Ø­Ù…Ø¯ Ø¬Ù…Ø§Ù„ Ø£Ø­Ù…Ø¯ Ø­Ø´Ù…Øª Ø¹Ø¨Ø¯Ø§Ù„Ø­Ù…ÙŠØ¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¹Ø¨Ø¯Ø§Ù„Ø­Ù…ÙŠØ¯\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDELHAMEED\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMED GAMAL AHMED HESHMAT ABDELHAMEED\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-05-09\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø¬Ù…Ø§Ù„ Ø£Ø­Ù…Ø¯ Ø­Ø´Ù…Øª Ø¹Ø¨Ø¯Ø§Ù„Ø­Ù…ÙŠØ¯\nØ§Ù„Ø¯ÙˆÙ„Ø©: ØªØ±ÙƒÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (53) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:03'),
(80, 'Ø§Ù„Ø³ÙŠØ¯ Ù…Ø­Ù…ÙˆØ¯ Ø¹Ø²Øª Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø¹ÙŠØ³Ù‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¹ÙŠØ³Ù‰\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): EISSA\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ALSAYED MAHMOUD EZZAT IBRAHIM EISSA\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-04-27\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø³ÙŠØ¯ Ù…Ø­Ù…ÙˆØ¯ Ø¹Ø²Øª Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø¹ÙŠØ³Ù‰\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ù…ØµØ± - Ù…Ø³Ø¬ÙˆÙ†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (53) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:04'),
(81, 'Ù‚Ø¯Ø±ÙŠ Ù…Ø­Ù…Ø¯ ÙÙ‡Ù…ÙŠ Ù…Ø­Ù…ÙˆØ¯ Ø§Ù„Ø´ÙŠØ®', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø´ÙŠØ®\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-SHAIKH\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): QADRI MOHAMMED FAHIM MAHMOUD AL-SHAIKH\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1972-11-01\nØ§Ù„Ø§Ø³Ù…: Ù‚Ø¯Ø±ÙŠ Ù…Ø­Ù…Ø¯ ÙÙ‡Ù…ÙŠ Ù…Ø­Ù…ÙˆØ¯ Ø§Ù„Ø´ÙŠØ®\nØ§Ù„Ù…Ø¯ÙŠÙ†Ø©: Ø¥Ø³Ø·Ù†Ø¨ÙˆÙ„\nØ§Ù„Ø¯ÙˆÙ„Ø©: ØªØ±ÙƒÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 618452\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ù…ØµØ±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (53) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:05'),
(82, 'Ø¹Ù„Ø§Ø¡ Ø¹Ù„ÙŠ Ø¹Ù„ÙŠ Ù…Ø­Ù…Ø¯ Ø§Ù„Ø³Ù…Ø§Ø­ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù…ØµØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø³Ù…Ø§Ø­ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-SAMAHI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ALAA ALI ALI MOHAMMED AL-SAMAHI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1975-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù…ØµØ±\nØ§Ù„Ø§Ø³Ù…: Ø¹Ù„Ø§Ø¡ Ø¹Ù„ÙŠ Ø¹Ù„ÙŠ Ù…Ø­Ù…Ø¯ Ø§Ù„Ø³Ù…Ø§Ø­ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (53) Ù„Ø³Ù†Ø© 2017', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:05'),
(83, 'Ù…Ø³Ø¹ÙˆØ¯ Ù†ÙŠÙƒØ¨Ø§Ø®Øª', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ù†Ù…Ø³Ø§\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ù†ÙŠÙƒØ¨Ø§Ø®Øª\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): NIKBAKHT\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MAS\'UD NIKBAKHT\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1942-12-31\nØ§Ù„Ø§Ø³Ù…: Ù…Ø³Ø¹ÙˆØ¯ Ù†ÙŠÙƒØ¨Ø§Ø®Øª\nØ§Ù„Ù†ÙˆØ¹: ØªØ£Ø´ÙŠØ±Ø© Ø³ÙŠØ§Ø­ÙŠØ©\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 2042004010355827\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø¯Ø¨ÙŠ\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø§Ù†ØªÙ‡Ø§Ø¡: 2005-01-19\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (24) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:06'),
(84, 'Ø³Ø¹ÙŠØ¯ Ù†Ø¬ÙØ¨ÙˆØ±', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø¥ÙŠØ±Ø§Ù†ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ù†Ø¬ÙØ¨ÙˆØ±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): NAJAFPUR\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SA\'ID NAJAFPUR\nØ§Ù„Ø§Ø³Ù…: Ø³Ø¹ÙŠØ¯ Ù†Ø¬ÙØ¨ÙˆØ±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (24) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:06'),
(85, 'Ù…Ø­Ù…Ø¯ Ø­Ø³Ù† Ø®ÙˆØ¯Ø§ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§ÙŠØ±Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø®ÙˆØ¯Ø§ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): KHODA\'I\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMAD HASAN KHODA\'I\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø­Ø³Ù† Ø®ÙˆØ¯Ø§ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (24) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:07'),
(86, 'Ù…Ø­Ù…Ø¯ Ø±Ø¶Ø§ Ø®Ø¯Ù…ØªÙŠ ÙÙ„Ø¯Ø²Ø§Ø¬Ø§Ø±Ø¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§ÙŠØ±Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): ÙÙ„Ø¯Ø²Ø§Ø¬Ø§Ø±Ø¯\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): VALADZAGHARD\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMADREZA KHEDMATI VALADZAGHARD\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1986-05-03\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§ÙŠØ±Ø§Ù†\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø±Ø¶Ø§ Ø®Ø¯Ù…ØªÙŠ ÙÙ„Ø¯Ø²Ø§Ø¬Ø§Ø±Ø¯\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: N35635875\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (24) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:08'),
(87, 'Ù…Ù‚Ø¯Ø§Ø¯ Ø£Ù…ÙŠÙ†ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§ÙŠØ±Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø£Ù…ÙŠÙ†ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AMINI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MEGHDAD AMINI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1982-05-05\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§ÙŠØ±Ø§Ù†\nØ§Ù„Ø§Ø³Ù…: Ù…Ù‚Ø¯Ø§Ø¯ Ø£Ù…ÙŠÙ†ÙŠ\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: U36089349\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§ÙŠØ±Ø§Ù†\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø¥ØµØ¯Ø§Ø±: 2015-12-23\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø§Ù†ØªÙ‡Ø§Ø¡: 2020-12-22\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (24) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:08'),
(88, 'ÙØ¤Ø§Ø¯ ØµØ§Ù„Ø­ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§ÙŠØ±Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): ØµØ§Ù„Ø­ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SALEHI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): FOAD SALEHI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1986-04-27\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§ÙŠØ±Ø§Ù†\nØ§Ù„Ø§Ø³Ù…: ÙØ¤Ø§Ø¯ ØµØ§Ù„Ø­ÙŠ\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 25265428\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§ÙŠØ±Ø§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (24) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:09'),
(89, 'Ù…Ø­Ù…Ø¯ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø£ÙˆÙ‡Ø§Ø¯ÙŠ (Ø¬Ù„Ø§Ù„ ÙÙ‡Ø¯ÙŠ)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§ÙŠØ±Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§ÙˆÙ‡Ø§Ø¯ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): OWHADI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMAD EBRAHIM OWHADI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-05-16\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø£ÙˆÙ‡Ø§Ø¯ÙŠ (Ø¬Ù„Ø§Ù„ ÙÙ‡Ø¯ÙŠ)\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø§ÙŠØ±Ø§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (50) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:10'),
(90, 'Ø¥Ø³Ù…Ø§Ø¹ÙŠÙ„ Ø±ÙŠØ²Ø§ÙÙŠ (Ø§Ù„Ø¹Ù…ÙŠØ¯ Ø±ÙŠØ²Ø§ÙÙŠ)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§ÙŠØ±Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø²ÙŠØ±Ø§ÙÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): RAZAVI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ESMA\'IL RAZAVI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-05-12\nØ§Ù„Ø§Ø³Ù…: Ø¥Ø³Ù…Ø§Ø¹ÙŠÙ„ Ø±ÙŠØ²Ø§ÙÙŠ (Ø§Ù„Ø¹Ù…ÙŠØ¯ Ø±ÙŠØ²Ø§ÙÙŠ)\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø§ÙŠØ±Ø§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (50) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:10'),
(91, 'Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ ØµÙ…Ø¯ ÙØ§Ø±ÙˆÙ‚ (Ø¹Ø¨Ø¯Ø§Ù„ØµÙ…Ø¯)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): ÙØ§Ø±ÙˆÙ‚\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): FAROQUI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDULLAH SAMAD FAROQUI\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ ØµÙ…Ø¯ ÙØ§Ø±ÙˆÙ‚ (Ø¹Ø¨Ø¯Ø§Ù„ØµÙ…Ø¯)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (50) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:11'),
(92, 'Ù…Ø­Ù…Ø¯ Ø¯Ø§ÙˆØ¯ Ù…Ø²Ù…Ù„', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ù…Ø²Ù…Ù„\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Mzml\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMAD DAWOOD\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1982-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø¯Ø§ÙˆØ¯ Ù…Ø²Ù…Ù„\nØ§Ù„Ù…Ø¯ÙŠÙ†Ø©: Ø´ÙˆØ±Ù‰ ÙƒÙˆÙŠØªØ§\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø¨Ø§ÙƒØ³ØªØ§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (50) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:11'),
(93, 'Ø¹Ø¨Ø¯Ø§Ù„Ø±Ø­ÙŠÙ… Ù…Ù†Ø§Ù†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ù…Ù†Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MANAN\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDUL RAHIM MANAN\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1961-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯Ø§Ù„Ø±Ø­ÙŠÙ… Ù…Ù†Ø§Ù†\nØ§Ù„Ù…Ø¯ÙŠÙ†Ø©: ÙˆÙ„Ø§ÙŠØ© Ù‡Ù„Ù…Ù†Ø¯\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (50) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:12'),
(94, 'Ù…Ø­Ù…Ø¯ Ù†Ø¹ÙŠÙ… Ø¨Ø§Ø±ÙŠØªØ´', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¨Ø§Ø±ÙŠØªØ´\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): BARICH\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMAD NAEEM BARICH\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1974-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ù†Ø¹ÙŠÙ… Ø¨Ø§Ø±ÙŠØªØ´\nØ§Ù„Ø´Ø§Ø±Ø¹: Ù‡ÙˆØ²Ø§Ø± Ù‚ÙˆÙÙŠØª\nØ§Ù„Ù…Ø¯ÙŠÙ†Ø©: ÙˆÙ„Ø§ÙŠØ© Ù‡Ù„Ù…Ù†Ø¯\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (50) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:13'),
(95, 'Ø³Ø§Ø¯Ø± Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ…\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): IBRAHIM\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SADR IBRAHIM\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-01\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nØ§Ù„Ø§Ø³Ù…: Ø³Ø§Ø¯Ø± Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ…\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (50) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:13'),
(96, 'Ø¹Ø¨Ø¯Ø§Ù„Ø¹Ø²ÙŠØ² <Ø­Ø§Ø¬ÙŠ Ø¹Ø²ÙŠØ² Ø´Ø§Ù‡ Ø²Ù…Ø§Ù†ÙŠ>', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø¨Ø§ÙƒØ³ØªØ§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø²Ù…Ø§Ù†ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ZAMANI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDUL AZIZ SHAH ZAMANI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1984-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¨Ø§ÙƒØ³ØªØ§Ù†\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯Ø§Ù„Ø¹Ø²ÙŠØ² <Ø­Ø§Ø¬ÙŠ Ø¹Ø²ÙŠØ² Ø´Ø§Ù‡ Ø²Ù…Ø§Ù†ÙŠ>\nØ§Ù„Ø´Ø§Ø±Ø¹: Ø´Ø§Ø±Ø¹ 30\nØ§Ù„Ù…Ø¯ÙŠÙ†Ø©: ÙƒØ±Ø§ØªØ´ÙŠ\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø¨Ø§ÙƒØ³ØªØ§Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: AP1810244\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø¨Ø§ÙƒØ³ØªØ§Ù†\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø§Ù†ØªÙ‡Ø§Ø¡: 2026-10-30\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (50) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:14'),
(97, 'Ø­ÙÙŠØ¸ Ø¹Ø¨Ø¯Ø§Ù„Ù…Ø¬ÙŠØ¯ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø¨Ø§ÙƒØ³ØªØ§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¹Ø¨Ø¯Ø§Ù„Ù…Ø¬ÙŠØ¯ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDUL MAJEED\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HAFEEZ ABDUL MAJEED\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1971-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nØ§Ù„Ø§Ø³Ù…: Ø­ÙÙŠØ¸ Ø¹Ø¨Ø¯Ø§Ù„Ù…Ø¬ÙŠØ¯ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (50) Ù„Ø³Ù†Ø© 2018', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:14'),
(98, 'Ø¹Ø¨Ø¯Ø§Ù„Ø±Ø­Ù…Ù† Ø¹Ù„ÙŠ Ø­Ø³ÙŠÙ† Ø§Ù„Ø£Ø­Ù…Ø¯ Ø§Ù„Ø±Ø§ÙˆÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø³ÙˆØ±ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø±Ø§ÙˆÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-RAWI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABD-AL RAHMAN \'ALI HUSAYN AL-AHMAD AL-RAWI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-05\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯Ø§Ù„Ø±Ø­Ù…Ù† Ø¹Ù„ÙŠ Ø­Ø³ÙŠÙ† Ø§Ù„Ø£Ø­Ù…Ø¯ Ø§Ù„Ø±Ø§ÙˆÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (51) Ù„Ø³Ù†Ø© 2020', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:15'),
(99, 'Ø³ÙŠØ¯ Ø­Ø¨ÙŠØ¨ Ø£Ø­Ù…Ø¯ Ø®Ø§Ù†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø®Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): KHAN\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SAYED HABIB AHMAD KHAN\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1969-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nØ§Ù„Ø§Ø³Ù…: Ø³ÙŠØ¯ Ø­Ø¨ÙŠØ¨ Ø£Ø­Ù…Ø¯ Ø®Ø§Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: P2502071\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (51) Ù„Ø³Ù†Ø© 2020', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:16'),
(100, 'Ø§Ø­Ù…Ø¯ Ù…Ø­Ù…Ø¯ Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ Ù…Ø­Ù…Ø¯ Ø§Ù„Ø´ÙŠØ¨Ù‡ Ø§Ù„Ù†Ø¹ÙŠÙ…ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø§Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AHMED MOHAMMED ABDULLA MOHAMMED ALSHAIBA ALNUAIMI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¥Ù…Ø§Ø±Ø© Ø¹Ø¬Ù…Ø§Ù†ØŒ Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 257451\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:16'),
(101, 'Ù…Ø­Ù…Ø¯ ØµÙ‚Ø± ÙŠÙˆØ³Ù ØµÙ‚Ø± Ø§Ù„Ø²Ø¹Ø§Ø¨ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø§Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMED SAQER YOUSIF SAQER AL ZAABI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¥Ù…Ø§Ø±Ø© Ø§Ø¨ÙˆØ¸Ø¨ÙŠØŒ Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 10249\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:17'),
(102, 'Ø­Ù…Ø¯ Ù…Ø­Ù…Ø¯ Ø±Ø­Ù…Ù‡ Ø­Ù…ÙŠØ¯ Ø§Ù„Ø´Ø§Ù…Ø³ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø§Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HAMAD MOHAMMED RAHMAH HUMAID ALSHAMSI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¥Ù…Ø§Ø±Ø© Ø¹Ø¬Ù…Ø§Ù†ØŒ Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 253981\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:18'),
(103, 'Ø³Ø¹ÙŠØ¯ Ù†Ø§ØµØ± Ø³Ø¹ÙŠØ¯ Ù†Ø§ØµØ± Ø§Ù„Ø·Ù†ÙŠØ¬ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø§Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SAEED NASER SAEED NASER ALTENEIJI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ø±Ù…Ø³ØŒ Ø±Ø§Ø³ Ø§Ù„Ø®ÙŠÙ…Ø©\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 411483\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:18'),
(104, 'Ø­Ø³Ù† Ø­Ø³ÙŠÙ† Ø·Ø¨Ø§Ø¬Ù‡', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù„Ø¨Ù†Ø§Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HASSAN HUSSAIN TABAJA\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù„Ø¨Ù†Ø§Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 58084207\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:19'),
(105, 'Ø§Ø¯Ù‡Ù… Ø­Ø³ÙŠÙ† Ø·Ø¨Ø§Ø¬Ù‡', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù„Ø¨Ù†Ø§Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ADHAM HUSSAIN TABAJA\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù„Ø¨Ù†Ø§Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 5207219\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:20'),
(106, 'Ù…Ø­Ù…Ø¯ Ø§Ø­Ù…Ø¯ Ù…Ø³Ø¹Ø¯ Ø³Ø¹ÙŠØ¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMED AHMED MUSAED SAEED\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 118618863\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:20'),
(107, 'Ø±Ø§Ø´Ø¯ ØµØ§Ù„Ø­ ØµØ§Ù„Ø­ Ø§Ù„Ø¬Ø±Ù…ÙˆØ²Ù‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): RASHED SALEH SALEH AL JARMOUZI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 7000815\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:21'),
(108, 'Ù†Ø§ÙŠÙ Ù†Ø§ØµØ± ØµØ§Ù„Ø­ Ø§Ù„Ø¬Ø±Ù…ÙˆØ²Ù‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): NAIF NASSER SALEH ALJARMOUZI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 76107095\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:21'),
(109, 'Ø°Ø¨ÙŠØ­ Ø§Ù„Ù„Ù‡ Ø¹Ø¨Ø¯Ø§Ù„Ù‚Ø§Ù‡Ø± Ø¯ÙˆØ±Ø§Ù†ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Zubiullah Abdul Qahir Durani\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø£ÙØºØ§Ù†Ø³ØªØ§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:22'),
(110, 'Ø³Ù„ÙŠÙ…Ø§Ù† ØµØ§Ù„Ø­ Ø³Ø§Ù„Ù… Ø¹Ø¨ÙˆÙ„Ø§Ù†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Suliman Saleh Salem Aboulan\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù† - Ø³ÙŠØ¦ÙˆÙ†\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ± ÙŠÙ…Ù†ÙŠ\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 8890725\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:22'),
(111, 'Ø¹Ø§Ø¯Ù„ Ø£Ø­Ù…Ø¯ Ø³Ø§Ù„Ù… Ø¹Ø¨ÙŠØ¯ Ø¹Ù„ÙŠ Ø¨Ø§Ø¯Ø±Ù‡', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Adel Ahmed Salem Obaid Ali Badrah\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù† - Ø³ÙŠØ¦ÙˆÙ†\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ± ÙŠÙ…Ù†ÙŠ\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 7772452\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:23'),
(112, 'Ø¹Ù„Ù‰ Ù†Ø§ØµØ± Ø¹Ø³ÙŠØ±Ù‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø³Ø¹ÙˆØ¯ÙŠØ©\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Ali Nasser Alaseeri\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ø³Ø¹ÙˆØ¯ÙŠØ©\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ± Ø³Ø¹ÙˆØ¯ÙŠ\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 11879\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:24'),
(113, 'ÙØ¶Ù„ ØµØ§Ù„Ø­ Ø³Ø§Ù„Ù… Ø§Ù„Ø·ÙŠØ§Ø¨Ù‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): FADHL SALEH SALEM ALTAYABI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù† - Ø§Ù„Ø¨ÙŠØ¶Ø§Ø¡\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ± ÙŠÙ…Ù†ÙŠ\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 2879473\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:25'),
(114, 'Ø¹Ø§Ø´ÙˆØ± Ø¹Ù…Ø± Ø¹Ø§Ø´ÙˆØ± Ø¹Ø¨ÙŠØ¯ÙˆÙ†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Ashur Omar Ashur OBAIDOON\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ± ÙŠÙ…Ù†ÙŠ\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 7777531\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:25'),
(115, 'Ø­Ø§Ø²Ù… Ù…Ø­Ø³Ù† Ø§Ù„ÙØ±Ø­Ø§Ù† + Ø­Ø§Ø²Ù… Ù…Ø­Ø³Ù† ÙØ±Ø­Ø§Ù†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø³ÙˆØ±ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HAZEM MOHSEN FARHAN + HAZEM MOHSEN AL FARHAN\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø³ÙˆØ±ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 73739119\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:26'),
(116, 'Ù…Ù‡Ø¯Ù‰ Ø¹Ø²ÙŠØ² Ø§Ù„Ù‡ ÙƒÙŠØ§Ø³ØªÙ‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø¥ÙŠØ±Ø§Ù†ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MEHDI AZIZOLLAH KIASATI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¥ÙŠØ±Ø§Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 143729561\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:27'),
(117, 'ÙØ±Ø´Ø§Ø¯ Ø¬Ø¹ÙØ± Ø­Ø§ÙƒÙ… Ø²Ø§Ø¯Ù‡', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø¥ÙŠØ±Ø§Ù†ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): FARSHAD JAFAR HAKEMZADEH\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¥ÙŠØ±Ø§Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 117728897\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:27'),
(118, 'Ø³ÙŠØ¯ Ø±Ø¶Ø§ Ø³ÙŠØ¯ Ù…Ø­Ù…Ø¯ Ù‚Ø§Ø³Ù…Ù‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø¥ÙŠØ±Ø§Ù†ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SEYYED REZA MOHMMAD GHASEMI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¥ÙŠØ±Ø§Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 67981903\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:28'),
(119, 'Ù…Ø­Ø³Ù† Ø­Ø³Ù† ÙƒØ§Ø±ÙƒØ±Ø­Ø¬Øª', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø¥ÙŠØ±Ø§Ù†ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ((MOHSEN HASSAN KARGARHODJAT ABADI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¥ÙŠØ±Ø§Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 46809739\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:28'),
(120, 'Ø§Ø¨Ø±Ø§Ù‡ÙŠÙ… Ù…Ø­Ù…ÙˆØ¯ Ø§Ø­Ù…Ø¯ Ù…Ø­Ù…Ø¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø¥ÙŠØ±Ø§Ù†ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): IBRAHIM MAHMOOD AHMED MOHAMMED\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¥Ù…Ø§Ø±Ø© Ø¹Ø¬Ù…Ø§Ù†ØŒ Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 261216\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:29'),
(121, 'Ø§Ø³Ø§Ù…Ù‡ Ø­Ø³ÙŠÙ† Ø¯ØºÙŠÙ…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø³ÙˆØ±ÙŠØ§\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): OSAMA HOUSEN DUGHAEM\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø³ÙˆØ±ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 39396225\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:29');
INSERT INTO `goaml` (`id`, `name`, `phone`, `status`, `note`, `type`, `created_by`, `created_at`) VALUES
(122, 'Ø¹Ø¨Ø¯Ø§Ù„Ø±Ø­Ù…Ù† Ø£Ø¯Ùˆ Ù…ÙˆØ³Ù‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù†ÙŠØ¬ÙŠØ±ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDURRAHAMAN ADO MUSA\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: ÙŠØ§ÙƒØ§Ø³Ø§ÙŠ Ù†ÙŠØ¬ÙŠØ±ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 170211735\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:30'),
(123, 'ØµØ§Ù„Ø­ ÙŠÙˆØ³Ù Ø£Ø¯Ø§Ù…Ùˆ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù†ÙŠØ¬ÙŠØ±ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SALIHU YUSUF ADAMU\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: ÙƒØ§Ù†Ùˆ Ù†ÙŠØ¬ÙŠØ±ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 119145993\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:31'),
(124, 'Ø¨Ø´ÙŠØ± Ø¹Ù„ÙŠ ÙŠÙˆØ³Ù', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù†ÙŠØ¬ÙŠØ±ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): BASHIR ALI YUSUF\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: ÙƒØ§Ù†Ùˆ Ù†ÙŠØ¬ÙŠØ±ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 154101359\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:31'),
(125, 'Ù…Ø­Ù…Ø¯ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø¹ÙŠØ³Ù‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù†ÙŠØ¬ÙŠØ±ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MUHAMMED IBRAHIM ISA\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: ÙƒØ§Ù†Ùˆ Ù†ÙŠØ¬ÙŠØ±ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 47171720\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:32'),
(126, 'Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø¹Ù„ÙŠ Ø§Ù„Ø­Ø³Ù†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù†ÙŠØ¬ÙŠØ±ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): IBRAHIM ALI ALHASSAN\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: ÙƒØ§Ù†Ùˆ Ù†ÙŠØ¬ÙŠØ±ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 39624466\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:33'),
(127, 'Ø³ÙˆØ±Ø§Ø¬Ùˆ Ø£Ø¨ÙˆØ¨ÙƒØ± Ù…Ø­Ù…Ø¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù†ÙŠØ¬ÙŠØ±ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SURAJO ABUBAKAR MUHAMMAD\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø±ÙŠÙ…ÙŠ Ù†ÙŠØ¬ÙŠØ±ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 175020687\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:33'),
(128, 'Ø¹Ù„Ø§Ø¡ Ø®Ù†ÙÙˆØ±Ø© Ø£Ùˆ Ø¹Ù„Ø§Ø¡ Ø¹Ø¨Ø¯Ø§Ù„Ø±Ø²Ø§Ù‚ Ø¹Ù„ÙŠ Ø®Ù†ÙÙˆØ±Ø© Ø£Ùˆ Ø¹Ù„Ø§Ø¡ Ø§Ù„Ø®Ù†ÙÙˆØ±Ø©', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø³ÙˆØ±ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Alaa khanfurah - Alaa abdulrazzaq ali khanfurah - Alaa Alkhanfurah\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:34'),
(129, 'ÙØ§Ø¯ÙŠ Ø³Ø¹ÙŠØ¯ ÙƒÙ…Ø§Ø±ØŒ ÙØ§Ø¯ÙŠ Ø³Ø¹ÙŠØ¯ Ù‚Ù…Ø±', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø¨Ø±ÙŠØ·Ø§Ù†ÙŠØ§\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): FADI SAID KAMAR\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¯Ù…Ø´Ù‚ - Ø³ÙˆØ±ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 100038025\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:35'),
(130, 'ÙˆÙ„ÙŠØ¯ ÙƒØ§Ù…Ù„ Ø¹ÙˆØ¶', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø³Ø§Ù†Øª ÙƒÙŠØªØ³ - Ù†Ø§ÙÙŠØ³\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): WALID KAMEL AWAD\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¯Ù…Ø´Ù‚ - Ø³ÙˆØ±ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 30797785\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:35'),
(131, 'Ø®Ø§Ù„Ø¯ ÙˆÙ„ÙŠØ¯ Ø¹ÙˆØ¶', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø³Ø§Ù†Øª ÙƒÙŠØªØ³ - Ù†Ø§ÙÙŠØ³\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): KHALED WALID AWAD\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¯Ù…Ø´Ù‚ - Ø³ÙˆØ±ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 112338165\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:36'),
(132, 'Ø¹Ù…Ø§Ø¯ Ø®Ø§Ù„Ù‚ ÙƒÙˆÙ†Ø¯Ø§ÙƒØ²Ù‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø±ÙˆØ³ÙŠØ§\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): IMAD KHALLAK KANTAKDZHI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø³ÙˆØ±ÙŠØ§\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 122879693\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:36'),
(133, 'Ù…Ø­Ù…Ø¯ Ø§ÙŠÙ…Ù† ØªÙŠØ³ÙŠØ± Ø±Ø´ÙŠØ¯ Ø§Ù„Ù…Ø±Ø§ÙŠØ§ØªÙ‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø£Ø±Ø¯Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOUHAMMAD AYMAN TAYSEER RASHID MARAYAT\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ø£Ø±Ø¯Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 33652035\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:37'),
(134, 'Ø­Ø³Ù† Ø£Ø­Ù…Ø¯ Ù…Ù‚Ù„Ø¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù„Ø¨Ù†Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ù…Ù‚Ù„Ø¯\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Moukalled\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Hassan Ahmed Moukalled\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 17/02/1967\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (9) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:38'),
(135, 'Ø±Ø§Ù†ÙŠ Ø­Ø³Ù† Ù…Ù‚Ù„Ø¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù„Ø¨Ù†Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ù…Ù‚Ù„Ø¯\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Moukalled\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Rani Hassan Moukalled\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 29/10/1998\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (9) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:38'),
(136, 'Ø±ÙŠØ§Ù† Ø­Ø³Ù† Ù…Ù‚Ù„Ø¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù„Ø¨Ù†Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ù…Ù‚Ù„Ø¯\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Moukalled\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Ryyan Hassan Moukalled\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 25/10/1993\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (9) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:39'),
(137, 'ÙŠÙˆØ³Ù Ø­Ø³Ù† Ø£Ø­Ù…Ø¯ Ø§Ù„Ù…Ù„Ø§', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø­Ø§Ù„ÙŠØ©: Ø§Ù„Ø³ÙˆÙŠØ¯ Ø§Ù„Ø³Ø§Ø¨Ù‚Ø©: Ù„ÙŠØ¨ÙŠØ±ÙŠØ§\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): YOUSEF HASSAN AHMAD AL MULLA\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1984-01-06\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ø´Ø§Ø±Ù‚Ø© - Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø§Ù„Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 146957\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ù„ÙŠØ¨ÙŠØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:39'),
(138, 'Ø³Ø¹ÙŠØ¯ Ø®Ø§Ø¯Ù… Ø£Ø­Ù…Ø¯ Ø¨Ù† Ø·ÙˆÙ‚ Ø§Ù„Ù…Ø±ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: ØªØ±ÙƒÙŠØ§\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SAEED KHADEM AHMED BINTOUQ ALMARRI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1960-01-03\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¯Ø¨ÙŠ - Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø§Ù„Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: ØªØ±ÙƒÙŠ Ø±Ù‚Ù…: U24171753 Ø¥Ù…Ø§Ø±Ø§ØªÙŠ Ø±Ù‚Ù…: NZ9Y56591\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: ØªØ±ÙƒÙŠØ§ Ùˆ Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:40'),
(139, 'Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø£Ø­Ù…Ø¯ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø¹Ù„ÙŠ Ø§Ù„Ø­Ù…Ø§Ø¯ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): IBRAHIM AHMED IBRAHIM ALI ALHAMMADI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1957-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙØ¬ÙŠØ±Ø© - Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø§Ù„Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: Ø§Ù„Ø³ÙˆÙŠØ¯ Ø±Ù‚Ù…: 35482622 Ø¥Ù…Ø§Ø±Ø§ØªÙŠ Ø±Ù‚Ù…: A2649673\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„Ø³ÙˆÙŠØ¯ Ùˆ Ø§Ù„Ø§Ù…Ø§Ø±Ø§Øª\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:41'),
(140, 'Ø¥Ù„Ù‡Ø§Ù… Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ Ø£Ø­Ù…Ø¯ Ø§Ù„Ù‡Ø§Ø´Ù…ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø³ÙˆÙŠØ¯\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ELHAM ABDULLA AHMAD ALHASHEMI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 20/12/1963\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¯Ø¨ÙŠ - Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø§Ù„Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: A2569896\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:41'),
(141, 'Ø¬Ø§Ø³Ù… Ø±Ø§Ø´Ø¯ Ø®Ù„ÙØ§Ù† Ø±Ø§Ø´Ø¯ Ø§Ù„Ø´Ø§Ù…Ø³ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): JASEM RASHED KHALFAN RASHED ALSHAMSI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 30/12/1968\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ø´Ø§Ø±Ù‚Ø© - Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø§Ù„Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 2106900\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:42'),
(142, 'Ø®Ø§Ù„Ø¯ Ø¹Ø¨ÙŠØ¯ ÙŠÙˆØ³Ù Ø¨ÙˆØ¹ØªØ§Ø¨Ù‡ Ø§Ù„Ø²Ø¹Ø§Ø¨ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): KHALID OBAID YOUSIF BUATABA ALZAABI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 19/06/1989\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø£Ø¨ÙˆØ¸Ø¨ÙŠ - Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø§Ù„Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: C47F92116\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:43'),
(143, 'Ø¹Ø¨Ø¯Ø§Ù„Ø±Ø­Ù…Ù† Ø­Ø³Ù† Ù…Ù†ÙŠÙ Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ Ø­Ø³Ù† Ø§Ù„Ø¬Ø§Ø¨Ø±ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDUL RAHMAN HASAN MUNIF A. ALJABERI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 20/05/1989\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø£Ø¨ÙˆØ¸Ø¨ÙŠ - Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø§Ù„Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 2454612\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:43'),
(144, 'Ø­Ù…ÙŠØ¯ Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ Ø¹Ø¨Ø¯Ø§Ù„Ø±Ø­Ù…Ù† Ø§Ù„Ø¬Ø±Ù…Ù† Ø§Ù„Ù†Ø¹ÙŠÙ…ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HUMAID ABDULLA ABDULRAHMAN J. ALNUAIMI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1974-09-07\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø¯Ø¨ÙŠ - Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø§Ù„Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 2535370\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:44'),
(145, 'Ø¹Ø¨Ø¯Ø§Ù„Ø±Ø­Ù…Ù† Ø¹Ù…Ø± Ø³Ø§Ù„Ù… Ø¨Ø§Ø¬Ø¨ÙŠØ± Ø§Ù„Ø­Ø¶Ø±Ù…ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDELRAHMAN OMAR SALIM BAJUBAIR ALHADHRAMI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 27/02/1987\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ø´Ø§Ø±Ù‚Ø© - Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø§Ù„Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: Ø¥Ù…Ø§Ø±Ø§ØªÙŠ Ø±Ù‚Ù…: FNJR81768 Ø¨Ø±ÙŠØ·Ø§Ù†ÙŠ Ø±Ù‚Ù…: 760001649\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª Ùˆ Ø¨Ø±ÙŠØ·Ø§Ù†ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:44'),
(146, 'Ø¹Ù„ÙŠ Ø­Ø³Ù† Ø¹Ù„ÙŠ Ø­Ø³ÙŠÙ† Ø§Ù„Ø­Ù…Ø§Ø¯ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ALI HASAN ALI HUSAIN ALHAMMADI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1958-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ø´Ø§Ø±Ù‚Ø© - Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø§Ù„Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 2363886\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:45'),
(147, 'Ù…Ø­Ù…Ø¯ Ø¹Ù„ÙŠ Ø­Ø³Ù† Ø¹Ù„ÙŠ Ø§Ù„Ø­Ù…Ø§Ø¯ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMED ALI HASSAN ALI ALHAMMADI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1982-04-30\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ø´Ø§Ø±Ù‚Ø© - Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø§Ù„Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 2333890\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„Ø¥Ù…Ø§Ø±Ø§Øª\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:46'),
(148, 'Ø­Ø³Ù† Ø£Ø¨Ø´Ø± Ø­ÙˆØ±', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Hasaan Abshir Xuuroow\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-05\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:46'),
(149, 'Ø£Ø¯Ù† ÙŠÙˆØ³Ù Ø³Ø¹ÙŠØ¯ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Aadan Yusuf Saciid Ibrahim\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-10\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:47'),
(150, 'Ù…Ø¤Ù…Ù† Ø¯ÙŠØ±ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Mumin Dheere\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-07\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:47'),
(151, 'Ù…Ø§ÙƒØ§Ù„ÙŠÙ† Ø¨Ø±Ù‡Ø§Ù†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Macalin Burhan\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-04\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:48'),
(152, 'Ø¹Ù„ÙŠ Ø£Ø­Ù…Ø¯ Ø­Ø³ÙŠÙ†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Ali Ahmed Hussein\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-02\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:48'),
(153, 'Ù…ÙƒØ³Ù…Ø§Øª ÙƒØ§Ù„ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Maxamed Cali\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-06\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:49'),
(154, 'Ø£Ø­Ù…Ø¯ ÙƒØ¨Ø§Ø¯ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Ahmed Kabadhe\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-01\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:49'),
(155, 'Ø³ÙŠØ§Øª Ø£ÙŠÙˆØªÙˆ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Siyaat Ayuto\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-04\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:50'),
(156, 'Ø­Ø³Ù† ÙŠØ§Ø±ÙŠØ³Ùˆ Ø¢Ø¯Ù…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Hassan Yariisow Aadan\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-12\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:51'),
(157, 'Ø³Ø¹ÙŠØ¯ Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ Ø¢Ø¯Ù…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Siciid Abdullahi Aadan\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-20\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:51'),
(158, 'Ù…Ø­Ù…Ø¯ Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ Ø­ÙŠØ±ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Mohamed Abdullah Hirey\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-05-07\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:52'),
(159, 'ÙƒØ¨Ø¯ÙŠ Ø±ÙˆØ¨ÙˆÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Cabdi Roobow\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-06-03\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:52'),
(160, 'Ø´ÙŠØ® Ø¢Ø¯Ù… Ø£Ø¨ÙˆØ¨ÙƒØ± Ù…Ø§Ù„ÙŠÙ„ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Shiek Aadan Abuukar Malayle\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-05-15\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:53'),
(161, 'Ø¢Ø¯Ù… Ø¬ÙŠØ³', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Aadan Jiss\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-05-30\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:54'),
(162, 'ÙƒÙˆÙ…Ø§Ø± Ù‚ÙˆÙ‡Ø§Ø¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ØµÙˆÙ…Ø§Ù„\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Cumar Guhaad\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-05-25\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (44) Ù„Ø³Ù†Ø© 2025', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:54'),
(163, 'MUSLIM BROTHERHOOD IN THE UAE', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬Ù…Ø§Ø¹Ø© Ø§Ù„Ø¥Ø®ÙˆØ§Ù† Ø§Ù„Ù…Ø³Ù„Ù…ÙŠÙ† Ø§Ù„Ø¥Ù…Ø§Ø±Ø§ØªÙŠØ© Ø¯Ø¹ÙˆØ© Ø§Ù„Ø¥ØµÙ„Ø§Ø­ (Ø¬Ù…Ø¹ÙŠØ© Ø§Ù„Ø¥ØµÙ„Ø§Ø­)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:55'),
(164, 'KHALAYA AL JIHAD AL-EMIRATI (UAE JAHADIST CELLS)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø®Ù„Ø§ÙŠØ§ Ø§Ù„Ø¬Ù‡Ø§Ø¯ Ø§Ù„Ø¥Ù…Ø§Ø±Ø§ØªÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:55'),
(165, 'OMMAH PARTY', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø£Ø­Ø²Ø§Ø¨ Ø§Ù„Ø£Ù…Ø© ÙÙŠ Ø§Ù„Ø®Ù„ÙŠØ¬\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:56'),
(166, 'AL QAEDA (AQ)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ØªÙ†Ø¸ÙŠÙ… Ø§Ù„Ù‚Ø§Ø¹Ø¯Ø©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:56'),
(167, 'ISLAMIC STATE OF IRAQ AND THE LEVANT (ISIS)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø¯ÙˆÙ„Ø© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© ÙÙŠ Ø§Ù„Ø¹Ø±Ø§Ù‚ ÙˆØ§Ù„Ø´Ø§Ù… (Ø¯Ø§Ø¹Ø´)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:57'),
(168, 'AL-QA\'IDA IN THE ARABIAN PENINSULA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ØªÙ†Ø¸ÙŠÙ… Ø§Ù„Ù‚Ø§Ø¹Ø¯Ø© ÙÙŠ Ø´Ø¨Ù‡ Ø§Ù„Ø¬Ø²ÙŠØ±Ø© Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:58'),
(169, 'ANSAR AL-SHARIA(SUPPORTERS OF SHARIA LAW ) IN YEMEN', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø£Ù†ØµØ§Ø± Ø§Ù„Ø´Ø±ÙŠØ¹Ø© (Ø§Ù„ÙŠÙ…Ù†)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:58'),
(170, 'THE MUSLIM BROTHERHOOD', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ØªÙ†Ø¸ÙŠÙ… ÙˆØ¬Ù…Ø§Ø¹Ø© Ø§Ù„Ø¥Ø®ÙˆØ§Ù† Ø§Ù„Ù…Ø³Ù„Ù…ÙŠÙ†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:23:59'),
(171, 'ISLAMIC GROUB IN EGYPT', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø¬Ù…Ø§Ø¹Ø© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© ÙÙŠ Ù…ØµØ±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:00'),
(172, 'ANSAR BAIT AL-MAQDIS (WILAYAT SINAI- PROVINCE OR STATE IN THE SINAI)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬Ù…Ø§Ø¹Ø© Ø£Ù†ØµØ§Ø± Ø¨ÙŠØª Ø§Ù„Ù…Ù‚Ø¯Ø³ Ø§Ù„Ù…ØµØ±ÙŠØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:00'),
(173, 'AJNAD MISR', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬Ù…Ø§Ø¹Ø© Ø£Ø¬Ù†Ø§Ø¯ Ù…ØµØ±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:01'),
(174, 'MAJLIS SHURA AL-MUJAHIDEEN FI AKNAF BAYT AL-MAQDIS (THE MUJAHEDEEN SHURA COUNCIL IN THE ENVIRONS OF JERUSALEM)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ø¬Ù„Ø³ Ø´ÙˆØ±Ù‰ Ø§Ù„Ù…Ø¬Ø§Ù‡Ø¯ÙŠÙ† Ø£ÙƒÙ†Ø§Ù Ø¨ÙŠØª Ø§Ù„Ù…Ù‚Ø¯Ø³\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:01'),
(175, 'THE HOUTHI MOVEMENT IN YEMEN', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø­Ø±ÙƒØ© Ø§Ù„Ø­ÙˆØ«ÙŠÙŠÙ† ÙÙŠ Ø§Ù„ÙŠÙ…Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:02'),
(176, 'HEZBOLLAH AL-HIJAZ IN SAUDI ARABIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø­Ø²Ø¨ Ø§Ù„Ù„Ù‡ Ø§Ù„Ø³Ø¹ÙˆØ¯ÙŠ ÙÙŠ Ø§Ù„Ø­Ø¬Ø§Ø²\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:03'),
(177, 'HEZBOLLAH IN THE GULF COOPERATION COUNCIL', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø­Ø²Ø¨ Ø§Ù„Ù„Ù‡ ÙÙŠ Ø¯ÙˆÙ„ Ù…Ø¬Ù„Ø³ Ø§Ù„ØªØ¹Ø§ÙˆÙ† Ø§Ù„Ø®Ù„ÙŠØ¬ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:03'),
(178, 'AL-QAIDA ORGNAISATION IN IRAN', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ØªÙ†Ø¸ÙŠÙ… Ø§Ù„Ù‚Ø§Ø¹Ø¯Ø© ÙÙŠ Ø¥ÙŠØ±Ø§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:04'),
(179, 'BADER ORGANISATION IN IRAQ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ù†Ø¸Ù…Ø© Ø¨Ø¯Ø± ÙÙŠ Ø§Ù„Ø¹Ø±Ø§Ù‚\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:04'),
(180, 'ASAAIB AHL AL-HAQ (LEAGUE OF THE RIGHTEOUS) IN IRAQ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¹ØµØ§Ø¦Ø¨ Ø£Ù‡Ù„ Ø§Ù„Ø­Ù‚ ÙÙŠ Ø§Ù„Ø¹Ø±Ø§Ù‚\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:05'),
(181, 'HEZBOLLAH BRIGADE IN IRAQ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªØ§Ø¦Ø¨ Ø­Ø²Ø¨ Ø§Ù„Ù„Ù‡ (Ø§Ù„Ø¹Ø±Ø§Ù‚)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:05'),
(182, 'LIWA ABU AL-FADL AL-ABBAS IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù„ÙˆØ§Ø¡ Ø£Ø¨Ùˆ ÙØ¶Ù„ Ø§Ù„Ø¹Ø¨Ø§Ø³ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:06'),
(183, 'AL-YOUM AL-MAOUD BRIGADE IN IRAQ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªØ§Ø¦Ø¨ Ù„ÙˆØ§Ø¡ Ø§Ù„ÙŠÙˆÙ… Ø§Ù„Ù…ÙˆØ¹ÙˆØ¯ (Ø§Ù„Ø¹Ø±Ø§Ù‚)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:07'),
(184, 'OMAR BIN YASSER BRIGADE IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù„ÙˆØ§Ø¡ Ø¹Ù…Ø± Ø¨Ù† ÙŠØ§Ø³Ø± (Ø³ÙˆØ±ÙŠØ§)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:07'),
(185, 'ANSAR AL-ISLAM', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬Ù…Ø§Ø¹Ø© Ø£Ù†ØµØ§Ø± Ø§Ù„Ø¥Ø³Ù„Ø§Ù… Ø§Ù„Ø¹Ø±Ø§Ù‚ÙŠØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:08'),
(186, 'AL-NUSRAH FRONT IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬Ø¨Ù‡Ø© Ø§Ù„Ù†ØµØ±Ø© ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:08'),
(187, 'HARAKET AHRAR ASHAM IN SYRIA (ISLAMIC MOVEMENT OF THE FREE MAN OF THE LEVENT)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø­Ø±ÙƒØ© Ø£Ø­Ø±Ø§Ø± Ø§Ù„Ø´Ø§Ù… ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:09'),
(188, 'THE ARMY OF ISLAM IN PALESTINE', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬ÙŠØ´ Ø§Ù„Ø¥Ø³Ù„Ø§Ù… ÙÙŠ ÙÙ„Ø³Ø·ÙŠÙ†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:09'),
(189, 'ABDALLAH AZZAM BRIGADES', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªØ§Ø¦Ø¨ Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø¹Ø²Ø§Ù…\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:10'),
(190, 'FATAH AL ISLAM IN LEBANON', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø­Ø±ÙƒØ© ÙØªØ­ Ø§Ù„Ø¥Ø³Ù„Ø§Ù… Ø§Ù„Ù„Ø¨Ù†Ø§Ù†ÙŠØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:11'),
(191, 'ASBAT AL-ANSAR IN LEBANON', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¹ØµØ¨Ø© Ø§Ù„Ø£Ù†ØµØ§Ø± ÙÙŠ Ù„Ø¨Ù†Ø§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:11'),
(192, 'AL QAIDA IN THE LAND OF THE ISLAMIC MAGHREB', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ØªÙ†Ø¸ÙŠÙ… Ø§Ù„Ù‚Ø§Ø¹Ø¯Ø© ÙÙŠ Ø¨Ù„Ø§Ø¯ Ø§Ù„Ù…ØºØ±Ø¨ Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:12'),
(193, 'ANSAR AL-SHARIA IN LIBYA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø£Ù†ØµØ§Ø± Ø§Ù„Ø´Ø±ÙŠØ¹Ø© ÙÙŠ Ù„ÙŠØ¨ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:13'),
(194, 'ANSAR AL-SHARI\'A IN TUNISIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬Ù…Ø§Ø¹Ø© Ø£Ù†ØµØ§Ø± Ø§Ù„Ø´Ø±ÙŠØ¹Ø© ÙÙŠ ØªÙˆÙ†Ø³\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:13'),
(195, 'MUJAHIDEEN YOUTH MOVEMENT IN SOMALIA(HARAKET AL-SHABAAB AL-MUJAHIDEEN IN SOMALIA)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø­Ø±ÙƒØ© Ø´Ø¨Ø§Ø¨ Ø§Ù„Ù…Ø¬Ø§Ù‡Ø¯ÙŠÙ† Ø§Ù„ØµÙˆÙ…Ø§Ù„ÙŠØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:14'),
(196, 'BOKO HARAM IN NIGERIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬Ù…Ø§Ø¹Ø© Ø¨ÙˆÙƒÙˆ Ø­Ø±Ø§Ù… ÙÙŠ Ù†ÙŠØ¬ÙŠØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:14'),
(197, 'ALMOURABITOUN GROUB IN MALI(THE SENTINELS)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø§Ù„Ù…Ø±Ø§Ø¨Ø·ÙˆÙ† ÙÙŠ Ù…Ø§Ù„ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:15'),
(198, 'ANSAR AL-DINE IN MALI', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø­Ø±ÙƒØ© Ø£Ù†ØµØ§Ø± Ø§Ù„Ø¯ÙŠÙ† ÙÙŠ Ù…Ø§Ù„ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:16'),
(199, 'THE HAQQANI NETWORK IN PAKISTAN', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø´Ø¨ÙƒØ© Ø­Ù‚Ø§Ù†ÙŠ Ø§Ù„Ø¨Ø§ÙƒØ³ØªØ§Ù†ÙŠØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:16'),
(200, 'LASHKAR E-TAYYIBA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬Ù…Ø§Ø¹Ø© Ù„Ø´ÙƒØ± Ø·ÙŠØ¨Ø© Ø§Ù„Ø¨Ø§ÙƒØ³ØªØ§Ù†ÙŠØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:17'),
(201, 'EAST TURKISTAN MOVEMENT IN PAKISTAN', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø­Ø±ÙƒØ© ØªØ±ÙƒØ³ØªØ§Ù† Ø§Ù„Ø´Ø±Ù‚ÙŠØ© ÙÙŠ Ø¨Ø§ÙƒØ³ØªØ§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:17'),
(202, 'JAISH-I-MOHAMMED IN PAKISTAN', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬ÙŠØ´ Ù…Ø­Ù…Ø¯ ÙÙŠ Ø¨Ø§ÙƒØ³ØªØ§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:18'),
(203, 'JAISH-E-MOHAMMED (THE ARMY OF MOHAMMAD IN PAKISTAN AND INDIA)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬ÙŠØ´ Ù…Ø­Ù…Ø¯ ÙÙŠ Ø¨Ø§ÙƒØ³ØªØ§Ù† ÙˆØ§Ù„Ù‡Ù†Ø¯\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:19'),
(204, 'AL-MUJAHIDEEN AL-HONOUD IN KASHMIR/INDIA (THE INDIAN MUJAHIDEEN)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ù…Ø¬Ø§Ù‡Ø¯ÙŠÙ† Ø§Ù„Ù‡Ù†ÙˆØ¯ ÙÙŠ Ø§Ù„Ù‡Ù†Ø¯/ ÙƒØ´Ù…ÙŠØ±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:19'),
(205, 'CAUCASUS EMIRATE', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¥Ù…Ø§Ø±Ø© Ø§Ù„Ù‚ÙˆÙ‚Ø§Ø² Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© (Ø§Ù„Ø¬Ù‡Ø§Ø¯ÙŠÙŠÙ† Ø§Ù„Ø´ÙŠØ´Ø§Ù†ÙŠÙŠÙ†)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:20'),
(206, 'THE ISLAMIC MOVEMENT OF UZBEKISTAN', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø­Ø±ÙƒØ© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© Ø§Ù„Ø£ÙˆØ²Ø¨ÙƒÙŠØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:21'),
(207, 'ABU SAYYAF GROUP', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬Ù…Ø§Ø¹Ø© Ø£Ø¨ÙˆØ³ÙŠØ§Ù Ø§Ù„ÙÙ„Ø¨ÙŠÙ†ÙŠØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:22'),
(208, 'TAHRIK-E TALIBAN PAKISTAN', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø­Ø±ÙƒØ© Ø·Ø§Ù„Ø¨Ø§Ù† Ø¨Ø§ÙƒØ³ØªØ§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:22'),
(209, 'ABU-DHAR AL-GHIFARI BATTALION IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø£Ø¨Ùˆ Ø°Ø± Ø§Ù„ØºÙØ§Ø±ÙŠ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:23'),
(210, 'AL-TAWHEED BRIGADE IN SYRIA(BRIGADE OF UNITY,OR MONOTHEISM)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù„ÙˆØ§Ø¡ Ø§Ù„ØªÙˆØ­ÙŠØ¯ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:23'),
(211, 'AL-TAWHID WAL-EMAN BATTALION IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø§Ù„ØªÙˆØ­ÙŠØ¯ ÙˆØ§Ù„Ø¥ÙŠÙ…Ø§Ù† ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:24'),
(212, 'KATIBAT AL-KHADRA IN SYRIA(THE GREEN BATTALTION)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø§Ù„Ø®Ø¶Ø±Ø§Ø¡ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:25'),
(213, 'ABU BAKR AL-SIDDIQ BRIGADE IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø³Ø±ÙŠØ© Ø£Ø¨Ùˆ Ø¨ÙƒØ± Ø§Ù„ØµØ¯ÙŠÙ‚ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:25'),
(214, 'TALHA BIN OBAIDULLAH BRIGADE IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø³Ø±ÙŠØ© Ø·Ù„Ø­Ø© Ø¨Ù† Ø¹Ø¨ÙŠØ¯ Ø§Ù„Ù„Ù‡ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:26'),
(215, 'AL-SARIM AL-BATTAR BRIGADE IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø³Ø±ÙŠØ© Ø§Ù„ØµØ§Ø±Ù… Ø§Ù„Ø¨ØªØ§Ø± ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:27'),
(216, 'ABDULLAH IBN MUBARAK BRIGADE IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø¨Ù† Ù…Ø¨Ø§Ø±Ùƒ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:27'),
(217, 'CONVOYS OF MARTYRS BRIGADE IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ù‚ÙˆØ§ÙÙ„ Ø§Ù„Ø´Ù‡Ø¯Ø§Ø¡ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:28'),
(218, 'ABU-OMER BRIGADE IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø£Ø¨Ùˆ Ø¹Ù…Ø± ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:28'),
(219, 'AHRAR SHAMMAR BRIGADE IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø£Ø­Ø±Ø§Ø± Ø´Ù…Ø± ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:29'),
(220, 'SARIYAT AL-JABAL BRIGADE IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø³Ø§Ø±ÙŠØ© Ø§Ù„Ø¬Ø¨Ù„ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:29'),
(221, 'AL-SHAHBA BRIGADE IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø§Ù„Ø´Ù‡Ø¨Ø§Ø¡ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:30'),
(222, 'ALQAQAA BRIGADE IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø§Ù„Ù‚Ø¹Ù‚Ø§Ø¹ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:30'),
(223, 'SUFIAN AL-THAWRI BRGADE IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø³ÙÙŠØ§Ù† Ø§Ù„Ø«ÙˆØ±ÙŠ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:31'),
(224, 'EBAD AL-RAHMAN BRIGADE IN SYRIA(BRIGADE OF SOLDIERS OF ALLAH)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø¹Ø¨Ø§Ø¯ Ø§Ù„Ø±Ø­Ù…Ù† ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:32'),
(225, 'OMAR IBN AL-KHATTAB BATTALION IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø¹Ù…Ø± Ø¨Ù† Ø§Ù„Ø®Ø·Ø§Ø¨ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:32'),
(226, 'AL-SHAYMA BATTALTION IN SYRIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø§Ù„Ø´ÙŠÙ…Ø§Ø¡ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:33'),
(227, 'KATIBAT AL-HAQ IN SYRIA (BRIGADE OF THE RIGHTEOUS)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø§Ù„Ø­Ù‚ ÙÙŠ Ø³ÙˆØ±ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:33'),
(228, 'BENGHAZI DEFENSE BRIGADES', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø³Ø±Ø§ÙŠØ§ Ø§Ù„Ø¯ÙØ§Ø¹ Ø¹Ù† Ø¨Ù†ØºØ§Ø²ÙŠ (Ù„ÙŠØ¨ÙŠØ§)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:34'),
(229, 'AL-ASHTAR BRIGADES', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø³Ø±Ø§ÙŠØ§ Ø§Ù„Ø£Ø´ØªØ± (Ø§Ù„Ø¨Ø­Ø±ÙŠÙ†)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:34'),
(230, 'FEBRUARY 14 COALITION', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¥ØªÙ„Ø§Ù 14 ÙØ¨Ø±Ø§ÙŠØ± (Ø§Ù„Ø¨Ø­Ø±ÙŠÙ†)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:35'),
(231, 'THE POPULAR RESISTANCE BRIGADES IN BAHRAIN', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø³Ø±Ø§ÙŠØ§ Ø§Ù„Ù…Ù‚Ø§ÙˆÙ…Ø© (Ø§Ù„Ø¨Ø­Ø±ÙŠÙ†)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:36'),
(232, 'BAHRAINS HEZBOLLAH', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø­Ø²Ø¨ Ø§Ù„Ù„Ù‡ Ø§Ù„Ø¨Ø­Ø±ÙŠÙ†ÙŠ (Ø§Ù„Ø¨Ø­Ø±ÙŠÙ†)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:36'),
(233, 'SARAYA AL-MUKHTAR', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø³Ø±Ø§ÙŠØ§ Ø§Ù„Ù…Ø®ØªØ§Ø± (Ø§Ù„Ø¨Ø­Ø±ÙŠÙ†)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:37'),
(234, 'BAHRAIN FREEDOM MOVEMENT', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø­Ø±ÙƒØ© Ø£Ø­Ø±Ø§Ø± Ø§Ù„Ø¨Ø­Ø±ÙŠÙ† (Ø§Ù„Ø¨Ø­Ø±ÙŠÙ†)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:37'),
(235, 'BENGHAZI REVOLUTIONARIES SHURA COUNCIL', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ø¬Ù„Ø³ Ø´ÙˆØ±Ù‰ Ø«ÙˆØ§Ø± Ø¨Ù†ØºØ§Ø²ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:38'),
(236, 'AL-SARAYA MEDIA CENTER', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ø±ÙƒØ² Ø§Ù„Ø³Ø±Ø§ÙŠØ§ Ù„Ù„Ø¥Ø¹Ù„Ø§Ù…\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:38'),
(237, 'RAFALLAH AL-SAHATI BRIGADE', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ØªÙ†Ø¸ÙŠÙ…Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙƒØªÙŠØ¨Ø© Ø±Ø§Ù Ø§Ù„Ù„Ù‡ Ø§Ù„Ø³Ø­Ø§ØªÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017', 'ØªÙ†Ø¸ÙŠÙ… Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:39'),
(238, 'AL-KARAMA ORGANISATION', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ù†Ø¸Ù…Ø© Ø§Ù„ÙƒØ±Ø§Ù…Ø©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:39'),
(239, 'THE COUNCIL ON AMERICAN ISLAMIC RELATIONS (CAIR)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ø¬Ù„Ø³ Ø§Ù„Ø¹Ù„Ø§Ù‚Ø§Øª Ø§Ù„Ø£Ù…Ø±ÙŠÙƒÙŠØ© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© (ÙƒÙŠØ±)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:40'),
(240, 'MUSLIM AMERICAN SOCIETY (MAS)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø¬Ù…Ø¹ÙŠØ© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© Ø§Ù„Ø£Ù…Ø±ÙŠÙƒÙŠØ© (Ù…Ø§Ø³)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:40'),
(241, 'INTERNAIONAL UNION OF MUSLIM SCHOLARS (IUMS)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§ØªØ­Ø§Ø¯ Ø¹Ù„Ù…Ø§Ø¡ Ø§Ù„Ù…Ø³Ù„Ù…ÙŠÙ†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:41'),
(242, 'FADERATION OF ISLAMIC ORGANISATION IN EUROPE', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§ØªØ­Ø§Ø¯ Ø§Ù„Ù…Ù†Ø¸Ù…Ø§Øª Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© ÙÙŠ Ø£ÙˆØ±ÙˆØ¨Ø§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:42'),
(243, 'UNION OF ISLAMIC ORGANISATION OF FRANCE (UOIF)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§ØªØ­Ø§Ø¯ Ø§Ù„Ù…Ù†Ø¸Ù…Ø§Øª Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© ÙÙŠ ÙØ±Ù†Ø³Ø§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:42'),
(244, 'MUSLIM ASSOCIATION OF BRITAIN (MAB)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø±Ø§Ø¨Ø·Ø© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© ÙÙŠ Ø¨Ø±ÙŠØ·Ø§Ù†ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:43'),
(245, 'ISLAMIC COMMUNITY OF GERMANY', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„ØªØ¬Ù…Ø¹ Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠ Ø¨Ø£Ù„Ù…Ø§Ù†ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:43'),
(246, 'ISLAMIC ASSOCIATION OF DENMARK', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø±Ø§Ø¨Ø·Ø© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© ÙÙŠ Ø§Ù„Ø¯Ù†Ù…Ø§Ø±Ùƒ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:44'),
(247, 'ISLAMIC ASSOCIATION IN BELGIUM', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø±Ø§Ø¨Ø·Ø© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© ÙÙŠ Ø¨Ù„Ø¬ÙŠÙƒØ§ (Ø±Ø§Ø¨Ø·Ø© Ù…Ø³Ù„Ù…ÙŠ Ø¨Ù„Ø¬ÙŠÙƒØ§)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:45'),
(248, 'ISAMIC ASSOCIATION OF ITALY', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø±Ø§Ø¨Ø·Ø© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© ÙÙŠ Ø¥ÙŠØ·Ø§Ù„ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:45'),
(249, 'ISLAMIC ASSOCIATION OF FINLAND', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø±Ø§Ø¨Ø·Ø© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© ÙÙŠ ÙÙ†Ù„Ù†Ø¯Ø§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:46'),
(250, 'ISLAMIC ASSOCIATION OF SWEDEN', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø±Ø§Ø¨Ø·Ø© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© ÙÙŠ Ø§Ù„Ø³ÙˆÙŠØ¯\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:46'),
(251, 'ISLAMIC ASSOCIATION OF NORWAY', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø±Ø§Ø¨Ø·Ø© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© ÙÙŠ Ø§Ù„Ù†Ø±ÙˆÙŠØ¬\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:47'),
(252, 'ISLAMIC AID', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ù†Ø¸Ù…Ø© Ø§Ù„Ø¥ØºØ§Ø«Ø© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© ÙÙŠ Ù„Ù†Ø¯Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:47'),
(253, 'THE CORDOBA FOUNDATION', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ø¤Ø³Ø³Ø© Ù‚Ø±Ø·Ø¨Ø© ÙÙŠ Ø¨Ø±ÙŠØ·Ø§Ù†ÙŠØ§\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:48'),
(254, 'ISLAMIC RELETIEF WORLD WIDE', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù‡ÙŠØ¦Ø© Ø§Ù„Ø¥ØºØ§Ø«Ø© Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠØ© Ø§Ù„ØªØ§Ø¨Ø¹Ø© Ù„ØªÙ†Ø¸ÙŠÙ… Ø§Ù„Ø¥Ø®ÙˆØ§Ù† Ø§Ù„Ù…Ø³Ù„Ù…ÙŠÙ† Ø§Ù„Ø¯ÙˆÙ„ÙŠ\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:49'),
(255, 'ALRAHMA FOUNDATION FOR HUMAN DEVELOPMENT', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ø¤Ø³Ø³Ø© Ø§Ù„Ø±Ø­Ù…Ø© Ø§Ù„Ø®ÙŠØ±ÙŠØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:49'),
(256, 'BOSHRA NEWS AGENCY', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: ÙˆÙƒØ§Ù„Ø© Ø¨Ø´Ø±Ù‰ Ø§Ù„Ø¥Ø®Ø¨Ø§Ø±ÙŠØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:50'),
(257, 'ALNABAA TV', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù‚Ù†Ø§Ø© Ø§Ù„Ù†Ø¨Ø£\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:50'),
(258, 'TANASUH FOUNDATION FOR DAWA,CULTURE AND MEDIA', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ø¤Ø³Ø³Ø© Ø§Ù„ØªÙ†Ø§ØµØ­ Ù„Ù„Ø¯Ø¹ÙˆØ© ÙˆØ§Ù„Ø«Ù‚Ø§ÙØ© ÙˆØ§Ù„Ø¥Ø¹Ù„Ø§Ù…\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:51'),
(259, 'AL KHAYR SUPERMARKET', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø³ÙˆØ¨Ø± Ù…Ø§Ø±ÙƒØª Ø§Ù„Ø®ÙŠØ±\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (45) Ù„Ø³Ù†Ø© 2017', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:51'),
(260, 'INTERNATIONAL ISLAMIC COUNCIL', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ù…Ø¬Ù„Ø³ Ø§Ù„Ø¥Ø³Ù„Ø§Ù…ÙŠ Ø§Ù„Ø¹Ø§Ù„Ù…ÙŠ \"Ù…Ø³Ø§Ø¹\"\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (53) Ù„Ø³Ù†Ø© 2017', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:52'),
(261, 'INTERNATIONAL UNION OF MUSLIMS SCHOLARS', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø§Ù„Ø§ØªØ­Ø§Ø¯ Ø§Ù„Ø¹Ø§Ù„Ù…ÙŠ Ù„Ø¹Ù„Ù…Ø§Ø¡ Ø§Ù„Ù…Ø³Ù„Ù…ÙŠÙ†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (53) Ù„Ø³Ù†Ø© 2017', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:52'),
(262, 'RASHED EXCHANGE', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø±Ø§Ø´Ø¯ Ù„Ù„ØµØ±Ø§ÙØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (24) Ù„Ø³Ù†Ø© 2018', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:53'),
(263, 'JAHAN ARAS KISH', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬Ù‡Ø§Ù† Ø£Ø±Ø§Ø³ ÙƒÙŠØ´\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (24) Ù„Ø³Ù†Ø© 2018', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:53'),
(264, 'KHEDMATI AND COMPANY JOINT PARTNERSHIP', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø®Ø¯Ù…ØªÙŠ ÙˆØ´Ø±ÙƒØ§Ø¤Ù‡\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (24) Ù„Ø³Ù†Ø© 2018', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:54'),
(265, 'TAWASUL COMPANY', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø´Ø±ÙƒØ© ØªÙˆØ§ØµÙ„\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (51) Ù„Ø³Ù†Ø© 2020', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:54'),
(266, 'AL HARAM EXCHANGE', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø´Ø±ÙƒØ© Ø§Ù„Ù‡Ø±Ù… Ø§Ù„ØµØ±Ø§ÙØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (51) Ù„Ø³Ù†Ø© 2020', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:55'),
(267, 'AL KHALIDI EXCHANGE', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø´Ø±ÙƒØ© Ø§Ù„Ø®Ø§Ù„Ø¯ÙŠ Ù„Ù„ØµØ±Ø§ÙØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (51) Ù„Ø³Ù†Ø© 2020', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:56'),
(268, 'NEJAAT SOCIAL WALFARE ORGANIZATION (NEJAAT)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ù†Ø¸Ù…Ø© Ù†Ø¬Ø§Ø© Ù„Ù„Ø±Ø¹Ø§ÙŠØ© Ø§Ù„Ø§Ø¬ØªÙ…Ø§Ø¹ÙŠØ©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (51) Ù„Ø³Ù†Ø© 2020', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:56'),
(269, 'Ø´Ø±ÙƒØ© Ø§Ø«Ø§Ø± Ø§Ù„Ø£Ø´Ø¹Ø© Ù„Ù„ØªØ¬Ø§Ø±Ø©', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): RAY TRACING TRADING CO LLC\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 576485\nØ§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„ØªØ±Ø®ÙŠØµ: 2018-12-25\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:57'),
(270, 'Ø´Ø±ÙƒØ© Ù… Ø­ Ø§Ù„Ø­Ù…Ø±ÙŠØ© Ø§Ø±Ø²Ùˆ Ø§Ù„Ø¯ÙˆÙ„ÙŠØ© Ù… Ù… Ø­', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): H F Z A ARZOO INTERNATIONAL F Z E\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 1235\nØ§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„ØªØ±Ø®ÙŠØµ: 2021-06-13\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:58'),
(271, 'Ø´Ø±ÙƒØ© Ø­Ù†Ø§Ù† Ù„Ù„Ù…Ù„Ø§Ø­Ø©', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HANAN SHIPPING L.L.C\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 246003\nØ§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„ØªØ±Ø®ÙŠØµ: 2022-04-03\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:58'),
(272, 'Ø´Ø±ÙƒØ© ÙÙˆØ± ÙƒÙˆØ±Ù†Ø±Ø² Ø¨ØªØ±ÙˆÙ„ÙŠÙˆÙ…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): FOUR CORNERS TRADING EST\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 208202\nØ§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„ØªØ±Ø®ÙŠØµ: 2021-03-14\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:24:59'),
(273, 'Ø´Ø±ÙƒØ© Ø³Ø§Ø³ÙƒÙˆ Ù„ÙˆØ¬Ø³ØªÙŠÙƒ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SASCO LOGISTIC L.L.C\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 535215\nØ§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„ØªØ±Ø®ÙŠØµ: 2021-06-22\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:00'),
(274, 'Ø´Ø±ÙƒØ© Ø§Ù„Ø¬Ø±Ù…ÙˆØ²ÙŠ Ù„Ù„ØªØ¬Ø§Ø±Ø© Ø§Ù„Ø¹Ø§Ù…Ø©', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ALJARMOUZI GENERAL TRADING LLC\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 525824\nØ§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„ØªØ±Ø®ÙŠØµ: 2021-04-20\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:00'),
(275, 'Ø´Ø±ÙƒØ© Ø§Ù„Ø¬Ø±Ù…ÙˆØ²ÙŠ Ù„Ù„Ø´Ø­Ù† ÙˆØ§Ù„ØªØ®Ù„ÙŠØµ (Ø´.Ø°.Ù….Ù…)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL JARMOOZI CARGO & CLEARING (L.L.C)\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 546318\nØ§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„ØªØ±Ø®ÙŠØµ: 2021-06-19\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:01'),
(276, 'Ø´Ø±ÙƒØ© Ø§Ù„Ø¬Ø±Ù…ÙˆØ²ÙŠ Ù„Ù†Ù‚Ù„ Ø§Ù„Ù…ÙˆØ§Ø¯ Ø¨Ø§Ù„Ø´Ø§Ø­Ù†Ø§Øª Ø§Ù„Ø«Ù‚ÙŠÙ„Ø© ÙˆØ§Ù„Ø®ÙÙŠÙØ© (Ø´.Ø°.Ù….Ù…)', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL JARMOOZI TRANSPORT BY HEAVY & LIGHT TRUCKS (L.L.C\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 618449\nØ§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„ØªØ±Ø®ÙŠØµ: 2021-01-10\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:01'),
(277, 'Ø´Ø±ÙƒØ© Ù†Ø§ØµØ± Ø§Ù„Ø¬Ø±Ù…ÙˆØ²ÙŠ Ù„Ù„ØªØ¬Ø§Ø±Ø© Ø§Ù„Ø¹Ø§Ù…Ø© (Ø´.Ø°.Ù….Ù…)ØŒ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): NASER ALJARMOUZI CENERAL TRADING (L.L.C)\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 641142\nØ§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„ØªØ±Ø®ÙŠØµ: 2021-06-18\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:02'),
(278, 'Ø´Ø±ÙƒØ© Ù†Ø§ØµØ± Ø§Ù„Ø¬Ø±Ù…ÙˆØ²ÙŠ Ù„Ù„Ø´Ø­Ù† ÙˆØ§Ù„ØªØ®Ù„ÙŠØµ Ø´ Ø° Ù… Ù…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): NASER ALJARMOUZI CARGO & CLEARING LLC\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 644103\nØ§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„ØªØ±Ø®ÙŠØµ: 2021-08-29\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:03'),
(279, 'ÙˆÙŠÙ ØªÙƒ Ù„Ù„ÙƒÙ…Ø¨ÙŠÙˆØªØ± Ø° Ù… Ù…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): WAVE TECH COMPUTER LLC\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 117826\nØ§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„ØªØ±Ø®ÙŠØµ: 2021-04-29\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:03'),
(280, 'Ø§Ù† ÙˆØ§ÙŠ Ø¨ÙŠ Ø£ÙŠ ØªØ±ÙŠØ¯ÙŠÙ†Ø¬- Ù… Ù… Ø­', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): NYBI TRADING - FZE\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 13045\nØ§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„ØªØ±Ø®ÙŠØµ: 2017-12-19\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:04'),
(281, 'ÙƒÙ‰ Ø³Ù‰ Ø§Ù„ Ø¬Ù†Ø±Ø§Ù„ ØªØ±ÙŠØ¯Ù†Ø¬ Ù… Ù… Ø­', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): KCL GENERAL TRADING F Z E\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 9639\nØ§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„ØªØ±Ø®ÙŠØµ: 2017-12-20\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:05'),
(282, 'Ù…Ø¬Ù…ÙˆØ¹Ø© Ø§Ù„Ø§Ù†Ù…Ø§Ø¡', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Alinma group\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: Ø®Ø§Ø±Ø¬ Ø§Ù„Ø¯ÙˆÙ„Ø©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:05'),
(283, 'Ø´Ø±ÙƒØ© Ø§Ù„Ø¹Ù…Ù‚ÙŠ ÙˆØ¥Ø®ÙˆØ§Ù†Ù‡ Ù„Ù„ØµØ±Ø§ÙØ©', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-OMGY & BROS MONEY EXCHANGE\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: Ø®Ø§Ø±Ø¬ Ø§Ù„Ø¯ÙˆÙ„Ø©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:06'),
(284, 'Ø§Ù„Ø¹Ø§Ù„Ù…ÛŒØ© Ø¥Ú©Ø³Ø¨Ø±Ø³ Ù„Ù„ØµØ±Ø§ÙØ© ÙˆØ§Ù„ØªØ­ÙˆÛŒÙ„Ø§Øª Ø§Ù„Ù…Ø§Ù„ÛŒØ©', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AlAlameya Express Company for Exchange & Remittance\nØ§Ù„Ù…Ù‚Ø±: ØµÙ†Ø¹Ø§Ø¡ - Ø§Ù„ÙŠÙ…Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (13) Ù„Ø³Ù†Ø© 2022', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:06'),
(285, 'Ø´Ø±Ú©Ø© Ø§Ù„Ø­Ø¸Ø§Ø¡ Ù„Ù„ØµØ±Ø§ÙØ©', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): Al Hadha Exchange Co\nØ§Ù„Ù…Ù‚Ø±: ØµÙ†Ø¹Ø§Ø¡ - Ø§Ù„ÙŠÙ…Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (13) Ù„Ø³Ù†Ø© 2022', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:07'),
(286, 'Ù…Ø¹Ø§Ø° Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ Ø¯Ø§Ø¦Ù„ Ù„Ù„Ø¥Ø³ØªÙŠØ±Ø§Ø¯ Ùˆ Ø§Ù„ØªØµØ¯ÙŠØ±', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOAZ ABDULLA DAEL FOR IMPORT AND EXPORT\nØ§Ù„Ù…Ù‚Ø±: ØµÙ†Ø¹Ø§Ø¡ - Ø§Ù„ÙŠÙ…Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (13) Ù„Ø³Ù†Ø© 2022', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:07'),
(287, 'Ø¨ÛŒØ±ÛŒØ¯ÙˆØª Ù„Ù„ØªØ¬Ø§Ø±Ø© ÙˆØ§Ù„Ø´Ø­Ù† Ø° Ù… Ù…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): PERIDOT SHIPPING AND TRADING LLC\nØ§Ù„Ù…Ù‚Ø±: Ø§Ù„Ù‡Ù†Ø¯\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (13) Ù„Ø³Ù†Ø© 2022', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:08'),
(288, 'Ù„Ø§ÙŠØª Ù…ÙˆÙ†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): LIGHT MOON\nÙ…Ù„Ø§Ø­Ø¸Ø§Øª: (IMO 9109550)\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (13) Ù„Ø³Ù†Ø© 2022', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:09'),
(289, 'CTEX EXCHANGE', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 2061281 - Ù„Ø¨Ù†Ø§Ù†\nØ§Ù„Ù…Ù‚Ø±: Ù„Ø¨Ù†Ø§Ù†\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (9) Ù„Ø³Ù†Ø© 2023', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:09'),
(290, 'CAMBRIDGE EDUCATION AND TRAINING CENTER LTD', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø£Ø­Ù…Ø¯ Ù…Ø­Ù…Ø¯ Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ Ù…Ø­Ù…Ø¯ Ø§Ù„Ø´ÙŠØ¨Ø© Ø§Ù„Ù†Ø¹ÙŠÙ…ÙŠ\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 8961546\nØ§Ù„Ù…Ù‚Ø±: Ø§Ù„Ù…Ù…Ù„ÙƒØ© Ø§Ù„Ù…ØªØ­Ø¯Ø©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:10'),
(291, 'IMA6INE LTD', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 9881248\nØ§Ù„Ù…Ù‚Ø±: Ø§Ù„Ù…Ù…Ù„ÙƒØ© Ø§Ù„Ù…ØªØ­Ø¯Ø©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:10'),
(292, 'WEMBLEY TREE LTD', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 15167935\nØ§Ù„Ù…Ù‚Ø±: Ø§Ù„Ù…Ù…Ù„ÙƒØ© Ø§Ù„Ù…ØªØ­Ø¯Ø©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:11'),
(293, 'WASLAFORALL', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø§Ø¦Ø´Ø© Ø§Ø­Ù…Ø¯ Ù…Ø­Ù…Ø¯ Ø§Ù„Ø´ÙŠØ¨Ø© Ø§Ù„Ù†Ø¹ÙŠÙ…ÙŠ\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 11617032\nØ§Ù„Ù…Ù‚Ø±: Ø§Ù„Ù…Ù…Ù„ÙƒØ© Ø§Ù„Ù…ØªØ­Ø¯Ø©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:12'),
(294, 'FUTURE GRADUATES LTD', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ ØµÙ‚Ø± ÙŠÙˆØ³Ù ØµÙ‚Ø± Ø§Ù„Ø²Ø¹Ø§Ø¨ÙŠ\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 9448340\nØ§Ù„Ù…Ù‚Ø±: Ø§Ù„Ù…Ù…Ù„ÙƒØ© Ø§Ù„Ù…ØªØ­Ø¯Ø©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:12'),
(295, 'YAS FOR INVESTMENT AND REAL ESTATE', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯Ø§Ù„Ø±Ø­Ù…Ù† Ø­Ø³Ù† Ù…Ù†ÙŠÙ Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ Ø­Ø³Ù† Ø§Ù„Ø¬Ø§Ø¨Ø±ÙŠ\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 10720363\nØ§Ù„Ù…Ù‚Ø±: Ø§Ù„Ù…Ù…Ù„ÙƒØ© Ø§Ù„Ù…ØªØ­Ø¯Ø©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:13'),
(296, 'HOLDCO UK PROPERTIES LIMITED', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 15745822\nØ§Ù„Ù…Ù‚Ø±: Ø§Ù„Ù…Ù…Ù„ÙƒØ© Ø§Ù„Ù…ØªØ­Ø¯Ø©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:14');
INSERT INTO `goaml` (`id`, `name`, `phone`, `status`, `note`, `type`, `created_by`, `created_at`) VALUES
(297, 'NAFEL CAPITAL', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø§Ù„ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ±Ù‚Ù… Ø§Ù„Ø±Ø®ØµØ©: 15672268\nØ§Ù„Ù…Ù‚Ø±: Ø§Ù„Ù…Ù…Ù„ÙƒØ© Ø§Ù„Ù…ØªØ­Ø¯Ø©\nÙ…Ø¹Ù„ÙˆÙ…Ø§Øª Ø£Ø®Ø±Ù‰: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (1) Ù„Ø³Ù†Ø© 2025', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:14'),
(298, 'Ù…Ø­Ù…Ø¯ Ø³Ø¹ÙŠØ¯ Ø¨Ù† Ø­Ù„ÙˆØ§Ù† Ø§Ù„Ø³Ù‚Ø·Ø±ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø³Ù‚Ø·Ø±ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-SEQATRI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMAD SAEED BIN HELWAN AL-SEQATRI\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø³Ø¹ÙŠØ¯ Ø¨Ù† Ø­Ù„ÙˆØ§Ù† Ø§Ù„Ø³Ù‚Ø·Ø±ÙŠ\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:15'),
(299, 'Ø®Ù„ÙŠÙØ© Ø¨Ù† Ù…Ø­Ù…Ø¯ Ø§Ù„Ø±Ø¨Ø§Ù†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø±Ø¨Ø§Ù†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-RABBAN\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): KHALIFA BIN MOHAMMAD AL-RABBAN\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-05-12\nØ§Ù„Ø§Ø³Ù…: Ø®Ù„ÙŠÙØ© Ø¨Ù† Ù…Ø­Ù…Ø¯ Ø§Ù„Ø±Ø¨Ø§Ù†\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:15'),
(300, 'Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø¨Ù† Ø®Ø§Ù„Ø¯ Ø­Ù…Ø¯ Ø¨Ù† Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø¢Ù„ Ø«Ø§Ù†ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø¢Ù„ Ø«Ø§Ù†ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-THANI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDULLAH BIN KHALID BIN HAMAD BIN ABDULLAH AL-THANI\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1905-05-09\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø¨Ù† Ø®Ø§Ù„Ø¯ Ø­Ù…Ø¯ Ø¨Ù† Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø¢Ù„ Ø«Ø§Ù†ÙŠ\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:16'),
(301, 'Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­ÙŠÙ… Ø£Ø­Ù…Ø¯ Ø§Ù„Ø­Ø±Ø§Ù…', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø­Ø±Ø§Ù…\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-HARAM\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDUL RAHIM AHMAD AL-HARAM\nØ§Ù„Ø§Ø³Ù…: Ø¹Ø¨Ø¯ Ø§Ù„Ø±Ø­ÙŠÙ… Ø£Ø­Ù…Ø¯ Ø§Ù„Ø­Ø±Ø§Ù…\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:17'),
(302, 'Ù…Ø¨Ø§Ø±Ùƒ Ø¨Ù† Ù…Ø­Ù…Ø¯ Ø§Ù„Ø¹Ø¬ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¹Ø¬ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-AJJI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MUBARAK MOHAMMAD AL-AJJI\nØ§Ù„Ø§Ø³Ù…: Ù…Ø¨Ø§Ø±Ùƒ Ø¨Ù† Ù…Ø­Ù…Ø¯ Ø§Ù„Ø¹Ø¬ÙŠ\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:17'),
(303, 'Ø¬Ø§Ø¨Ø± Ø¨Ù† Ù†Ø§ØµØ± Ø§Ù„Ù…Ø±ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ù…Ø±ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-MARRI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): JABIR BIN NASSER AL-MARRI\nØ§Ù„Ø§Ø³Ù…: Ø¬Ø§Ø¨Ø± Ø¨Ù† Ù†Ø§ØµØ± Ø§Ù„Ù…Ø±ÙŠ\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:18'),
(304, 'Ù…Ø­Ù…Ø¯ Ø¬Ø§Ø³Ù… Ø§Ù„Ø³Ù„ÙŠØ·ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø³Ù„ÙŠØ·ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-SULAITI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMED JASSIM AL-SULAITI\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø¬Ø§Ø³Ù… Ø§Ù„Ø³Ù„ÙŠØ·ÙŠ\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:18'),
(305, 'Ø¹Ù„ÙŠ Ø¨Ù† Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø§Ù„Ø³ÙˆÙŠØ¯ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø³ÙˆÙŠØ¯ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-SUWAIDI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ALI BIN ABDALLAH AL-SUWAIDI\nØ§Ù„Ø§Ø³Ù…: Ø¹Ù„ÙŠ Ø¨Ù† Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø§Ù„Ø³ÙˆÙŠØ¯ÙŠ\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:19'),
(306, 'Ù‡Ø§Ø´Ù… Ù…Ø­Ù…Ø¯ ØµØ§Ù„Ø­ Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø§Ù„Ø¹ÙˆØ¶ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¹ÙˆØ¶ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-AWADHY\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HASHIM SALEH ABDULLAH AL-AWADHY\nØ§Ù„Ø§Ø³Ù…: Ù‡Ø§Ø´Ù… Ù…Ø­Ù…Ø¯ ØµØ§Ù„Ø­ Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø§Ù„Ø¹ÙˆØ¶ÙŠ\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:20'),
(307, 'Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø§Ù„ÙØ·ÙŠØ³ Ø§Ù„Ù…Ø±ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ù…Ø±ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-MARRI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HAMAD ABDULLAH AL-FUTTAIS AL-MARRI\nØ§Ù„Ø§Ø³Ù…: Ø­Ù…Ø¯ Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø§Ù„ÙØ·ÙŠØ³ Ø§Ù„Ù…Ø±ÙŠ\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:20'),
(308, 'Ø®Ø§Ù„Ø¯ Ø³Ø¹ÙŠØ¯ ÙØ¶Ù„ Ø±Ø§Ø´Ø¯ Ø§Ù„Ø±ÙˆÙ…ÙŠ Ø§Ù„Ø¨ÙˆØ¹ÙŠÙ†ÙŠÙ†', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø¨ÙˆØ¹ÙŠÙ†ÙŠÙ†\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-BOUNEIN\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): KHALID SAEED AL-BOUNEIN\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1967-12-31\nØ§Ù„Ø§Ø³Ù…: Ø®Ø§Ù„Ø¯ Ø³Ø¹ÙŠØ¯ ÙØ¶Ù„ Ø±Ø§Ø´Ø¯ Ø§Ù„Ø±ÙˆÙ…ÙŠ Ø§Ù„Ø¨ÙˆØ¹ÙŠÙ†ÙŠÙ†\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:21'),
(309, 'Ø´Ù‚Ø± Ø¬Ù…Ø¹Ø© Ø§Ù„Ø´Ù‡ÙˆØ§Ù†ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø´Ù‡ÙˆØ§Ù†ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-SHAHWANI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SHAQER JUMMAH AL-SHAHWANI\nØ§Ù„Ø§Ø³Ù…: Ø´Ù‚Ø± Ø¬Ù…Ø¹Ø© Ø§Ù„Ø´Ù‡ÙˆØ§Ù†ÙŠ\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:22'),
(310, 'ØµØ§Ù„Ø­ Ø¨Ù† Ø£Ø­Ù…Ø¯ Ø§Ù„ØºØ§Ù†Ù… Ø§Ù„ÙƒÙˆØ§Ø±ÙŠ', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„ÙƒÙˆØ§Ø±ÙŠ\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-KUWARI\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SALEH BIN AHMED AL-GHANIM AL-KUWARI\nØ§Ù„Ø§Ø³Ù…: ØµØ§Ù„Ø­ Ø¨Ù† Ø£Ø­Ù…Ø¯ Ø§Ù„ØºØ§Ù†Ù… Ø§Ù„ÙƒÙˆØ§Ø±ÙŠ\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:22'),
(311, 'Ù…Ø­Ù…Ø¯ Ø³Ù„ÙŠÙ…Ø§Ù† Ø­ÙŠØ¯Ø± Ù…Ø­Ù…Ø¯ Ø§Ù„Ø­ÙŠØ¯Ø±', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ù‚Ø·Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©): Ø§Ù„Ø­ÙŠØ¯Ø±\nØ§Ø³Ù… Ø§Ù„Ø¹Ø§Ø¦Ù„Ø© (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): AL-HAYDAR\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MOHAMMED SULAIMAN HAIDAR MOHAMMED AL-HAYDAR\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1955-12-31\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ù‚Ø·Ø±\nØ§Ù„Ø§Ø³Ù…: Ù…Ø­Ù…Ø¯ Ø³Ù„ÙŠÙ…Ø§Ù† Ø­ÙŠØ¯Ø± Ù…Ø­Ù…Ø¯ Ø§Ù„Ø­ÙŠØ¯Ø±\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 01030941\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ù‚Ø·Ø±\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø¥ØµØ¯Ø§Ø±: 26/03/2012\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø§Ù†ØªÙ‡Ø§Ø¡: 2017-03-24\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (53) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:23'),
(312, 'Ø­ÙŠØ¯Ø± Ø­Ø¨ÙŠØ¨ Ø¹Ù„Ù‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø¹Ø±Ø§Ù‚\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): HAYDER HABEEB ALI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ø¹Ø±Ø§Ù‚\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 3899559\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:24'),
(313, 'Ø¨Ø§Ø³Ù… ÙŠÙˆØ³Ù Ø­Ø³ÙŠÙ† Ø§Ù„Ø´ØºØ§Ù†Ø¨Ù‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ø¹Ø±Ø§Ù‚\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): BASIM YOUSUF HUSSEIN ALSHAGHANBI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ø¹Ø±Ø§Ù‚\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 44907857\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:24'),
(314, 'Ø´Ø±ÙŠÙ Ø§Ø­Ù…Ø¯ Ø´Ø±ÙŠÙ Ø¨Ø§Ø¹Ù„ÙˆÙ‰', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): SHARIF AHMED SHARIF BA ALAWI\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 43260201\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:25'),
(315, 'Ù…Ø§Ù†ÙˆØ¬ Ø³Ø§Ø¨Ø§Ø±ÙˆØ§Ù„ Ø§Ùˆ Ø¨Ø±Ø§ÙƒØ§Ø´', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„Ù‡Ù†Ø¯\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): MANOJ SABHARWAL OM PRAKASH\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: Ø§Ù„Ù‡Ù†Ø¯\nØ§Ù„Ù†ÙˆØ¹: Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù…ÙˆØ­Ø¯\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 4415541\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (83) Ù„Ø³Ù†Ø© 2021\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (24) Ù„Ø³Ù†Ø© 2024', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:26'),
(316, 'Ø¹Ø¨Ø¯Ù‡ Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ø¯Ø§Ø¦Ù„ Ø§Ø­Ù…Ø¯', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - Ø£ÙØ±Ø§Ø¯\nØ§Ù„ØªØµÙ†ÙŠÙ: Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø¬Ù†Ø³ÙŠØ©: Ø§Ù„ÙŠÙ…Ù†\nØ§Ù„Ø§Ø³Ù… Ø§Ù„ÙƒØ§Ù…Ù„ (Ø¨Ø§Ù„Ø­Ø±ÙˆÙ Ø§Ù„Ù„Ø§ØªÙŠÙ†ÙŠØ©): ABDO ABDULLAH DAEL AHMED\nØªØ§Ø±ÙŠØ® Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: 1979-09-12\nÙ…ÙƒØ§Ù† Ø§Ù„Ù…ÙŠÙ„Ø§Ø¯: ØªØ¹Ø² Ø§Ù„Ù…Ø®Ø§\nØ§Ù„Ù†ÙˆØ¹: Ø¬ÙˆØ§Ø² Ø³ÙØ±\nØ±Ù‚Ù… Ø§Ù„ÙˆØ«ÙŠÙ‚Ø©: 8948884\nØ¬Ù‡Ø© Ø§Ù„Ø¥ØµØ¯Ø§Ø±: Ø§Ù„ÙŠÙ…Ù†\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø¥ØµØ¯Ø§Ø±: 2020-06-03\nØªØ§Ø±ÙŠØ® Ø§Ù„Ø§Ù†ØªÙ‡Ø§Ø¡: 2026-06-03\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (13) Ù„Ø³Ù†Ø© 2022\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (48) Ù„Ø³Ù†Ø© 2024', 'Ø´Ø®Øµ Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:26'),
(317, 'CANVAS : CENTER FOR APPLIED NONVIOLENT ACTION AND STRATEGIES', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ù†Ø¸Ù…Ø© ÙƒØ§Ù†ÙØ§Ø³ ÙÙŠ ØµØ±Ø¨ÙŠØ§/ Ø¨Ù„Ø¬Ø±Ø§Ø¯\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (41) Ù„Ø³Ù†Ø© 2014\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:27'),
(318, 'QATAR VOLUNTEER CENTER', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ø±ÙƒØ² Ù‚Ø·Ø± Ù„Ù„Ø¹Ù…Ù„ Ø§Ù„ØªØ·ÙˆØ¹ÙŠ (Ù‚Ø·Ø±)\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:28'),
(319, 'DOHA APPLE', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø´Ø±ÙƒØ© Ø¯ÙˆØ­Ø© Ø£Ø¨Ù„ (Ø´Ø±ÙƒØª Ø¥Ù†ØªØ±Ù†Øª ÙˆØ¯Ø¹Ù… ØªÙƒÙ†ÙˆÙ„ÙˆØ¬ÙŠ (Ù‚Ø·Ø±)\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:28'),
(320, 'QATAR CHARITY', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù‚Ø·Ø± Ø§Ù„Ø®ÙŠØ±ÙŠØ© (Ù‚Ø·Ø±)\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:29'),
(321, 'EID CHARITY', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ø¤Ø³Ø³Ø© Ø§Ù„Ø´ÙŠØ® Ø¹ÙŠØ¯ Ø¢Ù„ Ø«Ø§Ù†ÙŠ Ø§Ù„Ø®ÙŠØ±ÙŠØ© (Ù‚Ø·Ø±)\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:30'),
(322, 'SHEIKH THANI BIN ABDULLAH FOUNDATION FOR HUMANITARIAN SERVICE', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ø¤Ø³Ø³Ø© Ø§Ù„Ø´ÙŠØ® Ø«Ø§Ù†ÙŠ Ø¨Ù† Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ù‡ Ù„Ù„Ø®Ø¯Ù…Ø§Øª Ø§Ù„Ø¥Ù†Ø³Ø§Ù†ÙŠØ© (Ù‚Ø·Ø±)\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (18) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:30'),
(323, 'AL-BALAGH CHARITABLE FOUNDATION', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ù…Ø¤Ø³Ø³Ø© Ø§Ù„Ø¨Ù„Ø§Øº Ø§Ù„Ø®ÙŠØ±ÙŠØ©\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:31'),
(324, 'AL-IHSAN CHARITABLE SOCIETY', NULL, 'compliant', 'Ù…ØµØ¯Ø± Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ - ÙƒÙŠØ§Ù†Ø§Øª\nØ§Ù„ØªØµÙ†ÙŠÙ: ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ\nØ§Ù„Ø§Ø³Ù…: Ø¬Ù…Ø¹ÙŠØ© Ø§Ù„Ø¥Ø­Ø³Ø§Ù† Ø§Ù„Ø®ÙŠØ±ÙŠØ©\nÙ‚Ø±Ø§Ø± Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ù…Ø¯Ø±Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (28) Ù„Ø³Ù†Ø© 2017\nÙ‚Ø±Ø§Ø± Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬: Ø±ÙØ¹ Ø§Ù„Ø¥Ø¯Ø±Ø§Ø¬ Ø¨Ù…ÙˆØ¬Ø¨ Ù‚Ø±Ø§Ø± Ù…Ø¬Ù„Ø³ Ø§Ù„ÙˆØ²Ø±Ø§Ø¡ Ø±Ù‚Ù… (88) Ù„Ø³Ù†Ø© 2023', 'ÙƒÙŠØ§Ù† Ø¥Ø±Ù‡Ø§Ø¨ÙŠ', NULL, '2025-10-31 00:25:31');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `invoices`
--

CREATE TABLE `invoices` (
  `id` int NOT NULL,
  `invoice_date` date NOT NULL,
  `branch_id` int DEFAULT NULL,
  `invoice_number` varchar(100) NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `client_id` int DEFAULT NULL,
  `bank_account_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'pending',
  `currency` varchar(10) DEFAULT 'AED',
  `vat` decimal(5,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_date`, `branch_id`, `invoice_number`, `amount`, `client_id`, `bank_account_id`, `created_at`, `created_by`, `status`, `currency`, `vat`) VALUES
(8, '2025-11-01', 2, 'INV-2025-00008', '210.00', 77, NULL, '2025-11-01 13:49:28', 90, 'approved', 'AED', '5.00'),
(9, '2025-11-02', 3, 'INV-2025-00009', '221.55', 77, 1, '2025-11-02 16:49:38', 90, 'rejected', 'AED', '5.00'),
(10, '2025-11-04', 3, 'INV-2025-00010', '4000.00', 79, 1, '2025-11-04 07:57:30', 90, 'approved', 'AED', '0.00');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `invoice_attachments`
--

CREATE TABLE `invoice_attachments` (
  `id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `attachment_url` text COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `attachment_name` varchar(1055) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `description`, `amount`) VALUES
(12, 8, 'test', '200.00'),
(13, 9, '211', '211.00'),
(14, 10, 'Ø¹Ø¯Ø¯ 2 Ø§Ø³ØªØ´Ø§Ø±Ø© Ù‚Ø§Ù†ÙˆÙ†ÙŠØ©', '4000.00');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `judicial_orders`
--

CREATE TABLE `judicial_orders` (
  `id` int NOT NULL,
  `case_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `status` enum('pending','executed','appealed','cancelled') DEFAULT 'pending',
  `service_completed` tinyint(1) NOT NULL DEFAULT '0',
  `notification_period_days` varchar(11) NOT NULL,
  `case_filed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `judicial_orders`
--

INSERT INTO `judicial_orders` (`id`, `case_id`, `date`, `status`, `service_completed`, `notification_period_days`, `case_filed`, `created_at`) VALUES
(18, 139, '2025-10-04', 'pending', 1, '14', 0, '2025-10-05 15:27:09'),
(20, 142, '2025-09-02', 'pending', 1, '15', 1, '2025-10-13 10:41:40'),
(24, 160, '2025-10-29', 'pending', 1, '7', 0, '2025-11-01 14:44:04');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `judicial_orders_documents`
--

CREATE TABLE `judicial_orders_documents` (
  `id` int NOT NULL,
  `judicial_order_id` int NOT NULL,
  `document_url` varchar(2055) NOT NULL,
  `document_name` varchar(1055) NOT NULL,
  `employee_id` int DEFAULT NULL,
  `created at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `leaves`
--

CREATE TABLE `leaves` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `leave_type` enum('annual','sick','emergency','maternity','unpaid') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `duration_days` int NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `notes` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `legal_periods`
--

CREATE TABLE `legal_periods` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `objection_days` int DEFAULT NULL,
  `appeal_days` int DEFAULT NULL,
  `cassation_days` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `legal_periods`
--

INSERT INTO `legal_periods` (`id`, `name`, `objection_days`, `appeal_days`, `cassation_days`, `created_at`, `created_by`) VALUES
(1, 'Ø§Ù„ØªØ¬Ø§Ø±ÙŠØ© ÙˆØ§Ù„Ù…Ø¯Ù†ÙŠØ© ÙˆØ§Ù„Ø¹Ù…Ø§Ù„ÙŠØ© Ø§Ù‚Ù„ Ù…Ù† 500,000 Ø¯Ø±Ù‡Ù…', NULL, 30, NULL, '2025-10-29 02:45:41', NULL),
(2, 'Ø§Ù„ØªØ¬Ø§Ø±ÙŠØ© ÙˆØ§Ù„Ù…Ø¯Ù†ÙŠØ© ÙˆØ§Ù„Ø¹Ù…Ø§Ù„ÙŠØ© Ø§Ù‚Ù„ Ù…Ù† 500,000 Ø¯Ø±Ù‡Ù…', NULL, 30, NULL, '2025-10-29 02:58:20', NULL),
(3, 'Ø§Ù„ØªØ¬Ø§Ø±ÙŠØ© ÙˆØ§Ù„Ù…Ø¯Ù†ÙŠØ© ÙˆØ§Ù„Ø¹Ù…Ø§Ù„ÙŠØ© Ø§ÙƒØ«Ø± Ù…Ù† 500,000 Ø¯Ø±Ù‡Ù…', NULL, 30, 30, '2025-10-29 03:27:04', NULL),
(4, 'Ø§Ù„Ø¯Ø¹Ø§ÙˆÙ‰ Ø§Ù„Ù…Ø³ØªØ¹Ø¬Ù„Ø© ', NULL, 10, NULL, '2025-10-29 04:03:35', NULL),
(5, ' Ø§Ù„Ù‚Ø¶Ø§ÙŠØ§ Ø§Ù„Ø¬Ø²Ø§Ø¦ÙŠØ©', NULL, 15, 15, '2025-10-29 04:31:42', NULL),
(6, 'Ø§Ù„Ù‚Ø¶Ø§ÙŠØ§ Ø§Ù„Ø¬Ø²Ø§Ø¦ÙŠØ©', NULL, 15, 30, '2025-10-30 06:08:30', NULL),
(7, 'Ø¯Ø¹Ø§ÙˆÙ‰ Ø§Ù„Ø§Ø­ÙˆØ§Ù„ Ø§Ù„Ø´Ø®ØµÙŠØ©', NULL, 30, 30, '2025-10-30 06:09:05', NULL),
(8, 'Ø§Ù„ØªØ¬Ø±Ø¨Ø© Ø§Ù„ÙŠØ¯ÙˆÙŠØ©', NULL, 8, NULL, '2025-10-30 16:15:43', NULL);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `litigation_degrees`
--

CREATE TABLE `litigation_degrees` (
  `id` int NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `litigation_degrees`
--

INSERT INTO `litigation_degrees` (`id`, `name_ar`, `name_en`, `created_at`) VALUES
(26, 'Ø§Ù„Ù…Ø­ÙƒÙ…Ø© Ø§Ù„Ø§Ø¨ØªØ¯Ø§Ø¦ÙŠØ©', 'Primary Court', '2025-09-18 06:21:35'),
(27, 'Ù…Ø­ÙƒÙ…Ø© Ø§Ù„Ø§Ø³ØªØ¦Ù†Ø§Ù', 'Court of Appeal', '2025-09-18 06:21:35'),
(28, 'Ø§Ù„Ù…Ø­ÙƒÙ…Ø© Ø§Ù„Ø¹Ù„ÙŠØ§', 'Supreme Court', '2025-09-18 06:21:35'),
(29, 'Ø§Ù„Ù…Ø­ÙƒÙ…Ø© Ø§Ù„ØªØ¬Ø§Ø±ÙŠØ©', 'Commercial Court', '2025-09-18 06:21:35'),
(30, 'Ù…Ø­ÙƒÙ…Ø© Ø§Ù„ØªÙ†ÙÙŠØ°', 'Execution Court', '2025-09-18 06:21:35');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `logs`
--

CREATE TABLE `logs` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `action` enum('add','update','delete','login','other') NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `logs`
--

INSERT INTO `logs` (`id`, `employee_id`, `action`, `description`, `created_at`) VALUES
(142, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…ÙˆØ¸Ù: Ø±Ø²Ø§Ù† (ID: 117)', '2025-10-30 00:09:34'),
(143, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…ÙˆØ¸Ù: Nour qandil (ID: 118)', '2025-10-30 00:13:03'),
(144, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…ÙˆØ¸Ù: Umar usman (ID: 119)', '2025-10-30 00:15:12'),
(145, 90, 'add', 'Ø£Ø¶Ø§Ù Ø­Ø¯Ø«: Ø§Ø¬ØªÙ…Ø§Ø¹ Ù…Ø¹ ÙØ±ÙŠÙ‚ Ø¹Ù…Ù„ Ø§Ù„Ù…Ø³ØªÙƒØ´Ù (ID: 3)', '2025-10-30 00:25:47'),
(146, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ø­Ø¯Ø«: Ø§Ø¬ØªÙ…Ø§Ø¹ Ù…Ø¹ ÙØ±ÙŠÙ‚ Ø¹Ù…Ù„ Ø§Ù„Ù…Ø³ØªÙƒØ´Ù (ID: 3)', '2025-10-30 00:26:11'),
(147, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ø­Ø¯Ø«: Ø§Ø¬ØªÙ…Ø§Ø¹ Ù…Ø¹ ÙØ±ÙŠÙ‚ Ø¹Ù…Ù„ Ø§Ù„Ù…Ø³ØªÙƒØ´Ù (ID: 3)', '2025-10-30 00:26:44'),
(148, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ø­Ø¯Ø«: Ø§Ø¬ØªÙ…Ø§Ø¹ Ù…Ø¹ ÙØ±ÙŠÙ‚ Ø¹Ù…Ù„ Ø§Ù„Ù…Ø³ØªÙƒØ´Ù (ID: 3)', '2025-10-30 00:27:15'),
(149, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 00:42:33'),
(150, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 01:07:42'),
(151, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 01:08:14'),
(152, 119, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: Umar usman', '2025-10-30 01:08:31'),
(153, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 01:09:10'),
(154, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù…ÙˆØ¸Ù: Ashly Philip (ID: 114)', '2025-10-30 01:10:50'),
(155, 119, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: Umar usman', '2025-10-30 01:11:14'),
(156, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 01:12:31'),
(157, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù…ÙˆØ¸Ù: Umar usman (ID: 119)', '2025-10-30 01:13:10'),
(158, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 01:13:37'),
(159, 119, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: Umar usman', '2025-10-30 01:13:55'),
(160, 119, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: Umar usman', '2025-10-30 01:15:23'),
(161, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 01:15:45'),
(162, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 01:18:24'),
(163, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 01:28:03'),
(164, 90, 'add', 'Ø£Ø¶Ø§Ù Ø­Ø¯Ø«: test (ID: 4)', '2025-10-30 02:39:31'),
(165, 80, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: Ù…Ø±ÙˆÙ‰ Ù…Ø³Ø¹Ø¯', '2025-10-30 02:40:14'),
(166, 80, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: Ù…Ø±ÙˆÙ‰ Ù…Ø³Ø¹Ø¯', '2025-10-30 02:40:40'),
(167, 90, 'delete', 'Ø­Ø°Ù Ø­Ø¯Ø«: Ø§Ø¬ØªÙ…Ø§Ø¹ Ù…Ø¹ ÙØ±ÙŠÙ‚ Ø¹Ù…Ù„ Ø§Ù„Ù…Ø³ØªÙƒØ´Ù (ID: 3)', '2025-10-30 02:41:21'),
(168, 90, 'add', 'Ø£Ø¶Ø§Ù Ø­Ø¯Ø«: test (ID: 5)', '2025-10-30 02:42:09'),
(169, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 02:46:54'),
(170, 90, 'delete', 'Ø­Ø°Ù Ø·Ø±Ù: y878 (ID: 70)', '2025-10-30 02:47:14'),
(171, 90, 'add', 'Ø£Ø¶Ø§Ù Ø·Ø±Ù: 322e2 (ID: 71)', '2025-10-30 04:30:18'),
(172, 90, 'delete', 'Ø­Ø°Ù Ø§Ø¬ØªÙ…Ø§Ø¹: Ø§Ø¬ØªÙ…Ø§Ø¹ (ID: 15)', '2025-10-30 04:46:38'),
(173, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 04:48:52'),
(174, 90, 'delete', 'Ø­Ø°Ù Ø·Ø±Ù: 322e2 (ID: 71)', '2025-10-30 04:51:54'),
(175, 90, 'add', 'Ø£Ø¶Ø§Ù Ø·Ø±Ù: ytrr (ID: 72)', '2025-10-30 04:52:24'),
(176, 90, 'add', 'Ø£Ø¶Ø§Ù Ø·Ø±Ù: hgf (ID: 73)', '2025-10-30 04:59:01'),
(177, 90, 'add', 'Ø£Ø¶Ø§Ù Ø·Ø±Ù: brgbgrf (ID: 74)', '2025-10-30 04:59:48'),
(178, 90, 'delete', 'Ø­Ø°Ù Ø·Ø±Ù: brgbgrf (ID: 74)', '2025-10-30 04:59:56'),
(179, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 05:50:20'),
(180, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 06:29:51'),
(181, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 06:34:44'),
(182, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 06:35:34'),
(183, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 06:42:15'),
(184, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 06:42:30'),
(185, 117, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: Ø±Ø²Ø§Ù†', '2025-10-30 06:50:26'),
(186, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 06:52:01'),
(187, 97, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: ali', '2025-10-30 06:54:53'),
(188, 97, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: ali', '2025-10-30 06:59:52'),
(189, 97, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: ali', '2025-10-30 07:25:15'),
(190, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 09:38:37'),
(191, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 09:39:35'),
(192, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…Ù‡Ù…Ø©: test (ID: 51)', '2025-10-30 10:07:18'),
(193, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù…Ù‡Ù…Ø©: test (ID: 51)', '2025-10-30 10:08:26'),
(194, 97, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: ali', '2025-10-30 10:10:44'),
(195, 97, 'update', 'Ø­Ø¯Ù‘Ø« Ù…Ù‡Ù…Ø©: test (ID: 51)', '2025-10-30 10:12:44'),
(196, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù…Ù‡Ù…Ø©: test (ID: 51)', '2025-10-30 10:15:10'),
(197, 90, 'add', 'Ø£Ø¶Ø§Ù Ø·Ø±Ù: Ø­Ø³ÙŠÙ† Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ø·ÙŠÙ (ID: 75)', '2025-10-30 10:45:44'),
(198, 90, 'add', 'Ø£Ø¶Ø§Ù Ù‚Ø¶ÙŠØ©: 123456789 (ID: 158)', '2025-10-30 10:48:24'),
(199, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…Ù‡Ù…Ø©: ØªØ³Ø¬ÙŠÙ„ Ø§Ù„Ø¯Ø¹ÙˆÙ‰ ÙÙŠ Ø§Ù„Ù…Ø­ÙƒÙ…Ø© (ID: 52)', '2025-10-30 10:48:25'),
(200, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù‚Ø¶ÙŠØ©: 20251030104824 (ID: 158)', '2025-10-30 10:49:07'),
(201, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ø·Ø±Ù: Ø­Ø³ÙŠÙ† Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ø·ÙŠÙ (ID: 75)', '2025-10-30 10:54:00'),
(202, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù…ÙˆØ¸Ù: Ø±Ø²Ø§Ù† (ID: 117)', '2025-10-30 10:54:22'),
(203, 117, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: Ø±Ø²Ø§Ù†', '2025-10-30 10:56:18'),
(204, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 11:51:54'),
(205, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 11:57:03'),
(206, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 12:00:36'),
(207, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 16:02:19'),
(208, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 16:04:18'),
(209, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¬Ù„Ø³Ø©: Ø¬Ù„Ø³Ø© Ø¬Ø¯ÙŠØ¯Ø© (ID: 85)', '2025-10-30 16:15:59'),
(210, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…Ø­ÙØ¸Ø©: Ù…Ø­ÙØ¸Ø© Ø¬Ø¯ÙŠØ¯Ø©', '2025-10-30 16:40:04'),
(211, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¥ÙŠØ¯Ø§Ø¹ Ù…Ø­ÙØ¸Ø©: Ø¥ÙŠØ¯Ø§Ø¹ Ø¨Ù…Ø¨Ù„Øº 12000', '2025-10-30 16:41:53'),
(212, 90, 'add', 'Ø£Ø¶Ø§Ù ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… Ø¬Ø¯ÙŠØ¯Ø© (ID: 6)', '2025-10-30 16:44:53'),
(213, 90, 'add', 'Ø£Ø¶Ø§Ù ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… Ø¬Ø¯ÙŠØ¯Ø© (ID: 7)', '2025-10-30 16:45:53'),
(214, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 17:36:12'),
(215, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-30 17:37:15'),
(216, 97, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: ali', '2025-10-31 00:47:19'),
(217, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…Ù‡Ù…Ø©: rtrfdddd43 (ID: 53)', '2025-10-31 00:51:41'),
(218, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…Ù‡Ù…Ø©: Ù‚ÙØ¨Ø«ÙŠØ¡Ø³ (ID: 54)', '2025-10-31 00:58:15'),
(219, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù…Ù‡Ù…Ø©: Ù‚ÙØ¨Ø«ÙŠØ¡Ø³ (ID: 54)', '2025-10-31 00:59:26'),
(220, 97, 'update', 'Ø­Ø¯Ù‘Ø« Ù…Ù‡Ù…Ø©: Ù‚ÙØ¨Ø«ÙŠØ¡Ø³ (ID: 54)', '2025-10-31 01:01:21'),
(221, 97, 'update', 'Ø­Ø¯Ù‘Ø« Ù‚Ø¶ÙŠØ©: 20251030104824 (ID: 158)', '2025-10-31 01:16:24'),
(222, 97, 'update', 'Ø­Ø¯Ù‘Ø« Ù‚Ø¶ÙŠØ©: 20251030104824 (ID: 158)', '2025-10-31 01:18:55'),
(223, 97, 'delete', 'Ø­Ø°Ù Ù‚Ø¶ÙŠØ©: 20251029170824 (ID: 154)', '2025-10-31 01:24:26'),
(224, 97, 'delete', 'Ø­Ø°Ù Ù‚Ø¶ÙŠØ©: 20251028093933 (ID: 152)', '2025-10-31 01:27:48'),
(225, 97, 'delete', 'Ø­Ø°Ù Ù‚Ø¶ÙŠØ©: 20251029171340 (ID: 155)', '2025-10-31 01:29:53'),
(226, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-31 17:28:05'),
(227, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-10-31 19:14:37'),
(228, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-01 05:21:35'),
(229, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-01 05:56:38'),
(230, 90, 'add', 'Ø£Ø¶Ø§Ù Ø·Ø±Ù: Ø³Ø¹ÙˆØ¯ Ø§Ø­Ù…Ø¯ Ù…Ø±Ø§Ø¯ Ø¹Ù„ÙŠ Ø§Ù„Ù‡Ø§Ø´Ù…ÙŠ (ID: 76)', '2025-11-01 06:23:16'),
(231, 90, 'add', 'Ø£Ø¶Ø§Ù Ø·Ø±Ù: 	Ø´ÙŠØ®Ø© Ø§Ø³Ø­Ø§Ù‚ Ù…Ø±Ø§Ø¯ Ø¹Ù„ÙŠ Ø§Ù„Ù‡Ø§Ø´Ù…ÙŠ (ID: 77)', '2025-11-01 06:25:03'),
(232, 90, 'add', 'Ø£Ø¶Ø§Ù Ù‚Ø¶ÙŠØ©: 1904 (ID: 159)', '2025-11-01 06:26:36'),
(233, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¬Ù„Ø³Ø©: Ø¬Ù„Ø³Ø© Ø¬Ø¯ÙŠØ¯Ø© (ID: 86)', '2025-11-01 06:26:38'),
(234, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…Ù‡Ù…Ø©: ÙƒØªØ§Ø¨Ù‡ Ù…Ø°ÙƒØ±Ø©  (ID: 55)', '2025-11-01 06:26:40'),
(235, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¬Ù„Ø³Ø©: Ø¬Ù„Ø³Ø© Ø¬Ø¯ÙŠØ¯Ø© (ID: 87)', '2025-11-01 06:30:33'),
(236, 102, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: Ø´Ø±ÙŠÙ ', '2025-11-01 06:39:25'),
(237, 90, 'delete', 'Ø­Ø°Ù Ù…Ù‡Ù…Ø©: rtrfdddd43 (ID: 53)', '2025-11-01 09:53:05'),
(238, 90, 'add', 'Ø£Ø¶Ø§Ù ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… Ø¬Ø¯ÙŠØ¯Ø© (ID: 8)', '2025-11-01 13:49:29'),
(239, 90, 'update', 'Ø­Ø¯Ù‘Ø« ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… 8 (ID: 8)', '2025-11-01 14:32:25'),
(240, 90, 'add', 'Ø£Ø¶Ø§Ù Ø·Ø±Ù: Ø¹Ù…Ø±Ø§Ù† Ù…Ø­Ù…Ø¯ Ø¹Ø¨Ø§Ø³ (ID: 78)', '2025-11-01 14:34:28'),
(241, 90, 'add', 'Ø£Ø¶Ø§Ù Ø·Ø±Ù: Ø¹Ù„ÙŠ Ù†Ø®Ù†Ø¯ (ID: 79)', '2025-11-01 14:35:49'),
(242, 90, 'add', 'Ø£Ø¶Ø§Ù Ù‚Ø¶ÙŠØ©: 1150 (ID: 160)', '2025-11-01 14:43:57'),
(243, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¬Ù„Ø³Ø©: Ø¬Ù„Ø³Ø© Ø¬Ø¯ÙŠØ¯Ø© (ID: 88)', '2025-11-01 14:44:02'),
(244, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…Ù‡Ù…Ø©: ØªØµÙˆÙŠØ± (ID: 56)', '2025-11-01 14:44:04'),
(245, 90, 'delete', 'Ø­Ø°Ù ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… INV-2025-00005 (ID: 5)', '2025-11-01 15:01:29'),
(246, 90, 'delete', 'Ø­Ø°Ù ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… INV-2025-00004 (ID: 4)', '2025-11-01 15:01:38'),
(247, 90, 'delete', 'Ø­Ø°Ù ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… INV-2025-00002 (ID: 2)', '2025-11-01 15:01:46'),
(248, 90, 'delete', 'Ø­Ø°Ù ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… INV-2025-00003 (ID: 3)', '2025-11-01 15:01:57'),
(249, 90, 'delete', 'Ø­Ø°Ù ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… INV-2025-00006 (ID: 6)', '2025-11-01 15:02:05'),
(250, 90, 'delete', 'Ø­Ø°Ù ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… INV-2025-00007 (ID: 7)', '2025-11-01 15:02:17'),
(251, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 2000 (ID: 1)', '2025-11-01 16:19:12'),
(252, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 800 (ID: 2)', '2025-11-01 21:18:27'),
(253, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: ØªØ¹Ø¯ÙŠÙ„ Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 800.00 (ID: 2)', '2025-11-01 21:26:01'),
(254, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 200 (ID: 3)', '2025-11-01 21:39:45'),
(255, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 200 (ID: 4)', '2025-11-01 21:54:42'),
(256, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 400 (ID: 5)', '2025-11-01 21:55:01'),
(257, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…ØµØ±ÙˆÙØ§Øª Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ù…ØµØ±ÙˆÙ Ø¨Ù…Ø¨Ù„Øº 200 (ID: 6)', '2025-11-01 22:13:14'),
(258, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 200 (ID: 7)', '2025-11-01 23:30:25'),
(259, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-02 04:21:12'),
(260, 102, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: Ø´Ø±ÙŠÙ ', '2025-11-02 04:24:28'),
(261, 102, 'update', 'Ø­Ø¯Ù‘Ø« Ù‚Ø¶ÙŠØ©: 20251101062636 (ID: 159)', '2025-11-02 04:27:25'),
(262, 90, 'delete', 'Ø­Ø°Ù Ù…ØµØ±ÙˆÙØ§Øª Ù…ÙˆØ¸Ù: Ø­Ø°Ù Ù…ØµØ±ÙˆÙ Ø¨Ù…Ø¨Ù„Øº 200.00 (ID: 6)', '2025-11-02 09:36:03'),
(263, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…ØµØ±ÙˆÙØ§Øª Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ù…ØµØ±ÙˆÙ Ø¨Ù…Ø¨Ù„Øº 100 (ID: 8)', '2025-11-02 10:09:52'),
(264, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù…ØµØ±ÙˆÙØ§Øª Ù…ÙˆØ¸Ù: ØªØ¹Ø¯ÙŠÙ„ Ù…ØµØ±ÙˆÙ Ø¨Ù…Ø¨Ù„Øº 10 (ID: 8)', '2025-11-02 10:10:08'),
(265, 90, 'update', 'Ø­Ø¯Ù‘Ø« ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… 8 (ID: 8)', '2025-11-02 12:05:23'),
(266, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 200 (ID: 9)', '2025-11-02 12:22:40'),
(267, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: ØªØ¹Ø¯ÙŠÙ„ Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 2100 (ID: 9)', '2025-11-02 12:46:04'),
(268, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù…ØµØ±ÙˆÙØ§Øª Ù…ÙˆØ¸Ù: ØªØ¹Ø¯ÙŠÙ„ Ù…ØµØ±ÙˆÙ Ø¨Ù…Ø¨Ù„Øº 20 (ID: 8)', '2025-11-02 12:46:32'),
(269, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: ØªØ¹Ø¯ÙŠÙ„ Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 210 (ID: 9)', '2025-11-02 12:46:48'),
(270, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…ØµØ±ÙˆÙØ§Øª Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ù…ØµØ±ÙˆÙ Ø¨Ù…Ø¨Ù„Øº 200 (ID: 10)', '2025-11-02 14:06:23'),
(271, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-02 16:07:28'),
(272, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 211 (ID: 11)', '2025-11-02 16:25:28'),
(273, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù…ÙˆØ¸Ù: ÙØ¶Ù„ Ù†Ø§ØµØ± (ID: 91)', '2025-11-02 16:29:08'),
(274, 91, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: ÙØ¶Ù„ Ù†Ø§ØµØ±', '2025-11-02 16:29:35'),
(275, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: ØªØ¹Ø¯ÙŠÙ„ Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 3221 (ID: 11)', '2025-11-02 16:30:17'),
(276, 90, 'add', 'Ø£Ø¶Ø§Ù ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… Ø¬Ø¯ÙŠØ¯Ø© (ID: 9)', '2025-11-02 16:49:40'),
(277, 90, 'update', 'Ø­Ø¯Ù‘Ø« ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… 9 (ID: 9)', '2025-11-02 16:49:59'),
(278, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 400 (ID: 12)', '2025-11-02 20:08:51'),
(279, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 300 (ID: 13)', '2025-11-02 20:09:09'),
(280, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…ØµØ±ÙˆÙØ§Øª Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ù…ØµØ±ÙˆÙ Ø¨Ù…Ø¨Ù„Øº 10 (ID: 14)', '2025-11-02 20:09:32'),
(281, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 4000 (ID: 15)', '2025-11-02 20:10:13'),
(282, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 5000 (ID: 16)', '2025-11-02 20:10:36'),
(283, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…ØµØ±ÙˆÙØ§Øª Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ù…ØµØ±ÙˆÙ Ø¨Ù…Ø¨Ù„Øº 400 (ID: 17)', '2025-11-02 20:10:54'),
(284, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…ØµØ±ÙˆÙØ§Øª Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ù…ØµØ±ÙˆÙ Ø¨Ù…Ø¨Ù„Øº 39 (ID: 18)', '2025-11-02 20:11:12'),
(285, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-03 03:15:33'),
(286, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-03 09:55:41'),
(287, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-03 10:24:15'),
(288, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…ØµØ±ÙˆÙØ§Øª Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ù…ØµØ±ÙˆÙ Ø¨Ù…Ø¨Ù„Øº 299 (ID: 19)', '2025-11-03 11:03:35'),
(289, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù…ØµØ±ÙˆÙØ§Øª Ù…ÙˆØ¸Ù: ØªØ¹Ø¯ÙŠÙ„ Ù…ØµØ±ÙˆÙ Ø¨Ù…Ø¨Ù„Øº 29 (ID: 19)', '2025-11-03 11:10:00'),
(290, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…ØµØ±ÙˆÙØ§Øª Ù…ÙˆØ¸Ù: Ø¥Ø¶Ø§ÙØ© Ù…ØµØ±ÙˆÙ Ø¨Ù…Ø¨Ù„Øº 211 (ID: 20)', '2025-11-03 12:53:46'),
(291, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¹Ù‡Ø¯Ø© Ù…ÙˆØ¸Ù: Ø®ØµÙ… Ø¹Ù‡Ø¯Ø© Ø¨Ù…Ø¨Ù„Øº 211 (ID: 21)', '2025-11-03 13:26:26'),
(292, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…Ø­ÙØ¸Ø©: Ù…Ø­ÙØ¸Ø© Ø¬Ø¯ÙŠØ¯Ø©', '2025-11-04 07:38:05'),
(293, 90, 'add', 'Ø£Ø¶Ø§Ù Ø¥ÙŠØ¯Ø§Ø¹ Ù…Ø­ÙØ¸Ø©: Ø¥ÙŠØ¯Ø§Ø¹ Ø¨Ù…Ø¨Ù„Øº 10000', '2025-11-04 07:38:57'),
(294, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…ØµØ±ÙˆÙ Ù…Ø­ÙØ¸Ø©: Ù…ØµØ±ÙˆÙ Ø¨Ù…Ø¨Ù„Øº 1312.50 - ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… INV-2025-000014 (ID: 14)', '2025-11-04 07:49:28'),
(295, 90, 'add', 'Ø£Ø¶Ø§Ù ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… Ø¬Ø¯ÙŠØ¯Ø© (ID: 10)', '2025-11-04 07:57:30'),
(296, 90, 'update', 'Ø­Ø¯Ù‘Ø« ÙØ§ØªÙˆØ±Ø©: ÙØ§ØªÙˆØ±Ø© Ø±Ù‚Ù… 10 (ID: 10)', '2025-11-04 07:59:11'),
(298, 90, 'add', 'Ø£Ø¶Ø§Ù Ø·Ø±Ù: Ø­Ø³Ù† Ø­Ø³Ù† (ID: 80)', '2025-11-04 09:43:54'),
(299, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-04 09:49:28'),
(302, 90, 'add', 'Ø£Ø¶Ø§Ù Ø·Ø±Ù: Ù†Ø§ÙŠÙ (ID: 81)', '2025-11-04 11:44:28'),
(303, 90, 'add', 'Ø£Ø¶Ø§Ù Ø·Ø±Ù: test (ID: 82)', '2025-11-04 11:48:49'),
(304, 90, 'add', 'Ø£Ø¶Ø§Ù Ø§Ø¬ØªÙ…Ø§Ø¹: Ø§Ø¬ØªÙ…Ø§Ø¹ Ø¬Ø¯ÙŠØ¯ (ID: 18)', '2025-11-04 12:00:59'),
(305, 90, 'delete', 'Ø­Ø°Ù Ø§Ø¬ØªÙ…Ø§Ø¹: Ø§Ø¬ØªÙ…Ø§Ø¹ (ID: 18)', '2025-11-04 12:01:16'),
(306, 90, 'add', 'Ø£Ø¶Ø§Ù Ø§Ø¬ØªÙ…Ø§Ø¹: Ø§Ø¬ØªÙ…Ø§Ø¹ Ø¬Ø¯ÙŠØ¯ (ID: 19)', '2025-11-04 12:06:38'),
(307, 90, 'delete', 'Ø­Ø°Ù Ø§Ø¬ØªÙ…Ø§Ø¹: Ø§Ø¬ØªÙ…Ø§Ø¹ (ID: 19)', '2025-11-04 12:07:25'),
(308, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-04 15:22:14'),
(309, 97, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: ali', '2025-11-04 16:21:16'),
(310, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-05 08:02:05'),
(311, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-05 08:56:13'),
(312, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-05 08:56:16'),
(313, 90, 'add', 'Ø£Ø¶Ø§Ù Ù…Ø­ÙØ¸Ø©: Ù…Ø­ÙØ¸Ø© Ø¬Ø¯ÙŠØ¯Ø©', '2025-11-05 09:22:15'),
(314, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-05 12:37:22'),
(315, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-05 12:42:35'),
(316, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-05 13:39:11'),
(317, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù‚Ø¶ÙŠØ©: 20251101062636 (ID: 159)', '2025-11-05 14:41:20'),
(318, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù‚Ø¶ÙŠØ©: 20251101062636 (ID: 159)', '2025-11-05 14:41:43'),
(319, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù‚Ø¶ÙŠØ©: 20251101062636 (ID: 159)', '2025-11-05 14:42:52'),
(320, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù‚Ø¶ÙŠØ©: 20251101062636 (ID: 159)', '2025-11-05 14:55:19'),
(321, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù‚Ø¶ÙŠØ©: 20251101062636 (ID: 159)', '2025-11-05 14:55:29'),
(322, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù‚Ø¶ÙŠØ©: 20251101062636 (ID: 159)', '2025-11-05 14:58:40'),
(323, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù‚Ø¶ÙŠØ©: 20251101062636 (ID: 159)', '2025-11-05 15:00:44'),
(324, 90, 'update', 'Ø­Ø¯Ù‘Ø« Ù‚Ø¶ÙŠØ©: 20251101062636 (ID: 159)', '2025-11-05 15:01:04'),
(325, 90, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: admin', '2025-11-05 17:38:02'),
(326, 97, 'login', 'ØªØ³Ø¬ÙŠÙ„ Ø¯Ø®ÙˆÙ„: ali', '2025-11-05 17:38:47');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `meetings`
--

CREATE TABLE `meetings` (
  `id` int NOT NULL,
  `party_id` int NOT NULL,
  `note` text,
  `date` date NOT NULL,
  `link` varchar(500) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `meeting_type` enum('online','onsite') DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `lawyer_id` int DEFAULT NULL,
  `meet_result` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `meetings`
--

INSERT INTO `meetings` (`id`, `party_id`, `note`, `date`, `link`, `start_time`, `end_time`, `meeting_type`, `address`, `lawyer_id`, `meet_result`, `created_at`, `created_by`) VALUES
(16, 59, 'test', '2025-10-21', NULL, '13:00:00', '13:01:00', 'onsite', 'Dubai', NULL, 'cancelled', '2025-10-21 14:55:12', NULL),
(17, 61, NULL, '2025-10-23', NULL, '08:05:00', '08:49:00', 'onsite', NULL, NULL, 'scheduled', '2025-10-22 12:05:31', NULL);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `meetings_documents`
--

CREATE TABLE `meetings_documents` (
  `id` int NOT NULL,
  `meeting_id` int NOT NULL,
  `document_name` varchar(1055) NOT NULL,
  `document_url` varchar(2055) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `meeting_attendance`
--

CREATE TABLE `meeting_attendance` (
  `attendance_id` int NOT NULL,
  `meeting_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `meeting_attendance`
--

INSERT INTO `meeting_attendance` (`attendance_id`, `meeting_id`, `employee_id`, `created_at`) VALUES
(11, 16, 76, '2025-10-21 15:48:55'),
(12, 16, 80, '2025-10-21 15:48:55');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `memos`
--

CREATE TABLE `memos` (
  `id` int NOT NULL,
  `case_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `submission_date` date NOT NULL,
  `description` text,
  `is_lawyer_approved` tinyint(1) DEFAULT '0',
  `is_secretary_approved` tinyint(1) DEFAULT '0',
  `is_consultant_approved` tinyint(1) DEFAULT '0',
  `is_admin_approved` tinyint(1) DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `status` enum('Draft','Pending Approval','Approved','Submitted to Court','Rejected') DEFAULT 'Draft',
  `admin_note` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin_status` enum('Draft','Pending Approval','Submitted to Court','Approved','Rejected') NOT NULL DEFAULT 'Draft',
  `secretary_status` enum('Rejected','Draft','Approved','Submitted to Court','Pending Approval') NOT NULL DEFAULT 'Draft',
  `consultant_status` enum('Rejected','Draft','Approved','Submitted to Court','Pending Approval') NOT NULL DEFAULT 'Draft',
  `lawyer_status` enum('Rejected','Draft','Approved','Submitted to Court','Pending Approval') NOT NULL DEFAULT 'Draft'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `memos`
--

INSERT INTO `memos` (`id`, `case_id`, `title`, `submission_date`, `description`, `is_lawyer_approved`, `is_secretary_approved`, `is_consultant_approved`, `is_admin_approved`, `created_by`, `status`, `admin_note`, `created_at`, `admin_status`, `secretary_status`, `consultant_status`, `lawyer_status`) VALUES
(37, 139, 'ØªÙ‚Ø¯ÙŠÙ… Ø¹Ø±ÙŠØ¶Ø©', '2025-10-05', 'test', 0, 0, 0, 1, 73, 'Approved', '', '2025-10-05 15:27:10', 'Approved', 'Draft', 'Draft', 'Approved'),
(40, 142, 'Ø¯ÙÙˆØ¹', '2025-10-13', 'Ø¯ÙÙˆØ¹ Ù‚Ø§Ù†ÙˆÙ†ÙŠØ© ', 0, 0, 0, 0, 90, 'Draft', '', '2025-10-13 10:41:41', 'Approved', 'Draft', 'Draft', 'Draft'),
(41, 143, 'Ù…Ø°ÙƒØ±Ø© Ø¬ÙˆØ§Ø¨ÙŠÙ‡ Ø±Ù‚Ù… 1', '2025-10-31', 'Ù…Ø°ÙƒØ±Ø© Ø¬ÙˆØ§Ø¨ÙŠÙ‡ ', 0, 0, 0, 0, 105, 'Pending Approval', 'Ù…Ø±Ø±Ù‡Ø§ Ù„Ù„Ø§Ø³ØªØ§Ø° Ø´Ø±ÙŠÙ Ù„Ù„Ù…Ø±Ø§Ø¬Ø¹Ø© ', '2025-10-15 15:50:35', 'Draft', 'Draft', 'Draft', 'Draft'),
(42, 143, 'Ù…Ø°ÙƒØ±Ø© Ø¬ÙˆØ§Ø¨ÙŠÙ‡ ', '2025-10-28', 'Ù…Ø°ÙƒØ±Ø© Ø¬ÙˆØ§Ø¨ÙŠÙ‡ ', 0, 0, 0, 0, 108, 'Pending Approval', 'Ù…Ø°ÙƒØ±Ø© Ø¬ÙˆØ§Ø¨ÙŠÙ‡ ', '2025-10-15 16:00:56', 'Approved', 'Draft', 'Draft', 'Draft'),
(49, 144, 'Ù…Ø°ÙƒØ±Ø© Ø¯ÙØ§Ø¹ ', '2025-11-03', '', 0, 0, 0, 0, 90, 'Draft', '', '2025-11-01 06:33:12', 'Draft', 'Draft', 'Draft', 'Draft'),
(50, 160, 'Ø§Ø¹Ø¯Ø§Ø¯ Ù…Ø°ÙƒØ±Ø©', '2025-11-03', '', 0, 0, 0, 0, 90, 'Approved', '', '2025-11-01 14:44:05', 'Draft', 'Draft', 'Draft', 'Draft'),
(51, 160, 'test33', '2025-11-11', '<h2 style=\"text-align: center;\"><strong>welcome</strong></h2><p></p>', 0, 0, 0, 0, 90, 'Pending Approval', '', '2025-11-04 15:40:28', 'Draft', 'Draft', 'Draft', 'Draft');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `memo_documents`
--

CREATE TABLE `memo_documents` (
  `id` int NOT NULL,
  `memo_id` int NOT NULL,
  `document_name` varchar(1055) NOT NULL,
  `document_url` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uploaded_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `other_leaves`
--

CREATE TABLE `other_leaves` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `total_days` int NOT NULL,
  `remaining_days` int DEFAULT '0',
  `leave_reason` enum('maternity','paternity','study','emergency','others') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `leave_type` enum('paid','unpaid') NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `other_leaves`
--

INSERT INTO `other_leaves` (`id`, `employee_id`, `date`, `from_date`, `to_date`, `total_days`, `remaining_days`, `leave_reason`, `leave_type`, `created_by`, `created_at`) VALUES
(1, 90, '2025-10-08', '2025-10-08', '2025-10-08', 1, 12, 'study', 'unpaid', 73, '2025-10-12 05:11:39'),
(2, 114, '2025-10-20', '2025-10-27', '2025-11-01', 6, 24, 'paternity', 'paid', 90, '2025-10-20 11:03:06'),
(4, 95, '2025-10-01', '2025-11-01', '2025-11-05', 5, 25, 'emergency', 'unpaid', 90, '2025-10-29 22:44:45');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `parties`
--

CREATE TABLE `parties` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text,
  `branch_id` int DEFAULT NULL,
  `category` enum('individual','company') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `party_type` enum('client','opponent','New','Unqualified','Contacted','Qualified') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `passport` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `is_vip` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `e_id` varchar(55) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `consultation_type` varchar(100) DEFAULT NULL,
  `nationality` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `parties`
--

INSERT INTO `parties` (`id`, `name`, `phone`, `address`, `branch_id`, `category`, `email`, `party_type`, `passport`, `username`, `password`, `status`, `is_vip`, `created_by`, `created_at`, `e_id`, `source`, `consultation_type`, `nationality`, `balance`) VALUES
(11, ' Ø£Ø­Ù…Ø¯ Ø¹Ù„ÙŠ', ' +971501234567', ' Ø´Ø§Ø±Ø¹ Ø§Ù„Ù…Ù„ÙƒØŒ Ø¯Ø¨ÙŠlisfhjgoijog', 1, 'individual', ' ahmed.ali@example.com', 'client', NULL, ' ahmed.ali', ' securepassword123', 'active', 0, NULL, '2025-09-19 22:15:30', NULL, NULL, NULL, 'Ø§Ù„ÙŠÙ…Ù†', NULL),
(15, 'Ù…Ø§Ù‡Ø± Ø§Ù„ÙƒØªØ¨ÙŠ', ' +971501234567', ' Ø´Ø§Ø±Ø¹ Ø§Ù„Ù…Ù„ÙƒØŒ Ø¯Ø¨ÙŠlisfhjgoijog', 1, 'individual', ' ahmed.ali@exasmple.comd', 'client', NULL, ' wdffs.ali', ' securepassword123', 'active', 0, NULL, '2025-09-19 22:17:34', '654321`', NULL, NULL, 'Ø§Ù„ÙŠÙ…Ù†', NULL),
(16, 'Ø¹Ø¨Ø¯Ø§Ù„Ù„Ù‡ Ø³Ø¹ÙŠØ¯', '+971501455918', 'Ø§Ø¨Ùˆ Ù‡ÙŠÙ„\n111', 1, 'individual', 'thman.saleh@gmail.com', 'client', '', 'othman', 'othman', 'active', 0, NULL, '2025-09-21 05:05:53', '7654321', NULL, '', 'hgrrr', NULL),
(17, 'Ù…Ù†ØªØµØ± Ø®Ù„Ù Ø§Ù„Ù„Ù‡', '+9715014455918', 'Ø§Ø¨Ùˆ Ù‡ÙŠÙ„\n111', 1, 'company', 'thman.saleh@gmail.com', 'opponent', NULL, '432', 'othman', 'active', 0, NULL, '2025-09-21 05:09:23', '7654321', NULL, NULL, 'hgrrr', NULL),
(18, 'Ø®Ø§Ù„Ø¯ Ø§Ù„Ù…Ø±ÙŠ', '+971501455918', 'dubai deirah', 1, 'company', 'ahmed.ali@example.com', 'opponent', NULL, 'khiled', 'othman', 'active', 0, NULL, '2025-09-21 05:40:47', '7654321', NULL, NULL, 'Ø§Ù„Ø§Ù…Ø§Ø±Ø§Øª', NULL),
(19, 'Ù…Ø±ÙˆØ§Ù† Ø¹Ù„ÙŠ', '+971501455918', 'Ø¯Ø¨ÙŠ Ø¯ÙŠØ±Ø©', 1, 'individual', 'john.doe@example.com', 'opponent', NULL, '77168', '4333', 'inactive', 0, NULL, '2025-09-21 13:37:57', '76543216543', NULL, NULL, 'Ø§Ù„Ø¹Ø±Ø§Ù‚', NULL),
(20, 'Ø¹Ø«Ù…Ø§Ù† ØµØ§Ù„Ø­ Ø¹Ø¨Ø¯Ø§Ù„Ø­Ù…ÙŠØ¯', '0501455918', 'Ø§Ø¨Ùˆ Ù‡ÙŠÙ„\n111', 1, 'company', '322', 'client', NULL, 'admin', '123456', 'active', 0, NULL, '2025-09-30 10:41:07', '', NULL, NULL, '22', NULL),
(22, 'Ø¹Ø«Ù…Ø§Ù† ØµØ§Ù„Ø­ Ø¹Ø¨Ø¯Ø§Ù„Ø­Ù…ÙŠØ¯', '0501455918', 'Ø§Ø¨Ùˆ Ù‡ÙŠÙ„\n111', 1, 'company', 'john.smith@email.com', 'opponent', NULL, 'tgref', '123456', 'active', 0, NULL, '2025-09-30 10:43:50', '2121', NULL, NULL, 'hgrrr', NULL),
(30, 'Ø­Ù…Ø¯Ø§Ù† Ø±Ø§Ø¦Ø¯', '0501455918', '', 2, 'company', 'hamdan@gmail.com', 'opponent', NULL, '765432', '654333', 'active', 0, NULL, '2025-10-08 00:55:52', '', NULL, NULL, '', NULL),
(31, 'ali nour', '+971501455918', 'Ù…Ø±ÙŠÙ†Ù†Ø§', 2, 'individual', '', 'opponent', NULL, '981539', '457298', 'active', 0, NULL, '2025-10-08 11:43:54', '', NULL, NULL, '', NULL),
(32, 'Ø·Ù„Ø§Ù„ Ù…Ø­Ù…Ø¯', '0501455918', NULL, 2, 'individual', NULL, 'client', NULL, '812983', '574829', 'active', 0, NULL, '2025-10-08 12:43:58', NULL, NULL, NULL, NULL, NULL),
(33, 'othman', '050123567', '9ouied', 3, 'company', '', 'New', '', '86754tr', 'iuyjhtgrfre', 'active', 0, NULL, '2025-10-08 23:35:27', '', 'Ø²ÙŠØ§Ø±Ø© Ø§Ù„Ù…ÙƒØªØ¨', 'Ù…Ø§Ù„ÙŠØ©', '', NULL),
(39, 'Ø¹Ø«Ù…Ø§Ù† ØµØ§Ù„Ø­ Ø¹Ø¨Ø¯Ø§Ù„Ø­Ù…ÙŠØ¯', '+971501455918', 'Ø§Ø¨Ùˆ Ù‡ÙŠÙ„\n111', 2, 'company', '', 'opponent', NULL, '957346', '702194', 'active', 0, NULL, '2025-10-09 01:34:52', '', NULL, NULL, '', NULL),
(52, 'Ø§Ù„Ù…Ø³ØªÙƒØ´Ù Ù„Ù„ØªØ·ÙˆÙŠØ± Ùˆ Ø§Ù„Ø±ØµØ¯ Ø§Ù„Ø§Ø¹Ù„Ø§Ù…ÙŠ', '0585952035', '', 1, 'company', 'rased@almstkshf.com', 'client', '', '843844', '649044', 'active', 1, 90, '2025-10-13 10:31:33', '', NULL, '', '', NULL),
(53, 'Ù…Ø­Ù…Ø¯ Ø­Ù…Ø§Ø¯', '0585454541', '', 1, 'individual', '', 'opponent', NULL, '639350', '526704', 'active', 0, 90, '2025-10-13 10:32:26', '', NULL, NULL, '', NULL),
(55, 'Ø¹Ù„ÙŠ Ù…Ø­Ù…Ø¯ ', '0501234567', '', 1, 'individual', 'ali@gmail.com', 'New', '', '139367', '653476', 'active', 0, 90, '2025-10-17 06:09:00', '', 'Ø²ÙŠØ§Ø±Ø© Ø§Ù„Ù…ÙƒØªØ¨', 'Ù‚Ø§Ù†ÙˆÙ†ÙŠØ©', '', NULL),
(57, 'ØªØ§Ù…Ø± ÙŠÙˆÙ†Ø³', '+971585400191', '', 3, 'individual', '', 'client', '', '250346', '419736', 'active', 1, 90, '2025-10-20 04:57:50', '784197941306025', NULL, '', 'Ù…ØµØ±ÙŠ', NULL),
(58, 'Ø´Ø±ÙŠÙ Ø¬Ù…Ø§Ù„ ', '+971556829149', '', 3, 'individual', '', 'client', '', '779807', '980565', 'active', 0, 90, '2025-10-20 04:59:26', '', NULL, '', '', NULL),
(59, 'Ø´Ø±ÙŠÙ 0 ', '+9715550000000', '', 1, 'individual', '', 'client', '', '665401', '345895', 'active', 0, 90, '2025-10-20 06:58:46', '', NULL, '', '', NULL),
(61, 'Ù…Ø­Ù…Ø¯ Ø­Ø¬ÙŠ', '0097105555555', '', 3, 'individual', '', 'New', '', '835744', '676296', 'active', 0, 90, '2025-10-22 12:04:43', '', 'Ø²ÙŠØ§Ø±Ø© Ø§Ù„Ù…ÙƒØªØ¨', '', '', NULL),
(63, 'Ø§Ø­Ù…Ø¯ Ø´Ø§Ù‡ Ø§Ù„Ø¨Ù„ÙˆØ´ ', '+971556829149', '', 1, 'individual', '', 'client', NULL, '362804', '503277', 'active', 0, 90, '2025-10-22 12:55:45', '', NULL, NULL, '', NULL),
(72, 'ytrr', '444444', '', 1, 'individual', '', 'client', '', '824018', '370004', 'active', 0, 90, '2025-10-30 04:52:24', '', NULL, '', '', NULL),
(73, 'hgf', '6543', '', 1, '', '', 'client', '', '781475', '184916', 'active', 0, 90, '2025-10-30 04:59:01', '', NULL, '', '', NULL),
(75, 'Ø­Ø³ÙŠÙ† Ø¹Ø¨Ø¯ Ø§Ù„Ù„Ø·ÙŠÙ', '05533221144', '', 1, 'individual', 'hussain@example.com', 'opponent', '87654', '244909', '417715', 'inactive', 0, 90, '2025-10-30 10:45:44', '', NULL, '', '', NULL),
(76, 'Ø³Ø¹ÙˆØ¯ Ø§Ø­Ù…Ø¯ Ù…Ø±Ø§Ø¯ Ø¹Ù„ÙŠ Ø§Ù„Ù‡Ø§Ø´Ù…ÙŠ', '055555555', '', 1, '', '', 'opponent', '', '239768', '721095', 'active', 0, 90, '2025-11-01 06:23:16', '', NULL, '', '', NULL),
(77, '	Ø´ÙŠØ®Ø© Ø§Ø³Ø­Ø§Ù‚ Ù…Ø±Ø§Ø¯ Ø¹Ù„ÙŠ Ø§Ù„Ù‡Ø§Ø´Ù…ÙŠ', '05011111111', '', 1, '', '', 'client', '', '903944', '291377', 'active', 0, 90, '2025-11-01 06:25:03', '', NULL, '', '', NULL),
(78, 'Ø¹Ù…Ø±Ø§Ù† Ù…Ø­Ù…Ø¯ Ø¹Ø¨Ø§Ø³', '0505012077', 'Ø¹Ø¬Ù…Ø§Ù†', 3, '', '', 'client', '', '972642', '342163', 'active', 0, 90, '2025-11-01 14:34:28', '', NULL, '', '', NULL),
(79, 'Ø¹Ù„ÙŠ Ù†Ø®Ù†Ø¯', '', 'Ø¹Ø¬Ù…Ø§Ù†', 1, '', '', 'opponent', '', '165710', '979650', 'active', 0, 90, '2025-11-01 14:35:49', '', NULL, '', '', NULL),
(80, 'Ø­Ø³Ù† Ø­Ø³Ù†', '0505005001', '', 3, 'individual', '', 'New', '', '321111', '145086', 'inactive', 0, 90, '2025-11-04 09:43:54', '', 'Ø§Ù„Ù…ÙˆÙ‚Ø¹ Ø§Ù„Ø§Ù„ÙƒØªØ±ÙˆÙ†ÙŠ', 'Ù…Ø§Ù„ÙŠØ©', '', NULL),
(81, 'Ù†Ø§ÙŠÙ', '0505073849834', '', 1, 'individual', '', 'New', '', '685411', '715385', 'active', 0, 90, '2025-11-04 11:44:28', '', 'Ø²ÙŠØ§Ø±Ø© Ø§Ù„Ù…ÙƒØªØ¨', 'Ù‚Ø§Ù†ÙˆÙ†ÙŠØ©', '', NULL),
(82, 'test', '7890', '', 1, '', '', 'client', '', '447924', '259385', 'active', 0, 90, '2025-11-04 11:48:49', '', NULL, '', '', NULL);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `parties_documents`
--

CREATE TABLE `parties_documents` (
  `id` int NOT NULL,
  `party_id` int NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `uploaded_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `document_url` varchar(2055) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `parties_documents`
--

INSERT INTO `parties_documents` (`id`, `party_id`, `document_name`, `uploaded_by`, `created_at`, `document_url`) VALUES
(19, 16, 'Salary Advance Form (1).docx', NULL, '2025-10-19 13:03:05', 'https://mbn.9ede59b180ea59b7a50853f00d2bebdb.r2.cloudflarestorage.com/documents/1760878984019-b93owsbs4km.docx?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=6b8cec64c9c9e276a5fa25d35d6110ab%2F20251019%2Fauto%2Fs3%2Faws4_request&X-Amz-Date=20251019T130305Z&X-Amz-Expires=604800&X-Amz-Signature=ba6e63563f4ea74e4f0eae91fa7e5678d68e7d588585ce918a4e75fefb8ed066&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `parties_forms`
--

CREATE TABLE `parties_forms` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `document_name` varchar(255) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `document_url` varchar(500) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` enum('welcome_message','price_quote') COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `parties_orders`
--

CREATE TABLE `parties_orders` (
  `id` int NOT NULL,
  `party_id` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` enum('new','approved','pending','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'new',
  `case_number` varchar(100) DEFAULT NULL,
  `details` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `parties_orders`
--

INSERT INTO `parties_orders` (`id`, `party_id`, `type`, `date`, `status`, `case_number`, `details`, `created_at`, `created_by`) VALUES
(10, 20, 'case_details', '2025-10-11', 'approved', NULL, NULL, '2025-10-14 01:39:58', 90),
(11, 20, 'case_details', '2025-10-29', 'pending', NULL, NULL, '2025-10-14 01:47:54', 90),
(12, 32, 'case_details', '2025-10-01', 'pending', 'test', NULL, '2025-10-14 01:49:59', 90),
(16, 16, 'test', '2025-10-19', 'rejected', NULL, 'test', '2025-10-19 13:18:37', NULL),
(19, 30, 'Ù…ÙˆØ¹Ø¯', '2025-10-08', 'pending', NULL, NULL, '2025-10-19 13:36:16', 90),
(21, 16, 'Ø·Ù„Ø¨ Ù…Ø³ØªÙ†Ø¯', '2025-10-19', 'pending', NULL, 'test', '2025-10-19 13:45:45', NULL),
(26, 16, 'Ø§Ø³ØªÙØ³Ø§Ø± Ù…Ø§Ù„ÙŠ', '2025-10-19', 'pending', NULL, 'ÙƒÙ… Ø§Ù„Ù…Ø·Ù„ÙˆØ¨ Ø¯ÙØ¹Ø®', '2025-10-19 15:10:23', NULL),
(28, 52, 'Ø·Ù„Ø¨ Ù…Ø³ØªÙ†Ø¯', '2025-10-25', 'pending', NULL, 'test', '2025-10-25 02:52:32', NULL),
(29, 52, 'Ù…ÙˆØ¹Ø¯', '2025-10-25', 'pending', NULL, 'test', '2025-10-25 02:54:03', NULL),
(30, 20, 'Ø§Ø³ØªÙØ³Ø§Ø± Ù…Ø§Ù„ÙŠ', '2025-10-27', 'pending', NULL, 'Test', '2025-10-27 13:17:10', NULL),
(31, 57, 'Ù…ÙˆØ¹Ø¯', '2025-10-29', 'pending', NULL, 'Ø§Ø±ØºØ¨ ÙÙŠ Ù…Ù‚Ø§Ø¨Ù„Ø© Ø§Ù„Ø£Ø³ØªØ§Ø° Ù…Ø­Ù…Ø¯ Ø¨Ù†ÙŠ Ù‡Ø§Ø´Ù…', '2025-10-29 23:36:58', NULL),
(32, 57, 'Ø§Ø³ØªÙØ³Ø§Ø± Ù…Ø§Ù„ÙŠ', '2025-11-01', 'pending', 'Ù¨Ù§Ù¦', 'Ø§Ø±ØºØ¨ ÙÙŠ Ø§Ù„Ø­ØµÙˆÙ„ Ø¹Ù„Ù‰ ÙƒØ´Ù Ø­Ø³Ø§Ø¨', '2025-10-29 23:37:28', NULL),
(33, 57, 'Ø·Ù„Ø¨ Ù…Ø³ØªÙ†Ø¯', '2025-10-30', 'pending', NULL, 'Trgtrtrt', '2025-10-30 02:14:54', NULL),
(34, 20, 'ØªØ­Ø¯ÙŠØ« Ø­Ø§Ù„Ø© Ø§Ù„Ù‚Ø¶ÙŠØ©', '2025-10-24', 'rejected', NULL, 'test oth man', '2025-10-30 03:08:53', NULL);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `permissions`
--

CREATE TABLE `permissions` (
  `id` int NOT NULL,
  `permission_ar` varchar(100) NOT NULL,
  `permission_en` varchar(100) NOT NULL,
  `permission_parent_name` varchar(50) NOT NULL DEFAULT 'other',
  `permission_group_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `permissions`
--

INSERT INTO `permissions` (`id`, `permission_ar`, `permission_en`, `permission_parent_name`, `permission_group_name`, `created_at`) VALUES
(111, 'Ø¥Ø¶Ø§ÙØ© Ù†Ù…ÙˆØ°Ø¬', 'Add Form', 'hr', 'forms', '2025-11-02 20:40:00'),
(114, 'Ø­Ø°Ù Ù†Ù…ÙˆØ°Ø¬', 'Delete Form', 'hr', 'forms', '2025-11-02 20:40:00'),
(115, 'Ø¥Ø¶Ø§ÙØ© Ø·Ù„Ø¨ Ù…ÙˆØ¸Ù', 'Add Employee Request', 'hr', 'employee_requests', '2025-11-02 20:40:00'),
(116, 'Ø¹Ø±Ø¶ Ø·Ù„Ø¨ Ù…ÙˆØ¸Ù', 'View Employee Request', 'hr', 'employee_requests', '2025-11-02 20:40:00'),
(117, 'ØªØ¹Ø¯ÙŠÙ„ Ø·Ù„Ø¨ Ù…ÙˆØ¸Ù', 'Edit Employee Request', 'hr', 'employee_requests', '2025-11-02 20:40:00'),
(118, 'Ø­Ø°Ù Ø·Ù„Ø¨ Ù…ÙˆØ¸Ù', 'Delete Employee Request', 'hr', 'employee_requests', '2025-11-02 20:40:00'),
(119, 'Ø¥Ø¶Ø§ÙØ© Ø­Ø¶ÙˆØ±', 'Add Attendance', 'hr', 'attendance', '2025-11-02 20:40:00'),
(120, 'Ø¹Ø±Ø¶ Ø§Ù„Ø­Ø¶ÙˆØ±', 'View Attendance', 'hr', 'attendance', '2025-11-02 20:40:00'),
(121, 'ØªØ¹Ø¯ÙŠÙ„ Ø§Ù„Ø­Ø¶ÙˆØ±', 'Edit Attendance', 'hr', 'attendance', '2025-11-02 20:40:00'),
(122, 'Ø­Ø°Ù Ø§Ù„Ø­Ø¶ÙˆØ±', 'Delete Attendance', 'hr', 'attendance', '2025-11-02 20:40:00'),
(135, 'Ø¥Ø¶Ø§ÙØ© ØªÙ‚ÙŠÙŠÙ…', 'Add Review', 'hr', 'reviews', '2025-11-02 20:40:01'),
(136, 'Ø¹Ø±Ø¶ ØªÙ‚ÙŠÙŠÙ…', 'View Review', 'hr', 'reviews', '2025-11-02 20:40:01'),
(137, 'ØªØ¹Ø¯ÙŠÙ„ ØªÙ‚ÙŠÙŠÙ…', 'Edit Review', 'hr', 'reviews', '2025-11-02 20:40:01'),
(138, 'Ø­Ø°Ù ØªÙ‚ÙŠÙŠÙ…', 'Delete Review', 'hr', 'reviews', '2025-11-02 20:40:01'),
(139, 'Ø¥Ø¶Ø§ÙØ© ØªØ¯Ø±ÙŠØ¨', 'Add Training', 'hr', 'trainings', '2025-11-02 20:40:01'),
(140, 'Ø¹Ø±Ø¶ ØªØ¯Ø±ÙŠØ¨', 'View Training', 'hr', 'trainings', '2025-11-02 20:40:01'),
(141, 'ØªØ¹Ø¯ÙŠÙ„ ØªØ¯Ø±ÙŠØ¨', 'Edit Training', 'hr', 'trainings', '2025-11-02 20:40:01'),
(142, 'Ø­Ø°Ù ØªØ¯Ø±ÙŠØ¨', 'Delete Training', 'hr', 'trainings', '2025-11-02 20:40:01'),
(143, 'Ø¥Ø¶Ø§ÙØ© Ø®ØµÙ…', 'Add Deduction', 'hr', 'deductions', '2025-11-02 20:40:01'),
(144, 'Ø¹Ø±Ø¶ Ø®ØµÙ…', 'View Deduction', 'hr', 'deductions', '2025-11-02 20:40:01'),
(145, 'ØªØ¹Ø¯ÙŠÙ„ Ø®ØµÙ…', 'Edit Deduction', 'hr', 'deductions', '2025-11-02 20:40:01'),
(146, 'Ø­Ø°Ù Ø®ØµÙ…', 'Delete Deduction', 'hr', 'deductions', '2025-11-02 20:40:01'),
(147, 'Ø¥Ø¶Ø§ÙØ© Ù…Ø³ØªÙ†Ø¯ Ù…ÙˆØ¸Ù', 'Add Employee Document', 'hr', 'employee_documents', '2025-11-02 20:40:01'),
(150, 'Ø­Ø°Ù Ù…Ø³ØªÙ†Ø¯ Ù…ÙˆØ¸Ù', 'Delete Employee Document', 'hr', 'employee_documents', '2025-11-02 20:40:01'),
(151, 'Ø¹Ø±Ø¶ ØªÙ†Ø¨ÙŠÙ‡Ø§Øª Ø§Ù„Ù…ÙˆØ§Ø±Ø¯ Ø§Ù„Ø¨Ø´Ø±ÙŠØ©', 'View HR Notifications', 'hr', 'hr_notifications', '2025-11-02 20:40:01'),
(156, 'Ø¥Ø¶Ø§ÙØ© Ù…Ù„Ù', 'Add Case', 'cases', 'cases', '2025-11-04 16:07:09'),
(157, 'Ø¹Ø±Ø¶ Ù…Ù„Ù', 'View Case', 'cases', 'cases', '2025-11-04 16:07:09'),
(158, 'ØªØ¹Ø¯ÙŠÙ„ Ù…Ù„Ù', 'Edit Case', 'cases', 'cases', '2025-11-04 16:07:09'),
(159, 'Ø­Ø°Ù Ù…Ù„Ù', 'Delete Case', 'cases', 'cases', '2025-11-04 16:07:09'),
(160, 'Ø¥Ø¶Ø§ÙØ© Ø¬Ù„Ø³Ø©', 'Add Session', 'cases', 'sessions', '2025-11-04 16:07:09'),
(161, 'Ø¹Ø±Ø¶ Ø¬Ù„Ø³Ø©', 'View Session', 'cases', 'sessions', '2025-11-04 16:07:09'),
(162, 'ØªØ¹Ø¯ÙŠÙ„ Ø¬Ù„Ø³Ø©', 'Edit Session', 'cases', 'sessions', '2025-11-04 16:07:09'),
(163, 'Ø­Ø°Ù Ø¬Ù„Ø³Ø©', 'Delete Session', 'cases', 'sessions', '2025-11-04 16:07:09'),
(164, 'Ø¥Ø¶Ø§ÙØ© Ù…Ù‡Ù…Ø©', 'Add Task', 'cases', 'tasks', '2025-11-04 16:07:10'),
(165, 'Ø¹Ø±Ø¶ Ù…Ù‡Ù…Ø©', 'View Task', 'cases', 'tasks', '2025-11-04 16:07:10'),
(166, 'ØªØ¹Ø¯ÙŠÙ„ Ù…Ù‡Ù…Ø©', 'Edit Task', 'cases', 'tasks', '2025-11-04 16:07:10'),
(167, 'Ø­Ø°Ù Ù…Ù‡Ù…Ø©', 'Delete Task', 'cases', 'tasks', '2025-11-04 16:07:10'),
(168, 'Ø¥Ø¶Ø§ÙØ© Ù…Ø°ÙƒØ±Ø©', 'Add Memo', 'cases', 'memos', '2025-11-04 16:07:10'),
(169, 'Ø¹Ø±Ø¶ Ù…Ø°ÙƒØ±Ø©', 'View Memo', 'cases', 'memos', '2025-11-04 16:07:10'),
(170, 'ØªØ¹Ø¯ÙŠÙ„ Ù…Ø°ÙƒØ±Ø©', 'Edit Memo', 'cases', 'memos', '2025-11-04 16:07:10'),
(171, 'Ø­Ø°Ù Ù…Ø°ÙƒØ±Ø©', 'Delete Memo', 'cases', 'memos', '2025-11-04 16:07:10'),
(172, 'Ø¥Ø¶Ø§ÙØ© Ø¹Ø±ÙŠØ¶Ø©', 'Add Petition', 'cases', 'petitions', '2025-11-04 16:07:10'),
(173, 'Ø¹Ø±Ø¶ Ø¹Ø±ÙŠØ¶Ø©', 'View Petition', 'cases', 'petitions', '2025-11-04 16:07:10'),
(174, 'ØªØ¹Ø¯ÙŠÙ„ Ø¹Ø±ÙŠØ¶Ø©', 'Edit Petition', 'cases', 'petitions', '2025-11-04 16:07:10'),
(175, 'Ø­Ø°Ù Ø¹Ø±ÙŠØ¶Ø©', 'Delete Petition', 'cases', 'petitions', '2025-11-04 16:07:10'),
(176, 'Ø¥Ø¶Ø§ÙØ© ØªÙ†ÙÙŠØ°', 'Add Execution', 'cases', 'executions', '2025-11-04 16:07:10'),
(177, 'Ø¹Ø±Ø¶ ØªÙ†ÙÙŠØ°', 'View Execution', 'cases', 'executions', '2025-11-04 16:07:10'),
(178, 'ØªØ¹Ø¯ÙŠÙ„ ØªÙ†ÙÙŠØ°', 'Edit Execution', 'cases', 'executions', '2025-11-04 16:07:10'),
(179, 'Ø­Ø°Ù ØªÙ†ÙÙŠØ°', 'Delete Execution', 'cases', 'executions', '2025-11-04 16:07:10'),
(180, 'Ø¥Ø¶Ø§ÙØ© Ø£Ø·Ø±Ø§Ù Ø§Ù„Ù‚Ø¶ÙŠØ©', 'Add Case Parties', 'cases', 'case_parties', '2025-11-04 16:07:11'),
(181, 'Ø¹Ø±Ø¶ Ø£Ø·Ø±Ø§Ù Ø§Ù„Ù‚Ø¶ÙŠØ©', 'View Case Parties', 'cases', 'case_parties', '2025-11-04 16:07:11'),
(182, 'ØªØ¹Ø¯ÙŠÙ„ Ø£Ø·Ø±Ø§Ù Ø§Ù„Ù‚Ø¶ÙŠØ©', 'Edit Case Parties', 'cases', 'case_parties', '2025-11-04 16:07:11'),
(183, 'Ø­Ø°Ù Ø£Ø·Ø±Ø§Ù Ø§Ù„Ù‚Ø¶ÙŠØ©', 'Delete Case Parties', 'cases', 'case_parties', '2025-11-04 16:07:11'),
(184, 'Ø¥Ø¶Ø§ÙØ© Ø¥Ø´Ø¹Ø§Ø± Ù‚Ø¶Ø§Ø¦ÙŠ', 'Add Judicial Notice', 'cases', 'judicial_notices', '2025-11-04 16:07:11'),
(185, 'Ø¹Ø±Ø¶ Ø¥Ø´Ø¹Ø§Ø± Ù‚Ø¶Ø§Ø¦ÙŠ', 'View Judicial Notice', 'cases', 'judicial_notices', '2025-11-04 16:07:11'),
(186, 'ØªØ¹Ø¯ÙŠÙ„ Ø¥Ø´Ø¹Ø§Ø± Ù‚Ø¶Ø§Ø¦ÙŠ', 'Edit Judicial Notice', 'cases', 'judicial_notices', '2025-11-04 16:07:11'),
(187, 'Ø­Ø°Ù Ø¥Ø´Ø¹Ø§Ø± Ù‚Ø¶Ø§Ø¦ÙŠ', 'Delete Judicial Notice', 'cases', 'judicial_notices', '2025-11-04 16:07:11'),
(192, 'Ø¥Ø¶Ø§ÙØ© Ù†ÙˆØ¹ Ù…Ù„Ù Ø¬Ø¯ÙŠØ¯', 'Add Case Type', 'cases', 'case_types', '2025-11-04 16:07:11'),
(194, 'Ø­Ø°Ù Ù†ÙˆØ¹ Ù‚Ø¶ÙŠØ©', 'Delete Case Type', 'cases', 'case_types', '2025-11-04 16:07:11'),
(195, 'Ø¥Ø¶Ø§ÙØ© ØªØµÙ†ÙŠÙ Ù…Ù„Ù Ø¬Ø¯ÙŠØ¯', 'Add Case Classification', 'cases', 'case_classifications', '2025-11-04 16:07:12'),
(197, 'Ø­Ø°Ù ØªØµÙ†ÙŠÙ Ù‚Ø¶ÙŠØ©', 'Delete Case Classification', 'cases', 'case_classifications', '2025-11-04 16:07:12'),
(198, 'Ø¥Ø¶Ø§ÙØ© Ø¯Ø±Ø¬Ø© ØªÙ‚Ø§Ø¶ÙŠ', 'Add Court Degree', 'cases', 'case_degrees', '2025-11-04 16:07:12'),
(199, 'Ø¹Ø±Ø¶ Ø¯Ø±Ø¬Ø© ØªÙ‚Ø§Ø¶ÙŠ', 'View Court Degree', 'cases', 'case_degrees', '2025-11-04 16:07:12'),
(200, 'ØªØ¹Ø¯ÙŠÙ„ Ø¯Ø±Ø¬Ø© ØªÙ‚Ø§Ø¶ÙŠ', 'Edit Court Degree', 'cases', 'case_degrees', '2025-11-04 16:07:12'),
(201, 'Ø­Ø°Ù Ø¯Ø±Ø¬Ø© ØªÙ‚Ø§Ø¶ÙŠ', 'Delete Court Degree', 'cases', 'case_degrees', '2025-11-04 16:07:12'),
(202, 'Ø¥Ø¶Ø§ÙØ© Ù…Ø³ØªÙ†Ø¯ Ù„Ù„Ù…Ù„Ù', 'Add Case Document', 'cases', 'case_documents', '2025-11-04 16:07:12'),
(205, 'Ø­Ø°Ù Ù…Ø³ØªÙ†Ø¯ Ù…Ù† Ø§Ù„Ù…Ù„Ù', 'Delete Case Document', 'cases', 'case_documents', '2025-11-04 16:07:12'),
(206, 'Ø¥Ø¶Ø§ÙØ© Ù…ÙˆÙƒÙ„', 'Add Party', 'parties', 'parties', '2025-11-04 16:12:37'),
(207, 'Ø¹Ø±Ø¶ Ù…ÙˆÙƒÙ„', 'View Party', 'parties', 'parties', '2025-11-04 16:12:37'),
(208, 'ØªØ¹Ø¯ÙŠÙ„ Ù…ÙˆÙƒÙ„', 'Edit Party', 'parties', 'parties', '2025-11-04 16:12:37'),
(209, 'Ø­Ø°Ù Ù…ÙˆÙƒÙ„', 'Delete Party', 'parties', 'parties', '2025-11-04 16:12:37'),
(210, 'Ø¥Ø¶Ø§ÙØ© Ù…Ø³ØªÙ†Ø¯ Ù…ÙˆÙƒÙ„', 'Add Party Document', 'parties', 'party_documents', '2025-11-04 16:12:37'),
(213, 'Ø­Ø°Ù Ù…Ø³ØªÙ†Ø¯ Ø·Ø±Ù', 'Delete Party Document', 'parties', 'party_documents', '2025-11-04 16:12:37'),
(214, 'Ø¥Ø¶Ø§ÙØ© Ø·Ù„Ø¨ Ù„Ù„Ù…ÙˆÙƒÙ„', 'Add Party Order', 'parties', 'party_orders', '2025-11-04 16:12:38'),
(215, 'Ø¹Ø±Ø¶ Ø·Ù„Ø¨Ø§Øª Ø§Ù„Ù…ÙˆÙƒÙ„', 'View Party Order', 'parties', 'party_orders', '2025-11-04 16:12:38'),
(216, 'ØªØ¹Ø¯ÙŠÙ„ Ø·Ù„Ø¨ Ø§Ù„Ù…ÙˆÙƒÙ„', 'Edit Party Order', 'parties', 'party_orders', '2025-11-04 16:12:38'),
(217, 'Ø­Ø°Ù Ø·Ù„Ø¨ Ø§Ù„Ù…ÙˆÙƒÙ„', 'Delete Party Order', 'parties', 'party_orders', '2025-11-04 16:12:38'),
(218, 'Ø¥Ø¶Ø§ÙØ© Ø§Ø¬ØªÙ…Ø§Ø¹', 'Add Meeting', 'parties', 'meetings', '2025-11-04 16:12:38'),
(219, 'Ø¹Ø±Ø¶ Ø§Ø¬ØªÙ…Ø§Ø¹', 'View Meeting', 'parties', 'meetings', '2025-11-04 16:12:38'),
(220, 'ØªØ¹Ø¯ÙŠÙ„ Ø§Ø¬ØªÙ…Ø§Ø¹', 'Edit Meeting', 'parties', 'meetings', '2025-11-04 16:12:38'),
(221, 'Ø­Ø°Ù Ø§Ø¬ØªÙ…Ø§Ø¹', 'Delete Meeting', 'parties', 'meetings', '2025-11-04 16:12:38'),
(222, 'Ø¥Ø¶Ø§ÙØ© Ø§ØªÙØ§Ù‚ÙŠØ©', 'Add Deal', 'parties', 'client_deals', '2025-11-04 16:12:38'),
(223, 'Ø¹Ø±Ø¶ Ø§ØªÙØ§Ù‚ÙŠØ©', 'View Deal', 'parties', 'client_deals', '2025-11-04 16:12:38'),
(224, 'ØªØ¹Ø¯ÙŠÙ„ Ø§ØªÙØ§Ù‚ÙŠØ©', 'Edit Deal', 'parties', 'client_deals', '2025-11-04 16:12:38'),
(225, 'Ø­Ø°Ù Ø§ØªÙØ§Ù‚ÙŠØ©', 'Delete Deal', 'parties', 'client_deals', '2025-11-04 16:12:38'),
(227, 'Ø¹Ø±Ø¶ Ø§Ù„Ù…Ù„ÙØ§Øª', 'Show Cases', 'cases', 'cases', '2025-11-04 16:36:35'),
(228, 'Ø¹Ø±Ø¶ Ø§Ù„Ø§ØªÙØ§Ù‚ÙŠØ§Øª', 'View  Deals', 'parties', 'client_deals', '2025-11-04 16:12:38'),
(229, 'Ø¹Ø±Ø¶ Ø·Ù„Ø¨Ø§Øª Ø§Ù„Ù…ÙˆÙƒÙ„ÙŠÙ†', 'View Parties Orders', 'parties', 'party_orders', '2025-11-04 16:12:38'),
-- ============================================================
-- FINANCE PERMISSIONS (added 2026-05-06 for UAE FTA compliance)
-- ============================================================
(300, 'Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„Ø¥Ø¹Ø¯Ø§Ø¯Ø§Øª Ø§Ù„Ø¹Ø§Ù…Ø©', 'manage_settings', 'settings', 'general', '2026-05-06 17:00:00'),
(301, 'Ø¹Ø±Ø¶ Ø§Ù„Ø­Ø³Ø§Ø¨Ø§Øª Ø§Ù„Ø¨Ù†ÙƒÙŠØ©', 'view_bank_accounts', 'finance', 'bank_accounts', '2026-05-06 17:00:00'),
(302, 'Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„Ø­Ø³Ø§Ø¨Ø§Øª Ø§Ù„Ø¨Ù†ÙƒÙŠØ©', 'manage_bank_accounts', 'finance', 'bank_accounts', '2026-05-06 17:00:00'),
(303, 'Ø¹Ø±Ø¶ Ø§Ù„ÙÙˆØ§ØªÙŠØ±', 'view_invoices', 'finance', 'invoices', '2026-05-06 17:00:00'),
(304, 'Ø¥Ø¶Ø§ÙØ© ÙØ§ØªÙˆØ±Ø©', 'invoice_add', 'finance', 'invoices', '2026-05-06 17:00:00'),
(305, 'ØªØ¹Ø¯ÙŠÙ„ ÙØ§ØªÙˆØ±Ø©', 'invoice_edit', 'finance', 'invoices', '2026-05-06 17:00:00'),
(306, 'Ø­Ø°Ù ÙØ§ØªÙˆØ±Ø©', 'invoice_delete', 'finance', 'invoices', '2026-05-06 17:00:00'),
(307, 'Ø¹Ø±Ø¶ Ø¯ÙØªØ± Ø§Ù„Ø£Ø³ØªØ§Ø°', 'view_accounts', 'finance', 'ledger', '2026-05-06 17:00:00'),
(308, 'Ø¥Ø¯Ø§Ø±Ø© Ø¯ÙØªØ± Ø§Ù„Ø£Ø³ØªØ§Ø°', 'manage_accounts', 'finance', 'ledger', '2026-05-06 17:00:00'),
(309, 'Ø¹Ø±Ø¶ Ø§Ù„ØªÙ‚Ø§Ø±ÙŠØ± Ø§Ù„Ù…Ø§Ù„ÙŠØ©', 'view_financial_reports', 'finance', 'reports', '2026-05-06 17:00:00'),
(310, 'Ø¹Ø±Ø¶ ØªÙ‚Ø§Ø±ÙŠØ± Ø¶Ø±ÙŠØ¨Ø© Ø§Ù„Ù‚ÙŠÙ…Ø© Ø§Ù„Ù…Ø¶Ø§ÙØ©', 'view_vat_reports', 'finance', 'reports', '2026-05-06 17:00:00'),
-- Journal Entries
(311, 'Ø¹Ø±Ø¶ Ø§Ù„Ù‚ÙŠÙˆØ¯ Ø§Ù„Ù…Ø­Ø§Ø³Ø¨ÙŠØ©', 'view_journal_entries', 'finance', 'journal_entries', '2026-05-06 17:00:00'),
(312, 'Ø¹Ø±Ø¶ Ù‚ÙŠØ¯ Ù…Ø­Ø§Ø³Ø¨ÙŠ', 'view_journal_entry', 'finance', 'journal_entries', '2026-05-06 17:00:00'),
(313, 'Ø¥Ù†Ø´Ø§Ø¡ Ù‚ÙŠØ¯ Ù…Ø­Ø§Ø³Ø¨ÙŠ', 'create_journal_entry', 'finance', 'journal_entries', '2026-05-06 17:00:00'),
-- Fiscal Periods
(314, 'Ø¹Ø±Ø¶ Ø§Ù„ÙØªØ±Ø§Øª Ø§Ù„Ù…Ø§Ù„ÙŠØ©', 'view_fiscal_periods', 'finance', 'fiscal_periods', '2026-05-06 17:00:00'),
(315, 'Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„ÙØªØ±Ø§Øª Ø§Ù„Ù…Ø§Ù„ÙŠØ©', 'manage_fiscal_periods', 'finance', 'fiscal_periods', '2026-05-06 17:00:00'),
-- Budgets
(316, 'Ø¹Ø±Ø¶ Ø§Ù„Ù…ÙŠØ²Ø§Ù†ÙŠØ§Øª', 'view_budgets', 'finance', 'budgets', '2026-05-06 17:00:00'),
(317, 'Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„Ù…ÙŠØ²Ø§Ù†ÙŠØ§Øª', 'manage_budgets', 'finance', 'budgets', '2026-05-06 17:00:00'),
-- Petty Cash
(318, 'Ø¹Ø±Ø¶ Ø§Ù„Ù†Ø«Ø±ÙŠØ§Øª', 'view_petty_cash', 'finance', 'petty_cash', '2026-05-06 17:00:00'),
(319, 'Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„Ù†Ø«Ø±ÙŠØ§Øª', 'manage_petty_cash', 'finance', 'petty_cash', '2026-05-06 17:00:00'),
-- Assets
(320, 'Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„Ø£ØµÙˆÙ„', 'manage_assets', 'finance', 'assets', '2026-05-06 17:00:00'),
-- Employee Statements
(321, 'Ø¹Ø±Ø¶ ÙƒØ´ÙˆÙØ§Øª Ø§Ù„Ù…ÙˆØ¸ÙÙŠÙ†', 'view_employee_statements', 'finance', 'employee_statements', '2026-05-06 17:00:00'),
-- ============================================================
-- SECURITY / SETTINGS PERMISSIONS
-- ============================================================
(322, 'Ø¹Ø±Ø¶ Ø§Ù„Ø£Ø¯ÙˆØ§Ø±', 'view_roles', 'settings', 'security', '2026-05-06 17:00:00'),
(323, 'Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„Ø£Ù…Ø§Ù†', 'manage_security', 'settings', 'security', '2026-05-06 17:00:00'),
(324, 'Ø¹Ø±Ø¶ Ø§Ù„ØµÙ„Ø§Ø­ÙŠØ§Øª', 'view_permissions', 'settings', 'security', '2026-05-06 17:00:00'),
(325, 'Ø¹Ø±Ø¶ Ø§Ù„ÙØ±ÙˆØ¹', 'view_branches', 'settings', 'branches', '2026-05-06 17:00:00'),
(326, 'Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„ÙØ±ÙˆØ¹', 'manage_branches', 'settings', 'branches', '2026-05-06 17:00:00'),
-- ============================================================
-- LOGS PERMISSIONS
-- ============================================================
(327, 'Ø¹Ø±Ø¶ Ø³Ø¬Ù„Ø§Øª Ø§Ù„Ù†Ø´Ø§Ø·', 'view_logs', 'settings', 'logs', '2026-05-06 17:00:00'),
(328, 'Ø¥Ø¯Ø§Ø±Ø© Ø³Ø¬Ù„Ø§Øª Ø§Ù„Ù†Ø´Ø§Ø·', 'manage_logs', 'settings', 'logs', '2026-05-06 17:00:00'),
-- ============================================================
-- BRANCHES PERMISSIONS
-- ============================================================
(329, 'Ø¥Ø¶Ø§ÙØ© ÙØ±Ø¹', 'Add Branch', 'settings', 'branches', '2026-05-06 18:00:00'),
(330, 'ØªØ¹Ø¯ÙŠÙ„ ÙØ±Ø¹', 'Update Branch', 'settings', 'branches', '2026-05-06 18:00:00'),
(331, 'Ø­Ø°Ù ÙØ±Ø¹', 'Delete Branch', 'settings', 'branches', '2026-05-06 18:00:00'),
-- ============================================================
-- HR / PAYROLL PERMISSIONS
-- ============================================================
(332, 'Ø¹Ø±Ø¶ ÙƒØ´ÙˆÙ Ø§Ù„Ø±ÙˆØ§ØªØ¨', 'View Payroll', 'hr', 'payroll', '2026-05-06 18:00:00'),
(333, 'Ù…Ø¹Ø§Ù„Ø¬Ø© Ø§Ù„Ø±ÙˆØ§ØªØ¨', 'Process Payroll', 'hr', 'payroll', '2026-05-06 18:00:00'),
(334, 'ØµØ±Ù Ø§Ù„Ø±Ø§ØªØ¨', 'Pay Salary', 'hr', 'payroll', '2026-05-06 18:00:00'),
(335, 'Ø¹Ø±Ø¶ ÙƒØ´Ù Ø­Ø³Ø§Ø¨ Ø§Ù„Ù…ÙˆØ¸Ù', 'View Employee Account Statement', 'hr', 'employee_statements', '2026-05-06 18:00:00'),
-- ============================================================
-- CLIENT DEPOSITS PERMISSIONS
-- ============================================================
(336, 'Ø¹Ø±Ø¶ ÙˆØ¯Ø§Ø¦Ø¹ Ø§Ù„Ù…ÙˆÙƒÙ„', 'View Client Deposits', 'finance', 'client_deposits', '2026-05-06 18:00:00'),
(337, 'Ø¥Ø¶Ø§ÙØ© ÙˆØ¯ÙŠØ¹Ø© Ù…ÙˆÙƒÙ„', 'Add Client Deposit', 'finance', 'client_deposits', '2026-05-06 18:00:00'),
(338, 'ØªØ¹Ø¯ÙŠÙ„ ÙˆØ¯ÙŠØ¹Ø© Ù…ÙˆÙƒÙ„', 'Edit Client Deposit', 'finance', 'client_deposits', '2026-05-06 18:00:00'),
(339, 'Ø­Ø°Ù ÙˆØ¯ÙŠØ¹Ø© Ù…ÙˆÙƒÙ„', 'Delete Client Deposit', 'finance', 'client_deposits', '2026-05-06 18:00:00'),
-- ============================================================
-- EMPLOYEE CASH TRANSACTIONS PERMISSIONS
-- ============================================================
(340, 'Ø¹Ø±Ø¶ Ù…Ø¹Ø§Ù…Ù„Ø§Øª Ø§Ù„Ù†Ù‚Ø¯ÙŠØ© Ù„Ù„Ù…ÙˆØ¸Ù', 'View Employee Cash Transactions', 'finance', 'employee_cash', '2026-05-06 18:00:00'),
(341, 'Ø¥Ø¶Ø§ÙØ© Ù…Ø¹Ø§Ù…Ù„Ø© Ù†Ù‚Ø¯ÙŠØ© Ù„Ù„Ù…ÙˆØ¸Ù', 'Add Employee Cash Transaction', 'finance', 'employee_cash', '2026-05-06 18:00:00'),
(342, 'ØªØ¹Ø¯ÙŠÙ„ Ù…Ø¹Ø§Ù…Ù„Ø© Ù†Ù‚Ø¯ÙŠØ© Ù„Ù„Ù…ÙˆØ¸Ù', 'Edit Employee Cash Transaction', 'finance', 'employee_cash', '2026-05-06 18:00:00'),
(343, 'Ø­Ø°Ù Ù…Ø¹Ø§Ù…Ù„Ø© Ù†Ù‚Ø¯ÙŠØ© Ù„Ù„Ù…ÙˆØ¸Ù', 'Delete Employee Cash Transaction', 'finance', 'employee_cash', '2026-05-06 18:00:00'),
(344, 'Ø­Ø°Ù Ù…Ø±ÙÙ‚ Ù…Ø¹Ø§Ù…Ù„Ø© Ù†Ù‚Ø¯ÙŠØ©', 'Delete Employee Cash Transaction Attachment', 'finance', 'employee_cash', '2026-05-06 18:00:00'),
-- ============================================================
-- SESSIONS PERMISSIONS
-- ============================================================
(345, 'Ø¹Ø±Ø¶ Ø§Ù„Ø¬Ù„Ø³Ø§Øª', 'View Sessions', 'cases', 'sessions', '2026-05-06 18:00:00');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `police_stations`
--

CREATE TABLE `police_stations` (
  `id` int NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `police_stations`
--

INSERT INTO `police_stations` (`id`, `name_ar`, `name_en`, `created_at`) VALUES
(1, 'Ù…Ø±ÙƒØ² Ø´Ø±Ø·Ø© Ø§Ù„Ø±Ø§Ø´Ø¯ÙŠØ©', 'Al Rashidiya Police Station', '2025-09-18 06:18:47'),
(3, 'Ù…Ø±ÙƒØ² Ø´Ø±Ø·Ø© Ø§Ù„Ø­Ù…ÙŠØ¯ÙŠØ©', 'Al Hamidiya Police Station', '2025-09-18 06:18:47'),
(4, 'Ù…Ø±ÙƒØ² Ø´Ø±Ø·Ø© Ø§Ù„Ù†Ø¹ÙŠÙ…ÙŠØ©', 'Al Nuaimiya Police Station', '2025-09-18 06:18:47'),
(25, 'Ø´Ø±Ø¸Ø© Ù…ØµÙÙˆØª', 'Ø´Ø±Ø·Ø© Ø§Ù„Ø¬Ø±Ù', '2025-09-20 19:32:02'),
(26, 'Ù…Ø±ÙƒØ² Ø´Ø±Ø·Ø© Ø§Ù„Ø¨Ø±Ø´Ø§Ø¡', 'albrsha police station', '2025-10-30 01:40:27');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `public_prosecutions`
--

CREATE TABLE `public_prosecutions` (
  `id` int NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `public_prosecutions`
--

INSERT INTO `public_prosecutions` (`id`, `name_ar`, `name_en`, `created_at`) VALUES
(1, 'Ù†ÙŠØ§Ø¨Ø© Ø¯Ø¨ÙŠ', 'Dubai Public Prosecution', '2025-09-18 06:18:47'),
(2, 'Ù†ÙŠØ§Ø¨Ø© Ø¹Ø­Ù…Ø§Ù†', 'Anti-Corruption Specialized Prosecution', '2025-09-18 06:18:47'),
(3, 'Ù†ÙŠØ§Ø¨Ø© Ø¯Ø¨ÙŠ', 'Dubai Public Prosecution', '2025-09-18 06:19:16'),
(14, 'Ø¹Ø¬Ù…Ø§Ù†', 'ajman', '2025-10-27 04:57:00');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `related_cases`
--

CREATE TABLE `related_cases` (
  `id` int NOT NULL,
  `case_id` int NOT NULL,
  `related_case_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `type` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `reviews`
--

INSERT INTO `reviews` (`id`, `employee_id`, `type`, `date`, `created_by`, `created_at`) VALUES
(2, 97, 'mid-year', '2025-10-15', 90, '2025-10-13 09:27:01'),
(3, 114, 'annual', '2025-10-20', 90, '2025-10-20 10:26:45'),
(6, 95, 'probation', '2025-10-01', 90, '2025-10-29 22:45:41');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `review_documents`
--

CREATE TABLE `review_documents` (
  `id` int NOT NULL,
  `review_id` int NOT NULL,
  `document_name` varchar(1055) NOT NULL,
  `document_url` varchar(2055) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `review_documents`
--

INSERT INTO `review_documents` (`id`, `review_id`, `document_name`, `document_url`, `created_by`, `created_at`) VALUES
(5, 6, 'corrected_system_architecture_Original.jpeg', 'https://lexcora.s3.us-east-2.amazonaws.com/reviews/1761777940441-py30kzq8s7s.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS4GY53D5CUSO22MU%2F20251029%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20251029T224540Z&X-Amz-Expires=604800&X-Amz-Signature=2c40ed13a727c96fcb36f77313bf3d79f5cc472803724795f7d97e75a3a67f9b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', 90, '2025-10-29 22:45:41');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `role_ar` varchar(100) NOT NULL,
  `role_en` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `roles`
--

INSERT INTO `roles` (`id`, `role_ar`, `role_en`, `created_at`) VALUES
(1, 'Ù…Ø¯ÙŠØ± Ø¹Ø§Ù…', 'admin', '2025-09-18 06:12:44'),
(2, 'Ù…Ø¯ÙŠØ± Ù‚Ø§Ù†ÙˆÙ†ÙŠ', 'Legal Manager', '2025-09-18 06:12:44'),
(3, 'Ù…Ø­Ø§Ù…ÙŠ', 'Lawyer', '2025-09-18 06:12:44'),
(4, 'Ù…Ø³ØªØ´Ø§Ø± Ù‚Ø§Ù†ÙˆÙ†ÙŠ', 'Legal Advisor', '2025-09-18 06:12:44'),
(5, 'Ø¨Ø§Ø­Ø« Ù‚Ø§Ù†ÙˆÙ†ÙŠ', 'Legal Researcher', '2025-09-18 06:12:44'),
(6, 'Ø³ÙƒØ±ØªÙŠØ±', 'Secretary', '2025-09-18 06:12:44'),
(7, 'Ù…Ø­Ø§Ø³Ø¨', 'Accountant', '2025-09-18 06:12:44'),
(8, 'Ù…ÙˆØ¸Ù Ø§Ø³ØªÙ‚Ø¨Ø§Ù„', 'Receptionist', '2025-09-18 06:12:44'),
(9, 'Ù…Ø·ÙˆØ±', 'developer', '2025-09-18 16:03:18'),
(10, 'Ù…ÙˆØ¸Ù Ù…ÙˆØ§Ø±Ø¯ Ø¨Ø´Ø±ÙŠØ©', 'HR Officer', '2025-10-13 01:59:33');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `salaries`
--

CREATE TABLE `salaries` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `base_salary` decimal(10,2) NOT NULL,
  `allowances` decimal(10,2) DEFAULT '0.00',
  `deductions` decimal(10,2) DEFAULT '0.00',
  `overtime_hours` decimal(5,2) DEFAULT '0.00',
  `overtime_rate` decimal(10,2) DEFAULT '0.00',
  `overtime_amount` decimal(10,2) DEFAULT '0.00',
  `net_salary` decimal(10,2) NOT NULL,
  `pay_period` date NOT NULL,
  `payment_date` date DEFAULT NULL,
  `status` enum('pending','processed','paid') DEFAULT 'pending',
  `notes` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `sessions`
--

CREATE TABLE `sessions` (
  `id` int NOT NULL,
  `case_id` int NOT NULL,
  `session_date` datetime NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_expert_session` tinyint(1) DEFAULT '0',
  `decision` varchar(255) DEFAULT NULL,
  `note` text,
  `is_judgment_reserved` tinyint(1) NOT NULL DEFAULT '0',
  `is_judgment_deferred` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `has_ruling` tinyint(1) DEFAULT '0',
  `ruling` text,
  `legal_period_id` int DEFAULT NULL,
  `ruling_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `sessions`
--

INSERT INTO `sessions` (`id`, `case_id`, `session_date`, `link`, `is_expert_session`, `decision`, `note`, `is_judgment_reserved`, `is_judgment_deferred`, `status`, `created_at`, `has_ruling`, `ruling`, `legal_period_id`, `ruling_date`) VALUES
(69, 143, '2025-10-15 20:00:00', 'Gmail.com', 1, 'ØªÙ‚Ø¯ÙŠÙ… Ù…Ø°ÙƒØ±Ø© Ø¬ÙˆØ§Ø¨ÙŠÙ‡', NULL, 1, 0, 'active', '2025-10-15 15:49:20', 1, 'test22', 2, '2025-10-24'),
(70, 144, '2025-10-28 08:00:00', NULL, 0, 'Ø§ÙˆÙ„ Ø¬Ù„Ø³Ø©', NULL, 0, 0, 'active', '2025-10-17 06:36:59', 0, NULL, NULL, NULL),
(71, 139, '2025-10-15 20:36:00', NULL, 1, 'test', 'test', 0, 0, 'active', '2025-10-19 12:34:42', 0, NULL, NULL, NULL),
(74, 147, '2025-10-27 11:34:00', 'gmail.com', 1, '123', NULL, 0, 0, 'active', '2025-10-27 07:38:58', 0, NULL, NULL, NULL),
(75, 148, '2025-10-27 11:34:00', 'gmail.com', 1, '123', NULL, 0, 0, 'active', '2025-10-27 07:39:07', 0, NULL, NULL, NULL),
(76, 149, '2025-10-27 11:34:00', 'gmail.com', 1, '123', NULL, 0, 0, 'active', '2025-10-27 07:39:47', 0, NULL, NULL, NULL),
(84, 149, '2025-09-30 01:00:00', NULL, 1, NULL, NULL, 0, 0, 'active', '2025-10-29 05:35:30', 1, 'test', 3, '2025-10-01'),
(85, 147, '2025-11-05 09:00:00', 'www.almstkshf.com', 0, NULL, 'ØªØ¬Ø±Ø¨Ø© Ø¹Ù„Ù‰ Ø§Ù„Ø§Ø¶Ø§ÙØ©', 0, 0, 'active', '2025-10-30 16:15:59', 1, 'ØªØ¬Ø±Ø¨Ø© Ù…Ù†Ø·ÙˆÙ‚ Ø§Ù„Ø­ÙƒÙ…', 8, '2025-10-30'),
(86, 159, '2025-11-03 00:00:00', '', 0, 'Ø§Ø­Ø§Ù„Ù‡', NULL, 0, 0, 'active', '2025-11-01 06:26:38', 0, NULL, NULL, NULL),
(87, 159, '2025-11-08 11:00:00', NULL, 0, NULL, 'Ù…Ø°ÙƒØ±Ø© Ø®ØªØ§Ù…ÙŠØ©', 0, 0, 'active', '2025-11-01 06:30:33', 0, NULL, NULL, NULL),
(88, 160, '2025-11-08 00:00:00', '', 0, 'Ø§ÙˆÙ„ Ø¬Ù„Ø³Ø©', NULL, 0, 0, 'active', '2025-11-01 14:44:02', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `session_documents`
--

CREATE TABLE `session_documents` (
  `id` int NOT NULL,
  `document_url` varchar(1055) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_id` int NOT NULL,
  `document_name` varchar(1055) NOT NULL,
  `uploaded_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `sick_leaves`
--

CREATE TABLE `sick_leaves` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `total_days` int NOT NULL,
  `remaining_days` int DEFAULT '0',
  `leave_type` enum('paid','unpaid') NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `sick_leaves`
--

INSERT INTO `sick_leaves` (`id`, `employee_id`, `date`, `from_date`, `to_date`, `total_days`, `remaining_days`, `leave_type`, `created_by`, `created_at`) VALUES
(1, 90, '2025-10-08', '2025-10-08', '2025-10-09', 2, 2, 'unpaid', 73, '2025-10-12 04:59:54'),
(2, 114, '2025-10-20', '2025-10-20', '2025-10-20', 1, 29, 'paid', 90, '2025-10-20 10:47:04'),
(3, 95, '2025-08-05', '2025-10-06', '2025-10-15', 10, 0, 'paid', 90, '2025-10-29 22:44:03');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `tasks`
--

CREATE TABLE `tasks` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `assigned_to` int DEFAULT NULL,
  `assigned_by` int DEFAULT NULL,
  `case_id` int DEFAULT NULL,
  `priority` enum('normal','high','urgent') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'normal',
  `status` enum('pending','in_progress','completed','cancelled') DEFAULT 'pending',
  `due_date` date DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `assigned_to`, `assigned_by`, `case_id`, `priority`, `status`, `due_date`, `completed_at`, `created_at`) VALUES
(40, 'Ø¹Ù…Ù„ Ù…Ø°ÙƒØ±Ø©  ÙˆØ§Ø±Ø³Ø§Ù„Ù‡Ø§ Ø®Ù„Ø§Ù„ Ù‡Ø°Ø§ Ø§Ù„Ø§Ø³Ø¨ÙˆØ¹', 'ÙŠØ±Ø¬Ù‰ Ø§Ø±Ø³Ø§Ù„ Ø§Ù„Ù…Ø°ÙƒØ±Ø© Ù…Ø¹ Ø¥Ø±ÙØ§Ù‚ Ø§Ù„Ù…Ù„ÙØ§Øª ÙˆØ§Ù„Ù…Ø³ØªÙ†Ø¯Ø§Øª Ø§Ù„Ù…ØªØ¹Ù„Ù‚Ø© Ø¨Ù‡Ø§', 90, 73, 139, 'high', 'completed', '2025-10-13', NULL, '2025-10-05 15:27:09'),
(44, 'Ù…Ø°ÙƒØ±Ø© Ø¬ÙˆØ§Ø¨ÙŠÙ‡ ', 'Ù…Ø°ÙƒØ±Ø© Ø¬ÙˆØ§Ø¨ÙŠÙ‡ ', 102, 105, 143, 'urgent', 'in_progress', '2025-10-31', NULL, '2025-10-15 15:49:20'),
(45, 'Ù…Ø°ÙƒØ±Ø© Ø¬ÙˆØ§Ø¨ÙŠÙ‡ ', 'Ù…Ø°ÙƒØ±Ø© Ø¬ÙˆØ§Ø¨ÙŠÙ‡ ', 108, 105, 143, 'normal', 'pending', '2025-10-31', NULL, '2025-10-15 15:58:13'),
(46, 'Ù…Ø°ÙƒØ±Ø© Ø¬ÙˆØ§Ø¨ÙŠÙ‡', 'Ù…Ø°ÙƒØ±Ø© Ø¬ÙˆØ§Ø¨ÙŠÙ‡', 108, 108, 143, 'high', 'pending', '2025-10-28', NULL, '2025-10-15 16:02:35'),
(47, 'ÙƒØªØ§Ø¨Ù‡ Ù…Ø°ÙƒØ±Ø© ', 'ÙƒØªØ§Ø¨Ù‡ Ù…Ø°ÙƒØ±Ø© ', 102, 105, 144, 'urgent', 'pending', '2025-10-21', NULL, '2025-10-17 06:36:59'),
(51, 'test', 'test', 97, 90, NULL, 'normal', 'pending', '2025-10-25', NULL, '2025-10-30 10:07:17'),
(52, 'ØªØ³Ø¬ÙŠÙ„ Ø§Ù„Ø¯Ø¹ÙˆÙ‰ ÙÙŠ Ø§Ù„Ù…Ø­ÙƒÙ…Ø©', 'ØªØ³Ø¬ÙŠÙ„ Ø§ÙˆØ±Ø§Ù‚ Ø§Ù„Ø¯Ø¹ÙˆÙ‰ Ùˆ Ù…ØªØ§Ø¨Ø¹Ø© Ù‚Ø±Ø§Ø± Ø§Ù„Ù‚Ø§Ø¶ÙŠ', 117, 90, 158, 'urgent', 'pending', '2025-11-05', NULL, '2025-10-30 10:48:25'),
(54, 'Ù‚ÙØ¨Ø«ÙŠØ¡Ø³', 'ÙÙ„Ù‚Ø¨Ø«ÙŠ', 97, 90, NULL, 'normal', 'completed', '2025-10-30', NULL, '2025-10-31 00:58:14'),
(55, 'ÙƒØªØ§Ø¨Ù‡ Ù…Ø°ÙƒØ±Ø© ', 'ÙƒØªØ§Ø¨Ù‡ Ù…Ø°ÙƒØ±Ø© ', 102, 90, 159, 'high', 'pending', '2025-11-03', NULL, '2025-11-01 06:26:40'),
(56, 'ØªØµÙˆÙŠØ±', 'ØªØµÙˆÙŠØ± Ø§Ù„Ø­ÙƒÙ…', 104, 90, 160, 'urgent', 'pending', '2025-11-03', NULL, '2025-11-01 14:44:04');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `task_comments`
--

CREATE TABLE `task_comments` (
  `id` int NOT NULL,
  `task_id` int NOT NULL,
  `comment` varchar(255) NOT NULL,
  `commented_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `task_comments`
--

INSERT INTO `task_comments` (`id`, `task_id`, `comment`, `commented_by`, `created_at`) VALUES
(7, 40, 'ØªÙ… Ø¹Ù…Ù„ Ø§Ù„Ù…Ø°ÙƒØ±Ø© Ø§Ù„ÙŠÙˆÙ…', 90, '2025-10-05 22:41:01'),
(8, 51, 'hi', 90, '2025-10-30 10:07:57');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `task_documents`
--

CREATE TABLE `task_documents` (
  `id` int NOT NULL,
  `task_id` int NOT NULL,
  `document_url` varchar(1055) NOT NULL,
  `document_name` varchar(1055) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uploaded_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `task_documents`
--

INSERT INTO `task_documents` (`id`, `task_id`, `document_url`, `document_name`, `created_at`, `uploaded_by`) VALUES
(30, 51, 'https://lexcora.s3.us-east-2.amazonaws.com/tasks/1761818892221-53kz54oeykv.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS4GY53D5CUSO22MU%2F20251030%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20251030T100825Z&X-Amz-Expires=604800&X-Amz-Signature=7a29697dbe5a25328f0a5afd8e948a4c5763bc882ebffec77efd9f8629ffce1f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', '26.2025.pdf', '2025-10-30 10:08:26', NULL),
(31, 51, 'https://lexcora.s3.us-east-2.amazonaws.com/tasks/1761819157931-uyqt2jfdz9.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS4GY53D5CUSO22MU%2F20251030%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20251030T101242Z&X-Amz-Expires=604800&X-Amz-Signature=20b03cfe0452489cf5c8ec8268669b000f62e12626376b1bf7fd2b9d1cd3552a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', 'IMG-20251025-WA0000.jpg', '2025-10-30 10:12:43', NULL),
(33, 55, 'https://lexcora.s3.us-east-2.amazonaws.com/tasks/1761978399791-7tv8utmzoao.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS4GY53D5CUSO22MU%2F20251101%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20251101T062639Z&X-Amz-Expires=604800&X-Amz-Signature=ab1ef11179574c63e90c2dd6c4e035dccd512e30b4d9fd499d517220529e8a98&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', 'Ã™Â…Ã˜Â­Ã˜Â¶Ã˜Â± Ã˜Â¬Ã™Â„Ã˜Â³Ã™Â‡.pdf', '2025-11-01 06:26:40', NULL);

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `test`
--

CREATE TABLE `test` (
  `full_name` varchar(100) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `test`
--

INSERT INTO `test` (`full_name`, `email`) VALUES
('test', 'tha@gmail.com'),
('ek3j', 'rf@ehfef.com'),
('ek3j', 'rf@ehfef.com'),
('yg', 'rh@reu.com'),
('yg', 'rh@reu.com'),
('iuhr', 'ij@huh.com'),
('test', 'edije@uhdi.com');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `trainings`
--

CREATE TABLE `trainings` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `training_date` date NOT NULL,
  `type` varchar(100) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `trainings`
--

INSERT INTO `trainings` (`id`, `employee_id`, `training_date`, `type`, `created_by`, `created_at`) VALUES
(2, 96, '2025-10-14', 'test', 73, '2025-10-12 07:18:51'),
(3, 97, '2025-10-23', 'ØªØ¯ÙŠØ¨ Ù…Ø­Ø§Ù…Ø§Ø©', 90, '2025-10-13 09:27:57'),
(4, 114, '2025-10-21', 'Vat Training ', 90, '2025-10-20 10:27:11'),
(5, 95, '2025-10-26', 'ÙƒÙŠÙ ØªØ¨Ù‡Ø± Ù…Ø¯ÙŠØ±Ùƒ', 90, '2025-10-29 22:49:05');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `training_documents`
--

CREATE TABLE `training_documents` (
  `id` int NOT NULL,
  `training_id` int NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `document_url` varchar(500) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `training_documents`
--

INSERT INTO `training_documents` (`id`, `training_id`, `document_name`, `document_url`, `created_by`, `created_at`) VALUES
(3, 5, 'user_project_mindmap_Original.jpeg', 'https://lexcora.s3.us-east-2.amazonaws.com/trainings/1761778144856-klpngi718qq.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS4GY53D5CUSO22MU%2F20251029%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20251029T224905Z&X-Amz-Expires=604800&X-Amz-Signature=8405778f7771819d443c2a59d7adc4a96a07c534910c278985ecf35892433dfe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject', 90, '2025-10-29 22:49:05');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `warnings`
--

CREATE TABLE `warnings` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `type` enum('verbal','written') NOT NULL,
  `reason` varchar(255) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `warnings`
--

INSERT INTO `warnings` (`id`, `employee_id`, `date`, `type`, `reason`, `created_by`, `created_at`) VALUES
(2, 97, '2025-10-15', 'verbal', 'Ø§Ù‡Ù…Ø§Ù„', 90, '2025-10-13 09:28:28'),
(3, 114, '2025-10-21', 'written', 'non compliance to office policies ', 90, '2025-10-20 10:27:41'),
(4, 95, '2025-10-26', 'verbal', 'ÙØ´Ù„ ÙÙŠ Ø¥Ø¨Ù‡Ø§Ø± Ù…Ø¯ÙŠØ±Ùƒ', 90, '2025-10-29 22:49:45');

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `warning_documents`
--

CREATE TABLE `warning_documents` (
  `id` int NOT NULL,
  `warning_id` int NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `document_url` varchar(500) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Ø¨Ù†ÙŠØ© Ø§Ù„Ø¬Ø¯ÙˆÙ„ `work_hours`
--

CREATE TABLE `work_hours` (
  `id` int NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ø¥Ø±Ø¬Ø§Ø¹ Ø£Ùˆ Ø§Ø³ØªÙŠØ±Ø§Ø¯ Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¬Ø¯ÙˆÙ„ `work_hours`
--

INSERT INTO `work_hours` (`id`, `start_time`, `end_time`, `created_at`) VALUES
(1, '08:00:00', '17:00:00', '2025-10-12 02:53:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annual_leaves`
--
ALTER TABLE `annual_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `appeals_cassations`
--
ALTER TABLE `appeals_cassations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `legal_period_id` (`legal_period_id`);

--
-- Indexes for table `app_notifications`
--
ALTER TABLE `app_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `asset_documents`
--
ALTER TABLE `asset_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_id` (`asset_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bank_branch` (`branch_id`),
  ADD KEY `fk_bank_created_by` (`created_by`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_logs`
--
ALTER TABLE `call_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_call_created_by` (`created_by`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_number` (`file_number`),
  ADD KEY `idx_cases_file_number` (`file_number`),
  ADD KEY `idx_cases_branch_id` (`branch_id`),
  ADD KEY `idx_cases_lawyer_id` (`lawyer_id`),
  ADD KEY `idx_cases_created_at` (`created_at`),
  ADD KEY `cases_ibfk_12` (`counterclaim_id`),
  ADD KEY `cases_ibfk_13` (`court_id`),
  ADD KEY `cases_ibfk_14` (`counter_case_id`),
  ADD KEY `cases_ibfk_2` (`police_station_id`),
  ADD KEY `cases_ibfk_3` (`public_prosecution_id`),
  ADD KEY `cases_ibfk_5` (`secretary_id`),
  ADD KEY `cases_ibfk_6` (`case_classification_id`),
  ADD KEY `cases_ibfk_7` (`case_type_id`),
  ADD KEY `cases_ibfk_8` (`legal_advisor_id`),
  ADD KEY `cases_ibfk_9` (`legal_researcher_id`);

--
-- Indexes for table `case_classifications`
--
ALTER TABLE `case_classifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_degrees`
--
ALTER TABLE `case_degrees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `case_id` (`case_id`);

--
-- Indexes for table `case_documents`
--
ALTER TABLE `case_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploaded_by` (`uploaded_by`),
  ADD KEY `idx_case_documents_case_id` (`case_id`);

--
-- Indexes for table `case_employees_documents`
--
ALTER TABLE `case_employees_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `case_id` (`case_id`),
  ADD KEY `case_employees_documents_ibfk_2` (`employee_id`);

--
-- Indexes for table `case_parties`
--
ALTER TABLE `case_parties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `case_parties_ibfk_3` (`party_id`),
  ADD KEY `case_parties_ibfk_1` (`case_id`);

--
-- Indexes for table `case_parties_documents`
--
ALTER TABLE `case_parties_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `case_id` (`case_id`),
  ADD KEY `case_parties_document_ibfk_2` (`uploaded_by`),
  ADD KEY `party_id` (`party_id`);

--
-- Indexes for table `case_petitions`
--
ALTER TABLE `case_petitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `case_id` (`case_id`);

--
-- Indexes for table `case_petition_documents`
--
ALTER TABLE `case_petition_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `petition_id` (`petition_id`);

--
-- Indexes for table `case_types`
--
ALTER TABLE `case_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_transaction_attachments`
--
ALTER TABLE `cash_transaction_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `clients_deals`
--
ALTER TABLE `clients_deals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `courts`
--
ALTER TABLE `courts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `court_case_documents`
--
ALTER TABLE `court_case_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_court_documents_case_id` (`case_id`),
  ADD KEY `court_case_documents_ibfk_2` (`uploaded_by`);

--
-- Indexes for table `deal_documents`
--
ALTER TABLE `deal_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deal_id` (`deal_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_account_id` (`bank_account_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_id` (`job_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `directManagerId` (`direct_manager_id`),
  ADD KEY `idx_employees_department` (`department_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `employees_ibfk_4` (`branch_id`);

--
-- Indexes for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `employee_attendance_ibfk_2` (`created_by`);

--
-- Indexes for table `employee_cash_transactions`
--
ALTER TABLE `employee_cash_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploaded_by` (`uploaded_by`),
  ADD KEY `idx_employee_id` (`employee_id`),
  ADD KEY `idx_document_type` (`document_type`),
  ADD KEY `idx_uploaded_at` (`created_at`);

--
-- Indexes for table `employee_permissions`
--
ALTER TABLE `employee_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_permissions_ibfk_1` (`permission_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee_requests`
--
ALTER TABLE `employee_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `event_attendance`
--
ALTER TABLE `event_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `executions`
--
ALTER TABLE `executions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `case_id` (`case_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `executions_documents`
--
ALTER TABLE `executions_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `executions_documnts_ibfk_1` (`execution_id`),
  ADD KEY `executions_documnts_ibfk_2` (`uploaded_by`);

--
-- Indexes for table `external_links`
--
ALTER TABLE `external_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goaml`
--
ALTER TABLE `goaml`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_goaml_created_by` (`created_by`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `i.branch_id` (`branch_id`),
  ADD KEY `bank_account_id` (`bank_account_id`);

--
-- Indexes for table `invoice_attachments`
--
ALTER TABLE `invoice_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `judicial_orders`
--
ALTER TABLE `judicial_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `case_id` (`case_id`);

--
-- Indexes for table `judicial_orders_documents`
--
ALTER TABLE `judicial_orders_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judicial_orders_id` (`judicial_order_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `legal_periods`
--
ALTER TABLE `legal_periods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `litigation_degrees`
--
ALTER TABLE `litigation_degrees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_meetings_employee` (`created_by`),
  ADD KEY `lawyer_id` (`lawyer_id`),
  ADD KEY `party_id` (`party_id`);

--
-- Indexes for table `meetings_documents`
--
ALTER TABLE `meetings_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `meeting_id` (`meeting_id`);

--
-- Indexes for table `meeting_attendance`
--
ALTER TABLE `meeting_attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `meeting_id` (`meeting_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `memos`
--
ALTER TABLE `memos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `case_id` (`case_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `memo_documents`
--
ALTER TABLE `memo_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memo_id` (`memo_id`),
  ADD KEY `uploaded_by` (`uploaded_by`);

--
-- Indexes for table `other_leaves`
--
ALTER TABLE `other_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `parties`
--
ALTER TABLE `parties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `parties_documents`
--
ALTER TABLE `parties_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploaded_by` (`uploaded_by`),
  ADD KEY `idx_parties_documents_party_id` (`party_id`);

--
-- Indexes for table `parties_forms`
--
ALTER TABLE `parties_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `parties_orders`
--
ALTER TABLE `parties_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `party_id` (`party_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_role_permission` (`permission_ar`,`permission_en`),
  ADD KEY `idx_permissions_parent_name` (`permission_parent_name`),
  ADD KEY `idx_permissions_group_name` (`permission_group_name`);

--
-- Indexes for table `police_stations`
--
ALTER TABLE `police_stations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `public_prosecutions`
--
ALTER TABLE `public_prosecutions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `related_cases`
--
ALTER TABLE `related_cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `case_id` (`case_id`),
  ADD KEY `related_case_id` (`related_case_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `review_documents`
--
ALTER TABLE `review_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_documents_ibfk_1` (`review_id`),
  ADD KEY `review_documents_ibfk_2` (`created_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_role_ar` (`role_ar`),
  ADD UNIQUE KEY `unique_role_en` (`role_en`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sessions_case_id` (`case_id`),
  ADD KEY `idx_sessions_date` (`session_date`),
  ADD KEY `legal_period_id` (`legal_period_id`);

--
-- Indexes for table `session_documents`
--
ALTER TABLE `session_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploaded_by` (`uploaded_by`),
  ADD KEY `session_documents_ibfk_1` (`session_id`);

--
-- Indexes for table `sick_leaves`
--
ALTER TABLE `sick_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_by` (`assigned_by`),
  ADD KEY `idx_tasks_assigned_to` (`assigned_to`),
  ADD KEY `idx_tasks_case_id` (`case_id`),
  ADD KEY `idx_tasks_status` (`status`),
  ADD KEY `idx_tasks_due_date` (`due_date`);

--
-- Indexes for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_comments_ibfk_1` (`task_id`),
  ADD KEY `employee_id` (`commented_by`);

--
-- Indexes for table `task_documents`
--
ALTER TABLE `task_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploaded_by` (`uploaded_by`),
  ADD KEY `task_documents_ibfk_1` (`task_id`);

--
-- Indexes for table `trainings`
--
ALTER TABLE `trainings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trainings_ibfk_1` (`employee_id`),
  ADD KEY `trainings_ibfk_2` (`created_by`);

--
-- Indexes for table `training_documents`
--
ALTER TABLE `training_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `training_documents_ibfk_1` (`training_id`),
  ADD KEY `training_documents_ibfk_2` (`created_by`);

--
-- Indexes for table `warnings`
--
ALTER TABLE `warnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `warning_documents`
--
ALTER TABLE `warning_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warning_documents_ibfk_1` (`warning_id`),
  ADD KEY `warning_documents_ibfk_2` (`created_by`);

--
-- Indexes for table `work_hours`
--
ALTER TABLE `work_hours`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `annual_leaves`
--
ALTER TABLE `annual_leaves`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appeals_cassations`
--
ALTER TABLE `appeals_cassations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_notifications`
--
ALTER TABLE `app_notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `asset_documents`
--
ALTER TABLE `asset_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `call_logs`
--
ALTER TABLE `call_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `case_classifications`
--
ALTER TABLE `case_classifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `case_degrees`
--
ALTER TABLE `case_degrees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `case_documents`
--
ALTER TABLE `case_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_employees_documents`
--
ALTER TABLE `case_employees_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_parties`
--
ALTER TABLE `case_parties`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `case_parties_documents`
--
ALTER TABLE `case_parties_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `case_petitions`
--
ALTER TABLE `case_petitions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `case_petition_documents`
--
ALTER TABLE `case_petition_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `case_types`
--
ALTER TABLE `case_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `cash_transaction_attachments`
--
ALTER TABLE `cash_transaction_attachments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_deals`
--
ALTER TABLE `clients_deals`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `courts`
--
ALTER TABLE `courts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `court_case_documents`
--
ALTER TABLE `court_case_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `deal_documents`
--
ALTER TABLE `deal_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employee_cash_transactions`
--
ALTER TABLE `employee_cash_transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `employee_permissions`
--
ALTER TABLE `employee_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1260;

--
-- AUTO_INCREMENT for table `employee_requests`
--
ALTER TABLE `employee_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `event_attendance`
--
ALTER TABLE `event_attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `executions`
--
ALTER TABLE `executions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `executions_documents`
--
ALTER TABLE `executions_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `external_links`
--
ALTER TABLE `external_links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `goaml`
--
ALTER TABLE `goaml`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoice_attachments`
--
ALTER TABLE `invoice_attachments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `judicial_orders`
--
ALTER TABLE `judicial_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `judicial_orders_documents`
--
ALTER TABLE `judicial_orders_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `legal_periods`
--
ALTER TABLE `legal_periods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `litigation_degrees`
--
ALTER TABLE `litigation_degrees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `meetings_documents`
--
ALTER TABLE `meetings_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meeting_attendance`
--
ALTER TABLE `meeting_attendance`
  MODIFY `attendance_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `memos`
--
ALTER TABLE `memos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `memo_documents`
--
ALTER TABLE `memo_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `other_leaves`
--
ALTER TABLE `other_leaves`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parties`
--
ALTER TABLE `parties`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `parties_documents`
--
ALTER TABLE `parties_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `parties_forms`
--
ALTER TABLE `parties_forms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `parties_orders`
--
ALTER TABLE `parties_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `police_stations`
--
ALTER TABLE `police_stations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `public_prosecutions`
--
ALTER TABLE `public_prosecutions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `related_cases`
--
ALTER TABLE `related_cases`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `review_documents`
--
ALTER TABLE `review_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `session_documents`
--
ALTER TABLE `session_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `sick_leaves`
--
ALTER TABLE `sick_leaves`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `task_documents`
--
ALTER TABLE `task_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `trainings`
--
ALTER TABLE `trainings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `training_documents`
--
ALTER TABLE `training_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warnings`
--
ALTER TABLE `warnings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `warning_documents`
--
ALTER TABLE `warning_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `work_hours`
--
ALTER TABLE `work_hours`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ù‚ÙŠÙˆØ¯ Ø§Ù„Ø¬Ø¯Ø§ÙˆÙ„ Ø§Ù„Ù…Ø­ÙÙˆØ¸Ø©
--

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `annual_leaves`
--
ALTER TABLE `annual_leaves`
  ADD CONSTRAINT `annual_leaves_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `annual_leaves_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `appeals_cassations`
--
ALTER TABLE `appeals_cassations`
  ADD CONSTRAINT `appeals_cassations_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appeals_cassations_ibfk_2` FOREIGN KEY (`legal_period_id`) REFERENCES `legal_periods` (`id`) ON DELETE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `app_notifications`
--
ALTER TABLE `app_notifications`
  ADD CONSTRAINT `app_notifications_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `app_notifications_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `assets_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `asset_documents`
--
ALTER TABLE `asset_documents`
  ADD CONSTRAINT `asset_documents_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`),
  ADD CONSTRAINT `asset_documents_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD CONSTRAINT `fk_bank_branch` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `fk_bank_created_by` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `call_logs`
--
ALTER TABLE `call_logs`
  ADD CONSTRAINT `fk_call_created_by` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `cases`
--
ALTER TABLE `cases`
  ADD CONSTRAINT `cases_ibfk_11` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `cases_ibfk_12` FOREIGN KEY (`counterclaim_id`) REFERENCES `cases` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `cases_ibfk_13` FOREIGN KEY (`court_id`) REFERENCES `courts` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `cases_ibfk_14` FOREIGN KEY (`counter_case_id`) REFERENCES `cases` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `cases_ibfk_2` FOREIGN KEY (`police_station_id`) REFERENCES `police_stations` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `cases_ibfk_3` FOREIGN KEY (`public_prosecution_id`) REFERENCES `public_prosecutions` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `cases_ibfk_4` FOREIGN KEY (`lawyer_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `cases_ibfk_5` FOREIGN KEY (`secretary_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `cases_ibfk_6` FOREIGN KEY (`case_classification_id`) REFERENCES `case_classifications` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `cases_ibfk_7` FOREIGN KEY (`case_type_id`) REFERENCES `case_types` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `cases_ibfk_8` FOREIGN KEY (`legal_advisor_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `cases_ibfk_9` FOREIGN KEY (`legal_researcher_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `case_degrees`
--
ALTER TABLE `case_degrees`
  ADD CONSTRAINT `case_degrees_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `case_documents`
--
ALTER TABLE `case_documents`
  ADD CONSTRAINT `case_documents_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `case_documents_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `case_employees_documents`
--
ALTER TABLE `case_employees_documents`
  ADD CONSTRAINT `case_employees_documents_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `case_employees_documents_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `case_parties`
--
ALTER TABLE `case_parties`
  ADD CONSTRAINT `case_parties_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `case_parties_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `case_parties_ibfk_3` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `case_parties_documents`
--
ALTER TABLE `case_parties_documents`
  ADD CONSTRAINT `case_parties_documents_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `case_parties_documents_ibfk_3` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `case_parties_documents_ibfk_4` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `case_petitions`
--
ALTER TABLE `case_petitions`
  ADD CONSTRAINT `case_petitions_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `case_petition_documents`
--
ALTER TABLE `case_petition_documents`
  ADD CONSTRAINT `case_petition_documents_ibfk_1` FOREIGN KEY (`petition_id`) REFERENCES `case_petitions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `cash_transaction_attachments`
--
ALTER TABLE `cash_transaction_attachments`
  ADD CONSTRAINT `cash_transaction_attachments_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `employee_cash_transactions` (`id`) ON DELETE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `clients_deals`
--
ALTER TABLE `clients_deals`
  ADD CONSTRAINT `fk_client` FOREIGN KEY (`client_id`) REFERENCES `parties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `court_case_documents`
--
ALTER TABLE `court_case_documents`
  ADD CONSTRAINT `court_case_documents_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `court_case_documents_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `deal_documents`
--
ALTER TABLE `deal_documents`
  ADD CONSTRAINT `deal_documents_ibfk_1` FOREIGN KEY (`deal_id`) REFERENCES `clients_deals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deal_documents_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `deductions`
--
ALTER TABLE `deductions`
  ADD CONSTRAINT `deductions_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `deductions_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposits_ibfk_1` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `deposits_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`direct_manager_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `employees_ibfk_4` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `employee_attendance`
--
ALTER TABLE `employee_attendance`
  ADD CONSTRAINT `employee_attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_attendance_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `employee_cash_transactions`
--
ALTER TABLE `employee_cash_transactions`
  ADD CONSTRAINT `employee_cash_transactions_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `employee_cash_transactions_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `employee_cash_transactions_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `parties` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD CONSTRAINT `employee_documents_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_documents_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `employee_permissions`
--
ALTER TABLE `employee_permissions`
  ADD CONSTRAINT `employee_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_permissions_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `employee_requests`
--
ALTER TABLE `employee_requests`
  ADD CONSTRAINT `employee_requests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `employee_requests_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `event_attendance`
--
ALTER TABLE `event_attendance`
  ADD CONSTRAINT `event_attendance_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `event_attendance_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `executions`
--
ALTER TABLE `executions`
  ADD CONSTRAINT `executions_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `executions_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `executions_documents`
--
ALTER TABLE `executions_documents`
  ADD CONSTRAINT `executions_documents_ibfk_1` FOREIGN KEY (`execution_id`) REFERENCES `executions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `executions_documents_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `external_links`
--
ALTER TABLE `external_links`
  ADD CONSTRAINT `external_links_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `goaml`
--
ALTER TABLE `goaml`
  ADD CONSTRAINT `fk_goaml_created_by` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `parties` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `invoices_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_5` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_6` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `invoice_attachments`
--
ALTER TABLE `invoice_attachments`
  ADD CONSTRAINT `invoice_attachments_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `invoice_attachments_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `judicial_orders`
--
ALTER TABLE `judicial_orders`
  ADD CONSTRAINT `judicial_orders_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `judicial_orders_documents`
--
ALTER TABLE `judicial_orders_documents`
  ADD CONSTRAINT `judicial_orders_documents_ibfk_1` FOREIGN KEY (`judicial_order_id`) REFERENCES `judicial_orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `judicial_orders_documents_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `fk_meetings_employee` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`lawyer_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `meetings_ibfk_2` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `meetings_documents`
--
ALTER TABLE `meetings_documents`
  ADD CONSTRAINT `meetings_documents_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `meetings_documents_ibfk_2` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `meeting_attendance`
--
ALTER TABLE `meeting_attendance`
  ADD CONSTRAINT `meeting_attendance_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`),
  ADD CONSTRAINT `meeting_attendance_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `memos`
--
ALTER TABLE `memos`
  ADD CONSTRAINT `memos_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `memos_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `memo_documents`
--
ALTER TABLE `memo_documents`
  ADD CONSTRAINT `memo_documents_ibfk_1` FOREIGN KEY (`memo_id`) REFERENCES `memos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `memo_documents_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `other_leaves`
--
ALTER TABLE `other_leaves`
  ADD CONSTRAINT `other_leaves_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `other_leaves_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `parties`
--
ALTER TABLE `parties`
  ADD CONSTRAINT `parties_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `parties_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `parties_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `parties_documents`
--
ALTER TABLE `parties_documents`
  ADD CONSTRAINT `parties_documents_ibfk_1` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parties_documents_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `parties_forms`
--
ALTER TABLE `parties_forms`
  ADD CONSTRAINT `parties_forms_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `parties_orders`
--
ALTER TABLE `parties_orders`
  ADD CONSTRAINT `parties_orders_ibfk_1` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parties_orders_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `related_cases`
--
ALTER TABLE `related_cases`
  ADD CONSTRAINT `related_cases_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `related_cases_ibfk_2` FOREIGN KEY (`related_case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `review_documents`
--
ALTER TABLE `review_documents`
  ADD CONSTRAINT `review_documents_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_documents_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sessions_ibfk_legal_period` FOREIGN KEY (`legal_period_id`) REFERENCES `legal_periods` (`id`) ON DELETE SET NULL;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `session_documents`
--
ALTER TABLE `session_documents`
  ADD CONSTRAINT `session_documents_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `session_documents_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `sick_leaves`
--
ALTER TABLE `sick_leaves`
  ADD CONSTRAINT `sick_leaves_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `sick_leaves_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`assigned_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`) ON DELETE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `task_comments`
--
ALTER TABLE `task_comments`
  ADD CONSTRAINT `task_comments_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `task_comments_ibfk_2` FOREIGN KEY (`commented_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `task_documents`
--
ALTER TABLE `task_documents`
  ADD CONSTRAINT `task_documents_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `task_documents_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `trainings`
--
ALTER TABLE `trainings`
  ADD CONSTRAINT `trainings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trainings_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `training_documents`
--
ALTER TABLE `training_documents`
  ADD CONSTRAINT `training_documents_ibfk_1` FOREIGN KEY (`training_id`) REFERENCES `trainings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `training_documents_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `warnings`
--
ALTER TABLE `warnings`
  ADD CONSTRAINT `warnings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `warnings_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Ø§Ù„Ù‚ÙŠÙˆØ¯ Ù„Ù„Ø¬Ø¯ÙˆÙ„ `warning_documents`
--
ALTER TABLE `warning_documents`
  ADD CONSTRAINT `warning_documents_ibfk_1` FOREIGN KEY (`warning_id`) REFERENCES `warnings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warning_documents_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

