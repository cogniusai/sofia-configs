-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Mar 20, 2023 at 12:58 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sofia_structure`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `customer_type_id` int(11) DEFAULT NULL,
  `billing_type_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `partner_name` varchar(255) DEFAULT NULL,
  `billing_configure_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `company_id`, `email`, `address`, `state`, `city`, `country`, `zipcode`, `customer_type_id`, `billing_type_id`, `currency_id`, `partner_name`, `billing_configure_id`) VALUES
(1, NULL, 'admin@cognius.ai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `billing_configure`
--

CREATE TABLE `billing_configure` (
  `id` int(11) NOT NULL,
  `stt_name` varchar(255) DEFAULT NULL,
  `tts_name` varchar(255) DEFAULT NULL,
  `contact_center_name` varchar(255) DEFAULT NULL,
  `frontend_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing_type`
--

CREATE TABLE `billing_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing_type`
--

INSERT INTO `billing_type` (`id`, `name`, `description`) VALUES
(1, 'Subscription', 'Subscription + Transaction');

-- --------------------------------------------------------

--
-- Table structure for table `bot`
--

CREATE TABLE `bot` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unique_bot_id` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bot`
--

INSERT INTO `bot` (`id`, `name`, `unique_bot_id`, `status`, `user_id`, `account_id`) VALUES
(1, 'General Insurance', '6418498bf5d0691ca832870f', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bot_company`
--

CREATE TABLE `bot_company` (
  `bot_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `channel_type`
--

CREATE TABLE `channel_type` (
  `id` int(11) NOT NULL,
  `name` varchar(127) NOT NULL,
  `meta_code` varchar(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_type`
--

INSERT INTO `channel_type` (`id`, `name`, `meta_code`) VALUES
(1, 'TWILIO_TELEPHONY', 'TWILIO_TELEPHONY'),
(2, 'WEB', 'WEB'),
(3, 'WHATSAPP', 'WHATSAPP');

-- --------------------------------------------------------

--
-- Table structure for table `charging_type`
--

CREATE TABLE `charging_type` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `meta_code` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `charging_type`
--

INSERT INTO `charging_type` (`id`, `name`, `meta_code`) VALUES
(1, 'Per Transaction', 'per-transaction'),
(2, 'Per Session', 'per-session'),
(3, 'Per Day', 'per-day');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_widget`
--

CREATE TABLE `company_widget` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `context` longtext NOT NULL,
  `chart_type` varchar(100) NOT NULL,
  `bot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_center`
--

CREATE TABLE `contact_center` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `meta_code` varchar(128) NOT NULL,
  `form_fields` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `channel_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_center`
--

INSERT INTO `contact_center` (`id`, `name`, `meta_code`, `form_fields`, `channel_type_id`) VALUES
(1, 'FreshDesk', 'freshdesk', '{\"form_fields\":[{\"display_name\":\"API Token\",\"form_name\":\"api_token\",\"form_type\":\"text\"}]}', 2),
(4, 'No Contact Center', 'no-contact-center', '{}', 2),
(5, '4Sight', '4Sight', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cron_job`
--

CREATE TABLE `cron_job` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `command` varchar(1024) NOT NULL,
  `schedule` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cron_report`
--

CREATE TABLE `cron_report` (
  `id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `run_at` datetime NOT NULL,
  `run_time` double NOT NULL,
  `exit_code` int(11) NOT NULL,
  `output` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `currency_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `currency_code`) VALUES
(1, 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `customer_type`
--

CREATE TABLE `customer_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_type`
--

INSERT INTO `customer_type` (`id`, `name`, `description`) VALUES
(1, 'Undefined', 'Undefined'),
(2, 'Partner', 'Partner'),
(3, 'End-user', 'End-user'),
(4, 'Developer Community', 'Developer Community'),
(5, 'POC', 'POC');

-- --------------------------------------------------------

--
-- Table structure for table `deployment`
--

CREATE TABLE `deployment` (
  `id` int(11) NOT NULL,
  `channel_type_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deployment_id` varchar(128) DEFAULT NULL,
  `bot_id` varchar(128) NOT NULL,
  `secret` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `config` longtext NOT NULL COMMENT '(DC2Type:json)',
  `raw_config` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `generated_js` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deployment_type`
--

CREATE TABLE `deployment_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `transaction_type_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default_cost` double DEFAULT NULL,
  `additional_cost` double DEFAULT NULL,
  `max_transaction` int(11) NOT NULL,
  `tax` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deployment_type`
--

INSERT INTO `deployment_type` (`id`, `name`, `transaction_type_id`, `account_id`, `description`, `default_cost`, `additional_cost`, `max_transaction`, `tax`) VALUES
(1, 'Telephony', NULL, NULL, NULL, NULL, NULL, 0, NULL),
(2, 'Web', NULL, NULL, NULL, NULL, NULL, 0, NULL),
(3, 'Whatsapp', NULL, NULL, NULL, NULL, NULL, 0, NULL),
(4, 'Telephony', NULL, 1, NULL, NULL, NULL, 0, NULL),
(5, 'Web', NULL, 1, NULL, NULL, NULL, 0, NULL),
(6, 'Whatsapp', NULL, 1, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_validation`
--

CREATE TABLE `email_validation` (
  `id` int(11) NOT NULL,
  `email_token` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `created_date` datetime NOT NULL,
  `user_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `meta_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `name`, `meta_code`) VALUES
(1, 'Abkhazian', 'ab'),
(2, 'Afar', 'aa'),
(3, 'Afrikaans', 'af'),
(4, 'Albanian', 'sq'),
(5, 'Amharic', 'am'),
(6, 'Arabic', 'ar'),
(7, 'Armenian', 'hy'),
(8, 'Assamese', 'as'),
(9, 'Aymara', 'ay'),
(10, 'Azerbaijani', 'az'),
(11, 'Bashkir', 'ba'),
(12, 'Basque', 'eu'),
(13, 'Bengali (Bangla)', 'bn'),
(14, 'Bhutani', 'dz'),
(15, 'Bihari', 'bh'),
(16, 'Bislama', 'bi'),
(17, 'Breton', 'br'),
(18, 'Bulgarian', 'bg'),
(19, 'Burmese', 'my'),
(20, 'Byelorussian (Belarusian)', 'be'),
(21, 'Cambodian', 'km'),
(22, 'Catalan', 'ca'),
(23, 'Chinese (Simplified)', 'zh'),
(24, 'Chinese (Traditional)', 'zh'),
(25, 'Corsican', 'co'),
(26, 'Croatian', 'hr'),
(27, 'Czech', 'cs'),
(28, 'Danish', 'da'),
(29, 'Dutch', 'nl'),
(30, 'English', 'en'),
(31, 'Esperanto', 'eo'),
(32, 'Estonian', 'et'),
(33, 'Faeroese', 'fo'),
(34, 'Farsi', 'fa'),
(35, 'Fiji', 'fj'),
(36, 'Finnish', 'fi'),
(37, 'French', 'fr'),
(38, 'Frisian', 'fy'),
(39, 'Galician', 'gl'),
(40, 'Gaelic (Scottish)', 'gd'),
(41, 'Gaelic (Manx)', 'gv'),
(42, 'Georgian', 'ka'),
(43, 'German', 'de'),
(44, 'Greek', 'el'),
(45, 'Greenlandic', 'kl'),
(46, 'Guarani', 'gn'),
(47, 'Gujarati', 'gu'),
(48, 'Hausa', 'ha'),
(49, 'Hebrew', 'he'),
(50, 'Hindi', 'hi'),
(51, 'Hungarian', 'hu'),
(52, 'Icelandic', 'is'),
(53, 'Indonesian', 'id'),
(54, 'Interlingua', 'ia'),
(55, 'Interlingue', 'ie'),
(56, 'Inuktitut', 'iu'),
(57, 'Inupiak', 'ik'),
(58, 'Irish', 'ga'),
(59, 'Italian', 'it'),
(60, 'Japanese', 'ja'),
(61, 'Javanese', 'ja'),
(62, 'Kannada', 'kn'),
(63, 'Kashmiri', 'ks'),
(64, 'Kazakh', 'kk'),
(65, 'Kinyarwanda (Ruanda)', 'rw'),
(66, 'Kirghiz', 'ky'),
(67, 'Kirundi (Rundi)', 'rn'),
(68, 'Korean', 'ko'),
(69, 'Kurdish', 'ku'),
(70, 'Laothian', 'lo'),
(71, 'Latin', 'la'),
(72, 'Latvian (Lettish)', 'lv'),
(73, 'Limburgish ( Limburger)', 'li'),
(74, 'Lingala', 'ln'),
(75, 'Lithuanian', 'lt'),
(76, 'Macedonian', 'mk'),
(77, 'Malagasy', 'mg'),
(78, 'Malay', 'ms'),
(79, 'Malayalam', 'ml'),
(80, 'Maltese', 'mt'),
(81, 'Maori', 'mi'),
(82, 'Marathi', 'mr'),
(83, 'Moldavian', 'mo'),
(84, 'Mongolian', 'mn'),
(85, 'Nauru', 'na'),
(86, 'Nepali', 'ne'),
(87, 'Norwegian', 'no'),
(88, 'Occitan', 'oc'),
(89, 'Oriya', 'or'),
(90, 'Oromo (Afan, Galla)', 'om'),
(91, 'Pashto (Pushto)', 'ps'),
(92, 'Polish', 'pl'),
(93, 'Portuguese', 'pt'),
(94, 'Punjabi', 'pa'),
(95, 'Quechua', 'qu'),
(96, 'Rhaeto-Romance', 'rm'),
(97, 'Romanian', 'ro'),
(98, 'Russian', 'ru'),
(99, 'Samoan', 'sm'),
(100, 'Sangro', 'sg'),
(101, 'Sanskrit', 'sa'),
(102, 'Serbian', 'sr'),
(103, 'Serbo-Croatian', 'sh'),
(104, 'Sesotho', 'st'),
(105, 'Setswana', 'tn'),
(106, 'Shona', 'sn'),
(107, 'Sindhi', 'sd'),
(108, 'Sinhalese', 'si'),
(109, 'Siswati', 'ss'),
(110, 'Slovak', 'sk'),
(111, 'Slovenian', 'sl'),
(112, 'Somali', 'so'),
(113, 'Spanish', 'es'),
(114, 'Sundanese', 'su'),
(115, 'Swahili (Kiswahili)', 'sw'),
(116, 'Swedish', 'sv'),
(117, 'Tagalog', 'tl'),
(118, 'Tajik', 'tg'),
(119, 'Tamil', 'ta'),
(120, 'Tatar', 'tt'),
(121, 'Telugu', 'te'),
(122, 'Thai', 'th'),
(123, 'Tibetan', 'bo'),
(124, 'Tigrinya', 'ti'),
(125, 'Tonga', 'to'),
(126, 'Tsonga', 'ts'),
(127, 'Turkish', 'tr'),
(128, 'Turkmen', 'tk'),
(129, 'Twi', 'tw'),
(130, 'Uighur', 'ug'),
(131, 'Ukrainian', 'uk'),
(132, 'Urdu', 'ur'),
(133, 'Uzbek', 'uz'),
(134, 'Vietnamese', 'vi'),
(135, 'Volapük', 'vo'),
(136, 'Welsh', 'cy'),
(137, 'Wolof', 'wo'),
(138, 'Xhosa', 'xh'),
(139, 'Yiddish', 'yi'),
(140, 'Yoruba', 'yo'),
(141, 'Zulu', 'zu');

-- --------------------------------------------------------

--
-- Table structure for table `mlsetting`
--

CREATE TABLE `mlsetting` (
  `id` int(11) NOT NULL,
  `bot_id` int(11) NOT NULL,
  `primary_embedding_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `small_talk` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mlsetting`
--

INSERT INTO `mlsetting` (`id`, `bot_id`, `primary_embedding_id`, `language_id`, `small_talk`) VALUES
(1, 1, 1, 30, '');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_map`
--

CREATE TABLE `navigation_map` (
  `id` int(11) NOT NULL,
  `bot_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `node_data_array` longtext NOT NULL,
  `link_data_array` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `api_array` longtext NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navigation_map`
--

INSERT INTO `navigation_map` (`id`, `bot_id`, `user_id`, `node_data_array`, `link_data_array`, `created_at`, `api_array`, `updated_at`) VALUES
(1, 1, 1, '[{\"key\":\"68716013-9b7e-492d-ac14-a724a65b204T\",\"type\":\"s\",\"panelShape\":\"Circle\",\"panelBgColor\":\"#f16423\",\"panelWidth\":45,\"panelHeight\":45,\"name\":\"\",\"icon\":\"Circle\",\"iconStroke\":\"null\",\"mainBackground\":\"null\",\"width\":0,\"height\":0,\"loc\":\"139.49999999999983 -1072.9999999999995\",\"topArray\":[],\"bottomArray\":[{\"portColor\":\"#6cafdb\",\"portId\":\"START\",\"portTextColor\":\"#fff\"}]},{\"key\":\"64184a30f5d0691ca8328710\",\"type\":\"is\",\"panelShape\":\"Rectangle\",\"panelWidth\":230,\"deletable\":true,\"panelBgColor\":\"#fff\",\"name\":\"Understanding the user\",\"icon\":\"Rectangle\",\"iconStroke\":\"#ffffff\",\"mainBackground\":\"#ffffff\",\"width\":230,\"height\":40,\"configData\":[{\"title\":\"Name\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"text_field\",\"section_id\":\"7de3a802-8ca0-4e23-a1db-b89a8e5721d0\",\"meta_code\":\"block_name\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"5d261f73-19f5-46ab-9b25-70f38351cf0d\"},\"data\":[{\"default\":\"\",\"value\":\"Understanding the user\"}]}]},{\"title\":\"Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add Response\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"initial_questions\",\"section_id\":\"36b4b5ac-9014-4cf1-a8bb-cfbcc21a137f\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"b4252dba-69f3-4cac-9e7f-26a768bbd1b6\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"0lahuMRCII1uTGziKbFcPtAP83NEfnpvgaOK\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"<meta data_name=\\\"try_again\\\" data_value=\\\"_\\\" \\/>\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"bc74b408-92ca-4d8b-9e10-c50cb1b44343\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"bL7B9hfGEYGhVv31r6Wc1FmZJPjSCsTNOvWw\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":true,\"display_checkbox\":false,\"checkbox_value\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"C5kW2MIWrZ74byteNwlrRiz03SshYe6oL66Y\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"<meta data_name=\\\"quote_proceed\\\" data_value=\\\"_\\\" \\/>\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"bL7B9hfGEYGhVv31r6Wc1FmZJPjSCsTNOvWw\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Processing Pipeline\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"intent_level\",\"section_id\":\"e7ce0434-9b88-46af-a314-dd2bdf35f31d\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"1ab87c32-4826-4745-aee2-7b7726786ab5\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_1_training\",\"element_id\":\"ae1540fe-acce-4de4-ae4c-80b4455641bd\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Change Topic\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"5f6d8689-7758-42ec-a0a0-e2f15ab0f3e5\",\"default\":\"\",\"value\":\"TCH Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"5a74aba0-206c-4827-a315-5e4f50dca62d\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"4700ff64-4250-4709-a04b-454e0a5b2cf6\",\"default\":\"\",\"value\":\"TCH Classification Direction (Enable to include)\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"9cf36204-d234-441e-a279-327a871615a5\",\"default\":\"\",\"value\":\"Detect Exit Conditions\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_3_training\",\"element_id\":\"127912e1-aa4c-4f59-9b3d-fb67cc05cf67\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Meta Actions\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"meta_code\":\"intent_level_3_training_rephrase_request_boolean\",\"element_id\":\"f34d81de-8f6d-4e30-811b-1cba933105dd\",\"default\":\"\",\"value\":\"Rephrase Training Data\",\"can_be_deleted\":false,\"help_text\":\"some help text about this element\"},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_3_training_rephrase_request_data\",\"element_id\":\"ce470a28-6f89-43af-8c19-1e3534f07ec9\",\"default\":\"Custom Data\",\"value\":\"Rephrase Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"aed7af06-4aae-4a00-a72c-680e359ea5ae\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"meta_code\":\"intent_level_3_training_change_request_boolean\",\"element_id\":\"4f782f06-d05c-4c1e-b731-2f446c6dc0b9\",\"default\":\"\",\"value\":\"Recorrection Training Data\",\"can_be_deleted\":false,\"help_text\":\"some help text about this element\"},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_3_training_change_request_data\",\"element_id\":\"1342ebc1-8544-4222-9ee1-6df2b2306f3f\",\"default\":\"Custom Data\",\"value\":\"Recorrection Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"c16f3888-a05f-41d8-b3d6-699e78e61487\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"e49d9313-df45-4c33-9c74-f7d61ef0bd3d\",\"default\":\"\",\"value\":\"Classification Direction\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"\"}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"460cfa80-5bb2-4cf3-a1e0-f0d8c5658029\",\"default\":\"\",\"value\":\"Self Correction Training data\",\"can_be_deleted\":false,\"help_text\":\"some help text about this element\"},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_nlu\",\"element_id\":\"1fd69e06-eb04-4f61-bcdf-b52aadc2b458\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"NLU\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"1217eb6a-57eb-45a0-96e0-0b4cf68f739e\",\"default\":\"\",\"value\":\"Combine\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"false\"}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_2_training\",\"element_id\":\"054522a5-2b82-4ca2-aef3-968f3d7b2df9\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Fact Base\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_area\",\"meta_code\":\"intent_level_2_knowledge_base\",\"element_id\":\"5ce6843d-f734-41dd-af7c-154c4b9381eb\",\"default\":\"\",\"value\":\"Fact Based Passage\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"Limited Damage Coverage can help you with accidental damages to service pipes and cables, glass in your windows and sanitary fittings. Standard Damage Coverage includes all the benefits of the Limited coverage plus accidental damage for the rest of the building. Also, the Standard Damage Coverage covers damages caused by any paying guests. Standard Coverage is $175 and Limited Coverage is $75.\\n\\nUnder Legal Coverage we can give you expert legal support for cases like, employment issues, Property related disputes, consumer disputes, And medical negligence, If necessary, we can fund you up to $100,000 to pursue a case in court. It will only cost $30 per year.\\n\\nWhen things go wrong, Emergency Coverage is there to help put them right. The coverage includes things like blockage of drains and toilets, leaking roofs, gas or electricity failure, and broken pipes. It will only cost $75.\\n\\nThere are no additional covers or configurations available other than the above.\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_2_training_gate\",\"element_id\":\"11fb0ae5-1d24-4af2-a7d0-412d188dff39\",\"default\":\"\",\"value\":\"Fact Based Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"153878c5-cc0d-46de-bff8-61c6fc0b17ef\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]}]}]},{\"title\":\"NLU\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"cta_types\":[\"synonym\",\"regex\",\"intent\",\"date\",\"name\",\"email\",\"phone\",\"any\",\"yes\\/no\",\"city\",\"country\",\"duration\",\"zip code\",\"age\",\"currency\",\"numeric\",\"void\"],\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"field_fillers\",\"section_id\":\"53606015-7adb-49ba-bd05-fb4df4afe965\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"07886032-8a1c-4037-b3b1-a64b5fdc8a61\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"element_id\":\"vYY6vEWfXm5atT3Pq45swJa2vaIpmEwnx9zQ\",\"ui_state\":\"view\",\"can_be_deleted\":true,\"default\":\"\",\"value\":\"damage coverage\"},\"data\":[{\"ui_metadata\":{\"type\":\"dropdown\",\"meta_code\":\"nlu_type\",\"element_id\":\"svWiiJElTGIZa8ON3XgIn7M9H1TuBpYueqAe\",\"value\":\"Type\",\"values\":[\"Date\",\"something\",\"another\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":\"intent\",\"value\":\"intent\"}]},{\"ui_metadata\":{\"type\":\"text_field\",\"meta_code\":\"field_meta\",\"draggable\":\"false\",\"element_id\":\"jdmxBb9Z43AXnhweVPTfcWy22NGlX2WKF2XI\",\"cta_label\":\"\",\"cta_presence\":\"false\"},\"title\":\"Slot Name\",\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"5FPOIvbx8aailwMi5t8YpGXAIPGc2ucEQMqf\"},\"data\":[{\"default\":\"\",\"value\":\"damage_coverage\"}]}]},{\"ui_metadata\":{\"title\":\"Questions\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"question_list\",\"value\":\"Question Set\",\"section_id\":\"lEMiVUXgOcZT0seQPGIuh8oURCErwhTjW463\",\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"2WaZTEmYYUVz6zZcaFNY8e898UP8xIlnhJt4\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"pILBFj3VjYM1hXuYN5FUr26CnWFWiUXlYd0z\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Lets start with damage coverage.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"xniV2IPALa4a37OLZRXaC3eenk7p8qdu7aSM\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Let me start with damage cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"g6fAnRLEZ5JGxs1fXlTRYZekKfve5iuwcqul\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your question here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"iL8q21vESn7F2OdkdxvmrfmFm3d15MVEFKkD\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":true,\"pagination\":true,\"download\":false,\"upload\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"pwlqMmwbvzEscQFdNWt4D93ddsi9lVfGWzeX\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Would you like to go for the Limited Damage Coverage or the Standard Damage Coverage?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"iL8q21vESn7F2OdkdxvmrfmFm3d15MVEFKkD\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"tZU5YQxGruColfPeXdQqkw0QEYPoPZPLZVG1\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":true,\"pagination\":true,\"download\":false,\"upload\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"1iuQoErgolFpammnGNM9ivIWggIpkJUozbpL\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"<stt mode=\\\"default\\\"> <hint>limited<\\/hint><hint>limited cover<\\/hint><hint>standard<\\/hint><hint>standard cover<\\/hint><hint>first option<\\/hint><hint>second cover<\\/hint><\\/stt>\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"tZU5YQxGruColfPeXdQqkw0QEYPoPZPLZVG1\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Connecting Phrases\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"connecting_phrases\",\"value\":\"Connecting Phrase Set\",\"section_id\":\"FgTxqSbdulHsilPHciJmc6VKHNlyxeAPZTMt\",\"section_enabled\":true,\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"HW1M3CXLGMojfLegUbNyO4LfSRFWItisDzqm\",\"default\":\"\",\"value\":\"Connecting Phrase Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"2RTG0FvEgYUqYDx8ilkCD9Q41P6zAKvCMEBU\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Now, what would you like to select from Limited Damage Coverage and Standard Damage Coverage?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"8GDsy0Bxr4RN0wBoDrbrddUJ2IK7tRZqwZGV\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"So, would you like to choose Limited Damage Coverage or Standard Damage Coverage?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ACITGCz8M8hX6nnxaMlNFSnAoC3UsyEqKRf8\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your connecting phrase here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"kRLW1J1rjhd31uDWLpYRioee7cmfeGPGKO5P\",\"default\":\"\",\"value\":\"Connecting Phrase Set\",\"can_be_deleted\":true,\"pagination\":true,\"download\":false,\"upload\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"opovqmabkrteEixpZPkZvaV54JqpspHUxBPy\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"<stt mode=\\\"default\\\"> <hint>limited:4.0<\\/hint><hint>limited cover<\\/hint><hint>standard<\\/hint><hint>standard cover<\\/hint><hint>first option<\\/hint><hint>second cover<\\/hint><\\/stt>\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"kRLW1J1rjhd31uDWLpYRioee7cmfeGPGKO5P\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Followup\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"followup\",\"value\":\"Followup Question Set\",\"section_id\":\"RB46tB8OqQ9r38rtaBVYZYoetjw6hexSiFOU\",\"section_enabled\":false,\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"O4mww44NPPSuVMkbJjhWwrOyWghBeW7R1gJu\",\"default\":\"\",\"value\":\"Followup Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"FsRcjzPkykVlAe738msG2cCzjyWoDcr7vzP7\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Could you please say that again?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"txigjjv0cWZi8ENqAantOPAox98a6m8bfWn2\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I\'m not sure what you meant. Could you please try again?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ajS5vOGerII1wo0DVHDeDxwKMIRYEbw4x1I2\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Sorry, I didn\'t get that. Can you say that again?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"EOTBvRYPlpdBO8nWrc8M1s8AUoo2Bf8sTknU\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your followup here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"bIOtGLv07HIpgAswJp3x86qSMTmHMUuzwnUC\",\"default\":\"\",\"value\":\"Followup Question Set\",\"can_be_deleted\":true,\"pagination\":true,\"download\":false,\"upload\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"sF1gA3mcFNLNC3vzRwP75v3CXo31ViCXQNH4\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"<stt mode=\\\"default\\\"> <hint>limited<\\/hint><hint>limited cover<\\/hint><hint>standard<\\/hint><hint>standard cover<\\/hint><hint>first option<\\/hint><hint>second cover<\\/hint><\\/stt>\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"bIOtGLv07HIpgAswJp3x86qSMTmHMUuzwnUC\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Required\",\"default\":\"\",\"type\":\"boolean_flag\",\"meta_code\":\"required\",\"element_id\":\"LGke3b2X1m4cGg8qbBNk7sdipN2cjTpM63Cl\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":\"false\"}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Auto Rephrase\",\"default\":\"\",\"type\":\"boolean_flag\",\"element_id\":\"lnOw0aPkdnH24Xkl5WV8ADFF1Pu6pSyixn5X\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":false}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"default\":\"\",\"type\":\"multi_string\",\"value\":\"Identification Tags\",\"meta_code\":\"identification_tags\",\"element_id\":\"EQ7O7I1WbnOfgG2qddDRaxE4pt1b6xkB9r9S\",\"ui_state\":\"new\"},\"data\":[{\"default\":[],\"value\":[[\"damage cover\",\"limited cover\",\"standard cover\"]]}]},{\"ui_metadata\":{\"title\":\"Intents\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"optional_config\",\"meta_sub\":\"intent\",\"value\":\"Intent Set\",\"update_status\":\"FALSE\",\"editable\":true,\"section_id\":\"6DqOvW9Cq6zt87bARRBUKr0FHGDvXNZP8dr1\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"XgVIwxVqLZMJeebomFVe3x2n8dfM6QIq1RiZ\",\"default\":\"\",\"value\":\"standard damage cover\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"dE57PdfQmI6Belhz2LXUGVWCUkHQ7tlfi0Jy\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"standard cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"aMHg07gW1b3pN6u3L4FefZVgDfJ8SCfhbGMv\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"standard coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Y0dXcuvJSTXaHg7mj2bhdxv7QxqhBgUAU2lo\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i like standard coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"g7RYi6bdhkkPRu14DcDg45MTo1zrGUzVsWEE\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i would go for standard coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"aXFwSxgVuQAjgztY9PkJ3Bq97a4n8CDbC4ua\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i will select standard coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"rDSzT8satPlIK429RdVFwsneFIVyKssiBT8L\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i would be going for standard coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"QCVrmkkHwpgkUSbZAghlyqDDA7qRPJWg2sEn\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i think standard coverage will be good for me\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"nfkkP8nGn72S0EfJsqqsgNO5jmT3qeLjzSHC\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i prefer to choose standard coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"fL1xStMw59tTmJOOaZ6Oq628fs6ydCyfOA40\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i guess i will go for standard package\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"TU9Z208BH1Gjf2OuclsGrMrEQbMFw8RfKnsO\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"standard package will be the best choice for me\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"kqdPutCtfMBBXVYDUBKKalsy5LcJvZWPhNra\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"first option\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Vb6ALpdzIWAdknc44Kz8YyqgSrWCOIZ0TZzf\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i would go for the option one\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"pNDkp4NYbX0RgbKL026YUyoyTNxGVHoebhBG\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I will select option 1\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"KnwLvh1j8BvEx0r7Nxj7b8z0l6stk1fAbJBZ\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"great\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"tVNJFPptCwRsGp45dnBsBwvj0xa1pZEVAsBG\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no problem\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"i20NOcuFEpQxJ5ECU7j152I23DxEdDleCgy8\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"M8RKlqybI1sIksuzXe0BT0ep88rEi575tNKM\",\"default\":\"\",\"value\":\"limited damage cover\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"GX6vPoQTxORsWgu8Ht1Mb0t90uturnKkhReD\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"limited cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ztxVyfts18gSoUzO7euZusaAw2chMwCrTgHH\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"limited coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"b5iWAHFowDyss27IGVPk86YyueI96kugLPGO\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i like limited coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"36eEFjR3j23JlkWdzCNOGPObSNBR4s7rm1EX\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i would go for limited coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"KWJ2aa4ZXPV1jFXwMcLBWFHwmBHtVAcjYQrb\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i will select limited coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"t3dRUH2dNsSXAIi6FMUTjcAOdMNdWz9m3Mmj\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i would be going for standard coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"D2IxYHAkIwnt690wosaZxdD4yea0itlLV3VA\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i think limited coverage will be good for me\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"fOq8AObYBL7Y90dS73Mec25vl1IVIhTyWHSI\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i prefer to choose limited coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"pMTnDm8iumhgn6cHX2M0AJ7SGbaKmbMCFcuJ\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i guess i will go for limited package\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"0nV3YjnRj4wdiTaMjnplPXFcCTluNTrvvOzx\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i will select the limited coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"M6QrRhlDWXYWX9AhCD6xP8AEgFDIZPF1Tlmd\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"option second\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"xO6hgebhHNZfIfyYoFkKh8hfnSihwyfZ6mjp\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"option 2\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"7sLld3VbM4Udan4UI7hNefRF5rb8JGyRGVHx\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"second option\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"QFg3gMdRPziEYWkhM9KqiPOSKmhUHwclVIWN\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i am selecting the second option\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ayTx57WHzZj8ioKRD8bd92PvQer1q7dDBgc7\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i am selecting the limited coverage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"aRgnWbNLyZWCv8kazVp2slg1rfMiv0T665AF\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"element_id\":\"5AhwuakChytU2nzpmblufPIWgUuBqjWeOAE9\",\"ui_state\":\"view\",\"can_be_deleted\":true,\"default\":\"\",\"value\":\"legal services\"},\"data\":[{\"ui_metadata\":{\"type\":\"dropdown\",\"meta_code\":\"nlu_type\",\"element_id\":\"zEGG4LR1EHShA8WuFpGeZNkWl9zsi3Oy6X9u\",\"value\":\"Type\",\"values\":[\"Date\",\"something\",\"another\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":\"intent\",\"value\":\"intent\"}]},{\"ui_metadata\":{\"type\":\"text_field\",\"meta_code\":\"field_meta\",\"draggable\":\"false\",\"element_id\":\"yokEmfh9vhtDc1afp3Agm1UnQINenuMwMiNs\",\"cta_label\":\"\",\"cta_presence\":\"false\"},\"title\":\"Slot Name\",\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"XEEzGHLDslMzvqYxBuolQfVOCqsDewNrLo4S\"},\"data\":[{\"default\":\"\",\"value\":\"legal_services\"}]}]},{\"ui_metadata\":{\"title\":\"Questions\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"question_list\",\"value\":\"Question Set\",\"section_id\":\"ST5k5HQoiz6ZmyNLyUtfPQ7r4f32Oj7qOaiL\",\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"hXF13nTdRDef8qJQZnJVHwIIJWlqApwsWPzn\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"eTeohc7SG22LzEHXaxV1a2MNfY8Ks71fbrgd\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Ok. You have selected the [[damage_coverage]] .\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"uWcY8jimOkjOk6qiEoRbgjr9TAdm9UZqahon\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your question here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"kncjzoPbmz77qzjZtOlRfvaWaFb3xf8BLe56\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":true,\"pagination\":true,\"download\":false,\"upload\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"xe6rCXmm8bVNmcbNm85Ta2fpscPzA3xxdZVN\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Next, let me know if you are interested in  having a coverage for legal services.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"kncjzoPbmz77qzjZtOlRfvaWaFb3xf8BLe56\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"p8RIlwwB5Lotc8PeUVkzJ8RN18wKZbeu89Yf\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":true,\"pagination\":true,\"download\":false,\"upload\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Rrn6SxzeHG0Uu3OCxtVoUIgW8npFkHFKFaMG\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"It will only cost you $30 per annum.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"p8RIlwwB5Lotc8PeUVkzJ8RN18wKZbeu89Yf\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"X94W1bZu2uJ0xL7Tx2PfWzXcURDVbn1lsKa3\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":true,\"pagination\":true,\"download\":false,\"upload\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"NeSNx1RVAoRgFcKPcolwK1pp89BaWvxTI9Ny\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"<meta tags=\\\"[[damage_coverage]]\\\" \\/>\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"X94W1bZu2uJ0xL7Tx2PfWzXcURDVbn1lsKa3\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Connecting Phrases\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"connecting_phrases\",\"value\":\"Connecting Phrase Set\",\"section_id\":\"Mw82y2e5ycCj3Y5R3vMr0kL2UyyiXy34byeK\",\"section_enabled\":true,\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"R9eK6YL6CuCNuhzGUgUcTBllLtROINtlFD8u\",\"default\":\"\",\"value\":\"Connecting Phrase Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"7spBmxngMuKijRLR0goBZRpQbZtMo2hohGai\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Now, do you want me to include legal service coverage for $30?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"HY6ATyKRj78seeRu7SoLCmjUYkfLBTyqyoHy\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"So, would you like to have our legal service coverage for just $30?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"6c6tHRQ8Pu8kPzJpPfaCS8gaE0urx5MrRU8v\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your connecting phrase here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Followup\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"followup\",\"value\":\"Followup Question Set\",\"section_id\":\"0leNgaXogBAvo6gws496phOfONyWNhTg8WTc\",\"section_enabled\":\"false\",\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"umTiEvvSA753P9RYhA3fnQxOhPPiHG76rgvU\",\"default\":\"\",\"value\":\"Followup Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"PzEQHPEkgDYSafUHose8lzlzGJxkOrG97jUo\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I\'m sorry. Could you please say that again?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"gkwFmbd2I6vJhzZrL0a4gCJDlTy0sKD8bPnl\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Sorry, I didn\'t get it. Can you try again?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"9rYmlfYYMeOY7FwOMT0BVHBzBHMNzjNOYYxe\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your followup here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Required\",\"default\":\"\",\"type\":\"boolean_flag\",\"meta_code\":\"required\",\"element_id\":\"4am5mpGhxXXQjdNfa4H9XR3quOgObR10cpiO\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":\"false\"}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Auto Rephrase\",\"default\":\"\",\"type\":\"boolean_flag\",\"element_id\":\"6RFJHwUdG9cqbSge7DfleFRcpUqCeRyoIFJG\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":false}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"default\":\"\",\"type\":\"multi_string\",\"value\":\"Identification Tags\",\"meta_code\":\"identification_tags\",\"element_id\":\"JFRTIvIr6HJcLcZ4zSAQa9IZtMKO42wFrT1X\",\"ui_state\":\"new\"},\"data\":[{\"default\":[],\"value\":[[\"legal cover\"]]}]},{\"ui_metadata\":{\"title\":\"Intents\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"optional_config\",\"meta_sub\":\"intent\",\"value\":\"Intent Set\",\"update_status\":\"FALSE\",\"editable\":true,\"section_id\":\"6ZdAvFzJmFyevbzLeZ7MNlNCSHoEoZTHcGFA\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"dsCvLwYkXkSrsgpifvA2oNi3YwP1vxL6i4kp\",\"default\":\"\",\"value\":\"legal_cover_yes\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ZVOy2yU0nrl4XK9Ag0Y8nnFQovOKx4n5sahs\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"yes\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"6jVE3K2mNBHIugD75CTAhwWs3LLlneQAOrqf\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"sure\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"rwcV9ACDJkoOPRn0VU7lhPpi2euTAmfyeD1O\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I will go for that\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"uVlnBgEvPP5HVUPomWn6I56jajOvALl24DoW\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I will select the legal cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"daH6TlUUzD9Na3XNe6CylA5P6acq6xRnP8ES\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no problem\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"WdKdVmkoPXlEEOns8qs6o10CKXAZQA70Ncjj\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"you can it\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"wZXjTiN6c5ta0nJgWHbSLdyjTroGzaCprixq\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"cool\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"r7heENSiTKK2EXNWDWgKb3qeqQ5JR4vg0sZ8\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"of course i would consider\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"cETMkbkapaGf2BaZTkoy11hoUutKkef51JRU\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"That\'s not much so let\'s go for it\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"bQpAndcnswkkqvcC2aWL6J1sFMBpdAVIP8A2\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"That seems to be cheap so I can go for that\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"D5jw9A74nxEphYCh3S9oxnewjhnmx8RymA86\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"yes i want to add a legal cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"705pziuWlxAyXtnR3nOKQD5BLHZBLbfgHseB\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"absolutely\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"2P4XwvNeuQTYQHYOqbR5EnzwgimlEqTkLHiy\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"that\'s seems to be ok\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Y8yFZKRP9g8X9XSXsgcttuBdJX9Xdb2feI5p\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"yes I want to select the legal cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"u4EXmkVTw75D6Jv9ds11SAQCoSE7uaTb7Dpb\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"should be fine\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ESG89uMHxXtQPZNKttXh9FtX7MFOO3bsQLHO\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no problem I will select\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"6TOyTp3trCg2sQzreoK4uyoqgHhmtKlhy6RO\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"great\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"47WpRGluQ40nha7YHDKaJkICKgAfV4UAF5Kw\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"include it\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"4LcsBf4ofXiEVHPo1mvpS9sChMZRSqsuNxwF\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"you can include that\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"tzooV84mAhrJMZoepsffPt4xhrNMfRd2ERm0\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"include legal cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"cgRSt3VqEnL0qgUoENfQrT7ZOU8MNyWJKk56\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"ok\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ncipk4Wv84uHUS9tmgTtIVbfjDLCZqKgKr07\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i think it is a good idea to have one\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ThVTLHM3daswQDe9mUSeUR5tJqDS2CoCVdAn\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"dIemldxOsAdhLp8pUmUmyC5DvJCmYmfqgvMj\",\"default\":\"\",\"value\":\"legal_cover_no\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"2yMOBQSfJRDWl0mq4ZUUrF63rBMSdSRl1dgQ\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no \"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"sUoJ3xII3XCmGP7rPN0nWoiaekUP4QFJ8GRP\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"nope\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ppdElyX7D4VfWsks1CfesyAAvKp6hDdqTMj0\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I don\'t want\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"xi4pXf8nl6XDtHR4TiqKewX2adFVTG9vPHv6\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"not now\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"K5uQDENukalfUxNMmUXn7vJueP0iBTVuOBah\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"that\'s expensive\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"rlUFkC3p2OHyafQu4Qym9HKNJLh8GVowXMGR\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"skip\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"bI2AincsJBJqAHbMjuDrYqBjZvtWg1Iz7bu0\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"not necessary\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"whnc8WMlVq7q59HtkhuHNbRt5QdMjvTTCh4i\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no i don\'t think so\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"P5RdB2f8no1AN8rJut3cPySWicdY7a0nBe3o\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i am not willing to have any legal cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"nijrHLpxqaG1VLuOZADRd2Sjx9kgKiYHV5QU\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"that seems to be very expensive\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"lJnawblr0gobQsFbiF8RlHjRTGEwVPjM5pP3\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i will not get the legal cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Ge4nWmS3Zz9iRaE1Lw9W897FxUNEXaApHRVr\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"don\'t include it\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"knqGYcqmxtUqrtINg0AmRjA4ZUQYFrAzFTTz\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"don\'t include the legal cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"FNt4jI4u8Jk00R4St6neRjjTgfcChk3SlzT2\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"not ok\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"y3XZtYqWmkeOknIKHzxpnRjqbkpiJtSXpmfW\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i think i don\'t want one\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"bFv6psu0YhfG6XlG7KqAnky5QGnYZfzs86Rd\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"not interested in\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"nQGdq6zOiZfUck6fMDI9GgHUXs8xYh7DJ1ks\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i don\'t want the legal cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"SUCk9tLIvPAKsbeelueCHqDxFth5QNTH4qou\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no need\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"PSdyIyhfvIEpK5hi6pm3hZ1In6JAiXUpe3X8\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"legal cover sucks\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"gya7olqyC4PgmLRFKjRDFS60ULCGaWT5i4ae\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"not required\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"a3NNWrEegnL0dyyw5x5SkopUqWzya1SkqcdO\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"element_id\":\"sIGkoKyfHmIdlqIFzrFy01sOtXpGfco1Kz1x\",\"ui_state\":\"view\",\"can_be_deleted\":true,\"default\":\"\",\"value\":\"emergency cover\"},\"data\":[{\"ui_metadata\":{\"type\":\"dropdown\",\"meta_code\":\"nlu_type\",\"element_id\":\"ol7K4GzvbNmpHhyIvVNikpm8g8Y2VgqK2Caa\",\"value\":\"Type\",\"values\":[\"Date\",\"something\",\"another\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":\"intent\",\"value\":\"intent\"}]},{\"ui_metadata\":{\"type\":\"text_field\",\"meta_code\":\"field_meta\",\"draggable\":\"false\",\"element_id\":\"kP3yNiZ9NWp0nk3XI9z8ggboWJWz6Fk4vsBM\",\"cta_label\":\"\",\"cta_presence\":\"false\"},\"title\":\"Slot Name\",\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"qSATqamOPYo8NwHAS9O1IhYS0wTakKa1DEyq\"},\"data\":[{\"default\":\"\",\"value\":\"emergency_cover\"}]}]},{\"ui_metadata\":{\"title\":\"Questions\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"question_list\",\"value\":\"Question Set\",\"section_id\":\"7mLRVFBDAuoXGTalNDz3TcwFKzNtfQew8lnJ\",\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"BvBbNI6e68PMuX5OFQ02Q73KmqeiamVodVID\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"gwOn0iNMLn2yuWNCJF3ZpAhpEmySsQOhErcP\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Would you like to consider our home emergency cover for $75 per year?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Q6aNPytInle1vts0wHJZ9xpoZIlVySz2rjBR\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your question here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"6PNgM7dcMrNNUPiLGNqgyurCybGmF39a5zKt\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":true,\"pagination\":true,\"download\":false,\"upload\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Yxg5WuU1kAG3ROEEfpacdrNI83gThP9ialyA\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"This will cover all your home emergencies including leaking roof, blocked drains, etc.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"6PNgM7dcMrNNUPiLGNqgyurCybGmF39a5zKt\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Connecting Phrases\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"connecting_phrases\",\"value\":\"Connecting Phrase Set\",\"section_id\":\"kZATc1dsSNFQtq90L0gzqe6iYYcoSAfSJ3kg\",\"section_enabled\":true,\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"AZ00giPlsPVQRBNEkHiocIldti0NHypnv508\",\"default\":\"\",\"value\":\"Connecting Phrase Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"CgUz4wVIoERJEizOEoLCmsgBv0sWybCAc1CR\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"So, do you want me to add our home emergencies cover for $75?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"FrGGySPy3mZWpWCSWsPDrAik9n3tHDCnSQsS\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Do you want me to add our $75 home insurance cover to this quote?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ukHJkNcbVLHHbVEYwC2E9ucR4izRNbg2kNw0\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your connecting phrase here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Followup\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"followup\",\"value\":\"Followup Question Set\",\"section_id\":\"guabZcAL8GV2LgyR3KuhtNrkD9ssdC0Bi603\",\"section_enabled\":\"false\",\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"IDuJxfkBzS09938EGHqS5GLsJgMI8Xhm6sRk\",\"default\":\"\",\"value\":\"Followup Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"M4itsSiInAGHeWpzCocjbxDadRHQfHhHsx1J\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Sorry, I didn\'t get it. Can you try again?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"rb7zNupxJZFkcqsXJcv0FxMOispLNWZbIU4l\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I\'m sorry. Could you please say that again?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"mwDBJJLdSbNWuUn8nTkySv4NlbMLLI7MnqXK\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your followup here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Required\",\"default\":\"\",\"type\":\"boolean_flag\",\"meta_code\":\"required\",\"element_id\":\"QbQaxzh4pk4I02PKidqbFEEkQ5JJ7M3D5StB\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":\"false\"}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Auto Rephrase\",\"default\":\"\",\"type\":\"boolean_flag\",\"element_id\":\"GKQjFiXUpGy8BXnPnpJ0MzDLVCIW8xkNhjz7\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":false}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"default\":\"\",\"type\":\"multi_string\",\"value\":\"Identification Tags\",\"meta_code\":\"identification_tags\",\"element_id\":\"MSIh1dFNZUSwszxd07bOnfTOFn77oqdI2R4Y\",\"ui_state\":\"new\"},\"data\":[{\"default\":[],\"value\":[[\"emergency cover\"]]}]},{\"ui_metadata\":{\"title\":\"Intents\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"optional_config\",\"meta_sub\":\"intent\",\"value\":\"Intent Set\",\"update_status\":\"FALSE\",\"editable\":true,\"section_id\":\"Y4mfwAXTjN3OqeMubigXGpqMmeKtqZ6MYKnr\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"faZdxKUJ6xCu32ShgAoJw03b2BcR1dUVmUZP\",\"default\":\"\",\"value\":\"emergency_cover_yes\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"Ocgsh0zUffVG5n1uWkr3vkWZOWCzdmkuwQJt\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"yes\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"DQT4xtfx73txLUl9jZX1qXEcNdjiavKiU9eG\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rsure\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"uj25p3vsO0s11WqB6b754sxhHM5xQFdPNw1d\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rI will go for that\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"G7PfeiTpliCQzbgohbxWToi4yyw6jSPASfCi\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rI will select the emergency cover\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"MEgEE7WVkEJxizpKqbWwLiOUfbUBkNAZndgU\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rno problem\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"TLm4ZDBrxLLtvhUC3YEnb9GxEJo1N1LdSJNC\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\ryou can it\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"3VXfnIV6LUxTOHT0wgotK8mV8JmhSt7X1hlU\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rcool\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"2fhfybikL7f02pZZGX5ib37F8T5PnhGEsm9s\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rof course i would consider\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"Ioi5TnZr5ZgA7uyybkYFojEU16hMRfSRCVjr\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rThat\'s not much so let\'s go for it\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"sFC424VJmUv9pobbNcuzCmnvcDcGOnTtnMlF\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rThat seems to be cheap so I can go for that\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"4jlUhe9X2ayWAKrVYEkZdtSGPwZWWx3vszxE\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\ryes i want to add a emergency cover\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"E8AGw80akYO64eq55mT7svFynl7DRt6zaha5\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rabsolutely\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"KDvMOwrVA1MRdyAINdIPnhNrgvGOrugd8mrf\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rthat\'s seems to be ok\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"mH882xeOKydSxa81GlHX2meTsuzOMQdTeWrI\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\ryes I want to select the emergency cover\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"QP4g9aSZ4ePtjufsJFGXIcqBQJw6g6vSoowp\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rshould be fine\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"U7V4JQGF8c6lMgCBHG9QTJpzWgzB7VSysfEO\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rno problem I will select\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"dWYjUFu9YijkJut72VEvQZz4dymoSD7pGOKv\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rgreat\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"uj37RS9XllqgzyiTcBcU3bGDH1qPOqGYuFG6\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rinclude it\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"1ABGFrA5z1QiLI0XZWqLSSPEeuAP5WYUTgpn\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\ryou can include that\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"rGh6uD3Qr2SGK0cLYS6Gv9HdyAELoVdknRMq\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rinclude emergency cover\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"ZeBlFrEatySViY0tVf44h4aI0NUD7nXMjSX4\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rok\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"wdHnGGlJ37nBXGyrETztDl3WK5sCxkWVBtap\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\ri think it is a good idea to have one\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"rcbfoagJQhYncXuBFZxxnRTcXlgms9WU3BXy\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"q995ZBJbJyLq58QYGgbrjBCphkmHwXWNbRKX\",\"default\":\"\",\"value\":\"emergency_cover_no\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"nGox67YeJQGpOh7BAqW8UWt0cF6foqy7eOOu\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"no\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"KeaVJ2cGWUS3JeltqRcv4NppIqIZL1kfWRBZ\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rnope\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"tXyPTIJGtK49bBraYs9zqV5ZDrT9NaFSvSvt\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rI don\'t want\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"kaadJKqvhqd05Dte9AwFJmCaay5zAh5Q6Tpr\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rnot now\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"ktEbIPJ6QLr9qYs7AmUoEbEEQr4018FZuRBU\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rthat\'s expensive\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"DvPtHF54qjTOqp7R3szOxS8A18qf2FQBObQ4\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rskip\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"F1Q2DTCHvjgw6ZvPS0GckosEImNL42vNCjbA\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rnot necessary\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"fVDJ8TUDMPE6sUfvmc1Iy5Nf4EaJsR5sBNZK\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rno i don\'t think so\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"tt2WScwEsKuM63tSa5Em9qf9PkyhDx5Qk8eL\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\ri am not willing to have any emergency cover\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"xr7oNYjBY51NqIeF1ERC31oYTkMOrmJiRu8E\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rthat seems to be very expensive\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"rcFYJKp6Mj2i5XLGJHPd10FbIcvF9mz2AU7M\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\ri will not get the emergency cover\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"6ZrwtxSJAftmjUnMNu690Kc2KD12FrglHEVf\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rdon\'t include it\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"SHjOviZ44lHhNB2O3oCAOK11frYG2rkTDa5U\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rdon\'t include the emergency cover\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"yHn0nM85D8tmKFUabeed3EQESXujW6iMHhaf\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rnot ok\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"falx8lfvyXJDH6FLew8GXudpdjjiz9BYFRLI\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\ri think i don\'t want one\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"bsikqgyN9eYIbClJbBdEMpLepeJ9Gjb7IdMA\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rnot interested in\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"bNheTn4W3hL1zdFfd9bqqLYmR6ewqU8jMxMn\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\ri don\'t want the emergency cover\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"rZ2WKqcWS8WTo0gI7Zv6Wm15otIJTYZVRo47\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rno need\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"CsbVR6EZkuJrmNWh5KVSD4CIc5C51557oQoa\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\remergency cover sucks\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"iYohzP6Cqta7VMAkyIf61NhdWhf5T4GNoXjc\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"\\rnot required\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"iTK159DrYXNMYdC8fExLbzTEJvdaSpIlGtV8\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"element_id\":\"hDUhrZ956HjZBWWnSSGeC1haUQ6ItChGLVOk\",\"ui_state\":\"view\",\"can_be_deleted\":true,\"default\":\"\",\"value\":\"mortgage\"},\"data\":[{\"ui_metadata\":{\"type\":\"dropdown\",\"meta_code\":\"nlu_type\",\"element_id\":\"T57VICmJ1oROjsFzJLyBXVfnpisdlgvIQj6m\",\"value\":\"Type\",\"values\":[\"Date\",\"something\",\"another\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":\"intent\",\"value\":\"intent\"}]},{\"ui_metadata\":{\"type\":\"text_field\",\"meta_code\":\"field_meta\",\"draggable\":\"false\",\"element_id\":\"rRSymaERYc1sAhVPtxp2SQF0GEhtoG8lkQra\",\"cta_label\":\"\",\"cta_presence\":\"false\"},\"title\":\"Slot Name\",\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"LcPQfhWavfuJKyYvAaA4MeeDJkcbr7kYHyTr\"},\"data\":[{\"default\":\"\",\"value\":\"has_mortgage\"}]}]},{\"ui_metadata\":{\"title\":\"Questions\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"question_list\",\"value\":\"Question Set\",\"section_id\":\"Wq1WqmSHzpeA9Hew1wxOwwQRGxGmwSwzRRDH\",\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"0jJNyIQEj8g0EbUDfmruE7t99pWrBRLY3IFr\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"16maaN6QK82MVnpLpYEw5K0Yz6ii3snyfhzi\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Great. I want to know one more thing.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"R8BxbdE7ex9eBygRjShtJXC5mp6Pj0XN3eSf\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Sure. One more thing before I generate the quote.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"FujEmEGRMx3WzlWmt9AIxbMStRDdvsT87gD0\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your question here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"GX5z7fXBj80BuRjaylmrYBuLAjyXFL75Cv7J\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":true,\"pagination\":true,\"download\":false,\"upload\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"kRtR5ig6A8wCZJbSB0dnjwtQTgejuaXjJPpE\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Do you have a mortgage for your house?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"07vKhZFGUpbEm5q8JdqyXmVDaKa8rnJegGlA\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Do you currently have any mortgage related to this property?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"GX5z7fXBj80BuRjaylmrYBuLAjyXFL75Cv7J\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Connecting Phrases\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"connecting_phrases\",\"value\":\"Connecting Phrase Set\",\"section_id\":\"nfGJvsC1ezsRvilbEXYufefEWRmvsnq1LTbv\",\"section_enabled\":true,\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"VavgkxCOg4da5nZ0NBYyzfI8yZb2nEJWUYEF\",\"default\":\"\",\"value\":\"Connecting Phrase Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"R8A6erwXLW1sjcxMOp4bDxUBcItAq6hXkzr2\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"So, do you currently have a mortgage for your home?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"x49Oc729NVf32rOf1cuCSadsS19oHoCICAF4\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your connecting phrase here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Followup\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"followup\",\"value\":\"Followup Question Set\",\"section_id\":\"h89t0Ix0hGhoSoKageZKyxZ4Eo6OwVZtF3g5\",\"section_enabled\":\"false\",\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"N4J7GbMHlVEVdlwB9L5YJ89UoF9Hts8noetg\",\"default\":\"\",\"value\":\"Followup Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"McDxG0q1lM00h88uFwtBzoB65Upcl9Ve6kSi\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Sorry, I didn\'t get it. Can you try again?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"EK91wExvPQLqVLnxUXesrOyPR1Kbuot8xvCS\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I\'m sorry. Could you please say that again?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"u7z34v5e4192ZU5lyteeRRCa3zt9oyWgqUak\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your followup here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Required\",\"default\":\"\",\"type\":\"boolean_flag\",\"meta_code\":\"required\",\"element_id\":\"VP1rw6LlVLPXPOE5CRNo2NS0voHm9p5HFu5G\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":\"false\"}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Auto Rephrase\",\"default\":\"\",\"type\":\"boolean_flag\",\"element_id\":\"vr9bypaNi0xSSRIKEI75JagXWJKDC8AXMH3a\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":false}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"default\":\"\",\"type\":\"multi_string\",\"value\":\"Identification Tags\",\"meta_code\":\"identification_tags\",\"element_id\":\"pTig8JPOsHIfjJsZJRBRsXbcL3QCiYx16JBm\",\"ui_state\":\"new\"},\"data\":[{\"default\":[],\"value\":[]}]},{\"ui_metadata\":{\"title\":\"Intents\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"optional_config\",\"meta_sub\":\"intent\",\"value\":\"Intent Set\",\"update_status\":\"FALSE\",\"editable\":true,\"section_id\":\"G5yfbaCfDmfdOKwJgCkcRvlTO3ZM1AhofJET\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"Aty1ZyHJ7qaGKagzxPcHbmtr180lzS4BX9j5\",\"default\":\"\",\"value\":\"has_mortage\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"OOMvfZn6dCYQVG7Fo3wmVrCmB4k8jwZsQsVg\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Yes\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"6nhEVJPCJL3DjHWyCgmkcYKv4aAE3fz73Z83\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I have one\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"mOlOHcuWTk4iDU5lXpxJO52VGDFDH8qL5HuD\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"of course\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"PpwzTZAIj0bBjfDh9MdpotjdvbKeDKtiRnyQ\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I have a mortgage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"wuUDD1K69PEYr4ImDvaGB0QDADzsq3JGfyvF\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"yes I have a loan\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Mlent0iGl8vmmqkOEripJ26aSzsKExwtwZZo\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I applied for a housing loan some time back\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"VlqHuZc6GmsmSuA1Ii3WVK5emJnWjnuOg0D5\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I have a loan\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"LnrIdKIecXGJuMGykOodLHUjj4Aak59UzbX2\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Yes, few years left\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"bnDZqLWCzY5uWzafZ1UXcAD5k8cugc8ruoxX\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"yes but finishing soon\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"cskIzMyFkb3846yEY2hCckIeDDBhMjXFEikN\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"the house is mortgaged\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"iMUfMY4uTFwBYg672huzzpXtZu1NhIUftaXS\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"yup\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"0IOfWHa6wA0ohdhX5hUE2acblc4hNPRXienE\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"QmRjRTBoyPtsFkNXWLUgBbdahhJlRaXS7kvf\",\"default\":\"\",\"value\":\"no_morgage\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ahlw0ZTDOMJ3BQ19ljjyDZpEhXVFfU12g4mf\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"YTWnAHZcwwLijX7OeCwQ6zbTNfkHr9p04qww\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"nope\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"QA8IpUXz1NadgIxJhhGCJr6OgAHkcHVY9o1R\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i don\'t have one\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"2Z4oNjuOFPuE4PTIAwqp5hKM88EpYZ1wBiur\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no morgages\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"G4rfBOMUK1NtGzW5XsuluNjctJ5mVy4l9xPC\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"this house doesn\'t have a morgage\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"SPBdyQ6MLnyXWk76HAJoECo2SMePxyzxcBe1\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"mortgage is finished\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"QvmOPHbTPfhx9JW5V3GPtCqWmPrHu3UjJ76B\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i had one but i don\'t have now\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"hO86RJemo5tbmmIsSkARztm5wuQsZCM35Kau\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i owned it from my parents\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ZjoR3ItNRi8AOlwzPilDwufisWeCj1Oagd64\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no i owned it from my parents\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"phz64rAzEO2IueWKY5ZToFQCT2083X8krrjU\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no i bought it\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"PJfpDfWxDaHVr0FJZBldNXumY0ByfcRvO2I0\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i bought it for cash\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"TgbuRsjCqIf25rv7u9srxoTNozHnYQo1bnCk\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"it is finished now\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"H1iPQHceuOvjl2ExZwFstbvn4AbSP43XBcge\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i\'m renting the house\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"6EeKFgRTU8kZTP50UKHzPKXCeA0TgVFxEqKg\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]}]}]}]}]},{\"title\":\"Webhooks\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"container\",\"meta_code\":\"webhook\",\"section_id\":\"10f8934f-9adb-4a8f-85a5-3ef99084a444\"},\"data\":[{\"ui_metadata\":{\"type\":\"container\",\"element_id\":\"600e9052-358c-46c7-b4c9-52cd65122752\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false,\"pagination\":false},\"data\":[{\"ui_metadata\":{\"type\":\"text_field_dropdown\",\"element_id\":\"b10f2ed9-cf6f-4175-b22c-4d1347f1da88\",\"value\":\"URL\",\"values\":[\"GET\",\"POST\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":{\"text_field\":\"\",\"dropdown\":\"GET\"},\"value\":{\"text_field\":\"https:\\/\\/us-central1-sofia-cloud-1.cloudfunctions.net\\/general-insurance-demo\",\"dropdown\":\"POST\"}}]},{\"ui_metadata\":{\"type\":\"text_container\",\"element_id\":\"18a06a1d-503d-47a5-b98d-080642b8e8d8\",\"value\":\"Headers\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"e0743d4a-b5c0-4676-bfc1-f99d79ac3bec\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Header\",\"header\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_area_json\",\"element_id\":\"7e7c4d47-95bf-4af5-88fb-996418da86dc\",\"value\":\"Request Body\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"default\":\"\",\"value\":{\"damage_coverage\":\"[[damage_coverage]]\",\"legal_services\":\"[[legal_services]]\",\"emergency_cover\":\"[[emergency_cover]]\",\"has_mortgage\":\"[[has_mortgage]]\"}}]}]}]}],\"loc\":\"41.60542567891469 -803.9933801138632\",\"topArray\":[{\"portColor\":\"#F76415\",\"portId\":\"input\"}],\"bottomArray\":[{\"portColor\":\"#F76415\",\"portId\":\"Fullfilled\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"TCH\",\"portTextColor\":\"#777777\"}],\"agent_id\":\"false\"},{\"key\":\"64184a30f5d0691ca8328711\",\"type\":\"iu\",\"panelShape\":\"Rectangle\",\"panelWidth\":230,\"deletable\":true,\"panelBgColor\":\"#fff\",\"name\":\"Welcome\",\"icon\":\"Circle\",\"iconStroke\":\"#ffffff\",\"mainBackground\":\"#ffffff\",\"width\":230,\"height\":40,\"configData\":[{\"title\":\"Name\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"text_field\",\"section_id\":\"ecb3bb48-c821-4c5f-8339-e0b2a0c8c8ad\",\"meta_code\":\"block_name\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"ef98b701-d3d7-42fb-8735-b4e4e7379187\"},\"data\":[{\"default\":\"\",\"value\":\"Welcome\"}]}]},{\"title\":\"Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add Response\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"initial_questions\",\"section_id\":\"e1a8cc5e-25cb-4f09-b83a-94ff12bd056f\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"72094844-909c-459d-bd7c-89bd1aa7ef94\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"O2X5sFh5BfiAEWrbCv5bbEh7382gIdjem5Tr\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Hi. I\'m Sofia. Welcome to General Insurance.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"IW3lglABRkPBm28hNrjYJrDqd5B7LZvuNW7N\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Hello, I\'m Sofia. Welcome to General Insurance.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"FfpBekp8SUKCNVHEZIk87w4EBfrn1sPI8em9\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Welcome, I\'m Sofia from General Insurance.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"951672ff-1d3c-4872-8f45-5ab0e31a0fe2\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"8S8lqJN6fu33U7ImYMbGYFzDaiYmsjEjNYtP\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":true,\"display_checkbox\":false,\"checkbox_value\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"8S8lqJN6fu33U7ImYMbGYFzDaiYmsjEjNYtP\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Processing Pipeline\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"intent_level\",\"section_id\":\"99cf9e1c-0d52-474c-a78d-518c5ca3a34d\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"0efba61a-be5a-467b-809a-6acb664b8200\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_2_training\",\"element_id\":\"e4c2664e-b5e2-4f83-b920-de1b73256e84\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Fact Base\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_area\",\"meta_code\":\"intent_level_2_knowledge_base\",\"element_id\":\"abda93b0-7a2b-4b77-a733-596ef2a15c07\",\"default\":\"\",\"value\":\"Fact Based Passage\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_2_training_gate\",\"element_id\":\"01a27c74-d4cf-4b13-b590-6f331eb8e157\",\"default\":\"\",\"value\":\"Fact Based Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"020812fc-3b3f-4561-a602-f0b6b0ce5335\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]}]}]},{\"title\":\"Final Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"final_responses\",\"section_id\":\"fd3755a0-da0b-425e-98a2-c4ffaa3474fc\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"e4354bb3-d2e3-4587-96ee-76ab1a5d9544\",\"default\":\"\",\"value\":\"Final Response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"855ed9e7-a5ea-46f7-8cf8-24de7b11d7b0\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Webhooks\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"container\",\"meta_code\":\"webhook\",\"section_id\":\"cd3bbe35-af7e-4ef6-89ca-f8b17d2cbc68\"},\"data\":[{\"ui_metadata\":{\"type\":\"container\",\"element_id\":\"cbce4a23-b208-44d3-8823-0fdb8858e0a8\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false,\"pagination\":false},\"data\":[{\"ui_metadata\":{\"type\":\"text_field_dropdown\",\"element_id\":\"c01a1540-f175-4e68-a0d7-fc075b036d5b\",\"value\":\"URL\",\"values\":[\"GET\",\"POST\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":{\"text_field\":\"\",\"dropdown\":\"GET\"},\"value\":{\"text_field\":\"https:\\/\\/some.url-comes.here\",\"dropdown\":\"POST\"}}]},{\"ui_metadata\":{\"type\":\"text_container\",\"element_id\":\"b0d66ea7-8945-4c67-8fc0-9252b7dcccb3\",\"value\":\"Headers\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"a3df85c8-9577-4330-935a-e2bb15b1f05b\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Header\",\"header\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_area_json\",\"element_id\":\"89d03334-dbbd-4df4-9ffa-450cab3054bd\",\"value\":\"Request Body\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"default\":\"\",\"value\":\"{json text with escaped quotes comes in here.}\"}]}]}]},{\"title\":\"End Conversation\",\"ui_metadata\":{\"cta_presence\":true,\"draggable\":false,\"section_types\":\"boolean_container\",\"meta_code\":\"end_status\",\"section_id\":\"f6ff7e2c-4b88-4bb3-a069-7db3b3ade72b\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"createUUID()\",\"default\":\"\",\"value\":\"End\",\"can_be_deleted\":false},\"data\":[{\"default\":\"FALSE\",\"value\":\"FALSE\"}]}]}],\"loc\":\"71.60542567891486 -973.4914603468809\",\"topArray\":[{\"portColor\":\"#F76415\",\"portId\":\"input\"}],\"bottomArray\":[{\"portColor\":\"#F76415\",\"portId\":\"Fullfilled\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"TCH\",\"portTextColor\":\"#777777\"}],\"agent_id\":\"false\"},{\"key\":\"64184a31f5d0691ca8328712\",\"type\":\"iu\",\"panelShape\":\"Rectangle\",\"panelWidth\":230,\"deletable\":true,\"panelBgColor\":\"#fff\",\"name\":\"Purchased - end\",\"icon\":\"Circle\",\"iconStroke\":\"#ffffff\",\"mainBackground\":\"#ffffff\",\"width\":230,\"height\":40,\"configData\":[{\"title\":\"Name\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"text_field\",\"section_id\":\"598065d2-7b1f-4e58-93e0-8dc3674ae433\",\"meta_code\":\"block_name\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"bf956bff-c3a3-44c8-bf1d-982f71c5129e\"},\"data\":[{\"default\":\"\",\"value\":\"Purchased - end\"}]}]},{\"title\":\"Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add Response\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"initial_questions\",\"section_id\":\"d596af1d-f9eb-49f5-b9e4-baeb9d079b5a\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"8f48d58b-2a72-4a4f-9deb-3a177e94b094\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"U0WHXN7JwMiqqPDVYV7EL8vlBQ8Kpinqv3t1\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"To complete the quote, I need to capture your personal information and payment details.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"9f42d860-aa8b-48e4-8c63-4637dde6574d\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"BGF5uAKn5pjaVufSPHwrcIxmHvsALnRyUR8f\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":true,\"display_checkbox\":false,\"checkbox_value\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"qE7HCGu3CSj9oLv2YyXBDryoMWQKrtrnHUrw\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"You will receive a link to your registered mobile phone shortly\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"opmepzgqMxnT5QGopXrQnZDJETe8aNy2NgeO\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"You will shortly receive an SMS with the link to your registered mobile.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"BGF5uAKn5pjaVufSPHwrcIxmHvsALnRyUR8f\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"r0xqX8WzmfRP2YHLiMw0CIRNsse7PW2lGy2o\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":true,\"display_checkbox\":false,\"checkbox_value\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"P8DEXrwprF7TLYUrF3v0zUf0QO7BAujM9EoO\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Please don\'t hesitate to contact us if you need further assistance.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"r0xqX8WzmfRP2YHLiMw0CIRNsse7PW2lGy2o\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"ubpAi9TJc28EVa3CfbdLivBRnwKVKg2sMXPk\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":true,\"display_checkbox\":false,\"checkbox_value\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Bv7P2uP9ruZXmGMfYuTIWgoKWl7CNmRr97z2\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Thank you for contacting General Insurance.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ubpAi9TJc28EVa3CfbdLivBRnwKVKg2sMXPk\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Processing Pipeline\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"intent_level\",\"section_id\":\"5173f0f5-a5eb-46ef-ae9f-c4f50f58d1db\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"ba1136ef-3b7f-4525-8c8a-bbcaee62f976\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_2_training\",\"element_id\":\"bb7995c5-5d69-4f69-9ff6-1e16b030c001\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Fact Base\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_area\",\"meta_code\":\"intent_level_2_knowledge_base\",\"element_id\":\"c2333c9e-d9df-4a6a-a737-dc16ab3f2098\",\"default\":\"\",\"value\":\"Fact Based Passage\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_2_training_gate\",\"element_id\":\"89a5fc84-ac3d-4640-bd39-93202737c172\",\"default\":\"\",\"value\":\"Fact Based Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"663888a3-6a0a-457c-b56a-0610ec32a3cd\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]}]}]},{\"title\":\"Final Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"final_responses\",\"section_id\":\"7c6eec39-2d23-4c7b-842b-9ea49c5cc1b6\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"9812e44b-a4ec-4216-b209-d6128cdd5096\",\"default\":\"\",\"value\":\"Final Response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"btDOPX7WiTkJtGnv4Qf541BlauZd3UuJEagd\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"<meta command = \\\"END\\\" \\/>\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"d654afaa-f67f-43b4-b839-dc32b19e43bf\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Webhooks\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"container\",\"meta_code\":\"webhook\",\"section_id\":\"e2cb883d-883d-421c-9c01-59918dfcc335\"},\"data\":[{\"ui_metadata\":{\"type\":\"container\",\"element_id\":\"65fafa9d-0803-4815-8ee5-40dc1e9e12c4\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false,\"pagination\":false},\"data\":[{\"ui_metadata\":{\"type\":\"text_field_dropdown\",\"element_id\":\"765767b9-0c9d-49c4-b752-a34b6bd332c8\",\"value\":\"URL\",\"values\":[\"GET\",\"POST\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":{\"text_field\":\"\",\"dropdown\":\"GET\"},\"value\":{\"text_field\":\"https:\\/\\/some.url-comes.here\",\"dropdown\":\"POST\"}}]},{\"ui_metadata\":{\"type\":\"text_container\",\"element_id\":\"454fe39b-5433-4bcc-8c05-089b628faed6\",\"value\":\"Headers\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"7a698b86-aa37-4365-8eaa-1a06a42aa85e\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Header\",\"header\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_area_json\",\"element_id\":\"3053d84d-087c-4b3b-bc07-2f526b2f042a\",\"value\":\"Request Body\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"default\":\"\",\"value\":\"{json text with escaped quotes comes in here.}\"}]}]}]},{\"title\":\"End Conversation\",\"ui_metadata\":{\"cta_presence\":true,\"draggable\":false,\"section_types\":\"boolean_container\",\"meta_code\":\"end_status\",\"section_id\":\"ae38661e-8d45-4add-8587-07f173c1c4dd\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"createUUID()\",\"default\":\"\",\"value\":\"End\",\"can_be_deleted\":false},\"data\":[{\"default\":\"FALSE\",\"value\":\"true\"}]}]}],\"loc\":\"-166.32400253696798 -404.4241423717383\",\"topArray\":[{\"portColor\":\"#F76415\",\"portId\":\"input\"}],\"bottomArray\":[{\"portColor\":\"#F76415\",\"portId\":\"Fullfilled\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"TCH\",\"portTextColor\":\"#777777\"}],\"agent_id\":\"false\"},{\"key\":\"64184a31f5d0691ca8328713\",\"type\":\"dm\",\"panelShape\":\"Rectangle\",\"panelWidth\":230,\"deletable\":true,\"panelBgColor\":\"#fff\",\"name\":\"Other Topics\",\"icon\":\"Diamond\",\"iconStroke\":\"#ffffff\",\"mainBackground\":\"#ffffff\",\"width\":230,\"height\":40,\"configData\":[{\"title\":\"Name\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"text_field\",\"section_id\":\"5cae1a96-f305-4bbd-af6b-f726d0d19ace\",\"meta_code\":\"block_name\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"a7e1fcc7-86f1-4ce6-9f6a-acb32acaf338\"},\"data\":[{\"default\":\"\",\"value\":\"Other Topics\"}]}]},{\"title\":\"Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add Response\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"initial_questions\",\"section_id\":\"5e8d6514-d837-44ae-be75-d9d281e8a5c6\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"ffbb807e-9256-48ab-ab4c-d02d33816fb0\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"4b86645a-67ae-4221-8727-2cf5bff613d1\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Processing Pipeline\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"intent_level\",\"section_id\":\"19537fe1-bca4-45a1-950f-07d281fb7895\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"e5f4278b-5416-4d60-813c-cb92f72ed271\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_1_training\",\"element_id\":\"d964ca96-46fa-4cb3-8b3a-89063c9fe4db\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Change Topic\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"fe52d438-e053-4f27-a604-338f11a08bce\",\"default\":\"\",\"value\":\"TCH Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"3e56667d-ddfb-4be9-9cc4-bbbdfbbb5dc3\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"ceb2ae0e-2a64-4ea0-88c1-799dba10c665\",\"default\":\"\",\"value\":\"TCH Classification Direction (Enable to include)\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"e98932a5-0a67-41d0-b9af-066cb47c83a8\",\"default\":\"\",\"value\":\"Detect Exit Conditions\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"false\"}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_2_training\",\"element_id\":\"dd194685-e48c-45ab-bc30-8a1270e683da\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Fact Base\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_area\",\"meta_code\":\"intent_level_2_knowledge_base\",\"element_id\":\"808e3df3-cb26-4725-8e48-c20cfdf1458c\",\"default\":\"\",\"value\":\"Fact Based Passage\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_2_training_gate\",\"element_id\":\"599b3e9f-7684-47fd-a4c3-33783a3a7b5b\",\"default\":\"\",\"value\":\"Fact Based Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"9f1b549e-904c-4b64-9866-04018d25e447\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_3_training\",\"element_id\":\"2ad4597f-dcbf-4307-86c7-31a56142294d\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Meta Actions\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"meta_code\":\"intent_level_3_training_rephrase_request_boolean\",\"element_id\":\"a1b9d3c8-6110-414b-9189-a4baf4c119c9\",\"default\":\"\",\"value\":\"Rephrase Training Data\",\"can_be_deleted\":false,\"help_text\":\"some help text about this element\"},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_3_training_rephrase_request_data\",\"element_id\":\"8b556011-2f37-4a85-95ee-750ed47a11c4\",\"default\":\"Custom Data\",\"value\":\"Rephrase Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"e18f6f93-71e0-455b-b835-a0a0d4d98ec6\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"meta_code\":\"intent_level_3_training_change_request_boolean\",\"element_id\":\"a828e532-5d2e-43e1-969d-bc467aa5d395\",\"default\":\"\",\"value\":\"Recorrection Training Data\",\"can_be_deleted\":false,\"help_text\":\"some help text about this element\"},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_3_training_change_request_data\",\"element_id\":\"1af95c46-4905-428e-ae88-f8d6f938bbd2\",\"default\":\"Custom Data\",\"value\":\"Recorrection Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"4b6ba66b-510f-4c66-81da-1245267328e8\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"6c17eb64-a8b6-4efe-80f6-fd285f003e53\",\"default\":\"\",\"value\":\"Classification Direction\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"\"}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"50b4fd4a-089d-4d06-b6df-ce35b50a4cf1\",\"default\":\"\",\"value\":\"Self Correction Training data\",\"can_be_deleted\":false,\"help_text\":\"some help text about this element\"},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_nlu\",\"element_id\":\"60547b9b-1f94-4ecc-9ae4-0ad6cf127781\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"NLU\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"612fe7f9-c8d2-4613-b2e3-b04ac30baa61\",\"default\":\"\",\"value\":\"Combine\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"false\"}]}]}]}]},{\"title\":\"NLU\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"cta_types\":[\"synonym\",\"regex\",\"intent\",\"date\",\"name\",\"email\",\"phone\",\"any\",\"yes\\/no\",\"city\",\"country\",\"duration\",\"zip code\",\"age\",\"currency\",\"numeric\",\"void\"],\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"field_fillers\",\"section_id\":\"68be4bb4-a509-4ef0-ac64-b35bce0d69e1\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"02ef235d-b187-4dd8-b57d-1faa5738b22e\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"element_id\":\"jRAV5Lxqm86fZzpFeY2oBsA7tPBcD39pA9fy\",\"ui_state\":\"view\",\"can_be_deleted\":true,\"default\":\"\",\"value\":\"other_intents\"},\"data\":[{\"ui_metadata\":{\"type\":\"dropdown\",\"meta_code\":\"nlu_type\",\"element_id\":\"xHDjYS3dWIIAPsaQZIQagUQI14abg4o3nHDy\",\"value\":\"Type\",\"values\":[\"Date\",\"something\",\"another\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":\"intent\",\"value\":\"intent\"}]},{\"ui_metadata\":{\"type\":\"text_field\",\"meta_code\":\"field_meta\",\"draggable\":\"false\",\"element_id\":\"R0KEeyLL0AVFXhmWT0OqoDHAAskd1Qgb5SnQ\",\"cta_label\":\"\",\"cta_presence\":\"false\"},\"title\":\"Slot Name\",\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"UaW9lvesclD8INsKO6om910IhBW5Js1DhvUg\"},\"data\":[{\"default\":\"\",\"value\":\"other_intents\"}]}]},{\"ui_metadata\":{\"title\":\"Questions\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"question_list\",\"value\":\"Question Set\",\"section_id\":\"ASxVS7Z2VmtGrpmHGI6xxjJAujvORiizlrvh\",\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"d4wrwZFggXKF1g4lx3jAuVMF9xrMvAVVdgNr\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"F7QU8GFOjRGtYPTaWKks4tLn3Xp2adj5Empu\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Can you say that again?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"0Znz8G0RCRqv71xF4VJyf21Ys6QFLUyZVRif\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your question here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Connecting Phrases\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"connecting_phrases\",\"value\":\"Connecting Phrase Set\",\"section_id\":\"Qua1cpICmxjRlGC88WJBeRiVTFoZ7pzLabwb\",\"section_enabled\":true},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"oLm8oMSxpye9sQdIobP9rE09q1XzhJpcnzb6\",\"default\":\"\",\"value\":\"Connecting Phrase Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"gpaqht2FvIzVZuy3iJe6B7qfHxYH7usP6Rcl\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your validation here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Followup\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"followup\",\"value\":\"Followup Question Set\",\"section_id\":\"DOWR8JokYOo6Nl8KKSW9HahI6xPApYAQfhww\",\"section_enabled\":false},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"bx5ORu1rMT85ZD1iX1Krq2st0dX6wU6JIBcB\",\"default\":\"\",\"value\":\"Followup Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"dO94xBYZR1AYyC2C2BsIKo2ugeC8MnPyVVvw\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your followup here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Required\",\"default\":\"\",\"type\":\"boolean_flag\",\"meta_code\":\"required\",\"element_id\":\"h4a3KDuMIlG6xaQ7qdETJq5eVMEylkapxqUp\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":false}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Auto Rephrase\",\"default\":\"\",\"type\":\"boolean_flag\",\"element_id\":\"SzTjAg7T1Xrl6jY6TSJchk1OyXFTGNe2CM8H\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":false}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"default\":\"\",\"type\":\"multi_string\",\"value\":\"Identification Tags\",\"meta_code\":\"identification_tags\",\"element_id\":\"7VEnFd76jmZ81SvuJwf6gZ6420Nae1QIWH4K\",\"ui_state\":\"new\"},\"data\":[{\"default\":[],\"value\":[]}]},{\"ui_metadata\":{\"title\":\"Intents\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"optional_config\",\"meta_sub\":\"intent\",\"value\":\"Intent Set\",\"update_status\":\"FALSE\",\"editable\":true,\"section_id\":\"JS5cgzCOU0SsMkxQLrEKvxstGGBFbSknAwog\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"zCOkpQ2BGvdb9UnT3AqHFiBxy2U9G9eQ1AtC\",\"default\":\"\",\"value\":\"exit\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Bfh7oZhIu21rxCGS5Yhm5tNa3wDtDdQyh9Dc\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I want to end the call\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"YfvFGhZKumjOrCUaNCMzLGTuBeQE2s6VY5tT\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"exit\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"1lEslpr29DTwvHtpXW2FWAiLiAfse5Z4PFQv\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i want to end the chat\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"FwCwtMS7YEKAIR1rsBSCwLjXTHHc31dldRWl\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"exit the chat\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"2LgAHeGmZsKpTe7uYnf1WdEffvQEdTYUe7DG\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"don\'t want to talk to you\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"l0pZd5TVAkjs6KhQWiM9YU3H4WJ9XDHWWhEx\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"can you end the chat\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"UjwQ7jgPVwoXNt2QKrF9qBQjo4oIwjGqmknH\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"end\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"xYx6ZaY1KgfdCyDKlOwctQIPn4BfHvzEJ8oh\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i don\'t want to talk to you any more\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"wJynF7KvTBZLtiHyaQRLRWXxKqXQHaRywW8A\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"aqwFmvHl4sKHtVgn150WMoNNa4vavzDMC9Pp\",\"default\":\"\",\"value\":\"transfer\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"j9UCEvcKDG6S4d6lxQi8EiosJQDYTmhA9kPI\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i want to talk to a human\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"A2q9ohnLqyrUxjT29hn6EGlpvZTAeKE00d8Q\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"can i talk to someone\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ZSVSOa1pJfc76ecOLUXKK66BzWO3VtNY7izg\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"transfer me to someone\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"BG2gbw7aFxLawOMsItR9pYzgSL2UnPLBkj2G\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"can i speak to a live agent\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"hcq8LvbhDcVoylcVDJCydRVIPSIa1LT5ICz6\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"you are a robot i want a live agent\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"UBYbZ1YdlSGtZl8a2a99Q3KfTseqkkpKUvRe\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"transfer\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"WkXSploBZI91tmYtwQm4sAYcpwM5Uqdhl6dt\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"call transfer\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"JlTBLuKROwitLKettKs09AhcHYnr9OhelzDN\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"chat transfer\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ZXjHhYqEUiu6Cbo3gohAmU6bMAVr89088EYt\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"connect me to a live agent\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"DM20NjK70gnDyqzUzrq1IeTV4YLBLS8vRmS1\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]}]}]}]}]},{\"title\":\"Decision Outcome\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"decision_outcomes\",\"section_id\":\"22922318-0db7-4552-88f0-9f633446caff\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"358f8d14-3fde-4104-80e0-b88353e0d2ec\",\"default\":\"\",\"value\":\"Decision 1\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":true,\"checkbox_value\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"8a0d259a-03d6-43a0-809f-7478a4586e3e\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"exit\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"7173531f-f120-407e-881c-cd02961b18a0\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"5860931b-339c-46a6-a6fc-9c7f4f2c51dc\",\"default\":\"\",\"value\":\"Decision 2\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":true,\"checkbox_value\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"xwkJuYlYD4s3L4NqSE2sxQIcJj3cHye6BWoG\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"transfer\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"43f3edc1-cf60-4f16-a0ae-88928ed4817c\",\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Webhooks\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"container\",\"meta_code\":\"webhook\",\"section_id\":\"5e86f443-188f-43eb-9622-fc6d0e5eb01c\"},\"data\":[{\"ui_metadata\":{\"type\":\"container\",\"element_id\":\"2dc56ea7-296b-489a-a748-63fd8decb514\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false,\"pagination\":false},\"data\":[{\"ui_metadata\":{\"type\":\"text_field_dropdown\",\"element_id\":\"8e9b30b3-f534-440e-b7e1-a1ef5c6a510b\",\"value\":\"URL\",\"values\":[\"GET\",\"POST\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":{\"text_field\":\"\",\"dropdown\":\"GET\"},\"value\":{\"text_field\":\"https:\\/\\/some.url-comes.here\",\"dropdown\":\"POST\"}}]},{\"ui_metadata\":{\"type\":\"text_container\",\"element_id\":\"961ee35e-be61-43ba-8218-59ea0ed97f34\",\"value\":\"Headers\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"684048fb-0bae-4414-9d67-622b7566dab4\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Header\",\"header\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_area_json\",\"element_id\":\"81081b6a-ea8c-46e7-b3a6-a8da77b0ccb2\",\"value\":\"Request Body\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"default\":\"\",\"value\":\"{json text with escaped quotes comes in here.}\"}]}]}]}],\"loc\":\"411.56699015445383 -841.897379133165\",\"topArray\":[{\"portColor\":\"#F76415\",\"portId\":\"input\"}],\"bottomArray\":[{\"portColor\":\"#F76415\",\"portId\":\"TCH\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"Dec-1\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"Dec-2\",\"portTextColor\":\"#777777\"}],\"agent_id\":\"false\"},{\"key\":\"64184a31f5d0691ca8328714\",\"type\":\"dm\",\"panelShape\":\"Rectangle\",\"panelWidth\":230,\"deletable\":true,\"panelBgColor\":\"#fff\",\"name\":\"Exit Choice?\",\"icon\":\"Diamond\",\"iconStroke\":\"#ffffff\",\"mainBackground\":\"#ffffff\",\"width\":230,\"height\":40,\"configData\":[{\"title\":\"Name\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"text_field\",\"section_id\":\"5cae1a96-f305-4bbd-af6b-f726d0d19ace\",\"meta_code\":\"block_name\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"a7e1fcc7-86f1-4ce6-9f6a-acb32acaf338\"},\"data\":[{\"default\":\"\",\"value\":\"Exit Choice?\"}]}]},{\"title\":\"Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add Response\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"initial_questions\",\"section_id\":\"5e8d6514-d837-44ae-be75-d9d281e8a5c6\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"ffbb807e-9256-48ab-ab4c-d02d33816fb0\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"4b86645a-67ae-4221-8727-2cf5bff613d1\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Processing Pipeline\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"intent_level\",\"section_id\":\"19537fe1-bca4-45a1-950f-07d281fb7895\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"e5f4278b-5416-4d60-813c-cb92f72ed271\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_1_training\",\"element_id\":\"d964ca96-46fa-4cb3-8b3a-89063c9fe4db\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Change Topic\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"fe52d438-e053-4f27-a604-338f11a08bce\",\"default\":\"\",\"value\":\"TCH Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"3e56667d-ddfb-4be9-9cc4-bbbdfbbb5dc3\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"ceb2ae0e-2a64-4ea0-88c1-799dba10c665\",\"default\":\"\",\"value\":\"TCH Classification Direction (Enable to include)\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"e98932a5-0a67-41d0-b9af-066cb47c83a8\",\"default\":\"\",\"value\":\"Detect Exit Conditions\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"false\"}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_2_training\",\"element_id\":\"dd194685-e48c-45ab-bc30-8a1270e683da\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Fact Base\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_area\",\"meta_code\":\"intent_level_2_knowledge_base\",\"element_id\":\"808e3df3-cb26-4725-8e48-c20cfdf1458c\",\"default\":\"\",\"value\":\"Fact Based Passage\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_2_training_gate\",\"element_id\":\"599b3e9f-7684-47fd-a4c3-33783a3a7b5b\",\"default\":\"\",\"value\":\"Fact Based Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"9f1b549e-904c-4b64-9866-04018d25e447\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_3_training\",\"element_id\":\"2ad4597f-dcbf-4307-86c7-31a56142294d\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Meta Actions\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"meta_code\":\"intent_level_3_training_rephrase_request_boolean\",\"element_id\":\"a1b9d3c8-6110-414b-9189-a4baf4c119c9\",\"default\":\"\",\"value\":\"Rephrase Training Data\",\"can_be_deleted\":false,\"help_text\":\"some help text about this element\"},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_3_training_rephrase_request_data\",\"element_id\":\"8b556011-2f37-4a85-95ee-750ed47a11c4\",\"default\":\"Custom Data\",\"value\":\"Rephrase Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"e18f6f93-71e0-455b-b835-a0a0d4d98ec6\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"meta_code\":\"intent_level_3_training_change_request_boolean\",\"element_id\":\"a828e532-5d2e-43e1-969d-bc467aa5d395\",\"default\":\"\",\"value\":\"Recorrection Training Data\",\"can_be_deleted\":false,\"help_text\":\"some help text about this element\"},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_3_training_change_request_data\",\"element_id\":\"1af95c46-4905-428e-ae88-f8d6f938bbd2\",\"default\":\"Custom Data\",\"value\":\"Recorrection Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"4b6ba66b-510f-4c66-81da-1245267328e8\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"6c17eb64-a8b6-4efe-80f6-fd285f003e53\",\"default\":\"\",\"value\":\"Classification Direction\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"\"}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"50b4fd4a-089d-4d06-b6df-ce35b50a4cf1\",\"default\":\"\",\"value\":\"Self Correction Training data\",\"can_be_deleted\":false,\"help_text\":\"some help text about this element\"},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_nlu\",\"element_id\":\"60547b9b-1f94-4ecc-9ae4-0ad6cf127781\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"NLU\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"612fe7f9-c8d2-4613-b2e3-b04ac30baa61\",\"default\":\"\",\"value\":\"Combine\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"false\"}]}]}]}]},{\"title\":\"NLU\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"cta_types\":[\"synonym\",\"regex\",\"intent\",\"date\",\"name\",\"email\",\"phone\",\"any\",\"yes\\/no\",\"city\",\"country\",\"duration\",\"zip code\",\"age\",\"currency\",\"numeric\",\"void\"],\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"field_fillers\",\"section_id\":\"68be4bb4-a509-4ef0-ac64-b35bce0d69e1\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"02ef235d-b187-4dd8-b57d-1faa5738b22e\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"element_id\":\"PuhjvlzglMLN94L4508DqMYG8hnzx7zFcxUF\",\"ui_state\":\"view\",\"can_be_deleted\":true,\"default\":\"\",\"value\":\"exit choice\"},\"data\":[{\"ui_metadata\":{\"type\":\"dropdown\",\"meta_code\":\"nlu_type\",\"element_id\":\"ypYssHR1RjaL5ZGAkTn0KIqcY0VDZQSqn2mt\",\"value\":\"Type\",\"values\":[\"Date\",\"something\",\"another\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":\"intent\",\"value\":\"intent\"}]},{\"ui_metadata\":{\"type\":\"text_field\",\"meta_code\":\"field_meta\",\"draggable\":\"false\",\"element_id\":\"0G5NQL6t3baHKEaIU2nvWF40cxlrVPLu04j3\",\"cta_label\":\"\",\"cta_presence\":\"false\"},\"title\":\"Slot Name\",\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"78OARHRFcbRXhaAJERqQx44TRkCqftIThD6y\"},\"data\":[{\"default\":\"\",\"value\":\"exit_choice\"}]}]},{\"ui_metadata\":{\"title\":\"Questions\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"question_list\",\"value\":\"Question Set\",\"section_id\":\"rZqF1gxGXXz24lmXPq4VgdW9g2NQou86mpzp\",\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"VPbrWrCQ5p2wgL7fHQCpdtVjYzND87VuHfCJ\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"iYYGc8gHnH8iFvPUXlnZJnIV4TuujhDO6zlE\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Are you sure you want to exit?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"DOiM3z2iBMlTu3zKMPxD1GOURsgNVXejqSQw\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your question here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Connecting Phrases\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"connecting_phrases\",\"value\":\"Connecting Phrase Set\",\"section_id\":\"jkL9FEdZ18UWRVs4dpJvjBSrRZAL4GJgujyh\",\"section_enabled\":true},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"1RPvR0yLCxlBC8ccnIkPXwDzlvmcxfcxrF4G\",\"default\":\"\",\"value\":\"Connecting Phrase Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"2rT1LuhL6XBNbNGbv6UuQxkVlOREkGzLuKYf\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your validation here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Followup\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"followup\",\"value\":\"Followup Question Set\",\"section_id\":\"w65RzpomDBBBCPZImxOrYzN5CKVrRxHWeMN7\",\"section_enabled\":false},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"qxXIS3sYP4gWMrHYY4LCJOkowpg6dDN4kgYT\",\"default\":\"\",\"value\":\"Followup Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"H5D0toOUEjsp9MeLj3cSY1Plbd6kYhPe82S2\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your followup here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Required\",\"default\":\"\",\"type\":\"boolean_flag\",\"meta_code\":\"required\",\"element_id\":\"mZd9aXbR5M6ZouuRSHjsHGanUzjEh6i3g5hr\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":false}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Auto Rephrase\",\"default\":\"\",\"type\":\"boolean_flag\",\"element_id\":\"YAuNi2AUf3JCk9g4965sWVYuuoTxjsdgBpRR\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":false}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"default\":\"\",\"type\":\"multi_string\",\"value\":\"Identification Tags\",\"meta_code\":\"identification_tags\",\"element_id\":\"AusXzVGBiTdYmJBGtUk8eIxixc49BaCsCy0y\",\"ui_state\":\"new\"},\"data\":[{\"default\":[],\"value\":[]}]},{\"ui_metadata\":{\"title\":\"Intents\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"optional_config\",\"meta_sub\":\"intent\",\"value\":\"Intent Set\",\"update_status\":\"FALSE\",\"editable\":true,\"section_id\":\"lVrGA9VQXx3U86YiNRNakvVN3cXzkSBcn2iP\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"YLmSnVPEK5Nm6yjK4BiJjoxiW0tQ2HvJ2VXP\",\"default\":\"\",\"value\":\"exit_yes\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"mTtZUx7f1tG27xB7A1ZA74Qj8hhbz1FMAvQI\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Yes I want to exit\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"dOwyi7amTFkil80D3S2pAbPLSilvVyQWTHGe\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"yes\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ftAHyqRu2A9rO7gvjKuaPtCeTZsRPLnnxWWi\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"exit\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"dPhgaA8W0VW7feMdYGd0YwAiVINXePScKvaD\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"of course\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"nuGOQfXrJwkzkYCylaasp9EBhPwwts9NJ2j3\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"told you once\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"oxTDBTQ5ZfkipIXWUH2oBLvBSk56pvIPufz8\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"yup\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"M5atouWNtVIEEbCgtIGdtNVkiMSgXOUz2jNt\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i want to exit\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"PiDFnaeNoZCroFQfgem3xWoMAsjAu8SSFi9z\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"end the call\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"84uR4rUKjkcNF3TIT3IavuV1DBbQqAP7jAhx\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"end\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"vGN6PuzszNYoVKit2KBuHJA9skXmoFiO7qDP\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i don\'t want to talk to you\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"WrQIiXnsCpfOhAc7AV5kbnuyemOTyGqbqAWJ\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"go ahead\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"bSUi4MNkMZRfiNTawOCCyu8ClHFGH36np5f0\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"end the chat\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"FzJDn88m6sMfiF3O3X6rktT68veWyk9Vn4eI\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"CD5GwyJbtJAGz1rq1Gd1h06RxcPeEP5LASpn\",\"default\":\"\",\"value\":\"exit_no\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"R4vocAO5R0mXtTZxO46hMFe1MAvmEzXH75Yh\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"No I don\'t want to exit\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ZWyJxKxL14sEmeYTHHAzXGIUbFD98FfupEyA\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"nope\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"tPtbKdSo8xcPy8LmPW4KBGUe8sswklQbp3pE\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no i made a mistake\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"S7QsnlAZ9cfz6lGsdn0L8DohLdSxSV3eKDl0\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i was joking\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"rkSFv7VJiaLLesm8udB0ZHyySnNhKPv6Jgw9\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no please continue\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"MGfvuvJ0vi2EMW8psEcyr9r3APubieA1q7L1\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"please continue\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"qpsWgQYWCYsiEWxvKXFTppYjsCPuPkFvuu4Q\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i changed my mind\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"XyxzUTqQEVavzneKVzV0Cuqw3YzngF9ET8to\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"don\'t\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"HLyc1VCmK2aVAxZzwA94PMxvfpkeHSXWiF8r\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"let\'s talk more\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"LuMRjmYy9gdrEKzcI0z0oXqN184iruE4kBUl\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]}]}]}]}]},{\"title\":\"Decision Outcome\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"decision_outcomes\",\"section_id\":\"22922318-0db7-4552-88f0-9f633446caff\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"358f8d14-3fde-4104-80e0-b88353e0d2ec\",\"default\":\"\",\"value\":\"Decision 1\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":true,\"checkbox_value\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"8a0d259a-03d6-43a0-809f-7478a4586e3e\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"exit_yes\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"7173531f-f120-407e-881c-cd02961b18a0\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"5860931b-339c-46a6-a6fc-9c7f4f2c51dc\",\"default\":\"\",\"value\":\"Decision 2\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":true,\"checkbox_value\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"6P2HsOXTFTknS5ZFhEsHSCneoVV1Haj0T1pJ\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"exit_no\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"43f3edc1-cf60-4f16-a0ae-88928ed4817c\",\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Webhooks\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"container\",\"meta_code\":\"webhook\",\"section_id\":\"5e86f443-188f-43eb-9622-fc6d0e5eb01c\"},\"data\":[{\"ui_metadata\":{\"type\":\"container\",\"element_id\":\"2dc56ea7-296b-489a-a748-63fd8decb514\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false,\"pagination\":false},\"data\":[{\"ui_metadata\":{\"type\":\"text_field_dropdown\",\"element_id\":\"8e9b30b3-f534-440e-b7e1-a1ef5c6a510b\",\"value\":\"URL\",\"values\":[\"GET\",\"POST\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":{\"text_field\":\"\",\"dropdown\":\"GET\"},\"value\":{\"text_field\":\"https:\\/\\/some.url-comes.here\",\"dropdown\":\"POST\"}}]},{\"ui_metadata\":{\"type\":\"text_container\",\"element_id\":\"961ee35e-be61-43ba-8218-59ea0ed97f34\",\"value\":\"Headers\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"684048fb-0bae-4414-9d67-622b7566dab4\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Header\",\"header\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_area_json\",\"element_id\":\"81081b6a-ea8c-46e7-b3a6-a8da77b0ccb2\",\"value\":\"Request Body\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"default\":\"\",\"value\":\"{json text with escaped quotes comes in here.}\"}]}]}]}],\"loc\":\"567.284547916719 -671.8503054268759\",\"topArray\":[{\"portColor\":\"#F76415\",\"portId\":\"input\"}],\"bottomArray\":[{\"portColor\":\"#F76415\",\"portId\":\"TCH\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"Dec-1\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"Dec-2\",\"portTextColor\":\"#777777\"}],\"agent_id\":\"false\"},{\"key\":\"64184a31f5d0691ca8328715\",\"type\":\"iu\",\"panelShape\":\"Rectangle\",\"panelWidth\":230,\"deletable\":true,\"panelBgColor\":\"#fff\",\"name\":\"Exit-yes\",\"icon\":\"Circle\",\"iconStroke\":\"#ffffff\",\"mainBackground\":\"#ffffff\",\"width\":230,\"height\":40,\"configData\":[{\"title\":\"Name\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"text_field\",\"section_id\":\"c2fae041-4a37-475b-8482-58e6cb410c31\",\"meta_code\":\"block_name\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"47be2b5c-a13e-4fb4-be2c-3465c24b9195\"},\"data\":[{\"default\":\"\",\"value\":\"Exit-yes\"}]}]},{\"title\":\"Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add Response\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"initial_questions\",\"section_id\":\"0dfbab6e-71f0-45cf-bcaf-be577266895c\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"2f8782d2-00c1-4ab6-a599-c51ccc8cba5f\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"gpekwRA6lSwF5ojhzmIagHUC06Y4LZt4eQZt\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Sure\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"cfc4a16c-cc31-4056-a0c1-b86485feedab\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"AmYIgtygoTbSsTmkxRoQPoGeSsra891zoB4V\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":true,\"display_checkbox\":false,\"checkbox_value\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"HFj7Fmcb5yQ8gq3iPsL7vkrobjA4NJxPN4e8\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Thank you for contacting us\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"AmYIgtygoTbSsTmkxRoQPoGeSsra891zoB4V\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"qIomJLeVbJjp26kWzxpKoZo4fDd7vflzhyVF\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":true,\"display_checkbox\":false,\"checkbox_value\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"sXh7V0fSdBVPovRkamwVs8Ay7OynhssKeod5\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Have a nice day.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"qIomJLeVbJjp26kWzxpKoZo4fDd7vflzhyVF\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"rYARZZgqxLEXQqFFQKDl6BNImTZ3eO6HkOTH\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":true,\"display_checkbox\":false,\"checkbox_value\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"J5e9tJwv1bDLVGBQTCUZRycmPcOB8QIOJjy1\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"<meta command = \\\"END\\\" \\/>\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"rYARZZgqxLEXQqFFQKDl6BNImTZ3eO6HkOTH\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Processing Pipeline\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"intent_level\",\"section_id\":\"f8768fe7-59e1-4d60-832d-3be399e533e3\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"b1e53463-14a1-4c1b-970e-979f165be80e\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_2_training\",\"element_id\":\"d84fd0db-6eb1-4671-9875-e69d6fb0dd12\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Fact Base\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_area\",\"meta_code\":\"intent_level_2_knowledge_base\",\"element_id\":\"23422329-c483-40ec-ba3c-d1e7fb495f6c\",\"default\":\"\",\"value\":\"Fact Based Passage\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_2_training_gate\",\"element_id\":\"618bc1f4-1f16-46d3-bc7b-669fd435febf\",\"default\":\"\",\"value\":\"Fact Based Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"5b5d8c5d-99de-438c-899f-e33e7c6da441\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]}]}]},{\"title\":\"Final Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"final_responses\",\"section_id\":\"46929773-6fe8-42bd-a3c3-e7147ae53bdf\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"6b0e1aec-36ba-443e-8353-5033c56431e3\",\"default\":\"\",\"value\":\"Final Response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"8d7b2d82-b3e8-44cb-9491-10594937c808\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Webhooks\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"container\",\"meta_code\":\"webhook\",\"section_id\":\"60ca66c3-6b26-4872-b028-914df09e05e6\"},\"data\":[{\"ui_metadata\":{\"type\":\"container\",\"element_id\":\"9af60c29-5a37-4d27-b2d6-8f2368f503b4\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false,\"pagination\":false},\"data\":[{\"ui_metadata\":{\"type\":\"text_field_dropdown\",\"element_id\":\"7481f99d-9467-4abf-9b4b-5def7c39e807\",\"value\":\"URL\",\"values\":[\"GET\",\"POST\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":{\"text_field\":\"\",\"dropdown\":\"GET\"},\"value\":{\"text_field\":\"https:\\/\\/some.url-comes.here\",\"dropdown\":\"POST\"}}]},{\"ui_metadata\":{\"type\":\"text_container\",\"element_id\":\"e36d1bb1-6c6d-46bb-ba2d-8e001a3e8dba\",\"value\":\"Headers\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"c50a9144-8977-40d3-a9c1-aecd722202ea\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Header\",\"header\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_area_json\",\"element_id\":\"99cc648d-f7a8-4f31-b63f-e4ba37b000d5\",\"value\":\"Request Body\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"default\":\"\",\"value\":\"{json text with escaped quotes comes in here.}\"}]}]}]},{\"title\":\"End Conversation\",\"ui_metadata\":{\"cta_presence\":true,\"draggable\":false,\"section_types\":\"boolean_container\",\"meta_code\":\"end_status\",\"section_id\":\"13e68737-0387-4fbc-8e89-b9b49581f80e\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"createUUID()\",\"default\":\"\",\"value\":\"End\",\"can_be_deleted\":false},\"data\":[{\"default\":\"FALSE\",\"value\":\"true\"}]}]}],\"loc\":\"484.9012614831541 -396.4968163359456\",\"topArray\":[{\"portColor\":\"#F76415\",\"portId\":\"input\"}],\"bottomArray\":[{\"portColor\":\"#F76415\",\"portId\":\"Fullfilled\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"TCH\",\"portTextColor\":\"#777777\"}],\"agent_id\":\"false\"},{\"key\":\"64184a31f5d0691ca8328716\",\"type\":\"iu\",\"panelShape\":\"Rectangle\",\"panelWidth\":230,\"deletable\":true,\"panelBgColor\":\"#fff\",\"name\":\"Exit-no\",\"icon\":\"Circle\",\"iconStroke\":\"#ffffff\",\"mainBackground\":\"#ffffff\",\"width\":230,\"height\":40,\"configData\":[{\"title\":\"Name\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"text_field\",\"section_id\":\"c2fae041-4a37-475b-8482-58e6cb410c31\",\"meta_code\":\"block_name\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"47be2b5c-a13e-4fb4-be2c-3465c24b9195\"},\"data\":[{\"default\":\"\",\"value\":\"Exit-no\"}]}]},{\"title\":\"Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add Response\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"initial_questions\",\"section_id\":\"0dfbab6e-71f0-45cf-bcaf-be577266895c\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"2f8782d2-00c1-4ab6-a599-c51ccc8cba5f\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"B1wtd13sjGu2k9plBsDg2vVrDo9sjCxAzmpe\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Sure. No problem.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"cfc4a16c-cc31-4056-a0c1-b86485feedab\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Processing Pipeline\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"intent_level\",\"section_id\":\"f8768fe7-59e1-4d60-832d-3be399e533e3\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"b1e53463-14a1-4c1b-970e-979f165be80e\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_2_training\",\"element_id\":\"d84fd0db-6eb1-4671-9875-e69d6fb0dd12\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Fact Base\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_area\",\"meta_code\":\"intent_level_2_knowledge_base\",\"element_id\":\"23422329-c483-40ec-ba3c-d1e7fb495f6c\",\"default\":\"\",\"value\":\"Fact Based Passage\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_2_training_gate\",\"element_id\":\"618bc1f4-1f16-46d3-bc7b-669fd435febf\",\"default\":\"\",\"value\":\"Fact Based Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"5b5d8c5d-99de-438c-899f-e33e7c6da441\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]}]}]},{\"title\":\"Final Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"final_responses\",\"section_id\":\"46929773-6fe8-42bd-a3c3-e7147ae53bdf\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"6b0e1aec-36ba-443e-8353-5033c56431e3\",\"default\":\"\",\"value\":\"Final Response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"8d7b2d82-b3e8-44cb-9491-10594937c808\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Webhooks\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"container\",\"meta_code\":\"webhook\",\"section_id\":\"60ca66c3-6b26-4872-b028-914df09e05e6\"},\"data\":[{\"ui_metadata\":{\"type\":\"container\",\"element_id\":\"9af60c29-5a37-4d27-b2d6-8f2368f503b4\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false,\"pagination\":false},\"data\":[{\"ui_metadata\":{\"type\":\"text_field_dropdown\",\"element_id\":\"7481f99d-9467-4abf-9b4b-5def7c39e807\",\"value\":\"URL\",\"values\":[\"GET\",\"POST\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":{\"text_field\":\"\",\"dropdown\":\"GET\"},\"value\":{\"text_field\":\"https:\\/\\/some.url-comes.here\",\"dropdown\":\"POST\"}}]},{\"ui_metadata\":{\"type\":\"text_container\",\"element_id\":\"e36d1bb1-6c6d-46bb-ba2d-8e001a3e8dba\",\"value\":\"Headers\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"c50a9144-8977-40d3-a9c1-aecd722202ea\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Header\",\"header\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_area_json\",\"element_id\":\"99cc648d-f7a8-4f31-b63f-e4ba37b000d5\",\"value\":\"Request Body\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"default\":\"\",\"value\":\"{json text with escaped quotes comes in here.}\"}]}]}]},{\"title\":\"End Conversation\",\"ui_metadata\":{\"cta_presence\":true,\"draggable\":false,\"section_types\":\"boolean_container\",\"meta_code\":\"end_status\",\"section_id\":\"13e68737-0387-4fbc-8e89-b9b49581f80e\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"createUUID()\",\"default\":\"\",\"value\":\"End\",\"can_be_deleted\":false},\"data\":[{\"default\":\"FALSE\",\"value\":\"false\"}]}]}],\"loc\":\"738.9349969579522 -396.60526661108025\",\"topArray\":[{\"portColor\":\"#F76415\",\"portId\":\"input\"}],\"bottomArray\":[{\"portColor\":\"#F76415\",\"portId\":\"Fullfilled\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"TCH\",\"portTextColor\":\"#777777\"}],\"agent_id\":\"false\"},{\"key\":\"64184a31f5d0691ca8328717\",\"type\":\"iu\",\"panelShape\":\"Rectangle\",\"panelWidth\":230,\"deletable\":true,\"panelBgColor\":\"#fff\",\"name\":\"Default fallback\",\"icon\":\"Circle\",\"iconStroke\":\"#ffffff\",\"mainBackground\":\"#ffffff\",\"width\":230,\"height\":40,\"configData\":[{\"title\":\"Name\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"text_field\",\"section_id\":\"ce170205-8876-4ad9-b3ce-ed3e022216a5\",\"meta_code\":\"block_name\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"a078221f-ce2f-4f19-bd06-cfa8c6716641\"},\"data\":[{\"default\":\"\",\"value\":\"Default fallback\"}]}]},{\"title\":\"Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add Response\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"initial_questions\",\"section_id\":\"83e3f56c-684f-4245-80c6-2c2e76b29eb2\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"c0eaeceb-c8ac-4db0-822e-184b6dad3a51\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"SKZ55LkCERceA94E7rcuQWjjOfW6PSFJkdCs\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I\'m not sure what you meant.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"01bef6bd-03f9-418a-9033-b09064cba303\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"3SynOe80H0v4aezf6VXkJKFaka0QwSNHqVKR\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":true,\"display_checkbox\":false,\"checkbox_value\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"3SynOe80H0v4aezf6VXkJKFaka0QwSNHqVKR\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Processing Pipeline\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"intent_level\",\"section_id\":\"a7eca44a-5752-4081-8a0c-1f8be90a7bfc\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"37ce2ae0-a0b1-4b61-9b68-09b8c6229933\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_2_training\",\"element_id\":\"ada03a63-8f0a-4c09-bf99-f4b5f44cfdab\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Fact Base\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_area\",\"meta_code\":\"intent_level_2_knowledge_base\",\"element_id\":\"557e0b14-52c4-485f-aae0-90c494555646\",\"default\":\"\",\"value\":\"Fact Based Passage\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_2_training_gate\",\"element_id\":\"b648a6ca-e695-4e19-9961-46704ac39956\",\"default\":\"\",\"value\":\"Fact Based Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"c07720b6-ee4e-4d56-8798-1afff317f222\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]}]}]},{\"title\":\"Final Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"final_responses\",\"section_id\":\"121e3ad4-1ec7-4780-bf65-9ea23618de6f\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"e4905836-57d6-45c8-b50a-63e8b6544a1d\",\"default\":\"\",\"value\":\"Final Response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"94d25431-06fa-46a9-aca4-c37014b30d93\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Webhooks\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"container\",\"meta_code\":\"webhook\",\"section_id\":\"7d930773-ca0a-4d6e-b181-01c4d130e6d0\"},\"data\":[{\"ui_metadata\":{\"type\":\"container\",\"element_id\":\"0bdc23ff-4da8-4bd9-8bab-d53753f62705\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false,\"pagination\":false},\"data\":[{\"ui_metadata\":{\"type\":\"text_field_dropdown\",\"element_id\":\"b1781849-b645-44b6-9dc4-6faf29cfea02\",\"value\":\"URL\",\"values\":[\"GET\",\"POST\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":{\"text_field\":\"\",\"dropdown\":\"GET\"},\"value\":{\"text_field\":\"https:\\/\\/some.url-comes.here\",\"dropdown\":\"POST\"}}]},{\"ui_metadata\":{\"type\":\"text_container\",\"element_id\":\"7591024f-3a85-4fdd-b83c-80a5704e93d9\",\"value\":\"Headers\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"a5f3ff31-42cc-48cc-b716-ddae8b5e6247\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Header\",\"header\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_area_json\",\"element_id\":\"be6290f5-bc2a-408f-934c-0f03dcd0ba69\",\"value\":\"Request Body\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"default\":\"\",\"value\":\"{json text with escaped quotes comes in here.}\"}]}]}]},{\"title\":\"End Conversation\",\"ui_metadata\":{\"cta_presence\":true,\"draggable\":false,\"section_types\":\"boolean_container\",\"meta_code\":\"end_status\",\"section_id\":\"a4acded0-ad32-4ac3-b4e0-bfc6bc3f1b4d\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"createUUID()\",\"default\":\"\",\"value\":\"End\",\"can_be_deleted\":false},\"data\":[{\"default\":\"FALSE\",\"value\":\"FALSE\"}]}]}],\"loc\":\"286.8092197495605 -536.745161247464\",\"topArray\":[{\"portColor\":\"#F76415\",\"portId\":\"input\"}],\"bottomArray\":[{\"portColor\":\"#F76415\",\"portId\":\"Fullfilled\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"TCH\",\"portTextColor\":\"#777777\"}],\"agent_id\":\"false\"},{\"key\":\"64184a31f5d0691ca8328718\",\"type\":\"dm\",\"panelShape\":\"Rectangle\",\"panelWidth\":300,\"deletable\":true,\"panelBgColor\":\"#fff\",\"name\":\"Pricing discussion\",\"icon\":\"Diamond\",\"iconStroke\":\"#ffffff\",\"mainBackground\":\"#ffffff\",\"width\":300,\"height\":40,\"configData\":[{\"title\":\"Name\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"text_field\",\"section_id\":\"3b1db912-a355-4c34-b4d8-cf8722add054\",\"meta_code\":\"block_name\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"beb424f7-84a6-4c8e-8839-edf2f829560a\"},\"data\":[{\"default\":\"\",\"value\":\"Pricing discussion\"}]}]},{\"title\":\"Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add Response\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"initial_questions\",\"section_id\":\"1ece4ed9-eecf-46b8-b462-94d081f11504\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"204d2225-3ce3-46dc-a453-596f9d4b4e03\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"eeWyhngdbmIk0YEkdsoP4MaGM27FaJJ0CVHi\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"No Problem. Let me generate the quote for you.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"50db375c-af8f-4dad-bebb-d2339a84bbb0\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"sI5ZbZKfKysFiNVh40etCHk3HA7xYCmwpUG0\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":true,\"display_checkbox\":false,\"checkbox_value\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"A8dBzkSxH4cp8k7UVuaAmKkXxO7W84Fx9Fdc\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"The calculated premium is $[[webhook.price]] per annum.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"sI5ZbZKfKysFiNVh40etCHk3HA7xYCmwpUG0\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Processing Pipeline\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"intent_level\",\"section_id\":\"1794e842-d602-415b-9a73-9b3829641980\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"c37e95dd-97ef-4b3d-9044-9a724ae10abf\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_1_training\",\"element_id\":\"10a26928-d6de-4995-bec9-5471e01107fe\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Change Topic\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"3ab61e15-b860-4534-8767-9fe672ddad42\",\"default\":\"\",\"value\":\"TCH Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"0cc2fc52-a4a6-45dd-9c4c-38b2dfdb816e\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"94bd3df6-cf2a-46f0-942e-557dc0ee596c\",\"default\":\"\",\"value\":\"TCH Classification Direction (Enable to include)\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"dfe0cf3b-3e31-4e85-a4ee-f63f8705e75c\",\"default\":\"\",\"value\":\"Detect Exit Conditions\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_nlu\",\"element_id\":\"f96a365b-99e5-4217-8efc-9f82cd3a9737\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"NLU\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"4a480bc9-fc96-4e10-bba1-d47775901c83\",\"default\":\"\",\"value\":\"Combine\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"false\"}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_3_training\",\"element_id\":\"125bb1ef-b059-42c8-9c62-a98718bee8fd\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Meta Actions\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"meta_code\":\"intent_level_3_training_rephrase_request_boolean\",\"element_id\":\"b9dd0844-bb84-4f26-b71a-e2ee3e2965ad\",\"default\":\"\",\"value\":\"Rephrase Training Data\",\"can_be_deleted\":false,\"help_text\":\"some help text about this element\"},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_3_training_rephrase_request_data\",\"element_id\":\"27c70cf0-2e56-4982-920e-f521403d424d\",\"default\":\"Custom Data\",\"value\":\"Rephrase Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"6aee610a-7f01-4a4a-9a6e-aa05ecef3878\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"meta_code\":\"intent_level_3_training_change_request_boolean\",\"element_id\":\"572d5115-8437-46f6-854c-336b6154ad97\",\"default\":\"\",\"value\":\"Recorrection Training Data\",\"can_be_deleted\":false,\"help_text\":\"some help text about this element\"},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_3_training_change_request_data\",\"element_id\":\"f11f8bb8-6005-48b1-ad67-4a8e36dfcc56\",\"default\":\"Custom Data\",\"value\":\"Recorrection Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"0c250dff-231a-4911-b33b-1e07933dbc88\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"db60fca4-b00c-4cc3-bf29-e0156fa060ce\",\"default\":\"\",\"value\":\"Classification Direction\",\"can_be_deleted\":false},\"data\":[{\"default\":\"false\",\"value\":\"\"}]},{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"9bb4139c-5acc-4b72-b787-b9d31ffbffa9\",\"default\":\"\",\"value\":\"Self Correction Training data\",\"can_be_deleted\":false,\"help_text\":\"some help text about this element\"},\"data\":[{\"default\":\"false\",\"value\":\"true\"}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_2_training\",\"element_id\":\"cde93531-adb6-45df-84f8-4590af58dc97\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Fact Base\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_area\",\"meta_code\":\"intent_level_2_knowledge_base\",\"element_id\":\"07cd8d1a-371a-4179-8962-fbb5b8f1fa01\",\"default\":\"\",\"value\":\"Fact Based Passage\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"The pricing is only for the configured home insurance. We do not provide other insurance policies.\\n\\nPricing or cost breakdown:\\nYou have [[webhook.damage_coverage_reason]] which costs [[webhook.damage_coverage]].\\nYou [[webhook.legal_services_reason]] which adds [[webhook.legal_services]].\\nAlso, you [[webhook.emergency_cover_reason]] which adds[[webhook.emergency_cover]].\\n\\nTotal price: [[webhook.price]]\\n\\nSummarize the prizing breakdown when asked. All the figures are in USD.\\n\\nPricing does not include taxes. Taxes are 7%. Then the pricing would be 7% added to [[webhook.price]] .\\n\\nIt is possible to modify, change or cancel the purchased policy before the effective date. The effective date is one week after the policy has been purchased.\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_2_training_gate\",\"element_id\":\"81855143-33cc-4bbc-9e08-3a6c85e8184d\",\"default\":\"\",\"value\":\"Fact Based Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"0bff4c46-fe7c-4256-b707-a76dea0a91e0\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]}]}]},{\"title\":\"NLU\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"cta_types\":[\"synonym\",\"regex\",\"intent\",\"date\",\"name\",\"email\",\"phone\",\"any\",\"yes\\/no\",\"city\",\"country\",\"duration\",\"zip code\",\"age\",\"currency\",\"numeric\",\"void\"],\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"field_fillers\",\"section_id\":\"498fdae8-984c-4155-9ce5-5db530da0e75\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"78962fe9-d801-4902-8f3d-4fcc957ed5c1\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"element_id\":\"w93DTYwXfqxmnB9XWojP2wem9IoW2pOOMkCj\",\"ui_state\":\"view\",\"can_be_deleted\":true,\"default\":\"\",\"value\":\"quote proceed\"},\"data\":[{\"ui_metadata\":{\"type\":\"dropdown\",\"meta_code\":\"nlu_type\",\"element_id\":\"yVu8s3lle2X8v8PSyHQFCdJeKchJjA4q2l9j\",\"value\":\"Type\",\"values\":[\"Date\",\"something\",\"another\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":\"intent\",\"value\":\"intent\"}]},{\"ui_metadata\":{\"type\":\"text_field\",\"meta_code\":\"field_meta\",\"draggable\":\"false\",\"element_id\":\"ujiPBVi23DId0sZlDgmetQU8uFdftaFIFrZY\",\"cta_label\":\"\",\"cta_presence\":\"false\"},\"title\":\"Slot Name\",\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"x6mHdamRhoLSvVhrrTtAsCqpduI2HhNVwLUo\"},\"data\":[{\"default\":\"\",\"value\":\"quote_proceed\"}]}]},{\"ui_metadata\":{\"title\":\"Questions\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"question_list\",\"value\":\"Question Set\",\"section_id\":\"4AQH2zgSMbJjG8jKAFNUdGqE3L1YQcSxVeLw\",\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"xTqhqwmV4m0DHBMwcGcD71CnJbF31NAtahFt\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"acix6p4krdMHGt6OmugnBWX0c6HqioNNCvwJ\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Do you want to proceed with this quote?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"JsVWscSEF89ro3kcePWop2c9mekej7DG7LqJ\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your question here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Connecting Phrases\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"connecting_phrases\",\"value\":\"Connecting Phrase Set\",\"section_id\":\"XprW1SJiYutgvhgStdYdHuO9GoAWOc8BDuQC\",\"section_enabled\":true,\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"vkc2m15AdtqtiYz1iqcpNKC3CGZmuMJDeGC4\",\"default\":\"\",\"value\":\"Connecting Phrase Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ue5y51bgaOHHNdjceAkOPOYNBfa6STO7UJwq\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"So, do you want to proceed with the current quote?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"FbGHtikLrdzaHCqHHRMGO7aY8XjTzej0yTTI\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your validation here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Followup\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"followup\",\"value\":\"Followup Question Set\",\"section_id\":\"XIXXeNsp27z9nO8IvMxd74ltKpUjmSUBxFeI\",\"section_enabled\":\"false\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"TgPMcDsC7IbzGyVOkRHvD6jWycQvx9ofih2b\",\"default\":\"\",\"value\":\"Followup Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"YkWT1OS3hufL3P3dYrfDT782s2gvxqbxnLEY\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your followup here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Required\",\"default\":\"\",\"type\":\"boolean_flag\",\"meta_code\":\"required\",\"element_id\":\"qJe2asr1PKLCyle5BqC0OUK38FnaeB8PZWkY\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":\"false\"}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Auto Rephrase\",\"default\":\"\",\"type\":\"boolean_flag\",\"element_id\":\"U6Hl6uadSqnfz6lNQBnSNa5xvs6lvwtOqNQ9\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":false}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"default\":\"\",\"type\":\"multi_string\",\"value\":\"Identification Tags\",\"meta_code\":\"identification_tags\",\"element_id\":\"yBCDZByNLOxMOkQ3fEjdjWlcXvv9C7x2igtr\",\"ui_state\":\"new\"},\"data\":[{\"default\":[],\"value\":[]}]},{\"ui_metadata\":{\"title\":\"Intents\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"optional_config\",\"meta_sub\":\"intent\",\"value\":\"Intent Set\",\"update_status\":\"FALSE\",\"editable\":true,\"section_id\":\"y4umiEteQUmLf968hNSjqxh7dWq9voBt2PQP\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"fNG4XpytqzWvHn3iYGogEZyAYF3W2FE315og\",\"default\":\"\",\"value\":\"quote_proceed_yes\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"LhZHN0P3rVeunko1aWyLLJJTWqubRbajoxQ7\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"yes\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"keht1lCI2L1GnbQFqfKdR9alQJWvKDgKjMXb\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"sure\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Pf87r2t21geAB2lLBRIUe3bQhqz6zKyHAgrX\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"of course\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"YlcOAMVP1Cu57QN8X9qvUeEevL45UUrZtRyv\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"sounds good\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ioZq6CMFT4bEuHz9p7afTFy9mbAUubn4ucEF\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"proceed\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"fHtLnyVZimFYgxblQPT1xKjnJYoSL3cFcB2s\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i want to proceed\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ntXjgB8HKLcVPNNbRg70NiawvHw27JQ9oF5s\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no problem\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"RvHLnel2YyIRGzJayMDrXS6tYBCzZbZT03NS\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"that\'s a good idea\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"XGnodeAGZR5SbQNbMal0UodiwsXPX6OOxydX\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"why not\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"wtj6Aj77SFoXyfLi1NKKZlHPwSdPOddtxJjP\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i want to proceed with the quote\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"6503zHA4NHOBL5LmdCTAjvZvSQBwCzLCUSiv\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i am ok with the quote\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"XPfrrO2VtIYqVTrFXnOj9baw4hubl7dsZV0F\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"sounds reasonable\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"uqxgtbwNMPGMv1mjgELAmRb4WCfQ4QZ6nblt\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"ok\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"zy2eOrFVAeQuaSaZ49YASruxgf30tzHVHAk6\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"yup\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"uqkn6GkHpKO3v5N5OLZ1bifIVZlbgcbxPhbD\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"let\'s continue\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"nqtFl1lPtpN7BECCj8Cow7AUp3Q5X3Zx1Jel\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"it is amazing\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"RPIHbxgwLOTYAcQifx45w7NICNXz33kfKyQm\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"awesome\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Z6XrvoAZ5X9MtDg58CK41Sci4oecC0EKgSph\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"great\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"lul1DgtXXY7NIvn7rMITLOoDDiXSG460200x\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"cool\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ucfWJAjVtwlBKn1D8ymfdDbUfeoqFpNuipmq\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"hLQXMhRLYUE3UWxJqTGRQUFsCjkEZsDvYZ7q\",\"default\":\"\",\"value\":\"quote_proceed_no\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"v7i2oxpzDXLxDMgCRDOsGK5yVxYP2USUKHWi\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"VVGDRXv34FiD4W8iXAI4MLCMvsGdxMNH3st8\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"nope\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"J5Q70x5bEAS4i7H1PjUWTYGAQuLutETmW5sg\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"price is too much\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"bO4W80izvAcZQ9plxaWFTX4w45eQiHcsU7Cg\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i don\'t want to proceed\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ZVNl054gcmD9dRrLnTngiis9OrKTotLYoSsA\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i don\'t want to buy this policy\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"01SN5VDZBidHyLGa6yRi2mow7eotWmjJYq89\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i don\'t intend to proceed\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ErtnwU1vX2h2UrYXiOde6vr2cBj3Lf9bgxoB\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"let\'s not continue\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"smImWTh3reiYLBWYzpBoMrPysfSr2tGccgva\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i am not happy\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"FZKBo946yfGpoCzkrRIvkLr7UzTZlOnkmNXe\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"too expensive\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"EwYl3JUcLHynn9BcBXcptrWU7q9FOZnwdrIq\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"not a good idea\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"2NdqBz5ix8p0Y6bFTb8qqNiEA3bA7EsU01kv\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i don\'t want to proceed\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"BLNps3rPQHR98SMJ8OshXmQHezp0VmVboBsQ\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i don\'t like it\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"S8CUnrGDiqgUZPQV03OSwTVQOtojdzPmtpJi\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"I wish the pricing is low\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"FYPfGP6neHRHX29CyoXp9o4w0Kq1ngTPB5at\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"YO5cYKKXcLjrbxsexxPdynqOq8vNm5NN14PM\",\"default\":\"\",\"value\":\"quote_proceed_restart\",\"can_be_deleted\":true,\"pagination\":true,\"download\":true,\"upload\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"JCQdGkowYWYmLcmYSAbzMSP2lj28c58ubYZc\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"let\'s try again\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"2lGNAz1XeIzIEjllKGLwD2tQOd11BdocdciX\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"can we try again\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"nG50O755dazKLGKvcL9VsZhH41G1gICSirWc\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"shall we try again\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"AKwEwFuRB6mNzzD3JUVUjsN0lhjnTRiCIsjf\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i want to go back\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"m2SlqmMmK2PqdxL4OgXn9MUfvoCLApQd3qIG\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i want to choose different options\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Dhu6yKSMzE1Wb205mgC5xvI4bptcnQ5nOnZg\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i want to change my selection again\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"1YHulMrmTr7GGBTTbqTgSelf28RWg4PvWkCY\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"can i change my settings\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"mzKCKnMgEno9L2l2Gy1fIiGXp50Yygouvqod\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"let me try again\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"1dAI546gWmxeZpd9Guou6XcdaX5yCYO7cYc6\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"let us do again\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"mxuEKuThC72cPPaVaeAVnqh2UyU0m5oImPOy\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i want to change standard cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"R603faZqIukhN30Jt3qKdLTKkukCIGW94Kay\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i want to change legal cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"xHF7oAjM4joGl3aDmUszuvKO8ztJJHpPYWy0\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i want to change damage cover\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"HV35CcbZIgnpfqgsIvQkRfu1Ebk2gS2oGjpy\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i want to remove emergency cover \"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"RjoqH3M9sNitQ3HiVerDfKSG564SVj7Fz60f\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i want to remove some of the options\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"Fr4U4LKydNFZiCAiGg5VmzjMwgyyeqJUUcZd\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"restart\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"WCTILUTS0PYTVCvhLIb0upMx3y3g0TmXiN8f\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"let\'s restart the whole thing\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"YO5cYKKXcLjrbxsexxPdynqOq8vNm5NN14PM\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]}]},{\"ui_metadata\":{\"type\":\"draggable_bar\",\"element_id\":\"GqEJnpgHy3kiW39vJEOLvKVvMwdPMkdqEsaJ\",\"ui_state\":\"view\",\"can_be_deleted\":true,\"default\":\"\",\"value\":\"try again\"},\"data\":[{\"ui_metadata\":{\"type\":\"dropdown\",\"meta_code\":\"nlu_type\",\"element_id\":\"BGXFPVbFcLp5YRwSEK7NpKuf8fFcycEo4gZD\",\"value\":\"Type\",\"values\":[\"Date\",\"something\",\"another\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":\"intent\",\"value\":\"intent\"}]},{\"ui_metadata\":{\"type\":\"text_field\",\"meta_code\":\"field_meta\",\"draggable\":\"false\",\"element_id\":\"j5RvCdt1xONeJzlsgGatycM9cn1GM7iO0B1E\",\"cta_label\":\"\",\"cta_presence\":\"false\"},\"title\":\"Slot Name\",\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"p3M5ALQXAJUHABWLnciBpBVkjL1ZpYAIFLjt\"},\"data\":[{\"default\":\"\",\"value\":\"try_again\"}]}]},{\"ui_metadata\":{\"title\":\"Questions\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"question_list\",\"value\":\"Question Set\",\"section_id\":\"n0No0UTAaREHFruI3d66JnB3QbiBDhOldbvh\",\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"Ly84k6k8wxdIrpY2cmTw2iggQNG5CZy0acin\",\"default\":\"\",\"value\":\"Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"heE3s8ldtPH1W7Py2GSROQZumRZNSYsfwv2b\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Do you want to try again?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"a4jzn1p5Yq6M4BOw85VlbQ5yv4TvVwOXK2uS\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Shall we try again with a new quote?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"jlxDl4oI4mR3z0oSAUgxjS1r942ePJG4sMxi\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your question here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Connecting Phrases\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"connecting_phrases\",\"value\":\"Connecting Phrase Set\",\"section_id\":\"bIVZ8JBJnl6FoY5xjYBfnn6f6LZYZWfqmRyV\",\"section_enabled\":true,\"update_status\":\"TRUE\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"B9HYhVo2LM1l8XeZ0EWoz0ViLXw74dtzk3D9\",\"default\":\"\",\"value\":\"Connecting Phrase Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"G1DYTmAzO2J5EVRa4tBx6MDcWDrZAQKSUo9T\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"So, you want to try for different quote?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"excfalqI3gYjvCIr0OG3bqM3oRpid3IctGhu\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"So, you want a new quote?\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"ghCkZbKD1ZnLl0ifnTUkGQfYC74VgsHbM2TC\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your validation here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"title\":\"Followup\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"followup\",\"value\":\"Followup Question Set\",\"section_id\":\"66B7H9IsOTRBp3rYTgpowps2tF28GeAi22lz\",\"section_enabled\":\"false\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"dVdgzqbU4SNK2Bs9iMugLNtlj2B8aSJ0cR3i\",\"default\":\"\",\"value\":\"Followup Question Set\",\"can_be_deleted\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"RBuiD5c7VY3A7a3cLs9dhyipnggV7vU93MBP\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your followup here\",\"value\":\"\"}]}]}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Required\",\"default\":\"\",\"type\":\"boolean_flag\",\"meta_code\":\"required\",\"element_id\":\"9QTYzXD2PLWxqlezbm9LL9OSJVB2ULXDtPYM\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":\"false\"}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"value\":\"Auto Rephrase\",\"default\":\"\",\"type\":\"boolean_flag\",\"element_id\":\"qCO31wPUA36gughsPs9QccgrHfoxP69a3N6E\",\"ui_state\":\"new\"},\"data\":[{\"default\":false,\"value\":false}]},{\"ui_metadata\":{\"can_be_deleted\":false,\"default\":\"\",\"type\":\"multi_string\",\"value\":\"Identification Tags\",\"meta_code\":\"identification_tags\",\"element_id\":\"5FLvRL0wLsHsoFXb2CHLnDHpILGjWwxhGuTF\",\"ui_state\":\"new\"},\"data\":[{\"default\":[],\"value\":[]}]},{\"ui_metadata\":{\"title\":\"Intents\",\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":false,\"type\":\"text_items_container\",\"meta_code\":\"optional_config\",\"meta_sub\":\"intent\",\"value\":\"Intent Set\",\"update_status\":\"FALSE\",\"editable\":true,\"section_id\":\"3PsaNvon6jpJWdK3s4HcDOclQXTILmXUVv77\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"pZ0WMwUkqHx1v1ZTUXhx7PZ7l1sDXj5HySIT\",\"default\":\"\",\"value\":\"try_again_yes\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"OdRea3qXGTHAUKSavrvH6dE23iOm24Tn98Ai\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"yes\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"bdojttZDYV86rELmJjfIMBN9rj0zqb0tMRL2\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"sure\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"ogZzEdj2eqJz70azGi3lH5l9VQHzMLP7gRx2\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"of course\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"oOKBjIA1gIKLTdRgGM8nNGN2Nn1XkIrDuv2h\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"sounds good\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"egK2YR4q0R1PaNnzyHXwMuvpfsB6mESJTvi9\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"proceed\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"VAevM3AanbT8wRY9EWuh8ujqFgEseYVd0Sx2\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"no problem\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"p8088Ahr9yfB2TWSCjv0ZjexuazdDuJP9fvk\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"that\'s a good idea\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"gfYpmmuZoNSib6u8J9nRnT8kFvoAVp5G7Euj\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"why not\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"vSeVpCtelL1l5eaFiFYJ2NwkIOKzKQt2MhX8\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"i am ok with the quote\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"VKyfxoH2DQ4KBVW1vDAbFaJQVhZLKGkGhg5A\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"ok\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"yXMsHQdElyXB1Ucl18PEmidYITiYDDntJyYw\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"yup\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"u5tbk8rUCsg8pJrGDgqfScs3ibYy5vQawOf4\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"let\'s continue\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"6ri9D2R1KKBfjSgGgVl1EdD5d25SD8QdIuYC\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"it is amazing\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"Pn3eP4qbX0Iu9S4ESgLP7zdUEsGbk5FVMpbc\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"awesome\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"9vfbB8niR0vPhU2IKh5zmZpZXpditzBylaew\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"great\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"R1ZB06nNFvO8dSqNXds1KSJg0DZYIUrUMIGX\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"cool\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"N2iTBejRbqnMes722fnjo3sfEnkkXrxUSoJ7\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"yes let\'s do it again\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"PsPPlzVDa32inl1enBsQK8jgeFqo2XrMWY8d\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"try again\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"uAWjZFaMxTOPTAJFmoTWUkm8bjUCMk4lkGYt\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"yes i want to change a few options\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"xzdZtePMYliqUGcsqBSZnwHfURZfdzp5oQQL\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"yes i want to change something\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"XliUkB2zsS5i86eVjrK8sIy6t5pOY8FyLYR4\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"go ahead\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"IlI4ge9UxiWv6uhiJYFzyLkhkRK7q8KQKki7\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"ZIAsgihdDa0TH7WRV0T4FEFa1PFVsmM7t8zq\",\"default\":\"\",\"value\":\"try_again_no\",\"can_be_deleted\":false,\"pagination\":true,\"upload\":true,\"download\":true},\"data\":[{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"BmuO2WgMXTJb1BFWpjCsuF0Oy6qYuYnpQzD0\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"no\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"2T0KTxsM64t4b9mkFnPo64gROJsdsrdk4b6T\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"nope\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"HR9Wod9haCgWkDrwX3dqfE9vrwPAyBcibSs5\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"price is too much\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"bH6GCN4GTvclaqtliIEjqEHj0l8zg41ORlQ9\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"i don\'t want to proceed\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"RWqwOF58cdFQwTDXXwIpIr8fcQS4aoJkGrZw\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"i don\'t want to buy this policy\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"qpbY6WleYIv1bz92x5jXvQl8TS5ES46ESAu0\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"i don\'t intend to proceed\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"FHKGA5P4NhHg2dEYZ6DUPhFUCkJlvMuHmGE7\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"let\'s not continue\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"f0Eg30co8E4fvVvgW9act5j0qkZrdClzZqVa\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"i am not happy\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"vhsMuU9gCkCdBMfgJVyFaOR1Zds49bIHiarz\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"too expensive\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"B63vPY6y30nxk38Y7B9NJBHJ5epVsQd663Lc\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"not a good idea\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"8t3cGxdKy3c1hRnq73PVX9KAWdj9C1v4RETq\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"i don\'t want to proceed\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"qMteSCblS8zjfNOBmD92Lu10BZ17IBdti5DU\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"i don\'t like it\"}]},{\"ui_metadata\":{\"can_be_deleted\":true,\"element_id\":\"QhATTVXatz4Z4G4gop1Ml9BqUp8dmh8iiWKZ\",\"type\":\"editable_text_field\",\"ui_state\":\"view\"},\"data\":[{\"default\":\"\",\"value\":\"I wish the pricing is low\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"RdbmleRYZLRkcu6N0GlByqBhluc9CgLkaxU5\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i don\'t want to try\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"hbxRnjo9JNFLumUWieSmXekXhsjYJFdAtkoV\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i can\'t try again\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"pKk9Sy8dH3sgsWVEcgDxLmJ0NpXnkLtQO8Sz\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i\'m done\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"mnXbMa6Upao45fJtBkuZeXtTvXxXmQotT9qc\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"end\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"8tB4BA1RVQqk0q5jNT0jSAWDyPCqU47ARZTW\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"finish\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"CK6prW9E4ul3GG2r01V4rrCA0Z5HwXQwrCZY\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"end the chat\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"XHv2ELzVzvtAdXBnyv7mrJP5Z3TUgmaJXMIy\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"i cannot do it again\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"0uexqzALwK52BqnlRuhKqga63p0QWM44wVqe\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no i\'m fine\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"7jcR9QElg6ldO0JSFUubB848UNzvMnzCup8A\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"no i\'m good\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"FEZe85mFzbqUQykIMLW4eadtBvpfcvkG3HUT\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Enter your intent here\",\"value\":\"\"}]}]}]}]}]}]},{\"title\":\"Decision Outcome\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"decision_outcomes\",\"section_id\":\"de75e1b3-bf78-496d-897b-d267b23a83d3\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"4c25120c-764f-4945-9a7b-6393b896af0c\",\"default\":\"\",\"value\":\"Decision 1\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":true,\"checkbox_value\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"104bf48b-4c19-474e-ab28-079df5c6df93\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"quote_proceed_yes\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"c7e7d5d7-629f-4500-b095-6763775c24bf\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"8e0361a6-9c8d-42a5-a29e-fa0094fc2100\",\"default\":\"\",\"value\":\"Decision 2\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":true,\"checkbox_value\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"EcGti8Vn4tHxlFpUjuBLvfnDJF90A9zIxVY9\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"try_again_no\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"72b840f2-aa03-40c1-bf07-ad9ce26317ec\",\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"LaaArFeE43rm2nQCPBc0aH3t8ISMpbSEdwvn\",\"default\":\"\",\"value\":\"Decision 3\",\"can_be_deleted\":false,\"display_checkbox\":false,\"checkbox_value\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"0mPNi9uVob4wRbDuQsV1Cx8BUi1bGzDoqILB\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"quote_proceed_restart\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"8NteicL3q9Xm1oZkD9c9lraM3DAq82WI6wgw\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"try_again_yes\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"LaaArFeE43rm2nQCPBc0aH3t8ISMpbSEdwvn\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Webhooks\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"container\",\"meta_code\":\"webhook\",\"section_id\":\"a906248c-430c-4c02-a75f-41ce0dc11834\"},\"data\":[{\"ui_metadata\":{\"type\":\"container\",\"element_id\":\"2321675e-982b-4ec8-8410-be3aac8e1098\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false,\"pagination\":false},\"data\":[{\"ui_metadata\":{\"type\":\"text_field_dropdown\",\"element_id\":\"6b0db852-d1d7-46ac-b1e7-5ee65e83f312\",\"value\":\"URL\",\"values\":[\"GET\",\"POST\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":{\"text_field\":\"\",\"dropdown\":\"GET\"},\"value\":{\"text_field\":\"https:\\/\\/some.url-comes.here\",\"dropdown\":\"POST\"}}]},{\"ui_metadata\":{\"type\":\"text_container\",\"element_id\":\"964991ac-b54a-4927-890f-b6aad8c1708f\",\"value\":\"Headers\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"28d3079e-2708-4654-9c08-3cf90b44bd26\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Header\",\"header\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_area_json\",\"element_id\":\"a383ae25-e483-447b-819d-822d51608c5d\",\"value\":\"Request Body\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"default\":\"\",\"value\":\"{json text with escaped quotes comes in here.}\"}]}]}]}],\"loc\":\"-66.61486204773216 -622.9901991142382\",\"topArray\":[{\"portColor\":\"#F76415\",\"portId\":\"input\"}],\"bottomArray\":[{\"portColor\":\"#F76415\",\"portId\":\"TCH\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"Dec-1\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"Dec-2\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#f16423\",\"portId\":\"Dec-3\",\"portTextColor\":\"#777777\"}],\"agent_id\":\"false\"},{\"key\":\"64184a31f5d0691ca8328719\",\"type\":\"iu\",\"panelShape\":\"Rectangle\",\"panelWidth\":230,\"deletable\":true,\"panelBgColor\":\"#fff\",\"name\":\"No purchase - end\",\"icon\":\"Circle\",\"iconStroke\":\"#ffffff\",\"mainBackground\":\"#ffffff\",\"width\":230,\"height\":40,\"configData\":[{\"title\":\"Name\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"text_field\",\"section_id\":\"cabc2070-3c50-426a-abe8-582efd3b693c\",\"meta_code\":\"block_name\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"1b297bcc-e6f1-4f88-a12f-0a141a1370f6\"},\"data\":[{\"default\":\"\",\"value\":\"No purchase - end\"}]}]},{\"title\":\"Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add Response\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"initial_questions\",\"section_id\":\"0e8af7ee-05aa-4424-a40b-227ea80f1447\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"5eQw8fgvmeeuZomDlZ418QA28i4n6sosmuRt\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":false,\"display_checkbox\":false,\"checkbox_value\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"kmXrEEJ6HHfkq7IxdivWIL7qU2tPPiKv9ttf\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"You can visit our website to know more information about other insurance products.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"5eQw8fgvmeeuZomDlZ418QA28i4n6sosmuRt\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"036e1874-f7c7-4352-b6f0-2dbef0d95694\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":true,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"IxZZOBcN0ogc6UWBqmEwYpEjLPcLBXtTK5Nd\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Thank you for contacting General Insurance. Have a nice day.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"2dda774c-e119-4513-b2ca-97e8bdf31d58\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Processing Pipeline\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"intent_level\",\"section_id\":\"afbf2be4-53f5-4efb-8057-8cc65073a744\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"cc9c2fcc-1352-4ce7-a3d1-5cdd154f1f5f\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_2_training\",\"element_id\":\"babfdf33-3008-4cc2-a8e3-e10c007cb52a\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Fact Base\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_area\",\"meta_code\":\"intent_level_2_knowledge_base\",\"element_id\":\"e145bbf6-5be2-4747-95d8-e5d55cd6b92b\",\"default\":\"\",\"value\":\"Fact Based Passage\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_2_training_gate\",\"element_id\":\"14856543-15bf-4e79-be10-2d9aabe21fd2\",\"default\":\"\",\"value\":\"Fact Based Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"18c2d819-58b9-4a7d-be0f-1f9959c8d41b\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]}]}]},{\"title\":\"Final Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"final_responses\",\"section_id\":\"1ab749ed-b945-4aac-a9b6-f835fc4de636\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"9ec4d01a-6aaf-45eb-9575-245452d22998\",\"default\":\"\",\"value\":\"Final Response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"iCMW2nWwd4oIqdWjkj2KiL6xXwHj3b4Ni2Ic\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"<meta command = \\\"END\\\" \\/>\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"4fc841d1-3a99-4580-a130-7cad67263f01\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Webhooks\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"container\",\"meta_code\":\"webhook\",\"section_id\":\"99ec942c-693e-41b8-b89e-743136b65758\"},\"data\":[{\"ui_metadata\":{\"type\":\"container\",\"element_id\":\"3ca19405-a77f-41e8-ab4c-db79552af00c\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false,\"pagination\":false},\"data\":[{\"ui_metadata\":{\"type\":\"text_field_dropdown\",\"element_id\":\"5b2faca8-7f0b-494e-bbdd-417b6b24029a\",\"value\":\"URL\",\"values\":[\"GET\",\"POST\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":{\"text_field\":\"\",\"dropdown\":\"GET\"},\"value\":{\"text_field\":\"https:\\/\\/some.url-comes.here\",\"dropdown\":\"POST\"}}]},{\"ui_metadata\":{\"type\":\"text_container\",\"element_id\":\"ea013b8a-d369-4935-9b03-594bde742ea9\",\"value\":\"Headers\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"903be8e3-82b2-4e22-94e5-c189298cf7bc\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Header\",\"header\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_area_json\",\"element_id\":\"cab38553-378e-4f70-b44a-fb2aa3c3b39f\",\"value\":\"Request Body\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"default\":\"\",\"value\":\"{json text with escaped quotes comes in here.}\"}]}]}]},{\"title\":\"End Conversation\",\"ui_metadata\":{\"cta_presence\":true,\"draggable\":false,\"section_types\":\"boolean_container\",\"meta_code\":\"end_status\",\"section_id\":\"9c5869fe-7ce3-4f0f-8da4-bf14c0de7a8e\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"createUUID()\",\"default\":\"\",\"value\":\"End\",\"can_be_deleted\":false},\"data\":[{\"default\":\"FALSE\",\"value\":\"true\"}]}]}],\"loc\":\"107.72963629721697 -407.9929723219482\",\"topArray\":[{\"portColor\":\"#F76415\",\"portId\":\"input\"}],\"bottomArray\":[{\"portColor\":\"#F76415\",\"portId\":\"Fullfilled\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"TCH\",\"portTextColor\":\"#777777\"}],\"agent_id\":\"false\"},{\"key\":\"64184a32f5d0691ca832871a\",\"type\":\"iu\",\"panelShape\":\"Rectangle\",\"panelWidth\":230,\"deletable\":true,\"panelBgColor\":\"#fff\",\"name\":\"Transfer\",\"icon\":\"Circle\",\"iconStroke\":\"#ffffff\",\"mainBackground\":\"#ffffff\",\"width\":230,\"height\":40,\"configData\":[{\"title\":\"Name\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"text_field\",\"section_id\":\"d30b5d83-5666-4422-a8a7-8c1cd529e3ba\",\"meta_code\":\"block_name\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_field\",\"element_id\":\"07370341-cf55-4756-b624-d3935f8823c3\"},\"data\":[{\"default\":\"\",\"value\":\"Transfer\"}]}]},{\"title\":\"Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add Response\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"initial_questions\",\"section_id\":\"3294be67-9086-4696-af25-ae8e02b635ef\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"ae386113-95cd-431c-8ccf-344ad9841cac\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"xSX6Et9qdvmA3ktaZuwIpQk40Fx7cXxniCJf\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"Okay, in that case, let me get you transferred to my colleague who can assist you better.\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"9db167f7-0441-49ed-b733-52ebcfe59ffe\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"UYhJkimrWZdEngPP73S3JFtIjF5u5aKiBCe5\",\"default\":\"\",\"value\":\"Initial response\",\"can_be_deleted\":true,\"display_checkbox\":false,\"checkbox_value\":false,\"pagination\":true},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"UYhJkimrWZdEngPP73S3JFtIjF5u5aKiBCe5\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Processing Pipeline\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"draggable_bars_container\",\"meta_code\":\"intent_level\",\"section_id\":\"2a812a65-a43d-4758-86a6-a51cffc9f0a6\"},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bars_container\",\"element_id\":\"b3ec57d5-f764-49c1-b6c1-82441ee8f3df\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false},\"data\":[{\"ui_metadata\":{\"type\":\"draggable_bar\",\"meta_code\":\"intent_level_2_training\",\"element_id\":\"5aa69202-5c7d-4941-9175-456bf2353649\",\"ui_state\":\"read_only\",\"can_be_deleted\":false,\"default\":\"\",\"value\":\"Fact Base\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_area\",\"meta_code\":\"intent_level_2_knowledge_base\",\"element_id\":\"8deb1407-f8b8-4d0a-a125-44f7c8214fa6\",\"default\":\"\",\"value\":\"Fact Based Passage\",\"can_be_deleted\":false},\"data\":[{\"default\":\"\",\"value\":\"\"}]},{\"ui_metadata\":{\"type\":\"text_items_container\",\"meta_code\":\"intent_level_2_training_gate\",\"element_id\":\"f960a621-a225-4468-b84c-7c184c7b9879\",\"default\":\"\",\"value\":\"Fact Based Training Data\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"5514d069-d723-43f8-9044-201b3a9e9af1\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]}]}]},{\"title\":\"Final Responses\",\"ui_metadata\":{\"cta_presence\":true,\"cta_label\":\"+ Add More\",\"draggable\":true,\"section_types\":\"text_items_container\",\"meta_code\":\"final_responses\",\"section_id\":\"239b6843-fef9-4799-a88b-b621a8312032\"},\"data\":[{\"ui_metadata\":{\"type\":\"text_items_container\",\"element_id\":\"59fb22fc-45ec-459b-ba13-011a756a9343\",\"default\":\"\",\"value\":\"Final Response\",\"can_be_deleted\":false,\"pagination\":true,\"display_checkbox\":false,\"checkbox_value\":false},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"KB7imuv3MhKgznziLvvLyshpo8hfX2Lq3ODz\",\"ui_state\":\"view\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"<meta command=\\\"END\\\" \\/>\"}]},{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"496a4a23-1842-41d4-9099-1c8206b65bc1\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"\",\"value\":\"\"}]}]}]},{\"title\":\"Webhooks\",\"ui_metadata\":{\"cta_presence\":false,\"cta_label\":\"\",\"draggable\":false,\"section_types\":\"container\",\"meta_code\":\"webhook\",\"section_id\":\"ca2938a3-7f5e-4ccd-b93a-8dd471e7ac44\"},\"data\":[{\"ui_metadata\":{\"type\":\"container\",\"element_id\":\"642c051f-00f8-4bd2-a5c1-4354b676f73e\",\"default\":\"\",\"value\":\"\",\"can_be_deleted\":false,\"pagination\":false},\"data\":[{\"ui_metadata\":{\"type\":\"text_field_dropdown\",\"element_id\":\"2ade66c2-f291-402b-b670-11c19f7f375c\",\"value\":\"URL\",\"values\":[\"GET\",\"POST\"],\"ui_state\":\"new\",\"can_be_deleted\":false},\"data\":[{\"default\":{\"text_field\":\"\",\"dropdown\":\"GET\"},\"value\":{\"text_field\":\"https:\\/\\/some.url-comes.here\",\"dropdown\":\"POST\"}}]},{\"ui_metadata\":{\"type\":\"text_container\",\"element_id\":\"3384e9bd-e229-4a7c-92c7-571cc2b43809\",\"value\":\"Headers\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"ui_metadata\":{\"type\":\"editable_text_field\",\"element_id\":\"eebca302-0f0e-454f-b356-97c7768ddbd3\",\"ui_state\":\"new\",\"can_be_deleted\":true},\"data\":[{\"default\":\"Header\",\"header\":\"\",\"value\":\"\"}]}]},{\"ui_metadata\":{\"type\":\"text_area_json\",\"element_id\":\"7dc46c27-1e1d-4584-9ad2-529d12087647\",\"value\":\"Request Body\",\"ui_state\":\"new\",\"can_be_deleted\":false,\"help_text\":\"some help text comes here\"},\"data\":[{\"default\":\"\",\"value\":\"{json text with escaped quotes comes in here.}\"}]}]}]},{\"title\":\"End Conversation\",\"ui_metadata\":{\"cta_presence\":true,\"draggable\":false,\"section_types\":\"boolean_container\",\"meta_code\":\"end_status\",\"section_id\":\"e875e7f8-fc0c-4b5f-bcfd-d64323268f4d\"},\"data\":[{\"ui_metadata\":{\"type\":\"boolean_flag\",\"element_id\":\"createUUID()\",\"default\":\"\",\"value\":\"End\",\"can_be_deleted\":false},\"data\":[{\"default\":\"FALSE\",\"value\":\"true\"}]}]}],\"loc\":\"856.0463950900505 -594.4953544860333\",\"topArray\":[{\"portColor\":\"#F76415\",\"portId\":\"input\"}],\"bottomArray\":[{\"portColor\":\"#F76415\",\"portId\":\"Fullfilled\",\"portTextColor\":\"#777777\"},{\"portColor\":\"#F76415\",\"portId\":\"TCH\",\"portTextColor\":\"#777777\"}],\"agent_id\":\"false\"}]', '[{\"from\":\"64184a30f5d0691ca8328711\",\"to\":\"64184a30f5d0691ca8328710\",\"frompid\":\"Fullfilled\",\"topid\":\"input\",\"key\":-2,\"to_diagram\":\"is\",\"points\":[156.41878780049683,-859.4914603468818,156.41878780049683,-849.4914603468818,156.41878780049683,-831.7424202303723,157.10542567891468,-831.7424202303723,157.10542567891468,-813.9933801138627,157.10542567891468,-803.9933801138627]},{\"from\":\"68716013-9b7e-492d-ac14-a724a65b204T\",\"to\":\"64184a30f5d0691ca8328711\",\"frompid\":\"START\",\"topid\":\"input\",\"key\":-5,\"to_diagram\":\"iu\",\"points\":[175.22882080078108,-1010.9999999999995,175.22882080078108,-1000.9999999999995,175.22882080078108,-992.2457301734407,187.1054256789148,-992.2457301734407,187.1054256789148,-983.4914603468818,187.1054256789148,-973.4914603468818]},{\"from\":\"64184a30f5d0691ca8328710\",\"to\":\"64184a31f5d0691ca8328713\",\"frompid\":\"TCH\",\"topid\":\"input\",\"key\":-4,\"to_diagram\":\"dm\",\"points\":[198.4200313918053,-689.9933801138632,198.4200313918053,-679.9933801138632,198.4200313918053,-676,284,-676,284,-852,527.0669901544538,-852,527.0669901544538,-851.897379133165,527.0669901544538,-841.897379133165]},{\"from\":\"64184a31f5d0691ca8328713\",\"to\":\"64184a31f5d0691ca8328714\",\"frompid\":\"Dec-1\",\"topid\":\"input\",\"key\":-6,\"to_diagram\":\"dm\",\"points\":[521.4438517267192,-727.8973791331646,521.4438517267192,-717.8973791331646,521.4438517267192,-699.8738422800202,682.784547916719,-699.8738422800202,682.784547916719,-681.8503054268759,682.784547916719,-671.8503054268759]},{\"from\":\"64184a31f5d0691ca8328714\",\"to\":\"64184a31f5d0691ca8328715\",\"frompid\":\"Dec-1\",\"topid\":\"input\",\"key\":-7,\"to_diagram\":\"iu\",\"points\":[677.1614094889844,-557.8503054268762,677.1614094889844,-547.8503054268762,677.1614094889844,-477.17356088141065,600.4012614831539,-477.17356088141065,600.4012614831539,-406.49681633594514,600.4012614831539,-396.49681633594514]},{\"from\":\"64184a31f5d0691ca8328714\",\"to\":\"64184a31f5d0691ca8328716\",\"frompid\":\"Dec-2\",\"topid\":\"input\",\"key\":-8,\"to_diagram\":\"iu\",\"points\":[748.4218159831253,-557.8503054268759,748.4218159831253,-547.8503054268759,748.4218159831253,-548,748.4218159831253,-548,748.4218159831253,-468,854.4349969579522,-468,854.4349969579522,-406.60526661108025,854.4349969579522,-396.60526661108025]},{\"from\":\"64184a31f5d0691ca8328713\",\"to\":\"64184a31f5d0691ca8328717\",\"frompid\":\"TCH\",\"topid\":\"input\",\"key\":-10,\"to_diagram\":\"iu\",\"points\":[455.806583660313,-727.8973791331646,455.806583660313,-717.8973791331646,455.806583660313,-632.3212701903143,402.3092197495605,-632.3212701903143,402.3092197495605,-546.745161247464,402.3092197495605,-536.745161247464]},{\"from\":\"64184a31f5d0691ca8328714\",\"to\":\"64184a31f5d0691ca8328717\",\"frompid\":\"TCH\",\"topid\":\"input\",\"key\":-11,\"to_diagram\":\"iu\",\"points\":[611.5241414225782,-557.8503054268762,611.5241414225782,-547.8503054268762,611.5241414225782,-547.29773333717,402.30921974956027,-547.29773333717,402.30921974956027,-546.745161247464,402.30921974956027,-536.745161247464]},{\"from\":\"64184a30f5d0691ca8328710\",\"to\":\"64184a31f5d0691ca8328718\",\"frompid\":\"Fullfilled\",\"topid\":\"input\",\"key\":-9,\"to_diagram\":\"dm\",\"points\":[126.41878780049672,-689.9933801138632,126.41878780049672,-679.9933801138632,126.41878780049672,-656.4917896140507,83.88513795226785,-656.4917896140507,83.88513795226785,-632.9901991142382,83.88513795226785,-622.9901991142382]},{\"from\":\"64184a31f5d0691ca8328718\",\"to\":\"64184a31f5d0691ca8328712\",\"frompid\":\"Dec-1\",\"topid\":\"input\",\"key\":-12,\"to_diagram\":\"iu\",\"points\":[41.877600110470965,-508.9901991142381,41.877600110470965,-498.9901991142381,41.877600110470965,-456.70717074298824,-50.82400253696795,-456.70717074298824,-50.82400253696795,-414.42414237173836,-50.82400253696795,-404.42414237173836]},{\"from\":\"64184a31f5d0691ca8328718\",\"to\":\"64184a30f5d0691ca8328710\",\"frompid\":\"Dec-3\",\"topid\":\"input\",\"key\":-13,\"to_diagram\":\"is\",\"points\":[185.83218232482645,-508.9901991142381,185.83218232482645,-498.9901991142381,-74.61486204773215,-498.9901991142381,-74.61486204773215,-813.9933801138632,157.10542567891468,-813.9933801138632,157.10542567891468,-803.9933801138632]},{\"from\":\"64184a31f5d0691ca8328718\",\"to\":\"64184a31f5d0691ca8328713\",\"frompid\":\"TCH\",\"topid\":\"input\",\"key\":-14,\"to_diagram\":\"dm\",\"points\":[-23.75966795593527,-508.9901991142381,-23.75966795593527,-498.9901991142381,-23.75966795593527,-498.9901991142381,244,-498.9901991142381,244,-548,284,-548,284,-852,527.0669901544538,-852,527.0669901544538,-851.897379133165,527.0669901544538,-841.897379133165]},{\"from\":\"64184a31f5d0691ca8328718\",\"to\":\"64184a31f5d0691ca8328719\",\"frompid\":\"Dec-2\",\"topid\":\"input\",\"key\":-15,\"to_diagram\":\"iu\",\"points\":[113.1380066046116,-508.9901991142381,113.1380066046116,-498.9901991142381,113.1380066046116,-458.4915857180931,223.22963629721698,-458.4915857180931,223.22963629721698,-417.9929723219482,223.22963629721698,-407.9929723219482]},{\"from\":\"64184a31f5d0691ca8328713\",\"to\":\"64184a32f5d0691ca832871a\",\"frompid\":\"Dec-2\",\"topid\":\"input\",\"key\":-16,\"to_diagram\":\"iu\",\"points\":[592.7042582208601,-727.897379133165,592.7042582208601,-717.897379133165,592.7042582208601,-716,971.5463950900505,-716,971.5463950900505,-604.4953544860333,971.5463950900505,-594.4953544860333]}]', '2023-03-20 19:54:58', '{\"navigation_map\":{\"is:64184a30f5d0691ca8328710\":{\"DISCONTINUED\":\"dm:64184a31f5d0691ca8328713\",\"COMPLETED\":\"dm:64184a31f5d0691ca8328718\"},\"iu:64184a30f5d0691ca8328711\":{\"COMPLETED\":\"is:64184a30f5d0691ca8328710\"},\"iu:64184a31f5d0691ca8328712\":{\"DISCONTINUED\":\"EXIT\",\"default\":\"EXIT\",\"COMPLETED\":\"EXIT\"},\"dm:64184a31f5d0691ca8328713\":{\"0\":\"dm:64184a31f5d0691ca8328714\",\"1\":\"iu:64184a32f5d0691ca832871a\",\"DISCONTINUED\":\"iu:64184a31f5d0691ca8328717\"},\"dm:64184a31f5d0691ca8328714\":{\"0\":\"iu:64184a31f5d0691ca8328715\",\"1\":\"iu:64184a31f5d0691ca8328716\",\"DISCONTINUED\":\"iu:64184a31f5d0691ca8328717\"},\"iu:64184a31f5d0691ca8328715\":{\"DISCONTINUED\":\"EXIT\",\"default\":\"EXIT\",\"COMPLETED\":\"EXIT\"},\"iu:64184a31f5d0691ca8328716\":{\"DISCONTINUED\":\"EXIT\",\"default\":\"EXIT\",\"COMPLETED\":\"EXIT\"},\"iu:64184a31f5d0691ca8328717\":{\"DISCONTINUED\":\"EXIT\",\"default\":\"EXIT\",\"COMPLETED\":\"EXIT\"},\"dm:64184a31f5d0691ca8328718\":{\"0\":\"iu:64184a31f5d0691ca8328712\",\"1\":\"iu:64184a31f5d0691ca8328719\",\"2\":\"is:64184a30f5d0691ca8328710\",\"DISCONTINUED\":\"dm:64184a31f5d0691ca8328713\"},\"iu:64184a31f5d0691ca8328719\":{\"DISCONTINUED\":\"EXIT\",\"default\":\"EXIT\",\"COMPLETED\":\"EXIT\"},\"iu:64184a32f5d0691ca832871a\":{\"DISCONTINUED\":\"EXIT\",\"default\":\"EXIT\",\"COMPLETED\":\"EXIT\"}},\"start_node\":\"iu:64184a30f5d0691ca8328711\",\"id\":\"6418498bf5d0691ca832870f\"}', '2023-03-20 19:58:00');

-- --------------------------------------------------------

--
-- Table structure for table `phone_number_country`
--

CREATE TABLE `phone_number_country` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `meta_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_number_country`
--

INSERT INTO `phone_number_country` (`id`, `name`, `meta_code`) VALUES
(1, 'Australia', 'AU'),
(2, 'South Africa', 'ZA'),
(3, 'Sri Lanka', 'LK'),
(4, 'Singapore', 'SG'),
(5, 'United States', 'US'),
(6, 'United Kingdom', 'GB'),
(7, 'New Zealand', 'NZ');

-- --------------------------------------------------------

--
-- Table structure for table `phone_number_end_user_type`
--

CREATE TABLE `phone_number_end_user_type` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `meta_code` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_number_end_user_type`
--

INSERT INTO `phone_number_end_user_type` (`id`, `name`, `meta_code`) VALUES
(1, 'business', 'business'),
(2, 'individual', 'individual');

-- --------------------------------------------------------

--
-- Table structure for table `phone_number_type`
--

CREATE TABLE `phone_number_type` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `meta_code` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_number_type`
--

INSERT INTO `phone_number_type` (`id`, `name`, `meta_code`) VALUES
(1, 'local', 'local'),
(2, 'national', 'national');

-- --------------------------------------------------------

--
-- Table structure for table `primary_embedding`
--

CREATE TABLE `primary_embedding` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `primary_embedding`
--

INSERT INTO `primary_embedding` (`id`, `name`) VALUES
(1, 'Sentence Transformer'),
(2, 'spaCy - Medium'),
(3, 'spaCy - Large');

-- --------------------------------------------------------

--
-- Table structure for table `regulatory_bundle`
--

CREATE TABLE `regulatory_bundle` (
  `id` int(11) NOT NULL,
  `phone_number_end_user_type_id` int(11) NOT NULL,
  `phone_number_country_id` int(11) NOT NULL,
  `phone_number_type_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `regulatory_bundle_id` varchar(128) DEFAULT NULL,
  `regulatory_bundle_twilio_sid` varchar(128) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `reg_bundle_twilio_address_sid` varchar(128) DEFAULT NULL,
  `failure_reason` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regulatory_bundle_status`
--

CREATE TABLE `regulatory_bundle_status` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `meta_code` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regulatory_bundle_status`
--

INSERT INTO `regulatory_bundle_status` (`id`, `name`, `meta_code`) VALUES
(1, 'pending-review', 'pending-review'),
(2, 'in-review', 'in-review'),
(3, 'accepted', 'twilio-accepted'),
(4, 'rejected', 'twilio-rejected'),
(5, 'draft', 'draft');

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `selector` varchar(20) NOT NULL,
  `hashed_token` varchar(100) NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_validation`
--

CREATE TABLE `reset_password_validation` (
  `id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `pass_token` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_type`
--

CREATE TABLE `transaction_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_type`
--

INSERT INTO `transaction_type` (`id`, `name`, `description`) VALUES
(1, 'Session', NULL),
(2, 'Seconds', NULL),
(3, 'Hour', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `roles`, `password`, `phone`, `user_type`, `created_at`, `updated_at`, `status_id`, `account_id`) VALUES
(1, 'Admin User', 'admin@cognius.ai', '[\"ROLE_SUPER_ADMIN\"]', '$2y$13$CTDM1TuNwNEiOBwXjFgDZuHzQqOVORcCfZL7Mkc7O20rMiIIMdFHi', '+1000000000', 'Individual', '2023-03-20 19:49:15', '2023-03-20 19:49:17', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`id`, `name`, `description`) VALUES
(1, 'Registered', 'Registered'),
(2, 'Verified', 'Verified'),
(3, 'Active', 'Active'),
(4, 'Pending', 'Pending'),
(5, 'Approved', 'Approved'),
(6, 'Rejected', 'Rejected'),
(7, 'Blocked', 'Blocked'),
(8, 'Deactivated', 'Deactivated');

-- --------------------------------------------------------

--
-- Table structure for table `web_hook`
--

CREATE TABLE `web_hook` (
  `id` int(11) NOT NULL,
  `bot_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `url_endpoint` varchar(255) NOT NULL,
  `headers` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `web_hook_history`
--

CREATE TABLE `web_hook_history` (
  `id` int(11) NOT NULL,
  `web_hook_id` int(11) NOT NULL,
  `status` longtext NOT NULL,
  `triggered_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_7D3656A4979B1AD6` (`company_id`),
  ADD KEY `IDX_7D3656A4D991282D` (`customer_type_id`),
  ADD KEY `IDX_7D3656A4AE620744` (`billing_type_id`),
  ADD KEY `IDX_7D3656A438248176` (`currency_id`),
  ADD KEY `IDX_7D3656A47E856044` (`billing_configure_id`);

--
-- Indexes for table `billing_configure`
--
ALTER TABLE `billing_configure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_type`
--
ALTER TABLE `billing_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bot`
--
ALTER TABLE `bot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_11F0411A76ED395` (`user_id`),
  ADD KEY `IDX_11F04119B6B5FBA` (`account_id`);

--
-- Indexes for table `bot_company`
--
ALTER TABLE `bot_company`
  ADD PRIMARY KEY (`bot_id`,`company_id`),
  ADD KEY `IDX_B049646A92C1C487` (`bot_id`),
  ADD KEY `IDX_B049646A979B1AD6` (`company_id`);

--
-- Indexes for table `channel_type`
--
ALTER TABLE `channel_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charging_type`
--
ALTER TABLE `charging_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_widget`
--
ALTER TABLE `company_widget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B8667AA5979B1AD6` (`company_id`);

--
-- Indexes for table `contact_center`
--
ALTER TABLE `contact_center`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D062DCA5720FB392` (`channel_type_id`);

--
-- Indexes for table `cron_job`
--
ALTER TABLE `cron_job`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `un_name` (`name`);

--
-- Indexes for table `cron_report`
--
ALTER TABLE `cron_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B6C6A7F5BE04EA9` (`job_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_type`
--
ALTER TABLE `customer_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deployment`
--
ALTER TABLE `deployment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_EB1255BE720FB392` (`channel_type_id`),
  ADD KEY `IDX_EB1255BEB03A8386` (`created_by_id`),
  ADD KEY `IDX_EB1255BE896DBBDE` (`updated_by_id`);

--
-- Indexes for table `deployment_type`
--
ALTER TABLE `deployment_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_20F733EEB3E6B071` (`transaction_type_id`),
  ADD KEY `IDX_20F733EE9B6B5FBA` (`account_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `email_validation`
--
ALTER TABLE `email_validation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlsetting`
--
ALTER TABLE `mlsetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigation_map`
--
ALTER TABLE `navigation_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CB43285092C1C487` (`bot_id`),
  ADD KEY `IDX_CB432850A76ED395` (`user_id`);

--
-- Indexes for table `phone_number_country`
--
ALTER TABLE `phone_number_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_number_end_user_type`
--
ALTER TABLE `phone_number_end_user_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_number_type`
--
ALTER TABLE `phone_number_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `primary_embedding`
--
ALTER TABLE `primary_embedding`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regulatory_bundle`
--
ALTER TABLE `regulatory_bundle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_684B3EEF7B747906` (`phone_number_end_user_type_id`),
  ADD KEY `IDX_684B3EEFCFCB5771` (`phone_number_country_id`),
  ADD KEY `IDX_684B3EEF7B233253` (`phone_number_type_id`),
  ADD KEY `IDX_684B3EEF6BF700BD` (`status_id`),
  ADD KEY `IDX_684B3EEFB03A8386` (`created_by_id`),
  ADD KEY `IDX_684B3EEF896DBBDE` (`updated_by_id`);

--
-- Indexes for table `regulatory_bundle_status`
--
ALTER TABLE `regulatory_bundle_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Indexes for table `reset_password_validation`
--
ALTER TABLE `reset_password_validation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_type`
--
ALTER TABLE `transaction_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD KEY `IDX_8D93D6499B6B5FBA` (`account_id`),
  ADD KEY `IDX_8D93D6496BF700BD` (`status_id`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_hook`
--
ALTER TABLE `web_hook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_605A4EA092C1C487` (`bot_id`),
  ADD KEY `IDX_605A4EA0979B1AD6` (`company_id`),
  ADD KEY `IDX_605A4EA0B03A8386` (`created_by_id`),
  ADD KEY `IDX_605A4EA0896DBBDE` (`updated_by_id`);

--
-- Indexes for table `web_hook_history`
--
ALTER TABLE `web_hook_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D9AC24425A7D4251` (`web_hook_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `billing_configure`
--
ALTER TABLE `billing_configure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing_type`
--
ALTER TABLE `billing_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bot`
--
ALTER TABLE `bot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `channel_type`
--
ALTER TABLE `channel_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `charging_type`
--
ALTER TABLE `charging_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_widget`
--
ALTER TABLE `company_widget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_center`
--
ALTER TABLE `contact_center`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cron_job`
--
ALTER TABLE `cron_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cron_report`
--
ALTER TABLE `cron_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_type`
--
ALTER TABLE `customer_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deployment`
--
ALTER TABLE `deployment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deployment_type`
--
ALTER TABLE `deployment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `email_validation`
--
ALTER TABLE `email_validation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `mlsetting`
--
ALTER TABLE `mlsetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `navigation_map`
--
ALTER TABLE `navigation_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phone_number_country`
--
ALTER TABLE `phone_number_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `phone_number_end_user_type`
--
ALTER TABLE `phone_number_end_user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `phone_number_type`
--
ALTER TABLE `phone_number_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `primary_embedding`
--
ALTER TABLE `primary_embedding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `regulatory_bundle`
--
ALTER TABLE `regulatory_bundle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regulatory_bundle_status`
--
ALTER TABLE `regulatory_bundle_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reset_password_validation`
--
ALTER TABLE `reset_password_validation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_type`
--
ALTER TABLE `transaction_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `web_hook`
--
ALTER TABLE `web_hook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `web_hook_history`
--
ALTER TABLE `web_hook_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `FK_7D3656A438248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_7D3656A47E856044` FOREIGN KEY (`billing_configure_id`) REFERENCES `billing_configure` (`id`),
  ADD CONSTRAINT `FK_7D3656A4979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `FK_7D3656A4AE620744` FOREIGN KEY (`billing_type_id`) REFERENCES `billing_type` (`id`),
  ADD CONSTRAINT `FK_7D3656A4D991282D` FOREIGN KEY (`customer_type_id`) REFERENCES `customer_type` (`id`);

--
-- Constraints for table `bot`
--
ALTER TABLE `bot`
  ADD CONSTRAINT `FK_11F04119B6B5FBA` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `FK_11F0411A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `bot_company`
--
ALTER TABLE `bot_company`
  ADD CONSTRAINT `FK_B049646A92C1C487` FOREIGN KEY (`bot_id`) REFERENCES `bot` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B049646A979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `company_widget`
--
ALTER TABLE `company_widget`
  ADD CONSTRAINT `FK_B8667AA5979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `contact_center`
--
ALTER TABLE `contact_center`
  ADD CONSTRAINT `FK_D062DCA5720FB392` FOREIGN KEY (`channel_type_id`) REFERENCES `channel_type` (`id`);

--
-- Constraints for table `cron_report`
--
ALTER TABLE `cron_report`
  ADD CONSTRAINT `FK_B6C6A7F5BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `cron_job` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deployment`
--
ALTER TABLE `deployment`
  ADD CONSTRAINT `FK_EB1255BE720FB392` FOREIGN KEY (`channel_type_id`) REFERENCES `channel_type` (`id`),
  ADD CONSTRAINT `FK_EB1255BE896DBBDE` FOREIGN KEY (`updated_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_EB1255BEB03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `deployment_type`
--
ALTER TABLE `deployment_type`
  ADD CONSTRAINT `FK_20F733EE9B6B5FBA` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `FK_20F733EEB3E6B071` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_type` (`id`);

--
-- Constraints for table `navigation_map`
--
ALTER TABLE `navigation_map`
  ADD CONSTRAINT `FK_CB43285092C1C487` FOREIGN KEY (`bot_id`) REFERENCES `bot` (`id`),
  ADD CONSTRAINT `FK_CB432850A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `regulatory_bundle`
--
ALTER TABLE `regulatory_bundle`
  ADD CONSTRAINT `FK_684B3EEF6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `regulatory_bundle_status` (`id`),
  ADD CONSTRAINT `FK_684B3EEF7B233253` FOREIGN KEY (`phone_number_type_id`) REFERENCES `phone_number_type` (`id`),
  ADD CONSTRAINT `FK_684B3EEF7B747906` FOREIGN KEY (`phone_number_end_user_type_id`) REFERENCES `phone_number_end_user_type` (`id`),
  ADD CONSTRAINT `FK_684B3EEF896DBBDE` FOREIGN KEY (`updated_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_684B3EEFB03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_684B3EEFCFCB5771` FOREIGN KEY (`phone_number_country_id`) REFERENCES `phone_number_country` (`id`);

--
-- Constraints for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D6496BF700BD` FOREIGN KEY (`status_id`) REFERENCES `user_status` (`id`),
  ADD CONSTRAINT `FK_8D93D6499B6B5FBA` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `web_hook`
--
ALTER TABLE `web_hook`
  ADD CONSTRAINT `FK_605A4EA0896DBBDE` FOREIGN KEY (`updated_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_605A4EA092C1C487` FOREIGN KEY (`bot_id`) REFERENCES `bot` (`id`),
  ADD CONSTRAINT `FK_605A4EA0979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `FK_605A4EA0B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `web_hook_history`
--
ALTER TABLE `web_hook_history`
  ADD CONSTRAINT `FK_D9AC24425A7D4251` FOREIGN KEY (`web_hook_id`) REFERENCES `web_hook` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
