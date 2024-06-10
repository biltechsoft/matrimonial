-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 28, 2024 at 12:12 PM
-- Server version: 5.7.44
-- PHP Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matrimon_munadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add admin user', 7, 'add_adminuser'),
(26, 'Can change admin user', 7, 'change_adminuser'),
(27, 'Can delete admin user', 7, 'delete_adminuser'),
(28, 'Can view admin user', 7, 'view_adminuser'),
(29, 'Can add female user', 8, 'add_femaleuser'),
(30, 'Can change female user', 8, 'change_femaleuser'),
(31, 'Can delete female user', 8, 'delete_femaleuser'),
(32, 'Can view female user', 8, 'view_femaleuser'),
(33, 'Can add male user', 9, 'add_maleuser'),
(34, 'Can change male user', 9, 'change_maleuser'),
(35, 'Can delete male user', 9, 'delete_maleuser'),
(36, 'Can view male user', 9, 'view_maleuser'),
(37, 'Can add matching table', 10, 'add_matchingtable'),
(38, 'Can change matching table', 10, 'change_matchingtable'),
(39, 'Can delete matching table', 10, 'delete_matchingtable'),
(40, 'Can view matching table', 10, 'view_matchingtable'),
(41, 'Can add post', 11, 'add_post'),
(42, 'Can change post', 11, 'change_post'),
(43, 'Can delete post', 11, 'delete_post'),
(44, 'Can view post', 11, 'view_post'),
(45, 'Can add temp user', 12, 'add_tempuser'),
(46, 'Can change temp user', 12, 'change_tempuser'),
(47, 'Can delete temp user', 12, 'delete_tempuser'),
(48, 'Can view temp user', 12, 'view_tempuser'),
(49, 'Can add message', 13, 'add_message'),
(50, 'Can change message', 13, 'change_message'),
(51, 'Can delete message', 13, 'delete_message'),
(52, 'Can view message', 13, 'view_message'),
(53, 'Can add Token', 14, 'add_token'),
(54, 'Can change Token', 14, 'change_token'),
(55, 'Can delete Token', 14, 'delete_token'),
(56, 'Can view Token', 14, 'view_token'),
(57, 'Can add token', 15, 'add_tokenproxy'),
(58, 'Can change token', 15, 'change_tokenproxy'),
(59, 'Can delete token', 15, 'delete_tokenproxy'),
(60, 'Can view token', 15, 'view_tokenproxy'),
(61, 'Can add admin log', 16, 'add_adminlog'),
(62, 'Can change admin log', 16, 'change_adminlog'),
(63, 'Can delete admin log', 16, 'delete_adminlog'),
(64, 'Can view admin log', 16, 'view_adminlog'),
(65, 'Can add match making', 17, 'add_matchmaking'),
(66, 'Can change match making', 17, 'change_matchmaking'),
(67, 'Can delete match making', 17, 'delete_matchmaking'),
(68, 'Can view match making', 17, 'view_matchmaking');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$qhn5tbYfqPaBep0KQzk0jx$6uy720yu12DAiJyP6M4SPqQHOe2TY3ibO5AB8kvbK6c=', '2022-09-03 15:04:57.148008', 1, 'superadmin', '', '', '', 1, 1, '2022-08-16 13:47:00.884873');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(14, 'authtoken', 'token'),
(15, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(16, 'UserApp', 'adminlog'),
(7, 'UserApp', 'adminuser'),
(8, 'UserApp', 'femaleuser'),
(9, 'UserApp', 'maleuser'),
(10, 'UserApp', 'matchingtable'),
(17, 'UserApp', 'matchmaking'),
(13, 'UserApp', 'message'),
(11, 'UserApp', 'post'),
(12, 'UserApp', 'tempuser');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'UserApp', '0001_initial', '2022-02-20 01:54:46.202759'),
(2, 'UserApp', '0002_post_postdetails_post_postphoto_post_poststatus_and_more', '2022-02-20 01:54:46.250999'),
(3, 'UserApp', '0003_matchingtable_matchingdetails', '2022-02-20 01:54:46.267156'),
(4, 'UserApp', '0004_post_posttype', '2022-02-20 01:54:46.277655'),
(5, 'UserApp', '0005_rename_user_pass_femaleuser_userpass_and_more', '2022-02-20 01:54:46.290657'),
(6, 'UserApp', '0006_tempuser', '2022-02-20 01:54:46.298665'),
(7, 'UserApp', '0007_tempuser_tempdate', '2022-02-20 01:54:46.312177'),
(8, 'UserApp', '0008_alter_tempuser_tempdate', '2022-02-20 01:54:46.327261'),
(9, 'UserApp', '0009_auto_20220122_2125', '2022-02-20 01:54:46.582223'),
(10, 'UserApp', '0010_auto_20220128_1439', '2022-02-20 01:54:46.675801'),
(11, 'UserApp', '0011_auto_20220128_1539', '2022-02-20 01:54:46.705102'),
(12, 'UserApp', '0012_rename_femaleid_femaleuser_userid', '2022-02-20 01:54:46.711985'),
(13, 'UserApp', '0013_auto_20220128_1742', '2022-02-20 01:54:46.736139'),
(14, 'UserApp', '0014_auto_20220203_0014', '2022-02-20 01:54:46.759745'),
(15, 'UserApp', '0015_auto_20220208_0006', '2022-02-20 01:54:46.784635'),
(16, 'UserApp', '0016_auto_20220208_0137', '2022-02-20 01:54:46.832879'),
(17, 'UserApp', '0017_adminuser_admintoken', '2022-02-20 01:54:46.842298'),
(18, 'contenttypes', '0001_initial', '2022-02-20 01:54:46.854953'),
(19, 'auth', '0001_initial', '2022-02-20 01:54:47.006495'),
(20, 'admin', '0001_initial', '2022-02-20 01:54:47.041823'),
(21, 'admin', '0002_logentry_remove_auto_add', '2022-02-20 01:54:47.048922'),
(22, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-20 01:54:47.055700'),
(23, 'contenttypes', '0002_remove_content_type_name', '2022-02-20 01:54:47.095009'),
(24, 'auth', '0002_alter_permission_name_max_length', '2022-02-20 01:54:47.104291'),
(25, 'auth', '0003_alter_user_email_max_length', '2022-02-20 01:54:47.114626'),
(26, 'auth', '0004_alter_user_username_opts', '2022-02-20 01:54:47.121290'),
(27, 'auth', '0005_alter_user_last_login_null', '2022-02-20 01:54:47.133899'),
(28, 'auth', '0006_require_contenttypes_0002', '2022-02-20 01:54:47.135316'),
(29, 'auth', '0007_alter_validators_add_error_messages', '2022-02-20 01:54:47.141651'),
(30, 'auth', '0008_alter_user_username_max_length', '2022-02-20 01:54:47.149850'),
(31, 'auth', '0009_alter_user_last_name_max_length', '2022-02-20 01:54:47.157650'),
(32, 'auth', '0010_alter_group_name_max_length', '2022-02-20 01:54:47.166032'),
(33, 'auth', '0011_update_proxy_permissions', '2022-02-20 01:54:47.179936'),
(34, 'auth', '0012_alter_user_first_name_max_length', '2022-02-20 01:54:47.187806'),
(35, 'sessions', '0001_initial', '2022-02-20 01:54:47.197672'),
(36, 'UserApp', '0018_femaleuser_highesteducation_and_more', '2022-03-02 12:06:39.905988'),
(37, 'UserApp', '0019_femaleuser_matchid_femaleuser_matchpercentage_and_more', '2022-03-05 09:19:57.085662'),
(38, 'UserApp', '0020_femaleuser_birthyear_maleuser_birthyear', '2022-03-07 10:29:59.268347'),
(39, 'UserApp', '0021_remove_tempuser_tempdateofbirth_and_more', '2022-03-08 16:33:33.197755'),
(40, 'UserApp', '0002_post_postcode', '2022-05-13 16:14:29.426905'),
(41, 'UserApp', '0003_post_param1_post_param2_post_param3_post_param4_and_more', '2022-05-14 09:40:57.332629'),
(42, 'UserApp', '0004_rename_posttitle_post_pagetitle', '2022-05-14 10:27:51.799276'),
(43, 'UserApp', '0005_femaleuser_signature_maleuser_signature', '2022-07-19 05:12:39.068783'),
(44, 'UserApp', '0006_message', '2022-07-23 04:04:50.536975'),
(45, 'UserApp', '0007_message_messagereply_message_replydatetime', '2022-07-25 04:42:05.896048'),
(46, 'UserApp', '0008_femaleuser_gallery_femaleuser_tempgallery_and_more', '2022-07-30 04:48:10.139786'),
(47, 'UserApp', '0009_alter_femaleuser_cellphone_alter_maleuser_cellphone', '2022-07-30 04:50:16.708963'),
(48, 'UserApp', '0010_femaleuser_lockedid_maleuser_lockedid_and_more', '2022-08-27 04:33:03.579584'),
(49, 'authtoken', '0001_initial', '2022-09-16 19:51:38.601606'),
(50, 'authtoken', '0002_auto_20160226_1747', '2022-09-16 19:51:38.636313'),
(51, 'authtoken', '0003_tokenproxy', '2022-09-16 19:51:38.640442'),
(52, 'UserApp', '0011_femaleuser_cumatchid_maleuser_cumatchid', '2022-09-17 09:47:42.052776'),
(53, 'UserApp', '0012_adminlog', '2022-09-24 09:29:05.685190'),
(54, 'UserApp', '0013_adminlog_note', '2022-09-26 14:03:45.789794'),
(55, 'UserApp', '0014_alter_adminlog_action_alter_adminlog_note', '2022-09-26 14:23:49.869765'),
(56, 'UserApp', '0015_adminlog_xuserid', '2022-10-01 00:03:50.660769'),
(57, 'UserApp', '0016_femaleuser_reqlock_maleuser_reqlock', '2022-10-27 17:56:07.361054'),
(58, 'UserApp', '0017_alter_femaleuser_album_alter_femaleuser_cv_and_more', '2022-11-29 15:18:51.725981'),
(59, 'UserApp', '0018_alter_femaleuser_health_and_more', '2023-01-03 18:14:26.298063'),
(60, 'UserApp', '0019_matchmaking', '2024-05-22 14:15:49.053532'),
(61, 'UserApp', '0020_alter_matchmaking_statusmale', '2024-05-25 10:06:32.840135'),
(62, 'UserApp', '0021_rename_statusmale_matchmaking_statusreq', '2024-05-25 10:11:22.785469'),
(63, 'UserApp', '0022_alter_matchmaking_statusreq', '2024-05-27 16:35:14.814681');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('t59bqkcz8jnjtgysqvcht4du5nfextwv', '.eJxVjM0OwiAQhN-FsyFQfpb16N1nIAusUjU0Ke3J-O62SQ96mmS-b-YtIq1LjWvnOY5FnIUWp98uUX5y20F5ULtPMk9tmcckd0UetMvrVPh1Ody_g0q9bmtMAc1Aiiw7pYdsFEMwYJO1jGQceB-2IOMBQWXH6DCAclkj4Y2S-HwBs_82xw:1oUUhd:0-nhBdPU3AEuic5MOdPzDt7QSvf5MM3JyA5Bkid-LS8', '2022-09-17 15:04:57.150014');

-- --------------------------------------------------------

--
-- Table structure for table `UserApp_adminlog`
--

CREATE TABLE `UserApp_adminlog` (
  `logId` int(11) NOT NULL,
  `adminId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `actionTime` datetime(6) NOT NULL,
  `note` int(11) DEFAULT NULL,
  `xuserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserApp_adminlog`
--

INSERT INTO `UserApp_adminlog` (`logId`, `adminId`, `userId`, `userType`, `action`, `description`, `actionTime`, `note`, `xuserId`) VALUES
(1, 4, 85, 1, 2, 'accepted profile/gallery picture', '2022-09-26 14:12:35.000000', NULL, NULL),
(2, 4, 85, 1, 3, 'rejected profile/gallery picture', '2022-09-30 17:17:26.000000', 0, NULL),
(3, 4, 85, 1, 3, 'rejected profile/gallery picture', '2022-09-30 17:46:22.000000', 2, NULL),
(4, 4, 69, 1, 1, 'rejected profile', '2022-09-30 17:54:28.000000', 3, NULL),
(5, 4, 29, 2, 1, 'rejected profile', '2022-10-01 00:05:25.000000', 0, NULL),
(6, 4, 65, 1, 4, 'accepted profile request', '2022-10-01 00:18:01.000000', NULL, 30),
(7, 4, 63, 1, 4, 'accepted profile request', '2022-10-01 00:19:32.000000', NULL, 27),
(8, 3, 85, 1, 5, 'rejected profile request', '2022-10-01 00:33:47.000000', 4, 26),
(9, 4, 89, 1, 5, 'rejected profile request', '2022-10-01 15:25:31.000000', 4, 27),
(10, 4, 89, 1, 4, 'accepted profile request', '2022-10-01 15:25:36.000000', NULL, 31),
(11, 4, 31, 2, 4, 'accepted profile request', '2022-10-09 14:21:24.000000', NULL, 62),
(12, 1, 101, 1, 3, 'rejected profile/gallery picture', '2023-01-21 17:12:01.000000', 1, NULL),
(13, 5, 33, 2, 2, 'accepted profile/gallery picture', '2023-01-29 07:49:46.000000', NULL, NULL),
(14, 5, 115, 1, 4, 'accepted profile request', '2023-01-31 12:31:46.000000', NULL, 33),
(15, 5, 33, 2, 4, 'accepted profile request', '2023-01-31 12:32:59.000000', NULL, 116),
(16, 5, 122, 1, 4, 'accepted profile request', '2023-01-31 13:06:17.000000', NULL, 33),
(17, 5, 100, 1, 4, 'accepted profile request', '2023-02-05 01:52:56.000000', NULL, 33),
(18, 5, 115, 1, 4, 'accepted profile request', '2023-02-06 17:00:51.000000', NULL, 34),
(19, 5, 119, 1, 1, 'rejected profile', '2023-02-23 10:38:01.000000', 0, NULL),
(20, 1, 123, 1, 4, 'accepted profile request', '2023-02-24 13:14:30.000000', NULL, 33),
(21, 1, 123, 1, 4, 'accepted profile request', '2023-02-28 16:52:53.000000', NULL, 45),
(22, 1, 122, 1, 4, 'accepted profile request', '2023-02-28 16:53:06.000000', NULL, 45),
(23, 1, 115, 1, 4, 'accepted profile request', '2023-02-28 16:53:23.000000', NULL, 45),
(24, 1, 115, 1, 4, 'accepted profile request', '2023-02-28 16:53:24.000000', NULL, 46),
(25, 1, 46, 2, 4, 'accepted profile request', '2023-02-28 16:55:03.000000', NULL, 123),
(26, 1, 46, 2, 4, 'accepted profile request', '2023-02-28 16:55:04.000000', NULL, 100),
(27, 1, 46, 2, 4, 'accepted profile request', '2023-02-28 16:55:06.000000', NULL, 116),
(28, 1, 46, 2, 4, 'accepted profile request', '2023-02-28 16:55:08.000000', NULL, 101),
(29, 1, 45, 2, 2, 'accepted profile/gallery picture', '2023-03-18 05:17:16.000000', NULL, NULL),
(30, 5, 121, 1, 4, 'accepted profile request', '2023-03-22 17:32:06.000000', NULL, 45),
(31, 5, 121, 1, 4, 'accepted profile request', '2023-03-22 17:32:07.000000', NULL, 33),
(32, 5, 123, 1, 4, 'accepted profile request', '2023-03-27 17:52:24.000000', NULL, 50),
(33, 5, 122, 1, 4, 'accepted profile request', '2023-03-27 17:52:45.000000', NULL, 50),
(34, 5, 121, 1, 4, 'accepted profile request', '2023-03-27 17:55:10.000000', NULL, 50),
(35, 5, 115, 1, 4, 'accepted profile request', '2023-03-27 17:55:21.000000', NULL, 50),
(36, 5, 50, 2, 4, 'accepted profile request', '2023-03-27 17:55:39.000000', NULL, 116),
(37, 5, 137, 1, 2, 'accepted profile/gallery picture', '2023-03-27 17:55:58.000000', NULL, NULL),
(38, 5, 123, 1, 4, 'accepted profile request', '2023-03-29 11:35:57.000000', NULL, 48),
(39, 5, 122, 1, 4, 'accepted profile request', '2023-03-29 11:36:11.000000', NULL, 48),
(40, 5, 121, 1, 4, 'accepted profile request', '2023-03-29 11:36:18.000000', NULL, 48),
(41, 5, 115, 1, 4, 'accepted profile request', '2023-03-29 11:36:27.000000', NULL, 48),
(42, 5, 50, 2, 2, 'accepted profile/gallery picture', '2023-03-29 11:36:40.000000', NULL, NULL),
(43, 5, 138, 1, 2, 'accepted profile/gallery picture', '2023-04-01 18:10:03.000000', NULL, NULL),
(44, 5, 138, 1, 4, 'accepted profile request', '2023-04-02 17:42:03.000000', NULL, 45),
(45, 5, 138, 1, 4, 'accepted profile request', '2023-04-02 17:42:04.000000', NULL, 50),
(46, 5, 138, 1, 4, 'accepted profile request', '2023-04-02 17:42:05.000000', NULL, 48),
(47, 5, 138, 1, 4, 'accepted profile request', '2023-04-02 17:42:07.000000', NULL, 46),
(48, 5, 140, 1, 4, 'accepted profile request', '2023-04-15 05:06:13.000000', NULL, 48),
(49, 5, 140, 1, 4, 'accepted profile request', '2023-04-15 05:06:14.000000', NULL, 46),
(50, 5, 140, 1, 4, 'accepted profile request', '2023-04-15 05:06:15.000000', NULL, 51),
(51, 5, 140, 1, 4, 'accepted profile request', '2023-04-15 05:06:15.000000', NULL, 45),
(52, 5, 138, 1, 4, 'accepted profile request', '2023-04-15 05:06:39.000000', NULL, 51),
(53, 5, 137, 1, 4, 'accepted profile request', '2023-04-15 05:07:03.000000', NULL, 51),
(54, 5, 123, 1, 2, 'accepted profile/gallery picture', '2023-04-15 05:07:23.000000', NULL, NULL),
(55, 5, 121, 1, 4, 'accepted profile request', '2023-04-15 05:07:31.000000', NULL, 51),
(56, 5, 115, 1, 4, 'accepted profile request', '2023-04-15 05:07:41.000000', NULL, 51),
(57, 5, 123, 1, 4, 'accepted profile request', '2023-04-15 05:07:53.000000', NULL, 51),
(58, 5, 137, 1, 4, 'accepted profile request', '2023-04-16 18:21:53.000000', NULL, 48),
(59, 5, 137, 1, 4, 'accepted profile request', '2023-04-16 18:21:54.000000', NULL, 45),
(60, 5, 122, 1, 2, 'accepted profile/gallery picture', '2023-05-03 17:33:25.000000', NULL, NULL),
(61, 5, 122, 1, 4, 'accepted profile request', '2023-05-03 17:34:22.000000', NULL, 51),
(62, 5, 51, 2, 2, 'accepted profile/gallery picture', '2023-05-24 18:21:45.000000', NULL, NULL),
(63, 5, 146, 1, 2, 'accepted profile/gallery picture', '2023-06-05 06:55:14.000000', NULL, NULL),
(64, 5, 148, 1, 4, 'accepted profile request', '2023-06-07 12:14:48.000000', NULL, 45),
(65, 5, 148, 1, 4, 'accepted profile request', '2023-06-07 12:14:49.000000', NULL, 50),
(66, 5, 146, 1, 4, 'accepted profile request', '2023-06-07 12:15:08.000000', NULL, 50),
(67, 5, 146, 1, 4, 'accepted profile request', '2023-06-07 12:15:08.000000', NULL, 51),
(68, 5, 146, 1, 4, 'accepted profile request', '2023-06-07 12:15:09.000000', NULL, 45),
(69, 5, 146, 1, 4, 'accepted profile request', '2023-06-07 12:15:10.000000', NULL, 48),
(70, 5, 146, 1, 4, 'accepted profile request', '2023-06-07 12:15:11.000000', NULL, 46),
(71, 5, 148, 1, 4, 'accepted profile request', '2023-06-08 17:55:48.000000', NULL, 48),
(72, 5, 148, 1, 4, 'accepted profile request', '2023-06-08 17:55:49.000000', NULL, 46),
(73, 5, 148, 1, 4, 'accepted profile request', '2023-06-08 17:55:50.000000', NULL, 51),
(74, 5, 148, 1, 2, 'accepted profile/gallery picture', '2023-06-11 18:01:52.000000', NULL, NULL),
(75, 5, 146, 1, 4, 'accepted profile request', '2023-06-11 18:02:04.000000', NULL, 63),
(76, 5, 140, 1, 4, 'accepted profile request', '2023-06-11 18:02:48.000000', NULL, 63),
(77, 5, 138, 1, 4, 'accepted profile request', '2023-06-11 18:02:57.000000', NULL, 63),
(78, 5, 123, 1, 4, 'accepted profile request', '2023-06-11 18:03:07.000000', NULL, 63),
(79, 5, 115, 1, 4, 'accepted profile request', '2023-06-11 18:03:17.000000', NULL, 63),
(80, 5, 63, 2, 4, 'accepted profile request', '2023-06-11 18:03:34.000000', NULL, 100),
(81, 5, 148, 1, 4, 'accepted profile request', '2023-06-11 18:03:48.000000', NULL, 63),
(82, 5, 63, 2, 4, 'accepted profile request', '2023-06-12 08:30:05.000000', NULL, 116),
(83, 5, 138, 1, 2, 'accepted profile/gallery picture', '2023-08-06 13:54:39.000000', NULL, NULL),
(84, 5, 63, 2, 4, 'accepted profile request', '2023-08-06 13:58:21.000000', NULL, 121),
(85, 5, 63, 2, 4, 'accepted profile request', '2023-08-06 13:58:22.000000', NULL, 122),
(86, 5, 115, 1, 4, 'accepted profile request', '2023-08-06 14:00:00.000000', NULL, 70),
(87, 5, 115, 1, 4, 'accepted profile request', '2023-08-06 14:00:01.000000', NULL, 81),
(88, 5, 148, 1, 4, 'accepted profile request', '2023-08-17 06:56:40.000000', NULL, 81),
(89, 5, 148, 1, 4, 'accepted profile request', '2023-08-17 06:56:41.000000', NULL, 70),
(90, 5, 146, 1, 4, 'accepted profile request', '2023-08-17 06:56:51.000000', NULL, 81),
(91, 5, 146, 1, 4, 'accepted profile request', '2023-08-17 06:56:52.000000', NULL, 70),
(92, 5, 143, 1, 2, 'accepted profile/gallery picture', '2023-08-17 06:57:00.000000', NULL, NULL),
(93, 5, 138, 1, 4, 'accepted profile request', '2023-08-17 06:57:25.000000', NULL, 81),
(94, 5, 138, 1, 4, 'accepted profile request', '2023-08-17 06:57:26.000000', NULL, 70),
(95, 5, 82, 2, 4, 'accepted profile request', '2023-08-17 06:59:25.000000', NULL, 116),
(96, 5, 82, 2, 4, 'accepted profile request', '2023-08-17 06:59:26.000000', NULL, 146),
(97, 5, 123, 1, 4, 'accepted profile request', '2023-08-17 07:01:40.000000', NULL, 81),
(98, 5, 123, 1, 4, 'accepted profile request', '2023-08-17 07:01:41.000000', NULL, 70),
(99, 5, 122, 1, 4, 'accepted profile request', '2023-08-17 07:01:58.000000', NULL, 70),
(100, 5, 122, 1, 4, 'accepted profile request', '2023-08-17 07:02:00.000000', NULL, 81),
(101, 5, 81, 2, 2, 'accepted profile/gallery picture', '2023-08-17 07:02:23.000000', NULL, NULL),
(102, 5, 173, 1, 4, 'accepted profile request', '2023-08-17 16:45:46.000000', NULL, 100),
(103, 5, 168, 1, 4, 'accepted profile request', '2023-08-17 16:46:00.000000', NULL, 102),
(104, 5, 168, 1, 4, 'accepted profile request', '2023-08-17 16:46:01.000000', NULL, 100),
(105, 5, 168, 1, 4, 'accepted profile request', '2023-08-17 16:46:01.000000', NULL, 77),
(106, 5, 168, 1, 4, 'accepted profile request', '2023-08-17 16:46:02.000000', NULL, 63),
(107, 5, 138, 1, 2, 'accepted profile/gallery picture', '2023-08-17 16:46:18.000000', NULL, NULL),
(108, 5, 84, 2, 4, 'accepted profile request', '2023-08-17 16:46:39.000000', NULL, 122),
(109, 5, 84, 2, 4, 'accepted profile request', '2023-08-17 16:46:39.000000', NULL, 121),
(110, 5, 84, 2, 4, 'accepted profile request', '2023-08-17 16:46:40.000000', NULL, 116),
(111, 5, 84, 2, 4, 'accepted profile request', '2023-08-17 16:46:40.000000', NULL, 173),
(112, 5, 84, 2, 4, 'accepted profile request', '2023-08-17 16:46:42.000000', NULL, 146),
(113, 5, 42, 2, 4, 'accepted profile request', '2023-08-17 16:46:58.000000', NULL, 116),
(114, 5, 168, 1, 4, 'accepted profile request', '2023-08-18 05:16:04.000000', NULL, 103),
(115, 5, 103, 2, 4, 'accepted profile request', '2023-08-18 05:19:33.000000', NULL, 122),
(116, 5, 100, 2, 2, 'accepted profile/gallery picture', '2023-08-18 05:19:53.000000', NULL, NULL),
(117, 5, 100, 2, 4, 'accepted profile request', '2023-08-18 05:20:04.000000', NULL, 121),
(118, 5, 100, 2, 4, 'accepted profile request', '2023-08-18 05:20:05.000000', NULL, 123),
(119, 5, 100, 2, 4, 'accepted profile request', '2023-08-18 05:20:10.000000', NULL, 100),
(120, 5, 173, 1, 4, 'accepted profile request', '2023-08-21 05:57:06.000000', NULL, 45),
(121, 5, 168, 1, 4, 'accepted profile request', '2023-08-21 05:57:58.000000', NULL, 70),
(122, 5, 168, 1, 4, 'accepted profile request', '2023-08-21 05:57:59.000000', NULL, 45),
(123, 5, 121, 1, 4, 'accepted profile request', '2023-08-21 05:58:48.000000', NULL, 70),
(124, 5, 100, 2, 4, 'accepted profile request', '2023-08-21 05:59:03.000000', NULL, 116),
(125, 5, 100, 2, 4, 'accepted profile request', '2023-08-21 05:59:04.000000', NULL, 115),
(126, 5, 84, 2, 4, 'accepted profile request', '2023-08-21 05:59:29.000000', NULL, 115),
(127, 5, 82, 2, 4, 'accepted profile request', '2023-08-21 06:01:38.000000', NULL, 173),
(128, 5, 77, 2, 2, 'accepted profile/gallery picture', '2023-08-21 06:01:50.000000', NULL, NULL),
(129, 5, 42, 2, 4, 'accepted profile request', '2023-08-21 06:01:55.000000', NULL, 115),
(130, 5, 42, 2, 4, 'accepted profile request', '2023-08-21 06:01:56.000000', NULL, 146),
(131, 5, 42, 2, 4, 'accepted profile request', '2023-08-21 06:01:57.000000', NULL, 173),
(132, 5, 232, 1, 4, 'accepted profile request', '2023-08-31 15:39:34.000000', NULL, 93),
(133, 5, 232, 1, 4, 'accepted profile request', '2023-08-31 15:39:35.000000', NULL, 84),
(134, 5, 232, 1, 4, 'accepted profile request', '2023-08-31 15:39:36.000000', NULL, 77),
(135, 5, 232, 1, 4, 'accepted profile request', '2023-08-31 15:39:37.000000', NULL, 46),
(136, 5, 232, 1, 4, 'accepted profile request', '2023-08-31 15:39:37.000000', NULL, 42),
(137, 5, 82, 2, 2, 'accepted profile/gallery picture', '2023-08-31 15:41:14.000000', NULL, NULL),
(138, 5, 173, 1, 4, 'accepted profile request', '2023-09-03 17:43:08.000000', NULL, 133),
(139, 5, 166, 1, 4, 'accepted profile request', '2023-09-03 17:43:29.000000', NULL, 133),
(140, 5, 82, 2, 4, 'accepted profile request', '2023-09-17 12:08:41.000000', NULL, 85),
(141, 5, 70, 2, 2, 'accepted profile/gallery picture', '2023-09-17 12:09:20.000000', NULL, NULL),
(142, 5, 63, 2, 4, 'accepted profile request', '2023-09-17 12:09:34.000000', NULL, 85),
(143, 5, 246, 1, 4, 'accepted profile request', '2023-10-01 02:41:31.000000', NULL, 42),
(144, 5, 246, 1, 4, 'accepted profile request', '2023-10-01 02:41:32.000000', NULL, 133),
(145, 5, 246, 1, 4, 'accepted profile request', '2023-10-01 02:41:32.000000', NULL, 100),
(146, 5, 245, 1, 1, 'rejected profile', '2023-10-01 02:42:26.000000', 0, NULL),
(147, 8, 143, 1, 4, 'accepted profile request', '2023-10-09 17:17:46.000000', NULL, 100),
(148, 8, 151, 2, 4, 'accepted profile request', '2023-10-10 11:29:35.000000', NULL, 116),
(149, 8, 143, 1, 4, 'accepted profile request', '2023-10-11 01:56:33.000000', NULL, 45),
(150, 8, 151, 2, 4, 'accepted profile request', '2023-10-11 01:57:03.000000', NULL, 85),
(151, 8, 151, 2, 4, 'accepted profile request', '2023-10-11 01:58:45.000000', NULL, 116),
(152, 8, 246, 1, 4, 'accepted profile request', '2023-10-12 01:53:01.000000', NULL, 45),
(153, 8, 246, 1, 2, 'accepted profile/gallery picture', '2023-10-20 17:12:14.000000', NULL, NULL),
(154, 8, 256, 1, 4, 'accepted profile request', '2023-10-20 17:14:07.000000', NULL, 100),
(155, 8, 256, 1, 4, 'accepted profile request', '2023-10-21 01:12:07.000000', NULL, 42),
(156, 8, 256, 1, 4, 'accepted profile request', '2023-10-21 01:12:12.000000', NULL, 93),
(157, 8, 246, 1, 2, 'accepted profile/gallery picture', '2023-10-21 09:08:18.000000', NULL, NULL),
(158, 8, 42, 2, 4, 'accepted profile request', '2023-10-23 06:52:00.000000', NULL, 85),
(159, 8, 256, 1, 4, 'accepted profile request', '2023-10-27 08:48:07.000000', NULL, 133),
(160, 8, 246, 1, 4, 'accepted profile request', '2023-10-28 00:59:56.000000', NULL, 82),
(161, 8, 144, 1, 4, 'accepted profile request', '2023-10-28 09:24:50.000000', NULL, 45),
(162, 8, 82, 2, 4, 'accepted profile request', '2023-10-28 09:25:50.000000', NULL, 144),
(163, 8, 103, 2, 4, 'accepted profile request', '2023-10-28 13:15:04.000000', NULL, 144),
(164, 8, 252, 1, 4, 'accepted profile request', '2023-10-29 09:08:23.000000', NULL, 45),
(165, 8, 252, 1, 4, 'accepted profile request', '2023-10-29 09:08:29.000000', NULL, 133),
(166, 8, 252, 1, 4, 'accepted profile request', '2023-10-29 13:45:29.000000', NULL, 82),
(167, 8, 246, 1, 4, 'accepted profile request', '2023-10-30 00:55:22.000000', NULL, 63),
(168, 8, 252, 1, 4, 'accepted profile request', '2023-11-03 00:23:59.000000', NULL, 63),
(169, 8, 252, 1, 4, 'accepted profile request', '2023-11-03 00:24:05.000000', NULL, 42),
(170, 8, 82, 2, 4, 'accepted profile request', '2023-11-05 03:15:07.000000', NULL, 262),
(171, 8, 263, 1, 4, 'accepted profile request', '2023-11-06 09:41:43.000000', NULL, 42),
(172, 8, 263, 1, 4, 'accepted profile request', '2023-11-06 09:41:47.000000', NULL, 45),
(173, 8, 263, 1, 4, 'accepted profile request', '2023-11-06 09:41:55.000000', NULL, 93),
(174, 8, 264, 1, 4, 'accepted profile request', '2023-11-14 01:01:20.000000', NULL, 45),
(175, 8, 264, 1, 4, 'accepted profile request', '2023-11-14 01:01:29.000000', NULL, 133),
(176, 8, 264, 1, 4, 'accepted profile request', '2023-11-16 06:03:57.000000', NULL, 42),
(177, 8, 264, 1, 4, 'accepted profile request', '2023-11-16 06:04:30.000000', NULL, 93),
(178, 8, 264, 1, 4, 'accepted profile request', '2023-11-16 11:45:32.000000', NULL, 151),
(179, 8, 144, 1, 4, 'accepted profile request', '2023-11-17 05:39:03.000000', NULL, 133),
(180, 8, 248, 1, 4, 'accepted profile request', '2023-11-17 05:39:35.000000', NULL, 133),
(181, 8, 263, 1, 4, 'accepted profile request', '2023-11-17 05:40:14.000000', NULL, 133),
(182, 8, 256, 1, 4, 'accepted profile request', '2023-11-17 05:40:42.000000', NULL, 151),
(183, 8, 246, 1, 4, 'accepted profile request', '2023-11-17 05:41:14.000000', NULL, 84),
(184, 8, 168, 1, 4, 'accepted profile request', '2023-11-19 09:43:09.000000', NULL, 133),
(185, 8, 168, 1, 4, 'accepted profile request', '2023-11-19 09:43:22.000000', NULL, 151),
(186, 8, 252, 1, 4, 'accepted profile request', '2023-11-25 12:34:21.000000', NULL, 93),
(187, 8, 166, 1, 4, 'accepted profile request', '2023-11-26 01:04:18.000000', NULL, 158),
(188, 8, 173, 1, 4, 'accepted profile request', '2023-11-26 01:04:46.000000', NULL, 158),
(189, 8, 246, 1, 4, 'accepted profile request', '2023-11-26 01:05:05.000000', NULL, 158),
(190, 8, 252, 1, 4, 'accepted profile request', '2023-11-26 01:05:34.000000', NULL, 158),
(191, 8, 271, 1, 4, 'accepted profile request', '2023-11-26 12:49:43.000000', NULL, 133),
(192, 8, 271, 1, 4, 'accepted profile request', '2023-11-26 12:49:47.000000', NULL, 158),
(193, 8, 271, 1, 4, 'accepted profile request', '2023-11-26 12:49:50.000000', NULL, 77),
(194, 8, 248, 1, 4, 'accepted profile request', '2023-11-26 14:26:54.000000', NULL, 158),
(195, 8, 160, 2, 2, 'accepted profile/gallery picture', '2023-11-26 14:29:50.000000', NULL, NULL),
(196, 5, 116, 1, 1, 'rejected profile', '2023-11-27 03:15:40.000000', 0, NULL),
(197, 8, 116, 1, 1, 'rejected profile', '2023-11-27 04:14:46.000000', 0, NULL),
(198, 8, 143, 1, 4, 'accepted profile request', '2023-11-27 04:38:23.000000', NULL, 70),
(199, 8, 271, 1, 4, 'accepted profile request', '2023-11-27 04:38:57.000000', NULL, 162),
(200, 8, 274, 1, 4, 'accepted profile request', '2023-11-27 04:51:31.000000', NULL, 160),
(201, 8, 274, 1, 4, 'accepted profile request', '2023-11-27 04:51:36.000000', NULL, 133),
(202, 8, 274, 1, 4, 'accepted profile request', '2023-11-27 04:51:39.000000', NULL, 158),
(203, 8, 274, 1, 4, 'accepted profile request', '2023-11-27 04:51:40.000000', NULL, 162),
(204, 8, 164, 2, 4, 'accepted profile request', '2023-11-27 05:26:03.000000', NULL, 173),
(205, 8, 256, 1, 4, 'accepted profile request', '2023-11-27 05:26:23.000000', NULL, 160),
(206, 8, 256, 1, 4, 'accepted profile request', '2023-11-27 05:26:26.000000', NULL, 164),
(207, 8, 256, 1, 4, 'accepted profile request', '2023-11-27 05:26:28.000000', NULL, 70),
(208, 8, 264, 1, 4, 'accepted profile request', '2023-11-27 05:26:46.000000', NULL, 164),
(209, 8, 264, 1, 4, 'accepted profile request', '2023-11-27 05:26:53.000000', NULL, 70),
(210, 8, 162, 2, 2, 'accepted profile/gallery picture', '2023-11-27 05:54:35.000000', NULL, NULL),
(211, 8, 162, 2, 2, 'accepted profile/gallery picture', '2023-11-27 09:09:17.000000', NULL, NULL),
(212, 8, 162, 2, 4, 'accepted profile request', '2023-11-27 09:15:10.000000', NULL, 85),
(213, 8, 253, 1, 4, 'accepted profile request', '2023-11-27 15:36:16.000000', NULL, 70),
(214, 8, 144, 1, 4, 'accepted profile request', '2023-11-28 01:03:44.000000', NULL, 164),
(215, 8, 273, 1, 4, 'accepted profile request', '2023-11-28 04:58:29.000000', NULL, 164),
(216, 8, 273, 1, 4, 'accepted profile request', '2023-11-28 04:58:33.000000', NULL, 70),
(217, 8, 273, 1, 2, 'accepted profile/gallery picture', '2023-11-28 04:58:47.000000', NULL, NULL),
(218, 8, 273, 1, 4, 'accepted profile request', '2023-11-28 05:25:22.000000', NULL, 42),
(219, 8, 252, 1, 4, 'accepted profile request', '2023-11-28 09:09:21.000000', NULL, 162),
(220, 8, 273, 1, 4, 'accepted profile request', '2023-11-28 09:09:44.000000', NULL, 63),
(221, 8, 273, 1, 4, 'accepted profile request', '2023-11-28 09:09:54.000000', NULL, 160),
(222, 8, 158, 2, 4, 'accepted profile request', '2023-11-28 22:38:02.000000', NULL, 85),
(223, 8, 157, 2, 4, 'accepted profile request', '2023-12-03 23:39:59.000000', NULL, 143),
(224, 8, 157, 2, 4, 'accepted profile request', '2023-12-03 23:40:03.000000', NULL, 168),
(225, 8, 70, 2, 2, 'accepted profile/gallery picture', '2023-12-06 14:25:55.000000', NULL, NULL),
(226, 8, 282, 1, 4, 'accepted profile request', '2023-12-06 14:33:55.000000', NULL, 164),
(227, 8, 282, 1, 4, 'accepted profile request', '2023-12-06 14:33:59.000000', NULL, 70),
(228, 8, 282, 1, 2, 'accepted profile/gallery picture', '2023-12-07 01:16:11.000000', NULL, NULL),
(229, 8, 282, 1, 4, 'accepted profile request', '2023-12-07 01:16:36.000000', NULL, 42),
(230, 8, 282, 1, 4, 'accepted profile request', '2023-12-07 01:16:40.000000', NULL, 63),
(231, 8, 133, 2, 4, 'accepted profile request', '2023-12-07 10:34:01.000000', NULL, 262),
(232, 8, 151, 2, 4, 'accepted profile request', '2023-12-08 01:12:28.000000', NULL, 115),
(233, 8, 151, 2, 4, 'accepted profile request', '2023-12-08 01:12:31.000000', NULL, 262),
(234, 8, 271, 1, 2, 'accepted profile/gallery picture', '2023-12-09 21:37:16.000000', NULL, NULL),
(235, 8, 158, 2, 4, 'accepted profile request', '2023-12-10 06:36:10.000000', NULL, 102),
(236, 8, 158, 2, 4, 'accepted profile request', '2023-12-10 06:36:14.000000', NULL, 115),
(237, 8, 283, 1, 4, 'accepted profile request', '2023-12-13 02:32:18.000000', NULL, 164),
(238, 8, 283, 1, 4, 'accepted profile request', '2023-12-13 02:32:21.000000', NULL, 42),
(239, 8, 283, 1, 4, 'accepted profile request', '2023-12-13 02:32:29.000000', NULL, 70),
(240, 5, 84, 2, 4, 'accepted profile request', '2023-12-14 13:02:39.000000', NULL, 282),
(241, 8, 271, 1, 2, 'accepted profile/gallery picture', '2023-12-15 14:19:45.000000', NULL, NULL),
(242, 8, 274, 1, 4, 'accepted profile request', '2023-12-31 05:06:22.000000', NULL, 164),
(243, 8, 252, 1, 4, 'accepted profile request', '2024-01-02 01:28:19.000000', NULL, 164),
(244, 8, 271, 1, 4, 'accepted profile request', '2024-01-03 05:06:49.000000', NULL, 164),
(245, 8, 248, 1, 4, 'accepted profile request', '2024-01-03 05:16:01.000000', NULL, 162),
(246, 8, 115, 1, 4, 'accepted profile request', '2024-01-03 05:22:44.000000', NULL, 162),
(247, 8, 138, 1, 4, 'accepted profile request', '2024-01-03 11:16:40.000000', NULL, 77),
(248, 8, 288, 1, 4, 'accepted profile request', '2024-01-05 14:56:43.000000', NULL, 162),
(249, 8, 77, 2, 4, 'accepted profile request', '2024-01-05 14:57:18.000000', NULL, 85),
(250, 8, 137, 1, 4, 'accepted profile request', '2024-01-08 11:31:12.000000', NULL, 151),
(251, 8, 286, 1, 4, 'accepted profile request', '2024-01-10 05:42:00.000000', NULL, 70),
(252, 8, 286, 1, 4, 'accepted profile request', '2024-01-10 05:42:01.000000', NULL, 158),
(253, 8, 286, 1, 4, 'accepted profile request', '2024-01-10 05:42:03.000000', NULL, 160),
(254, 8, 286, 1, 4, 'accepted profile request', '2024-01-10 05:42:05.000000', NULL, 162),
(255, 8, 246, 1, 4, 'accepted profile request', '2024-01-13 10:58:29.000000', NULL, 162),
(256, 8, 246, 1, 4, 'accepted profile request', '2024-01-13 10:58:30.000000', NULL, 164),
(257, 8, 157, 2, 4, 'accepted profile request', '2024-01-14 05:58:22.000000', NULL, 85),
(258, 8, 246, 1, 4, 'accepted profile request', '2024-01-14 07:47:02.000000', NULL, 160),
(259, 8, 166, 1, 4, 'accepted profile request', '2024-01-14 07:47:26.000000', NULL, 176),
(260, 8, 274, 1, 4, 'accepted profile request', '2024-01-14 21:23:09.000000', NULL, 176),
(261, 8, 148, 1, 2, 'accepted profile/gallery picture', '2024-01-14 21:25:13.000000', NULL, NULL),
(262, 8, 148, 1, 4, 'accepted profile request', '2024-01-14 21:26:48.000000', NULL, 42),
(263, 8, 148, 1, 4, 'accepted profile request', '2024-01-14 21:26:57.000000', NULL, 77),
(264, 8, 148, 1, 4, 'accepted profile request', '2024-01-14 21:26:59.000000', NULL, 160),
(265, 8, 286, 1, 4, 'accepted profile request', '2024-01-15 04:42:55.000000', NULL, 176),
(266, 8, 252, 1, 4, 'accepted profile request', '2024-01-15 08:54:46.000000', NULL, 176),
(267, 8, 143, 1, 4, 'accepted profile request', '2024-01-15 12:52:12.000000', NULL, 151),
(268, 8, 290, 1, 4, 'accepted profile request', '2024-01-17 00:51:17.000000', NULL, 63),
(269, 8, 290, 1, 5, 'rejected profile request', '2024-01-17 00:52:21.000000', 4, 158),
(270, 8, 290, 1, 5, 'rejected profile request', '2024-01-17 00:52:43.000000', 4, 162),
(271, 8, 290, 1, 5, 'rejected profile request', '2024-01-17 00:52:49.000000', 4, 176),
(272, 8, 290, 1, 5, 'rejected profile request', '2024-01-17 00:54:26.000000', 4, 158),
(273, 8, 290, 1, 5, 'rejected profile request', '2024-01-17 00:54:38.000000', 4, 162),
(274, 8, 290, 1, 5, 'rejected profile request', '2024-01-17 00:54:41.000000', 4, 176),
(275, 8, 290, 1, 5, 'rejected profile request', '2024-01-17 13:47:14.000000', 4, 158),
(276, 8, 290, 1, 5, 'rejected profile request', '2024-01-17 13:47:26.000000', 4, 162),
(277, 8, 290, 1, 5, 'rejected profile request', '2024-01-17 13:47:33.000000', 4, 176),
(278, 8, 185, 2, 4, 'accepted profile request', '2024-01-23 02:46:41.000000', NULL, 115),
(279, 8, 185, 2, 4, 'accepted profile request', '2024-01-23 02:46:45.000000', NULL, 85),
(280, 8, 290, 1, 5, 'rejected profile request', '2024-01-23 02:48:35.000000', 4, 158),
(281, 8, 290, 1, 5, 'rejected profile request', '2024-01-23 02:48:45.000000', 4, 162),
(282, 8, 290, 1, 5, 'rejected profile request', '2024-01-23 02:48:49.000000', 4, 176),
(283, 8, 109, 1, 4, 'accepted profile request', '2024-01-23 11:10:06.000000', NULL, 42),
(284, 8, 109, 1, 4, 'accepted profile request', '2024-01-23 11:10:12.000000', NULL, 63),
(285, 8, 109, 1, 4, 'accepted profile request', '2024-01-23 11:10:15.000000', NULL, 84),
(286, 8, 109, 1, 5, 'rejected profile request', '2024-01-23 11:11:20.000000', 4, 160),
(287, 8, 109, 1, 5, 'rejected profile request', '2024-01-28 08:38:50.000000', 4, 160),
(288, 8, 246, 1, 4, 'accepted profile request', '2024-01-28 23:55:38.000000', NULL, 176),
(289, 8, 124, 1, 4, 'accepted profile request', '2024-01-28 23:56:11.000000', NULL, 151),
(290, 8, 124, 1, 4, 'accepted profile request', '2024-01-28 23:56:13.000000', NULL, 162),
(291, 8, 256, 1, 4, 'accepted profile request', '2024-01-30 10:58:52.000000', NULL, 188),
(292, 8, 264, 1, 4, 'accepted profile request', '2024-01-30 10:59:20.000000', NULL, 188),
(293, 8, 283, 1, 4, 'accepted profile request', '2024-01-30 14:01:34.000000', NULL, 160),
(294, 8, 283, 1, 4, 'accepted profile request', '2024-01-30 14:01:41.000000', NULL, 188),
(295, 8, 173, 1, 4, 'accepted profile request', '2024-01-30 14:02:02.000000', NULL, 188),
(296, 8, 173, 1, 4, 'accepted profile request', '2024-01-30 14:02:05.000000', NULL, 176),
(297, 8, 274, 1, 4, 'accepted profile request', '2024-01-30 14:02:59.000000', NULL, 188),
(298, 8, 115, 1, 4, 'accepted profile request', '2024-01-30 14:03:19.000000', NULL, 188),
(299, 8, 282, 1, 4, 'accepted profile request', '2024-01-30 14:11:31.000000', NULL, 93),
(300, 8, 248, 1, 4, 'accepted profile request', '2024-01-31 00:56:14.000000', NULL, 188),
(301, 8, 137, 1, 4, 'accepted profile request', '2024-01-31 00:56:30.000000', NULL, 188),
(302, 8, 290, 1, 5, 'rejected profile request', '2024-02-01 01:21:27.000000', 4, 188),
(303, 8, 290, 1, 5, 'rejected profile request', '2024-02-01 01:21:57.000000', 4, 158),
(304, 8, 290, 1, 5, 'rejected profile request', '2024-02-01 01:22:02.000000', 4, 162),
(305, 8, 109, 1, 5, 'rejected profile request', '2024-02-01 01:22:28.000000', 4, 160),
(306, 8, 271, 1, 4, 'accepted profile request', '2024-02-01 09:07:39.000000', NULL, 180),
(307, 8, 271, 1, 4, 'accepted profile request', '2024-02-01 09:07:40.000000', NULL, 188),
(308, 8, 246, 1, 4, 'accepted profile request', '2024-02-01 09:08:05.000000', NULL, 188),
(309, 8, 252, 1, 4, 'accepted profile request', '2024-02-03 00:24:44.000000', NULL, 188),
(310, 8, 293, 1, 4, 'accepted profile request', '2024-02-05 00:20:44.000000', NULL, 70),
(311, 8, 293, 1, 4, 'accepted profile request', '2024-02-05 00:20:50.000000', NULL, 180),
(312, 8, 299, 1, 2, 'accepted profile/gallery picture', '2024-02-05 09:43:55.000000', NULL, NULL),
(313, 8, 299, 1, 4, 'accepted profile request', '2024-02-05 09:46:28.000000', NULL, 63),
(314, 8, 299, 1, 4, 'accepted profile request', '2024-02-05 09:46:29.000000', NULL, 70),
(315, 8, 299, 1, 4, 'accepted profile request', '2024-02-05 09:46:35.000000', NULL, 77),
(316, 8, 299, 1, 4, 'accepted profile request', '2024-02-05 09:46:38.000000', NULL, 180),
(317, 8, 299, 1, 4, 'accepted profile request', '2024-02-05 09:46:39.000000', NULL, 188),
(318, 8, 77, 2, 4, 'accepted profile request', '2024-02-06 17:39:43.000000', NULL, 100),
(319, 8, 286, 1, 4, 'accepted profile request', '2024-02-06 17:40:07.000000', NULL, 180),
(320, 8, 299, 1, 2, 'accepted profile/gallery picture', '2024-02-07 23:37:53.000000', NULL, NULL),
(321, 8, 299, 1, 2, 'accepted profile/gallery picture', '2024-02-09 00:23:48.000000', NULL, NULL),
(322, 8, 299, 1, 2, 'accepted profile/gallery picture', '2024-02-09 23:44:14.000000', NULL, NULL),
(323, 8, 299, 1, 2, 'accepted profile/gallery picture', '2024-02-10 23:42:11.000000', NULL, NULL),
(324, 8, 292, 1, 4, 'accepted profile request', '2024-02-10 23:43:07.000000', NULL, 77),
(325, 8, 102, 1, 4, 'accepted profile request', '2024-02-11 09:39:40.000000', NULL, 176),
(326, 8, 299, 1, 2, 'accepted profile/gallery picture', '2024-02-12 00:03:33.000000', NULL, NULL),
(327, 8, 173, 1, 4, 'accepted profile request', '2024-02-14 00:33:11.000000', NULL, 173),
(328, 8, 274, 1, 4, 'accepted profile request', '2024-02-14 05:16:25.000000', NULL, 173),
(329, 8, 246, 1, 4, 'accepted profile request', '2024-02-16 00:15:11.000000', NULL, 173),
(330, 8, 293, 1, 2, 'accepted profile/gallery picture', '2024-02-17 06:08:55.000000', NULL, NULL),
(331, 8, 196, 2, 4, 'accepted profile request', '2024-02-19 14:20:31.000000', NULL, 102),
(332, 8, 196, 2, 4, 'accepted profile request', '2024-02-19 14:20:36.000000', NULL, 173),
(333, 8, 143, 1, 4, 'accepted profile request', '2024-02-25 01:34:25.000000', NULL, 188),
(334, 8, 196, 2, 2, 'accepted profile/gallery picture', '2024-02-25 08:13:20.000000', NULL, NULL),
(335, 8, 196, 2, 2, 'accepted profile/gallery picture', '2024-02-25 15:57:38.000000', NULL, NULL),
(336, 8, 196, 2, 2, 'accepted profile/gallery picture', '2024-02-26 05:57:39.000000', NULL, NULL),
(337, 8, 290, 1, 5, 'rejected profile request', '2024-03-01 01:36:37.000000', 4, 158),
(338, 8, 290, 1, 5, 'rejected profile request', '2024-03-01 01:36:49.000000', 4, 188),
(339, 8, 290, 1, 5, 'rejected profile request', '2024-03-01 01:37:32.000000', 4, 176),
(340, 8, 246, 1, 3, 'rejected profile/gallery picture', '2024-03-02 22:51:37.000000', 0, NULL),
(341, 8, 109, 1, 4, 'accepted profile request', '2024-03-03 23:07:04.000000', NULL, 160),
(342, 8, 193, 2, 2, 'accepted profile/gallery picture', '2024-03-03 23:08:21.000000', NULL, NULL),
(343, 8, 299, 1, 5, 'rejected profile request', '2024-03-03 23:10:15.000000', 4, 151),
(344, 8, 293, 1, 4, 'accepted profile request', '2024-03-03 23:10:39.000000', NULL, 77),
(345, 8, 193, 2, 4, 'accepted profile request', '2024-03-03 23:11:39.000000', NULL, 252),
(346, 8, 109, 1, 5, 'rejected profile request', '2024-03-03 23:15:04.000000', 4, 193),
(347, 8, 252, 1, 4, 'accepted profile request', '2024-03-06 02:56:52.000000', NULL, 173),
(348, 8, 180, 2, 4, 'accepted profile request', '2024-03-14 14:16:02.000000', NULL, 102),
(349, 8, 115, 1, 4, 'accepted profile request', '2024-03-15 10:37:50.000000', NULL, 196),
(350, 8, 115, 1, 4, 'accepted profile request', '2024-03-15 10:37:52.000000', NULL, 201),
(351, 8, 299, 1, 5, 'rejected profile request', '2024-03-16 14:16:26.000000', 4, 151),
(352, 8, 290, 1, 5, 'rejected profile request', '2024-03-16 14:17:05.000000', 4, 158),
(353, 8, 290, 1, 5, 'rejected profile request', '2024-03-16 14:17:15.000000', 4, 176),
(354, 8, 70, 2, 4, 'accepted profile request', '2024-03-23 06:06:51.000000', NULL, 102),
(355, 8, 292, 1, 5, 'rejected profile request', '2024-03-27 08:56:10.000000', 4, 42),
(356, 8, 311, 1, 4, 'accepted profile request', '2024-03-27 08:57:09.000000', NULL, 173),
(357, 8, 311, 1, 4, 'accepted profile request', '2024-03-27 08:57:12.000000', NULL, 158),
(358, 8, 286, 1, 4, 'accepted profile request', '2024-03-30 03:31:28.000000', NULL, 63),
(359, 8, 293, 1, 5, 'rejected profile request', '2024-03-30 03:32:14.000000', 4, 42),
(360, 8, 151, 2, 4, 'accepted profile request', '2024-03-30 03:32:42.000000', NULL, 311),
(361, 8, 312, 1, 4, 'accepted profile request', '2024-04-02 14:55:52.000000', NULL, 42),
(362, 8, 312, 1, 4, 'accepted profile request', '2024-04-02 14:55:59.000000', NULL, 46),
(363, 8, 312, 1, 4, 'accepted profile request', '2024-04-02 14:56:01.000000', NULL, 70),
(364, 8, 312, 1, 4, 'accepted profile request', '2024-04-02 14:56:03.000000', NULL, 77),
(365, 8, 299, 1, 5, 'rejected profile request', '2024-04-05 11:30:44.000000', 4, 151),
(366, 8, 299, 1, 4, 'accepted profile request', '2024-04-05 11:30:50.000000', NULL, 158),
(367, 8, 293, 1, 5, 'rejected profile request', '2024-04-05 11:41:37.000000', 4, 42),
(368, 8, 292, 1, 5, 'rejected profile request', '2024-04-05 11:42:05.000000', 4, 42),
(369, 8, 124, 1, 2, 'accepted profile/gallery picture', '2024-04-06 16:17:08.000000', NULL, NULL),
(370, 8, 312, 1, 4, 'accepted profile request', '2024-04-06 16:17:26.000000', NULL, 63),
(371, 8, 314, 1, 4, 'accepted profile request', '2024-04-07 07:52:58.000000', NULL, 42),
(372, 8, 314, 1, 4, 'accepted profile request', '2024-04-07 07:53:00.000000', NULL, 63),
(373, 8, 314, 1, 4, 'accepted profile request', '2024-04-07 07:53:02.000000', NULL, 70),
(374, 8, 314, 1, 4, 'accepted profile request', '2024-04-07 07:53:14.000000', NULL, 93),
(375, 8, 314, 1, 4, 'accepted profile request', '2024-04-07 07:53:15.000000', NULL, 84),
(376, 8, 314, 1, 4, 'accepted profile request', '2024-04-07 15:41:19.000000', NULL, 160),
(377, 8, 196, 2, 4, 'accepted profile request', '2024-04-08 04:11:45.000000', NULL, 122),
(378, 8, 196, 2, 4, 'accepted profile request', '2024-04-08 04:11:49.000000', NULL, 124),
(379, 8, 180, 2, 5, 'rejected profile request', '2024-04-14 23:55:10.000000', 4, 100),
(380, 8, 204, 2, 4, 'accepted profile request', '2024-04-16 10:09:46.000000', NULL, 246),
(381, 8, 63, 2, 4, 'accepted profile request', '2024-04-16 17:21:57.000000', NULL, 173),
(382, 8, 201, 2, 4, 'accepted profile request', '2024-04-17 12:32:12.000000', NULL, 311),
(383, 8, 124, 1, 4, 'accepted profile request', '2024-05-01 02:14:55.000000', NULL, 173),
(384, 8, 124, 1, 4, 'accepted profile request', '2024-05-01 02:14:59.000000', NULL, 201),
(385, 8, 204, 2, 5, 'rejected profile request', '2024-05-01 02:15:42.000000', 4, 102),
(386, 8, 315, 1, 2, 'accepted profile/gallery picture', '2024-05-04 14:26:11.000000', NULL, NULL),
(387, 8, 70, 2, 4, 'accepted profile request', '2024-05-04 14:27:41.000000', NULL, 315),
(388, 8, 274, 1, 4, 'accepted profile request', '2024-05-14 02:33:09.000000', NULL, 180),
(389, 8, 204, 2, 5, 'rejected profile request', '2024-05-14 02:34:16.000000', 4, 102),
(390, 8, 299, 1, 5, 'rejected profile request', '2024-05-14 02:35:12.000000', 4, 151),
(391, 8, 293, 1, 5, 'rejected profile request', '2024-05-17 00:21:06.000000', 4, 42),
(392, 8, 246, 1, 4, 'accepted profile request', '2024-05-23 03:52:36.000000', NULL, 180),
(393, 10, 25, 2, 4, 'accepted profile request', '2024-05-26 00:24:57.000000', NULL, 62),
(394, 10, 25, 2, 5, 'rejected profile request', '2024-05-26 00:31:27.000000', 4, 89),
(395, 10, 62, 1, 4, 'accepted profile request', '2024-05-26 00:45:20.000000', NULL, 28),
(396, 10, 62, 1, 5, 'rejected profile request', '2024-05-26 00:46:04.000000', 4, 29),
(397, 10, 62, 1, 4, 'accepted profile request', '2024-05-26 00:46:07.000000', NULL, 30),
(398, 8, 299, 1, 5, 'rejected profile request', '2024-05-25 17:45:40.000000', 0, 151),
(399, 8, 290, 1, 5, 'rejected profile request', '2024-05-25 17:46:14.000000', 0, 158),
(400, 8, 292, 1, 5, 'rejected profile request', '2024-05-25 17:46:54.000000', 0, 42),
(401, 8, 293, 1, 5, 'rejected profile request', '2024-05-25 17:47:21.000000', 0, 42),
(402, 8, 180, 2, 5, 'rejected profile request', '2024-05-25 17:47:42.000000', 0, 100),
(403, 8, 204, 2, 5, 'rejected profile request', '2024-05-25 17:48:04.000000', 0, 102);

-- --------------------------------------------------------

--
-- Table structure for table `UserApp_adminuser`
--

CREATE TABLE `UserApp_adminuser` (
  `adminId` int(11) NOT NULL,
  `adminUserName` varchar(500) DEFAULT NULL,
  `adminPass` varchar(500) DEFAULT NULL,
  `adminFullName` varchar(500) DEFAULT NULL,
  `adminLevel` varchar(500) DEFAULT NULL,
  `adminStatus` varchar(500) DEFAULT NULL,
  `adminToken` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserApp_adminuser`
--

INSERT INTO `UserApp_adminuser` (`adminId`, `adminUserName`, `adminPass`, `adminFullName`, `adminLevel`, `adminStatus`, `adminToken`) VALUES
(1, 'abulfaizullah', 'bfaizullah1234', 'Abul Bashar Faizullah', 'TOP', 'Active', '63416389'),
(3, 'adminmuna', 'muna1234', 'Matrimonial Admin', 'MODERATOR', 'Active', '84703080'),
(4, 'innovationbd21', 'innovation24434', 'Innovation Bangladesh', 'MODERATOR', 'Active', '50918194'),
(5, 'amuqim', 'AamMuqim55#', 'Abdullah Muqim', 'TOP', 'Active', '22319888'),
(6, 'rislam', 'IslamMR45#', 'Mohammed Riajul Islam', 'MODERATOR', 'Active', '82517544'),
(7, 'nislam', 'IslamPR54#', 'Mohammad Nazrul Islam', 'MODERATOR', 'Active', NULL),
(8, 'ammunnie', '@munnie23#', 'Ayesha Mahmuda Munnie', 'MODERATOR', 'Active', '22986916'),
(9, 'makter', 'm@kter23#', 'Mohsena Akter', 'MODERATOR', 'Active', '25150982'),
(10, 'innovation2', 'innovation24434', 'Innovation 2', 'MODERATOR', 'Active', '47046938');

-- --------------------------------------------------------

--
-- Table structure for table `UserApp_femaleuser`
--

CREATE TABLE `UserApp_femaleuser` (
  `userId` int(11) NOT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `nickName` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `cellPhone` varchar(100) DEFAULT NULL,
  `workPhone` varchar(100) DEFAULT NULL,
  `homePhone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `personalWebsite` varchar(200) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `placeOfBirth` varchar(100) DEFAULT NULL,
  `health` varchar(500) DEFAULT NULL,
  `maritalStatus` varchar(100) DEFAULT NULL,
  `children` varchar(100) DEFAULT NULL,
  `childrenNumber` int(11) DEFAULT NULL,
  `childrenAges` varchar(100) DEFAULT NULL,
  `immigrationStatus` varchar(100) DEFAULT NULL,
  `immigrationStatusOther` varchar(100) DEFAULT NULL,
  `highSchool` varchar(100) DEFAULT NULL,
  `highSchoolYear` int(11) DEFAULT NULL,
  `bachelors` varchar(100) DEFAULT NULL,
  `bachelorsYear` int(11) DEFAULT NULL,
  `masters` varchar(100) DEFAULT NULL,
  `mastersYear` int(11) DEFAULT NULL,
  `doctorate` varchar(100) DEFAULT NULL,
  `doctorateYear` int(11) DEFAULT NULL,
  `otherDegree` varchar(200) DEFAULT NULL,
  `otherDegreeYear` int(11) DEFAULT NULL,
  `highestEducation` varchar(100) DEFAULT NULL,
  `employed` varchar(100) DEFAULT NULL,
  `employment` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `income` int(11) DEFAULT NULL,
  `religiousPractice` varchar(100) DEFAULT NULL,
  `religiousPracticeOther` varchar(100) DEFAULT NULL,
  `religiousPracticeBrief` varchar(500) DEFAULT NULL,
  `revertTime` varchar(100) DEFAULT NULL,
  `wear` varchar(100) DEFAULT NULL,
  `smoker` varchar(100) DEFAULT NULL,
  `preReligious` varchar(100) DEFAULT NULL,
  `preReligiousOther` varchar(100) DEFAULT NULL,
  `preReligiousBrief` varchar(500) DEFAULT NULL,
  `preBeard` varchar(100) DEFAULT NULL,
  `preSmoking` varchar(100) DEFAULT NULL,
  `preEthnic` varchar(100) DEFAULT NULL,
  `preEthnicSpecific` varchar(500) DEFAULT NULL,
  `preImmigrationStatus` varchar(100) DEFAULT NULL,
  `preImmigrationStatusOther` varchar(100) DEFAULT NULL,
  `preMaritalStatus` varchar(100) DEFAULT NULL,
  `preChildren` varchar(100) DEFAULT NULL,
  `preEducation` varchar(100) DEFAULT NULL,
  `preEmployment` varchar(100) DEFAULT NULL,
  `preIncome` int(11) DEFAULT NULL,
  `preAgeGap` int(11) DEFAULT NULL,
  `guarName` varchar(100) DEFAULT NULL,
  `guarAddress` varchar(500) DEFAULT NULL,
  `guarCity` varchar(100) DEFAULT NULL,
  `guarState` varchar(100) DEFAULT NULL,
  `guarCountry` varchar(100) DEFAULT NULL,
  `guarPhone` varchar(100) DEFAULT NULL,
  `guarEmail` varchar(100) DEFAULT NULL,
  `guarProfession` varchar(100) DEFAULT NULL,
  `familyBrief` varchar(500) DEFAULT NULL,
  `refName1` varchar(100) DEFAULT NULL,
  `refRelation1` varchar(100) DEFAULT NULL,
  `refPhone1` varchar(100) DEFAULT NULL,
  `refName2` varchar(100) DEFAULT NULL,
  `refRelation2` varchar(100) DEFAULT NULL,
  `refPhone2` varchar(100) DEFAULT NULL,
  `refName3` varchar(100) DEFAULT NULL,
  `refRelation3` varchar(100) DEFAULT NULL,
  `refPhone3` varchar(100) DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `cv` varchar(500) DEFAULT NULL,
  `album` varchar(500) DEFAULT NULL,
  `govIssuedId` varchar(500) DEFAULT NULL,
  `matchShowLimit` int(11) DEFAULT NULL,
  `userPass` varchar(200) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `openingDate` datetime(6) DEFAULT NULL,
  `lastEdit` datetime(6) DEFAULT NULL,
  `userToken` varchar(100) DEFAULT NULL,
  `profileCompleteness` int(11) DEFAULT NULL,
  `matchId` varchar(100) DEFAULT NULL,
  `matchPercentage` varchar(100) DEFAULT NULL,
  `reqAccepted` varchar(100) DEFAULT NULL,
  `reqRejected` varchar(100) DEFAULT NULL,
  `reqSent` varchar(100) DEFAULT NULL,
  `birthYear` int(11) DEFAULT NULL,
  `signature` varchar(500) DEFAULT NULL,
  `gallery` varchar(2000) DEFAULT NULL,
  `tempGallery` varchar(2000) DEFAULT NULL,
  `lockedId` int(11) DEFAULT NULL,
  `cuMatchId` varchar(1000) DEFAULT NULL,
  `reqLock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserApp_femaleuser`
--

INSERT INTO `UserApp_femaleuser` (`userId`, `fullName`, `nickName`, `gender`, `address`, `city`, `state`, `zip`, `cellPhone`, `workPhone`, `homePhone`, `email`, `personalWebsite`, `age`, `dateOfBirth`, `height`, `weight`, `placeOfBirth`, `health`, `maritalStatus`, `children`, `childrenNumber`, `childrenAges`, `immigrationStatus`, `immigrationStatusOther`, `highSchool`, `highSchoolYear`, `bachelors`, `bachelorsYear`, `masters`, `mastersYear`, `doctorate`, `doctorateYear`, `otherDegree`, `otherDegreeYear`, `highestEducation`, `employed`, `employment`, `position`, `income`, `religiousPractice`, `religiousPracticeOther`, `religiousPracticeBrief`, `revertTime`, `wear`, `smoker`, `preReligious`, `preReligiousOther`, `preReligiousBrief`, `preBeard`, `preSmoking`, `preEthnic`, `preEthnicSpecific`, `preImmigrationStatus`, `preImmigrationStatusOther`, `preMaritalStatus`, `preChildren`, `preEducation`, `preEmployment`, `preIncome`, `preAgeGap`, `guarName`, `guarAddress`, `guarCity`, `guarState`, `guarCountry`, `guarPhone`, `guarEmail`, `guarProfession`, `familyBrief`, `refName1`, `refRelation1`, `refPhone1`, `refName2`, `refRelation2`, `refPhone2`, `refName3`, `refRelation3`, `refPhone3`, `photo`, `cv`, `album`, `govIssuedId`, `matchShowLimit`, `userPass`, `status`, `openingDate`, `lastEdit`, `userToken`, `profileCompleteness`, `matchId`, `matchPercentage`, `reqAccepted`, `reqRejected`, `reqSent`, `birthYear`, `signature`, `gallery`, `tempGallery`, `lockedId`, `cuMatchId`, `reqLock`) VALUES
(25, 'Candidate 1', NULL, 'Female', 'Address 1', 'Chalfont', 'NY', '101101.0', 'sdfsafwerwf', 'sdfafasdf', 'sdfafsdfa', 'test1', NULL, 29, NULL, NULL, NULL, '<h1> I am test </h1><script> this is test script </script>', NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Doctorate', 'Yes', NULL, NULL, NULL, 'Other', NULL, NULL, NULL, 'Headscarf', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'No Preference', 'No Preference', 'nullUS Citizen,H1B,', NULL, 'nullNo Preference,', 'No', 'Bachelor', 'Yes', 50000, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, '2024-05-26 00:42:53.000000', '28216563', 83, '62,66,79,87,89,63,67,72', '60,60,60,60,60,50,50,40', '', NULL, NULL, 1989, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, '62,66,79,87,89,63,67,72', NULL),
(26, 'Candidate 3', NULL, 'Female', 'Address 3', 'Woodside', 'NY', '101101.0', '000-000-0002', NULL, NULL, 'test3@gmail.com', NULL, 27, NULL, 63, 130, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Doctorate', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, NULL, 'No', 'Sunni', NULL, NULL, 'Yes', 'No', NULL, 'Bengali', 'US Citizen', NULL, 'Single', 'No', 'Masters', 'Yes', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Capture3.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, '2022-04-23 08:47:12.000000', '23163609', 83, '61,95,62,63,72,66,67,70,79,', '60,60,60,60,50,50,50,50,50', '62,66,67,69', NULL, NULL, 1995, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(28, 'Candidate 11', NULL, 'Female', 'Address 11', 'Northern NJ', 'NY', '101101.0', '000-000-0010', NULL, NULL, 'test11@gmail.com', NULL, 28, NULL, 61, 107, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, NULL, 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', NULL, 'Bengali', 'US Citizen,Parmanent Resident,F-1', NULL, 'Single', 'No', 'Bachelor', 'No Preference', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, '2022-04-02 17:52:13.000000', '79160102', 80, '62,89,95,61,63,67,72,79,87,', '60,60,60,50,40,40,40,40,40,40,', NULL, '', NULL, 1994, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, '62,89,95,61,85,63,67,72,79,87,', NULL),
(29, 'Candidate 16', NULL, 'Female', 'Address 16', 'Astoria', 'NY', '101101.0', '000-000-0015', NULL, NULL, 'test16@gmail.com', NULL, 22, NULL, 65, 150, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'Jelbab/Abaya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen,EAD', NULL, 'Single', 'No', 'Bachelor', 'No Preference', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '62,70,72,61,63,67,69,73,78,', '60,60,60,60,60,50,50,40,40', NULL, '', NULL, 1997, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, '62,70,72,61,63,67,69,73,78', NULL),
(30, 'Candidate 18', NULL, 'Female', 'Address 18', 'Gibbsboro', 'NY', '101101.0', '000-000-0017', NULL, NULL, 'test18@gmail.com', NULL, 25, NULL, 62, 125, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, 60000, 'Sunni', NULL, NULL, NULL, 'None', 'No', 'Sunni', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Single', 'No', 'Masters', 'Yes', 150000, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '95,61,62,63,67,72,89,65,66,', '60,50,50,50,50,50,50,50,40,40,', '95', NULL, NULL, 1992, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(31, 'Afia Adilah Khan', 'PushpoK', 'Female', '1033 Glenmore Ave, Brooklyn, NY 11208, United States', 'Honolulu', 'Indiana', '45678', '1423234326', NULL, NULL, 'fatemajohra@munamail.com', 'www.fatema.com', 26, NULL, 61, 130, 'Kalifornia', 'no', 'Single', 'Yes', NULL, '0', 'Permanent Resident', NULL, 'azizur', 300009, 'CSE', 2016, 'ICT', 2018, 'Cyber Security', 2021, 'Media', 2022, 'Masters', 'Yes', 'UK', 'IT expart', 119999, 'Sunni', 'Maliki', 'I am so much Happy with my Religious.', NULL, 'Headscarf,Niqab,', 'No', 'Other', 'Habboli', 'Alhamdulillah. I am so much happy.', 'No Preference', 'No Preference', 'Specific Ethnicity', 'Bangladeshi', 'Permanent Resident,Student Visa,F-1,H1B,', NULL, 'No Preference,', 'No', 'Bachelor', 'Yes', 100000, 3, 'Azizur Rahman', 'Dhaka, Bangladesh', 'Mymensingh', 'Alabama', 'Bangladesh', '222333444878', 'aizur.rahman@gmail.com', 'Teacher', 'Cultural Person', 'Iftekhar', 'Uncle', '12323234234', NULL, NULL, NULL, NULL, NULL, NULL, '48QXRP46MANJ6JWUF5QDangular_2_logo.png', 'MUNA-Matrimonial-Registration-Form-June-2018.pdf', NULL, 'about-img.png', 7, 'VFZSSk1FMUVXWG89', 'Inactive', '2022-03-18 12:36:04.000000', '2022-11-29 15:44:34.000000', '55220491', 100, '66,63,67,72', '60,50,50,50', '78,70,73,69,64,61,62,65,65,67', NULL, '66', 1996, 'client-2.png', 'love-hand.jpg,federico-beccari.jpg,soroush-karimi.jpg,6.jpg', NULL, NULL, NULL, NULL),
(32, 'Rifat', NULL, 'Female', NULL, NULL, 'Illinois', NULL, '78877988099', NULL, NULL, 'rifatdjmc25@gmail.com', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sunni', NULL, NULL, 'Beard', 'No', 'Own Ethnicity', NULL, NULL, NULL, 'Single', 'No', 'Masters', 'Employed', NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile-icon.png', NULL, NULL, NULL, 5, 'VFZSSmVnPT0=', 'Inactive', '2022-03-18 15:47:32.000000', '2022-11-10 12:33:00.000000', '30963008', 31, '', '50,50,50,50,40,40,40,40,40,40,', NULL, NULL, '', NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(33, 'Fatema Siddiqa', 'Shornaly', 'Female', '14 Furlong Rd', 'Cheektowaga', 'New York', '14215', '3475576481', NULL, NULL, 'fatemasi@buffalo.edu', NULL, 22, NULL, 66, 145, 'Brooklyn', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Millennium Brooklyn High School', 2018, 'University at Buffalo', 2021, 'IOU - Islamic Studies', NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Al-Quran Academy', 'Teacher', 28000, 'Sunni', NULL, 'I am a practicing Muslim. I pray regularly, fast, and I am active in dawah activities and halaqas in MUNA.', NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Sunni', NULL, 'He should practice Islam seriously and follow the Sunnah to the best of his ability.', 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 7, 'Abu Baker Shiddque Harun', '14 furlong Rd', 'cheektowaga', 'New York', 'United States', '9172159737', 'Bshiddque@gmail.com', 'IT Senior Programmer', 'The employment section doesn\'t work - any amount I enter doesn\'t qualify. Just wanted to state I prefer someone employed.', 'Imam Delwar Hussain', 'Family Friend', '9173486416', 'Firoza Akter Poly', 'Family Friend', '6463593212', 'Rokeya Rahman Rina', 'Family Friend', '2138405425', 'C5YQXFPprofile_pic_1.jpg', 'Marriage_Resume_Fatema_Siddiqa.pdf', NULL, 'profile_long_pic_dQCdpKL.JPG', 5, 'VVZjeGRGbFlTWGxOUkVVd1NrRTlQUT09', 'Deactivated', '2022-11-26 12:57:36.000000', '2023-01-29 05:48:54.000000', '24072838', 90, '100,115,123,138,101,116,121,122,137', '50,50,50,50,40,40,40,40,40', '115,116,122,100,123,121', NULL, NULL, 2000, 'Digital_Signature.txt', 'profile_pic_dQC.JPG,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, '100,101,115,116,85,121,122,123,137,138,', NULL),
(34, 'mossamat', NULL, 'Female', NULL, 'Brooklyn', 'New Hampshire', NULL, '4564646666', NULL, NULL, 'mdnhoque1@gmail.com', NULL, 34, NULL, 5, 150, NULL, NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'sdfasdf', NULL, 'sdfsdfsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'No', NULL, NULL, 1, 'Sunni', NULL, NULL, NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Sunni', NULL, 'fsfsf', 'No Preference', 'No Preference', 'No Preference', 'No Preference', 'No Preference,', NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 1, 5, 'dsfsdfad', NULL, NULL, NULL, NULL, '4645646466', '1234@gmail.com', NULL, NULL, 'sdfasf', 'sdfaf', '4645646466', NULL, NULL, NULL, NULL, NULL, NULL, 'R4NU2B4canstockphoto22402523-arcos-creator.com_-1024x1024-1.jpg', NULL, NULL, NULL, 5, 'VmtkV2VtUkZRWGhOYWs1Qg==', 'Inactive', '2022-12-31 04:45:36.000000', '2022-12-31 05:31:58.000000', '57504080', 97, '101,100,115,116,121,122,123,', '30,30,20,20,20,20,20,', '115', NULL, NULL, 1988, NULL, 'Z6CVSW4canstockphoto22402523-arcos-creator.com_-1024x1024-1.jpg,YPQ89MXcanstockphoto22402523-arcos-creator.com_-1024x1024-1.jpg,WHVUJHBcanstockphoto22402523-arcos-creator.com_-1024x1024-1.jpg,NIBFGM4canstockphoto22402523-arcos-creator.com_-1024x1024-1.jpg', NULL, NULL, '101,100,115,116,121,122,123,', NULL),
(35, 'Nafiza Tarannum', NULL, 'Female', '3351 73rd st', 'Jackson Heights', 'New York', '11372', '7184158825', NULL, '7184158825', 'ntarannum5399@gmail.com', NULL, 23, NULL, 62, 165, 'Bangladesh, Dhaka', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Brooklyn Technical High School', 2018, 'City College of New York', 2022, 'Columbia University', 2024, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Teachers College, Columbia University', 'Administrative Fellow', 5000, 'Sunni', NULL, 'Daily prayers, fasting, part of the Masjid and very involved in the NY masjid community.', NULL, 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 99998, 6, 'Mohamed S Miah', '3351 73rd st\nApt 1F', 'Jackson Heights', 'New York', 'United States', '3476592747', 'miahmohamed65@gmail.com', 'Lyft Driver', 'My mother is a housewife.', 'Sadia Tasnim', 'Coworker/Friend', '6463200867', 'Ayesha Mahmuda', 'MUNA Community Leader', '9294350224', 'Tabassum Bhuiyan', 'Coworker/Friend', '3479856291', 'anonymous.png', 'I08S76LNafiza_Tarannum_Biodata.pdf', NULL, 'QKFCPAVIMG_6316_2.jpg', 5, 'VFhwWk1rOVVSVFU9', 'Inactive', '2023-01-21 10:19:41.000000', '2024-02-12 18:51:11.000000', '19284327', 85, NULL, NULL, NULL, NULL, NULL, 2000, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(36, 'Anjum Malique', NULL, 'Female', NULL, NULL, 'Georgia', NULL, '6787904742', NULL, NULL, 'amalique98@gmail.com', NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoV2RWbFVVVE5PUkVsbw==', 'Inactive', '2023-01-21 12:27:21.000000', '2023-01-21 12:27:21.000000', '30087278', NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(37, 'Evana Nusrat Dooty', NULL, 'Female', NULL, NULL, 'West Virginia', NULL, '3043765381', NULL, NULL, 'evananusrat@yahoo.com', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVROU2JrMUVhekpPUkVVd1lqTktNVWxSUFQwPQ==', 'Inactive', '2023-01-22 10:58:39.000000', '2023-01-22 10:58:39.000000', '67067861', NULL, NULL, NULL, NULL, NULL, NULL, 1986, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(38, 'shaima', NULL, 'Female', NULL, NULL, 'New York', NULL, '3472213322', NULL, NULL, 'shaima2188@yahoo.com', NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZkNGMxbFhhREZQUkVWM1RWTkZQUT09', 'Inactive', '2023-01-26 02:13:38.000000', '2023-01-26 02:13:38.000000', '24934305', NULL, NULL, NULL, NULL, NULL, NULL, 1988, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(39, 'Afrina Binte Masud', NULL, 'Female', NULL, NULL, 'Georgia', NULL, '470-838-5919', NULL, NULL, 'afrinamasud1@gmail.com', NULL, 20, NULL, NULL, 200, 'Dhaka, Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'Permanent Resident', NULL, 'Parkview High School', 2022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', 'Al falah academy', 'Substitute teacher', NULL, 'Sunni', NULL, 'Everything', NULL, 'Headscarf,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', NULL, 25, 'Nurunnahar Masud', '26 planters drive sw', 'Lilburn', 'Georgia', 'United States', '4708385919', 'afrinamasud1@gmail.com', 'House wife', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LQIY2Q420230129_134818.jpg', NULL, NULL, NULL, 5, 'VmpKc2RXUkhWbmxOYWtGNVRXcEZhQT09', 'Inactive', '2023-01-28 14:41:21.000000', '2023-01-31 03:50:04.000000', '68349406', 68, NULL, NULL, NULL, NULL, NULL, 2003, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(41, 'Mehrun Nessa Huda', NULL, 'Female', NULL, NULL, 'Virginia', NULL, '571-386-9479', NULL, NULL, 'Mehrunrox@gmail.com', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoV2VtSkVSblJhZVVaNVlrRTlQUT09', 'Inactive', '2023-02-01 13:11:20.000000', '2023-02-01 13:11:20.000000', '48023670', NULL, NULL, NULL, NULL, NULL, NULL, 2000, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(42, 'Piya', NULL, 'Female', '3138 Decatur Avenue', 'Bronx', 'New York', '10467', '3472858865', '3472858865', NULL, 'sheikhnjahan@gmail.com', NULL, 29, NULL, 60, 150, 'Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'LaGuardia High School', 2012, 'Fordham University', 2016, 'Teaching', 2018, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Charter School', '4th Grade Teacher', 69000, 'Sunni', NULL, 'Daily prayers, fasting, hijab, long dress everyday', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'Daily prayers', 'Yes', 'No Preference', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,Student Visa,F-1,', NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 1, 2, 'Noorjahan Chowdhury', NULL, NULL, NULL, NULL, '6463391841', 'hasnatjahan97@gmail.com', NULL, NULL, 'Kamal Uddin', 'Brother in Law', '8626213342', 'Laila Haruna', 'Friend', '6465399545', 'Rabia Rashid', 'Former Coworker', '3474210858', 'anonymous.png', 'ZX4EDMRApril_2023-_Jahan_Resume.pdf', NULL, 'XHNZB9XIMG_3088.jpeg', 5, 'VVcxV2FsbFlWbnBhVkVWbw==', 'Active', '2023-02-01 13:56:12.000000', '2024-04-02 14:22:27.000000', '64905729', 95, '311,115,124,173,256,274,312,314,100,102,', '50,40,40,40,40,40,40,40,30,30,', '116,115,146,173,232,246,256,137,144,252,263,264,282,283,148,109,312,314', NULL, NULL, 1994, 'AK5Q25YIMG_9534.jpeg', 'MIJ5PK6IMG_9285.jpeg,U8V6JVJ17f2765a-4bf2-4f17-9a66-628920b2c029.jpeg,EXS92MGf815860f-b726-4fdf-a262-a806a6e5dbfd.jpeg,FERR2FP95bb165a-bfc5-438e-bca4-a31b0c2def84.jpeg', NULL, NULL, '116,121,122,123,85,138,146,166,173,100,143,115,148,102,256,144,262,273,274,124,311,312,314,', NULL),
(44, 'Farzana Islam', NULL, 'Female', NULL, NULL, 'Connecticut', NULL, '2039400596', NULL, NULL, 'ifjann77@gmail.com', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VTIxR2RXSnRiSHBpUjBaMFRWUkZlVTFyUVQwPQ==', 'Inactive', '2023-02-07 07:38:32.000000', '2023-02-07 07:38:32.000000', '51822961', NULL, NULL, NULL, NULL, NULL, NULL, 2000, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(45, 'Shanjda Afrin', 'Maria', 'Female', '130 Jefferson ave,apt#2b', 'Brooklyn', 'New York', '11216', '5169127996', NULL, '3473505114', 'shampa.feni@gmail.com', NULL, 23, NULL, 64, 120, 'Feni,Bangladesh', 'No', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Science skills center high school', 2018, 'New York City college of technology-attending (Majoring in restorative dentistry)', 2022, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Dental lab', NULL, 24000, 'Sunni', NULL, NULL, NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'Good Muslim', 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 60000, 6, 'Khorseda Akter', '130 Jefferson ave,apt #2b', 'Brooklyn', 'New York', 'USA', '5169127996', 'Shampa.feni@gmail.com', 'Housewife', 'Home district-dagonbhuiyan,feni.', 'Khorseda Akter', 'Aunty', '5169127996', 'Abdul Hoque', 'Uncle', '9174009504', 'Tanjina Afrin', 'Sister', '9176344330', 'Z82OZ76061C3C55-B18E-49E8-9EFE-521E165F46F9.jpeg', 'YND1XSFresume_2.docx', NULL, 'ALZAEP182DDA45D-0762-4B3E-A3AE-5D361014F611.jpeg', 5, 'VlRKb2FHSllRbWhOYWsxcg==', 'Deactivated', '2023-02-07 08:50:49.000000', '2023-12-28 05:31:26.000000', '63866296', 97, '100,115,116,123,121,122,101,137,138,140,146,168,173,143,102,252,144,262,', '60,60,60,60,50,50', '123,122,115,121,138,140,137,148,146,173,168,143,246,166,144,252,263,264', NULL, NULL, 2000, '2JAKYKUimage.jpg', 'GADT1RJ4242C87C-509F-46E1-838E-30200B8334B8.jpeg,UIN8GNA620D854A-F2C9-4B5E-9000-A193D1AD5B34.jpeg,DWTC9AH5C7809BD-39CB-4B66-A2C8-C2B81A21C2C8.jpeg,C4KNVLP5F11E397-ED22-429F-86B9-6292EE85A3C9.jpeg', 'GADT1RJ4242C87C-509F-46E1-838E-30200B8334B8.jpeg,QKV72B6IMG_4459.png,DWTC9AH5C7809BD-39CB-4B66-A2C8-C2B81A21C2C8.jpeg,O2HMBEOIMG_4459.png', NULL, '100,115,116,123,121,122,101,137,138,140,146,168,173,143,102,252,144,262,', NULL),
(46, 'Mustahida Chowdhury', NULL, 'Female', NULL, NULL, 'Virginia', NULL, '2028127747', NULL, NULL, 'sumaiya.vs@gmail.com', NULL, 32, NULL, 64, 60, 'Dinajpur', NULL, 'Divorced', 'Yes', 1, '3 years', 'Permanent Resident', NULL, NULL, NULL, NULL, 2012, 'Economics', 2013, NULL, NULL, NULL, NULL, NULL, 'Yes', NULL, NULL, NULL, 'Sunni', NULL, 'All my family members included me started daily obligatory prayers from childhood. All the obligatory prayers and fasting practicing very strictly.', NULL, 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, 'Must be sincere about the obligatory prayers.', 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,', NULL, 'No Preference,', 'Yes', 'Bachelor', 'Yes', NULL, 8, 'Sumaiya', NULL, 'Arlington', 'Virginia', 'USA', '2028127747', NULL, NULL, 'Friendly, practicing Islamic culture and strongly bonded with each other.', 'Sumaiya Chowdhury', 'Sister', '2028127747', NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'Vlc1V2RGbFhiRFZaVkd0NFVVRTlQUT09', 'Active', '2023-02-10 11:49:34.000000', '2023-09-20 09:42:49.000000', '55281045', 75, '115,232,271,311,315,100,101,102,122,124,', '50,50,50,50,50,40,40,40,40,40,', '115,123,100,116,101,138,140,146,148,232,283,137,290,312', NULL, NULL, 1991, NULL, 'PW54BM5A05974AE-C900-44B0-A8C5-39C54E2566A5.jpeg,YFWY2I63DAC24FC-4B66-4839-A145-3D08128C7429.jpeg,gallery3.jpg,gallery4.jpg', NULL, NULL, '115,123,100,101,116,121,122,137,138,140,146,143,232,102,144,262,271,109,311,124,315,', NULL),
(47, 'Shakiera Ibrahim', NULL, 'Female', NULL, NULL, 'Michigan', NULL, '3136498909', NULL, NULL, 'ibrahimshakiera@gmail.com', NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WWxaRk0wNXJUbTFQV0hCTVpFUlphQT09', 'Inactive', '2023-02-17 16:38:09.000000', '2023-02-17 16:38:09.000000', '52053654', NULL, NULL, NULL, NULL, NULL, NULL, 1995, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(48, 'Tasnim Hossain', NULL, 'Female', NULL, 'Tucson', 'Arizona', '85755', '5204659633', NULL, NULL, 'hossainismat71@gmail.com', NULL, 25, NULL, 68, 155, 'Dallas', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Ironwood ridge', 2016, 'Asu', 2020, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Raytheon', 'Industrial engineer', NULL, 'Sunni', NULL, 'Daily prayers, fasting', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'prayers, fasting', 'No Preference', 'No', 'Specific Ethnicity', 'American', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', NULL, 4, 'Chowdhury Hossain', '12790 N Pioneer Way', 'Orovalley', 'Arizona', 'united States', '520 288 9556', 'chossain4@gmail.com', 'Rtd. elecctrical engineer', NULL, 'Ashikur Rahman', 'family friend', '8135704857', 'Nilufar Yesmin', 'family friend', '5203968031', 'Tanzia amreen', 'family friend', '9729984259', 'anonymous.png', 'PZOB45LTasnim--Bio_Data.docx', NULL, 'L7DUUFFE2B346CF-E04E-46B8-B3D6-6199C10D5383.jpeg', 5, 'VlRKb2FHTnRNV3hhVnpWQlRWUnJNMDFSUFQwPQ==', 'Inactive', '2023-03-15 20:17:56.000000', '2023-03-26 11:00:06.000000', '39439560', 90, '115,123,100,116,121,122,137,138,143,146,', '50,50,40,40,40,40,40,40,40,40,', '123,122,121,115,138,140,137,146,148', NULL, NULL, 1998, 'QZ1PX4RB7E6CCA7-5426-4B48-8248-696B1A1A4B0F.jpeg', '1RBVQ9X17B38081-328D-4795-9FF6-877B69F84B11.jpeg,JSA9WLF326533987_728999758710744_3207222679510995867_n.jpg,WR3RZGMTasnim.jpg,ZHBIKSL327259015_1808517029531603_1910033554292798828_n.jpg', NULL, NULL, '115,123,100,116,121,122,137,101,138,142,146,156,143,', NULL),
(49, 'Niamah Ahmad', NULL, 'Female', NULL, NULL, 'Texas', NULL, '2146066796', NULL, NULL, 'sahmed29@yahoo.com', NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'Vkcxc2FHSlhSbTlOVlVGNg==', 'Inactive', '2023-03-18 01:48:58.000000', '2023-03-18 01:48:58.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2004, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(50, 'Nazia Shaheed', NULL, 'Female', NULL, 'Fair Lawn', 'New Jersey', NULL, '2012905616', NULL, NULL, 'naziashaheed@gmail.com', NULL, 23, NULL, 68, 160, 'Dhaka, Bangladesh', 'Wear eyeglasses', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'BCA', 2018, 'BA in Biology from NJIT', 2022, 'MPH from Rutgers SPH', 2023, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Hackensack University Medical Center', 'Medical Scribe', 1, 'Sunni', NULL, 'Daily prayers, Occasional fasting, visiting Mosque', 'NA', 'Headscarf,Niqab,', 'No', 'Sunni', NULL, 'Regular prayers, pious muslim', 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 5, 'Mahfuz A Shaheed', '3-15 Cyril Avenue', 'Fair Lawn', 'New Jersey', 'United States', '9088845507', 'mahfuzshaheed@gmail.com', 'Mechanical Engineer', 'Mother - Electrical Engineer, Younger Brother - Engineering student', 'Mahfuz Shaheed', 'Father', '9088845507', 'Parveen Sultana', 'Mother', '5512430367', 'Nafees Shaheed', 'Brother', '5512469205', 'XGMGJYHWIN_20230110_14_26_02_Pro.jpg', '9VUOPP4Resume_of_Nazia_Shaheed.docx', NULL, NULL, 5, 'VkZkR2RWcFhWalpOVkVWM1RsUnJOVWxSUFQwPQ==', 'Deactivated', '2023-03-18 14:45:57.000000', '2023-03-28 05:11:15.000000', '84600760', 95, '100,116,121,122,123,138,142,146,101,115,', '40,40,40,40,40,40,40,40,30,30,', '123,122,121,115,116,138,148,146', NULL, NULL, 2000, '7XDVBDUsignature.jpg', 'EPEXM1BWIN_20230110_14_26_02_Pro.jpg,G3DR4A1IMG_1966.jpg,KLQHZ1KIMG_2127.jpg,F65GM4DWIN_20230226_21_02_34_Pro.jpg', NULL, NULL, '100,116,121,122,123,101,115,137,138,142,146,', NULL),
(51, 'Nafisa Ahmed', NULL, 'Female', 'N/A', 'Redmond', 'Washington', '98008', '12067150124', '12067150124', '12067150124', 'mrashid@rieconsultants.com', 'N/A', 26, NULL, 162, 53, 'Dhaka, Bangladesh', 'N/A', 'Single', NULL, NULL, NULL, 'Permanent Resident', NULL, NULL, 2014, NULL, 2021, 'N/A', NULL, 'N/A', NULL, 'N/A', NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, 'I perform salah 5 times regularly, maintain hijab and try to follow all obligatory rules of islam.', 'N/A', 'Headscarf,', 'No', 'Sunni', NULL, 'Must be practicing muslim', 'No Preference', 'No', 'Specific Ethnicity', 'Bangladeshi', 'Permanent Resident,Student Visa,F-1,H1B,', NULL, 'Single,', 'No', 'Doctorate', 'No Preference', 1, 5, 'Mizan Rashid', NULL, 'Redmond', 'Washington', 'USA', '12067150124', 'mrashid@rieconsultants.com', 'Engineer', NULL, 'Mizan Rashid', 'Maternal uncle', '12067150124', NULL, NULL, NULL, NULL, NULL, NULL, 'XZ455TFIMG-20230407-WA0000.jpg', 'A86W4N6CV_of_NAFISA_AHMED_-_Edited_2-1_(2).docx', NULL, 'T2C5UUL20230325_170202.jpg', 5, 'VkcxR2JXRllUbWhLUkVVMVQxUmpQUT09', 'Deactivated', '2023-03-23 16:44:21.000000', '2023-05-22 06:29:16.000000', '17193223', 92, '146,115,116,121,122,123,138,148,156,100,', '50,40,40,40,40,40,40,40,40,30,', '140,138,137,121,115,123,122,146,148', NULL, NULL, 1997, '905CBKU20230325_170202.jpg', 'YK0RCBDpage1-1200px-Blank_Page.pdf.jpg,WGK0Z1Gpage1-1200px-Blank_Page.pdf.jpg,FVNSFOGpage1-1200px-Blank_Page.pdf.jpg,5UK6186page1-1200px-Blank_Page.pdf.jpg', NULL, NULL, '116,121,122,137,142,115,123,138,100,101,146,148,156,', NULL),
(52, 'Zillur Rahman', NULL, 'Female', NULL, NULL, 'Florida', NULL, '7274521276', NULL, NULL, 'Zillur53@gmail.com', NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VjIxR2IyRlhVV2hOVkdzMVRsaEtVdz09', 'Inactive', '2023-03-26 15:06:08.000000', '2023-03-26 15:06:08.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2001, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(53, 'jaz', NULL, 'Female', NULL, NULL, 'Florida', NULL, '7274521276', NULL, NULL, 'dakha4@yahoo.com', NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VjIxR2FXRllTV2hOVkdzMVRsaEtVdz09', 'Inactive', '2023-03-26 15:12:19.000000', '2023-03-26 15:12:19.000000', '76410095', NULL, NULL, NULL, NULL, NULL, NULL, 2001, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(56, 'Tangina Siddique', NULL, 'Female', NULL, NULL, 'New York', NULL, '7162928613', NULL, NULL, 'tanjina.sidd@gmail.com', 'NA', 41, NULL, 5, NULL, 'Bronx', 'no', 'Divorced', 'Yes', 1, '8', 'Other', NULL, 'HSC', 1999, 'BSC in Computer Science', 2005, 'MBA', 2013, NULL, NULL, NULL, NULL, 'Masters', 'No', NULL, NULL, 1, 'Sunni', NULL, 'Daily Prayers, Fasting', 'NA', 'Headscarf,', 'No', 'Sunni', NULL, 'NA', 'No', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'Divorced,', 'Yes', 'Masters', 'Yes', 1, 1, 'Siddiquer Rahaman', 'BANGLADESH', 'Dhaka', NULL, 'Bangladesh', '0000000000', '000@gmail.com', 'Engineer', 'Parents Passed away', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVhwQmQwMTZRVE5OYTBJd1dWYzBQUT09', 'Inactive', '2023-04-09 05:22:52.000000', '2023-04-09 05:33:03.000000', '33205311', 75, NULL, NULL, NULL, NULL, NULL, 1982, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(57, 'Mahmuda Zesmin', NULL, 'Female', NULL, NULL, 'New York', NULL, '3474719540', NULL, NULL, 'hamida4051@gmail.com', NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VG5wc2FHSnRkSE5aYWtWNVRYbEZQUT09', 'Inactive', '2023-04-11 10:23:49.000000', '2023-04-11 10:23:49.000000', '24766154', NULL, NULL, NULL, NULL, NULL, NULL, 1991, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(58, 'Shilpi', NULL, 'Female', NULL, 'Chandler', 'Arizona', NULL, '4802462587', NULL, NULL, 'evaeee06@yahoo.com', NULL, 46, NULL, 5, 125, 'Dhaka', 'NA', 'Divorced', 'No', NULL, NULL, 'Other', 'citizen of Bangladesh', 'Comilla board', 1994, 'Sylhet M.A.G. Osmani medical college', 2002, 'Dhaka Medical College', 2014, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Bangladesh Medical College', 'Associate Professor of Bio-chemistry', 15000, 'Sunni', NULL, 'Practicing muslim, wear hijab, daily pryaers, mandatory fasting and preferred non-obligatory fasting, listen islamic scholar\'s lectures, recite Quran frequently', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'Daily prayers, mandatory fasting and overall islamic minded', 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'No Preference,', 'Yes', 'Bachelor', 'Yes', 120000, 5, 'Kazi Mohammad Loqman', '5482 W Mercury Way', 'Chandler', 'Arizona', 'United States', '4802462587', 'evaeee06@yahoo.com', 'Retired Vice Principal of Kabi Nazrul College', NULL, 'Kazi Sultana', 'Sister', '4802462587', 'Tofayel Ahmed', 'Brother in laws', '4803812706', 'Kazi Khaled Al-Zahid', 'Brother', NULL, 'anonymous.png', 'VX0HGFVCV_Shilpi.docx', NULL, NULL, 5, 'U214U2RtTklWWGROYWxab1pXYzlQUT09', 'Inactive', '2023-04-29 06:41:51.000000', '2023-04-29 07:03:31.000000', '17321130', 87, NULL, NULL, NULL, NULL, NULL, 1977, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(60, 'Fatema Akter', NULL, 'Female', '1015 Fairfield Avenue', 'Bridgeport', 'Connecticut', '06605', '2122036177', NULL, NULL, 'docbd8@gmail.com', NULL, 54, NULL, 64, 150, 'Dhaka', 'Good', 'Divorced', 'Yes', 1, '28', 'US Citizen', NULL, 'SSC', 1987, 'HSC', 1989, 'Bachelor of Arts (B.A)', 1991, 'CNA', 2000, NULL, NULL, 'Bachelor', 'Yes', NULL, NULL, 40000, 'Sunni', NULL, 'Daily prayers, on time fasting, attending halaqas, visiting the masjid, etc.', 'By birth', 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Sunni', NULL, 'Honestly and pure religious practice every day.', 'No Preference', 'No', 'Specific Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Divorced,Widowed,', 'Yes', 'Bachelor', 'Yes', 30000, 5, 'Chowdhury', NULL, NULL, NULL, NULL, '2122036177', 'docbd8@gmail.com', NULL, '100% religious', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZkc2MyRlVSWGROVkdzeVQxVkNRUT09', 'Inactive', '2023-05-02 01:34:18.000000', '2023-05-02 02:24:34.000000', '78412969', 80, NULL, NULL, NULL, NULL, NULL, 1969, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(61, 'Maktuma Akter', NULL, 'Female', NULL, NULL, 'Oklahoma', NULL, '9189495344', NULL, NULL, 'maktuma515@yahoo.com', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZkR2NHTXlhR2hOYWtsNlNWRTlQUT09', 'Inactive', '2023-05-18 02:23:02.000000', '2023-05-18 02:23:02.000000', '58249019', NULL, NULL, NULL, NULL, NULL, NULL, 1981, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(63, 'Ruaida Rafique', NULL, 'Female', '5181 Trailwood Ln', 'Warren', 'Michigan', '48092', '3134430414', '3134430414', '3134430414', 'ruaidarafique@gmail.com', NULL, 27, NULL, 5, 190, 'United States of America', NULL, 'Divorced', 'No', NULL, NULL, 'US Citizen', NULL, 'Frontier International Academy', 2014, 'In Process', 2023, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', 'Ummah Fashion', 'Partial Owner', 4000, 'Sunni', NULL, 'Practicing', 'NA', 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, 'Practicing', 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,EAD,Other,', NULL, 'Single,Divorced,', 'Yes', 'No Preference', 'Yes', 10000, 35, 'Muhammad Islam', '5181 Trailwood Ln', 'Warren', 'Michigan', 'USA', '13132311986', '1967.mislam@gmail.com', 'Family Advocate (Social Worker)', NULL, 'Khadiza Moroum Happy', 'Aunt', '13137821638', 'Durdana', 'Like Elder Sister', '13135883682', 'Zaakirah', 'Friend', '13138087339', 'QWMDIG4266cc356-bf7c-46a1-bc28-686fd47c66bfphoto.jpeg', NULL, NULL, 'II6STCU43720babaf085f788543e613b0ab3d59.png', 5, 'VlRKb2FGcHRiRUZOVkVsNlRrUlZQUT09', 'Active', '2023-06-07 20:14:26.000000', '2024-04-27 18:28:26.000000', '33929091', 100, '100,102,115,122,143,173,232,256,264,274,', '50,50,50,50,50,50,50,50,50,50,', '146,140,138,123,115,100,148,116,121,122,168,256,246,252,282,283,137,290,109,299,286,312,314,173', NULL, NULL, 1996, 'D3C3JF3cab3e670bc355abe7867da64024c44c5_0.jpeg', 'EGEVVGZb0150d1e6e3336fca9d72a8fb1907d01_0.jpeg,13QZWEFIMG_20230415_091424_590.jpg,MLIPV5LIMG_20221010_144405_042.jpg,DZ537LXreceived_1472608403137868.jpeg', NULL, NULL, '100,115,116,121,122,123,146,138,140,101,156,137,168,173,160,166,232,102,252,256,144,262,264,109,274,282,143,', NULL),
(64, 'Sherajum Monira', NULL, 'Female', NULL, NULL, 'Texas', NULL, '9899549054', NULL, NULL, 'azharecondu@gmail.com', NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZWQmEySlVRWGhPYW1jelRVUkJORTVFVlhvPQ==', 'Inactive', '2023-06-08 04:07:05.000000', '2023-06-08 04:07:05.000000', '16709524', NULL, NULL, NULL, NULL, NULL, NULL, 1999, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(65, 'Mahnaz M Khan', NULL, 'Female', NULL, 'Queens', 'New York', NULL, '3477019303', NULL, NULL, 'karimsabira1970@gmail.com', NULL, 53, NULL, 60, 110, 'Iran', NULL, 'Single', NULL, NULL, NULL, 'Other', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'Headscarf,', 'No', 'Sunni', NULL, NULL, 'Yes', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'Single,', 'No', 'Masters', 'Yes', NULL, 5, 'Sabira', NULL, NULL, NULL, NULL, '3477019303', 'karimsabira1970@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZkR2VXTnRiR2hhTWxWNVRVUkpla2xSUFQwPQ==', 'Inactive', '2023-06-14 04:05:21.000000', '2023-10-23 08:18:20.000000', '78503245', 68, NULL, NULL, NULL, NULL, NULL, 1990, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(67, 'Nuren Durdana', 'DihanM', 'Female', 'The Ridge, Van Voorish Road, Morgantown, WV', 'Morgantown', 'West Virginia', '26505', '3043765381', NULL, NULL, 'evanaiiuc@yahoo.com', NULL, 27, NULL, 63, NULL, 'Bangladesh', 'Good. No disabilities or allergies.', 'Single', NULL, NULL, NULL, 'F-1', NULL, 'HSC', 2014, 'BBA in HRM', 2021, 'Communication Studies', 2022, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, 'Perform salah regularly and wearing hijab.', NULL, 'Headscarf,', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', 'Masters', 'Yes', NULL, 8, 'Evana Nusrat', '777 Chestnut Ridge Road', 'Morgantown', 'West Virginia', 'US', '3043765381', 'evananusratdooty@gmail.com', 'Student', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', 'FHTSANRBio_data__Dihan.pdf', NULL, NULL, 5, 'VVROU2JrMUVhekpPUkVVd1lqTktNVkIzUFQwPQ==', 'Inactive', '2023-07-03 10:11:05.000000', '2023-07-03 10:21:32.000000', '42043946', 60, NULL, NULL, NULL, NULL, NULL, 1996, NULL, 'JGPP795Pic_2.jpg,gallery2.jpg,gallery3.jpg,6MMQC4MPic1.jpg', NULL, NULL, NULL, NULL),
(68, 'Shakira', NULL, 'Female', NULL, NULL, 'New York', NULL, '3476949252', NULL, NULL, 'shakirasunshine@gmail.com', NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlRKV2FtTnRWakJaYlVaM1RWTkZQUT09', 'Inactive', '2023-07-07 11:20:30.000000', '2023-07-07 11:20:30.000000', '45209374', NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(69, 'fahmida hassan', NULL, 'Female', NULL, NULL, 'New York', NULL, '7185000771', NULL, NULL, 'hasfahmida89@gmail.com', NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'V20xR2IySlhiR3RaVldjelQwUnJlVTFUUlQwPQ==', 'Inactive', '2023-07-11 22:13:32.000000', '2023-07-11 22:13:32.000000', '54132726', NULL, NULL, NULL, NULL, NULL, NULL, 2005, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(70, 'Alma Alam', NULL, 'Female', NULL, 'WEST BERLIN', 'New Jersey', '08091', '8568220649', NULL, NULL, 'naziaalam116460@gmail.com', NULL, 23, NULL, 59, 105, 'Bangladesh', 'none', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Overbrook High School', 2018, 'Rutgers University- Camden', 2022, 'Rutgers University- Camden', 2023, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'High School', 'Science teacher', 55000, 'Sunni', NULL, '5 daily prayers\nAttend religious events and halaqas\nMember of Young sisters Program since 2018- Associate member\nJunior Young sister program- President\nYouth Program Teacher- Delaware Valley Islamic Center of Clementon, NJ\nJudge of Students\' Islamic competitions', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'must pray 5 daily prayers\nattends halaqas', 'Yes', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,Student Visa,F-1,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 80000, 10, 'Marghan Begum', NULL, 'West Berlin', 'New Jersey', 'United States', '8568428581', 'naziaalam116460@gmail.com', NULL, 'If you would like to contact us, please send email', 'Marghan Begum', 'mother', '8568428581', NULL, NULL, NULL, NULL, NULL, NULL, '23CZ4OQpic2.jpg', 'JYVQUD1Nazia_Alam-_Teaching.pdf', NULL, 'H0XTXYTPassport.jpeg', 5, 'Vmtkb2JHRklWblZOVkVsNlNWRTlQUT09', 'Active', '2023-07-12 15:52:45.000000', '2024-05-10 03:46:08.000000', '42816267', 97, '100,115,311,315,102,168,173,286,299,122,', '70,70,70,70,60,60,60,60,60,50,', '115,148,146,138,123,122,168,121,143,256,264,166,253,282,283,286,288,293,299,102,312,314,315', NULL, NULL, 2000, '3B6FMZZSignature.png', 'HFYW4LHScreenshot_2023-12-06_191454.png,7PM8LC1pic_1.jpg,7V1MAI5Screenshot_2023-12-06_191454.png,C6RSNLRpic2.jpg', NULL, NULL, '100,115,123,146,116,121,122,137,138,143,168,173,144,262,102,252,166,286,288,299,311,124,315,', NULL),
(72, 'Jamila Jahangir', NULL, 'Female', NULL, NULL, 'New York', NULL, '7183950418', NULL, NULL, 'jaycho27@hotmail.com', NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VTIxR2NtRlhSWGhOYWsxbw==', 'Inactive', '2023-07-13 11:04:52.000000', '2023-07-13 11:04:52.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(73, 'Tasneem Nishat', NULL, 'Female', '8520 Radnor street', 'Jamaica', 'New York', '11432', '6464631245', NULL, NULL, 'mrahman246@yahoo.com', NULL, 23, NULL, 62, 128, 'New York', 'Good', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Al Mamoor High School', 2018, 'Queens College', 2023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', NULL, NULL, 1, 'Sunni', NULL, 'Perform five times obligatory and Nawafil salah, fasting in Ramadan and Nawafil, maintain full Hijab, maintain Halal and Haram, eat Zabiha Halal meat, avoid free mixing', NULL, 'Jelbab/Abaya,', 'No', 'Sunni', NULL, 'Perform obligatory worships, abide by Halal and Haram', 'Yes', 'No', 'Own Ethnicity', 'American', 'US Citizen,', NULL, 'Single,', 'No', 'Masters', 'Yes', NULL, 7, 'Mohammad Mujibur Rahman', '8520 Radnor street', 'Jamaica', 'New York', 'United States', '6464631245', 'mrahman246@yahoo.com', 'Physician', 'Mother-Dr Ayesha Siddiqua, MBBS, Sonogram Technologist at Queens Hospital\nNew York, from Satkhira Bangladesh\nBrother \n1. Dr. Nafis Rahman, DDS, NYU College of Dentistry, works in New Jersey\n2. Tahmid Rahman, Hafiz, graduated from JMC in 2015, High School-Al Mamoor, studying Aalim course', 'Dr Syedur Rahman', 'Family friend', '9177333641', 'Dr Imran', 'Family friend', '9173992374', 'Mahmuda Begum', 'Family friend', '9293725615', 'anonymous.png', 'IFZ0RJ4Bio_of_Tasneem_NIshat_(2).docx', NULL, NULL, 5, 'VmtkR2IySlhiR3ROVkVscg==', 'Inactive', '2023-07-13 13:48:53.000000', '2023-08-03 11:32:09.000000', '27949168', 80, NULL, NULL, NULL, NULL, NULL, 2000, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(75, 'Farzana Ahmes', NULL, 'Female', NULL, NULL, 'Pennsylvania', NULL, '3473353555', NULL, NULL, 'Farzana_29@hotmail.com', NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VW0xR2VXVnVWVEZPVkZsM1MyYzlQUT09', 'Inactive', '2023-07-19 15:14:00.000000', '2023-07-19 15:14:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1989, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(76, 'Deetra Simmons', NULL, 'Female', NULL, NULL, 'New York', NULL, '9175845970', NULL, NULL, 'Deetrascott@yahoo.com', NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VGpBMWRtSlhPWGxoVjBwb1NWRTlQUT09', 'Inactive', '2023-07-23 13:48:03.000000', '2023-07-23 13:48:03.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1968, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(77, 'Mashiya Uddin', NULL, 'Female', NULL, 'Warren', 'Michigan', '48091', '5868739630', NULL, NULL, 'mmashiyaauddin@gmail.com', NULL, 18, NULL, 64, 126, 'Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Al-Ihklas Training Academy', 2023, 'Wayne State University', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', 'Masjid', 'Teacher', 3700, 'Sunni', NULL, 'We pray daily, we attend halaqas regularly and we visit the masjid regularly.', NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Sunni', NULL, 'They should pray regularly, attend halaqas regularly, and visit the masjid regularly.', 'Yes', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 60000, 5, 'MD Qutub Uddin', '25569 Cunningham', 'Warren', 'Michigan', 'U.S', '5862379852', 'mqmn08@gmail.com', 'Factory Job', NULL, 'Khamilah Walid', 'Teacher', '3137290502', 'Aeisa Humayra', 'Friend and co-worker', '3136039795', 'Ahmedur Rahman', 'Boss/Supervisor', '5862240669', 'KG5Z3NRgradday.jpg', NULL, NULL, 'H70HZ9Cmyid.jpg', 5, 'VTFkS2RXRXlSakJoUjFac1kydEJlRTFFUlQwPQ==', 'Active', '2023-07-26 07:12:39.000000', '2024-04-04 05:19:49.000000', '39871734', 90, '100,115,168,299,311,315,102,173,286,290,', '70,60,60,60,60,60,50,50,50,50,', '168,232,143,271,138,288,148,299,100,292,293,312', NULL, NULL, 2005, 'F38C631signiture.jpg', 'AQRIF2Pgradday.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, '100,168,123,173,116,121,122,138,146,160,115,102,252,144,262,271,286,288,290,299,292,311,315,', NULL);
INSERT INTO `UserApp_femaleuser` (`userId`, `fullName`, `nickName`, `gender`, `address`, `city`, `state`, `zip`, `cellPhone`, `workPhone`, `homePhone`, `email`, `personalWebsite`, `age`, `dateOfBirth`, `height`, `weight`, `placeOfBirth`, `health`, `maritalStatus`, `children`, `childrenNumber`, `childrenAges`, `immigrationStatus`, `immigrationStatusOther`, `highSchool`, `highSchoolYear`, `bachelors`, `bachelorsYear`, `masters`, `mastersYear`, `doctorate`, `doctorateYear`, `otherDegree`, `otherDegreeYear`, `highestEducation`, `employed`, `employment`, `position`, `income`, `religiousPractice`, `religiousPracticeOther`, `religiousPracticeBrief`, `revertTime`, `wear`, `smoker`, `preReligious`, `preReligiousOther`, `preReligiousBrief`, `preBeard`, `preSmoking`, `preEthnic`, `preEthnicSpecific`, `preImmigrationStatus`, `preImmigrationStatusOther`, `preMaritalStatus`, `preChildren`, `preEducation`, `preEmployment`, `preIncome`, `preAgeGap`, `guarName`, `guarAddress`, `guarCity`, `guarState`, `guarCountry`, `guarPhone`, `guarEmail`, `guarProfession`, `familyBrief`, `refName1`, `refRelation1`, `refPhone1`, `refName2`, `refRelation2`, `refPhone2`, `refName3`, `refRelation3`, `refPhone3`, `photo`, `cv`, `album`, `govIssuedId`, `matchShowLimit`, `userPass`, `status`, `openingDate`, `lastEdit`, `userToken`, `profileCompleteness`, `matchId`, `matchPercentage`, `reqAccepted`, `reqRejected`, `reqSent`, `birthYear`, `signature`, `gallery`, `tempGallery`, `lockedId`, `cuMatchId`, `reqLock`) VALUES
(78, 'Hawa Camara', NULL, 'Female', '427 Saint Ann Ave', 'Bronx', 'New York', '10454', '9292635738', '9292635738', '3475909940', 'hcamara988@gmail.com', NULL, 21, NULL, 54, 150, 'New York', 'No', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, 2023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', 'Wells Fargo', 'Operations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sunni', NULL, 'They are religious, and have knowledge on the deen. They will help me grow in my knowledge of Islam.', 'No Preference', 'No', 'Specific Ethnicity', 'Other', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'Yes', 'Bachelor', 'Yes', 80000, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZkb2IxbDZUWHBQVkVKQg==', 'Inactive', '2023-07-27 04:40:22.000000', '2023-07-27 04:52:33.000000', '57012373', 58, NULL, NULL, NULL, NULL, NULL, 2002, NULL, 'XO3ZYLL562C297C-6616-43DA-B102-6B4567B7959D.jpeg,gallery2.jpg,ZEDU8OVB6A47437-D37C-41FB-B6A0-3A532A6B932F.jpeg,gallery4.jpg', NULL, NULL, NULL, NULL),
(80, 'Nadia Hossain', NULL, 'Female', '374 Ridgewood Avenue, First Floor', 'Brooklyn', 'New York', '11208', '6072033242', NULL, NULL, 'nadiazhossain@gmail.com', NULL, 24, NULL, 64, NULL, 'New York, USA', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Leon M. Goldstein High School', 2017, 'NYIT(New York Institute of Technology); B.S. in Computer Science', 2021, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Goldman Sachs', 'Data Engineer', 105000, 'Sunni', NULL, NULL, NULL, 'Headscarf,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 80000, 6, 'Mohd Hossain', '374 Ridgewood Avenue, First Floor', 'Brooklyn', 'New York', 'United States', '7188538490', 'nhossa02@gmail.com', NULL, NULL, 'Nuran Ghoneim', 'College Friend', '3478205007', NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', 'YM4ODDPNadia_Hossain_.pdf', NULL, NULL, 5, 'VVZkNGNHVnRSWGRPUlVFOQ==', 'Inactive', '2023-07-31 03:29:08.000000', '2023-08-07 03:52:16.000000', '44637069', 82, NULL, NULL, NULL, NULL, NULL, 1999, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(82, 'Jannatul Mayeda', 'None', 'Female', 'Hemlock St.', 'Brooklyn', 'New York', '11208', '9298880658', '9298880658', '9298880658', 'Jmayedaa@gmail.com', 'None', 28, NULL, 62, 58, 'Bangladesh', 'None', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Edward. R Murrow High School', 2014, 'John Jay College of Criminal Justice', 2018, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'NYC Department of Education', 'Teacher', NULL, 'Sunni', NULL, 'I pray and fast', NULL, 'Headscarf,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 60000, 4, 'Shahadat Hussain', 'Hemlock St.', 'Brooklyn', 'New York', 'United States', '9174358219', 'kislu@hotmail.com', 'Accountant', NULL, 'Shahadat Hussain', 'Brother', '9174358219', 'Shahadat hossain', 'Brother in law', '(929) 888-2971', 'Noor Hossain', 'Brother in law', '(347) 798-5328', 'X7OXVDZIMG_7628.jpeg', 'YE8HV5QJANNATUL_MAYEDA.pdf', NULL, '7S3HWFDIMG_9624.jpeg', 5, 'VTBkV2RHSkhPV3BoZWxreVRtbzRQUT09', 'Deactivated', '2023-07-31 12:40:29.000000', '2023-12-30 14:13:12.000000', '51616664', 95, '116,146,173,246,144,252,262', '60,60,50,50,50,50,50,50,40,40,', '116,146,173,246,144,252,262', NULL, NULL, 1995, 'BCQ4NO1IMG_9153.jpeg', 'POPRPN7IMG_7728.jpeg,5FJAATVIMG_8045.jpeg,NPVJY12IMG_9152.jpeg,OX19ESFIMG_8524.jpeg', NULL, NULL, '115,123,146,100,116,121,122,137,138,143,148,173,102,252,144,262,271,274,', NULL),
(83, 'Halima', NULL, 'Female', NULL, NULL, 'New York', NULL, '9293654609', NULL, NULL, 'Hk1932@nyu.edu', NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoV2RWbFhUblppYWtsNlVVRTlQUT09', 'Inactive', '2023-08-02 09:05:18.000000', '2023-08-02 09:05:18.000000', '39425961', NULL, NULL, NULL, NULL, NULL, NULL, 1997, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(84, 'Marwa Choudhury', NULL, 'Female', '1853 Gleason Ave', 'Bronx', 'New York', '10472', '16465917143', NULL, NULL, 'marwachoudhury@gmail.com', NULL, 36, NULL, 62, NULL, 'Sylhet, Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'William Cullen Bryant High School', 2004, 'Biomedical Engineering, City College of New York', 2008, 'Bioengineering, University of Pennsylvania', 2012, NULL, NULL, NULL, NULL, 'Masters', 'No', NULL, NULL, 1, 'Sunni', NULL, 'I try my best to adhere to religious practices. I pray daily, do the required fasting, sometimes volunteer fasting, listen to Islamic lectures to increase my knowledge and help me become a better version of myself.', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'Someone always trying to improve themselves and help people around them.', 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Masters', 'Yes', 100000, 5, 'Begum Nehar', '1853 Gleason Ave', 'Bronx', 'New York', 'United States', '16465917143', 'naharbegum2014@gmail.com', 'Retired', NULL, 'Nazia Anwar', 'Friend', '3474267451', 'Chris Pelletier', 'Manager', '6073776320', 'Apurva Limaye', 'Coworker', '7322139745', 'CL2IVKSFB_IMG_1691415021284.jpg', '37CZ6G4Marwa_Choudhury_Bio_Data-1.pdf', NULL, 'O7UFNP1IMG_20230807_105718.jpg', 5, 'VVZkNGMxbFhhRUZOYWtGNVRVRTlQUT09', 'Active', '2023-08-05 19:55:17.000000', '2023-12-14 09:31:33.000000', '21776476', 95, '283,290,173,232,246,282,102,115,122,124,', '60,60,50,50,50,50,40,40,40,40,', '122,121,116,173,146,115,232,246,282,290,109,314', NULL, NULL, 1987, '1KWPG6M16914204721671843609606121090339.jpg', 'X39Y7IBFB_IMG_1691415157194.jpg,UUZ5YNEFB_IMG_1691415221435.jpg,KBNJU5KFB_IMG_1691415402047.jpg,G1W1YEZFB_IMG_1691415509097.jpg', NULL, NULL, '146,173,116,121,122,137,166,100,101,123,115,232,246,102,252,144,273,256,282,283,290,109,124,', NULL),
(86, 'Fatema Begum', NULL, 'Female', NULL, NULL, 'New York', NULL, '3477797587', NULL, NULL, 'f.begum008@gmail.com', NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlRKb2FHSlhNV3hQUkVVd1RXcG5NVWxSUFQwPQ==', 'Inactive', '2023-08-06 08:46:58.000000', '2023-08-06 09:00:51.000000', '63786159', 21, NULL, NULL, NULL, NULL, NULL, 1994, NULL, 'VRBFYW4IMG_7365.jpeg,8BIY1M5IMG_2115.jpeg,483HX4WIMG_9705.jpeg,GTM7CMOPenultimateFullSizeRender.jpeg', NULL, NULL, NULL, NULL),
(87, 'Eman H Abbas', NULL, 'Female', '47-30 59th Street, 4A', 'Woodside', 'New York', '11377', '3475579488', NULL, NULL, 'imanabbas6031@gmail.com', NULL, 34, NULL, 63, 123, 'Cairo, Egypt', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, 'Cairo University', 2011, 'Hunter College', 2018, NULL, NULL, NULL, NULL, NULL, 'Yes', 'Department of Health', 'Dietitian', NULL, 'Sunni', NULL, 'I am a practicing Muslim. I pray my five prayers and maintain all obligated fasting. I also enjoy attending halaqas and seeking knowledge. I also believe that deen is not just what prayer and fasting. It is about how you treat people and how they feel around you.', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'I am looking for someone who is working on being a better Muslim and human. Someone who is trying to keep up with their prayers and attending halaqas. Someone who also sees that deen is also about how you treat others.', 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,Widowed,', 'No', 'Bachelor', 'Yes', NULL, NULL, 'Hossam Abbas', '47-30 59th Street, 4A\n4A', 'Woodside', 'New York', 'United States', '3475579488', 'imanabbas6031@gmail.com', 'Physical Therapist', NULL, 'Fatima', 'Friend', '347-779-7587', 'Asmaa', 'sister', '347-935-4642', 'Reem', 'Friend', '917-216-9718', 'anonymous.png', NULL, NULL, NULL, 5, 'VVZkS2EySjZSWGhQUkUxNVRWUktRUT09', 'Inactive', '2023-08-06 15:27:54.000000', '2023-08-06 16:27:31.000000', '61102971', 73, NULL, NULL, NULL, NULL, NULL, 1989, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(90, 'Djenabou Barry', NULL, 'Female', NULL, NULL, 'New York', NULL, '9294132462', NULL, NULL, 'djenabou.mohammad.1993@gmail.com', NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VWtkd2JHSnRSbWxOVkVwQlVVRTlQUT09', 'Inactive', '2023-08-07 18:06:15.000000', '2023-08-07 18:06:15.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1993, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(91, 'Muminah Muhammad', NULL, 'Female', NULL, NULL, 'Pennsylvania', NULL, '2673387499', NULL, NULL, 'muminahjane8@icloud.com', NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoV2RHRlhOV2hoUkVsbw==', 'Inactive', '2023-08-08 07:01:41.000000', '2023-08-08 07:01:41.000000', '67149567', NULL, NULL, NULL, NULL, NULL, NULL, 2001, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(92, 'Husna naz', NULL, 'Female', NULL, NULL, 'Pennsylvania', NULL, '2675165944', NULL, NULL, 'Saba.shafqaat@gmail.com', NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZkc2VtRkhSWGxOUkVWNFNWRTlQUT09', 'Inactive', '2023-08-08 09:05:30.000000', '2023-08-08 09:05:30.000000', '15723617', NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(93, 'Maha Noor Razak', NULL, 'Female', NULL, 'Philadelphia', 'Pennsylvania', '19145', '2677985444', NULL, NULL, 'ali.razak@icloud.com', NULL, 29, NULL, 5, 2, 'Pakistan', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Philadelphia High school', 2018, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'No', NULL, NULL, 1, 'Sunni', NULL, NULL, NULL, 'Headscarf,', 'No', NULL, NULL, NULL, 'No Preference', 'No', 'Specific Ethnicity', 'Other', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 30000, 6, 'Ali Razak', NULL, NULL, NULL, NULL, '2677985444', 'ali.razak@icloud.com', NULL, NULL, 'Ali Razak', 'Brother', '2677985444', 'Usman Razak', 'Brother', '2674320562', 'Samina Razak', 'Mothet', '2574320291', 'anonymous.png', 'EQN8BNQBill-201364442.pdf', NULL, 'N0CSRHNIMG_1558.jpeg', 5, 'VXpCQ2RFMUVUWGRPYW1jeA==', 'Active', '2023-08-08 12:55:52.000000', '2023-08-08 13:09:24.000000', '33036720', 92, '115,274,299,311,315,100,102,122,143,173,', '50,50,50,50,50,40,40,40,40,40,', '232,256,263,264,252,282,314', NULL, NULL, 1994, 'SKBVR0LIMG_1558.jpeg', '4LXR3GEffbd71cf-a072-4bb0-90ac-4fe09f4ba5ae_Original.jpeg,JTE4WZEffbd71cf-a072-4bb0-90ac-4fe09f4ba5ae_Original.jpeg,XRZ6LZQffbd71cf-a072-4bb0-90ac-4fe09f4ba5ae_Original.jpeg,0KP9M3Cffbd71cf-a072-4bb0-90ac-4fe09f4ba5ae_Original.jpeg', NULL, NULL, '146,100,116,121,122,123,173,101,137,138,115,102,252,256,144,262,271,274,109,299,311,143,315,', NULL),
(94, 'Lubna Akter', NULL, 'Female', NULL, 'Brooklyn', 'New York', '11210', '9296943833', NULL, NULL, 'fariaakter729@gmail.com', NULL, 24, NULL, 64, 120, 'bangladesh', NULL, 'Divorced', 'No', NULL, NULL, 'US Citizen', NULL, 'fdr', 2017, NULL, 2022, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'bank', 'teller', 30000, 'Sunni', NULL, 'I\'m a practicing muslimah', NULL, 'Jelbab/Abaya,', 'No', 'Sunni', NULL, 'Practicing', 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 5, 'Mozammel Haque', NULL, 'brooklyn', 'New York', NULL, '9293457878', 'MozammelHaque@gmail.com', 'unemployed', NULL, 'Julie m', 'friend', '9293756847', 'Emina K', 'friend', '3478984567', 'Krystal Col', 'co worker', '3476785940', 'anonymous.png', NULL, NULL, NULL, 5, 'VkVkV05sbFhOVUZOVkVVd1RsRTlQUT09', 'Inactive', '2023-08-08 17:00:32.000000', '2023-08-08 17:13:36.000000', '41040282', 85, NULL, NULL, NULL, NULL, NULL, 1999, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(95, 'Kia Quiñones', NULL, 'Female', NULL, NULL, 'Delaware', NULL, '4848366175', NULL, NULL, 'jkeymor@gmail.com', NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'U1ZWemVFMVVTVEJOUkdSeQ==', 'Inactive', '2023-08-08 20:28:23.000000', '2023-08-08 20:28:23.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1987, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(96, 'Gannat Elabed', NULL, 'Female', NULL, 'Charlotte', 'North Carolina', '28208', '2679161295', NULL, NULL, 'gannatelabed@gmail.com', NULL, 25, NULL, 68, 130, NULL, NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VWpJMWJHUklValZQVkdoQg==', 'Inactive', '2023-08-11 13:43:18.000000', '2023-08-11 13:46:40.000000', '50461047', 24, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(97, 'Zainab Sylla', NULL, 'Female', NULL, NULL, 'New York', NULL, '3476624470', NULL, NULL, 'Mayementoring@gmail.com', NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VmtkV2FGa3lhR3hqYTBGNFRWUm5QUT09', 'Inactive', '2023-08-13 04:56:42.000000', '2023-08-13 04:56:42.000000', '25271853', NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(98, 'Fawziyah Khan', NULL, 'Female', NULL, NULL, 'New York', NULL, '3474221896', NULL, NULL, 'fawziyah0786@gmail.com', NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VXpKb2RtSkhSa1ZhVlZKMllqSlNiMDlFVFM4PQ==', 'Inactive', '2023-08-13 06:16:28.000000', '2023-08-13 06:16:28.000000', '79455883', NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(100, 'Tasnim Jahan Mowla', 'Diya', 'Female', '666 Hemlock Street, Apt 1', 'Brooklyn', 'New York', '11208', '646-286-1270', NULL, '917-435-8219', 'dilrubakhanam311@gmail.com', 'N/A', 23, NULL, 64, 155, 'Bangladesh', 'Environmental allergies', 'Single', NULL, NULL, NULL, 'Other', 'I live in Dhaka and I have multi-year US tourist visa. I visited USA twice. I\'m under i130 applicati', 'Play Pen High School', 2020, 'current student', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, 'I\'m a practicing Muslima - perform daily prayers, performed Omra three times, observe fasting, wear Headscarf, etc.', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'Seeking a practicing muslim.', 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,Student Visa,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 50000, 5, 'Mohammed Fasiul Mowla', '\"Jahanara Garden\" House no-433, Block F, Road 11, Bashundara Residential Area, Dhaka, Bangladesh', 'Dhaka', NULL, 'Bangladesh', '9174358219', 'mowla84@yahoo.com', 'CEO, Anwar Landmark Ltd, Dhaka', 'I have one younger brother', 'Dr Mohammad M Mowla', 'Paternal Uncle', '4043689600', 'Shahadat Hussain', 'Maternal Uncle(in-law)', '917-435-8219', 'Dilruba Khanam', 'Maternal Aunty', '646-286-1270', 'L1TXJXEIMG_Diya.jpg', '9FIVV89CV_-_Tasnim_Jahan_Mowla.pdf', NULL, 'VPBPPZQIMG_Diya.jpg', 5, 'VW0xR01HRkhWbmxSUkVWNVRYcFJNUT09', 'Deactivated', '2023-08-14 03:57:38.000000', '2023-10-22 14:55:28.000000', '46714781', 97, '100,102,115,116,123,168,252,256,122,', '60,50,50,50,50,50,50,40,40,', '173,168,121,123,100,116,115,246,143,256', '180', NULL, 2000, 'RQHOQSODIYA.jpg', '9V0B9HYDiya_4.JPG,SD61P51IMG_8173.jpeg,NF73S6VDiya_2.JPG,CGNHVVYPHOTO.jpg', NULL, NULL, '100,116,121,123,168,122,138,143,146,166,115,102,252,256,', NULL),
(101, 'Flara Farok', NULL, 'Female', NULL, NULL, 'New York', NULL, '3478244258', NULL, NULL, 'flara1194@gmail.com', NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlRKNGJGcFlRWGhOUkVWbw==', 'Inactive', '2023-08-14 19:55:28.000000', '2023-08-25 11:00:12.000000', '19859645', NULL, NULL, NULL, NULL, NULL, NULL, 1994, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(102, 'Fatima-Zahra Amina Barnes', NULL, 'Female', '324 E 108 st Apt 17b', 'New York', 'New York', '10029', '6468420954', NULL, NULL, 'barnesfatima123@gmail.com', NULL, 20, NULL, 66, 118, 'New York', 'Eczema', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Tywls East Harlem', 2021, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'No', NULL, NULL, 1, 'Sunni', NULL, 'Pray all fard and the 12 sunnah, attend jummah and sisters halaqa every Friday, fast every Ramadan and then when I can', 'I’m not a revert', 'Niqab,', 'No', 'Sunni', NULL, 'Must attend masjid at least once everyday, must fast during Ramadan, must attend jummah, must pray 12 daily sunnahs', 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 100000, 6, 'Karima Benzizoune', '324 E 108 st apt 17b', 'New York', 'New York', 'United States', '(646)2633808', 'Kbarnes10029@gmail.com', NULL, NULL, 'Asiya', 'Friend', '(929) 254-9014', 'Gnouma', 'Friend', '(917) 605-7276', 'Fanta', 'Friend', '(929) 451-7324', 'anonymous.png', NULL, NULL, 'BO5AXB9IMG_0812.jpeg', 5, 'VVZkc2FtRkhSVE5PYW10NFVVRTlQUT09', 'Deactivated', '2023-08-16 04:35:28.000000', '2023-09-08 15:04:15.000000', '46349771', 92, '100,115,123,168,121,122,143,146,166,', '50,50,50,50,50,40,40,40,40,40,', '168', '204', NULL, 2003, 'QUWF865IMG_3193.jpeg', 'DHRQ7ZBIMG_3057.jpeg,BTS8OBZIMG_1898.jpeg,6LEESB1lp_image.jpeg,8FXFKJ9IMG_8374.jpeg', NULL, NULL, '100,123,168,121,122,143,146,166,173,101,115,', NULL),
(103, 'Gnouma Sissoko', NULL, 'Female', NULL, 'Bronx', 'New York', NULL, '9176057276', NULL, NULL, 'nagnouma123@gmail.com', NULL, 20, NULL, 66, 120, 'NY', 'none', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Inwood Early College for Health and IT', 2021, 'None', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'No', 'CUNY', 'Navigator', 1, 'Sunni', NULL, 'Daily prayers, attending halaqa once a week, fasting, visit masjid once a week, Quran memorization.', NULL, 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, 'Daily prayers, fasting, Attend Jummah prayers, Attend masjid once a day, Quran memorization.', 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 100000, 6, 'Salimata', NULL, 'Bronx', 'New York', NULL, '6462260826', 'salima.toure69@gmail.com', 'Nurse', NULL, 'Assiatou Barry', 'Club Leader', '929-254-9014', 'Fatima Barnes', 'Classmate', '646-842-0954', 'Fanta Diarra', 'Club Associate', '929-451-7324', 'BOMEQB478C1028D-08DA-4119-977C-12B151D9C0E9.jpeg', 'SGBO3YESissoko.G_Resume.pdf', NULL, '4TNHXTGLicense.jpeg', 5, 'VWpJMWRtUlhNV2hSUkVsNlNWRTlQUT09', 'Deactivated', '2023-08-16 04:37:49.000000', '2024-01-02 13:12:13.000000', '28109857', 95, '100,115,168,252,271,286,102,122,143,', '50,50,50,50,50,50,40,40,', '168,122,144', NULL, NULL, 2003, 'T2W1MCU97AECE5C-D3A7-4ECE-BBD9-96C2D9FF9471.jpeg', 'XITHH7FCE844E83-996F-4027-BCDC-2F49C220A29C.jpeg,PFZVWES50542170-8FE8-4F3C-93E1-4043A18C7301.jpeg,ST4A6SO3A29BC0A-EF2E-4A7E-8A2E-AD8D3FB943E0.jpeg,gallery4.jpg', NULL, NULL, '100,123,168,121,122,143,146,166,173,101,115,102,252,144,262,271,286,', NULL),
(104, 'Test Nowagain', NULL, 'Female', 'address', NULL, 'South Carolina', NULL, '3294808890', NULL, NULL, 'femail@femail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Student Visa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', 'stedent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-16 21:02:18.000000', '2023-08-16 21:02:18.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2004, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 'Test fifth', NULL, 'Female', 'address', NULL, 'Maine', NULL, '3948987979', NULL, NULL, 'femail@female.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Student Visa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Incognito', NULL, 2345, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-16 21:12:52.000000', '2023-08-16 21:12:52.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1999, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 'Test fifth', NULL, 'Female', 'address', NULL, 'Maine', NULL, '3948987979', NULL, NULL, 'femail@female.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Student Visa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Incognito', NULL, 2345, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-16 21:13:00.000000', '2023-08-16 21:13:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1999, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 'Test fifth', NULL, 'Female', 'address', NULL, 'Maine', NULL, '3948987979', NULL, NULL, 'femail@female.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Student Visa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Incognito', NULL, 2345, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-16 21:13:10.000000', '2023-08-16 21:13:10.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1999, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 'Fahima Haq Shobarna', NULL, 'Female', NULL, 'Philadelphia', 'Pennsylvania', '19104', '4845220730', NULL, NULL, 'fahima.shobarna@gmail.com', NULL, 23, NULL, 59, 102, 'Pennsylvania, USA', 'N/A', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Academy at Palumbo', 2018, 'Bachelor of Science from Temple University', 2022, 'Master in Public Health at Temple University', 2023, NULL, NULL, NULL, NULL, 'Masters', 'No', NULL, NULL, 1, 'Sunni', NULL, 'The most important part of who I am is definitely my faith. Islam plays the biggest role in my life and the decisions I make. I pray 5 times a day and observe fast during the month of ramadan and additional monday/thursdays when possible, and I enjoy going to the masjid when I can, especially for Jummah. I hope to become an even better muslimah and am working on constantly increasing my knowledge and practice of Islam insha’Allah.', 'N/A', 'Headscarf,', 'No', 'Sunni', NULL, 'Someone that is God-fearing/ God-conscious, prays 5 times a day daily, goes to the masjid daily or as often as they can,  in general a well mannered and kind hearted person', 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'Single,', 'No', 'No Preference', 'Yes', 80000, 5, 'Mohammed Hamidul Haque', NULL, 'Philadelphia', 'Pennsylvania', 'USA', '2159394911', 'starperfume@gmail.com', 'Business Owner', 'I have a big family, I\'m the youngest of 6 daughters, and I have a bunch of nieces and nephews', 'Umme Jahani', 'Sister', '2672657962', 'Ahmad Ismail Ibrahim', 'Brother in Law', '2674745909', 'Umme Salma', 'Sister', '5049314418', 'UACJ84NScreenshot_2023-08-18_at_12.39.58_AM.png', 'ZPDKDKSFahima_cv.docx.pdf', NULL, '59P8Q7SFahima_ID.pdf', 5, 'VkZkR2MxbFlXbkJqTTFKb1ltMUtNV0pFU1hkTmFrbG8=', 'Deactivated', '2023-08-16 16:54:49.000000', '2023-08-18 18:56:05.000000', '53505265', 97, '100,115,116,121,122,123,146,166,168,173,', '50,40,40,40,40,40,40,40,40,40,', NULL, NULL, NULL, 2000, 'JUYSPSKScreenshot_2023-08-18_at_2.23.41_AM.png', 'L04C30AScreenshot_2023-08-18_at_2.11.38_AM.png,1BMCMUSScreenshot_2023-08-18_at_12.39.58_AM.png,60ZAWGMScreenshot_2023-08-18_at_12.40.27_AM.png,LPU5ZGDScreenshot_2023-08-18_at_2.17.27_AM.png', NULL, NULL, '100,115,116,121,122,123,166,168,173,138,146,', NULL),
(110, 'Fahmida Sarmin', NULL, 'Female', NULL, NULL, 'Pennsylvania', NULL, '4846649263', NULL, NULL, 'fahmida.sarmin@gmail.com', NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VWxoV2VXSXpRbWhOYW1ONFNWRTlQUT09', 'Inactive', '2023-08-16 16:54:57.000000', '2023-08-16 16:54:57.000000', '20785613', NULL, NULL, NULL, NULL, NULL, NULL, 1994, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(113, 'Mehrun Nessa Huda', NULL, 'Female', '110 South Hudson Street', NULL, 'Virginia', NULL, '5713869479', NULL, NULL, 'mehrunrox@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Khan El Khalili (Part time)', NULL, 33280, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VkZoV2VtSkVSblJhZVVaNVlrRTlQUT09', 'Convention', '2023-08-17 02:18:14.000000', '2023-11-26 14:30:13.000000', '71760346', NULL, NULL, NULL, NULL, NULL, NULL, 2000, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 'Semira Jemal Ahemed', NULL, 'Female', NULL, NULL, 'Pennsylvania', NULL, '2674563890', NULL, NULL, 'semuyealem@gmail.com', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZkNGIxbFhNV3RrVjNod1lrZEZlVTFEYjJnPQ==', 'Inactive', '2023-08-17 05:06:58.000000', '2023-08-17 05:06:58.000000', '74476119', NULL, NULL, NULL, NULL, NULL, NULL, 2000, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(115, 'Nur Dihan', NULL, 'Female', '132-33 84th street', NULL, 'New York', NULL, '6463714314', NULL, NULL, 'saymameher@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', 'NYC Department of Education', NULL, 35000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Vkc1V2VWRkVSVFZQVkZVOQ==', 'Deactivated', '2023-08-17 14:07:21.000000', '2024-01-14 09:13:25.000000', '54041574', NULL, NULL, NULL, NULL, NULL, NULL, 1995, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 'Farwa Iftikhar', NULL, 'Female', '78 Kenzel Ave', NULL, 'New Jersey', NULL, '9292299725', NULL, NULL, 'Ayesha.ifi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Permanent Resident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Impel', NULL, 80000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-17 20:05:26.000000', '2023-08-17 20:05:26.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1996, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 'Farwa Iftikhar', NULL, 'Female', NULL, NULL, 'New Jersey', NULL, '9292299725', NULL, NULL, 'Ayesha.ifi@gmail.com', NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkVkR2IySXpTbXhOVkVsNlNWVkJhZz09', 'Inactive', '2023-08-17 20:08:02.000000', '2023-08-17 20:08:02.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1996, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(119, 'Rakeyah Ahsan', NULL, 'Female', '13 walden sq. rd. Apt#319', NULL, 'Massachusetts', NULL, '8579996674', NULL, NULL, 'Rahsan997@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Graduate student', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VkcxR2VtTnRiSFZaVjNRd1dsaEplRXRuUFQwPQ==', 'Convention', '2023-08-18 10:45:54.000000', '2023-08-18 10:45:54.000000', '80391716', NULL, NULL, NULL, NULL, NULL, NULL, 1997, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'Rakeyah Ahsan', NULL, 'Female', NULL, NULL, 'Massachusetts', NULL, '8579996674', NULL, NULL, 'Rahsan997@gmail.com', NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkcxR2VtTnRiSFZaVjNRd1dsaEplRXRuUFQwPQ==', 'Inactive', '2023-08-18 10:49:53.000000', '2023-08-18 10:49:53.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1997, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(121, 'Mohammad Rubel', NULL, 'Female', '571 Dudley st Dorchester Boston.zip 02125', NULL, 'Massachusetts', NULL, '9294711655', NULL, NULL, 'rubel.boston.us@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', 'Business', NULL, 50000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-18 14:34:00.000000', '2023-08-18 14:34:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1993, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 'Maliha Gul', NULL, 'Female', '672 Franklin Ave', NULL, 'New York', NULL, '3475204149', NULL, NULL, 'Gulmaliha3@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'QAFYS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-18 18:24:30.000000', '2023-08-18 18:24:30.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1996, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 'test neww', NULL, 'Female', 'address', NULL, 'South Carolina', NULL, '3940890835', NULL, NULL, 'test@sdlfkj.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Student Visa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'commetn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-19 07:54:46.000000', '2023-08-19 07:54:46.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1999, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 'Tanzina Begum', NULL, 'Female', '79 Aylwood Drive', NULL, 'New York', NULL, '3472852042', NULL, NULL, 'Tanzina.b98@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Northwell Hospital', NULL, 100000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-19 08:18:52.000000', '2023-08-19 08:18:52.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 'Aklima Mansi', NULL, 'Female', '79 Aylwood drive', NULL, 'New York', NULL, '7184139888', NULL, NULL, 'aklimamansi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Northwell Health', NULL, 90000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-19 08:23:29.000000', '2023-08-19 08:23:29.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1989, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 'Saima Afrin', NULL, 'Female', '1774 Dahill Rd', NULL, 'New York', NULL, '3474354303', NULL, NULL, 'wierdome2@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'MA at Cardiology office', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-19 08:46:25.000000', '2023-08-19 08:46:25.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2001, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 'Kulsum Rif', NULL, 'Female', 'Queens', NULL, 'New York', NULL, '9293509903', NULL, NULL, 'Kulsum.rifaa@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VVcxc2JsbHRSblZhZWtWNVRYbEZQUT09', 'Convention', '2023-08-20 10:18:45.000000', '2023-12-31 05:31:17.000000', '33042111', NULL, NULL, NULL, NULL, NULL, NULL, 2000, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 'Tamanna Syed', NULL, 'Female', '23 Newtowne Ct Apt 94', NULL, 'Massachusetts', NULL, '6176698701', NULL, NULL, 'tasyed@bu.edu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Mass General Hospital', NULL, 60000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'I am from Boston, MA, born in a Bangladeshi-Indian family. I am okay with relocating close to home. My hobbies include poetry, film/screenwriting, reading, music, and public health and advocacy work. Though I don\'t believe in perfection, I am looking for someone who is outgoing, conversational, educated/emotionally intelligent, amorous, giving, attractive/well-put together and charismatic. Race or cultural background is not a barrier.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-21 12:51:23.000000', '2023-08-21 12:51:23.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1997, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 'Soha', NULL, 'Female', 'Long island', NULL, 'New York', NULL, '516-259-2363', NULL, NULL, 'Akter_sh@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Permanent Resident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Jfk airport', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-22 15:33:22.000000', '2023-08-22 15:33:22.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1991, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 'Nabila Jaman', NULL, 'Female', '65-28 38th Ave', NULL, 'New York', NULL, '6467256791', NULL, NULL, 'Nabilajaman0@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Permanent Resident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-23 08:44:14.000000', '2023-08-23 08:44:14.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2002, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 'Nabila Jaman', NULL, 'Female', NULL, NULL, 'New York', NULL, '6467256791', NULL, NULL, 'nabilajaman0@gmail.com', NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WW10R2FXRlhlR2hoYlVaMFdWYzBNVTFxU1hRPQ==', 'Inactive', '2023-08-23 08:45:51.000000', '2023-08-23 08:46:03.000000', '59701632', NULL, NULL, NULL, NULL, NULL, NULL, 2002, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(132, 'Mushfika c', NULL, 'Female', '3752 64th Street', NULL, 'New York', NULL, '9173480445', NULL, NULL, 'Mushfika11@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Electric', NULL, 70000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-24 16:14:30.000000', '2023-08-24 16:14:30.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 'Mushfika chowdhury', NULL, 'Female', NULL, 'Woodside', 'New York', '11377', '9173480445', NULL, NULL, 'mushfika11@gmail.com', NULL, 25, NULL, 55, 150, 'United States', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Queens vocational and technical high school', 2016, 'Western governers university', 2021, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Electric', 'QA', 70000, 'Sunni', NULL, 'Praying 5 times daily, fasting, charity, morning/evening adkar', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'Praying five times a day, fasting, having good character', 'Yes', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 85000, 7, 'Hazera chowdhury', NULL, NULL, 'New York', NULL, '917-348-0445', 'Mushfika11@gmail.com', NULL, NULL, 'Hazera chowdhury', 'Mother', '9173480445', 'Madani chowdhury', 'Brother', '9173480445', 'Mahdi chowdhury', 'Brother', '9173480446', '54H3ZLBF1C91736-BFA7-4328-A3B8-2478AECF3BA0.jpeg', '4SCY6XWCV_Mushfika_chowdhury_#1_(1).pdf', NULL, NULL, 5, 'VW0xR2FscFhTblppTW5ONFRrTkZQUT09', 'Deactivated', '2023-08-24 16:20:36.000000', '2023-12-30 13:27:14.000000', '83243415', 97, '115,100,168,173,252,102,122,138,166,', '70,70,60,60,60,60,50,50,50,50,', '173,166,246,256,115,252,264,144,248,263,168,271,274,262', NULL, NULL, 1998, 'KPXRWS3A61A37F9-113C-4DC2-B2B2-D16D6D2C1610.png', 'QJOM9WJA4EA38D8-DCB7-436E-BEF9-BA687388474B.jpeg,HTBD8RB3013A5A4-713D-4E3A-BE25-6C48047D9230.jpeg,NBZK361IMG_4879.HEIC,O7G0TCLCE00EDB7-5066-4EE6-8739-F8CA605BE5CB.jpeg', NULL, NULL, '115,100,123,168,173,116,121,122,138,146,102,252,144,262,273,166,', NULL),
(134, 'Nazifa Akter', NULL, 'Female', '386 Ocean Pkway', NULL, 'New York', NULL, '9292906829', NULL, NULL, 'tashmiakashem123@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hello!\nI\'m setting this up for my cousin to find a spouse. \nShe is an intelligent young woman. She has her bachelor\'s in computer system technology and is currently searching for jobs. We are looking for someone who is well educated and family oriented. We are also looking for someone who completed their education in the US and someone age 25-30.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VkcxR05tRlhXbWhOVkVsNlRrTkZQUT09', 'Convention', '2023-08-24 16:39:33.000000', '2023-08-24 17:02:11.000000', '66464286', NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 'Nazifa Akter', NULL, 'Female', NULL, NULL, 'New York', NULL, '9292906829', NULL, NULL, 'tashmiakashem123@gmail.com', NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZjNWJFMVVTWHBPUTBVOQ==', 'Inactive', '2023-08-24 16:44:21.000000', '2023-08-24 16:44:21.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(136, 'Shamima Khatun', NULL, 'Female', '2680 Mill ct. ,Doraville, GA 30360', NULL, 'Georgia', NULL, '01723533726', NULL, NULL, 'kamalshorker@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VVZoT2MxbFhNR3ROVkdzMVRuYzlQUT09', 'Convention', '2023-08-28 17:19:27.000000', '2023-08-28 17:35:41.000000', '77787558', NULL, NULL, NULL, NULL, NULL, NULL, 1993, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UserApp_femaleuser` (`userId`, `fullName`, `nickName`, `gender`, `address`, `city`, `state`, `zip`, `cellPhone`, `workPhone`, `homePhone`, `email`, `personalWebsite`, `age`, `dateOfBirth`, `height`, `weight`, `placeOfBirth`, `health`, `maritalStatus`, `children`, `childrenNumber`, `childrenAges`, `immigrationStatus`, `immigrationStatusOther`, `highSchool`, `highSchoolYear`, `bachelors`, `bachelorsYear`, `masters`, `mastersYear`, `doctorate`, `doctorateYear`, `otherDegree`, `otherDegreeYear`, `highestEducation`, `employed`, `employment`, `position`, `income`, `religiousPractice`, `religiousPracticeOther`, `religiousPracticeBrief`, `revertTime`, `wear`, `smoker`, `preReligious`, `preReligiousOther`, `preReligiousBrief`, `preBeard`, `preSmoking`, `preEthnic`, `preEthnicSpecific`, `preImmigrationStatus`, `preImmigrationStatusOther`, `preMaritalStatus`, `preChildren`, `preEducation`, `preEmployment`, `preIncome`, `preAgeGap`, `guarName`, `guarAddress`, `guarCity`, `guarState`, `guarCountry`, `guarPhone`, `guarEmail`, `guarProfession`, `familyBrief`, `refName1`, `refRelation1`, `refPhone1`, `refName2`, `refRelation2`, `refPhone2`, `refName3`, `refRelation3`, `refPhone3`, `photo`, `cv`, `album`, `govIssuedId`, `matchShowLimit`, `userPass`, `status`, `openingDate`, `lastEdit`, `userToken`, `profileCompleteness`, `matchId`, `matchPercentage`, `reqAccepted`, `reqRejected`, `reqSent`, `birthYear`, `signature`, `gallery`, `tempGallery`, `lockedId`, `cuMatchId`, `reqLock`) VALUES
(137, 'Shamima Khatun', NULL, 'Female', NULL, NULL, 'Georgia', NULL, '01727218439', NULL, NULL, 'kamalshorker@gmail.com', NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VXpKR2RGbFhkM2hQVkdzeg==', 'Inactive', '2023-08-28 17:31:00.000000', '2023-08-28 17:31:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1993, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(140, 'Nur Dihan', NULL, 'Female', '132-33 84th Street Ozone Park', NULL, 'New York', NULL, '6463714314', NULL, NULL, 'saymameher@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', 'Department Of Education', NULL, 35000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-31 15:16:47.000000', '2023-08-31 15:16:47.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1995, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 'Nazma Akther', NULL, 'Female', 'Arlington', NULL, 'Virginia', NULL, '571-282-8601', NULL, NULL, 'nazma1999@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', 'Own business', NULL, 50000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', '2023-08-31 16:55:40.000000', '2023-08-31 16:55:40.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1965, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 'Nazma Akther', NULL, 'Female', NULL, NULL, 'Virginia', NULL, '5712828601', NULL, NULL, 'nazma1999@yahoo.com', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkcxR05tSlhSWGhQVkdzMVNWRTlQUT09', 'Inactive', '2023-08-31 17:14:47.000000', '2023-08-31 17:14:47.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1965, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(144, 'Salina SK', NULL, 'Female', NULL, NULL, 'New York', NULL, '13474769540', NULL, NULL, 'lina.sk202@gmail.com', NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVRJNWRtSkhNV2hqYmtvMVVVUkZlVTFCUFQwPQ==', 'Inactive', '2023-09-11 06:21:10.000000', '2023-09-11 06:21:10.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1987, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(145, 'Maryam Muhammad', NULL, 'Female', NULL, 'Jacksonville', 'Florida', NULL, '9048017349', NULL, NULL, 'maryamrbinthakim@gmail.com', NULL, 20, NULL, 68, 115, 'Pennsylvania', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'FLVS', 2020, 'N/A', NULL, NULL, NULL, NULL, NULL, 'Network Systems Technology (A.S)', 2021, 'Other', 'Yes', 'Liveops', 'Chat Agent', 29000, 'Sunni', NULL, 'I pray all obligatory prayers, fast, recite Qur\'an (I love to recite), etc. I love to learn and I always strive to be a better Muslimah. Alhamdulillah, I recently went to Umrah and would absolutely love to go back.', NULL, 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, 'Fulfills religious obligations, is knowledgeable about the deen, and strives to become a better Muslim.', 'No Preference', 'No', 'Own Ethnicity', 'American', 'US Citizen,', NULL, 'Single,', 'No', 'No Preference', 'Yes', 50000, 6, 'Abdul-Hakim Muhammad', NULL, 'Durham', 'North Carolina', NULL, '215-275-1232', 'abdulhakim.muhammad@gmail.com', 'Business Owner', NULL, 'Suhaylah Lee', 'Mother', '2675939662', 'Anthony Johnson', 'Grandfather', '2156096252', NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoV01GbFhjR2hrTTJSd1lXMUdiMDFUUlQwPQ==', 'Deactivated', '2023-09-23 05:36:23.000000', '2023-09-23 11:49:48.000000', '56427551', 95, NULL, NULL, NULL, NULL, NULL, 2003, 'R4DEQQPsignature.png', 'G5VTC8Utable-filled-with-large-variety-of-food-shot-from-royalty-free-image-1659038707.jpg,CKQY78Xjpg.jpg,I2LF8KEpost757_title_20220823_074725.png,4YTYRF5pair-sport-shoes-fitness-accessories-fitness-concept_979672-3084.avif', NULL, NULL, NULL, NULL),
(146, 'Islam', NULL, 'Female', NULL, NULL, 'Maryland', NULL, '3017285200', NULL, NULL, 'smtariqul@gmail.com', NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlcxR2RHTklWbmxaVlVGNlQwUlZNUT09', 'Inactive', '2023-10-01 05:45:47.000000', '2023-10-01 05:45:47.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2001, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(148, 'Faiza', NULL, 'Female', NULL, 'Sterling Heights', 'Michigan', '48312', '9294317469', NULL, NULL, 'Faizachowdhury21@gmail.com', NULL, 25, NULL, 5, 98, 'Sylhet Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Astor Collegiate Academy', 2017, 'Health Administration', 2022, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'School', 'Teaching assistant', 30, 'Sunni', NULL, NULL, NULL, 'Headscarf,', 'No', 'Sunni', NULL, NULL, 'Yes', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 70, 4, 'Farzana Chowdhury', NULL, NULL, NULL, NULL, '3476918084', 'islambelal8@gmail.com', NULL, NULL, 'Sabrina Akther', 'Close freind', '347 208 3083', 'Fahema Akther', 'Close freind', '929 431 2094', 'Muaz Chowdhury', 'Brother', '929 431 4840', 'QM2Q5ES831BF695-A793-4532-BF3C-08F1900CC201.jpeg', 'LESBBN9Faiza-Chowdhury.pdf', 'E5MT2YK5E526CC3-5CBB-4431-B90D-CE2E91263986.jpeg', 'CJA5QP9IMG_8475.jpeg', 5, 'VlcwNWVscFVSWGxOZWxFeA==', 'Deactivated', '2023-10-02 11:51:28.000000', '2024-03-28 16:49:43.000000', '44948170', 90, '299,311,100,102,115,122,168,252,256,264,', '70,70,70,60,60,60,60,60,60,60,60,', NULL, NULL, NULL, 1999, 'PMI8Q2Msignature.png', 'VTEQHZC39269604-CBC9-4E72-985D-905EA8AEB970.jpeg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, '299,311,100,102,115,122,168,252,256,264,', NULL),
(149, 'Sabrina Akther', NULL, 'Female', '1420 Wood Road', 'Bronx, New York', 'New York', '10462', '3472083083', '347-208-3083', '3472083083', 'sabrina.akther9@gmail.com', NULL, 25, NULL, 58, 95, 'Sylhet,Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, 'English BA', NULL, NULL, NULL, NULL, NULL, NULL, 2021, 'Bachelor', 'Yes', 'SmartStart Education', 'Teacher', 40000, 'Sunni', NULL, 'I dedicate my time for the 5 daily prayers and fast during Ramadan.', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'Prays the 5 daily prayers, seeking a open minded and respectful spouse who’s willing to grow in deen with me. Should pray and fast and perform his obligatory Islamic duties of a husband.', 'Yes', 'No', 'Own Ethnicity', NULL, 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Masters', 'Yes', 80000, 3, 'Ruhena Begum', '1420 Wood Road', 'Bronx', 'New York', 'United States', '3472083083', 'sabrina.akther9@gmail.com', 'Teacher', NULL, 'Faiza', 'Friend', '9294317469', 'Fahema', 'Sister', '9294312094', 'Zakia', 'Friend', '9294086290', 'anonymous.png', NULL, NULL, NULL, 5, 'VlRKR2FXTnRiSFZaVkVVMVQxUm5QUT09', 'Inactive', '2023-10-02 12:29:35.000000', '2023-10-02 13:47:13.000000', '28999302', 80, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(150, 'Khadijah Shahid', NULL, 'Female', 'Khrorfakkan', 'Fujairah', 'Michigan', '48015', '3133274711', NULL, NULL, 'ayshashahid29@gmail.com', NULL, 21, NULL, 55, 125, 'United Arab emirates', NULL, 'Single', NULL, NULL, NULL, 'Other', 'Lives in Fujairah, United Arab Emirates', 'Our Own', 2020, 'Computer engineering', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, NULL, NULL, 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 70000, 5, 'Mohammed Abdul Shahid', NULL, NULL, 'Michigan', 'United Arab Emirates', NULL, 'ayshashahid29@gmail.com', 'Imam', 'I live in United Arab Emirates with my family', 'Aysha Abdul Shahid', 'Sister', '3133274711', NULL, NULL, NULL, NULL, NULL, NULL, 'K8P6UR4IMG-20230527-WA0014.jpg', NULL, NULL, NULL, 5, 'VkZoV2VtSkhiSFJOVkVsNlVVRTlQUT09', 'Inactive', '2023-10-05 11:37:45.000000', '2023-11-02 03:57:20.000000', '62277461', 87, NULL, NULL, NULL, NULL, NULL, 2002, NULL, 'TU09HKNIMG-20230527-WA0014.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(151, 'Maliha', NULL, 'Female', NULL, 'Brooklyn', 'New York', NULL, '3475204149', NULL, NULL, 'gulmaliha3@gmail.com', NULL, 27, NULL, 66, 125, NULL, NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Science', 2013, 'Biology', 2017, 'Biology and Physical Science', 2020, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, 'Teacher', 12000, 'Sunni', NULL, 'daily prayers, fasting, attending + leading halaqas, working at Islamic school', NULL, 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, NULL, 'Yes', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 30000, 5, 'Abdul Rahim', NULL, NULL, 'New York', NULL, '9175009629', 'abdul7q@gmail.com', NULL, NULL, 'Firoza Akter', 'Supervisor', '16463593212', NULL, NULL, NULL, NULL, NULL, NULL, 'RXWJRHE44591737_2140114402705975_4610808109932216320_n.jpg', 'XS9T4E6Maliha_Biodata.docx', NULL, 'KSD4LU5d2221930-5879-4a2d-b878-cb93ee0685b5.jfif', 5, 'VkZaV1QxRlhNV2hrU0Vwd1lsYzVkV0ZYUm5OTmFrRjVUWGM5UFE9PQ==', 'Active', '2023-10-08 13:30:37.000000', '2024-05-04 14:39:47.000000', '43199380', 90, '115,299,311,315,100,102,122,168,173,256,', '70,70,70,70,60,60,60,60,60,60,', '116,116,102,173,144,264,256,168,115,262,137,143,124,283,311', NULL, NULL, 1996, 'GO591G5signature.png', 'gallery1.jpg,gallery2.jpg,gallery3.jpg,N19NLLXIMG_5430.JPG', NULL, NULL, '115,100,102,116,122,123,146,168,173,252,144,262,256,274,288,299,311,315,', NULL),
(152, 'Jamie Aktar', NULL, 'Female', NULL, NULL, 'New York', NULL, '9294909866', NULL, NULL, 'sababhoiyan@gmail.com', NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlRKR2FWbFhTbTlpTW13MVdWYzBlRWxSUFQwPQ==', 'Inactive', '2023-10-11 16:26:53.000000', '2023-10-14 01:21:56.000000', '34635891', NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(155, 'Zihan Chowdhury', NULL, 'Female', NULL, NULL, 'Pennsylvania', NULL, '2677181677', NULL, NULL, 'zihanchowdhury87@gmail.com', NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VmpKR2MySklWa0ZQUkdjMVQxRTlQUT09', 'Inactive', '2023-10-18 09:14:16.000000', '2023-10-18 09:14:16.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1987, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(157, 'Labiba Ferdousi', NULL, 'Female', '1052 Crescent Street', 'Brooklyn', 'New York', '11208', '7186908011', NULL, NULL, 'sharminlz@yahoo.com', NULL, 21, NULL, 64, 140, 'Brooklyn, NY', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Al Madina Islamic School', 2019, 'LIU', 2023, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Brooklyn Hospital', 'Pharmacy Intern', NULL, 'Sunni', NULL, NULL, NULL, 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 5, 'Gazi Ferdous', '1052 Crescent Street', 'Brooklyn', 'New York', 'USA', '6462890337', 'gaziferdousi@yahoo.com', 'Computer scientists', 'We tried to raise our kids upon proper Islam and looking for a practicing Muslim guy.', 'Gazi Ferdousi', 'Father', '6462890337', NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZoc2FGbFhOVUZOVkVWM1QwRTlQUT09', 'Active', '2023-11-19 16:15:28.000000', '2024-01-15 10:08:13.000000', '29808451', 92, '100,168,271,292,299,311,315,101,102,115,', '50,50,50,50,50,50,50,40,40,40,', '143,168,166,102,286', NULL, NULL, 2002, 'VXJT1WPIMG_99FF0FC3DE27-1.jpeg', '3BR9ETOIMG_2590.png,BDM87KDIMG_2553.jpeg,1M6I5V4IMG_2544.jpeg,ML5YACMIMG_2590.png', NULL, NULL, '100,123,143,168,271,101,102,115,122,138,288,299,292,311,315,', NULL),
(158, 'Sanjeda', NULL, 'Female', NULL, 'Brooklyn', 'New York', '11226', '9295596424', NULL, NULL, 'sanjeda6244611@gmail.com', NULL, 23, NULL, 5, 120, NULL, NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Chitaggong Government Women\'s College', 2019, 'BMCC', 2022, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, 'Practicing Muslim', 'N/A', 'Headscarf,', 'No', 'Sunni', NULL, 'Practicing Muslim', 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 10, 'MD Ali', 'Brooklyn', 'brooklyn', 'New York', NULL, '3478567027', 'mdali2020@gmail.com', 'Cook', NULL, 'Faria', 'Friend', '9296943833', 'Milu', 'Friend', '9292582766', 'saleha Begum', 'Aunt', '9295339602', 'ZNJ57EYIMG-20220706-WA0077_Original.jpeg', 'P0MYT1IBio_data.pdf', NULL, 'RURVSP7cc1ceb2f-784d-4f8d-9722-d7e6033cd85a.JPG', 5, 'VmtkR2RGbFhOWFZaVkZVd1RYcEplRXBCUFQwPQ==', 'Active', '2023-11-24 13:50:45.000000', '2023-12-19 13:09:55.000000', '80912314', 97, '274,311,100,102,115,122,124,143,148,166,', '50,50,40,40,40,40,40,40,40,40,', '166,173,246,252,271,248,123,274,102,115,286,311,299', NULL, NULL, 2000, 'WJGOQ04IMG_6173.jpg', 'ZASESB323ad2200-a485-4682-be0c-9c2c3a7b1702.JPG,427HGGD3c7b54e6-e2fb-4526-ab48-0b25a9b9b456.JPG,NHFOIEAc261b503-8704-4d60-ad71-c3199f811a06.JPG,QJRB6BW7a85c89b-fb15-417d-ade5-93e20b6565ae.JPG', NULL, NULL, '146,100,102,115,122,123,138,143,144,274,148,166,109,124,311,', NULL),
(159, 'Rokeya Begum', NULL, 'Female', NULL, NULL, 'New York', NULL, '716 658 1767', NULL, NULL, 'farhanaakther112@yahoo.com', NULL, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVcxc2VtSlhiSE5pUjBadlRXcEJlVTE1VVQwPQ==', 'Inactive', '2023-11-25 10:53:11.000000', '2023-11-25 10:53:11.000000', '20339164', NULL, NULL, NULL, NULL, NULL, NULL, 1955, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(160, 'Shawon Bhuiyan', NULL, 'Female', NULL, 'South Richmond hill', 'New York', NULL, '19292932035', NULL, NULL, 'shawon_bhuiyan@ymail.com', NULL, 32, NULL, 5, 141, NULL, NULL, 'Divorced', 'No', NULL, NULL, 'US Citizen', NULL, 'GED', 2014, 'Chemical Engineering', 2021, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', NULL, NULL, 60000, 'Sunni', NULL, NULL, NULL, 'None,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 60000, 4, 'Ghulam A Bhuiyan', NULL, NULL, NULL, NULL, '3472795806', 'shawon_bhuiyan@ymail.com', NULL, NULL, 'Ibrahim Bhuiyan', 'Brother', '3477457726', NULL, NULL, NULL, NULL, NULL, NULL, 'BQ2QDZ71052287_543904658999182_610283332_o.jpg', 'SP6M50ZBio_Doc_2023.pdf', NULL, '2412LGYDL.jpg', 5, 'VVcxNE1WcFVSVFZQVkVWeA==', 'Active', '2023-11-25 13:51:32.000000', '2024-05-06 02:52:09.000000', '66099785', 95, '115,311,100,173,274,283,290,315,101,102,', '60,60,50,50,50,50,50,50,40,40,', '274,256,286,246,148,290,283,109,314', NULL, NULL, 1991, 'UUFWQ4JSignature_Image.jpg', 'SOANUDQIMG_20231124_235121_710.jpg,UWOI0EP1000011754.jpg,OOAN921IMG_20230528_234635_673.jpg,gallery4.jpg', NULL, NULL, '115,144,262,100,146,173,271,101,274,102,138,123,148,283,137,290,109,311,143,315,', NULL),
(162, 'kulsum Rifa', 'N/A', 'Female', NULL, 'Jamaica', 'New York', NULL, '9293509903', NULL, NULL, 'kulsum.rifaa@gmail.com', NULL, 23, NULL, 165, 58, NULL, 'N/A', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'N/A', 2018, 'Bachelors in psy', 2022, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', NULL, 'Heartsaver® AED/CPR/First Aid instructor', 1, 'Sunni', NULL, 'I try my best to do the obligatory acts, I often fast on Mondays and Thursdays. I also try my best to pray Jummah at the masjid. I am enrolled in a master\'s program on Islamic studies with Muna which is starting from Janurary.', 'N/A', 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, 'We are looking for someone who adheres to the Quran and Sunnah (ie. the obligation) and someone who will be a good role model to their future kids. The groom should be soft-spoken and respectful.', 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,Student Visa,', NULL, 'Single,', 'Yes', 'Bachelor', 'Yes', 100000, 5, 'Afsana Begum mom', NULL, NULL, 'New York', NULL, '3477419497', 'loskor1971@gmail.com', NULL, 'dads phone: (loskor: +1 (929) 438-8161)', 'Md Loskor', 'dad', '(929) 438-8161', 'Habiba Riva', 'sister', '9292189625', 'Salma Riki', 'SIster', '(347) 285-3573', '4VNEV0HIMG_FA8B1585DE89-1.jpeg', 'S4RJKZSCV.pdf', NULL, '7Q3053SID.pdf', 5, 'VVcxc2JsbHRSblZhZWtWNVRYbEZQUT09', 'Deactivated', '2023-11-26 14:23:40.000000', '2024-02-18 03:40:13.000000', '46925152', 97, '123,271,274,252,248,115,288,286,246,124', '50,50,50,50,50,50,50,50,40,40,', '123,271,274,252,248,115,288,286,246,124', NULL, NULL, 2000, '2N2GDA8signature.png', '89TWOXEIMG_6E3965C549FE-1.jpeg,PSVT7UHIMG_35C742C983B2-1.jpeg,YXQ0NUWIMG_D0B99343C3D4-1.jpeg,IMXC6ZNIMG_FA8B1585DE89-1.jpeg', NULL, NULL, '100,115,123,144,168,252,262,271,102,122,138,143,286,288,299,', NULL),
(163, 'Mehrun Huda', NULL, 'Female', NULL, NULL, 'Virginia', NULL, '5713869479', NULL, NULL, 'Mehrunrox@gmail.com', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoV2VtSkVSblJhZVVaNVlrRTlQUT09', 'Inactive', '2023-11-26 14:24:29.000000', '2023-11-26 14:24:29.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2000, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(164, 'Nur Dihan', NULL, 'Female', '84th street', 'Ozone Park', 'New York', '11417', '6463714314', NULL, NULL, 'Saymameher@gmail.com', NULL, 28, NULL, 5, 128, 'Bangladesh', 'NA', 'Divorced', 'No', NULL, NULL, 'US Citizen', NULL, 'International School Of Health Science', 2019, 'Assoiate: LaGuardia community college', 2023, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', 'NYC Department of Education', 'Paraprofessional', 35000, 'Sunni', NULL, 'Practice Muslim', NULL, 'Headscarf,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,', NULL, 'Single,Divorced,Widowed,', 'No', 'No Preference', 'Yes', 45000, 7, 'Sayma Meher', '132-33 84th street', 'Ozone Park', 'New York', '11417', '646-3714314', 'Saymameher@gmail.com', 'Teacher', NULL, 'Mohammed Mannan', 'Beother in Law', '917-444-9974', 'Hobaiba Sayeesi', 'Sister', '929-421-5581', 'Fabiha Rafrafin', 'Friend', '929-328-8856', 'IEA6HTW1cc3e7c6-8990-40dc-9fc8-176523b99389.jpeg', 'MBQHJSUNur_Dihan_Biodata.pdf', NULL, '8AXOU2NIMG_9942.jpeg', 5, 'Vkc1V2VWRkVSVFZQVkZVOQ==', 'Deactivated', '2023-11-26 15:34:42.000000', '2024-01-14 09:44:08.000000', '53274004', 90, '102,115,173,252,256,274,283,100,122', '70,70,60,60,60,60,60,60,60,60,', '173,256,264,144,282,283,274,252,271,246', NULL, NULL, 1995, '50DLCMLIMG_9941.jpeg', 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, '102,115,144,173,252,256,262,271,274,100,122,283', NULL),
(166, 'Tanzina Begum', NULL, 'Female', NULL, NULL, 'New York', NULL, '3472852042', NULL, NULL, 'tanzina.b98@gmail.com', NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WkVkc2RXRXllR3hVVmxaUFVWUnJORWxSUFQwPQ==', 'Inactive', '2023-11-27 11:05:27.000000', '2023-11-27 11:05:27.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(167, 'Tamanna Syed', NULL, 'Female', NULL, NULL, 'Massachusetts', NULL, '6176698701', NULL, NULL, 'tasyed@bu.edu', NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VDFSa2VXRlhOV3RhTWxaRFlraFdiRWxSUFQwPQ==', 'Inactive', '2023-11-27 11:09:34.000000', '2023-11-27 11:09:34.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1997, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(168, 'Hobaiba', NULL, 'Female', 'Ozone Park', 'Queens', 'New York', '11417', '6463714314', NULL, NULL, 'saymameher@yahoo.com', NULL, 25, NULL, 64, 128, 'Bangladesh', 'Good', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'International School of health science', 2019, 'York College', 2022, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Lenox hill Hospital', 'Lab technologist', 100000, 'Sunni', NULL, 'Practice Muslim', NULL, 'Headscarf,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 100000, 5, 'Sayma Meher', 'Queens', 'Queens', 'New York', 'USA', '646-371-4314', 'saymameher@yahoo.com', 'Teacher', 'NA', 'Sayma Meher', 'Sister', '6463714314', 'Mohamed Mannan', 'Brother in law', '917-444-9974', 'Nur Dihan', 'Friend', '934-212-0285', 'Y7OEP9CIMG_9719.jpeg', 'AX8ZZ21IMG_9944.pdf', NULL, 'KA945RB72695706942__9DC50115-05ED-4561-ABC2-52211A3D6581.fullsizerender.jpeg', 5, 'VTBjNWFWbFhiR2xaVlVGNFQxUnJOQT09', 'Inactive', '2023-11-28 13:27:25.000000', '2024-01-17 03:53:46.000000', '69919185', 87, NULL, NULL, NULL, NULL, NULL, 1998, 'BXH6477IMG_0101.jpeg', 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(169, 'Shaima', NULL, 'Female', NULL, NULL, 'New York', NULL, '3477708462', NULL, NULL, 'begumparul673@gmail.com', NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlVkR2VRPT0=', 'Inactive', '2023-12-02 14:48:56.000000', '2023-12-02 14:48:56.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1988, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(170, 'Shaima Ahmed', NULL, 'Female', NULL, NULL, 'New York', NULL, '3472213322', NULL, NULL, 'shaima2188@yahoo.com', NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZkNGMxbFhhREZOYWtVMFQwTkZQUT09', 'Inactive', '2023-12-04 11:54:24.000000', '2023-12-04 11:54:24.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1988, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(172, 'FAHMIDA SHIFAT', NULL, 'Female', NULL, NULL, 'Florida', NULL, '9294187694', NULL, NULL, 'sifatnizam48@gmail.com', NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WlVkc2Exa3pWbkpNV0Vad1lsYzFSazE1TVRKaFYxcHRZakpqUFE9PQ==', 'Inactive', '2023-12-05 03:18:04.000000', '2023-12-05 03:18:04.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1990, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(173, 'Zarin Musarrat Manita', 'Manita', 'Female', 'PO Box 91069', 'Lake Charles', 'Louisiana', '70609', '01732309143', NULL, NULL, 'zmmanita2000@gmail.com', NULL, 25, NULL, 62, 120, 'Bangladesh', 'None', 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Viqarunnisa Noon School & College', 2018, NULL, 2024, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, 'I practice all Farz practices in Islam (daily prayers, fasting during Ramadan, etc). I volunteer at the local masjid during Ramadan.', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'Islam is a big part of my identity, and so my primary concern is finding someone who is a practicing Muslim. I consider my approach toward Islam to be “academic”, meaning that I consider researching and understanding Islam to be of the same importance as implementing it. I am looking for intellectual compatibility, respect, and companionship.', 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 25000, 5, 'Md Rezaul Karim', NULL, 'Dhaka', NULL, 'Bangladesh', '01715026703', 'reza.du.1969@gmail.com', 'Banker', 'Hossne Akhter (Kaniz)\nMother | Assistant Professor & Head of Department, Dept of Psychology | Dhaka Model College | BSc & MSc, University of Dhaka\n\nMd Rezaul Karim\nFather | Assistant Vice President, Treasury Division | First Security Islami Bank Limited | BSc & MSc, University of Dhaka\n\nMohammad Mukarram Ahbab Rihab\nBrother | Student | St. Claire College, Canada\n\nMohammad Mukarram Ashab Musab\nBrother | Student | Class XI | Dhaka Residential Model College', 'Md Rezaul Karim', 'Father', '01715026703', 'Hossne Akhter', 'Mother', '01732309143', 'Dr Nasrin Akhter', 'Aunt', '01720532056', 'anonymous.png', 'MK09Y26ManitaResume.pdf', NULL, '5QNVRBULouisianaIDCard_ZManita.pdf', 5, 'V1cxV2FHUkhlR3hqTWpGeFRXcEJhQT09', 'Active', '2023-12-06 18:37:31.000000', '2024-03-06 07:57:01.000000', '31182241', 92, '115,274,299,311,315,100,102,122,143,168,', '60,60,60,60,60,50,50,50,50,50,', '173,274,246,252,311,124', NULL, NULL, 1998, 'U7A0V3XIMG_3622.jpg', 'NL5REPAdownload.jpeg,ATBSTQ785B2007E-36D7-487C-BCAD-ED0C639F9919.jpeg,IRC7E8J80407A3C-6510-4210-A6E6-046ABA21E239.jpeg,F6LX6NK29605c568c437c704e85b354e434654b.jpeg', NULL, NULL, '288,299,100,102,115,122,168,252,256,271,274,173,311,143,315,', NULL),
(174, 'Zara', NULL, 'Female', NULL, NULL, 'Michigan', NULL, '3474762261', NULL, NULL, 'zara_yas89@hotmail.com', NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZkNGJHVkhVbWhoVnpSNVRVUkJNMGxSUFQwPQ==', 'Inactive', '2023-12-09 18:30:23.000000', '2023-12-09 18:30:23.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1995, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(175, 'meenatullah', NULL, 'Female', NULL, NULL, 'Michigan', NULL, '2269752361', NULL, NULL, 'shameema1971@gmail.com', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlRKR2EyRlhSV3BOVkVFd1RsRTlQUT09', 'Inactive', '2023-12-18 17:54:41.000000', '2023-12-18 17:54:41.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2000, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(176, 'Jamie Aktar', NULL, 'Female', 'Queens', 'Jamaica', 'New York', '11432', NULL, NULL, NULL, 'aktar.jamie@yahoo.com', NULL, 25, NULL, 62, 115, 'USA', 'None', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Edward R. Murrow', 2016, 'Health Science', 2020, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, 'Hijab, 5 prayers, non-smoker, non-drinker', NULL, 'Headscarf,', 'No', 'Sunni', NULL, NULL, 'Yes', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Masters', 'Yes', 100000, 8, 'Nazia C', 'Queens', 'Jamaica', 'New York', 'United States', NULL, 'aktar.jamie@yahoo.com', 'HHA', NULL, 'Nazia', 'Mom', '3477050054', 'Mannan', 'Dad', '9177255918', 'Ana', 'Friend', '9172661135', '9TD4WPJJ1.png', 'AWV5UFZJamie_A\'s_Resume.docx', NULL, 'NQIILQCID.png', 5, 'VlROa2RtTnRVbWxoV0VwclRWUnJOVTlEUlQwPQ==', 'Deactivated', '2024-01-01 16:25:31.000000', '2024-04-21 18:51:20.000000', '22405921', 90, '173,102,115,122,124,166,256,264,282,293,', '70,60,60,60,60,60,60,60,60,60,', '166,168,274,286,252,246,173,102', NULL, NULL, 1998, 'WRNQTDJMuna_Matrimony_Signature.png', 'A4K5IMKJ1.png,VXT1NXPJ2.png,FS22LHOj3.png,gallery4.jpg', NULL, NULL, '173,252,102,115,122,166,256,264,168,137,282,293,124,', NULL),
(179, 'Mafruha zaman', NULL, 'Female', '119-23,179 Street\n119-23,179 Street', 'jamaica', 'New York', '11434', '19175308385', NULL, NULL, 'zamanmafruha@gmail.com', NULL, 37, NULL, 63, 160, 'Bangladesh', NULL, 'Divorced', 'Yes', 2, '8', 'US Citizen', NULL, 'cantonment public school', 2005, 'Applied Mathematics, Economics', 2011, 'Special Education', 2022, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'school', 'teacher', 6500, 'Sunni', NULL, 'pray 5 times a day, fast during ramadan, wears hijab .', NULL, 'Headscarf,', 'No', 'Sunni', NULL, NULL, 'No', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,Student Visa,', NULL, 'No Preference,', 'Yes', 'Bachelor', 'Yes', 52, 10, 'Sheikh Zaman', '119-23,179 Street\n119-23,179 Street', 'Jamaica', 'New York', 'United States', '19175308385', 'zamanmafruha@gmail.com', 'Job Opportunity Specialist', NULL, 'shyeda sharmin', 'aunty', '6462892265', 'sheikh zaman', 'father', '3477530134', 'mousumi rahman', 'friend', '3474463833', 'anonymous.png', '3UQJ5YBMafruha\'s_Resume_for_Teaching_position.docx', NULL, 'KRRZCPVpic_2.jpg', 5, 'VVZkNE1WbHRhSFpqYmxKb1RWTkZQUT09', 'Inactive', '2024-01-04 16:11:31.000000', '2024-01-07 09:46:00.000000', '82659363', 87, NULL, NULL, NULL, NULL, NULL, 1987, '9GXUJC9calgary.jpg', 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(180, 'Sadia Takowa', 'Takowa', 'Female', NULL, 'Brooklyn', 'New York', NULL, '718-576-0826', NULL, NULL, 'Sadiatakowa@gmail.com', NULL, 23, NULL, 142, 85, 'Bnagladesh', 'None', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Bedford academy', NULL, 'City college of new york -Psychology Major', 2023, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Islamic school', '3rd grade teacher', 10, 'Sunni', NULL, 'Prays all 5 prayers on time and every day, actively seeking out islamic knowledge, reciting and applying the quran to daily life. Actively reciting duas and dhikr. Adhering to the 5 islamic pillars within my capability.', NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Sunni', NULL, 'Follower of the salaf, quran, sunnah. MUST be praying 5 times a day.  Adhears to the 5 pillars within capability. Consistently seeking islamic knowledge. Has good adhab, manners. Does not engage in any major sin.', 'Yes', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 30000, 4, 'M J Ahammed', NULL, NULL, 'New York', 'U.S', '718-576-0826', 'Sadiatakowa@gmail.com', 'Self Employed', NULL, 'Tabassum B', 'Close friend', '3479856291', NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', 'GJYMFOJBioData.docx', NULL, 'ONPNW8420240201_000900.jpg', 5, 'VlRKT2IySXlPWE5OYWtGNFRXbHZQUT09', 'Deactivated', '2024-01-06 12:15:48.000000', '2024-05-27 10:32:30.000000', '44154035', 95, '299,315,100,102,115,122,168,286,311,124,', '70,70,60,60,60,60,60,60,60,50,', '271,293,299,286,102,274,246', NULL, '100', 2001, 'WRDV6CQ20240114_125140.jpg', 'Y9OXDAY17168419195155654249583270331052.jpg,1NOIMAK17168419091736205691588903074210.jpg,5115C1C17168419321452691824429933045262.jpg,V2I0D4V17168419439936233781195735486145.jpg', NULL, NULL, '100,115,288,102,122,168,173,252,256,286,299,166,311,124,143,315,', NULL),
(181, 'mafruha', NULL, 'Female', NULL, NULL, 'New York', NULL, '19175308385', NULL, NULL, 'zamanmafruha@gmail.com', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZkNE1WbHRhSFpqYmxKb1RWTkZQUT09', 'Inactive', '2024-01-07 09:11:14.000000', '2024-01-07 09:11:14.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1987, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(182, 'Humaira Adiba', NULL, 'Female', NULL, NULL, 'New York', NULL, '347-7014249', NULL, NULL, 'humaira.adiba43@yahoo.com', NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVcwNWNtUlZRVEJPVkd0NQ==', 'Inactive', '2024-01-10 05:43:47.000000', '2024-01-10 05:46:15.000000', '46442688', NULL, NULL, NULL, NULL, NULL, NULL, 1995, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(183, 'Humaira Adiba', NULL, 'Female', NULL, NULL, 'New York', NULL, '347-701-4249', NULL, NULL, 'humaira.adiba43@yahoo.com', NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVcwNWNtUlZRVEJPVkd0NQ==', 'Inactive', '2024-01-10 05:45:44.000000', '2024-01-10 05:45:44.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1995, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(184, 'Mahjabeen Islam', NULL, 'Female', NULL, 'Brooklyn', 'New York', NULL, '3472727677', NULL, NULL, 'Pakter6967@gmail.com', NULL, 37, NULL, 62, 130, 'Bangladesh', 'No', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'John Dewey High School', NULL, 'Biology', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, NULL, NULL, 'Headscarf,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 80000, 5, 'Parveen Akter', NULL, NULL, NULL, NULL, '3472727677', 'Pakter6967@gmail.com', NULL, NULL, 'Mohammed Islam', 'Father', '6462395026', 'Parveen Akter', 'Mother', '3472727677', 'Hisham Islam', 'Brother', '3472727677', 'anonymous.png', NULL, NULL, NULL, 5, 'VkZkR2JXRlliM2hQVkZsM1VVRTlQUT09', 'Inactive', '2024-01-12 15:19:31.000000', '2024-01-12 15:33:56.000000', '48936901', 87, NULL, NULL, NULL, NULL, NULL, 1987, NULL, 'ZK1L70D9CDCD29F-21B7-487A-9408-E222FECF092E.jpeg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(185, 'Priom Mouri', NULL, 'Female', '95-29 115th Street', 'Queens', 'New York', '11419', '9293821209', NULL, NULL, 'pmouri@gmail.com', NULL, 25, NULL, 60, 115, 'Queens, New York, USA', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Manhattan Center for Science and Math', 2017, 'The City College of New York', 2022, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'The Smilist', 'Dental assistant', 48000, 'Sunni', NULL, 'I keep all my fasts, do my daily prayers, and go to halaqas sometimes.', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'Someone who eats halal and prays 5 times a day.', 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 100000, 3, 'Kazi Akter', '95-29 115th Street', 'Queens', 'New York', 'USA', '6466512773', 'kaziakter14@gmail.com', 'Fire Security guard at DOE', NULL, 'Tabassum Bhuiyan', 'Cousin', '3479856291', 'Sadia Takowa', 'Friend', '3472006464', NULL, NULL, NULL, 'ND44ML5inbound3087359274914680493.jpg', 'XCVLMM4Priom_Mouri_Biodata_(2).docx', NULL, 'ELTDQ9QScan0082.pdf', 5, 'VlROV2QyTnRWblJhVkVWbw==', 'Active', '2024-01-13 04:39:28.000000', '2024-05-04 14:05:24.000000', '28481473', 92, '315,115,168,271,286,290,299,311,100,102,', '60,50,50,50,50,50,50,50,40,40,', '137,286,252,271,102,173,256,115', NULL, NULL, 1999, '0782PAIScreenshot_(368).png', 'VUI4UQTinbound7174877378325281265.jpg,HPVHWZYinbound6552787734648316755.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, '115,168,252,271,286,288,100,102,122,290,299,311,315,', NULL),
(186, 'Salma Begum', NULL, 'Female', NULL, 'Brooklyn', 'New York', '11208', '9294216044', NULL, NULL, 'jahan17salma@gmail.com', NULL, 25, NULL, 63, 114, 'Bangladesh', 'alhamdulillah, no known health concerns', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, NULL, 2019, NULL, 2023, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', 'sunni, salafi', NULL, NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Sunni', NULL, NULL, 'Yes', 'No', 'Own Ethnicity', 'Bangladeshi', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'Yes', 40, 6, 'Hossain', NULL, 'Brooklyn', 'New York', 'USA', '9294216044', 'biplobala@gmail.com', 'self owned business', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JOG30I98996AB43-DD15-4670-BA9D-BF03BC35C21E.jpeg', 'M8W46W4Salma\'s_Biodata..pdf', NULL, 'DL2FCP9Scan_Jan_15,_2024.pdf', 5, 'VVZoS2VWbFhhSFJaVnpReFVVRTlQUT09', 'Deactivated', '2024-01-15 13:04:09.000000', '2024-01-18 14:04:45.000000', '74851770', 85, NULL, NULL, NULL, NULL, NULL, 2000, NULL, 'NGMAY198996AB43-DD15-4670-BA9D-BF03BC35C21E.jpeg,6FAF95F8996AB43-DD15-4670-BA9D-BF03BC35C21E.jpeg,FLPNQCW8996AB43-DD15-4670-BA9D-BF03BC35C21E.jpeg,CHOZJ358996AB43-DD15-4670-BA9D-BF03BC35C21E.jpeg', NULL, NULL, NULL, NULL),
(187, 'Faria Tasnim', NULL, 'Female', NULL, NULL, 'New Jersey', NULL, '3477014624', NULL, NULL, 'ftasnim2001@gmail.com', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8L6V1LA3E226554-A969-4FD7-A9AA-00C5DC8D1D53.jpeg', NULL, NULL, NULL, 5, 'VW01U2FHTXlOWEJpVkVsM1RVUkZQUT09', 'Inactive', '2024-01-16 18:34:01.000000', '2024-01-20 14:11:04.000000', '68745885', 14, NULL, NULL, NULL, NULL, NULL, 2001, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(188, 'Farhana', NULL, 'Female', NULL, 'Springfield', 'Virginia', NULL, '15713385433', NULL, NULL, 'farhana.azad14@gmail.com', NULL, 27, NULL, 60, 129, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, 'Gar-Field Senior High School', 2015, 'Bachelor\'s in Business Systems', 2019, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'IBM', 'Consultant', 70000, 'Sunni', NULL, 'I aim to complete all my daily prayers, read the Qur’an, and do dhikr every day. I take Islamic classes from Sun-Thurs and plan to continue the program for the next couple of years to complete their Alimiyyah program insha\'Allah. The classes range from Fiqh, Hadith, Tafseer, Arabic, etc. I fast in Ramadan, and occasionally throughout the year. I attend Islamic lectures when I can, wear hijab and abayas full time, and eat only zabihah halal meat. My family is practicing as well, alhamdulillah.', 'N/A', 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, 'I pray for a husband that has studied the deen or is currently studying, has an intention to memorize the Qur’an, commits to a sunnah beard, wears modest clothing, does not have close female friends, attends halaqat/Islamic lectures consistently, would like to travel multiple times a year, has a stable halal job with room for growth (preferably corporate), raised in the United States from their childhood, will have their own home after marriage with his wife, and has emotional intelligence.', 'Yes', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 120000, 4, 'Abul Azad', NULL, NULL, 'Virginia', 'USA', '7039819796', 'azad75@verizon.net', NULL, 'I have 2 parents, 1 younger brother, 1 younger sister, and 2 birds.', 'Aisha Shafi', 'Close Friend', '5713836550', 'Mari Baz', 'Close Friend', '5713094626', 'Rahmat Azad', 'Brother', '7038539546', 'FSU3JAUIMG_5943_2.jpg', '73700VAFA_Biodata.pdf', NULL, NULL, 5, 'VVcxR2RWb3llR2hhUjFaNllVUkZlVTE1UlQwPQ==', 'Deactivated', '2024-01-29 04:54:14.000000', '2024-03-02 12:52:37.000000', '40085933', 92, '115,299,100,102,122,138,166,168,173,252,', '70,60,50,50,50,50,50,50,50,50,', '256,264,283,173,274,115,248,137,271,246,252,299,143', NULL, NULL, 1997, 'AMXJLX5signature.png', 'VP29SUGIMG_0551.JPG,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, '115,100,102,122,138,166,168,173,252,256,299,', NULL),
(189, 'Luthfunnahar Dewan', NULL, 'Female', NULL, 'Brooklyn', 'New York', NULL, '7184130967', NULL, NULL, 'LDewan001@gmail.com', NULL, 30, NULL, 61, 135, 'Chandpur, Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Advanced Regents Diploma, Franklin D. Roosevelt HS, NY', 2012, 'BA with Honors, Psychology (Magna Cum Laude) – City College of New York', 2016, 'MSc. in Industrial Organizational Psychology – Baruch College, NY', 2019, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Federal Government', 'Legal Specialist', 1, 'Sunni', NULL, 'She adheres to the Hanafi madhab. AlHamdulillah she does her best to fulfill my faraid obligations to her Rabb Allah, who has generously given her the tawfiq to be a student of knowledge to study His Deen at Quba Institute New York in the Takween Program since September 2020.', 'NA', 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Sunni', NULL, 'We seek someone who: \n-follows the Deen of Allah wholeheartedly by obeys Allah\'s commandments and follows the sunnah of our Prophet Muhammad (s) in all aspects of daily life. \n-A practicing Sunni Muslim who adheres to any of the four madhaahib\n-Prays the five daily prayers.\n-Recites Qur’an regularly. \n-Is a student of knowledge or has a keen desire to learn more about the Deen\n-Promotes a niqab-friendly environment and maintains appropriate mahram/ghair mahram interactions.', 'Yes', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Masters', 'Yes', 80000, 4, 'Mohammad Hassan Dewan', NULL, 'Brooklyn', 'New York', NULL, '7184364283', 'fdewan@gradcenter.cuny.edu', NULL, NULL, 'Mohammad Hassan Dewan', 'Father', '16462269264', 'Dewan Hossan', 'Uncle', '13478947364', 'Nazmul Dewan', 'Brother', '7184364283', 'NU3UFIWbrigitte-tohm-0utRJ1mZoZg-unsplash.jpg', 'VQMXLIFLuthfunnahar_Dewan_Biodata.pdf', NULL, 'G3EDB58Screen_Shot_2024-02-01_at_9.54.08_PM.png', 5, 'VkVWUmVFMVVTWHBOUTBVOQ==', 'Pending', '2024-01-29 08:21:27.000000', '2024-02-01 16:37:58.000000', '36232024', 97, NULL, NULL, NULL, NULL, NULL, 1994, 'GFU3RUUScreen_Shot_2024-02-01_at_9.53.58_PM.png', 'QVO34WZScreen_Shot_2024-02-01_at_10.07.33_PM.png,LUYQSLV3ab.png,LZZGLTZ3ab.png,2WF1PHWScreen_Shot_2024-02-01_at_10.07.33_PM.png', NULL, NULL, NULL, NULL);
INSERT INTO `UserApp_femaleuser` (`userId`, `fullName`, `nickName`, `gender`, `address`, `city`, `state`, `zip`, `cellPhone`, `workPhone`, `homePhone`, `email`, `personalWebsite`, `age`, `dateOfBirth`, `height`, `weight`, `placeOfBirth`, `health`, `maritalStatus`, `children`, `childrenNumber`, `childrenAges`, `immigrationStatus`, `immigrationStatusOther`, `highSchool`, `highSchoolYear`, `bachelors`, `bachelorsYear`, `masters`, `mastersYear`, `doctorate`, `doctorateYear`, `otherDegree`, `otherDegreeYear`, `highestEducation`, `employed`, `employment`, `position`, `income`, `religiousPractice`, `religiousPracticeOther`, `religiousPracticeBrief`, `revertTime`, `wear`, `smoker`, `preReligious`, `preReligiousOther`, `preReligiousBrief`, `preBeard`, `preSmoking`, `preEthnic`, `preEthnicSpecific`, `preImmigrationStatus`, `preImmigrationStatusOther`, `preMaritalStatus`, `preChildren`, `preEducation`, `preEmployment`, `preIncome`, `preAgeGap`, `guarName`, `guarAddress`, `guarCity`, `guarState`, `guarCountry`, `guarPhone`, `guarEmail`, `guarProfession`, `familyBrief`, `refName1`, `refRelation1`, `refPhone1`, `refName2`, `refRelation2`, `refPhone2`, `refName3`, `refRelation3`, `refPhone3`, `photo`, `cv`, `album`, `govIssuedId`, `matchShowLimit`, `userPass`, `status`, `openingDate`, `lastEdit`, `userToken`, `profileCompleteness`, `matchId`, `matchPercentage`, `reqAccepted`, `reqRejected`, `reqSent`, `birthYear`, `signature`, `gallery`, `tempGallery`, `lockedId`, `cuMatchId`, `reqLock`) VALUES
(190, 'Aisha', NULL, 'Female', NULL, NULL, 'Texas', NULL, '4693282842', NULL, NULL, 'Justaishaahmed@gmail.com', NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'V1ROV01HRlhWbmRoVjFWNFRXcE5hQT09', 'Inactive', '2024-01-29 15:05:28.000000', '2024-01-29 15:06:22.000000', '22421573', NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(191, 'Farida Yeasmeen', NULL, 'Female', NULL, NULL, 'New York', NULL, '347-349-0643', NULL, NULL, 'yeasmeenf@gmail.com', NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'V1RKc1UyTXlSbWxNVjNCd1pHMTBOVTVETVRKbFYxSnJXbGhOUFE9PQ==', 'Inactive', '2024-02-02 04:58:35.000000', '2024-02-02 04:58:35.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1969, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(192, 'Farah Ahsan', NULL, 'Female', NULL, 'Dhaka, Bangladesh', 'New York', NULL, '01703632300', NULL, NULL, 'Farah.ahsan1@yahoo.com', NULL, 29, NULL, 60, 43, 'Dhaka, Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'Other', 'Canadian citizen', 'R.H. King Academy, Scarborough, Ontario, Canada', 2013, 'M.B.B.S., Shaheed Suhrawardy Medical College, Dhaka, Bangladesh', 2019, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, 'Daily prayers, fasting, charity. Likes to attend halaqas. Performed Hajj in 2019. Used to teach children how to read Arabic in a masjid during high school.', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'Daily prayers, fasting, zakat, charity.', 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,EAD,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 6, 'Ahsanul Haq', NULL, 'Dhaka', NULL, 'Bangladesh', '01741208382', 'Haq_ahsanul@hotmail.com', 'Systems Analyst (retd.), United Nations, New York, USA', 'Mother: homemaker & former school teacher\n\nYounger sister: BBA from Independent University, Bangladesh', 'Mahmud Hossain', 'Maternal uncle', '+19179757828', NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WWxkR01HTnRiSFJpTWpVMQ==', 'Inactive', '2024-02-03 08:21:52.000000', '2024-02-03 09:19:38.000000', '47571503', 85, NULL, NULL, NULL, NULL, NULL, 1995, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(193, 'Sharmin R', NULL, 'Female', NULL, 'Lansdale', 'Pennsylvania', NULL, '2674988796', NULL, NULL, 'sharminras@icloud.com', NULL, 28, NULL, 63, 86, 'NY', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'NPHS', 2014, 'Bachelor’s of Science', 2020, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', NULL, NULL, 75000, 'Sunni', NULL, 'Daily prayers, fasting, daily zhikr, attending halaqas', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'Daily prayers, fasting, attending the masjid', 'Yes', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 80000, 5, 'Harun R', NULL, NULL, NULL, NULL, '2674988235', 'harunnurr@live.com', NULL, NULL, 'Harun R', 'Dad', '2674988235', 'Ferdous', 'Mom', NULL, 'Shanta', 'Brother', NULL, 'UETJS8GIMG_2234.jpeg', 'GZAVXF3SR_Biodata.docx', NULL, 'V47FTRXIMG_2249.jpeg', 5, 'VVZkc2VtRkhSVEZOYW1jMVRtbEZQUT09', 'Deactivated', '2024-02-03 16:48:31.000000', '2024-03-15 08:22:12.000000', '63099398', 97, '115,100,102,173,252,286,299,122,138,166,', '70,60,60,60,60,60,60,50,50,50,', '252', NULL, NULL, 1996, 'DWG60DAIMG_2138.jpeg', 'E6OKLTVIMG_1819.jpeg,1XD45WKF65CFB0B-37DA-4CFA-B8D2-8F7AF9C6114B.jpeg,MV732TUIMG_2133.jpeg,ZUIVOGKIMG_2142.jpeg', NULL, NULL, '115,100,102,173,252,286,299,122,138,166,', NULL),
(194, 'Nafiza Tarannum', NULL, 'Female', NULL, NULL, 'New York', NULL, '7184158825', NULL, NULL, 'ntarannum5399@gmail.com', NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VmtkR2IyTXliSFZOVkVsNlRrTkZQUT09', 'Inactive', '2024-02-12 18:18:58.000000', '2024-02-12 18:18:58.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2000, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(195, 'Maria Nur', NULL, 'Female', NULL, NULL, 'Kentucky', NULL, '8594135434', NULL, NULL, 'maria.nur.71.du.ac.bd@gmail.com', NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVVaa2RtTkVaM2hpVlRBOQ==', 'Inactive', '2024-02-13 21:06:48.000000', '2024-02-13 21:06:48.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1996, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(196, 'Maria Nur', NULL, 'Female', NULL, 'Lexington', 'Kentucky', NULL, '8594135434', NULL, NULL, 'mnu231@uky.edu', NULL, 28, NULL, 59, 99, 'Dhaka', NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Dhaka', 2011, 'Zoology', 2018, 'Zoology', 2019, 'Cancer Biology', 2021, NULL, NULL, 'Masters', 'No', NULL, NULL, 1, 'Sunni', NULL, NULL, NULL, 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, NULL, 'Yes', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,', NULL, 'Single,Divorced,Widowed,', 'No', 'Masters', 'No Preference', 1, 10, 'Hafizur Rahman', NULL, NULL, NULL, NULL, '(859) 368-3591', 'dinarbgc@gmail.com', 'Business', NULL, 'Saima Rahman', 'Sister', '(859) 787-4539', 'Saleh Faisal', 'Brother', '(575) 418-0133', 'Omee', 'Sister', '(812) 318-2510', 'NY2F5UJIMG_0949.png', 'K4MP5LSmaria.nur2023-1.pdf', NULL, '3XMOWF4IMG_0931.jpeg', 5, 'VVVaT2RtTkVaM2hpVlRBOQ==', 'Active', '2024-02-13 21:17:46.000000', '2024-04-07 16:29:45.000000', '82335016', 97, '102,122,124,166,173,232,256,264,282,293,', '60,60,60,60,60,60,60,60,60,60,', '102,173,115,122,124', NULL, NULL, 1996, '8IZJ6HIIMG_0930.jpeg', 'NHQ4CDDIMG_0949.png,19UV2QHIMG_0087.jpeg,LOWADEMIMG_1814.jpeg,H4EENQX63df84d4-e7a3-46c5-8fce-16bcdc8ceb48.jpeg', NULL, NULL, '102,122,124,166,173,232,248,252,256,264,282,293,', NULL),
(197, 'Anissa', NULL, 'Female', NULL, 'Gatineau', 'Pennsylvania', NULL, '8736601302', NULL, NULL, 'Linda52580@yahoo.com', NULL, 18, NULL, 61, 110, 'Ontario Canada', NULL, 'Single', NULL, NULL, NULL, 'Other', 'Canadian citizen', NULL, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', NULL, NULL, 1, 'Sunni', NULL, 'Follow obligatory practices', NULL, 'Headscarf,', 'No', NULL, NULL, NULL, 'No Preference', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'Yes', 60000, 8, 'Linda Brunet', '28 Deschenes', 'Gatineau', 'Pennsylvania', 'Canada', '8736601302', 'Linda52580@yahoo.com', 'Upper Management in Parliament', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoV2VtRXlPWEpaVkdNelRubEZQUT09', 'Inactive', '2024-02-21 15:42:21.000000', '2024-02-21 15:55:23.000000', '22803931', 70, NULL, NULL, NULL, NULL, NULL, 2006, NULL, 'RZW9WWRIMG_0626.jpeg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(198, 'Anissa Rahman', NULL, 'Female', NULL, NULL, 'Pennsylvania', NULL, '8736601302', NULL, NULL, 'Linda52580@yahoo.com', NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoV2VtRXlPWEpaVkdNelRubEZQUT09', 'Inactive', '2024-02-21 15:46:33.000000', '2024-02-21 15:46:33.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2006, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(199, 'SAFA kazi', NULL, 'Female', NULL, 'Montgomery', 'Alabama', '36130', '3345618772', NULL, NULL, 'mohiuddinkazi@gmail.com', NULL, 28, NULL, 64, 100, 'Alabama, USa', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Loveless academic magnet program (LAMP)', 2014, 'Auburn University Montgomery, Montgomey AL', 2018, 'Auburn University, Auburn, AL', 2019, NULL, NULL, 'MD', 2023, 'Other', 'No', NULL, NULL, 1, 'Sunni', NULL, NULL, NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'Practicing', 'No', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Doctorate', 'No Preference', 1, 5, 'Mohiuddin Kazi', NULL, 'Montgomery', 'Alabama', 'United States', '3345618772', 'mohiuddinkazi@gmail.com', 'Manager Database Administrator', NULL, 'Professor Nuzrul Islam', 'Friend of the family', '17144610456', NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkVoV2FtRXpiRUZSUkZVMFRXcFZOUT09', 'Inactive', '2024-02-25 06:49:47.000000', '2024-02-25 07:06:06.000000', '73770273', 85, NULL, NULL, NULL, NULL, NULL, 1996, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(200, 'Maliha', NULL, 'Female', NULL, NULL, 'New Jersey', NULL, '8622875391', NULL, NULL, 'myeas614@gmail.com', NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VTBoU2RHSklUakJaTTA1dlpFUkZlVTlXT1hoa1NGRTk=', 'Inactive', '2024-03-07 04:13:51.000000', '2024-03-07 04:13:51.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2000, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(201, 'Qulsuma Baig', NULL, 'Female', NULL, 'Jamaica', 'New York', '11433', '9293512020', NULL, NULL, 'Qulsumabegum@gmail.com', NULL, 28, NULL, 160, 120, 'Bangladesh', 'None', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Hillcrest high school', 2016, 'Hunter college', 2021, 'NA', NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, NULL, NULL, 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'Yes', 70000, 7, 'Rabia begum', NULL, NULL, 'New York', NULL, '6468877955', 'Qulsuma2013@gmail.com', NULL, NULL, 'Shaila baig', 'Sister', '6468877955', NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, 'UQMNM2HIMG_1106.jpeg', 5, 'VlZSRmVVMVVSVFZQVkZreVdXYzlQUT09', 'Active', '2024-03-11 14:26:04.000000', '2024-04-17 11:11:36.000000', '63870468', 95, '102,115,143,173,274,283,290,311,315,100,', '50,50,50,50,50,50,50,50,50,40,', '115,311,124', NULL, NULL, 1996, '98EOWU2IMG_1410.jpeg', 'N1063HWIMG_0987.jpeg,2079636IMG_6230.jpeg,2G3PHK6IMG_4405.jpeg,9Y4S1LZIMG_7551.jpeg', NULL, NULL, '115,286,100,102,173,252,271,274,290,299,311,283,122,124,143,315,', NULL),
(202, 'Yasmin', NULL, 'Female', NULL, NULL, 'Michigan', NULL, '3474762261', NULL, NULL, 'zara_yas89@hotmail.com', NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VjIxR2IyTnRSWFJOVkdzMFQxRTlQUT09', 'Inactive', '2024-03-16 18:15:57.000000', '2024-03-16 18:15:57.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1995, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(203, 'Farida Yasmin', NULL, 'Female', 'UC DAVIS', 'Davis', 'California', '95616', NULL, NULL, NULL, 'kamrul010786@gmail.com', NULL, 33, NULL, 5, 120, 'Dhaka', 'No', 'Single', NULL, NULL, NULL, 'Student Visa', NULL, 'Viqarunnisa', 2008, 'Biochemistry and Molecular Biology,', 2013, 'Biochemistry and Molecular Biology,', 2015, 'Biology,', 2023, 'Postdoctoral Scholar in Plant Biology,', 2024, 'Doctorate', 'Yes', 'University of California,', 'Postdoctoral Scholar', NULL, 'Sunni', NULL, NULL, NULL, 'None,', 'No', NULL, NULL, NULL, 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Doctorate', 'Yes', NULL, 5, 'Kamrul Islam', 'Rampura', 'Dhaka', NULL, 'Bangladesh', NULL, 'kamrul010786@gmail.com', 'Service holder in private company.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K1V6LRWIMG_1893.jpg', 'OWV83V4Farida_Yasmin_Biodata[1].docx', NULL, NULL, 5, 'VXpKc2VtSkhSblJOYWtGNFRsRTlQUT09', 'Inactive', '2024-03-18 18:34:00.000000', '2024-03-18 18:57:45.000000', '40196330', 70, NULL, NULL, NULL, NULL, NULL, 1991, NULL, '6INK8HDIMG_1893.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(204, 'Ratila Farah', NULL, 'Female', '4091 Weymouth Ln', 'Sacramento', 'California', '95823', '669-278-0106', NULL, '4088292977', 'mris1963@gmail.com', NULL, 31, NULL, 61, 105, 'Dhaka, Bangladesh', 'Good', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Milestone college, Uttara, Dhaka', 2010, 'BSC Information Science', 2022, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Swing Education', 'Substitute Teacher', 50000, 'Sunni', NULL, NULL, NULL, 'None,', 'No', 'Sunni', NULL, 'Have faith but may or may not be practicing', 'No Preference', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'No Preference,', 'No', 'Masters', 'No Preference', 1, 5, 'Mohammed Rafiqul Islam', '4091 Weymouth Ln', 'Sacramento', 'California', 'USA', '4088292977', 'mris1963@gmail.com', 'Retired Professor Govt. College', 'Currently we are living USA but our base in Bangladesh is both in Dhaka and Patuakhali at village.', 'Taijuddin Ahmed', 'Khalu', '669-215-3314', 'Gulam Mostafa', 'Former neighbor', '4086792024', 'Md Khaled', 'Mama', '6692258126', 'D3A5UIJScreenshot_20240406-141540_Gallery.jpg', 'W04Y40NChecklist-Word-2018_(2).docx', NULL, NULL, 5, 'VlcxR2FXSnRSbWxaVjFKQlRucEJQUT09', 'Active', '2024-03-22 17:44:49.000000', '2024-04-29 11:30:55.000000', '82531623', 97, '102,124,143,173,246,256,264,274,282,283,', '50,50,50,50,50,50,50,50,50,50,', '246', NULL, '102', 1993, 'F6VK9FB20240411_161257.heic', '0UYFTZZScreenshot_20240406-141948_Gallery.jpg,ZQEU01PScreenshot_20240406-142651_Gallery.jpg,DYBLUOGScreenshot_20240406-141626_Gallery.jpg,56612YGScreenshot_20240406-142533_Gallery.jpg', NULL, NULL, '102,124,143,173,246,252,256,264,274,282,283,', NULL),
(205, 'Faiza', NULL, 'Female', NULL, NULL, 'New York', NULL, '6469442669', NULL, NULL, 'saimaalam021@gmail.com', NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkRKMGRtRXlPWEpOVkVsNlNrRTlQUT09', 'Inactive', '2024-04-05 01:41:01.000000', '2024-04-05 01:48:15.000000', '87562345', NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(206, 'Faiza', NULL, 'Female', NULL, NULL, 'New York', NULL, '6469442669', NULL, NULL, 'saimaalam021@gmail.com', NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkRKMGRtRXlPWEpOVkVsNlNrRTlQUT09', 'Inactive', '2024-04-05 01:44:06.000000', '2024-04-05 01:44:06.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1998, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(207, 'Farhana Zaman', 'Trisha', 'Female', '1037 Quincy Avenue', 'The Bronx', 'New York', '10465', '9176789550', NULL, NULL, 'farhana.kamruzzaman@gmail.com', NULL, 30, NULL, 60, 110, 'Bangladesh', 'Hypothyroidism', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'High School for Math Science and Engineering', 2012, 'Stony Brook University', 2016, NULL, 2024, 'Medicine', 2021, NULL, NULL, 'Doctorate', 'Yes', 'Hoboken University Medical Center', 'Resident', 70000, 'Sunni', NULL, 'Daily prayers, fasting, enjoy going to masjid for prayers, trying to attend halaqas and seminars', '2021', 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 120000, 7, 'Shahanara Zaman', '1037 Quincy Avenue', 'The Bronx', 'New York', 'United States', '9176789550', 'trishazaman35@gmail.com', 'Telemetry Technician', 'I live with my parents and have one younger sister. My immediate family consists of my fathers two sisters and my mother\'s brother.', 'Mahmuda Hamid', 'Cousin', '9173260225', 'Shakila Hoque', 'Cousin', '9293192826', 'Shahnaj Begum', 'Coworker', '5866365911', 'TT0RHOFImage_3_resized.jpg', 'TA75J9EFarhana_zaman_Bio_Data_V4.pdf', NULL, '6Y4KOPXGovernment_ID.jpg', 5, 'VW0xR2VXRkhSWGhOYWtrd1RVUnNRUT09', 'Active', '2024-04-08 12:51:30.000000', '2024-05-08 22:35:30.000000', '32109375', 97, '115,311,271,274,283,290,299,315,100,101,', '60,60,50,50,50,50,50,50,40,40,', NULL, NULL, NULL, 1994, 'L68Z3BCsignature.png', 'PYCUPZFImage_3_resized.jpg,7OOG3MZIMG_0079.JPG,EJ166OMIMG_0613.JPG,V7CJ8KQimage_2.jpg', NULL, NULL, '115,311,271,274,283,290,299,100,101,102,315,', NULL),
(208, 'Mahmuda Hamid', 'Rikta', 'Female', '113 Chester Ave', 'Brooklyn', 'New York', '11218', '9173260225', NULL, NULL, 'mhamid1234@gmail.com', NULL, 32, NULL, 62, 210, 'Bangladesh', NULL, 'Divorced', 'No', NULL, NULL, 'US Citizen', NULL, 'Edward R. Murrow', 2010, 'Baruch College', 2014, 'Hospitality and Tourism Management', 2016, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, 'Senior Test Engineer', 115000, 'Sunni', NULL, 'I pray the 5 daily prayers + extra sunna/nafil; try to fast every Monday and Thursday, attend islamic lectures', NULL, 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, 'They should be very religious (do more than the obligatory acts) and continue to always learn the Quran', 'Yes', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'No Preference,', 'No', 'No Preference', 'Yes', 100000, 10, 'Abdul Hamid', '113 Chester Ave', 'Brooklyn', 'New York', 'United States', '9173276388', 'mhamid1234@gmail.com', 'Business Owner', NULL, 'Farhana Zaman', 'Cousin', '917-678-9550', 'Shakila Hoque', 'Cousin', '929-319-2826', NULL, NULL, NULL, 'anonymous.png', 'I9U8R4UMahmuda_Hamid_CV.docx', NULL, 'K32Z4J0Mahmuda_Hamid_Drivers_License.jpg', 5, 'VVcwNWVtRkhSbkpoVkVVd1NWRTlQUT09', 'Active', '2024-04-09 09:46:47.000000', '2024-04-14 14:09:36.000000', '33943189', 97, '115,173,290,311,315,102,122,124,166,168,', '60,60,60,60,60,50,50,50,50,50,', NULL, NULL, NULL, 1992, 'JI2B4CYsignature.png', 'U8B0VXFpic_3.jpg,0XN14J3pic_2.jpg,0SKELQQpic_1.jpg,TXE4LXAprofile_pic.jpg', NULL, NULL, '115,173,252,290,311,102,122,124,166,168,232,315,', NULL),
(209, 'Zarin Rahman', NULL, 'Female', '75 Francis St', 'Boston', 'Massachusetts', '02115', '6056105155', NULL, NULL, 'zarinibnatrahman@gmail.com', NULL, 28, NULL, 64, 120, NULL, NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Brookings High School', 2014, 'Harvard University', 2018, NULL, NULL, 'Medicine, University of Minnesota', 2023, NULL, NULL, 'Doctorate', 'Yes', 'Brigham and Women\'s Hospital', 'Resident Physician', 80000, 'Sunni', NULL, NULL, NULL, 'Headscarf,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'Doctorate', 'Yes', 80000, 5, 'Shafiqur Rahman', NULL, NULL, NULL, NULL, '605-695-3216', 'msrahman@yahoo.com', 'Professor, South Dakota State University', 'Father', 'Shafiqur Rahman', 'Father', '6056953216', 'Moursheda Rahman', 'Mother', '6056953162', NULL, NULL, NULL, 'anonymous.png', '5LPLZUUZarinIRahman_CV_May2023_Serif.pdf', NULL, 'F4FXUI7Screen_Shot_2023-06-21_at_6.27.26_PM.png', 5, 'VTFkS2RWbFlVa0ZOVkdzMVRtYzlQUT09', 'Active', '2024-04-14 16:22:34.000000', '2024-04-14 16:58:48.000000', '31892545', 95, '274,290,102,115,143,173,311,315,100,122,', '60,60,50,50,50,50,50,50,40,40,', NULL, NULL, NULL, 1996, 'DN57RYFScreen_Shot_2023-06-21_at_6.27.26_PM.png', 'ZWT18J3Screen_Shot_2024-04-14_at_10.37.50_PM.png,XK1DZELScreen_Shot_2024-04-14_at_10.34.39_PM.png,I13CZ25Screen_Shot_2024-04-14_at_10.38.38_PM.png,P9NCF4DScreen_Shot_2024-04-14_at_10.37.08_PM.png', NULL, NULL, '274,290,102,115,173,311,100,122,124,143,315,', NULL),
(213, 'SHARMINA KHAN', NULL, 'Female', NULL, 'New York', 'New York', NULL, '3474696290', NULL, NULL, 'yusuf.uvm@gmail.com', NULL, 30, NULL, 63, 100, 'New York', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Thomas Edison HS', 2012, 'Biomedical Engineering', 2017, 'Biotechnology', 2020, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, 'Project Manager', 110000, 'Sunni', NULL, NULL, NULL, 'Headscarf,', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 100000, 5, 'Mohammed Khan', '6220 Burchell rd', 'Aeverne', 'New York', NULL, '3474696290', 'Khan739@yahoo.com', 'Engineer', NULL, 'Mohammed Khan', 'Father', '3474696290', 'Mohammed  Yusuf Ali', 'Uncle', '8029997186', 'Abdullah Arif Kahn', 'brother', NULL, 'anonymous.png', 'AWOSLBSBio-Sharmina_Khan.pdf', NULL, 'Q7UR2KIimage.jpg', 5, 'VkZkR2NHSklhelZPUVQwOQ==', 'Active', '2024-04-24 06:52:33.000000', '2024-05-22 09:24:47.000000', '44119579', 95, NULL, NULL, NULL, NULL, NULL, 1994, 'PXJAWKPSignature_Sharmina.jpg', 'XQT7AMJIMG_9970.jpeg,IC0ZTV6IMG_9967.jpeg,O2DC9BMIMG_9969.jpeg,DQ4L69BIMG_9968.jpeg', NULL, NULL, NULL, NULL),
(215, 'Sultana Prama', NULL, 'Female', NULL, 'Waterford', 'Connecticut', '06385', '8605147903', NULL, NULL, 'pariya.prama@gmail.com', NULL, 26, NULL, 59, 115, 'Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Science and Technology Magnet high school', 2017, 'Connecticut College', 2021, 'Yale University- Acute Care Nurse Practitioner', 2024, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, 'Pacticing Muslimah who prays all daily prayers, recites Quran, and strives to fulfill all obligations of Islam', NULL, 'Headscarf,', 'No', 'Sunni', NULL, 'Practicing Muslim who prays daily prayers,  has basic knowledge of Islam, strives to follow the Sunnah and the Quran', 'No Preference', 'No', 'Specific Ethnicity', 'Bangladeshi', 'No Preference,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 6, 'Mohammed Taher', NULL, NULL, NULL, NULL, '8605144244', 'mohammedtaher95@yahoo.com', NULL, NULL, 'Sima Nasrin', 'Sister', '8563085653', 'Mohammed Taher', 'Father', '8605144244', 'Nafij Aktar', 'Sister', '9293314716', 'EUC8Z911000001211.jpg', NULL, NULL, 'AYNPCRKID_upon_request.pdf', 5, 'VFZSSk1FNVVaRkZqTTBGbw==', 'Active', '2024-05-15 12:25:08.000000', '2024-05-22 14:59:29.000000', '53725718', 95, NULL, NULL, '173,102,315', NULL, NULL, 1998, '4R8SL651000005575.jpg', '8TUGHRE1000001123.jpg,DWA7Y321000002320.jpg,ZZMYDVV1000001211.jpg,3C0FVQW1000005364.jpg', NULL, NULL, NULL, NULL),
(217, 'Tahamin Salam', NULL, 'Female', NULL, NULL, 'Michigan', NULL, '3137071167', NULL, NULL, 'ssalam2010@gmail.com', NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'V1RKb2NFNTZaR2hQVnpsMVQxWk9UbFV3VFhsTlJFVjRTVkU5UFE9PQ==', 'Inactive', '2024-05-25 18:59:13.000000', '2024-05-25 18:59:53.000000', '67023272', NULL, NULL, NULL, NULL, NULL, NULL, 2000, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(218, 'Sharmin Salam', NULL, 'Female', NULL, NULL, 'Michigan', NULL, '3137071167', NULL, NULL, 'ssalam2010@gmail.com', NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WVRKR2NscHRWblJNVjNBMVlXMTBkbVZwTVZsa1YzQXlaVlJyUFE9PQ==', 'Inactive', '2024-05-26 15:05:46.000000', '2024-05-26 15:05:46.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1988, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(219, 'Sharmin Salam', NULL, 'Female', NULL, 'Hamtramck', 'Michigan', NULL, '3137071167', NULL, NULL, 'SharminS2011@gmail.com', NULL, 36, NULL, 5, 136, 'Bangladesh', NULL, 'Divorced', 'Yes', 1, '4', 'US Citizen', NULL, NULL, 2006, NULL, 2011, NULL, 2019, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, 'Practicing Muslim, attend jummah, tarabi and sister eventz', NULL, 'Headscarf,Jelbab/Abaya,', 'No', 'Sunni', NULL, 'Practicing, attend jummah, go to tarabi and involved in the muslim community', 'No Preference', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'No Preference,', 'Yes', 'Masters', 'Yes', 150000, 10, 'Bilkis Salam', NULL, NULL, NULL, NULL, '313 327 6934', 'ssalam2010@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WTBkc1UyTXlPWGhNVjNSMllUSXhNV05UTUhoWk1sWjRaVWRGUFE9PQ==', 'Inactive', '2024-05-26 15:07:46.000000', '2024-05-27 18:00:13.000000', '71837146', 73, NULL, NULL, NULL, NULL, NULL, 1988, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `UserApp_maleuser`
--

CREATE TABLE `UserApp_maleuser` (
  `userId` int(11) NOT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `nickName` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `cellPhone` varchar(100) DEFAULT NULL,
  `workPhone` varchar(100) DEFAULT NULL,
  `homePhone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `personalWebsite` varchar(200) DEFAULT NULL,
  `birthYear` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `placeOfBirth` varchar(100) DEFAULT NULL,
  `health` varchar(500) DEFAULT NULL,
  `maritalStatus` varchar(100) DEFAULT NULL,
  `children` varchar(100) DEFAULT NULL,
  `childrenNumber` int(11) DEFAULT NULL,
  `childrenAges` varchar(100) DEFAULT NULL,
  `immigrationStatus` varchar(100) DEFAULT NULL,
  `immigrationStatusOther` varchar(100) DEFAULT NULL,
  `highSchool` varchar(100) DEFAULT NULL,
  `highSchoolYear` int(11) DEFAULT NULL,
  `bachelors` varchar(100) DEFAULT NULL,
  `bachelorsYear` int(11) DEFAULT NULL,
  `masters` varchar(100) DEFAULT NULL,
  `mastersYear` int(11) DEFAULT NULL,
  `doctorate` varchar(100) DEFAULT NULL,
  `doctorateYear` int(11) DEFAULT NULL,
  `otherDegree` varchar(200) DEFAULT NULL,
  `otherDegreeYear` int(11) DEFAULT NULL,
  `highestEducation` varchar(100) DEFAULT NULL,
  `employed` varchar(100) DEFAULT NULL,
  `employment` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `income` int(11) DEFAULT NULL,
  `religiousPractice` varchar(100) DEFAULT NULL,
  `religiousPracticeOther` varchar(100) DEFAULT NULL,
  `religiousPracticeBrief` varchar(500) DEFAULT NULL,
  `revertTime` varchar(100) DEFAULT NULL,
  `beard` varchar(100) DEFAULT NULL,
  `smoker` varchar(100) DEFAULT NULL,
  `preReligious` varchar(100) DEFAULT NULL,
  `preReligiousOther` varchar(100) DEFAULT NULL,
  `preReligiousBrief` varchar(500) DEFAULT NULL,
  `preWear` varchar(100) DEFAULT NULL,
  `preSmoking` varchar(100) DEFAULT NULL,
  `preEthnic` varchar(100) DEFAULT NULL,
  `preEthnicSpecific` varchar(500) DEFAULT NULL,
  `preImmigrationStatus` varchar(100) DEFAULT NULL,
  `preImmigrationStatusOther` varchar(100) DEFAULT NULL,
  `preMaritalStatus` varchar(100) DEFAULT NULL,
  `preChildren` varchar(100) DEFAULT NULL,
  `preEducation` varchar(100) DEFAULT NULL,
  `preEmployment` varchar(100) DEFAULT NULL,
  `preIncome` int(11) DEFAULT NULL,
  `preAgeGap` int(11) DEFAULT NULL,
  `guarName` varchar(100) DEFAULT NULL,
  `guarAddress` varchar(500) DEFAULT NULL,
  `guarCity` varchar(100) DEFAULT NULL,
  `guarState` varchar(100) DEFAULT NULL,
  `guarCountry` varchar(100) DEFAULT NULL,
  `guarPhone` varchar(100) DEFAULT NULL,
  `guarEmail` varchar(100) DEFAULT NULL,
  `guarProfession` varchar(100) DEFAULT NULL,
  `familyBrief` varchar(500) DEFAULT NULL,
  `refName1` varchar(100) DEFAULT NULL,
  `refRelation1` varchar(100) DEFAULT NULL,
  `refPhone1` varchar(100) DEFAULT NULL,
  `refName2` varchar(100) DEFAULT NULL,
  `refRelation2` varchar(100) DEFAULT NULL,
  `refPhone2` varchar(100) DEFAULT NULL,
  `refName3` varchar(100) DEFAULT NULL,
  `refRelation3` varchar(100) DEFAULT NULL,
  `refPhone3` varchar(100) DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `cv` varchar(500) DEFAULT NULL,
  `album` varchar(500) DEFAULT NULL,
  `govIssuedId` varchar(500) DEFAULT NULL,
  `matchShowLimit` int(11) DEFAULT NULL,
  `userPass` varchar(200) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `profileCompleteness` int(11) DEFAULT NULL,
  `openingDate` datetime(6) DEFAULT NULL,
  `lastEdit` datetime(6) DEFAULT NULL,
  `userToken` varchar(100) DEFAULT NULL,
  `matchId` varchar(100) DEFAULT NULL,
  `matchPercentage` varchar(100) DEFAULT NULL,
  `reqAccepted` varchar(100) DEFAULT NULL,
  `reqRejected` varchar(100) DEFAULT NULL,
  `reqSent` varchar(100) DEFAULT NULL,
  `signature` varchar(500) DEFAULT NULL,
  `gallery` varchar(2000) DEFAULT NULL,
  `tempGallery` varchar(2000) DEFAULT NULL,
  `lockedId` int(11) DEFAULT NULL,
  `cuMatchId` varchar(1000) DEFAULT NULL,
  `reqLock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserApp_maleuser`
--

INSERT INTO `UserApp_maleuser` (`userId`, `fullName`, `nickName`, `gender`, `address`, `city`, `state`, `zip`, `cellPhone`, `workPhone`, `homePhone`, `email`, `personalWebsite`, `birthYear`, `age`, `dateOfBirth`, `height`, `weight`, `placeOfBirth`, `health`, `maritalStatus`, `children`, `childrenNumber`, `childrenAges`, `immigrationStatus`, `immigrationStatusOther`, `highSchool`, `highSchoolYear`, `bachelors`, `bachelorsYear`, `masters`, `mastersYear`, `doctorate`, `doctorateYear`, `otherDegree`, `otherDegreeYear`, `highestEducation`, `employed`, `employment`, `position`, `income`, `religiousPractice`, `religiousPracticeOther`, `religiousPracticeBrief`, `revertTime`, `beard`, `smoker`, `preReligious`, `preReligiousOther`, `preReligiousBrief`, `preWear`, `preSmoking`, `preEthnic`, `preEthnicSpecific`, `preImmigrationStatus`, `preImmigrationStatusOther`, `preMaritalStatus`, `preChildren`, `preEducation`, `preEmployment`, `preIncome`, `preAgeGap`, `guarName`, `guarAddress`, `guarCity`, `guarState`, `guarCountry`, `guarPhone`, `guarEmail`, `guarProfession`, `familyBrief`, `refName1`, `refRelation1`, `refPhone1`, `refName2`, `refRelation2`, `refPhone2`, `refName3`, `refRelation3`, `refPhone3`, `photo`, `cv`, `album`, `govIssuedId`, `matchShowLimit`, `userPass`, `status`, `profileCompleteness`, `openingDate`, `lastEdit`, `userToken`, `matchId`, `matchPercentage`, `reqAccepted`, `reqRejected`, `reqSent`, `signature`, `gallery`, `tempGallery`, `lockedId`, `cuMatchId`, `reqLock`) VALUES
(61, 'Candidate 2', NULL, 'Male', 'Address 2', 'Brooklyn', 'NY', '101101.0', '000-000-0001', NULL, NULL, 'test2@gmail.com', NULL, 1991, 28, NULL, 67, 160, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, NULL, 'Other', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf', 'No', NULL, 'No Preference', 'US Citizen', NULL, 'Single', 'No', 'Bachelor', 'No', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'angular2-logo_FgiPwF5.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', 86, NULL, '2022-08-15 18:00:49.000000', '79200886', '28,27,25,26,30,32,', '80,70,60,60,50,0,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(62, 'Candidate 5', NULL, 'Male', 'Address 5', 'Princeton', 'NY', '101101.0', '000-000-0004', NULL, NULL, 'test5@gmail.com', NULL, 1992, 27, NULL, 65, 150, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', NULL, 'No Preference', 'US Citizen,H1B', NULL, 'Single', 'No', 'Bachelor', 'No Preference', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Capture2.PNG', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', 86, NULL, '2024-05-26 02:09:29.000000', '39188630', '27,28,26,30,25,32,', '60,60,50,50,40,0,', '26,31', NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(63, 'Candidate 6', NULL, 'Male', 'Address 6', 'Houston', 'NY', '101101.0', '000-000-0005', NULL, NULL, 'test6@gmail.com', NULL, 1987, 32, NULL, 66, 155, NULL, NULL, 'Single', 'No', NULL, NULL, 'Student Visa(OPT)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', NULL, 'No Preference', 'No Preference', NULL, 'Single', 'No', 'Masters', 'No', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 8, 'VFZSSmVrNUJQVDA9', 'Inactive', 83, NULL, '2022-04-22 17:44:57.000000', '21217199', '28,26,27,30,25,32,', '60,50,50,50,40,0,', '31,27', NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(64, 'Candidate 7', NULL, 'Male', 'Address 7', 'Ozone Park', 'NY', '101101.0', '000-000-0006', NULL, NULL, 'test7@gmail.com', NULL, 1989, 33, NULL, 61, 180, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, 100000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, NULL, 'No', NULL, 'Bangladeshi', 'No Preference', NULL, 'Single', 'No', 'Bachelor', 'Yes', NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', 80, NULL, '2022-04-22 17:45:14.000000', '25609040', '27,26,28,31,25,29,32,', '70,60,60,60,50,40,0,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(65, 'Candidate 8', NULL, 'Male', 'Address 8', 'Warren', 'NY', '101101.0', '000-000-0007', NULL, NULL, 'test8@gmail.com', NULL, 1982, 37, NULL, 69, 170, NULL, NULL, 'Divorced', 'Yes', NULL, NULL, 'Parmanent Resident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, 150000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Jelbab/Abaya', 'No', NULL, 'Bangladeshi', 'No Preference', NULL, 'No Preference', NULL, 'Masters', 'Yes', 100000, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, '12835553', '27,30,26,25,28,32,', '40,40,30,20,20,0,', '26,30,31,31,31', NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(66, 'Candidate 9', NULL, 'Male', 'Address 9', 'Staten Islan', 'NY', '101101.0', '000-000-0008', NULL, NULL, 'test9@gmail.com', NULL, 1985, 33, NULL, 66, 150, NULL, NULL, 'Divorced', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', NULL, NULL, 150000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya', 'No Preference', NULL, 'American', 'US Citizen,Parmanent Resident', NULL, 'No Preference', 'Yes', 'Bachelor', 'No', NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '28,27,26,30,25,32,', '40,30,20,20,10,0,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(67, 'Candidate 10', NULL, 'Male', 'Address 10', 'Dallas', 'NY', '101101.0', '000-000-0009', NULL, NULL, 'test10@gmail.com', NULL, 1984, 34, NULL, 67, 143, NULL, NULL, 'Single', 'No', NULL, NULL, 'H1B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'Headscarf', NULL, NULL, 'Bengali', 'US Citizen,Parmanent Resident', NULL, 'Single', NULL, 'Bachelor', 'No Preference', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '25,27,28,26,30,32,', '30,30,30,20,20,0,', '31', NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(68, 'Candidate 12', NULL, 'Male', 'Address 12', 'Hardson', 'NY', '101101.0', '000-000-0011', NULL, NULL, 'test12@gmail.com', NULL, 1970, 42, NULL, 71, 170, NULL, NULL, 'Divorced', 'No', NULL, NULL, 'EAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', NULL, NULL, 50000, 'Sunni', NULL, NULL, NULL, 'No', 'Yes', 'Sunni', NULL, NULL, 'No Preference', NULL, NULL, NULL, 'No Preference', NULL, 'Divorced,Widowed', 'No', 'No Preference', 'No Preference', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(69, 'Candidate 13', NULL, 'Male', 'Address 13', 'Jersy City', 'NY', '101101.0', '000-000-0012', NULL, NULL, 'test13@gmail.com', NULL, 1986, 32, NULL, 60, 160, NULL, NULL, 'Single', 'No', NULL, NULL, 'Parmanent Resident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, 120000, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No preference', NULL, 'No Preference', 'No Preference', NULL, 'Single', 'No', 'Bachelor', 'No', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '28,27,29,26,31,25,', '60,50,50,40,40,30,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(70, 'Candidate 14', NULL, 'Male', 'Address 14', 'Fairlawn', 'NY', '101101.0', '000-000-0013', NULL, NULL, 'test14@gmail.com', NULL, 1992, 25, NULL, 68, 155, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Doctorate', 'Yes', NULL, NULL, NULL, 'Other', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', NULL, 'No Preference', NULL, NULL, 'Single', 'No', 'Doctorate', 'No', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '26,28,25,27,30,32,', '60,60,50,50,50,0,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(71, 'Candidate 15', NULL, 'Male', 'Address 15', 'Harloysville', 'NY', '101101.0', '000-000-0014', NULL, NULL, 'test15@gmail.com', NULL, 1972, 47, NULL, 68, 155, NULL, NULL, 'Divorced', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', NULL, 'No Preference', 'No Preference', NULL, 'Single', 'No', 'Bachelor', 'No Preference', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '27,28,26,30,25,32,', '50,50,40,40,30,0,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(72, 'Candidate 17', NULL, 'Male', 'Address 17', 'Gibbsboro', 'NY', '101101.0', '000-000-0016', NULL, NULL, 'test17@gmail.com', NULL, 1994, 24, NULL, 66, 150, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf', 'No', NULL, 'Bengali', 'Other', NULL, 'Single', 'No', 'Bachelor', 'Yes', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '27,30,25,26,28,32,', '60,60,50,50,50,0,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(73, 'Candidate 19', NULL, 'Male', 'Address 19', 'Beaumont', 'NY', '101101.0', '000-000-0018', NULL, NULL, 'test19@gmail.com', NULL, 1982, 36, NULL, 67, 180, NULL, NULL, 'Single', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', NULL, NULL, NULL, 'Other', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '28,27,25,26,30,32,', '20,10,0,0,0,0,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(74, 'Candidate 20', NULL, 'Male', 'Address 20', 'Ozone Park', 'NY', '101101.0', '000-000-0019', NULL, NULL, 'test20@gmail.com', NULL, 1982, 30, NULL, 67, 170, NULL, NULL, 'Single', 'No', NULL, NULL, 'F-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, 60000, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'Niqab,Headscarf', 'No', NULL, 'No Preference', 'US Citizen,Parmanent Resident', NULL, 'Single', 'No', 'Bachelor', 'Yes', 10000, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(75, 'Candidate 21', NULL, 'Male', 'Address 21', 'Ozone Park', 'NY', '101101.0', '000-000-0020', NULL, NULL, 'test21@gmail.com', NULL, 1982, 29, NULL, 66, 140, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, NULL, NULL, 'Sunni', NULL, NULL, 'No Preference', 'No', NULL, 'No Preference', 'No Preference', NULL, 'Single', 'No', 'Masters', 'No Preference', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(77, 'Maruf Barik', NULL, 'Male', NULL, NULL, 'Wisconsin', NULL, '23435346543', NULL, NULL, 'marufbuet', NULL, 1990, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No Preference,', NULL, 'Specific Ethnicity', 'Bangladeshi', 'nullParmanent Resident,Bangladesh,', NULL, 'nullDivorced,Widowed,', NULL, NULL, 'Yes', 120000, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1_0ueYCYL.jpg', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', 29, '2022-03-18 12:12:41.000000', '2022-09-17 15:34:54.000000', '41641806', '25,26,27,28,30,32,', '20,20,20,10,10,0,', '31,26,27', '28', NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(78, 'Md Karamot Ali', NULL, 'Male', 'Mymensingh,Dhaka, Bangladessh', 'Dhaka', 'Texas', '2216', '23948792304', '123456', '7890', 'karamot.mbstu@gmail.com', NULL, 1994, 28, NULL, 70, 73, NULL, NULL, 'Single', 'No', NULL, NULL, 'Bangladesh', NULL, 'Shibrampur High School', 2009, 'MBSTU', 2016, 'ICT', 2018, 'Cyber Security', 2022, 'Media', 2020, 'Doctorate', 'Yes', 'xxxx', 'officer', 200000, 'Sunni', NULL, 'I am satisfied with my religious', 'No', 'Yes', 'No', 'Sunni', NULL, NULL, 'nullHeadscarf,Jelbab/Abaya,', 'No', 'No Preference', 'No Preference', 'nullUS Citizen,Parmanent Resident,Bangladesh,', NULL, 'nullSingle,', 'Yes', 'Masters', 'No Preference', NULL, 6, 'Azizur RAhman , Father', 'Dhaka, Bangladesh', 'dhaka', 'Kansas', 'Bangladesh', '234333', 'father@gmail.com', 'Teacher', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', 90, '2022-04-08 16:14:30.000000', '2022-04-21 15:04:08.000000', '30805283', '30,26,27,28,25,', '40,30,30,30,20,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(79, 'Md Rasheduzzaman', NULL, 'Male', '1033 glenmore Ave', 'Brooklyn', 'New York', '11208', '6073708910', NULL, NULL, 'rashed.cseru@gmail.com', NULL, 1988, 34, NULL, 66, 154, 'Bangladesh', NULL, 'Single', 'No', NULL, NULL, 'Student Visa', NULL, 'kushita Govt college', 2005, 'BSC in Computer science & Engineering', 2013, 'MSC in CSE  Gannon University PA, USA', 2021, NULL, NULL, NULL, NULL, NULL, 'Yes', 'software farm', 'programmer', 60000, 'Sunni', NULL, 'I am  a practicing Muslim , Ex member of BICS and Rukon of BJI', NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', NULL, 15, 'Father Md Jamal uddin', 'poradaha kushtia', 'khulna', NULL, 'Bangladesh', '01723282950', NULL, 'Retired', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFVSamVFMUVWVEJOYWtFOQ==', 'Inactive', 73, '2022-05-18 11:30:01.000000', '2022-08-27 09:48:46.000000', '53815655', '27,28,26,30,25,32,', '50,50,40,40,30,0,', '31,27', NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(80, 'Tarek Hasan', NULL, 'Male', NULL, NULL, 'Florida', NULL, '23424235235', NULL, NULL, 'tarekhasan', NULL, 1993, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'new_logo.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', 20, '2022-05-19 21:30:46.000000', '2022-05-19 21:31:49.000000', '40012292', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(81, 'Md Nazmul Hoque', NULL, 'Male', '446 Eldert Ln', 'Brooklyn', 'New York', '11208', '231231231231', NULL, NULL, 'nazmulmoffice@gmail.com', NULL, 1990, 32, NULL, NULL, NULL, NULL, NULL, 'Single', 'No', NULL, NULL, NULL, NULL, 'testing high school', 1998, 'testing bachelors', 2004, NULL, NULL, NULL, NULL, 'sfsfsfsdfs', 2006, NULL, 'Yes', 'testing', 'manager', 202222222, NULL, NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'Parmanent Resident,', NULL, 'Single,', 'No', 'Doctorate', 'Yes', 100000, 5, 'testing', 'testing address', 'chity', 'Washington', 'United States', '6469067855', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 10, 'VTBkV2MySkhPVUZOVkVsNg==', 'Inactive', 65, '2022-05-21 10:26:55.000000', '2022-11-11 20:13:01.000000', '45745729', '26,25,27,28,30,32,', '60,50,50,40,40,0,', NULL, NULL, '28,27,31,25,32,26', NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', 'iterator.png,generator.png,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL),
(82, 'Ramim', 'Ramim', 'Male', 'Dhaka', 'Dhaka', 'New Jersey', NULL, '01776344872', NULL, NULL, 'ramimbuet12@gmail.com', NULL, 1993, 29, NULL, 72, 120, 'Bangladesh', 'NA', 'Single', 'No', NULL, NULL, 'Bangladesh', NULL, 'Zilla', 2010, 'DU', 2017, 'NU', 2021, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Own', 'Department Head', 15000, 'Sunni', NULL, 'Attend mosque regularly, Do compulsory fasting, attend halaqa', NULL, 'Yes', 'No', 'Sunni', NULL, 'Attend mosque regularly, Do compulsory fasting, attend halaqa.', 'Niqab,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', NULL, 5, 'Abdus Samad', 'Naoga', 'Naoga', 'New York', 'USA', NULL, NULL, 'Teacher', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IMG_6294.jpg', 'Md.-Ashraful-Haque_Resume.pdf', NULL, NULL, 5, 'VFdwUk1FMTZVVDA9', 'Inactive', 93, '2022-08-03 10:59:14.000000', '2022-08-03 11:34:51.000000', '25663174', '27,28,26,31,25,29,32,', '50,50,40,40,30,30,0,', NULL, NULL, NULL, '20191026_173548.jpg', NULL, NULL, NULL, NULL, NULL),
(83, 'Bin', NULL, 'Male', NULL, NULL, 'Delaware', NULL, '01776344872', NULL, NULL, 'faxof58441@agrolivana.com', NULL, 1997, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFdwUk1FMTZVVDA9', 'Inactive', NULL, '2022-08-10 18:06:24.000000', '2022-08-10 18:06:24.000000', '81059880', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'md afil hossain', NULL, 'Male', NULL, NULL, 'Florida', NULL, '01723282950', NULL, NULL, 'sourcerweb@gmail.com', NULL, 1990, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFVSamVFMUVWVEJOYWtFOQ==', 'Inactive', 12, '2022-09-01 05:48:00.000000', '2022-09-01 06:50:31.000000', '43977283', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(86, 'Aslam', 'hossain', 'Male', '545 walden Ave', 'Buffalo', 'New York', '14211', '4554152541', NULL, NULL, 'mawobo8324@bongcs.com', NULL, 1988, 34, NULL, 164, 180, 'bd', NULL, 'Single', 'No', NULL, NULL, 'F-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFVSamVFMUVWVEJOYWtFOQ==', 'Inactive', 26, '2022-09-27 05:54:36.000000', '2022-09-27 06:00:03.000000', '27574603', NULL, NULL, NULL, NULL, NULL, 'muna.jpg', 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(87, 'Md Rashed', NULL, 'Male', '45 bissell ave', 'buffalo', 'New York', '14211', '6073708910', '6073708910', NULL, 'rasheduzzamanlabu0@gmail.com', NULL, 1988, 34, NULL, 170, 150, 'Bangladesh', 'no', 'Single', 'No', NULL, NULL, 'F-1', NULL, 'poradaha high school', 2003, 'BSC in cse', 2010, 'ms in  cse', 2012, NULL, NULL, NULL, NULL, NULL, 'Yes', 'cse', 'manager of HR', 50000, 'Sunni', NULL, 'i am practicing muslim', 'no', 'Yes', 'No', 'Sunni', NULL, 'should be practicing muslim', 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 10, 'Md jamal uddin', 'podradaha', 'kushtia', NULL, 'bagnladesh', '455552566655', 'sergergre@gjj.com', 'businessman', NULL, 'mr x', 'brother', '4565665555', 'mr y', 'friend', '45555554555', 'mr z', 'uncle', '45585455585', 'chai.jpg', 'TitleCheck NMVTIS Report for VIN JTDBR32E660077098.pdf', NULL, 'islam_promotes (3) (2).png', 5, 'VFVSamVFMUVWVEJOYWtFOQ==', 'Inactive', 90, '2022-09-30 11:51:11.000000', '2022-09-30 12:22:40.000000', '27512104', '27,28,30,26,25,32,', '60,50,50,40,30,0,', NULL, NULL, NULL, NULL, 'women-2.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(88, 'Test', NULL, 'Male', NULL, NULL, 'New York', NULL, '6469067855', NULL, NULL, 'nazmul.hoquecu98@gmail.com', NULL, 1990, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUVWVEk9', 'Inactive', NULL, '2022-10-01 04:04:04.000000', '2022-10-01 04:04:04.000000', '38718655', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(89, 'Maruf Bin Barik', NULL, 'Male', NULL, 'New york', 'Indiana', NULL, '6089863647', NULL, NULL, 'marufbuet@yahoo.com', NULL, 1992, 30, NULL, 65, 120, NULL, NULL, 'Single', 'No', NULL, NULL, 'Permanent Resident', NULL, 'School Name', 2007, 'BUET', 2015, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', NULL, NULL, 10000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,', 'No', 'No Preference', 'No Preference', 'US Citizen,EAD,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 5, 'Aziz', NULL, NULL, NULL, NULL, '94685093458', 'skdfjklsj@gmail.com', NULL, NULL, 'Rahim', 'Uncle', '878787878989', NULL, NULL, NULL, NULL, NULL, NULL, '2_4oL4omy.jpg', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', 90, '2022-10-01 15:15:29.000000', '2022-10-01 15:19:33.000000', '47212178', '27,30,26,28,25,32,', '50,50,40,40,30,0,', '31', '27', NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(91, 'Abu Shiddque', NULL, 'Male', NULL, NULL, 'New York', NULL, '9172159737', NULL, NULL, 'Bshiddque@gmail.com', NULL, 1978, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZjeGRGbFlTWGxOUkVVd1NrRTlQUT09', 'Inactive', NULL, '2022-11-15 04:56:47.000000', '2022-11-15 04:56:47.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(92, 'Abu Shiddque', NULL, 'Male', NULL, NULL, 'New York', NULL, '9172159737', NULL, NULL, 'shiddque14@gmail.com', NULL, 1993, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZjeGRGbFlTWGxOUkVVd1NrRTlQUT09', 'Inactive', NULL, '2022-11-17 02:38:28.000000', '2022-11-17 02:38:28.000000', '39394510', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(93, 'TAWHID ISLAM', NULL, 'Male', '125 BURLINGTON AVE', 'PATERSON', 'New Jersey', '07502', '3476588178', NULL, NULL, 'tmtawhid@gmail.com', NULL, 1980, 42, NULL, 66, 155, NULL, NULL, 'Divorced', 'Yes', 2, '6', 'US Citizen', NULL, 'PCC', 2000, 'NJIT', 2004, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', NULL, NULL, 900000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'Yes', 'No Preference', 'No', 1, 10, 'Alhaj Samir Uddin', '125 Burlington Ave', 'Paterson', 'New Jersey', NULL, '3476588178', 'Tmtawhid@gmail.com', NULL, NULL, 'ABC', 'Friend', '3476588178', 'DCE', 'Parent', '223', 'EFg', 'Parent', '232', 'anonymous.png', NULL, NULL, 'SmartSelect_20221119_175205_Chrome.jpg', 5, 'VWpJNWRscEVVbkZpTWtsbw==', 'Inactive', 97, '2022-11-19 10:19:19.000000', '2022-11-19 13:07:19.000000', '59179816', NULL, NULL, NULL, NULL, NULL, '16689004934774558617306491003596.jpg', 'Screenshot_20221119_162331_Chrome~2.jpg,IMG-20221112-WA0004.jpg,16688975612584992787084860415579.jpg,Screenshot_20221119_162331_Chrome~2_SNXRC4d.jpg', NULL, NULL, NULL, NULL),
(94, 'TAWHID ISLAM', NULL, 'Male', NULL, NULL, 'New Jersey', NULL, '3476588178', NULL, NULL, 'tmtawhid@yahoo.com', NULL, 1980, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VWpJNWRscEVVbkZpTWtsbw==', 'Inactive', NULL, '2022-11-19 11:16:25.000000', '2022-11-19 11:16:25.000000', '85905135', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(95, 'Ali Anan', 'Anan', 'Male', 'Los Angeles, California', 'Los Angeles', 'California', '90001', '9988556610', '78888844590', '45666877778', 'ali.innovation21@gmail.com', 'www.ali.anan.com', 1994, 28, NULL, 70, 15, 'California', NULL, 'Single', 'No', NULL, NULL, 'Permanent Resident', NULL, 'Agricultural University College', 2011, 'Agricultural University', 2016, 'Agricultural University', 2018, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Ag House', 'Senior Officer', 30000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Niqab,', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 5, 'Azizur Rahman', '1033 Glenmore Ave, Brooklyn, United States', 'Brooklyn', 'New York', 'United States', '7778884456', 'azizur.rahman@gmail.com', 'Professor', NULL, 'Dr Hasan Ali', 'Uncle', '8887777999', 'Dr Ali Abrar', 'Brother', '8887777998', 'Ali Azam', 'Friend', '9988844466', 'pp.jpg', 'pass_ZCewCsg.jpg', NULL, 'pass.jpg', 5, 'VVZkNGNGRkVTVEJPUkUwd1VVRTlQUT09', 'Inactive', 90, '2022-11-20 18:57:02.000000', '2022-11-21 21:10:06.000000', '18423566', '27,28,30,26,25,32,', '60,50,50,40,30,0,', '27,30', NULL, '28', 'sign.jpg', 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(98, 'Abdul Bari', NULL, 'Male', NULL, 'Edinberg', 'Kansas', NULL, '0938409809', NULL, NULL, 'abdulbari.bec@gmail.com', NULL, 1990, 32, NULL, 91, 120, NULL, NULL, 'Single', NULL, NULL, NULL, 'Permanent Resident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', NULL, NULL, 999999999, NULL, NULL, 'kdjlksfjlsjfldsjflksjflksssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssllllllllllllllllllllllllllllllllllllllllllllllllllssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssskkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkksssssssssssssssssssssssssssssssssssssdsfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffsssssssssssssssssssssssssssssssssssssssssssssskkkkkkkkkkkkkkkkkkkkkkkkkkkk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Student Visa,H1B,', NULL, 'No Preference,', NULL, NULL, 'Yes', 10000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TZOF4RJgallery1.jpg', '0FA7M8Umathclubnyc.docx', NULL, 'JUQ6S7Bgallery1.jpg', 5, 'V1d0Q2VXRlVSWGxOZWxFOQ==', 'Deactivated', 41, '2022-11-26 16:33:44.000000', '2023-08-20 20:00:47.000000', '67134005', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(99, 'tanvir hasan', NULL, 'Male', NULL, NULL, 'New York', NULL, '7163038253', NULL, NULL, 'ytanvirthasan120@gmail.com', NULL, 1999, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'YSUNPYHinta2.jpeg', NULL, NULL, NULL, 5, 'VDBScmVVNUVaM2M9', 'Inactive', 14, '2022-12-16 18:54:31.000000', '2022-12-16 18:57:41.000000', '49801066', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(100, 'Abdullah Preaches Omar', 'Dajjalfighter', 'Male', '2101A Davidson Ave', 'Bronx', 'New York', '10472', '9143154944', NULL, NULL, 'defekij144@haikido.com', NULL, 2004, 18, NULL, 67, 160, 'Bronx, NY', 'Acute Learning Deficiency', 'Single', NULL, NULL, NULL, 'Other', 'Immigrant', 'Brooklyn Latin', 2018, 'Baruch College', 2022, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Dunkin Donuts', 'Manager', 80000, 'Sunni', NULL, 'Fajr and Issha in masjid, Tahajjud, Fast of Dawud, 1000 salawaat, Daily morning and evening of Athkaar, 1 hour Qur\'an', NULL, 'Yes', 'No', 'Sunni', NULL, '30 day Deen challenge', 'No Preference,', 'No Preference', 'Specific Ethnicity', 'Bangladeshi', 'No Preference,', NULL, 'No Preference,', 'Yes', 'No Preference', 'No Preference', 1, 5, 'Mohammedul Ubaidul Ullahul', '2101B Davidson Ave', 'Bronx', 'New York', 'United States', '347 563 9065', 'defekij144@haikido.com', 'Mass Transit Authority Transporter of Specialized Children/ Elderly WomXn of Hispanic/Latinx Origin', NULL, 'Syed S Hoque', 'Imam/ Fortnite Companion', '3475610767', 'Wayeez Giash', 'Huzoor', '9143872734', 'Tianqi Zhu', 'DISCHARGE ATHLETE TEAMMATE', '6316179548', 'anonymous.png', NULL, NULL, 'SEYH0QTUntitled-1.jpg', 5, 'VWtkR2NXRnRSbk5hYld4dVlVaFNiR05xVlhsSlVUMDk=', 'Active', 95, '2022-12-21 21:18:00.000000', '2023-11-04 13:04:57.000000', '16769601', '70,77,158,180,42,46,63,84,93,151,', '30,30,30,30,20,20,20,20,20,20,', '33,46,63,100,77', NULL, NULL, '7MKG4H2image.png', '60NTG0TScreenshot_20221222_043502.png,9GY4W05Screenshot_20221222_043335.png,1TR63UUScreenshot_20221222_043409.png,0MTAL7AScreenshot_20221222_043349.png', NULL, NULL, '33,34,45,46,50,48,51,63,70,82,42,77,84,93,100,102,103,133,151,158,162,180,157,148,', NULL),
(101, 'Mohammed', NULL, 'Male', NULL, 'Brooklyn', 'New York', NULL, '6469067855', NULL, NULL, 'mdnhoque01@gmail.com', NULL, 1987, 35, NULL, 2, 150, NULL, NULL, 'Single', NULL, NULL, NULL, 'Permanent Resident', NULL, NULL, NULL, 'fsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, NULL, 'sdsf', NULL, 'No', 'Sunni', NULL, 'sdfsdf', 'No Preference,', 'No Preference', NULL, NULL, 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'No', 1, 5, 'sdfsafa', 'sdfa', 'sdfs', NULL, NULL, '32232423423', '42342@gmail.com', NULL, NULL, 'sdfsdf', 'fsdfsd', '544635245345', NULL, NULL, NULL, NULL, NULL, NULL, 'ATA5GD9canstockphoto22402523-arcos-creator.com_-1024x1024-1.jpg', NULL, NULL, NULL, 5, 'VmtkV2VtUkZRWGhOYWxwQg==', 'Active', 90, '2022-12-30 00:50:33.000000', '2023-01-14 03:58:23.000000', '13805493', '160,84,158,173,201,204,208,63,93,180,', '50,40,40,40,40,40,40,30,30,30,', '46', NULL, NULL, 'QJBRTZ0Webex.exe', 'S7V2L7Dcanstockphoto22402523-arcos-creator.com_-1024x1024-1.jpg,0I23284canstockphoto22402523-arcos-creator.com_-1024x1024-1.jpg,SYJM6ZLcanstockphoto22402523-arcos-creator.com_-1024x1024-1.jpg,QK2B1CQcanstockphoto22402523-arcos-creator.com_-1024x1024-1.jpg', NULL, NULL, '34,33,45,46,50,48,51,63,70,82,84,100,93,102,103,42,77,109,133,151,158,160,162,164,176,185,188,180,173,193,201,196,148,208,204,', NULL),
(102, 'Riduan Rafique', NULL, 'Male', NULL, 'Warren', 'Michigan', NULL, '3139156544', NULL, NULL, 'riduan907@gmail.com', NULL, 1997, 26, NULL, 65, 140, 'Detroit, MI, USA', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'High School', 2015, 'BSBA- Information Systems', 2019, 'Islamic Studies-Islamic Education', NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Entrepreneur', 'Business Owner', 80000, 'Sunni', NULL, 'Current Zonal Youth Director. I maintain all my Faraid and try to stay consistent with my sunnah obligations.', NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 8, 'Muhammad Islam', '5181 Trailwood Lane', 'Warren', 'Michigan', 'United States', '3132311986', '1967.mislam@gmail.com', 'Social Worker and Community Leader', NULL, 'Shaykh Ishaq Samoura', 'Teacher/Mentor', '3139179797', 'Khalid Hussain', 'Former National Youth Director', '5862443304', 'Shaykh Ali Sulieman Ali', 'Teacher/Mentor', '7343068205', 'ZBQV0TQ353000111_6289349844489403_1802062891428854683_n.jpg', 'YE5Z0DTRiduan_Rafique_(1).pdf', NULL, '0MCXVJFWhatsApp_Image_2023-06-12_at_10.57.23_AM.jpeg', 5, 'VlRJNWMyUlhXalZOZWtWNlNrRTlQUT09', 'Active', 97, '2023-01-21 05:10:27.000000', '2024-02-11 04:56:23.000000', '41539622', '158,160,173,185,42,63,70,93,180,201,', '60,60,60,60,50,50,50,50,50,50,', '151,157,158,185,176,196,180,70,215', NULL, NULL, 'BI7S5UQsign.png', '97RUNL6Abstract_Profile_Photo_Instagram_Post_(3).png,15UP8Z4353000111_6289349844489403_1802062891428854683_n.jpg,FY261JV343761917_1355658718345568_547949054689152162_n.jpg,O7M3RQDAbstract_Profile_Photo_Instagram_Post.jpg', NULL, NULL, '45,100,133,42,63,82,93,77,84,103,151,46,158,160,164,162,70,176,185,188,180,173,193,201,148,', NULL),
(104, 'Fakrul Islam', NULL, 'Male', NULL, NULL, 'Georgia', NULL, '4045131291', NULL, NULL, 'fakrul91@hotmail.com', NULL, 1965, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VXpKb2FHSnRPWFJOVkVsbw==', 'Inactive', 12, '2023-01-21 15:58:57.000000', '2023-01-21 16:01:37.000000', '68433462', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(105, 'Saad Bin zubaeir', NULL, 'Male', NULL, NULL, 'Alaska', NULL, '9078300577', NULL, NULL, 'zubancak1996@gmail.com', NULL, 1993, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZkS01VNUhSbmxoYlRoclNsUTRQUT09', 'Inactive', NULL, '2023-01-21 12:00:10.000000', '2023-01-21 12:00:10.000000', '23580294', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(106, 'Yahya Habib', NULL, 'Male', NULL, NULL, 'Georgia', NULL, '4703079416', NULL, NULL, 'YAHYA.T.HABIB@GMAIL.COM', NULL, 2003, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'Vmtkb2JGSnRPWGxaTWxWNlRrUlZkMGxSUFQwPQ==', 'Inactive', NULL, '2023-01-22 09:26:58.000000', '2023-01-22 09:26:58.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(107, 'Mazhar', NULL, 'Male', NULL, NULL, 'Georgia', NULL, '404-783-1724', NULL, NULL, 'Mazhar5450@hotmail.com', NULL, 1999, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlZoa2JHTnVValZOVkVsclNrRTlQUT09', 'Inactive', NULL, '2023-01-22 09:30:49.000000', '2023-01-22 09:30:49.000000', '72674216', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(108, 'Md Tausif Murshed', NULL, 'Male', NULL, NULL, 'California', NULL, '5614515890', NULL, NULL, 'Tausif.civil.buet@gmail.com', NULL, 1992, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'U2tobk1GcHFRVFJPYkd4MFYycFpkMDE2UVQwPQ==', 'Inactive', NULL, '2023-01-22 07:28:00.000000', '2023-01-22 07:28:00.000000', '31879990', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(109, 'Md Hasanujjaman Milon', 'Milon', 'Male', '345 South Alexandria Ave', 'Los Angele', 'California', '90020', '2136450192', NULL, '01936224728', 'mhmilon192@gmail.com', NULL, 1991, 32, NULL, 65, 132, 'Cumilla', 'No', 'Single', NULL, NULL, NULL, 'F-1', NULL, 'College: Nawab Fayzzunnes Govt. College.', 2013, 'IUBAT- International University of Business Agriculture and Technology.', 2019, 'WestCliff University', 2022, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Downtown, Los Angeles', 'Electronics Repairing Shop.', 40000, 'Sunni', NULL, 'I always try to be a practical Muslim. I do pray and I am optimistic that I will continue it my entire life.', NULL, 'No', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 5, 'Md Abdur Rashid', 'Village: Duaria, Post: Chhariabaza, Thana: Nangalkot', 'Cumilla', NULL, 'Bangladesh', '01936224728', 'abdurrashid4728@gmail.com', 'Retired', 'We are four brothers. We don\'t have sister. I am the second son of my parent.', 'Md Abdur Rashid', 'Father', '01936224728', 'Rasel Mahmud Jewel', 'Relative brother', '+12136637343', NULL, NULL, NULL, '6JPPQYWinbound6373830677544146994.jpg', 'OLC90Y92023-2024-Academic-Calendar-1_(1).pdf', NULL, NULL, 5, 'VG5wak1VNTZXVFU9', 'Deactivated', 97, '2023-01-22 07:50:59.000000', '2024-04-14 11:14:12.000000', '32048644', '160,63,201,208,42,84,93,151,158,173,', '60,50,50,50,40,40,40,40,40,40,', '42,63,84,160', NULL, '208,201', 'L6THSG4PXL_20240120_034404591.jpg', 'L5W0OP1IMG-20240120-WA0006.jpg,S5VTC5VIMG-20240120-WA0007.jpg,96SCTWPIMG-20240120-WA0009.jpg,9RTHV94IMG-20240120-WA0010.jpg', NULL, NULL, '160,63,42,84,93,151,158,162,176,185,188,180,173,193,201,148,208,', NULL),
(110, 'Meraj Patwary', NULL, 'Male', NULL, 'Brooklyn', 'New York', '11208', '3472389163', NULL, NULL, 'merajpat123@yahoo.com', NULL, 1986, 37, NULL, 54, 140, 'Noakhali', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVRJNWRXUkhiSFZhVnpVd1dWZDNlRTFxVFdzPQ==', 'Inactive', 31, '2023-01-22 12:50:05.000000', '2023-01-22 15:58:54.000000', '81703495', NULL, NULL, NULL, NULL, NULL, 'F52YTFU82E8EE0B-55A9-464F-9B6B-B900D125E1E8.jpeg', 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(112, 'Hozaifa', NULL, 'Male', NULL, NULL, 'Hawaii', NULL, '808140732146', NULL, NULL, 'hozaifahamim@gmail.com', NULL, 2001, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VTBkR2RHRlhNSGxPYWtGNlVVRTlQUT09', 'Inactive', NULL, '2023-01-23 09:11:31.000000', '2023-01-23 09:11:31.000000', '25789072', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(113, 'Salik Ahmed', NULL, 'Male', '707 Lawrence st', 'Elmont', 'New York', '11003', '3476912333', NULL, '3476912333', 'ahmedsalikny2016@gmail.com', NULL, 1989, 33, NULL, 66, 145, 'Bangladeh', 'Good', 'Single', NULL, NULL, NULL, 'Other', NULL, 'HSC', 2007, 'BA', 2014, 'No', NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Domino’s pizza', 'Manager', 75000, 'Sunni', NULL, 'Muslim', NULL, 'Yes', 'No', 'Sunni', NULL, 'No', 'Headscarf,Niqab,', 'No', 'Own Ethnicity', 'Bangladeshi', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 10, 'Ruhena begum', '14502 88 ave', 'Jamaica', 'New York', 'USA', '3476912333', 'Newyork1767@gmail.com', 'Self employed', NULL, 'Mohammad monna', 'Mama', '929 360-8916', 'Abdul jalil', 'Brother', '01710602051', 'Abdul karim', 'Brother', '3476912333', 'MG76OEHD4E61A71-2754-462D-86FE-97291987EA6D.jpeg', '5QXJANYLyft_2023_1099K_1.pdf', NULL, 'BPVCQ15IMG_3149.jpeg', 5, 'VkZoV2RWbFVTWGROYWxGeA==', 'Deactivated', 97, '2023-01-23 05:13:59.000000', '2024-03-15 07:01:58.000000', '52342000', NULL, NULL, NULL, NULL, NULL, 'WMWQDSBIMG_3798.jpeg', '927A9220C77B330-432A-4D6C-88C9-C7EF2EB02DEA.jpeg,PGDJPH2IMG_1949.jpeg,CTWOWNDIMG_3750.jpeg,7SQNKIWIMG_1967.jpeg', NULL, NULL, NULL, NULL),
(114, 'Kawsar Ahmed', NULL, 'Male', NULL, 'Queens', 'New York', '11372', '6464666388', NULL, NULL, 'kawsar.vb@gmail.com', NULL, 1989, 34, NULL, 67, 175, 'Bangladesh', 'Good', 'Single', NULL, NULL, NULL, 'EAD', NULL, 'College', 2007, 'University', 2008, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', NULL, NULL, NULL, 'Sunni', NULL, 'Moderate practicing ( Salafi Manhaj)', NULL, 'Yes', 'No', 'Sunni', NULL, 'Salafi', 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Specific Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,Divorced,', 'No', 'No Preference', 'No Preference', 1, 12, 'Hannan', NULL, 'Dhaka', NULL, 'Bangladesh', '6468414241', NULL, NULL, NULL, 'Abu Bakar', 'Uncle', '9292619967', 'Pavel', 'Friend', '3479827540', 'Nayem', 'Friend', '9176674610', 'FKAZ25TB4575C5D-D1CE-4B00-9EFB-59FEC6E2E1B7.jpeg', '44KRXPLCamScanner_01-23-2023_19.15.pdf', NULL, 'LMZF6MECamScanner_01-23-2023_19.12.pdf', 5, 'VXpKR01GRkVaM3BPYWtGMw==', 'Inactive', 80, '2023-01-23 12:44:13.000000', '2023-01-23 13:27:11.000000', '32954541', NULL, NULL, NULL, NULL, NULL, 'XVIOXH2A6C89E22-680C-449D-AB1A-409C53BF1DE3.jpeg', 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(115, 'Muntaha Syfullah', NULL, 'Male', NULL, 'Des Plains', 'Illinois', NULL, '2246604529', NULL, NULL, 'abdullahuk01@gmail.com', NULL, 1994, 29, NULL, 63, 150, 'Banglades', 'N/A', 'Single', NULL, NULL, NULL, 'EAD', NULL, 'Commerce', 2011, 'BBA', 2018, NULL, NULL, NULL, NULL, 'Diploma', 2014, 'Bachelor', 'Yes', 'Chicago', 'Soft. Eng', 150000, 'Sunni', NULL, 'I am trying to be a good Muslim.', NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya,', 'No', 'No Preference', 'No Preference', 'EAD,', NULL, 'No Preference,', 'Yes', 'No Preference', 'No Preference', 1, 12, 'Hossain', NULL, 'Des Plains', 'Illinois', 'USA', '2246604529', 'a@g.com', 'Data Analy', NULL, 'Hossain', 'Brother', '2246604529', 'Numan', 'Brother', '331 444-8357', 'Samia', 'Sister', '1998915401', 'IA58KXCMuntaha.jpeg', 'F1S4T60Muntaha_CV.pdf', NULL, 'QFVQ8K4Passport.pdf', 5, 'VWtkb2FHRXlSa0ZOYWtGNVRYYzlQUT09', 'Active', 97, '2023-01-24 04:16:47.000000', '2024-04-27 14:24:47.000000', '19687681', '46,63,151,196,201,207,208,42,70,77,', '50,50,50,50,50,50,50,40,40,40,', '33,34,45,46,50,48,51,63,70,100,84,42,133,151,158,162,185,188,196,201', NULL, NULL, 'IBJXKM1signature.png', '5ZLA49ZIMG_0219.jpg,4A15J4YIMG_CEDF8837080F-1.jpeg,XA1G8RKRWNWO5IIMG_9CD776EAB9F0-1.jpeg,GINUQZDIMG_CBF00B8AB490-1.jpeg', NULL, NULL, '33,34,45,46,50,48,51,63,70,82,103,42,77,84,93,100,133,151,158,162,157,188,196,201,208,207,', NULL);
INSERT INTO `UserApp_maleuser` (`userId`, `fullName`, `nickName`, `gender`, `address`, `city`, `state`, `zip`, `cellPhone`, `workPhone`, `homePhone`, `email`, `personalWebsite`, `birthYear`, `age`, `dateOfBirth`, `height`, `weight`, `placeOfBirth`, `health`, `maritalStatus`, `children`, `childrenNumber`, `childrenAges`, `immigrationStatus`, `immigrationStatusOther`, `highSchool`, `highSchoolYear`, `bachelors`, `bachelorsYear`, `masters`, `mastersYear`, `doctorate`, `doctorateYear`, `otherDegree`, `otherDegreeYear`, `highestEducation`, `employed`, `employment`, `position`, `income`, `religiousPractice`, `religiousPracticeOther`, `religiousPracticeBrief`, `revertTime`, `beard`, `smoker`, `preReligious`, `preReligiousOther`, `preReligiousBrief`, `preWear`, `preSmoking`, `preEthnic`, `preEthnicSpecific`, `preImmigrationStatus`, `preImmigrationStatusOther`, `preMaritalStatus`, `preChildren`, `preEducation`, `preEmployment`, `preIncome`, `preAgeGap`, `guarName`, `guarAddress`, `guarCity`, `guarState`, `guarCountry`, `guarPhone`, `guarEmail`, `guarProfession`, `familyBrief`, `refName1`, `refRelation1`, `refPhone1`, `refName2`, `refRelation2`, `refPhone2`, `refName3`, `refRelation3`, `refPhone3`, `photo`, `cv`, `album`, `govIssuedId`, `matchShowLimit`, `userPass`, `status`, `profileCompleteness`, `openingDate`, `lastEdit`, `userToken`, `matchId`, `matchPercentage`, `reqAccepted`, `reqRejected`, `reqSent`, `signature`, `gallery`, `tempGallery`, `lockedId`, `cuMatchId`, `reqLock`) VALUES
(116, 'Ahmed Hossain', NULL, 'Male', NULL, 'Brooklyn', 'New York', '11409', '2154122865', NULL, NULL, 'zakia.begum1932@gmail.com', NULL, 1995, 28, NULL, 65, 150, NULL, NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'GED', NULL, 'NYU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, 50000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'Yes', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,EAD,Other,', NULL, 'Single,Divorced,Widowed,', 'Yes', 'No Preference', 'No Preference', 1, 20, 'Abu Ahmed', NULL, NULL, NULL, NULL, '2154122865', 'z@gmail.co', NULL, NULL, 'Ahmed Zain', 'Teacher', '2154122865', 'Imam Bukha', 'Teacher', '2154122865', 'Iman Hussa', 'Mentor', '2154122865', 'anonymous.png', 'ESOFMCBWhy_winter_is_cold_azad_parenting.docx', NULL, 'HAAKE0Aphotoid-front.jpg', 5, 'VjIxR2NtRlhSWGhQVkUxNVNrRTlQUT09', 'Inactive', 90, '2023-01-25 10:42:31.000000', '2023-10-25 07:04:16.000000', '78075929', '77,42,45,46,63,84,93,103,133,151,', '40,30,30,30,30,30,30,30,30,30,', '33,46,50,63,82,84,42,100,151,151', NULL, NULL, '4DRB7U3photoid-front.jpg', 'S4AV4B5photoid-front.jpg,XZ63412photoid-front.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, '33,34,45,46,50,48,51,63,70,82,77,42,84,93,100,102,103,133,151,', NULL),
(117, 'Hasanul Banna Uddin', NULL, 'Male', NULL, NULL, 'New York', NULL, '9293267191', NULL, NULL, 'hasanuluddin9@gmail.com', NULL, 2000, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlROU2NGa3laM2hOYWs1Qg==', 'Inactive', NULL, '2023-01-27 14:59:51.000000', '2023-01-27 14:59:51.000000', '51133378', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(118, 'Arrafi md Raiyan', NULL, 'Male', NULL, 'Queens', 'New York', NULL, '9293545262', NULL, NULL, 'Shopner25@gmail.com', NULL, 1997, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WVZaU05rOVVSVFZPZWtVeFVVRTlQUT09', 'Inactive', 14, '2023-01-28 18:21:03.000000', '2023-01-28 18:22:10.000000', '83395954', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(119, 'Farhan Haque', NULL, 'Male', 'Test', 'New York', 'New York', '10001', '6463743842', NULL, NULL, 'danyalb175@gmail.com', NULL, 1995, 28, NULL, 67, 150, 'Dhaka', 'No', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Yes', 2013, 'Yes', 2017, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, 'Test', 'Text', 'Yes', 'No', 'Sunni', NULL, 'Test', 'No Preference,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 1, 12, 'Sample name', 'Address', 'New york', 'Iowa', 'USA', '6463747373', 'Sample@gmail.com', NULL, NULL, 'Test', 'Ready', '5747384848', 'Ok', 'Another', '5565555666', 'Okay', 'One', '5565566666', 'anonymous.png', 'N404B6Usample-resumes.docx', NULL, '9PGPV0E5b057be45e48ec21008b458f.jpeg', 5, 'U2tWU2RtSnRPVEJqTW1ob1kyMVZlRTFCUFQwPQ==', 'Inactive', 95, '2023-01-28 19:47:21.000000', '2023-01-28 20:06:16.000000', '85880907', NULL, NULL, NULL, NULL, NULL, 'M6S9KTI1000004769.jpg', '7DT3CT61000006914.jpg,WCIHVQ21000006914.jpg,2SAEH821000006914.jpg,3ECBVDM1000006914.jpg', NULL, NULL, NULL, NULL),
(120, 'Mufazzal Hossain', NULL, 'Male', NULL, 'Queens', 'New York', NULL, '3473274008', NULL, NULL, 'hossain108@outlook.com', NULL, 1992, 31, NULL, 70, 177, NULL, NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, 'Civil Engineering', 2015, 'Civil Engineering', 2017, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'New York State Assembly', 'District Director', NULL, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', NULL, 7, 'Sabira Hossain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFdwR1FXTXpVa2RhVjBsNFQxUnJlVWxSUFQwPQ==', 'Inactive', 65, '2023-01-29 06:37:58.000000', '2023-01-29 06:42:20.000000', '12968115', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(121, 'Abidur Ullah', 'Abid Ullah', 'Male', NULL, 'Tampa', 'Florida', NULL, '7278598958', NULL, NULL, 'abidur98@gmail.com', NULL, 1998, 25, NULL, 64, 145, 'Bangladesh', 'N/A', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'High School Diploma', 2016, 'Long-Term Care Administration from the University of South Florida', 2021, 'Business Administration (MBA) & Health Administration (MHA) from the University of South Florida', NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'I work part-time while attending school full-time', NULL, 50000, 'Sunni', NULL, 'I perform daily prayers and fast during the month of Ramadan. I live next to a masjid so I try to pray at the masjid when I am home.', NULL, 'Yes', 'No', 'Sunni', NULL, 'I prefer a spouse that prays daily and dresses in modest clothing.', 'Headscarf,Jelbab/Abaya,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,Student Visa,F-1,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 4, 'Ahsan Ullah', NULL, NULL, NULL, NULL, '7272516024', 'ahsan727@gmail.com', NULL, NULL, 'Imam Ahmed Aly', 'Imam at my local Masjid', '7272476787', 'Zillur Rahman', 'Brother-in-law', '7274521276', 'Mahir Abdella', 'Best friend', '7276575730', 'Y9J9WPVIMG_1036.jpeg', 'GJKVF48Abidur_Ullah.pdf', NULL, 'XMX7H27Abidur_Ullah_ID.pdf', 5, 'VkZoV2RWbFhNV2hrU0Vwd1lsYzVkV0ZYUm5OTmFrMXI=', 'Deactivated', 97, '2023-01-30 13:00:13.000000', '2023-10-02 05:19:18.000000', '28277561', '63,42,45,93,100,103,133,46,77,82,', '60,40,40,40,40,40,40,30,30,30,', '45,33,50,48,51,63,84,100,70', NULL, NULL, 'FTXMV1ISignature.jpg', 'FKBBROCIMG_8257.jpeg,6ST92BYversion=1&uuid=3B2B1FE8-E9BC-4393-AB9F-F6884B4005F6&mode=compatible&noloc=0.jpeg,RFC8LPLIMG_1786.jpeg,R3MQ9QVIMG_2130.jpeg', NULL, NULL, '33,34,45,46,50,48,51,63,70,82,42,93,100,103,77,84,102,109,133,', NULL),
(122, 'Shaid Hasan', 'Shojib', 'Male', '2676 Pulaski St', 'Hamtramck', 'Michigan', '48212', '9895019455', '9895019455', '9895019455', 'shaidhasanofficial@gmail.com', 'No', 1998, 25, NULL, 70, 140, 'Feni, Bangladesh', 'No', 'Single', NULL, NULL, NULL, 'Student Visa', NULL, 'Dagonbhuiyan Academy', 2014, 'BGMEA University of Fashion and Technology', 2021, 'Central Michigan University', 2022, NULL, 2023, 'No', NULL, 'Masters', 'Yes', 'NYX Inc', 'Supply Chain Analyst (Intern)', 36000, 'Sunni', NULL, 'Alhamdulillah, I do maintain 5 times prayers and fasting. Always try to consume halal food. My first and main priority is a religious girl.', 'no', 'Yes', 'No', 'Sunni', NULL, 'She must maintain an Islamic lifestyle and follow all the norms of Islam. Inshaallah I will help her in maintaining everything.', 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,EAD,Other,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 1, 'Kazi Md Zaynal Abdin', 'Kari Saheber Bari, Nayanpur, Pratappur, Dagonbhuiyan', 'Feni', NULL, 'Bangladesh', '01711032678', 'kazi.3no.up.dagonbhuiyan@gmail.com', 'Marriage Registration Officer', 'My family is totally religious. So, She should maintain all the religious rules and norms.', 'Kazi Md Zaynal Abdin', 'Father', '01711032678', 'Bibi Hazera Silpi', 'Mother', '0000000000', 'Jhaid Hasan Siam', 'Brother', '01629171304', '9WK8Y9P81.jpg', 'GC0U2OYShaid_Hasan\'s_Bio_Data.pdf', NULL, 'J7U6QTJPassport.jpg', 5, 'VVVaT2VtTXlhSFpoYld4cFRWUnJNMDFSUFQwPQ==', 'Deactivated', 97, '2023-01-30 16:31:14.000000', '2024-05-23 01:54:53.000000', '25971296', '160,173,180,185,63,77,158,201,204,208,', '50,50,50,50,40,40,40,40,40,40,', '33,45,50,48,51,63,70,84,103,196', NULL, NULL, 'OQPBC65WhatsApp_Image_2022-10-11_at_2.07.39_AM.jpeg', '8W10BX581.jpg,CRVIYZKWhatsApp_Image_2022-11-19_at_12.12.45_PM.jpeg,BRIKSJFWhatsApp_Image_2022-11-19_at_12.13.07_PM.jpeg,CBXW5OFIMG-20230421-WA0018.jpg', NULL, NULL, '33,34,45,46,50,48,51,63,70,82,77,100,42,84,93,102,103,133,151,158,160,162,164,176,185,188,180,173,193,201,148,208,204,', NULL),
(123, 'Tawhid  Chowdhury', 'Rahel', 'Male', 'Totowa Avenue', 'Paterson', 'New Jersey', '07502', '8565039407', '8565039407', NULL, 'ctawhid11@gmail.com', 'https://www.facebook.com/Thawhid1?mibextid=LQQJ4d', 1999, 24, NULL, 70, 172, 'Sylhet (Bangladesh)', 'Alhamdulillah', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Kennedy HS', 2019, 'William Paterson university', 2023, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Paterson public school', 'Substitute teacher', 60, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,Student Visa,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 5, 'Mutahar Chowdhury', 'Totowa Avenue', 'Paterson', 'New Jersey', 'United States', '8622827270', 'ctawhid11@gmail.com', NULL, NULL, 'Abdus Sakil', 'Imam and brother', '(862) 336-2706', 'Tanvir Islam', 'Brother from another mother', '(917) 605-8787', 'Mohammed Salahuddin', 'Brother from another mother', '(917) 238-9248', '3YAP4ZJ81CC8838-A9F7-4EF4-BA8D-16FDE74C14BF.jpeg', '0EDV1FMTawhid\'s_Biodata.pdf', NULL, NULL, 5, 'VlcxR2IxcFhkM2xOUkVsNlNrRTlQUT09', 'Inactive', 95, '2023-01-31 10:21:27.000000', '2023-11-28 12:49:00.000000', '57481643', '63,164,42,70,77,93,103,133,151,158,', '50,50,40,40,40,40,40,40,40,40,', '33,45,46,50,48,51,63,70,100,158,162', NULL, NULL, 'U2WJH19Sign,_Tawhid_.heic', 'CG0MVN73BFCB051-4A50-469F-990C-662002074F46.jpeg,PUY2A2HEAD3B059-0F12-48F0-B440-EA13BA61AD99.jpeg,BQ2N9405F3BF8C4-D742-4F2F-B26A-E2ABC7974179.jpeg,gallery4.jpg', NULL, NULL, '33,34,45,46,50,48,51,63,70,82,77,100,42,84,93,102,103,109,133,151,158,160,162,164,', NULL),
(124, 'Mohammad Khan', 'Solaiman', 'Male', '1476 ST. LAWRENCE AVE', 'BRONX', 'New York', '10460', '9293636975', NULL, NULL, 'khansolo452@gmail.com', NULL, 1996, 27, NULL, 64, 145, 'Chandpur, Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Fort Hamilton HS', 2014, 'BS, City College', 2020, 'Data Science', 2023, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Montefiore', 'HR Data Analyst', 1, 'Sunni', NULL, 'Following Quran and Sunnah: 5 daily prayers, fasting, Jummah, prayers in masjid, Islamic events, continuous learning', NULL, 'Yes', 'No', 'Sunni', NULL, 'Practicing the basics of Islam or more.', 'Headscarf,Jelbab/Abaya,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 3, 'Abdur Rahman Khan', '1476 ST. LAWRENCE AVE\n1FL', 'Bronx', 'New York', 'United States', '6467275243', 'mohammedkhan20@gmail.com', 'Cook(Retired)', NULL, 'KBN Saifullah', 'Mentor', '7185813780', 'AyubAli Khan', 'Uncle', '9172461875', 'Md Toky', 'Friend', '9295411171', 'R14U5FTfridge1.jpg', 'NZBBX62Solaiman_biodata.pdf', NULL, 'XZ14O3NDrivers_License_front.png', 5, 'VlRJNWMxbFhiSFJaVnpRd1RYbEZQUT09', 'Active', 97, '2023-01-31 11:01:04.000000', '2024-05-27 15:42:51.000000', '23625510', '63,201,151,160,173,185,196,207,208,42,', '60,60,50,50,50,50,50,50,50,40,', '151,162,196,173,201', NULL, NULL, 'TE082CKMuna_Matrimonial_signed.png', '43EI39Gfridge1.jpg,CHVCHQFwhiteflowersmain.jpg,6GMJEM4sidepro.jpg,46PHYWEfallsmainpic.jpg', NULL, NULL, '63,151,160,162,42,46,70,93,157,158,188,196,201,148,208,173,176,185,207,', NULL),
(125, 'Firoz hossain', NULL, 'Male', NULL, NULL, 'Florida', NULL, '786-339-7662', NULL, NULL, 'firoz50cent@gmail.com', NULL, 1996, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VW0xc2VXSXpiM2xPVlVFOQ==', 'Inactive', NULL, '2023-01-31 12:38:50.000000', '2023-01-31 12:38:50.000000', '60039234', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(126, 'Fahim Hossain', NULL, 'Male', NULL, NULL, 'New York', NULL, '929-210-4920', NULL, NULL, 'fahimhossain565@yahoo.com', NULL, 1997, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VGtSbk1FOUVXWGM9', 'Inactive', NULL, '2023-02-07 08:04:04.000000', '2023-09-01 12:38:33.000000', '18263052', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(127, 'Azher Uddin Shayed', NULL, 'Male', '421 N heliotrope dr', 'Los Angeles', 'California', '90004', '2133522045', NULL, NULL, 'aushayed96@gmail.com', NULL, 1995, 28, NULL, 66, 145, 'Sylhet', 'Alhamdulillah', 'Single', NULL, NULL, NULL, 'F-1', NULL, NULL, NULL, NULL, NULL, 'Management Information Systems', 2023, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'India’s Restaurant', NULL, 50000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'No Preference,', 'Yes', 'No Preference', 'Yes', NULL, NULL, 'Md Shuab Ahmed', 'South Surma, Musargown', 'Sylhet', NULL, 'Bangladesh', '2133522045', 'aushayed96@gmail.com', 'Government Service Holder', NULL, 'Abdul Mannan', 'Uncle', '2139497831', NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', 'F07KYFJAzher_Uddin_Shayed_Resume.pdf', NULL, NULL, 5, 'VG5wUmVrMXFSVEE9', 'Inactive', 85, '2023-02-14 12:48:31.000000', '2023-10-19 14:52:42.000000', '15873678', NULL, NULL, NULL, NULL, NULL, NULL, 'KQ94PCBDFF0D8F2-DD07-4512-8311-D6D56BCC0845.jpeg,TCSO4F9DF158831-7706-45F4-B410-63094076F1DF.jpeg,UVVK0YZ66E43D37-5544-4C5F-B2BE-D0870F160B31.jpeg,EUSB7C709C7C6C7-7FAF-446E-BD79-69A9913968DA.jpeg', NULL, NULL, NULL, NULL),
(128, 'Sharafat Ali Sarker', NULL, 'Male', NULL, NULL, 'Georgia', NULL, '4704039921', NULL, NULL, 'Sharafat.sarker@gmail.com', NULL, 1983, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFhwQmExSllXbXhqYlVwb1ltMXplVTFEVlQwPQ==', 'Inactive', NULL, '2023-02-20 07:13:36.000000', '2023-02-20 07:13:36.000000', '30867760', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(129, 'Khaled Altawari', NULL, 'Male', NULL, NULL, 'Washington', NULL, '8059948248', NULL, NULL, 'khaltawari@gmail.com', NULL, 1996, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFVSVk1VMVVaekZOUkdNd1QwVjBNRWxSUFQwPQ==', 'Inactive', NULL, '2023-02-20 12:08:06.000000', '2023-02-20 12:08:06.000000', '33382103', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(130, 'Hesham Al-Esaei', NULL, 'Male', '2016 Modoc Rd', 'Santa Barbara', 'California', '93101', '8052599022', NULL, NULL, 'alesaeihe@gmail.com', 'https://www.linkedin.com/in/heshamal-esaei/', 1992, 31, NULL, 5, 7, 'Yemen', NULL, 'Single', NULL, NULL, NULL, 'Other', 'TPS/ Pending Asylum', 'Marchfield High School', 2010, 'Berea College', 2016, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Deckers Outdoor Corporation', 'Financial Analyst', 80000, 'Sunni', NULL, 'Daily prayers \nreading Quaran \nFasting \nvisiting Masjid', NULL, 'No', 'No', NULL, NULL, NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 15, 'Ahmed', NULL, NULL, NULL, 'Yemen', NULL, NULL, NULL, NULL, 'khaled Altawari', 'friend', '8059948248', NULL, NULL, NULL, NULL, NULL, NULL, '1835YO21.jpg', NULL, NULL, NULL, 5, 'VTFka2RtUkhSbXBqYmxaNllVUktRUT09', 'Inactive', 80, '2023-02-21 13:32:28.000000', '2023-04-16 09:59:51.000000', '71186284', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(131, 'Mohammed Bin Ahmed Bamatharaf', NULL, 'Male', NULL, NULL, 'Illinois', NULL, '+1 773 807 4138', NULL, NULL, 'Mohammedbamatraf13@gmail.com', NULL, 1987, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlVkV2FHRXpiR2xpUjJ4MVdrZFdlVkZFUlQwPQ==', 'Inactive', NULL, '2023-02-27 09:27:00.000000', '2023-02-27 09:27:00.000000', '71745652', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(134, 'Mohammed toky', NULL, 'Male', NULL, NULL, 'New York', NULL, '9295411171', NULL, NULL, 'Mdd979680@gmail.com', NULL, 2000, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZjNWIxbFhNWFJhVjFGNFRXbEZQUT09', 'Inactive', NULL, '2023-03-12 06:35:49.000000', '2023-03-12 06:35:49.000000', '47897567', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(135, 'Tafhimur Rahman', NULL, 'Male', NULL, 'Tuscaloosa', 'Alabama', NULL, '6592281449', NULL, NULL, 'tafhimur.rahman@gmail.com', NULL, 1994, 29, NULL, 68, 153, 'Cox’s Bazar, Bangladesh', 'N/A', 'Single', NULL, NULL, NULL, 'F-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFhwVk5FOUVVWGxXU0ZGcg==', 'Inactive', 24, '2023-03-19 05:18:35.000000', '2023-03-19 05:23:08.000000', '13548030', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(137, 'Arif Akondo', NULL, 'Male', NULL, 'Ronkonkoma', 'New York', NULL, '6315423532', NULL, NULL, 'a.arif4@yahoo.com', NULL, 1995, 29, NULL, 69, 165, 'Bangladesh', 'No known health issues', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Rajshahi College, BD', 2013, 'Baruch College - CUNY', 2019, 'Taxation', 2023, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'PwC, LLP', 'Senior Associate', NULL, 'Sunni', NULL, 'Daily prayers, daily masjid visit, try to maintain halal means and avoid all major sins', NULL, 'No', 'No', 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya,', 'No', 'Own Ethnicity', 'Bangladeshi', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 5, 'MD Sonaullah', NULL, NULL, NULL, NULL, '6462503479', 'mdsonaullah60@gmail.com', 'Retired Teacher', NULL, 'Md R Hasan', 'Brother', '2123808144', NULL, NULL, NULL, NULL, NULL, NULL, 'HZMDHZD7FBA7A68-5035-47E4-A762-CEDA4FC5C8B5.jpeg', 'Z6E1QSYArif_-_Resume_-_(Adjunct).pdf', NULL, 'UHU9DEW017D5EEB-1A5D-41D3-A360-DFBA6983B17D.jpeg', 5, 'VTIxb2FHSlhWbk5aVlVGNFRVUkZQUT09', 'Deactivated', 95, '2023-03-27 17:24:22.000000', '2024-03-06 13:43:49.000000', '79630743', '63,151,160,196,42,46,93,173,176,185,', '60,50,50,50,40,40,40,40,40,40,', '51,48,45,42,151,46,63,185,188', NULL, NULL, '6YMX7U6Arif_-_Signature.png', 'L7RVR28BABB1DF2-58EA-433F-8602-572AB47C7548.jpeg,28TC20Q2412AA40-7AD1-448D-8574-53B6876E76A0.jpeg,D0GZDVD3ED0874A-461C-44FA-B3F2-9DF44BCD698E.jpeg,IEELLDV2F8D1B4A-7639-436C-A642-B834DB67F425.jpeg', NULL, NULL, '46,33,45,48,50,51,63,70,82,42,93,103,77,84,100,102,151,160,164,162,176,185,188,173,196,', NULL),
(138, 'Muaj Ahmed', NULL, 'Male', 'East Milnor Avenue', 'Buffalo', 'New York', '14218', '7169943947', NULL, NULL, 'muajmetro454@gmail.com', NULL, 1995, 28, NULL, 67, 187, 'Sylhet, Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Modan Mohan Collage, Sylhet', 2014, 'Metropolitan University, Sylhet', 2019, 'Trine University, Detroit', 2023, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,H1B,EAD,', NULL, 'No Preference,', 'Yes', 'No Preference', 'No Preference', 1, 20, 'Mohammad Amin', '20854 Cyman Ave', 'Warren', 'Michigan', 'United States', '586 218 4880', NULL, NULL, NULL, NULL, NULL, NULL, 'Samia Begum', 'Sister', '7165415839', NULL, NULL, NULL, 'RJ5DE4LIMG-20230728-WA0017.jpg', '6PVSKIABiodata_of_Muaj_Ahmed.pdf', NULL, 'Y7BVO85Passport_of_Muaj_Ahmed.pdf', 5, 'VkZoV2RWbFZRazVoYWtVOQ==', 'Deactivated', 87, '2023-03-28 17:18:20.000000', '2024-05-18 02:58:59.000000', '59765255', '42,46,63,70,77,84,93,151,158,160,', '40,40,40,40,40,40,40,40,40,40,', '45,50,48,46,51,63,70,77', NULL, NULL, 'X1BBI7I20230328_235059_1500.0.jpg', '5QQUGZOIMG-20230728-WA0017.jpg,A8LOY5SIMG-20230728-WA0009.jpg,J2V3KR320221225_144006.jpg,UNXBGA5IMG-20230728-WA0005.jpg', NULL, NULL, '33,45,50,46,48,51,63,70,82,42,77,84,93,100,102,103,133,151,158,160,148,', NULL),
(139, 'Md Al Amin', NULL, 'Male', NULL, NULL, 'Ohio', NULL, '7407311457', NULL, NULL, 'aa467322@ohio.edu', NULL, 1997, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSQmQwcFhlSFprYTFVOQ==', 'Inactive', NULL, '2023-04-01 12:31:20.000000', '2023-04-01 12:31:20.000000', '21792752', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(140, 'Aasim Azad', NULL, 'Male', NULL, 'Fort Bragg', 'North Carolina', NULL, '7034735787', NULL, NULL, 'aasimazad47@gmail.com', NULL, 1989, 34, NULL, 65, 150, 'United Arab Emirates', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Ibn Seena English High School', 2006, 'Chemistry', 2012, 'Forensic Science', 2015, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'North Carolina (Federal Employee on Army Base)', 'IT Specialist', 63736, 'Shi’ite', NULL, 'Daily Praying, Daily Reading Quran, fasting during Ramadan always, Other important days praying at home.', NULL, 'Yes', 'No', 'Shi’ite', NULL, 'Daily Praying, Daily Reading Quran, fasting during Ramadan always.', 'Headscarf,', 'No', 'Own Ethnicity', 'Other', 'US Citizen,Permanent Resident,', NULL, 'Single,Divorced,', 'No', 'No Preference', 'No Preference', 1, 7, 'Mehmood Husain Azad', NULL, NULL, NULL, NULL, '+971506464924', 'mazad@eim.ae', NULL, NULL, 'Mehmood Husain Azad', 'Father', '+971506464924', 'Zehra Fatima Azad', 'Mother', '+971503891019', 'Nuzhat Husain', 'Aunt', '336-509-3274', 'anonymous.png', NULL, NULL, 'HLR7IGLAASIM_AZAD_ID.jpg', 5, 'VVcxNGFGcEhWVEJPZVVVOQ==', 'Inactive', 95, '2023-04-07 10:55:39.000000', '2023-04-07 11:56:36.000000', '78568151', '63,82,46,48,70', '40,30,20,20,20', '48,46,51,45,63', NULL, NULL, 'XIGGMR2Signature.jpg', 'CMK7JTI1588968873424.jfif,81QOLTIMyself_2.jpg,HT99J4YMyself_4.jpg,HBBTCABMyself_3.jpg', NULL, NULL, '45,51,46,48,50,63,82,70', NULL),
(141, 'Faruk Ahmed', NULL, 'Male', NULL, NULL, 'New Jersey', NULL, '9739316147', NULL, NULL, 'bornaly@gmail.com', NULL, 1973, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'U1ZWYWFHTnRjelJPVkZreQ==', 'Inactive', NULL, '2023-04-08 05:09:39.000000', '2023-04-08 05:09:39.000000', '38815206', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(142, 'Arif', NULL, 'Male', NULL, 'no', 'Mississippi', NULL, '5862378255', NULL, NULL, 'arif31mashfi@gmail.com', NULL, 1997, 26, NULL, 69, 146, NULL, NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Lotus School for Excellence', 2015, 'University of Toronto', 2019, 'Biostatistics', 2022, NULL, NULL, 'MD in US Medical School- Class of 2026', 2022, 'Masters', 'No', NULL, NULL, 1, 'Sunni', NULL, 'daily prayers, fasting, attends halaqas and masjid programs. Hafidth ul Quran', 'N/A', 'Yes', 'No', 'Sunni', NULL, 'minimum daily prayers', 'Headscarf,', 'No', 'Own Ethnicity', NULL, 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 6, 'Naheed Sultana', NULL, 'Mississauga, Ontario', 'Ohio', 'Canada', '2894007587', 'arifmashfi31@gmail.com', 'Homewife. Husband is software engineer', 'Family lives in Canada, but visits me often in Michigan.', 'Nafisa Sarowar', 'Sister', '2894007567', NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, 'G1B43THIMG_0909.jpg', 5, 'VVcxc2MySkhSbTlOZWtWbw==', 'Deactivated', 92, '2023-04-08 09:27:59.000000', '2023-05-04 18:18:37.000000', '64258134', '51,48,63,50,46,', '60,50,50,40,30,', NULL, NULL, NULL, 'Z4ONOU1signature.png', 'O3CI8FXE2875171-447E-4B22-A810-E30B7CACB250.JPG,RM42AGSimage.png,NTYSQ8Dfsdfsdf.png,7PDDHSNdfsef.png', NULL, NULL, '45,51,48,50,46,63,', NULL),
(143, 'S M Zia Ur Rashid', 'Rafi', 'Male', '2747 E 4th St', 'Tulsa', 'Oklahoma', '74104', '(539) 222-0503', NULL, NULL, 'smziaurrashid@gmail.com', 'https://ziaurrashid.com', 1997, 26, NULL, 164, 152, 'Chittagong, Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Abdus Sobhan Rahat Ali High School', 2012, 'B.Sc. in EEE, International Islamic University Chittagong', 2019, 'Cyber Security', 2024, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Paycom', 'Application Security Analyst', 90000, 'Sunni', NULL, 'Try to practice Islam in daily life actively; enjoy studying Islamic literature and comparative Islamic studies.', NULL, 'No', 'No', 'Sunni', NULL, 'Observes Islamic principles in daily life, including regular prayer, fasting and hijab in front of non-mahram individuals.', 'Headscarf,Niqab,', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,EAD,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 8, 'S M Harun Or Rashid', 'Monu Sikder Bari, Naikhain', 'Patiya', NULL, 'Bangladesh', '01830085520', 'harun@ziaurrashid.com', 'Polli Doctor', 'Family lives in Bangladesh.', 'Shahidul Islam Tarek', 'Former President, BICS IIUC', '+447518139895', NULL, NULL, NULL, NULL, NULL, NULL, 'RRLH2WVZia-1.jpg', 'SHISJ4GBiodata_-_Zia.pdf', NULL, 'YC2A2ZVpassport.jpg', 5, 'VFdwVk5FMUVVVEpSUjJ4R1VsVlZQUT09', 'Active', 97, '2023-04-15 06:43:06.000000', '2024-05-22 03:58:43.000000', '34832379', '63,160,208,42,70,77,93,151,158,173,', '50,50,50,40,40,40,40,40,40,40,', '100,45,77,70,157,151,188', NULL, NULL, 'QIY3UWSsignature.png', 'K9T5HZXZia-1.jpg,7Q40F6SZia-2.jpg,R9HV9IRZia-5.jpeg,APY9S22Zia-4.jpg', NULL, NULL, '48,63,70,82,46,42,93,100,77,84,102,103,45,109,133,151,158,160,164,162,176,185,188,180,173,148,208,', NULL),
(144, 'TAHSIN KALAM', NULL, 'Male', 'near Masjid Eesa', 'Hollis', 'New York', '11423', '9179325742', NULL, NULL, 'KALAM.TAHSIN@GMAIL.COM', NULL, 1993, 30, NULL, 68, 155, 'Sylhet, Bangladesh. Raised in Queens, NY', 'none', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'City-As-School', 2011, 'Baruch CUNY - BBA', 2021, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Accenture', 'Consultant', 109800, 'Sunni', NULL, 'Alhamdullilah, I pray all 5 daily prayers consistently and on time. I have been blessed to offer Fajr and Isha at the masjid for more than one year even when I am traveling. I attend halaqas and events with the intention of seeking knowledge and keeping close ties with good brothers. The masjid is right next door, so I frequently visit and also volunteer whenever I can. I\'m on a journey of Tazkiyyah seeking closeness to Allah and Quran is a big part of my life.', NULL, 'Yes', 'No', 'Sunni', NULL, 'I\'m looking for someone who practices out of a love for Allah SWT. Someone who has a sincere bond with our Creator, where she feels that He\'s near to her. \nThe 5 daily prayers, on time and a relationship with Quran.', 'Headscarf,', 'No', 'Own Ethnicity', 'Bangladeshi', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 7, 'Abul Kalam', NULL, 'hollis', 'New York', 'united states', '3476243135', 'tamim74@gmail.com', 'Business Owner / Retired', NULL, 'Zakareeya Baksh', 'Shaykh, Neighbor & Friend', '3473553760', 'Abul Kalam', 'Father', '3476243135', 'Tariq Lallmohamed', 'Friend', '9174034233', 'UIRIEL1WhatsApp_Image_2023-10-24_at_2.25.59_PM_(1).jpeg', 'MA7J9BGBiodata_Tahsin_Kalam.pdf', NULL, 'EX9JYMY20231028_081111.jpg', 5, 'VTFjNWQyRlhkSEJpUnpoNFMyYzlQUT09', 'Deactivated', 97, '2023-04-25 09:45:29.000000', '2023-11-28 14:24:47.000000', '49980384', '164,42,63,84,93,133,158,160,70,82,', '60,50,50,50,50,50,50,50,40,40,', '45,82,103,151,42,133,164', NULL, NULL, 'WK02S4B20231028_081726.jpg', 'OY1UR6YWhatsApp_Image_2023-10-24_at_2.25.57_PM.jpeg,QCZCUYWWhatsApp_Image_2023-10-24_at_2.25.59_PM_(2).jpeg,W2HIEEBWhatsApp_Image_2023-10-24_at_2.25.59_PM_(3).jpeg,53HTPTCWhatsApp_Image_2023-10-24_at_2.25.59_PM.jpeg', NULL, NULL, '42,45,63,84,93,133,82,103,151,46,77,158,160,164,70,', NULL),
(145, 'Md Riyad Uddin', NULL, 'Male', NULL, NULL, 'New Jersey', NULL, '2132070236', NULL, NULL, 'rasel.cslit@gmail.com', NULL, 1994, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZoT2ExcHJRWGhOYWswdw==', 'Inactive', NULL, '2023-05-19 18:15:30.000000', '2023-05-19 18:15:30.000000', '47237659', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(147, 'Shaim Hasan', NULL, 'Male', NULL, 'Yonkers', 'New York', NULL, '3475159146', NULL, NULL, 'shaim.ny@gmail.com', NULL, 1998, 25, NULL, 65, 160, 'Dhaka,Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'Other', 'Asylum seeker', 'Bronx academy of health careers', 2017, 'The City College of New York', 2022, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Adora - California US', 'Software engineer', 110000, 'Sunni', NULL, 'I try to observe all my daily prayers and attend isha and fajr at the masjid. I am part of Young Muslim (YM) westchester chapter and attend regular halaqas. Being connected to the masajid is very important to me and my spirituality.', NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 10, 'Mohammad Miah', NULL, 'Yonkers', 'New York', 'United States', '3474507873', 'Shaim.nyc@gmail.com', 'Fire safety inspector', 'My dad is an absolutely humble,  loving, pious and smart individual. Always got a smile on his face no matter what. Alhamdulillah my mom is the same. I have a younger brother who’s 21 studying pre med and a younger sister who’s 6 years old in kindergarten. Love my little sister to death and we are inseparable.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlRKbk0wNVVSVFZQVkdkbw==', 'Inactive', 87, '2023-05-29 18:13:12.000000', '2023-05-29 19:07:35.000000', '54139077', NULL, NULL, NULL, NULL, NULL, NULL, 'BOOZVY915CB8CD2-2FEA-4FCC-9B37-7DF828A70401.jpeg,XAR22WPC6B30113-6CDB-4DC5-B84E-CB740F10207B.jpeg,SB8U2009BB60368-17E0-4EFA-AB7F-9122F427174C.jpeg,LWM26OK3B5FCE6F-366C-412A-BC69-3F78EF7AD84B.jpeg', NULL, NULL, NULL, NULL),
(148, 'Nurul Islam', 'Sumon', 'Male', '12150 Lumpkin st', 'Hamtramck', 'Michigan', '48212', '5863457836', '5863457836', '5863457836', 'nurulislam151993@gmail.com', 'https://www.facebook.com/Engr.N.I.Sumon?mibextid=ZbWKwL', 1993, 30, NULL, 68, 76, 'Moulvibazar, Sylhet', 'Slim', 'Single', NULL, NULL, NULL, 'Student Visa', NULL, NULL, 2016, NULL, 2020, NULL, 2023, NULL, 2023, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,H1B,EAD,', NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 1, 10, 'Abdus Sukur', 'Kulaura street', 'Kulaura', NULL, 'Bangladesh', '1745143214', 'nisumon72@gmail.com', 'Retired', NULL, 'Rumon Ahmed', 'Friend', '(313)7076316', 'Aziz Ahmed', 'Brother', '313-707-1986', 'Shahid Ahmed', 'Brother', '(313)3279509', 'LB6RSHZ0fc0c55bdde2a46dc3ee03cfe517acb9_1692231097080_0.jpeg', 'KBAUND0Nurul_Islam-1.pdf', NULL, 'YPBKRZ7Id.jpg', 5, 'VFZSSmVsVllaR3haV0U1clVVRTlQUT09', 'Active', 92, '2023-06-02 20:48:40.000000', '2024-04-14 15:09:36.000000', '84493024', '63,160,180,208,42,70,77,84,93,151,', '50,50,50,50,40,40,40,40,40,40,', '45,50,48,46,51,63,70,42,77,160', NULL, NULL, 'CPCDCX2Id.jpg', 'BKY7WFD1698260335331.jpg,6E2OAELIMG-20230714-WA0007.jpg,JX35XVU0fc0c55bdde2a46dc3ee03cfe517acb9_1692231097080_0.jpeg,0EJE2HEFB_IMG_1685776753812.jpg', NULL, NULL, '45,50,51,46,48,63,70,82,42,77,84,93,100,102,103,133,151,158,160,164,162,188,180,173,148,208,', NULL),
(149, 'Azharul Islam', NULL, 'Male', NULL, NULL, 'Texas', NULL, '9899549054', NULL, NULL, 'azharecondu@yahoo.com', NULL, 1991, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZWQmEySlVRWGhPYW1jelRVUkJORTVFVlhvPQ==', 'Deactivated', NULL, '2023-06-08 03:54:12.000000', '2023-06-08 03:54:12.000000', '64468602', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(150, 'Md Helal Hossen', NULL, 'Male', NULL, NULL, 'Texas', NULL, '2149409440', NULL, NULL, 'helal.h0174@gmail.com', NULL, 1993, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVcxR2RWb3llR2hhUjFaNllVVkJlRTFxVFRBPQ==', 'Inactive', 21, '2023-06-09 09:38:29.000000', '2023-06-09 09:40:30.000000', '53576239', NULL, NULL, NULL, NULL, NULL, NULL, 'WGUS63624E9DFDE-04D8-41B4-B041-DAFF9E593DD7.jpeg,11J16MO869AF31A-330A-4A70-A290-A3E2B62F37FE.jpeg,YJ7HTS83D225BD9-B17E-41E4-8E2E-50040636D4DD.jpeg,DH6A7L1C63A8D9E-93EF-45A6-8ABD-177D119A5E1D.jpeg', NULL, NULL, NULL, NULL),
(151, 'Hanif Mohammed', 'Shakin', 'Male', '5015 Sobieski', 'Hamtramck', 'Michigan', '48212', '(313) 661-2572', '(313) 661-2572', '(313) 661-2572', 'hanifmohmmed526@gmail.com', NULL, 2001, 22, NULL, NULL, NULL, 'Sylhet', NULL, 'Single', NULL, NULL, NULL, 'Permanent Resident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVVkMGNHSnRZekZPYWxVOQ==', 'Inactive', 19, '2023-06-13 19:09:29.000000', '2023-06-13 19:10:56.000000', '70335855', NULL, NULL, NULL, '299', NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(152, 'Junad ahmed', NULL, 'Male', NULL, 'Hamtramck', 'Michigan', NULL, '(306) 519-7926', NULL, NULL, 'junadahmed21@gmail.com', NULL, 1996, 27, NULL, NULL, NULL, 'Barlekha,sylhet', 'No', 'Single', NULL, NULL, NULL, 'Other', 'Immigrant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, NULL, 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Afjal', 'Cousin', '(586) 328-8270', 'Abdul matik', 'Uncle', '(313) 775-5463', 'Saju', 'Brother', '(313) 788-2147', 'anonymous.png', NULL, NULL, NULL, 5, 'VTI1V2RWRkhVVEZPYWxVeVQxUnJQUT09', 'Inactive', 63, '2023-06-14 02:05:15.000000', '2023-06-14 02:18:12.000000', '13069744', NULL, NULL, NULL, NULL, NULL, NULL, 'YSKPDTVIMG_0444.jpeg,3YT1B6RIMG_0087.jpeg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(153, 'Md Kafil Uddin', NULL, 'Male', NULL, NULL, 'Pennsylvania', NULL, '2167276166', NULL, NULL, 'kafiluddin505@gmail.com', NULL, 1996, 27, NULL, NULL, 144, 'Noakhali, Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFVSRk0wOUVSWGROYWxwQ1dXMU9hMXBWUVQwPQ==', 'Inactive', 19, '2023-06-14 04:15:31.000000', '2023-06-14 04:20:08.000000', '46771803', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(154, 'MUHAMMAD REDWANUZZAMAN', NULL, 'Male', NULL, NULL, 'Michigan', NULL, '3474016423', NULL, NULL, 'arafat9090@gmail.com', NULL, 1988, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkRJMWMyRlhOV3hOZWtsNFNWRTlQUT09', 'Inactive', NULL, '2023-06-14 17:34:46.000000', '2023-06-14 17:34:46.000000', '53211951', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(155, 'Syed Samsul Arefin', 'Sami', 'Male', '2720 152nd AVE NE', 'Redmond', 'Washington', '98052', '12065365332', NULL, '12065365332', 'ssarefin@gmail.com', NULL, 1989, 34, NULL, 5, 4, 'Habiganj', NULL, 'Single', NULL, NULL, NULL, 'Permanent Resident', NULL, 'Gobindapur Govt. High School', 2005, 'University of Manitoba', 2013, 'Computer Science', 2017, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Microsoft', 'Senior Software Engineer', 250000, 'Sunni', NULL, 'Very practicing', NULL, 'No', 'No', 'Sunni', NULL, 'Practicing', 'No Preference,', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,H1B,EAD,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 8, 'Self', '2720 152nd Ave NE\nApt 655', 'Redmond', 'Washington', 'United States', '12065365332', 'ssarefin@gmail.com', NULL, 'Both parents have passed away', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVRKa2NVMXRNVVJhYmxJMFpWVkJQUT09', 'Inactive', 78, '2023-06-22 11:51:15.000000', '2023-06-22 12:08:53.000000', '33403105', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(156, 'test', NULL, 'Male', 'addreess', NULL, 'New York', NULL, '01304748805', NULL, NULL, 'Nuhanctea@gmail.com', NULL, 1999, 24, NULL, NULL, NULL, NULL, NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, 1, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, 'A companion of the Quran who establishes her 5 daily prayers in a timely manner, and always striving to become a better Muslim and closer to Allah SWT; a spouse who follows the guidance of the Quran and the Sunnah, and always looking to further develop herself spiritually and intellectually. Moreover, I’m in search of an emotionally intelligent spouse who’s affectionate, tender, and loving, and upholds and embodies the sacred values of modesty and shyness.', 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'I come from an educated and religious family background. Both of my parents hold postgraduate degrees, and my older sibling is a Mechanical Engineer.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVRKb2NHUklVbWhhTWpsMVdqQkJNazVVUlRCTlJGRTk=', 'Deactivated', 63, '2023-06-27 04:38:50.000000', '2023-08-17 20:15:03.000000', '74813115', '63,70,48,46,82,', '50,40,30,20,20,', NULL, NULL, NULL, NULL, '8PP73TCIMG_7779.jpeg,JSCH5WGIMG_7778.jpeg,gallery3.jpg,gallery4.jpg', NULL, NULL, '63,51,48,46,70,82,', NULL),
(157, 'Md Abdullah Al Mahmood', NULL, 'Male', NULL, NULL, 'Texas', NULL, '4096782895', NULL, NULL, 'almahmood75@hotmail.com', NULL, 1975, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VWtoQ2RFNTZWa0ZVVnpBOQ==', 'Inactive', 12, '2023-07-05 18:46:18.000000', '2023-07-05 18:48:30.000000', '36604842', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(158, 'abdul khan', NULL, 'Male', NULL, NULL, 'New Jersey', NULL, '2016161397', NULL, NULL, 'abdulikhannt@gmail.com', NULL, 1989, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VTI1V2VtUkhiR3BhVkVwQg==', 'Inactive', NULL, '2023-07-12 09:24:29.000000', '2023-07-12 09:24:29.000000', '31449281', NULL, NULL, NULL, '290', NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(159, 'MD Shahriar Abdullah', NULL, 'Male', '1095 Iowa St', 'Beaumont', 'Texas', '77705', '8327193720', NULL, NULL, 'ce.shahriar@gmail.com', NULL, 1996, 27, NULL, 70, 180, 'Kushtia', NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sunni', NULL, 'Practising', NULL, 'No', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No Preference', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 7, 'Humayun Kobir Islam', '87-32 252nd Street\nBellerose, NY 11426', 'New York', 'New York', 'Nassau', '917 257 6247', 'hkobirislam@gmail.com', 'Architect', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VW01S2JGcFZRVEZQUkZVMA==', 'Inactive', 65, '2023-07-12 16:39:00.000000', '2023-07-12 16:56:31.000000', '39071688', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(160, 'Alade Aroworowon', 'None', 'Male', '12710 Brant Rock Dr.', 'Houston', 'Texas', '77082', '2819659900', '2819659900', '2819659900', 'ejiremi@yahoo.com', 'None', 1975, 48, NULL, 200, 183, 'Lagos', 'Healthy', 'Single', NULL, NULL, NULL, 'Permanent Resident', NULL, 'WASC', 1991, 'Computers', 1998, 'Psychology, Computer systems', 2022, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Petroleum industry', 'Tech.', 80000, 'Other', NULL, 'Striving in the path of Rasoolullah ( SAW)', NULL, 'Yes', 'No', 'Other', 'Muslim', 'Practicing in accordance with Sunnah Rasoolulah (SAW).', 'Headscarf,Jelbab/Abaya,', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,Widowed,', 'No', 'No Preference', 'Yes', NULL, NULL, 'None', 'None', 'None', 'Texas', 'USA', '2819659900', 'ejiremi@yahoo.com', 'None', 'None', 'Olawale Olanrewaju', 'Friend', '2252885992', 'Chaadi', 'Friend', '7135394442', 'Rafay', 'Friend', '8328631819', 'SUH7U98IMG_0385.jpeg', NULL, NULL, NULL, 5, 'VTFoc2FHUXlPVzFoVjNob1drZFdiV0ZYUld0TlVUMDk=', 'Active', 92, '2023-07-18 10:47:34.000000', '2024-01-21 01:47:29.000000', '77579117', '63,208,46,151,157,160,207,42,70,77,', '40,40,30,30,30,30,30,20,20,20,', NULL, '109', NULL, 'ZF9OII1IMG_0455.jpeg', '2ZUG90NIMG_9761.png,RWYUL9QIMG_9823.png,H0USL10IMG_9826.png,CVZU99YIMG_9813.png', NULL, NULL, '63,46,70,82,48,42,77,103,84,93,100,102,45,133,151,160,162,164,157,185,188,180,196,148,208,207,', NULL);
INSERT INTO `UserApp_maleuser` (`userId`, `fullName`, `nickName`, `gender`, `address`, `city`, `state`, `zip`, `cellPhone`, `workPhone`, `homePhone`, `email`, `personalWebsite`, `birthYear`, `age`, `dateOfBirth`, `height`, `weight`, `placeOfBirth`, `health`, `maritalStatus`, `children`, `childrenNumber`, `childrenAges`, `immigrationStatus`, `immigrationStatusOther`, `highSchool`, `highSchoolYear`, `bachelors`, `bachelorsYear`, `masters`, `mastersYear`, `doctorate`, `doctorateYear`, `otherDegree`, `otherDegreeYear`, `highestEducation`, `employed`, `employment`, `position`, `income`, `religiousPractice`, `religiousPracticeOther`, `religiousPracticeBrief`, `revertTime`, `beard`, `smoker`, `preReligious`, `preReligiousOther`, `preReligiousBrief`, `preWear`, `preSmoking`, `preEthnic`, `preEthnicSpecific`, `preImmigrationStatus`, `preImmigrationStatusOther`, `preMaritalStatus`, `preChildren`, `preEducation`, `preEmployment`, `preIncome`, `preAgeGap`, `guarName`, `guarAddress`, `guarCity`, `guarState`, `guarCountry`, `guarPhone`, `guarEmail`, `guarProfession`, `familyBrief`, `refName1`, `refRelation1`, `refPhone1`, `refName2`, `refRelation2`, `refPhone2`, `refName3`, `refRelation3`, `refPhone3`, `photo`, `cv`, `album`, `govIssuedId`, `matchShowLimit`, `userPass`, `status`, `profileCompleteness`, `openingDate`, `lastEdit`, `userToken`, `matchId`, `matchPercentage`, `reqAccepted`, `reqRejected`, `reqSent`, `signature`, `gallery`, `tempGallery`, `lockedId`, `cuMatchId`, `reqLock`) VALUES
(161, 'Arafat Hossain Shuvo', NULL, 'Male', NULL, NULL, 'California', NULL, '3103676758', NULL, NULL, 'ahshuvo_92@hotmail.com', NULL, 1992, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVZkNGNGcHRSa0ZOYWtGM1RVRTlQUT09', 'Deactivated', NULL, '2023-08-03 19:51:37.000000', '2023-08-03 19:51:37.000000', '12566201', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(162, 'Ayon Islam', NULL, 'Male', NULL, 'Brooklyn', 'New York', NULL, '7184080263', NULL, NULL, 'aislam0753@bths.edu', NULL, 1999, 24, NULL, NULL, NULL, 'NYC', 'None', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Brooklyn Tech', NULL, 'City College, Brooklyn College', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, 'Attending halaqa, part of icna and YM, stopped listening to music, try my best to practice deen and good akhlaq', NULL, 'Yes', 'No', 'Sunni', NULL, 'No guy friends, has taqwa of Allah, has private social media accounts', 'Headscarf,', 'No', 'Own Ethnicity', 'Bangladeshi', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVVWU2JGcFhOWFprYlZaNVdraFdkV1ZYUlhkUFZHYzk=', 'Inactive', 63, '2023-08-07 02:59:09.000000', '2023-08-12 15:00:13.000000', '33183313', NULL, NULL, NULL, '290', NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(163, 'Abdul', NULL, 'Male', NULL, 'Philadelphia', 'Pennsylvania', '19104', '2675959383', NULL, NULL, 'asbchemical@gmail.com', NULL, 1979, 44, NULL, 64, 152, NULL, NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WXpKb2FGbFhVbkJSUmxaVVVWUnJNMDEzUFQwPQ==', 'Inactive', 24, '2023-08-08 13:07:24.000000', '2023-08-08 13:09:42.000000', '40619973', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(164, 'Mijanur Rahman', NULL, 'Male', NULL, NULL, 'New York', NULL, '3475416141', NULL, NULL, 'shamimnyusa@gmail.com', NULL, 1976, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVRKb01XSnRaR2hrUjFveFpGZFNiR1F3UVRST1p6MDk=', 'Inactive', NULL, '2023-08-11 23:27:06.000000', '2023-08-11 23:27:06.000000', '40246435', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(165, 'Mohammad', NULL, 'Male', NULL, 'Columbus', 'Ohio', '43202', '408-833-5326', NULL, NULL, 'Yeasin00@gmail.com', NULL, 1982, 41, NULL, 69, 120, 'Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Santa Clara', 2000, 'BBA', 2008, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', NULL, NULL, 69000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No Preference,', NULL, 'Single,Divorced,Widowed,', 'Yes', 'No Preference', 'No Preference', 1, 20, 'Abdul momin', NULL, NULL, NULL, NULL, '7023700770', 'Abhuiyan@yahoo.com', NULL, NULL, 'Abdul motin', 'Brother', '4086748932', NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', 'ZGHDSEMBIODATA_Yeasin.doc', NULL, '9B3D5E720230705_183621.jpg', 5, 'VmtjNWRXRlhNV2hOUkVGcg==', 'Inactive', 85, '2023-08-12 15:16:43.000000', '2023-08-12 15:43:59.000000', '41050772', NULL, NULL, NULL, NULL, NULL, 'OA67M3V20230705_183621.jpg', 'R2HJY8320230702_200749.jpg,5UG141Jreceived_732634138599641.jpeg,3QDV61Areceived_1267135777531570.jpeg,2U9C7MTreceived_685075943416843.jpeg', NULL, NULL, NULL, NULL),
(166, 'Mahirul Islam', 'Mahi', 'Male', '10 Newport Avenue', 'Somerset', 'New Jersey', '08873', '2019208312', NULL, '2017411870', 'mahirulislam11@gmail.com', NULL, 1999, 24, NULL, 178, 75, 'Brooklyn, NY', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Teaneck High School', 2017, 'Computer Science', 2021, 'Computer Science', 2023, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Lockheed Martin', 'Systems Engineer', 1, 'Sunni', NULL, 'Daily prayers, Fasting, Hafiz, Lead Taraweeh during Ramadan, Attend Masjid programs/events', NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 4, 'Sultana Razia', '10 Newport Avenue', 'Somerset', 'New Jersey', 'United States', '2017411870', 'sultanarazia1@hotmail.com', 'Food Services', NULL, 'Merazul Islam', 'Brother', '7185145854', NULL, NULL, NULL, NULL, NULL, NULL, 'IUDZR00IMG_0128.jpeg', '98E97GUResume22-23.pdf', NULL, 'AZL4ZZBMahirulIslamLicenseFront.jpeg', 5, 'VFhwSmFGUllWbnBpUjJ4MFkzYzlQUT09', 'Active', 92, '2023-08-13 16:52:19.000000', '2024-03-28 08:07:41.000000', '76744825', '158,173,185,63,70,160,180,201,209,42,', '60,60,60,50,50,50,50,50,50,40,', '133,45,158,70,157,176', NULL, NULL, 'J1Z7YOWIMG_0505.jpeg', 'RTKYKMHIMG_0130_2.jpeg,HQQDEHMIMG_2203.JPG,gallery3.jpg,gallery4.jpg', NULL, NULL, '100,63,42,82,84,93,102,103,77,46,45,109,70,133,151,158,160,164,162,176,185,188,180,173,193,201,148,209,', NULL),
(167, 'Mohammed', NULL, 'Male', NULL, NULL, 'California', NULL, '4374297318', NULL, NULL, 'sis.athiyaa@gmail.com', NULL, 1996, 27, NULL, 70, NULL, 'India', 'None - Alhamdulillah', 'Single', NULL, NULL, NULL, 'Other', NULL, NULL, 2014, NULL, 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', 'Stacy and Witbeck', 'Engineer', 125000, 'Sunni', NULL, NULL, NULL, 'Yes', NULL, 'Sunni', NULL, NULL, 'Headscarf,Niqab,', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 22, 'Mohammed', NULL, 'Windsor', 'California', 'Canada', '4374296318', 'athiyahmd@gmail.com', 'Business', NULL, 'Athiya', 'Mother', '4169079086', 'Friend', 'Ehtesham', '6474820972', 'Viqar', 'Friend', '6478901965', 'anonymous.png', NULL, NULL, NULL, 5, 'VGpCT2VWcFlUbXBhVnpVd1MyYzlQUT09', 'Inactive', 70, '2023-08-14 03:26:15.000000', '2023-08-14 03:36:30.000000', '38256833', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(168, 'Abdur Rahim Bhuyan', 'Rohan', 'Male', '189,Forbell st', 'Brooklyn', 'New York', '11208', '3474358477', '3474358477', '3474358477', 'abrohimbhuiyan333@gmail.com', 'https://m.facebook.com/joybhuiyan.joybhuiyan.5?mibextid=LQQJ4d&wtsid=rdr_0qqH6JRGh8V7HwlAf', 2001, 22, NULL, 67, 158, 'Bangladesh,Chittagong', 'Healthy', 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Morkota Islamia Alim Madrasah', 2020, 'Washington university of technology college', 2021, NULL, NULL, NULL, NULL, 'Experts in recitation Quran', 2022, 'Bachelor', 'Yes', 'Lawyer farm', 'As an assistant', 50, 'Sunni', NULL, 'Practicing Sunni Muslim', NULL, 'Yes', 'No', 'Sunni', NULL, 'Must be pious', 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 5, 'Mawlana Abdul Mannan Bhuiyan', 'Chauddagram', 'CUMILLA', 'New York', 'Bangladesh', '3474358477', 'bhuyana162@gmail.com', 'Retired professor', 'I\'d be happy to tell you about my family!\"My family consists 6] members.\" There\'s my [parants], my [two  brother and three siste], and myself \"My [father is a retired arabic professor.He really enjoy hobby. My [two brother] in qatar and they have their own business . \"We often go family tour which is something  we all love doing together.\" We\'re a close-knit family, and we always support each other through thick and thin.\"That\'s a bit about my family! If you w', 'Kamal Uddin', 'Brother', '(929) 422-2664', 'Asma AKTER', 'Sister', '9294222664', 'Lutfur  Rahman', 'Brother', NULL, 'GIN4SIJ352754892_1319180038673665_5533407171980524047_n.jpg', '886OOKFCurriculum_vita_of_Abdur_Rahim_Bhuyan.pdf', NULL, 'R7DCUTP5D254B34-0BC0-4EE8-A08F-F43D47A2A970.jpeg', 5, 'VVZkS2VXSXlhSEJpVkVsM1RVUktRUT09', 'Active', 97, '2023-08-15 19:59:20.000000', '2024-01-03 19:23:12.000000', '13226241', '63,77,180,70,151,158,160,173,185,208,', '50,50,50,40,40,40,40,40,40,40,', '102,100,77,63,103,70,45,133,151,157,176', NULL, NULL, NULL, 'FAKWGVSBB26611D-3195-4D2A-A9E7-8F74F2653114.jpeg,G9DSC8E03E36838-4691-43B3-AF0D-E17B91144F10.jpeg,R7O2OP9410BFBA6-EF1B-49EE-8615-8D142788CBC8.jpeg,5RN35K039864CB3-5D2C-4679-BCC3-33C88E63345B.jpeg', NULL, NULL, '63,77,100,102,103,42,84,93,46,82,45,70,109,133,151,158,160,162,164,176,185,188,180,173,148,208,', NULL),
(173, 'Sajid Hoque', 'Sajid', 'Male', '16416 86th Road', 'Jamaica', 'New York', '11432', '3478545629', NULL, NULL, 'Potentials101@gmail.com', NULL, 1994, 29, NULL, 67, 150, 'New York, USA', 'N/A', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Francis Lewis High School', 2012, 'Pace University', 2016, 'MBA', 2022, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Banking', NULL, 100000, 'Sunni', NULL, '5 pillars, keep halal and attend Friday payer', NULL, 'Yes', 'No', 'Sunni', NULL, 'Similar practices', 'Headscarf,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Other,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 8, 'Fazlul Hoque', NULL, NULL, NULL, NULL, '3476072039', 'Fhoque57@gmail.com', NULL, NULL, 'Hanif Chowdhury', 'Uncle', '16465774002', NULL, NULL, NULL, NULL, NULL, NULL, 'NKAGQK1_R2A5014.jpeg', 'O32Y9SNBio_SajidHq_8.2023.pdf', NULL, '8LPH9TFIMG-6731.jpg', 5, 'VkcwNU1GbFlVbXhqYmtwMlkyMXNlbVJFVVRWSlVUMDk=', 'Active', 97, '2023-08-16 06:11:21.000000', '2024-05-22 04:02:51.000000', '21054465', '158,160,173,185,42,63,70,84,93,180,', '60,60,60,60,50,50,50,50,50,50,', '100,84,45,82,42,133,151,158,164,185,188,176,173,196,63,215', NULL, NULL, 'ODTU0LNIMG_5268.jpeg', '0N64BXI_R2A5014.jpeg,6KEPVEUIMG_1813.jpeg,THQZ6OXIMG_2110.jpeg,N3900Z8IMG_4227.jpeg', NULL, NULL, '100,42,63,84,93,82,46,77,102,103,45,109,70,133,151,158,160,164,162,176,185,188,173,193,148,180,', NULL),
(174, 'Ismail Hossain rimon', NULL, 'Male', NULL, NULL, 'New York', NULL, '9294138551', NULL, NULL, 'Ismailhossainrimon20@gmail.com', NULL, 1997, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VWpKc2RWb3lSbTlaVjJSb1kyMUZlRkZCUFQwPQ==', 'Inactive', 19, '2023-08-16 06:54:01.000000', '2023-08-16 07:03:07.000000', '27700375', NULL, NULL, NULL, NULL, NULL, NULL, '63X6VRJIMG_3042.jpeg,NFK5OPDIMG_9601.jpeg,P7HY67XIMG_0739.jpeg,gallery4.jpg', NULL, NULL, NULL, NULL),
(176, 'Test Third', NULL, 'Male', 'address', NULL, 'Maine', NULL, '3490809800', NULL, NULL, 'third@test.com', NULL, 1986, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H1B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Doctorate', 'No', 'test comment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-08-16 21:03:54.000000', '2023-08-16 21:03:54.000000', NULL, NULL, NULL, NULL, '290', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(183, 'Test again', NULL, 'Male', 'sdfas', NULL, 'South Carolina', NULL, '9340890800', NULL, NULL, 'sdlkfjl@lsdfkj.coms', NULL, 1999, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Student Visa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Incognito', NULL, 2434, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test comment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin comment', NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-08-16 21:17:59.000000', '2023-08-16 21:17:59.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(187, 'Meraj Hassan', NULL, 'Male', NULL, 'Paterson', 'New Jersey', '07502', '8622716805', NULL, NULL, 'merajhassan007@gmail.com', NULL, 1997, 26, NULL, 67, 148, 'Sylhet, Bangladesh', 'None', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'John F Kennedy High School', 2018, 'Rutgers University', 2023, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'EY', 'Audit Associate', 80000, 'Sunni', NULL, 'Prays the daily 5 prayers, fasts during Ramadan, regular to the local masjids', NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 5, 'Abdul Mokit', NULL, NULL, NULL, NULL, '5512467013', 'merajhassan007@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'V1Zod1RWUkhSakZXUkZJMFUyeHNlbFZIVVdzPQ==', 'Deactivated', 87, '2023-08-16 14:50:16.000000', '2023-08-16 15:10:16.000000', '32892116', NULL, NULL, NULL, NULL, NULL, NULL, 'W596RCTC7089485-B5B0-486B-B64C-95D167676DBA.jpeg,NZF0SPF0EB996F6-6958-475C-934A-54AACEA836D1.jpeg,0LEX8170E0B785F-623D-4064-B878-97BF629EA4C6_1_201_a.jpeg,NWZS43649395526-E1DE-4D87-A2CB-EBCCF5E84372_1_201_a.jpeg', NULL, NULL, NULL, NULL),
(203, 'My test name', NULL, 'Male', 'test', NULL, 'Florida', NULL, '2345672345', NULL, NULL, 'muqim_bit@yahoo.com', NULL, 1999, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'xyz', NULL, 23456, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'none', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-08-17 06:43:02.000000', '2023-08-17 06:43:02.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(205, 'test', NULL, 'Male', 'addre', NULL, 'South Carolina', NULL, 'test@test.comsss', NULL, NULL, 'test@test.comsss', NULL, 1999, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Student Visa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'any info', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-08-17 20:48:27.000000', '2023-08-17 20:48:27.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(207, 'Mohammed Karim', NULL, 'Male', '1225 Hellerman St', NULL, 'Pennsylvania', NULL, '9292619543', NULL, NULL, 'makarim913@gmail.com', NULL, 1997, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-08-18 15:52:36.000000', '2023-08-18 15:52:36.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, 'MD Rahat Rahman', NULL, 'Male', '2141 Starling Ave', NULL, 'New York', NULL, '6463849722', NULL, NULL, 'rahatrahman751@gmail.com', NULL, 1998, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', 'Subway', NULL, 55000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VlcxR2IxbFlVWGxoTUVFOQ==', 'Convention', NULL, '2023-08-18 16:09:00.000000', '2023-11-26 14:47:49.000000', '83182289', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(211, 'md rahat rahman', NULL, 'Male', NULL, NULL, 'New York', NULL, '6463849722', NULL, NULL, 'rahatrahman751@gmail.com', NULL, 1998, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlcxR2IxbFlVWGhQUVQwOQ==', 'Inactive', NULL, '2023-08-18 16:13:36.000000', '2023-08-18 16:13:36.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(212, 'Ammar M Elahi', NULL, 'Male', '672 Franklin Ave', NULL, 'New York', NULL, '6469049500', NULL, NULL, 'ammarelahi1234@gmail.com', NULL, 1996, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', 'Al-Noor School', NULL, 45000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-08-18 18:25:33.000000', '2023-08-18 18:25:33.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, 'Muhammad Abdul hasib', NULL, 'Male', '530 West 45th st', NULL, 'New York', NULL, '9175358654', NULL, NULL, 'Hasibmuhammad078@gmai.com', NULL, 1998, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', 'subway', NULL, 48000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-08-18 20:29:14.000000', '2023-08-18 20:29:14.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(216, 'Muhammad Abdul hasib', NULL, 'Male', '530 West 45th st', 'new York', 'New York', '10036', '9175358654', NULL, NULL, 'hasibmuhammad078@gmail.com', NULL, 1998, 25, NULL, NULL, NULL, 'bangladesh', NULL, 'Single', NULL, NULL, NULL, 'EAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2013, NULL, NULL, 'Other', 'Yes', 'subway', 'meneger', 48000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VTBkR2VtRlhTWGhOYTBFOQ==', 'Inactive', 26, '2023-08-18 20:34:36.000000', '2023-08-18 21:04:28.000000', '63315571', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(227, 'yhg', NULL, 'Male', 'hhuu', NULL, 'New York', NULL, '7686868686', NULL, NULL, 'huhf@uuh.nnn', NULL, 2005, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'iuyyyy', NULL, 1000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-08-19 05:54:23.000000', '2023-08-19 05:54:23.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, 'Jahidul  Islam', NULL, 'Male', '461 Southport St', NULL, 'New York', NULL, '3478379748', NULL, NULL, 'islamjahid316@gmail.com', NULL, 1995, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Gainwell Inc', NULL, 100000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-08-19 07:15:18.000000', '2023-08-19 07:15:18.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(229, 'Altafur Rahman', NULL, 'Male', '8813 Sutter Ave 89st st', NULL, 'New York', NULL, '3476591438', NULL, NULL, 'arahman0995@gmail.com', NULL, 1995, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Paramount', NULL, 100000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VlcxR2IxcFVTVEJPVkVGbw==', 'Convention', NULL, '2023-08-19 08:03:20.000000', '2023-08-19 08:03:20.000000', '34848874', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(230, 'Md Sadiqur Rahman', NULL, 'Male', '3544 Dekalb Ave', NULL, 'New York', NULL, '9296028470', NULL, NULL, 'iiuc.sadik@gmail.com', NULL, 1995, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Arabic teacher and register of a store with studentship.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BD Address : Sylhet, Bangladesh.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-08-19 09:22:01.000000', '2023-08-19 09:22:01.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(231, 'Sami Abdul Aziz', NULL, 'Male', '55 Bloomfield Ave', NULL, 'New Jersey', NULL, '4849959676', NULL, NULL, 'Samiabdulaziz@gmail.com', NULL, 1985, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Asurion', NULL, 70000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'I have a masters in Islamic chaplaincy. I served as a university chaplain for 8 years. Now I am a cell phone technician for Asurion. Looking for a pious sister who loves islam.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-08-19 09:29:33.000000', '2023-08-19 09:29:33.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(232, 'Sami Abdul Aziz', NULL, 'Male', '55 Bloomfield ave', 'Paterson', 'New Jersey', '07503', '4849959676', NULL, NULL, 'samiabdulaziz@gmail.com', NULL, 1985, 38, NULL, 67, 178, 'Texas', 'N/a', 'Divorced', 'Yes', 2, '15 & 13', 'US Citizen', NULL, 'Conestoga high school', 2003, 'Thomas Edison state college', 2008, 'Islamic chaplaincy', 2015, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Asurion', 'Technician', 70, 'Sunni', NULL, 'I’ve done dawah in america my whole life. I was a university chaplain (like an assistant imam) for 8 years.\nI pray 5 times a day and recite Quran daily.', NULL, 'Yes', 'No', 'Sunni', NULL, 'I’m looking for someone who is Pious, Attached to Quran, Soft spoken, Less than my height of 5 feet 7 inches, wears hijab and abaya or niqab. Someone loving and agreeable whose focus is preparing for hereafter. Someone who is average to slim and has a healthy lifestyle.', 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'No Preference,', 'Yes', 'No Preference', 'No Preference', 1, 10, 'Mohammad Aziz', NULL, 'Paoli', 'Pennsylvania', 'United States', '4843211442', 'azimohammad@gmail.com', 'Retired', NULL, 'Yasin ahmed', 'Mentor and friend', '609) 571-6093', 'Abdul malik Negedu', 'Friend and mentor', '(203) 828-0202', 'Umar Abdur Rahman', 'Mentor and friend', '(267) 218-0483', 'U7YW4CU6EA07604-5814-4820-9079-CF39D3253692.jpeg', 'EZCBNO7Sammy-Aziz_resume.pdf', NULL, 'VXWU1FRC70746B7-F7B6-4433-B4AE-EDEC6554E0E3.jpeg', 5, 'VGxSWk0wMVVXVEpWTUVKMA==', 'Active', 100, '2023-08-19 09:32:26.000000', '2024-01-14 14:45:47.000000', '44653698', '42,46,77,84,93,160,180,196,201,204,', '40,40,40,40,40,40,40,40,40,40,', '93,84,77,46,42', NULL, NULL, '6JAQIUTBA114583-087B-4B24-83D7-F34E765DF740.jpeg', '8SIJBH50F6F3CD5-F186-48DE-B7CB-5F45E12E077F.jpeg,P7206RMDB90B7F0-D626-4D00-A6DA-B5166798CD6E.jpeg,Q7ANN2P8F864F90-D3D3-40D9-8C43-0376214AE800.jpeg,U3H6URV61110FFB-2608-4EF3-9A75-5EB979853A1F.jpeg', NULL, NULL, '42,46,77,84,93,45,63,70,82,100,103,133,151,160,164,158,180,196,193,201,208,204,', NULL),
(233, 'Farhad Abdul', NULL, 'Male', '355 New Jersey ave', NULL, 'New York', NULL, '9292832368', NULL, NULL, 'farhadabdul2@gmail.com', NULL, 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Entrepreneur', NULL, 75000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-08-19 09:57:36.000000', '2023-08-19 09:57:36.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(235, 'Md Mahmudul Hasan', NULL, 'Male', NULL, NULL, 'New York', NULL, '9176602905', NULL, NULL, 'hasansakibseo@gmail.com', NULL, 1992, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkcxV00yVlhPWGxoTUVGcVRVUkJlQT09', 'Inactive', NULL, '2023-08-19 20:50:31.000000', '2023-08-19 20:50:31.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(236, 'Md Nahidul Islam', NULL, 'Male', '3226 Hull Ave', NULL, 'New York', NULL, '9294468630', NULL, NULL, 'Nahidul0509@gmail.com', NULL, 2001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Societe Generale', NULL, 85000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VFhwUmVXVlVhM0ZsUldSQlNWZG9iUT09', 'Convention', NULL, '2023-08-20 15:22:22.000000', '2023-08-20 15:25:21.000000', '60723509', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(237, 'Towhidul', NULL, 'Male', '1071 Penn Circle', NULL, 'Pennsylvania', NULL, '2673854210', NULL, NULL, 'pingku84@gmail.com', NULL, 1984, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Rice University', NULL, 250000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-08-20 16:26:21.000000', '2023-08-20 16:26:21.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(238, 'Layes Ahmed', NULL, 'Male', NULL, NULL, 'New York', NULL, '9294626250', NULL, NULL, 'layesaminu@gmail.com', NULL, 1987, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WWtkR2RFNXFaekppUjNjOQ==', 'Inactive', NULL, '2023-08-20 18:06:49.000000', '2023-08-20 18:49:27.000000', '41019445', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(239, 'Abrar Hadi', NULL, 'Male', '4405 Twin Knolls Court', NULL, 'Virginia', NULL, '5713490826', NULL, NULL, 'hadiasa2010@gmail.com', NULL, 1997, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Virginia', NULL, 70000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Seeking a life partner who prioritizes their Deen, \nfamily values, and possesses excellent \ncommunication skills. It is important to me that she is \ncommitted to praying five times a day and striving \nto perfect her Deen. I believe in the importance of a \nstrong spiritual foundation in a marriage, and I am \nlooking for a partner who shares this perspective.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VG5wVk0wMXNhM2xoYlU1dllqTktNVXBFVlhjPQ==', 'Convention', NULL, '2023-08-21 00:49:59.000000', '2023-11-19 17:42:31.000000', '47031045', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(240, 'Abu Syeed A Hadi', NULL, 'Male', NULL, NULL, 'Virginia', NULL, '5713490826', NULL, NULL, 'hadiasa2010@gmail.com', NULL, 1997, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VjFSS2NWa3lhSFpqYmxWclRsUkJQUT09', 'Inactive', NULL, '2023-08-21 00:51:59.000000', '2023-08-21 00:51:59.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(241, 'Sakibuzzaman Khan', NULL, 'Male', 'Ashburn', NULL, 'Virginia', NULL, '5718307427', NULL, NULL, 'sakibuzzamankhan99@gmail.com', NULL, 1996, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Blue Cross Blue Shield', NULL, 90000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VVVaYWNHTnRaSEJpYld4b1RXYzlQUT09', 'Convention', NULL, '2023-08-21 09:26:44.000000', '2023-12-09 13:57:35.000000', '82492358', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(242, 'Sakibuzzaman Khan', NULL, 'Male', NULL, NULL, 'Virginia', NULL, '5718307427', NULL, NULL, 'sakibuzzamankhan99@gmail.com', NULL, 1996, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'V1c1V05GVXliSGhNVkd3MlpWZDBlR1JUTVhGaFdIQjVZVmRuUFE9PQ==', 'Inactive', NULL, '2023-08-21 09:30:08.000000', '2023-08-21 09:30:08.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(243, 'Mohammad Naymul Hasan', NULL, 'Male', '229 Sheridan ave', NULL, 'New York', NULL, '347-258-3570', NULL, NULL, 'naimulhasannaif@gmail.com', NULL, 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Student Visa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Manager', NULL, 50000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VkcxR2NGcHFXWGRSUlVFOQ==', 'Convention', NULL, '2023-09-01 14:22:44.000000', '2023-09-01 15:20:51.000000', '39031583', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(244, 'Mohammed Umar', NULL, 'Male', '575 W Madison Street', NULL, 'Illinois', NULL, '3316885157', NULL, NULL, 'mohammed643@gmail.com', NULL, 1987, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H1B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Mastek', NULL, 160000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Assalam Alaikum, I am calm, composed at the same time fun person to be around. I value family and good with elderly people. So, your parents will love me inshallah. I like deep conversations, traveling, hiking.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convention', NULL, '2023-09-04 04:10:23.000000', '2023-09-04 04:10:23.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(245, 'Shah Dehwali', NULL, 'Male', NULL, 'Dover', 'Delaware', NULL, '7320998976', NULL, NULL, 'rojidek794@cohodl.com', NULL, 2002, 21, NULL, 67, 160, NULL, NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Deleware High', 2020, 'Delware Uni', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, 'Pray all five and fast', NULL, 'Yes', NULL, 'Sunni', NULL, 'Follows quran and sunnah, virgin only, no tabaruj or free mixing or male friends, no women in previous relationships', 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Own Ethnicity', 'Bangladeshi', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No', 1, 5, 'Abdul Haq', NULL, NULL, NULL, NULL, '2636980998', 'rojidek794@cohodl.com', NULL, NULL, 'Shovli bhai', 'Friend', '18389291082', NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, '9CDTF8TIMG_6135.jpeg', 5, 'VmpKV2VXUkhWbmxhUkVWNVRUQkJQUT09', 'Inactive', 92, '2023-09-09 04:10:34.000000', '2023-09-09 08:53:52.000000', '22929973', NULL, NULL, NULL, NULL, NULL, '10S187UIMG_6217.jpeg', '1R8HP19IMG_6135.jpeg,MMDOHY9IMG_6135.jpeg,HGIR0CJIMG_6135.jpeg,K91Y09EIMG_6135.jpeg', NULL, NULL, NULL, NULL),
(246, 'Md Imam Hossain', 'Mamun', 'Male', NULL, 'Arlington', 'Texas', '76013', '6824068708', NULL, NULL, 'imamedu.bd@gmail.com', NULL, 1993, 31, NULL, 65, 121, 'Cumilla, Bangladesh', 'Alhamdullah, I don\'t have any health complications.', 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Higher Secondary School', 2009, 'Bachelor of Business Administation', 2014, 'Masters of Business Administration', 2016, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'The University of Texas at Arlington', 'Graduate Teaching Assistant', 30, 'Sunni', NULL, 'I always try to perform mandatory religious practices. Perform salah, and know how to read the Holy Quran. In my student life, I was a member of BICS.', NULL, 'No', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 9, 'Abul Kashem Majumder', 'House 9/A, Road 2/D, Block J, Baridhara, Dhaka', 'Dhaka', 'Nebraska', 'Bangladesh', '01731409663', 'kashemtex.bd@gmail.com', 'Business', NULL, 'Professor Dr Nazrul Islam', 'MUNA', '7144610456', 'Mosharrof Hossain', 'MUNA', '9545164214', 'Abu Jayad Buiyan', 'Friend', '9293267971', 'AXP8CCXMd_Imam_Hossain.jpg', '2YYMMQSBiodata_of_Imam_Hossain_Mamun.pdf', NULL, 'JK8C71TPassport-Md_Imam_Hossain.jpg', 5, 'VTFjeGFHSllTblpaVjFGNFRESkZQUT09', 'Active', 97, '2023-09-15 05:14:48.000000', '2024-05-22 13:59:45.000000', '58404047', '160,63,158,173,180,185,201,204,208,42,', '60,50,50,50,50,50,50,50,50,40,', '42,133,100,45,82,63,84,158,162,164,160,176,188,173,204,180', NULL, NULL, 'LD3UPCBWhatsApp_Image_2023-09-15_at_16.23.32.jpg', 'CIWNT8PMamun.jpg,C6H3CTPPic.jpg,EAGAPVUPicture.jpg,O4QG9GQPicture_.....jpg', NULL, NULL, '45,63,100,133,42,82,84,93,46,77,151,103,158,160,162,164,70,176,185,188,180,173,193,201,148,208,204,', NULL),
(248, 'Rafiqus Salehin Khan', 'Tayef', 'Male', NULL, 'ERIE', 'Pennsylvania', '16502', '5166679396', NULL, NULL, 'Salehin.khan@yahoo.com', NULL, 1998, 25, NULL, 70, 179, 'Lakshmipur, Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Lakshmipur Alia Madrasah', 2016, 'Internation Business', 2021, 'MBA in Business Analytics', 2023, NULL, NULL, NULL, NULL, 'Masters', 'No', NULL, NULL, 1, 'Sunni', NULL, 'Alhamdulillah, I had the opportunity to study in a madrasah before I attended university, which strengthened my base of religious belief and practices. I belong to a practicing family where we used to prioritize our religious values over everything. My mom and dad are both madrasah teachers. From my childhood till now, I have performed regular prayers, and Ramadan fasting, got involved in social work, and most importantly, kept my Akhlaq pure.', NULL, 'Yes', 'No', 'Sunni', NULL, 'I look for a practicing wife who will not just practice Islam herself but also be a responsible member of the family to uplift family, social, and religious values among everyone in the family.', 'Headscarf,Niqab,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 5, 'Hasan Bosri Khan', 'West Lakshmipur', 'Lakshmipur', NULL, 'Bangladesh', '01718991128', NULL, 'Principal at Mandari Model Madrasah, Lakshmipur, bangladesh', NULL, 'Hasan Bosri Khan', 'Father', '01718991128', 'Fatema Khanam', 'Mother', '01719907173', 'Sharifur Rahman', 'Friend', '5166679645', 'XRFLNSHScreenshot_2023-09-19_at_18.08.39.jpg', 'HQFKSXBRafiqus\'s_Resume_(1).pdf', NULL, 'EM04J91IMG_4813.jpg', 5, 'VXpKb2FHSnVVbWhsVjFadFVVUkZOVTlVWnowPQ==', 'Deactivated', 95, '2023-09-19 11:52:08.000000', '2024-04-17 09:54:45.000000', '17997506', '63,158,160,173,176,185,201,42,70,93,', '50,50,50,50,50,50,50,40,40,40,', '133,158,162,188', NULL, NULL, 'GQRW9ZSSignature.jpg', 'MN29WAOScreenshot_2023-09-19_at_18.03.52.jpg,381N4V6IMG_4536.jpg,2H4FGC4Screenshot_2023-09-19_at_18.06.58.jpg,EMHD9J3Screenshot_2023-09-19_at_18.08.39.jpg', NULL, NULL, '45,63,100,133,42,82,93,103,77,84,151,46,158,160,162,164,70,157,176,185,188,180,173,193,201,148,', NULL),
(252, 'Mahedi Hassan', NULL, 'Male', NULL, 'Bronx', 'New York', '10461', '13472089075', NULL, NULL, 'ichs0929@gmail.com', NULL, 1997, 26, NULL, 66, 66, NULL, NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'ICHS', 2015, 'City College of New York (CUNY)', 2020, 'Steven Institute of Technology', 2023, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Department of Defense', 'Lead System Engineer', 110000, 'Sunni', NULL, 'I faithfully perform the five daily prayers, observe fasting during the holy month of Ramadan, and make an effort to visit the mosque whenever I have the opportunity for communal prayer and spiritual reflection.', NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,Niqab,', 'No', 'Own Ethnicity', 'American', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 5, 'Abdul Latif', '40 Metropolitan Oval, 5G, Bronx\n5G', 'Bronx', 'New York', 'United States', '9292806693', 'mahedih566@gmail.com', 'Self Employed', NULL, 'Mushfiqur Rahaman', 'Friend', '9175735040', 'Rashid khan', 'Relative', '5189920483', 'Poly khan', 'Cousin', '3472431234', 'F0H7BWSIMG_6762_11zon.jpg', 'Y4EKJIXBio-Data_2023-MHH.pdf', NULL, 'NFFAOGDid.pdf', 5, 'VlVjNWMyUkhWa0ZOYWtGNFRsUlZQUT09', 'Deactivated', 97, '2023-09-23 09:23:20.000000', '2024-04-15 14:14:51.000000', '28540504', '63,158,160,173,176,180,185,201,204,42,', '50,50,50,50,50,50,50,50,50,40,', '45,133,82,63,42,93,158,162,164,185,176,188,193,173', NULL, NULL, 'VMF1V2Esignature.JPG', 'L8MNJNXIMG_6776_11zon.jpg,YD5PWA3IMG_6807_11zon.jpg,VFZ7K0EIMG_6753_11zon.jpg,E7LUWCYIMG_6816_11zon.jpg', NULL, NULL, '45,63,100,133,42,82,93,77,84,103,151,46,158,160,162,164,70,157,176,185,188,180,173,193,201,148,204,', NULL),
(253, 'ASIF SHARIAR LEZAN', 'Asif', 'Male', '8 Talbot Dr', 'westbury', 'New York', '11590', '3475386797', NULL, NULL, 'asifshariar88@gmail.com', NULL, 1998, 25, NULL, 68, 148, 'Jhenaidah,khulna,Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'Other', 'M-1', 'science', 2017, 'Bachelor of buisness Adminstration', 2022, NULL, NULL, NULL, NULL, 'Commercial Pilot License', 2023, 'Other', 'No', NULL, NULL, 1, 'Sunni', NULL, 'Regarding my religious beliefs, I always try to follow the basic fundamentals of Islam in my day-to-day activities. I also try to do some volunteer work at Islamic center Long Island.', NULL, 'Yes', 'No', 'Sunni', NULL, 'Looking for someone who will prioritize deen over dunyiya.', 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 5, 'MD MASUD RANA', '7210 37 AVE', 'JACKSON HEIGHTS', 'New York', 'USA', '6466927075', NULL, 'NYPD OFFICER', 'MASUD RANA is my cousin & he is my guardian in America.', 'Md Shafiul Alam', 'Father', '01715671272', 'Md Masud Rana', 'cousin', '6466917075', 'Md Rezaul Karim', 'uncle', '9179098016', 'F9QDWGDIMG-1821.JPG', 'S4TXVZNBiodata_of_Asif_Shariar_Lezan.._(1).pdf', NULL, 'P0ZKRE2asif.dL.jpg', 5, 'VkVkV05sbFhOVUZOVkdjeVRrRTlQUT09', 'Active', 95, '2023-09-30 14:31:34.000000', '2024-05-22 04:44:09.000000', '12826673', '63,180,42,70,77,93,151,158,160,173,', '50,50,40,40,40,40,40,40,40,40,', '70', NULL, NULL, 'JIJM8QOIMG-1823.jpg', '8UZER12IMG-1397.jpg,4M6BUXRDSI-0024-Original.JPG,7MJEZ44IMG-1821.JPG,9WHMYP6WhatsApp_Image_2023-05-03_at_12.23.48_AM.jpeg', NULL, NULL, '63,42,45,77,93,100,133,82,84,103,151,46,158,160,164,70,162,176,188,180,173,148,', NULL),
(254, 'Samsuzzuha Islam', NULL, 'Male', NULL, 'Gaithersburg', 'Maryland', '20879', '3017285200', '3017285200', '3017285200', 'smtariqul@gmail.com', NULL, 2001, 22, NULL, 60, 149, 'USA', 'Good', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Alim Academay', 2018, 'University of Maryland College', 2022, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Get Together', 'Cyber SecurityEngineer', NULL, 'Sunni', NULL, 'Practicing muslim', 'NA', NULL, 'Yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', 'Bachelor', 'Yes', NULL, 1, 'Samsuzzuha Islam', '11425 Rambling Road', 'Gaithersburg', 'Maryland', 'USA', '3017285200', 'smtariqul@gmail.com', 'IT Engineer', NULL, 'Faruk Hossain', 'Family friend', '9179073060', 'Towfiq Hossain', 'Family friend', '6463937800', 'Areeba Hossain', 'Friend', '9179073060', 'anonymous.png', 'Q34HFQ8Iffat_Islam_Biodata.pdf', NULL, 'HSZUM89Iffat.JPG', 5, 'VlcxR2RHTklWbmxaVlVGNlQwUlZNUT09', 'Deactivated', 63, '2023-10-01 05:38:44.000000', '2023-10-02 15:49:24.000000', '22213662', NULL, NULL, NULL, NULL, NULL, 'YOC1FQPbackground.jpg', 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(255, 'Ali Ahmad', NULL, 'Male', '1650 Northeast Valley Road', 'Pullman', 'Washington', '99163', '5093388058', NULL, NULL, 'engr.aliahmad125@gmail.com', NULL, 1990, 33, NULL, 65, 70, 'Pakistan', NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F5RKIO5Ali_Ahmad.jpeg', NULL, NULL, NULL, 5, 'VkZoV2RWbFhXbWhqTTFKc1pWUkZhQT09', 'Inactive', 26, '2023-10-06 18:14:54.000000', '2023-10-06 18:22:57.000000', '77591643', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(256, 'Muhammad Amirul Islam Fahim', 'Fahim', 'Male', '107 East Market St', 'Hyde park', 'New York', '12538', '845-249-9169', NULL, NULL, 'fahimamirul7@gmail.com', NULL, 1995, 28, NULL, 66, 53, 'Cox\'s Bazar, Bangladesh', 'Good', 'Single', NULL, NULL, NULL, 'H1B', NULL, NULL, 2012, NULL, 2016, NULL, 2018, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Anderson center for Autism', 'Residential Program Specialist', 55000, 'Sunni', NULL, 'Alhamdulillah. I pray 5 times a day. Do fasting, eat halal and try to visit masjid whenever got opportunity. I have short beard.', NULL, 'Yes', 'No', 'Sunni', NULL, 'Follow Islamic rule and pray 5 times a day.', 'No Preference,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 1, 7, 'Nur Muhammad', 'c/105, Lalkuthi 3rd colony, Mirpur 1', 'Dhaka', NULL, 'Bangladesh', NULL, 'nurm0562@gmail.com', 'Retired Bussinessman', 'We are 7 siblings. Alhamdulillah Everyone is established in their profession.', 'Rezaul Karim', 'Cousin', '9176007339', NULL, NULL, NULL, NULL, NULL, NULL, 'QT4H2HAFahim_new_pic.jpg', 'LU22TAEFahim_CV.docx', NULL, 'HUHO6PQScreenshot_20230202_123441_Microsoft_365_(Office).jpg', 5, 'VW10QmVrMUVTVFZPZWtVOQ==', 'Active', 90, '2023-10-10 16:08:33.000000', '2024-04-21 10:28:42.000000', '22314284', '63,160,208,42,70,93,151,158,173,180,', '50,50,50,40,40,40,40,40,40,40,', '100,42,93,133,63,151,160,164,70,185,188', NULL, NULL, 'UVAKMJ8Signature.jpg', 'YIDYFRWIMG_20230628_224445_469.jpg,3GB18OHIMG_20230421_122908_385.jpg,IE52FEE20230509_134557.jpg,44WKPU0IMG_20230507_100539_673.jpg', NULL, NULL, '42,45,63,93,100,133,82,84,151,46,77,103,158,160,164,70,162,176,185,188,180,173,148,208,', NULL);
INSERT INTO `UserApp_maleuser` (`userId`, `fullName`, `nickName`, `gender`, `address`, `city`, `state`, `zip`, `cellPhone`, `workPhone`, `homePhone`, `email`, `personalWebsite`, `birthYear`, `age`, `dateOfBirth`, `height`, `weight`, `placeOfBirth`, `health`, `maritalStatus`, `children`, `childrenNumber`, `childrenAges`, `immigrationStatus`, `immigrationStatusOther`, `highSchool`, `highSchoolYear`, `bachelors`, `bachelorsYear`, `masters`, `mastersYear`, `doctorate`, `doctorateYear`, `otherDegree`, `otherDegreeYear`, `highestEducation`, `employed`, `employment`, `position`, `income`, `religiousPractice`, `religiousPracticeOther`, `religiousPracticeBrief`, `revertTime`, `beard`, `smoker`, `preReligious`, `preReligiousOther`, `preReligiousBrief`, `preWear`, `preSmoking`, `preEthnic`, `preEthnicSpecific`, `preImmigrationStatus`, `preImmigrationStatusOther`, `preMaritalStatus`, `preChildren`, `preEducation`, `preEmployment`, `preIncome`, `preAgeGap`, `guarName`, `guarAddress`, `guarCity`, `guarState`, `guarCountry`, `guarPhone`, `guarEmail`, `guarProfession`, `familyBrief`, `refName1`, `refRelation1`, `refPhone1`, `refName2`, `refRelation2`, `refPhone2`, `refName3`, `refRelation3`, `refPhone3`, `photo`, `cv`, `album`, `govIssuedId`, `matchShowLimit`, `userPass`, `status`, `profileCompleteness`, `openingDate`, `lastEdit`, `userToken`, `matchId`, `matchPercentage`, `reqAccepted`, `reqRejected`, `reqSent`, `signature`, `gallery`, `tempGallery`, `lockedId`, `cuMatchId`, `reqLock`) VALUES
(257, 'Ismail Rufai', NULL, 'Male', NULL, NULL, 'California', NULL, '+16612815144', NULL, NULL, 'britscureland@gmail.com', NULL, 1995, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkVkR2RWb3llSFpaTW5ONFNWRTlQUT09', 'Inactive', NULL, '2023-10-15 09:06:13.000000', '2023-10-15 09:06:13.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(259, 'Md Mahmudul Hasan', NULL, 'Male', NULL, NULL, 'New York', NULL, '9176602905', NULL, NULL, 'mahmudulwh@gmail.com', NULL, 1994, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZkT1QyVlZRV3BOUkVGNA==', 'Inactive', NULL, '2023-10-19 15:17:30.000000', '2023-10-19 15:17:30.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(260, 'Md Sharif Khan', NULL, 'Male', NULL, NULL, 'Idaho', NULL, '2089917215', NULL, NULL, 'sharifkhanjnu@gmail.com', NULL, 1990, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZWQmQySjZTWHBQVkUwelRsUkpNUT09', 'Inactive', NULL, '2023-10-20 17:38:23.000000', '2023-10-20 17:49:13.000000', '21636408', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(261, 'Shadman Sakief Hridoy', NULL, 'Male', '146 Taliwa Ct    Apt 146', 'Knoxville', 'Tennessee', '37920', '8659107482', NULL, NULL, 'sakib.hrid@gmail.com', NULL, 1996, 27, NULL, 70, NULL, 'Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', 'University of Tennessee Knoxville', 'Graduate Research Assistant', 27000, 'Sunni', NULL, 'Daily prayers, visiting the masjid', NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,Other,', NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 1, 8, 'Selina Akter', 'House :4, Road:8/3, Block:D, Banasree, Rampura', 'Dhaka', NULL, 'Bangladesh', '01712055120', NULL, 'Homemaker', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AQZH861IMG_6722.jpeg', NULL, NULL, 'CL95M8Jimage.jpg', 5, 'WVVaS1NsSkZNVUZVYWtsMw==', 'Inactive', 73, '2023-10-29 15:59:04.000000', '2023-10-29 16:16:20.000000', '20212558', NULL, NULL, NULL, NULL, NULL, NULL, 'U10A3D8IMG_6723.jpeg,N78YUN0IMG_6724.jpeg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(262, 'Jahirul Islam', 'Jahir', 'Male', '4933 Nine Mile Rd\nDavinci', 'Richmond', 'Virginia', '23223-5738', '5716161959', NULL, NULL, 'Jahirul3071@gmail.com', NULL, 1994, 29, NULL, 68, 180, 'Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'Other', 'Approved for Green Card.', 'Mostafa Kamal High School', 2010, 'Graduated from Bangladesh and also completed my associate degree here', 2016, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'DaVinci and US Best Wings', 'Owner', 120000, 'Sunni', NULL, 'Alhamdulillah I’m a practicing Muslim and I try to pray five times. I fast in Ramadan and also go to mosque often.', NULL, 'Yes', 'No', 'Sunni', NULL, 'I looking for someone who practices islam.', 'Niqab,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 6, 'Father - Nurul Amin', 'Kankapait', 'Chouddagram', NULL, 'Bangladesh', '01817643229', 'Jahirul3071@gmail.com', 'Retired', 'My parents still live in Bangladesh.', 'Abdur Rahim', 'Relative', '(347) 435-8477', NULL, NULL, NULL, NULL, NULL, NULL, 'QDVIQK7IMG_3783.jpeg', 'MPFUF3PCV.pdf', NULL, NULL, 5, 'VTIxR2IyRllTakZpUlVGNFQxUnJNQT09', 'Deactivated', 97, '2023-11-03 11:54:57.000000', '2023-12-30 10:54:34.000000', '16985590', '63,160,164,42,70,93,133,151,158,162,', '50,50,50,40,40,40,40,40,40,40,', '82,133,151', NULL, NULL, 'BK0PKN2image.jpg', 'WPUS697IMG_3249.jpeg,VLEH36WFullSizeRender.jpeg,XB7XQCIIMG_3087.jpeg,11F9RRHIMG_4013.jpeg', NULL, NULL, '63,42,45,93,133,151,46,77,82,84,103,158,160,164,70,162,', NULL),
(263, 'Aminur Rahman', NULL, 'Male', NULL, 'Johnson City', 'New York', NULL, '6073708218', NULL, NULL, 'aminuraust@gmail.com', NULL, 1991, 32, NULL, 64, 130, 'Bangladesh', 'N/A', 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Dhaka Residential Model College', 2009, 'Textile Engineering', 2014, 'Material Science', 2021, NULL, NULL, NULL, NULL, 'Doctorate', 'Yes', 'Binghamton University', 'Research Assistant', 27000, 'Sunni', NULL, 'Regular praying, fasting on mandatory and obligatory days, visiting masjid weekly', NULL, 'No', 'No', NULL, NULL, NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 10, 'Mahmuda Jannat', 'Mohammadpur', 'Dhaka', NULL, 'Bangladesh', '6073708218', 'aminuraust@gmail.com', NULL, NULL, 'Md Motiar Rahman', 'Senior', '6073138651', NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', 'FTBP52QAR.pdf', NULL, '6IB7ZOIIMG_20221120_210955.jpg', 5, 'VWtkb2FHRXlSWFJZZVRCNFRXcEJNMGwzUFQwPQ==', 'Deactivated', 90, '2023-11-06 00:57:31.000000', '2023-11-17 14:42:50.000000', '32251043', '63,42,84,93,133,151,46,77,82,103,', '40,30,30,30,30,30,20,20,20,20,', '42,45,93,133', NULL, NULL, '3AZWBFBElectronic_Signature.jpg', 'CVLC5PHSAVE_20221222_204315.jpg,PUYCMAASAVE_20220725_134557.jpg,BDVAEI8received_1234797263785126.jpeg,gallery4.jpg', NULL, NULL, '63,42,45,84,93,133,151,46,77,82,103,', NULL),
(264, 'Md Fokhrul Islam', 'Sumon', 'Male', '267 , North 8th Street', 'Laramie', 'Wyoming', '82072', '+13077619342', NULL, NULL, 'fokhrulislam2909@gmail.com', 'na', 1997, 26, NULL, 62, 386, 'Noakhali', NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Fauzdarhat Cadet College', 2016, 'In Economics from the University of Dhaka', 2022, 'International Studies (Political Economics)', 2023, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'University of Wyoming', 'Graduate Teaching Assistant', 12886, 'Sunni', NULL, 'I say five time prayers. I keep fast every Monday and some times on Thursday.I try to join all halaqas. I love Tabliq and try to give time there whenever I get time.  We have only Isha prayer zamat at our masjid in Wyoming, so I try to go to masjid every day.', 'na', 'Yes', 'No', 'Sunni', NULL, 'She should be practising muslim with proper porda. She should say five time prayers.', 'Jelbab/Abaya,Niqab,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 5, 'Md Jashim Uddin', '6448, North Washtenaw Ave', 'Chicao', 'Illinois', 'USA', '+17737932812', 'imfil2001@gmail.com', 'Service holder', NULL, 'Md Jashim Uddin', 'Brother', '+17737932812', 'Md Wasim Akram', 'Brother', '+18062812903', 'Md Imranul Islam', 'Brother', '+13072236821', 'RC8M3W6WhatsApp_Image_2023-11-09_at_11.45.53_PM.jpeg', '4ZWA94KMd_Fokhrul_Islam_..Biodata.pdf', NULL, 'PNQSX9Rpassport..PayPal.pdf', 5, 'VlROV2RHSXlOVUZOYW10M1QxRTlQUT09', 'Active', 97, '2023-11-12 16:31:30.000000', '2024-03-28 08:45:28.000000', '74049186', '63,42,70,93,151,158,160,173,180,185,', '50,40,40,40,40,40,40,40,40,40,', '45,133,42,93,151,164,70,188', NULL, NULL, '92KHE6IWhatsApp_Image_2023-11-13_at_12.29.56_AM.jpeg', 'L33F67RWhatsApp_Image_2023-11-12_at_11.49.48_PM.jpeg,DENUG68WhatsApp_Image_2023-11-12_at_11.53.03_PM.jpeg,MWN2BMHWhatsApp_Image_2023-11-12_at_11.53.04_PM.jpeg,ZKHGPRIWhatsApp_Image_2023-11-12_at_11.44.04_PM.jpeg', NULL, NULL, '63,42,45,93,133,151,77,82,84,103,46,158,160,164,70,162,176,185,188,180,173,148,', NULL),
(266, 'Mohammed Yousuf Mullawala', NULL, 'Male', NULL, NULL, 'Rhode Island', NULL, '4019653453', NULL, NULL, 'yousufmullawala@gmail.com', NULL, 1983, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoc2RGRkVSVFZPZW1jOQ==', 'Inactive', NULL, '2023-11-17 17:11:43.000000', '2023-11-17 17:11:43.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(268, NULL, NULL, 'Male', NULL, NULL, 'California', NULL, NULL, NULL, NULL, 'mkalkhateb@gmail.com', NULL, 2000, 24, NULL, NULL, NULL, NULL, NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Gradate', NULL, 'Bachelors in science nursing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', NULL, NULL, 15000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No Preference', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 8, 'Mustafa Alkhateb', '3427 Braemar lane', 'Corona', 'California', 'USA', '9512209754', 'Mkalkhateb@gmail.com', 'Healthcare', 'Very nice open-minded family we pray and we fast. our best trait is how we interact positively with other people.', 'David', 'Friend', '9512209754', 'Dan', 'Friend', '248 686-8148', NULL, NULL, NULL, '2E8CFCKIMG_2063.jpeg', 'TEEM4UPMustafa_Alkhateb_2023.docx', NULL, '2VWX931image.jpg', 5, 'VkZjNWRtTXlWWGhOZWtGbw==', 'Deactivated', 78, '2023-11-19 04:53:43.000000', '2024-05-14 06:44:37.000000', '17968916', NULL, NULL, NULL, NULL, NULL, '3X89EH5IMG_0571.jpeg', 'gallery1.jpg,gallery2.jpg,VQBFYU3IMG_2063.jpeg,gallery4.jpg', NULL, NULL, NULL, NULL),
(269, 'Abu Syeed A Hadi', NULL, 'Male', NULL, NULL, 'Virginia', NULL, '15713490826', NULL, NULL, 'hadiasa2010@gmail.com', NULL, 1997, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VjFSS2NWa3lhSFpqYmxWclRsUkJQUT09', 'Inactive', NULL, '2023-11-19 17:33:32.000000', '2023-11-19 17:33:32.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(270, 'Md Akibur Rahman', 'Akib', 'Male', '1317 West Main Street', 'Peoria', 'Illinois', '61606', '3099892174', NULL, NULL, 'rmdakibur@gmail.com', NULL, 1996, 27, NULL, 63, 125, 'Dhaka, Bangladesh', 'N/A', 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Notre Dame College', 2014, 'BUET', 2019, 'Clarkson University', 2023, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'BioUrja', 'Process Engineer', 85000, 'Sunni', NULL, 'Practicing muslim, 5 waqt prayers, fasting in ramadan', NULL, 'No', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 6, 'Md Nazrul Islam', '43/A Dhalka Nagar Lane', 'Dhaka', NULL, 'Bangladesh', '1936514092', NULL, 'Private Service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, 'XWQFCXKNY-LP.jpeg', 5, 'WWxoV2RWbFVaelJhYmtKUFlqRlJNMkZUVFQwPQ==', 'Inactive', 75, '2023-11-24 16:16:46.000000', '2023-11-24 16:32:05.000000', '31007853', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(271, 'Mohammed Amir Rafei', NULL, 'Male', '9161 116th st Richmond Hill', 'Richmond Hill', 'New York', '11418', '9293695651', NULL, NULL, 'omcm14052@gmail.com', NULL, 1998, 25, NULL, 66, 195, NULL, 'none', 'Single', NULL, NULL, NULL, 'Permanent Resident', NULL, 'International Advanced Level', 2014, 'Doctor of Medicine', 2019, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Metropolitan Learning Institute', 'Teacher; finished 1st step of USMLE and shall be completing the rest by next year.', 1, 'Sunni', NULL, 'daily prayers, fasting and halal income', NULL, 'No', 'No', 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Own Ethnicity', 'Bangladeshi', 'No Preference,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 3, 'Hasina Khanam', '9161 116th st Richmond Hill', 'Richmond Hill', 'New York', 'Queens', '3472578041', 'teacherhasinakhanam@gmail.com', 'Retired School Teacher', NULL, 'Shahidul Islam', 'Uncle', '6466443418', 'Lutfur Kabir', 'Friend', '6094817022', NULL, NULL, NULL, '89I1ELYWhatsApp_Image_2023-11-25_at_15.37.06_f3ee468a.jpg', 'YNNFG7EDr._Rafei_biodata.pdf', NULL, '7W4XCJFWhatsApp_Image_2023-11-25_at_19.16.19_f1eb2fe0.jpg', 5, 'Vlcxc2RWRkVXVFJPZWswOQ==', 'Active', 97, '2023-11-25 12:59:39.000000', '2024-03-12 14:05:47.000000', '60997220', '180,63,158,160,173,185,201,70,77,151,', '60,50,50,50,50,50,50,40,40,40,', '133,158,77,162,164,185,180,188', NULL, NULL, 'GFLHIIIsign.png', 'Z3CCL7VWhatsApp_Image_2023-11-25_at_15.37.06_f3ee468a.jpg,Q4M6YTIWhatsApp_Image_2023-12-06_at_18.31.14_2a2274a6...jpg,WW9G2IO0238f5f0-64e4-45fd-9f62-7e9511a08576.jpeg,LHX8ZMCWhatsApp_Image_2023-12-06_at_14.35.40_64375443.jpg', NULL, NULL, '63,133,158,77,82,151,42,84,93,103,160,162,164,70,176,185,188,180,173,193,201,148,', NULL),
(272, 'akib', NULL, 'Male', NULL, NULL, 'Virginia', NULL, '5713836622', NULL, NULL, 'akib.rhast@hotmail.com', NULL, 1994, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WTIxV2ExcHRPWFpOVkVsNlNWRTlQUT09', 'Inactive', NULL, '2023-11-26 07:18:33.000000', '2023-11-26 07:18:33.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(274, 'Farhad Kadir', NULL, 'Male', '7560 Plum Creek Dr Apt 7204', 'Houston', 'Texas', '77012', '5048926578', NULL, NULL, 'kadir.w9@gmail.com', NULL, 1993, 30, NULL, 172, 72, 'Cumilla, Bangladesh', 'Alhamdulillah, I don\'t have any physical condition', 'Divorced', 'No', NULL, NULL, 'F-1', NULL, 'Dhaka City College', 2010, 'University of Dhaka', 2016, 'Mathematics', 2018, 'Applied Mathematics', NULL, 'SSC: Misbahul Ulum Kamil Madrasah', 2018, 'Doctorate', 'Yes', 'University of Houston', 'Teaching Assistant', 30000, 'Sunni', NULL, 'The groom grew up in an Islamic environment. His father is a Hafez in Quran and his parents both have performed Hajj. The groom tries his best to follow the fundamental rules of Islam. His family adheres to Islamic teachings but does not like bigotry. I was a \"sathi\" of BICS since 2007 and now working as an associate member of MUNA TMC, Houston. Sometimes I lead Juma prayer in our university (2nd Jamat).', NULL, 'No', 'No', 'Sunni', NULL, 'We are looking for a bride who grew up in an Islamic family and is willing to perform fundamental activities of Islam (practicing Muslim will be a good fit). If the bride\'s early education (up to 12 classes) was in an Islamic institution, then she will get preference.', 'Jelbab/Abaya,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 8, 'Mohammad Dulal Mia', '260 Engle st, Apt # 6N', 'Englewood', 'New Jersey', 'USA', '2016826466', 'dulalmia1975@gmail.com', 'Manager', NULL, 'Iqbal Mahmud', 'President of MUNA TMC, Houston', '3522131778', NULL, NULL, NULL, NULL, NULL, NULL, 'XTN9XFBFarhad_1.jpeg', 'BSRURAGBio-data_of_Farhad_Kadir.pdf', NULL, 'FFF7LAADriver_Licence_(1).pdf', 5, 'VW0xR2VXRkhSbXRSUkVsNlRsUmpQUT09', 'Active', 100, '2023-11-26 13:02:36.000000', '2024-05-13 12:09:17.000000', '31334923', '160,63,158,173,180,185,201,204,208,42,', '60,50,50,50,50,50,50,50,50,40,', '160,133,158,162,164,176,188,173,180', NULL, NULL, '91O4OCDSign.jpg', '2C95IL7Farhad_2.jpg,MQQFEWNFarhad_5.jpeg,ZSKQWWRFarhad_3.jpeg,GK09YJZFarhad_4.jpeg', NULL, NULL, '160,63,133,158,162,164,42,70,82,84,93,151,176,185,188,180,173,193,201,148,208,204,', NULL),
(276, 'Jahidul Islam', NULL, 'Male', NULL, NULL, 'New York', NULL, '3478379748', NULL, NULL, 'islamjahid316@gmail.com', NULL, 1995, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkcxV00ySlhWWGxOUkVsNlNWRTlQUT09', 'Inactive', NULL, '2023-11-26 16:26:13.000000', '2023-11-26 16:26:13.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(277, 'Abu Syeed', NULL, 'Male', NULL, NULL, 'Virginia', NULL, '5713490826', NULL, NULL, 'hadiasa2010@gmail.com', NULL, 1997, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WlZSS2NWa3lhSFpqYmxaNlRsUkJQUT09', 'Inactive', NULL, '2023-11-27 01:18:31.000000', '2023-11-27 01:18:31.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(278, 'Mahir Rahman', NULL, 'Male', NULL, 'Haymarket', 'Virginia', NULL, '5717235594', NULL, NULL, 'mmahir380@gmail.com', NULL, 1999, 24, NULL, 66, 130, NULL, NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Virginia Commonwealth University', 2019, 'Computer Science', 2021, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Kinsale Insurance', 'Software Engineer', 120000, NULL, NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 100000, 4, 'Mohammad Mustafizur Rahman', NULL, NULL, NULL, NULL, '5717789629', 'drrahman1960@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WVVkc2VXSXdNVEZpYlVaMFdWaFNlV0ZYTVhaaWJXeG9Za1JGZVUxNVJUMD0=', 'Inactive', 85, '2023-11-27 15:32:13.000000', '2023-11-27 15:58:45.000000', '70138353', NULL, NULL, NULL, NULL, NULL, NULL, 'I41EYVHIMG_1041.jpg,EWMTIRFIMG_20220612_125256.jpg,9GJK2H320221228_131401~2.jpg,25SD7LVIMG_20221008_213609.jpg', NULL, NULL, NULL, NULL),
(279, 'Altafur Rahman', NULL, 'Male', NULL, NULL, 'New York', NULL, '3476591438', NULL, NULL, 'Arahman0995@gmail.com', NULL, 1995, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlcxR2IxcFVTVEJPVkVGMQ==', 'Inactive', NULL, '2023-11-29 07:45:25.000000', '2023-11-29 07:45:25.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(280, 'MOHAMMED MAJID BAKHSH', NULL, 'Male', NULL, NULL, 'Virginia', NULL, '2407330943', NULL, NULL, 'mohammedmajidb@gmail.com', NULL, 1996, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlRKb2JHTnRlSFpaTW5NeVRsUk9Udz09', 'Inactive', NULL, '2023-11-29 23:42:34.000000', '2023-11-29 23:42:34.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(281, 'Zinnur Choudhury', NULL, 'Male', NULL, NULL, 'Georgia', NULL, '4047266828', NULL, NULL, 'zinnurc@gmail.com', NULL, 2000, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlRKV2FtUllTbXhOYW1ONFRWRTlQUT09', 'Inactive', NULL, '2023-12-04 07:15:12.000000', '2023-12-04 07:15:12.000000', '46528577', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(282, 'M Roniful Islam', NULL, 'Male', NULL, 'Brooklyn', 'New York', '11226', '2023449368', NULL, NULL, 'espanolroni@gmail.com', NULL, 1990, 33, NULL, 171, 155, 'Naogaon, Bangladesh', 'Physically fit Alhamdulillah', 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Khulna Public College', 2008, 'BSC', 2014, 'Botany, Public Management', 2015, NULL, NULL, 'MA', 2022, 'Masters', 'Yes', 'Private service', 'Front desk receptionist', 40000, 'Sunni', NULL, 'Try to pray 5wakt Salah. I fast every year the whole month of Ramadan.', NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 10, 'Md Imam Hassan', 'Dhaka', NULL, NULL, 'Bangladesh', '01712899781', 'hassandsg@gmail.com', 'QI', NULL, 'Lutfar', 'Tablig Brother', '(929) 328-5192', 'Imam Hasan', 'Brother in law', '01712899781', 'Roki', 'Brother', '01736490619', 'Y096S4FIMG_6689.jpeg', 'TLIYE7GResume_of_Roni_NY.pdf', NULL, '2SLWRQ3image.jpg', 5, 'VlcwNWRXRllRbTlhUkZGNVRXcHJNVTE1VVQwPQ==', 'Active', 97, '2023-12-06 12:10:21.000000', '2024-02-14 02:44:19.000000', '71478928', '42,63,70,84,93,158,160,173,185,208,', '50,50,50,50,50,50,50,50,50,50,', '164,70,42,63,84,93', NULL, NULL, 'CZVXYBXimage.jpg', 'NLXLH1HIMG_6680.jpeg,UMV1N1QIMG_6607.jpeg,JNJ3RP8IMG_6423.jpeg,1Z9Q3KTIMG_6679.jpeg', NULL, NULL, '164,42,63,70,84,93,133,158,160,82,151,162,176,185,188,173,148,208,', NULL),
(283, 'Mohammad Shajib Khan', 'Shajib', 'Male', '300 CONSTITUTION AVE', 'BAYONNE', 'New Jersey', '07002', '5164103936', NULL, NULL, 'shajibcse067@gmail.com', NULL, 1988, 34, NULL, 68, 150, 'Dhaka, Bangladesh', 'Normal', 'Single', NULL, NULL, NULL, 'Permanent Resident', NULL, 'HSC', 2005, 'BS in Computer Science & Engg.', 2011, 'MS in Computer Science', 2013, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Salesforce.com Inc', 'Senior software engineer', 270000, 'Sunni', NULL, 'Alhamdulillah, I pray 5 times a day, do fasting, give zakat, try to visit mosque often apart from jumma.', NULL, 'No', 'No', 'Sunni', NULL, 'I would like her to be a practicing muslima or at least who has the true intention to become a better muslima over time.', 'No Preference,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'No Preference,', 'No', 'No Preference', 'No Preference', 1, 15, 'Jaheda Begum', '300 Constitution Ave', 'Bayonne', 'New Jersey', 'USA', '5164103936', 'shajibcse067@gmail.com', 'Homemaker', NULL, 'Monowar Hossain', 'Friend', '(347) 694-9012', 'Shahin Rahman', 'Friend', '(551) 232-3474', 'Farhan Fahim', 'Friend', '(571) 474-9891', 'anonymous.png', 'RWKY7WGMSK_Bio.pdf', NULL, NULL, 5, 'V2pJeFJtSlhVV3BOYW10NFRsRTlQUT09', 'Active', 92, '2023-12-12 05:25:01.000000', '2024-01-30 11:49:24.000000', '43394274', '63,160,208,42,70,84,93,151,158,173,', '50,50,50,40,40,40,40,40,40,40,', '164,42,70,46,63,160,188,151', NULL, NULL, '5O6YPSUScreen_Shot_2023-12-12_at_11.42.23_AM.png', 'CFB0D4JWhatsApp_Image_2023-12-08_at_20.16.54.jpeg,S1VT787WhatsApp_Image_2023-12-08_at_20.31.02.jpeg,VEC3Z75WhatsApp_Image_2023-12-08_at_20.19.50.jpeg,gallery4.jpg', NULL, NULL, '63,160,164,42,70,84,93,103,133,151,158,162,176,188,173,148,208,', NULL),
(285, 'Yeasin Arafat', NULL, 'Male', NULL, NULL, 'Delaware', NULL, '2154060326', NULL, NULL, 'yeasinraghib@gmail.com', NULL, 1986, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'Vld0Q2JtRkhiR2xOZWswOQ==', 'Inactive', NULL, '2023-12-27 05:26:57.000000', '2023-12-27 05:29:53.000000', '59961827', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(286, 'NAFIS A HOQUE', 'Nafis', 'Male', '418 Commons Park Ln, Tucker, GA 30084 USA', 'Atlanta', 'Georgia', NULL, '14047831724', NULL, NULL, 'nafismarriage5450@gmail.com', NULL, 1999, 25, NULL, 68, 160, 'USA', 'EXCELLENT', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Parkview High School', 2017, 'GA State University', 2021, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'AT&T', 'Software Developer', 100000, 'Sunni', NULL, 'My son prays five times and abides by all religious rules and regulations.', NULL, 'Yes', NULL, 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 2, 'Mazharul Hoque', '418 COMMONS PARK LN', 'TUCKER', 'Georgia', 'USA', '4047831724', 'nafismarriage5450@gmail.com', 'SYSTENS ENGINEER', 'My son Nafis is very bright and brilliant in parallel he finished the Hifzul Quran while in High School. He is very punctual in his daily five times prayers and reads the Quran every day. Our children grew up in an Islamic environment. We are the parents looking for a similar Allah-fearing girl.', 'Professor Siraj Dowla', 'Grandfather', '770-364-0703', 'Dr Nurul Hoque', 'Uncle', '678-491-5608', NULL, NULL, NULL, 'anonymous.png', '3E067VFNafis_Bio.pdf', NULL, 'OPJDFJ2Nafis_Signature.pdf', 5, 'VlZoa2JHTnVValZOVkVsclNrRTlQUT09', 'Active', 90, '2024-01-01 12:16:58.000000', '2024-03-31 03:42:39.000000', '58260134', '180,63,158,160,173,185,70,77,151,201,', '60,50,50,50,50,50,40,40,40,40,', '157,70,158,160,162,185,176,180,63', NULL, NULL, 'Y621CD3Nafis_Signature_1.jpg', 'PWI7UF51618796042958.jfif,66RNO2PIMG-2111.JPG,LCY24ELNafis.png,gallery4.jpg', NULL, NULL, '63,158,160,162,70,77,151,164,176,42,84,185,188,180,173,201,148,', NULL),
(287, 'Ali Ahmad', NULL, 'Male', NULL, 'Bloomington', 'Illinois', '61701', '3097500186', NULL, NULL, 'ali.bd.sust@gmail.com', NULL, 1993, 31, NULL, 71, 78, 'Sylhet, Bangladesh', 'Normal', 'Single', NULL, NULL, NULL, 'Student Visa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JO9IIF4inbound4438655269068753645.jpg', NULL, NULL, NULL, 5, 'VkZkc2RtUkVTWGROVkdjOQ==', 'Inactive', 26, '2024-01-03 16:40:24.000000', '2024-01-03 16:49:39.000000', '44707994', NULL, NULL, NULL, NULL, NULL, 'D83LG4Rinbound879450647053095505.jpg', 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(288, 'Tahsin A', 'Shafin', 'Male', NULL, 'Los Angeles', 'California', NULL, '3235717327', NULL, NULL, 'tahsinazad31@gmail.com', NULL, 2002, 22, NULL, 68, 140, 'Los Angeles, California, USA', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Francisco Bravo Medical Magnet', 2020, 'University of California, Santa Barbara', 2024, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Expatiate Communications', 'Data Science Internship', 30000, 'Sunni', NULL, 'Praying 5 times a day, Sunnah fasts, speaking and attending in halaqahs, memorizing Quran, learning Arabic, always learning about Islam Alhamdulilah.', NULL, 'Yes', 'No', 'Sunni', NULL, 'Prays 5 times a day, has at least 20 surahs memorized, chaste, good character, modest, learning Islam.', 'Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'US Citizen,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 3, 'Abdul Mukit Azad', NULL, NULL, NULL, NULL, '3233099827', 'abdulazad08@gmail.com', 'Imam of Hollywood Masjid', NULL, 'Abdul Mukit Azad', 'Father', '3233099827', 'Sadnan Azad', 'Brother', '2138580778', 'Salima Parvin', 'Mother', '3233076232', 'anonymous.png', NULL, NULL, 'JUJUK1320240103_093731-min.jpg', 5, 'VlRKb2FGcHRWbXhOVkVGNlRWTlNRUT09', 'Deactivated', 95, '2024-01-03 22:59:53.000000', '2024-03-04 11:34:59.000000', '67371754', '63,70,158,160,173,176,180,185,42,77,', '40,40,40,40,40,40,40,40,30,30,', '77,162,70', NULL, NULL, '345J9KVScreenshot_20231231-133510_One_UI_Home~2.jpg', 'HEYZD9AScreenshot_20240104-052141_Photos.jpg,H04RN4AScreenshot_20240104-051617_Photos.jpg,H7HE4JCScreenshot_20240104-051950_Photos.jpg,BW6ZXNGScreenshot_20240104-051745_Photos.jpg', 'AWJAS3JIMG_7086.jpeg,1I3DTFNIMG_7085.jpeg,83S1DJFIMG_7085.jpeg,T18SWITIMG_7085.jpeg', NULL, '63,70,158,160,162,164,176,42,77,84,93,185,188,180,173,', NULL),
(289, 'Md Sibber Islam', 'Real', 'Male', '632 Logan Street', 'Brooklyn', 'New York', '11208', '3478542607', '(929) 823-9532', '(929) 823-9532', 'roneyislambd@gmail.com', NULL, 1997, 27, NULL, 71, 85, 'Dhaka', 'Healthy', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VlcwNWRWcFliRUZPVkdNMFRXYzlQUT09', 'Inactive', 24, '2024-01-12 10:54:18.000000', '2024-01-17 15:07:42.000000', '81898771', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(290, 'SAMIOL Azam', NULL, 'Male', '18544 Split Rock Lane', 'Germantown', 'Maryland', '20874', '7866162233', NULL, NULL, 'samiolazamphd@gmail.com', 'https://www.linkedin.com/in/samiol-azam/', 1985, 39, NULL, 65, 130, 'Tangail, Bangladesh', 'No health conditions', 'Divorced', 'No', NULL, NULL, 'Permanent Resident', NULL, 'Aishara High School, Bashail, Tangail', 2001, 'Chemistry, University of Dhaka', 2009, 'Chemistry, Florida International University', 2017, 'Chemistry, Florida International University', 2019, 'Postdoctoral Scientist, Johns Hopkins University', 2020, 'Doctorate', 'Yes', 'Novavax Inc', 'Research and Development Scientist', 150000, 'Sunni', NULL, 'I am a practicing Muslim. I pray 5 times, fast during Ramadan, and do other religious obligations. I would like to spend the rest of my life following the Holy Quran and Sunnah.', NULL, 'No', 'No', 'Sunni', NULL, 'I am looking for a religious spouse who prays obligatory prayers, fasts during Ramadan, and does other religious obligations. It would be best if my prospective spouse wears the hijab but it is not a dealbreaker.', 'No Preference,', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,EAD,Other,', NULL, 'Single,Divorced,', 'No', 'Bachelor', 'No Preference', 1, NULL, 'Dr Shaha Alam', 'Aishara, Bashail', 'Tangail', NULL, 'Bangladesh', NULL, NULL, 'Retired doctor', NULL, 'Quazi Sayeed', 'Brother', '2404604257', 'Kazi Lingkon', 'Brother', '4199736660', 'Saiful Islam Liton', 'Brother', '7182071484', 'anonymous.png', 'SA7OYFGBiodata-of-Samiul-Azam-for_MUNA.pdf', NULL, 'ZBY0DS4Greencard_Front.jpg', 5, 'VlRJNWRWbFlTbWxaVnpWdVlrZEdRVTFVV1QwPQ==', 'Active', 90, '2024-01-15 07:18:20.000000', '2024-04-15 12:26:36.000000', '84738765', '160,63,158,173,180,185,201,204,208,42,', '50,40,40,40,40,40,40,40,40,30,', '46,84,160,63', NULL, '158', 'GISPJP3Samiol_Sig.jpg', 'N6JW97NNiagara_Falls_from_Top.jpg,TQPVY78Niagara_Falls_from_Top-second_-_Copy.jpg,9DJDUC1Sunset_Cruise-Miami.jpg,SKODI0HNiagara_Falls_Night_View.jpg', NULL, NULL, '160,63,158,162,176,185,42,70,77,84,188,180,173,193,201,148,208,204,', NULL),
(291, 'SM Mithun Hossain', NULL, 'Male', NULL, NULL, 'New York', NULL, '8606346754', NULL, NULL, 'hossaintapu5@gmail.com', NULL, 1983, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZkc01HRklWblZLYWtWNVRYYzlQUT09', 'Inactive', NULL, '2024-01-19 22:17:31.000000', '2024-01-19 22:17:31.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(292, 'Asif Ahmed', NULL, 'Male', '1619 University Avenue', 'Lubbock', 'Texas', '79401', '8067588025', NULL, NULL, 'asif054303@gmail.com', NULL, 2001, 23, NULL, 64, 170, 'Dhaka, Bangladesh', 'None', 'Single', NULL, NULL, NULL, 'Student Visa', NULL, 'Academia', 2021, 'Texas Tech University', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, 1, 'Sunni', NULL, 'Alhamdulillah I pray 5 times a day. Fajr, Magrib, and Esha are a must at the masjid. Dhuhr and Asr are sometimes prayed in jamah on campus due to class and work. I\'m quite active on conducting halaqahs in my local masjid, and brothers love to reach out to me if they face any problem in the masjid. Alhamdulillah, I also try to fast on Mondays and Thuradays regularly.', NULL, 'Yes', 'No', 'Sunni', NULL, 'I woukd definitely prefer my spouse to have fundamental knowledge of Islam besides praying 5 times a day.', 'Niqab,', 'No', 'Own Ethnicity', 'Bangladeshi', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 6, 'Arif Ahmed', '1619 University Avenue', 'Lubbock', 'Texas', 'United States', '8069395591', 'arif44183@gmail.com', 'Environmental Engineer', NULL, 'Mirza Khyum', 'Local Brother', '+14702654763', 'Md Abdul Hakim', 'Local Brother', '+17062893647', 'Mahbub Zaman', 'Local Brother', '+14057194580', 'P0XADYD1000037398.jpg', 'HWGKCVSAsif_Ahmed_BioData_2024.pdf', NULL, 'PWQ1WEXCamScanner_01-10-2024_15.43.jpg', 5, 'VkZjNWFXRlhlR3hKZWxsNlRVUkJQUT09', 'Active', 97, '2024-01-24 13:38:49.000000', '2024-04-22 13:27:07.000000', '15599807', '63,42,70,77,93,151,158,160,173,180,', '50,40,40,40,40,40,40,40,40,40,', '77', NULL, '42', 'UTRVBO01000037407.jpg', 'U3V7HHK1000037398.jpg,68QLFGT1000037399.jpg,ZTE2Y311000037400.jpg,SOZJX5B1000037402.jpg', NULL, NULL, '63,188,42,70,77,93,151,158,160,162,176,173,148,180,', NULL),
(293, 'Abdul Bari', 'Mahtab', 'Male', '832 S Oxford Ave', 'Los Angeles', 'California', '90005', '2135176800', NULL, NULL, 'abd.bari871@gmail.com', NULL, 1999, 25, NULL, 163, 132, 'Dhaka, Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Birshreshtha Munshi Abdur Rouf Public College', 2016, 'International University of Business Agriculture and Technology', 2021, 'MBA', 2024, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Residence Inn (Hotel Marriot)', 'Front Desk coordinator', 55, 'Sunni', NULL, 'Try to pray 5 times a day and practice retuals', NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Own Ethnicity', NULL, 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 5, 'Fazlur Rahman', NULL, 'Dhaka', NULL, 'Bangladesh', '01718772663', NULL, 'Businessman', NULL, 'Abdul Malek', 'Brother', '2139242511', 'Motiar Rahman Mukul', 'Brother', '2138406802', 'Ashraf Akbar', 'Brother', '2139262959', 'WHRAXQPIMG_3619.jpeg', 'PJT33YBAbdul_Bari.pdf', NULL, 'QR47YMDIMG_0733.jpeg', 5, 'VkZaV1QxRkVSWGxOZHowOQ==', 'Active', 90, '2024-01-27 04:36:01.000000', '2024-05-09 10:18:02.000000', '26650560', '63,180,42,70,77,93,151,158,160,173,', '50,50,40,40,40,40,40,40,40,40,', '70,180,77', NULL, '42', '5XUWLP7IMG_0734.jpeg', 'CV1VPECIMG_20230421_0008.jpeg,Z8E8EM1IMG_3462.jpeg,A3L0DOPa525129c2b7c12e79c5b25106277f699a70fb6fd750f46112dd45feece36fb81_-_instasize_2.jpg,NCX74PNIMG_20230421_0008.jpeg', NULL, NULL, '63,42,70,77,93,151,158,160,162,176,188,180,173,148,', NULL),
(294, 'Noushat Hossain', NULL, 'Male', NULL, NULL, 'New York', NULL, '7169550425', NULL, NULL, 'noushathossain@gmail.com', NULL, 2000, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'U2tSRk1FMUZWbXRoV0U1MlltYzlQUT09', 'Inactive', NULL, '2024-01-29 12:38:37.000000', '2024-01-29 12:38:37.000000', '42936524', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(295, 'Noushat Hossain', NULL, 'Male', NULL, NULL, 'New York', NULL, '7169550425', NULL, NULL, 'noushathossain@gmail.com', NULL, 2000, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'U2tSRk1FMUZWbXRoV0U1MlltYzlQUT09', 'Inactive', NULL, '2024-01-29 12:40:05.000000', '2024-01-29 12:40:05.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(296, 'Md Asrafuzzaman', NULL, 'Male', '4145 52nd St Apt 4E', 'Woodside', 'New York', '11377-4504', '9296828855', NULL, NULL, 'rozenasrafuzzaman240@gmail.com', NULL, 1996, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WVRKV2JHTkhPVEZrUVQwOQ==', 'Inactive', 14, '2024-02-03 17:14:32.000000', '2024-02-03 17:18:22.000000', '57756210', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(297, 'Md Asrafuzzaman', NULL, 'Male', NULL, NULL, 'New York', NULL, '19296828855', NULL, NULL, 'rozenasrafuzzaman240@gmail.com', NULL, 1996, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WVRKV2JHTkhPVEZrUVQwOQ==', 'Inactive', NULL, '2024-02-03 17:17:18.000000', '2024-02-03 17:17:18.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(299, 'Tanvir Ahmed', NULL, 'Male', '6702 Stone Hill Road', 'Upper Marlboro', 'Maryland', '20772', '5715459071', NULL, NULL, 'tahmed.student@wust.edu', 'NO', 2001, 23, NULL, 68, 144, 'Bangladesh', 'I don\'t have any of these issues ;Al hamdulillah', 'Single', NULL, NULL, NULL, 'F-1', NULL, 'MC academy model school and college', 2020, 'Bachelor of science in Information Technology', 2024, 'NO', NULL, 'NO', NULL, 'NO', NULL, 'Bachelor', 'Yes', 'At a food company in maryland', 'Employee', 32000, 'Sunni', NULL, 'Al hamdulillah! I pray all five prayers on time and try to pray all in the congregation, trying to build more Islamic knowledge, implementing the teachings of our beloved prophet Mohammad (sa) in my daily life, and adhering to the 5 Islamic pillars within my ability.', 'I am a born muslim', 'Yes', 'No', 'Sunni', NULL, 'She must be practicing Deen, understanding, and loving. My purpose is to make Jannah and I want to make it with her.', 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,EAD,Other,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 5, 'Jubayer bokth', '1172 sutter ave', 'Brooklyn', 'New York', 'United States', '3477202871', 'tanvirahmedsy500@gmail.com', 'IT job holder', NULL, 'Jubayer', 'Brother', '347 720 2871', NULL, NULL, NULL, NULL, NULL, NULL, '2NKHRQLIMG_2788.jpg', 'CP03YTCTanvir\'s_bio_data_.docx', NULL, 'ZQLMNUMTanvir\'s_replacement_I-20_2nd.pdf', 5, 'VmtWQ2RXUnRiSGxKZVUxNFRXYzlQUT09', 'Active', 97, '2024-02-04 17:21:54.000000', '2024-05-07 03:44:30.000000', '40857986', '63,77,180,70,151,158,160,173,185,196,', '50,50,50,40,40,40,40,40,40,40,', '63,70,77,180,188,158', NULL, '151', 'GQJ0RTOIMG_0712.PNG', 'C2896Q9IMG_2788.jpg,SHJTFG3IMG_1928_(1).jpg,HQYOL1PB18959DA-F125-4C2E-883B-6BE0E7BAEEF1.jpeg,AMZE4EN756F1EDB-8952-4BBA-9467-4ECB3F55933A.png', NULL, NULL, '63,77,180,188,70,151,158,160,162,176,185,173,196,148,', NULL),
(301, 'Momin Islam', NULL, 'Male', NULL, NULL, 'Texas', NULL, '4092398434', NULL, NULL, 'mominislam111@gmail.com', NULL, 1995, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVRJNWRtSkhTbXhpYldSb1lrZHJOVTVSUFQwPQ==', 'Inactive', NULL, '2024-02-15 18:20:49.000000', '2024-02-15 18:20:49.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(302, 'Momin Islam', NULL, 'Male', NULL, NULL, 'Texas', NULL, '4092398434', NULL, NULL, 'mominislam111@gmail.com', NULL, 1995, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVRJNWRtSkhTbXhpYldSb1lrZHJOVTVSUFQwPQ==', 'Inactive', NULL, '2024-02-15 18:22:08.000000', '2024-02-15 18:22:08.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(303, 'Shahadur Rahman', 'Ovi', 'Male', '610 Lafayette Pl, Apt 1', 'Cape Girardeau', 'Missouri', '63701', '3147602141', NULL, NULL, 'shahedovi04@gmail.com', NULL, 1994, 30, NULL, 67, 165, 'Brahmanbaria', NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Bepza Public College', 2011, 'Eastern University', 2016, 'Southeast Missouri State University', 2024, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'SEMO', 'Graduate Teaching Assistant', 9500, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,F-1,H1B,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masud Rana', 'Uncle', '2672067874', NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'WXpKb2FHRkhWbXRpTTFwd1RVUlNRUT09', 'Inactive', 78, '2024-02-18 15:40:33.000000', '2024-02-18 15:56:25.000000', '12403370', NULL, NULL, NULL, NULL, NULL, 'GYCFT3Hovi.jpg', 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(304, 'K Shamim', NULL, 'Male', NULL, 'MADISON', 'Wisconsin', '53715', '6086093776', NULL, NULL, 'muntasir572@gmail.com', NULL, 1997, 27, NULL, 72, 190, 'RANGPUR, BANGLADESH', NULL, 'Single', NULL, NULL, NULL, 'F-1', NULL, NULL, NULL, 'Electrical Engineering,', 2018, 'Electrical and Computer Engineering, UW Madison', 2023, 'Electrical and Computer Engineering, UW Madison', NULL, NULL, NULL, 'Doctorate', 'Yes', 'Research Assistant', 'PhD', 32000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen,Permanent Resident,H1B,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoV2RXUkhSbnBoV0VwQlRVUkJNdz09', 'Inactive', 51, '2024-02-25 11:57:54.000000', '2024-02-25 12:10:15.000000', '62609016', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(305, 'K Shamim', NULL, 'Male', NULL, NULL, 'Wisconsin', NULL, '6086093776', NULL, NULL, 'muntasir572@gmail.com', NULL, 1997, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoV2RXUkhSbnBoV0VwQlRVUkJNdz09', 'Inactive', NULL, '2024-02-25 12:01:34.000000', '2024-02-25 12:01:34.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `UserApp_maleuser` (`userId`, `fullName`, `nickName`, `gender`, `address`, `city`, `state`, `zip`, `cellPhone`, `workPhone`, `homePhone`, `email`, `personalWebsite`, `birthYear`, `age`, `dateOfBirth`, `height`, `weight`, `placeOfBirth`, `health`, `maritalStatus`, `children`, `childrenNumber`, `childrenAges`, `immigrationStatus`, `immigrationStatusOther`, `highSchool`, `highSchoolYear`, `bachelors`, `bachelorsYear`, `masters`, `mastersYear`, `doctorate`, `doctorateYear`, `otherDegree`, `otherDegreeYear`, `highestEducation`, `employed`, `employment`, `position`, `income`, `religiousPractice`, `religiousPracticeOther`, `religiousPracticeBrief`, `revertTime`, `beard`, `smoker`, `preReligious`, `preReligiousOther`, `preReligiousBrief`, `preWear`, `preSmoking`, `preEthnic`, `preEthnicSpecific`, `preImmigrationStatus`, `preImmigrationStatusOther`, `preMaritalStatus`, `preChildren`, `preEducation`, `preEmployment`, `preIncome`, `preAgeGap`, `guarName`, `guarAddress`, `guarCity`, `guarState`, `guarCountry`, `guarPhone`, `guarEmail`, `guarProfession`, `familyBrief`, `refName1`, `refRelation1`, `refPhone1`, `refName2`, `refRelation2`, `refPhone2`, `refName3`, `refRelation3`, `refPhone3`, `photo`, `cv`, `album`, `govIssuedId`, `matchShowLimit`, `userPass`, `status`, `profileCompleteness`, `openingDate`, `lastEdit`, `userToken`, `matchId`, `matchPercentage`, `reqAccepted`, `reqRejected`, `reqSent`, `signature`, `gallery`, `tempGallery`, `lockedId`, `cuMatchId`, `reqLock`) VALUES
(306, 'Jamil Hossain', NULL, 'Male', NULL, NULL, 'Pennsylvania', NULL, '+393285839789', NULL, NULL, 'jamil317.jh@gmail.com', NULL, 1994, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoV2VWb3lhSEJOZWtWM1RuYzlQUT09', 'Inactive', NULL, '2024-02-29 16:29:28.000000', '2024-02-29 16:29:28.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(307, 'Jamil', NULL, 'Male', NULL, 'Lansdale', 'Pennsylvania', '19446', '3285839789', NULL, NULL, 'Jamil317.jh@gmail.com', NULL, 1994, 30, NULL, 54, 170, 'Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'Other', 'I am Italian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoV2VWb3lhSEJSUkUxNFRVUmpQUT09', 'Inactive', 24, '2024-02-29 16:43:26.000000', '2024-02-29 16:58:57.000000', '46861848', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(308, 'Salik Ahmed', NULL, 'Male', NULL, NULL, 'New York', NULL, '3476912333', NULL, NULL, 'ahmedsalikny2016@gmail.com', NULL, 1991, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZoV2RWbFVTWGROYWxGeA==', 'Inactive', NULL, '2024-03-11 11:59:41.000000', '2024-03-11 11:59:41.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(309, 'Jamil rahman', NULL, 'Male', NULL, NULL, 'New York', NULL, '3479162613', NULL, NULL, 'Mjamil97@gmail.com', NULL, 1997, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVcxR2MySkhWbmxQVkdSQldsaHZlRTFuUFQwPQ==', 'Inactive', NULL, '2024-03-16 00:05:50.000000', '2024-03-16 00:05:50.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(310, 'Dada Khalandar Mandi', NULL, 'Male', NULL, 'Sunnyvale', 'California', '94086', '4173079897', NULL, NULL, 'dadakhalandarmandi@gmail.com', NULL, 1997, 27, NULL, 70, 162, NULL, 'No Health Issues', 'Single', NULL, NULL, NULL, 'EAD', NULL, 'General High School', 2014, 'Information Technology', 2018, 'Computer Science', 2022, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'ServiceNow', 'Software Engineer', 200000, 'Other', 'I follow Islam and respect sunni and others', 'I do fast the whole month of Ramadan and do prayers according to my schedules.', 'I born as muslim', 'Yes', 'No', 'Other', 'I respect whatever she believes', 'I believe in Islam', 'No Preference,', 'No Preference', 'Own Ethnicity', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'No Preference', 'Yes', 1, 5, 'Masood Vali', NULL, NULL, NULL, NULL, '+919963536205', 'mvali@gmail.com', NULL, NULL, 'Dadapeer', 'Cousin Brother', '9533315385', NULL, NULL, NULL, NULL, NULL, NULL, 'Z5CY01OIMG_5746.jpeg', '0FR5RWLDada_Khalandar_Mandi_Resume_(2).pdf', NULL, 'AFYTVZYMicrosoftTeams-image_(47).jpg', 5, 'VDFSck1rMTZWWHBPYWtsM1RrVkNSVmxYVW1nPQ==', 'Pending', 97, '2024-03-16 08:46:16.000000', '2024-04-06 10:03:54.000000', '28637283', NULL, NULL, NULL, NULL, NULL, 'ZD4PY4AMicrosoftTeams-image_(47).jpg', 'HRNYT1ZIMG_5757.jpeg,9X3OGVYIMG_5760.jpeg,9TVVFDYIMG_5761.jpeg,220UD6XIMG_5762.jpeg', NULL, NULL, NULL, NULL),
(311, 'Md Mushfiqul Islam', NULL, 'Male', '11500 Summit West Blvd, Apt 2C', 'Tampa', 'Florida', '33617', '8138226319', NULL, NULL, 'mushfiq9413@gmail.com', NULL, 1995, 29, NULL, 70, 235, 'Bangladesh', 'Have spectacles', 'Divorced', 'No', NULL, NULL, 'F-1', NULL, 'Notre Dame College', 2013, 'Khulna University of Engineering & Technology', 2018, NULL, 2024, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'University of South Florida', 'Graduate Teaching Assistant', 24000, 'Sunni', NULL, 'Daily prayer, Try to attend Fajar and Isha in Masjid regularly. Halal zabiha meat.', NULL, 'Yes', 'No', 'Sunni', NULL, 'Pious, Loyal, Modest, Soft spoken', 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,Other,', NULL, 'Single,Divorced,Widowed,', 'No', 'No Preference', 'No', 1, 6, 'Md Monjurul Islam', 'Flat F2, House no 63, Road no 15/A, Dhanmondi', 'Dhaka', NULL, 'Bangladesh', '01709992151', 'monju7981@gmail.com', 'Service Holder', 'Islamic minded and conservative', 'Major Md Manjurul Kabir', 'Maternal Uncle', '01769667756', 'Dr Md Mahmudul Kabir Faruq', 'Maternal Uncle', '01741895979', 'Md Mahbub Mushed Tareq', 'Senior Brother', '347-690-0850', 'FS2LL9WIMG_20231203_072546227_HDR-min.jpg', 'GF0OJCPBio-data-_Md-Mushfiqul-Islam_Updated_(1).pdf', NULL, 'DEL41ESePassport_Md_Mushfiqul_Islam.jpg', 5, 'VkRJMWMyRlhOV3haTWpreFkyNU9iRTlVVVhoTmVXODk=', 'Active', 100, '2024-03-25 17:21:08.000000', '2024-05-05 04:38:02.000000', '67773492', '63,93,158,160,173,180,196,201,208,42,', '50,50,50,50,50,50,50,50,50,40,', '173,158,151,201', NULL, NULL, 'CUVY4TDsignature_Mushfique.jpg', 'U3GB700im1.jpg,BPJNC8Xim2.jpg,F7HNR35im3.jpg,FLAK9ZRim4.jpg', NULL, NULL, '63,93,158,160,173,176,196,201,42,70,180,208,', NULL),
(312, 'Abrar Hossain', NULL, 'Male', NULL, 'Toledo', 'Ohio', '43607', '4193207896', NULL, NULL, 'abrarhossainhimself@gmail.com', NULL, 1997, 27, NULL, 73, 195, 'Chittagong, Bangladesh', 'None', 'Single', NULL, NULL, NULL, 'F-1', NULL, NULL, NULL, 'Electrical and Electronic Engineering', NULL, 'Computer Science Engineering', 2023, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'University of Toledo', 'Graduate Research Assistant', 25000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No Preference', 'Specific Ethnicity', 'Other', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,EAD,Other,', NULL, 'Single,Divorced,Widowed,', 'Yes', 'No Preference', 'No Preference', 1, 15, 'Motahar Hossain', 'Flat: E6, Soco Valley, Lane #1, Road#1, Block# C, South Khulshi R/A, Chittagong, Bangladesh', 'Chittagong', NULL, 'Bangladesh', '01923949883', NULL, 'Retired Chief Electrical Engineer, Bangladesh Power Development Board', NULL, 'Faisal Siraj', 'Uncle', '4192976163', 'Nusrat Siraj', 'Aunt', '40367529647', 'Mehrab Hasan', 'Friend', '9402586634', 'ZGMBUGSIMG_9086.jpg', '61N4L6AJake_s_Resume.pdf', NULL, NULL, 5, 'VW0xR2FscFhTblppTW5SQlRtcEZlRTVFUVhjPQ==', 'Active', 92, '2024-03-31 15:50:50.000000', '2024-05-02 14:02:13.000000', '77838865', '42,46,63,70,77,84,93,151,158,160,', '30,30,30,30,30,30,30,30,30,30,', '42,46,70,77,63', NULL, NULL, 'WBWOXZGSignature.jpg', 'NCGPP3T416751281_6955213931181316_3942299523608170318_n.jpg,HXFA8ZU391638898_6677199242316121_9108797929924305718_n.jpg,0DJW7EG20220818_173008-min.jpg,7BYI6U9Screenshot_from_2024-03-31_22-26-13.png', NULL, NULL, '42,46,63,70,77,84,93,151,158,160,', NULL),
(314, 'Md Saiful Islam', 'Saif', 'Male', 'Callowhil st', 'Philadelphia', 'Pennsylvania', '19130', '3476461803', NULL, NULL, 'imsaifulsaif@gmail.com', NULL, 1995, 29, NULL, 71, 170, 'Chittagong, Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'Student Visa', NULL, 'Patiya Adarsha High School', 2012, 'Bachelor of Computer Science and Engineering', 2022, 'Masters in Cybersecurity at Rowan University', 2024, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'At A restaurant as I am still on student visa', 'Cashier', 36000, 'Sunni', NULL, 'I am a practicing Musilm Alhamdulillah.', NULL, 'Yes', 'No', 'Sunni', NULL, 'Pray 5 times. Has religious value', 'No Preference,', 'No', 'No Preference', 'No Preference', 'US Citizen,Permanent Resident,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 9, 'Md Sayed', '2 no gate', 'Chittagong', NULL, 'Bangladesh', '01815522177', 'mdsayed20231@gmail.com', 'Ex High School Teacher & Retired Shipping Manager', 'Our family holds steadfast to the teachings of Islam, finding solace and guidance in the Quran and Sunnah.\nWe prioritize kindness, empathy, and respect in our interactions with others, regardless of differences.\nEducation is highly valued in our family, as we believe it empowers individuals to achieve their aspirations and contribute positively to society.', 'Md Sayed', 'Father', '01815522177', NULL, NULL, NULL, NULL, NULL, NULL, '5CRFY5VIMG_0566.jpeg', 'O3YCT94Saiful_Islam_Bio.pdf', NULL, 'CLGBOXTIMG_0699.jpeg', 5, 'VlRKR2NGcHJPWFZOYWtWcg==', 'Active', 97, '2024-04-06 07:24:01.000000', '2024-05-21 09:20:58.000000', '39383007', '63,160,208,42,70,84,93,151,158,173,', '50,50,50,40,40,40,40,40,40,40,', '42,63,70,93,84,160', NULL, NULL, '0KKUZHXIMG_0700.jpeg', 'ISLQ1IRIMG_0566.jpeg,ILZJWNA49be6ab9-e4da-4a54-9b29-aace731f5be5.jpeg,CQZS5ABIMG_0697.jpeg,TBU9WAN1a49e9e8-83ec-42e9-91d3-f2e593e7fb43.jpeg', NULL, NULL, '42,63,70,84,93,158,160,173,176,185,151,208,', NULL),
(315, 'Nurul Akter', 'Emon', 'Male', '8400 John Robert Dr', 'Oklahoma City', 'Oklahoma', '73135', '4054060940', NULL, NULL, 'nurulakter8@gmail.com', NULL, 1998, 26, NULL, 71, 155, 'Bangladesh', NULL, 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'WestMoore High School', 2016, 'University Of Central Oklahoma', 2021, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Southwest Airlines', 'SCM Analyst', 100000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,Student Visa,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 7, 'Mohammed Nurul Karim', '8400 John Robert Dr', 'oklahoma city', 'Oklahoma', 'United States', '4053713303', 'nurulkarim8@gmail.com', 'Business Owner', 'Former Manager at Uttara Bank Limited.', 'Suraya Begum Bahadur', 'Mother', '4053715975', 'Nurul Azim', 'Older Brother', '4054081145', 'Sumiya Bahadur', 'Younger Sister', '4054766737', '2XEMV5CIMG_4108-2.jpg', 'BTD1MA0Nurul_Akter.pdf', NULL, '8EGGPW9IMG_4229.JPG', 5, 'VmtjNWRtVlhPWFpOVkdzMVQwRTlQUT09', 'Deactivated', 97, '2024-04-15 08:35:20.000000', '2024-05-26 08:13:32.000000', '32383064', '63,160,208,42,70,93,151,158,173,180,', '50,50,50,40,40,40,40,40,40,40,', '70,215', NULL, NULL, '6CEAUK0Screen_Shot_2024-05-04_at_1.31.57_AM.png', 'VBJV87HIMG_4108-2.jpg,XZNCKNDIMG_0645.jpg,6IG1DXIIMG_3362.jpg,8OM89AUIMG_8336.jpg', NULL, NULL, '63,160,208,42,70,93,151,158,173,180,', NULL),
(316, 'hogiug', NULL, 'Male', NULL, NULL, 'New York', NULL, '3474359524', NULL, NULL, 'rsetara@fordham.edu', NULL, 1995, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'Vlc1V2FXVlVSWGxOZWxGcg==', 'Inactive', NULL, '2024-04-28 11:04:29.000000', '2024-04-28 11:04:29.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(317, 'Mir Redoyan Karim', 'Prottoy', 'Male', '106-44 Ruscoe St', 'Jamaica', 'New York', '11433', '929-979-0683', '9299790683', '9299790683', 'mirkarim216@gmail.com', NULL, 2004, 20, NULL, 1, 104, 'Dhaka Bangladesh', 'N/A', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, 'Francis Lewis High School', 2023, 'Queensborough Community College', 2024, 'Criminal Justice', 2024, NULL, NULL, NULL, NULL, NULL, 'No', NULL, NULL, 1, 'Sunni', NULL, 'Daily Prayers,Fasting,attending Halaqas,visit the masjid daily', NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 50000, 2, 'Omme Kulsum', '106-44 Ruscoe St', 'Jamaica', 'New York', '11433', '6464746567', 'mirkarim216@gmail.com', 'Nurse', NULL, 'MST Parveen', 'Aunt', '3475931279', 'Omme Kulsum', 'Mother', '6464746567', 'Mir Rezaul Karim', 'Father', '9294996240', 'LWREJ32IMG_0907.jpeg', '11UWCTIMir_Karim_Resume.pdf', NULL, '6HLPF3RIMG_1080.jpeg', 5, 'VlVoS2RtUklVblpsVlVGNVRVUkJNQT09', 'Pending', 95, '2024-04-28 11:52:01.000000', '2024-05-11 09:43:55.000000', '26103337', NULL, NULL, NULL, NULL, NULL, 'R8QM37YIMG_1081.jpeg', 'HOHD468IMG_1081.jpeg,CMYFGCTIMG_1082.jpeg,F0BKDCOIMG_1083.jpeg,BDFI55NIMG_1085.jpeg', NULL, NULL, NULL, NULL),
(318, 'Muhammad T Rahman', NULL, 'Male', NULL, NULL, 'Texas', NULL, '2142359656', NULL, NULL, 'mtr.utx@gmail.com', NULL, 1979, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VkZkR2VtRkhkREZqYlVWNA==', 'Inactive', NULL, '2024-05-04 12:44:27.000000', '2024-05-04 12:44:27.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(319, 'Md Amjad Hossain Chowdhury', 'Shorif', 'Male', '21 Kristin drive', 'Schramburgh', 'Illinois', '60195', '2247136545', '2247136545', '2247136545', 'hossainshowpno089@gmail.com', NULL, 1996, 28, NULL, 67, 68, 'Cummilla, Bangladesh', 'No problem', 'Single', NULL, NULL, NULL, 'F-1', NULL, 'Bangladesh Nou-bashing school', 2013, 'North south university', 2022, 'Western Illinois university', 2023, NULL, NULL, 'Higher secondary college', 2015, 'Masters', 'Yes', 'Cellex repair shop', 'Employee', 40000, 'Sunni', NULL, 'Praying 5 times, fasting and visiting the mosque.', NULL, 'No', 'No', 'Sunni', NULL, 'Pray 5 times.', 'Headscarf,Niqab,', 'No', 'Specific Ethnicity', 'Bangladeshi', 'US Citizen,Permanent Resident,Student Visa,F-1,H1B,', NULL, 'Single,', 'No', 'Bachelor', 'Yes', 40000, 3, 'Md Sadeque Hossain Chowdhury', 'Road:01,Lane:05,Bashundhara\nNeelcaya', 'Chittagong', NULL, 'Bangladesh', '01754835410', 'hossainshowpno089@gmail.com', 'Retired from income tax', 'My family is a well-educated family with a properly maintained religious view.', 'Md jaynal Abedin Nawshad', 'Brother in law', '01858711700', 'Md Sayem hossain Chowdhury', 'Brother', '01744135456', 'Sabina Yeasmin Rumi', 'Sister', '01828245197', 'RTJLQEW1668261827950.JPG', 'IV4QXOKMD_AMJAD_HOSSAIN_CHOWDHURY.pdf', NULL, 'NXEQ6T6image.jpg', 5, 'VTIxR2RGcFhlR2hOUkVWNVRYcFJNVkZCUFQwPQ==', 'Inactive', 87, '2024-05-12 14:50:10.000000', '2024-05-24 17:26:06.000000', '39152584', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(324, 'Sadman Fahmid', NULL, 'Male', '40 varet streetApt601', 'Brooklyn', 'New York', '11206', '9173407618', NULL, NULL, 'Faruq79@aol.com', NULL, 1997, 27, NULL, 67, 130, 'Bangladesh', 'N/A', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, 2019, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', 'Facebook', 'Software engineer', 450000, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'No Preference,', 'No', 'Specific Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'Single,', 'No', 'No Preference', 'No Preference', 1, 2, 'MD FARUQUE', '40 varet street\nApt601', 'Brooklyn', 'New York', NULL, '9173407618', 'faruq79@a0l.com', 'Public service', NULL, 'Kaiser M Sabrin', 'Brother in law', '3478917569', 'Rubana yasmin', 'Cousin', '6787023733', 'Md Faruque', 'Father', '9173407618', 'anonymous.png', NULL, NULL, NULL, 5, 'V1cxc2MySkhSbk5SUkZsNg==', 'Inactive', 80, '2024-05-20 09:37:22.000000', '2024-05-20 17:13:05.000000', '30865404', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(325, 'Sadman Fahmid', NULL, 'Male', '40 Varet sreet\nApt 601', 'Brooklyn', 'New York', '11206', '9173407618', NULL, '6462583953', 'faruq79@aol.com', NULL, 1997, 27, NULL, 67, 130, 'Bangladesh', 'N/A', 'Single', NULL, NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', 'FaceBook', 'Software Engineer', 450000, 'Sunni', NULL, 'N/A', 'N/A', 'No', 'No', 'Sunni', NULL, 'N/A', 'No Preference,', 'No', 'Specific Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', 1, 2, 'MD Faruque', '40 Varet sreet\nApt 601', 'Brooklyn', 'New York', 'United States', '9173407618', 'faruq79@aol.com', 'Public Service', 'N/A', 'Kaiser M Sabrin', 'Brother in LAw', '347-891-7569', 'Rubana Yasmin', 'Cousin', '6787023733', 'MD FARUQUE', 'father', '9173407618', 'anonymous.png', 'XIWG19GBIO.docx', NULL, NULL, 5, 'V1cxc2MySkhSbk5SUkZsNg==', 'Inactive', 78, '2024-05-20 09:39:44.000000', '2024-05-21 03:41:10.000000', '63282919', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(327, 'Jahid', NULL, 'Male', NULL, NULL, 'Pennsylvania', NULL, '2677187997', NULL, NULL, 'dr.jahidhossain.mt@gmail.com', NULL, 1992, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VmtkR2VHUXlSWGhOYWswOQ==', 'Inactive', NULL, '2024-05-25 19:52:26.000000', '2024-05-25 19:52:26.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL),
(328, 'Jahid', NULL, 'Male', NULL, NULL, 'Pennsylvania', NULL, '+393476254193', NULL, NULL, 'dr.jahidhossain.mt@gmail.com', NULL, 1992, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VVRKc2RXSXliR2xOVkVsNg==', 'Inactive', NULL, '2024-05-25 19:56:13.000000', '2024-05-25 19:56:13.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `UserApp_matchingtable`
--

CREATE TABLE `UserApp_matchingtable` (
  `matchingId` int(11) NOT NULL,
  `matchingIndicator` varchar(500) DEFAULT NULL,
  `malePoint` int(11) DEFAULT NULL,
  `femalePoint` int(11) DEFAULT NULL,
  `matchingDetails` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserApp_matchingtable`
--

INSERT INTO `UserApp_matchingtable` (`matchingId`, `matchingIndicator`, `malePoint`, `femalePoint`, `matchingDetails`) VALUES
(1, 'religiousPractice', 10, 10, 'Preferred Religious practices'),
(2, 'wifeWearing', 10, NULL, 'preferences for a wife with wearing'),
(3, 'beard', NULL, 10, 'preferences for a husband with beard'),
(4, 'smoking', 10, 10, 'Are you fine with smoking?'),
(5, 'immigrationStatus', 10, 10, 'Immigration Status—: I would prefer my future spouse is a'),
(6, 'maritalStatus', 10, 10, 'Marital Status—I prefer a spouse who’s'),
(7, 'children', 10, 10, 'Children—I am willing to consider a spouse with existing children'),
(8, 'educationLevel', 10, 10, 'Preffered spouce education level'),
(9, 'employement', 10, 10, 'Preffered employment of future spouce-'),
(10, 'minimumIncome', 10, 10, 'Preffered minimum yearly Income of future spouce (USD)'),
(11, 'ageGap', 10, 10, 'Preferred maximum age gap');

-- --------------------------------------------------------

--
-- Table structure for table `UserApp_matchmaking`
--

CREATE TABLE `UserApp_matchmaking` (
  `id` int(11) NOT NULL,
  `percentage` int(11) DEFAULT NULL,
  `statusReq` int(11) NOT NULL,
  `femaleId_id` int(11) DEFAULT NULL,
  `maleId_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserApp_matchmaking`
--

INSERT INTO `UserApp_matchmaking` (`id`, `percentage`, `statusReq`, `femaleId_id`, `maleId_id`) VALUES
(1, 60, 0, 25, 62),
(2, 50, 0, 25, 66),
(3, 55, 0, 25, 79),
(4, 60, 0, 25, 87),
(5, 55, 0, 25, 89),
(6, 60, 0, 25, 63),
(7, 45, 0, 25, 67),
(8, 60, 0, 25, 72),
(9, 70, 0, 26, 61),
(10, 60, 0, 26, 95),
(11, 60, 3, 26, 62),
(12, 60, 0, 26, 63),
(13, 60, 0, 26, 72),
(14, 50, 3, 26, 66),
(15, 45, 3, 26, 67),
(16, 60, 0, 26, 70),
(17, 55, 0, 26, 79),
(18, 60, 0, 28, 62),
(19, 55, 0, 28, 89),
(20, 60, 1, 28, 95),
(21, 70, 0, 28, 61),
(22, 60, 0, 28, 63),
(23, 45, 0, 28, 67),
(24, 60, 0, 28, 72),
(25, 55, 0, 28, 79),
(26, 60, 0, 28, 87),
(27, 60, 0, 29, 62),
(28, 60, 0, 29, 70),
(29, 60, 0, 29, 72),
(30, 60, 0, 29, 61),
(31, 60, 0, 29, 63),
(32, 60, 0, 29, 67),
(33, 60, 0, 29, 69),
(34, 60, 0, 29, 73),
(35, 60, 0, 29, 78),
(36, 60, 3, 30, 95),
(37, 70, 0, 30, 61),
(38, 60, 0, 30, 62),
(39, 60, 0, 30, 63),
(40, 45, 0, 30, 67),
(41, 60, 0, 30, 72),
(42, 55, 0, 30, 89),
(43, 50, 3, 30, 65),
(44, 50, 0, 30, 66),
(45, 60, 2, 31, 66),
(46, 60, 0, 31, 63),
(47, 60, 3, 31, 67),
(48, 60, 0, 31, 72),
(49, 50, 3, 33, 100),
(50, 50, 3, 33, 115),
(51, 50, 3, 33, 123),
(52, 50, 0, 33, 138),
(53, 50, 0, 33, 101),
(54, 50, 3, 33, 116),
(55, 50, 3, 33, 121),
(56, 50, 3, 33, 122),
(57, 50, 0, 33, 137),
(58, 30, 0, 34, 101),
(59, 30, 0, 34, 100),
(60, 30, 3, 34, 115),
(61, 30, 0, 34, 116),
(62, 30, 0, 34, 121),
(63, 30, 0, 34, 122),
(64, 30, 0, 34, 123),
(65, 45, 0, 42, 311),
(66, 40, 3, 42, 115),
(67, 40, 0, 42, 124),
(68, 45, 3, 42, 173),
(69, 40, 3, 42, 256),
(70, 40, 0, 42, 274),
(71, 40, 3, 42, 312),
(72, 40, 3, 42, 314),
(73, 40, 0, 42, 100),
(74, 40, 0, 42, 102),
(75, 60, 0, 45, 100),
(76, 60, 3, 45, 115),
(77, 50, 0, 45, 116),
(78, 60, 3, 45, 123),
(79, 60, 3, 45, 121),
(80, 60, 3, 45, 122),
(81, 60, 0, 45, 101),
(82, 60, 3, 45, 137),
(83, 60, 3, 45, 138),
(84, 60, 3, 45, 140),
(86, 60, 3, 45, 168),
(87, 60, 3, 45, 173),
(88, 60, 3, 45, 143),
(89, 60, 0, 45, 102),
(90, 60, 3, 45, 252),
(91, 60, 3, 45, 144),
(92, 60, 0, 45, 262),
(93, 50, 3, 46, 115),
(94, 45, 3, 46, 232),
(95, 50, 0, 46, 271),
(96, 40, 0, 46, 311),
(97, 40, 0, 46, 315),
(98, 40, 3, 46, 100),
(99, 50, 3, 46, 101),
(100, 50, 0, 46, 102),
(101, 50, 0, 46, 122),
(102, 50, 0, 46, 124),
(103, 50, 3, 48, 115),
(104, 50, 3, 48, 123),
(105, 50, 0, 48, 100),
(106, 50, 0, 48, 116),
(107, 50, 3, 48, 121),
(108, 50, 3, 48, 122),
(109, 50, 3, 48, 137),
(110, 50, 3, 48, 138),
(111, 50, 0, 48, 143),
(113, 40, 0, 50, 100),
(114, 40, 3, 50, 116),
(115, 40, 3, 50, 121),
(116, 40, 3, 50, 122),
(117, 40, 3, 50, 123),
(118, 40, 3, 50, 138),
(119, 50, 0, 50, 142),
(121, 40, 0, 50, 101),
(122, 40, 3, 50, 115),
(124, 50, 3, 51, 115),
(125, 50, 0, 51, 116),
(126, 50, 3, 51, 121),
(127, 50, 3, 51, 122),
(128, 50, 3, 51, 123),
(129, 50, 3, 51, 138),
(130, 50, 3, 51, 148),
(131, 50, 0, 51, 156),
(132, 50, 0, 51, 100),
(133, 35, 3, 63, 100),
(134, 50, 0, 63, 102),
(135, 50, 3, 63, 115),
(136, 50, 3, 63, 122),
(137, 50, 0, 63, 143),
(138, 50, 3, 63, 173),
(139, 40, 0, 63, 232),
(140, 50, 3, 63, 256),
(141, 50, 0, 63, 264),
(142, 50, 0, 63, 274),
(143, 50, 0, 70, 100),
(144, 55, 3, 70, 115),
(145, 55, 0, 70, 311),
(146, 55, 3, 70, 315),
(147, 55, 3, 70, 102),
(148, 50, 3, 70, 168),
(149, 55, 0, 70, 173),
(150, 50, 3, 70, 286),
(151, 50, 3, 70, 299),
(152, 70, 3, 70, 122),
(153, 50, 3, 77, 100),
(154, 50, 0, 77, 115),
(155, 55, 3, 77, 168),
(156, 55, 3, 77, 299),
(157, 50, 0, 77, 311),
(158, 45, 0, 77, 315),
(159, 45, 0, 77, 102),
(160, 70, 0, 77, 173),
(161, 45, 0, 77, 286),
(162, 40, 0, 77, 290),
(163, 60, 3, 82, 116),
(165, 60, 3, 82, 173),
(166, 60, 3, 82, 246),
(167, 60, 3, 82, 144),
(168, 60, 3, 82, 252),
(169, 60, 3, 82, 262),
(170, 50, 0, 84, 283),
(171, 45, 3, 84, 290),
(172, 50, 3, 84, 173),
(173, 45, 3, 84, 232),
(174, 45, 3, 84, 246),
(175, 50, 3, 84, 282),
(176, 40, 0, 84, 102),
(177, 40, 3, 84, 115),
(178, 60, 3, 84, 122),
(179, 60, 0, 84, 124),
(180, 45, 0, 93, 115),
(181, 45, 0, 93, 274),
(182, 40, 0, 93, 299),
(183, 50, 0, 93, 311),
(184, 45, 0, 93, 315),
(185, 40, 0, 93, 100),
(186, 45, 0, 93, 102),
(187, 50, 0, 93, 122),
(188, 40, 0, 93, 143),
(189, 45, 0, 93, 173),
(190, 60, 3, 100, 100),
(191, 60, 0, 100, 102),
(192, 60, 3, 100, 115),
(193, 60, 3, 100, 116),
(194, 60, 3, 100, 123),
(195, 60, 3, 100, 168),
(196, 60, 0, 100, 252),
(197, 60, 3, 100, 256),
(198, 60, 0, 100, 122),
(199, 50, 0, 102, 100),
(200, 50, 0, 102, 115),
(201, 50, 0, 102, 123),
(202, 50, 3, 102, 168),
(203, 50, 0, 102, 121),
(204, 50, 0, 102, 122),
(205, 50, 0, 102, 143),
(207, 50, 0, 102, 166),
(208, 50, 0, 103, 100),
(209, 50, 0, 103, 115),
(210, 50, 3, 103, 168),
(211, 50, 0, 103, 252),
(212, 50, 0, 103, 271),
(213, 50, 0, 103, 286),
(214, 50, 0, 103, 102),
(215, 50, 3, 103, 122),
(216, 50, 0, 103, 143),
(217, 50, 0, 109, 100),
(218, 50, 0, 109, 115),
(219, 50, 0, 109, 116),
(220, 50, 0, 109, 121),
(221, 50, 0, 109, 122),
(222, 50, 0, 109, 123),
(224, 50, 0, 109, 166),
(225, 50, 0, 109, 168),
(226, 50, 0, 109, 173),
(227, 70, 3, 133, 115),
(228, 70, 0, 133, 100),
(229, 70, 3, 133, 168),
(230, 70, 3, 133, 173),
(231, 70, 3, 133, 252),
(232, 70, 0, 133, 102),
(233, 70, 0, 133, 122),
(234, 70, 0, 133, 138),
(235, 70, 3, 133, 166),
(236, 70, 0, 148, 299),
(237, 70, 0, 148, 311),
(238, 70, 0, 148, 100),
(239, 70, 0, 148, 102),
(240, 70, 0, 148, 115),
(241, 70, 0, 148, 122),
(242, 70, 0, 148, 168),
(243, 70, 0, 148, 252),
(244, 70, 0, 148, 256),
(245, 70, 0, 148, 264),
(246, 60, 3, 151, 115),
(247, 55, 4, 151, 299),
(248, 55, 3, 151, 311),
(249, 55, 0, 151, 315),
(250, 40, 0, 151, 100),
(251, 50, 3, 151, 102),
(252, 70, 0, 151, 122),
(253, 50, 3, 151, 168),
(254, 50, 3, 151, 173),
(255, 50, 3, 151, 256),
(256, 35, 0, 157, 100),
(257, 40, 3, 157, 168),
(258, 40, 0, 157, 271),
(259, 40, 0, 157, 292),
(260, 40, 0, 157, 299),
(261, 50, 0, 157, 311),
(262, 40, 0, 157, 315),
(263, 50, 0, 157, 101),
(264, 40, 3, 157, 102),
(265, 40, 0, 157, 115),
(266, 50, 3, 158, 274),
(267, 50, 3, 158, 311),
(268, 35, 0, 158, 100),
(269, 50, 3, 158, 102),
(270, 50, 3, 158, 115),
(271, 50, 0, 158, 122),
(272, 50, 0, 158, 124),
(273, 50, 0, 158, 143),
(274, 40, 0, 158, 148),
(275, 50, 3, 158, 166),
(276, 50, 0, 160, 115),
(277, 55, 0, 160, 311),
(278, 35, 0, 160, 100),
(279, 55, 0, 160, 173),
(280, 55, 3, 160, 274),
(281, 50, 3, 160, 283),
(282, 50, 3, 160, 290),
(283, 50, 0, 160, 315),
(284, 45, 0, 160, 101),
(285, 50, 0, 160, 102),
(286, 50, 3, 162, 123),
(287, 50, 3, 162, 271),
(288, 50, 3, 162, 274),
(289, 50, 3, 162, 252),
(290, 50, 3, 162, 248),
(291, 50, 3, 162, 115),
(292, 50, 3, 162, 288),
(293, 50, 3, 162, 286),
(294, 50, 3, 162, 246),
(295, 50, 3, 162, 124),
(296, 70, 0, 164, 102),
(297, 70, 0, 164, 115),
(298, 70, 3, 164, 173),
(299, 70, 3, 164, 252),
(300, 70, 3, 164, 256),
(301, 70, 3, 164, 274),
(302, 70, 3, 164, 283),
(303, 70, 0, 164, 100),
(304, 70, 0, 164, 122),
(305, 50, 0, 173, 115),
(306, 55, 3, 173, 274),
(307, 50, 0, 173, 299),
(308, 55, 3, 173, 311),
(309, 50, 0, 173, 315),
(310, 35, 0, 173, 100),
(311, 55, 0, 173, 102),
(312, 55, 0, 173, 122),
(313, 45, 0, 173, 143),
(314, 45, 0, 173, 168),
(315, 70, 3, 176, 173),
(316, 70, 3, 176, 102),
(317, 70, 0, 176, 115),
(318, 70, 0, 176, 122),
(319, 70, 0, 176, 124),
(320, 70, 3, 176, 166),
(321, 70, 0, 176, 256),
(322, 70, 0, 176, 264),
(323, 70, 0, 176, 282),
(324, 70, 0, 176, 293),
(325, 60, 3, 180, 299),
(326, 55, 0, 180, 315),
(327, 45, 4, 180, 100),
(328, 55, 3, 180, 102),
(329, 50, 0, 180, 115),
(330, 60, 0, 180, 122),
(331, 55, 0, 180, 168),
(332, 60, 3, 180, 286),
(333, 55, 0, 180, 311),
(334, 45, 0, 180, 124),
(335, 50, 1, 185, 315),
(336, 45, 3, 185, 115),
(337, 45, 0, 185, 168),
(338, 50, 3, 185, 271),
(339, 50, 3, 185, 286),
(340, 45, 0, 185, 290),
(341, 45, 0, 185, 299),
(342, 60, 0, 185, 311),
(343, 60, 0, 185, 100),
(344, 50, 3, 185, 102),
(345, 70, 3, 188, 115),
(346, 70, 3, 188, 299),
(347, 70, 0, 188, 100),
(348, 70, 0, 188, 102),
(349, 70, 0, 188, 122),
(350, 70, 0, 188, 138),
(351, 70, 0, 188, 166),
(352, 70, 0, 188, 168),
(353, 70, 3, 188, 173),
(354, 70, 3, 188, 252),
(355, 70, 0, 193, 115),
(356, 70, 0, 193, 100),
(357, 70, 0, 193, 102),
(358, 70, 0, 193, 173),
(359, 70, 3, 193, 252),
(360, 70, 0, 193, 286),
(361, 70, 0, 193, 299),
(362, 70, 0, 193, 122),
(363, 70, 0, 193, 138),
(364, 70, 0, 193, 166),
(365, 50, 3, 196, 102),
(366, 60, 3, 196, 122),
(367, 55, 3, 196, 124),
(368, 50, 0, 196, 166),
(369, 50, 3, 196, 173),
(370, 50, 0, 196, 232),
(371, 50, 0, 196, 256),
(372, 50, 0, 196, 264),
(373, 50, 0, 196, 282),
(374, 50, 0, 196, 293),
(375, 50, 0, 201, 102),
(376, 50, 3, 201, 115),
(377, 45, 0, 201, 143),
(378, 50, 0, 201, 173),
(379, 50, 0, 201, 274),
(380, 45, 0, 201, 283),
(381, 45, 0, 201, 290),
(382, 50, 3, 201, 311),
(383, 50, 0, 201, 315),
(384, 50, 0, 201, 100),
(385, 50, 4, 204, 102),
(386, 45, 0, 204, 124),
(387, 45, 0, 204, 143),
(388, 50, 0, 204, 173),
(389, 50, 3, 204, 246),
(390, 45, 0, 204, 256),
(391, 45, 0, 204, 264),
(392, 50, 0, 204, 274),
(393, 45, 0, 204, 282),
(394, 45, 0, 204, 283),
(395, 55, 0, 207, 115),
(396, 50, 0, 207, 311),
(397, 40, 0, 207, 271),
(398, 45, 0, 207, 274),
(399, 45, 0, 207, 283),
(400, 40, 0, 207, 290),
(401, 40, 0, 207, 299),
(402, 45, 0, 207, 315),
(403, 60, 0, 207, 100),
(404, 35, 0, 207, 101),
(405, 55, 0, 208, 115),
(406, 55, 0, 208, 173),
(407, 50, 0, 208, 290),
(408, 55, 0, 208, 311),
(409, 55, 0, 208, 315),
(410, 50, 0, 208, 102),
(411, 55, 0, 208, 122),
(412, 50, 0, 208, 124),
(413, 45, 0, 208, 166),
(414, 45, 0, 208, 168),
(415, 50, 0, 209, 274),
(416, 45, 0, 209, 290),
(417, 50, 0, 209, 102),
(418, 45, 0, 209, 115),
(419, 45, 0, 209, 143),
(420, 50, 0, 209, 173),
(421, 45, 0, 209, 311),
(422, 45, 0, 209, 315),
(423, 60, 0, 209, 100),
(424, 60, 0, 209, 122),
(425, 80, 0, 25, 61),
(426, 80, 0, 32, 61),
(427, 60, 0, 32, 62),
(428, 60, 0, 32, 63),
(429, 70, 0, 26, 64),
(430, 70, 0, 28, 64),
(431, 70, 0, 31, 64),
(432, 70, 0, 25, 64),
(433, 70, 0, 29, 64),
(434, 70, 0, 32, 64),
(435, 40, 3, 26, 65),
(436, 40, 0, 25, 65),
(437, 40, 0, 28, 65),
(438, 40, 0, 32, 65),
(439, 40, 0, 28, 66),
(440, 40, 0, 32, 66),
(441, 30, 0, 32, 67),
(442, 60, 0, 28, 69),
(443, 60, 0, 26, 69),
(444, 60, 0, 31, 69),
(445, 60, 0, 25, 69),
(446, 60, 0, 28, 70),
(447, 60, 0, 25, 70),
(448, 60, 0, 30, 70),
(449, 60, 0, 32, 70),
(450, 50, 0, 28, 71),
(451, 50, 0, 26, 71),
(452, 50, 0, 30, 71),
(453, 50, 0, 25, 71),
(454, 50, 0, 32, 71),
(455, 60, 0, 32, 72),
(456, 20, 0, 28, 73),
(457, 20, 0, 25, 73),
(458, 20, 0, 26, 73),
(459, 20, 0, 30, 73),
(460, 20, 0, 32, 73),
(461, 20, 0, 25, 77),
(462, 20, 3, 26, 77),
(463, 20, 4, 28, 77),
(464, 20, 0, 30, 77),
(465, 20, 0, 32, 77),
(466, 40, 0, 30, 78),
(467, 40, 0, 26, 78),
(468, 40, 0, 28, 78),
(469, 40, 0, 25, 78),
(470, 50, 0, 30, 79),
(471, 50, 0, 32, 79),
(472, 60, 1, 26, 81),
(473, 60, 1, 25, 81),
(474, 60, 1, 28, 81),
(475, 60, 0, 30, 81),
(476, 60, 1, 32, 81),
(477, 50, 0, 28, 82),
(478, 50, 0, 26, 82),
(479, 50, 0, 31, 82),
(480, 50, 0, 25, 82),
(481, 50, 0, 29, 82),
(482, 50, 0, 32, 82),
(483, 60, 0, 30, 87),
(484, 60, 0, 26, 87),
(485, 60, 0, 32, 87),
(486, 50, 0, 26, 89),
(487, 50, 0, 32, 89),
(488, 60, 0, 25, 95),
(489, 60, 0, 32, 95),
(490, 30, 0, 84, 100),
(491, 35, 0, 84, 101),
(492, 35, 0, 158, 101),
(493, 35, 0, 173, 101),
(494, 35, 0, 201, 101),
(495, 40, 0, 204, 101),
(496, 35, 0, 208, 101),
(497, 50, 0, 63, 101),
(498, 50, 0, 93, 101),
(499, 50, 0, 180, 101),
(500, 60, 3, 160, 109),
(501, 60, 3, 63, 109),
(502, 60, 1, 201, 109),
(503, 60, 1, 208, 109),
(504, 60, 3, 42, 109),
(505, 60, 3, 84, 109),
(506, 60, 0, 93, 109),
(507, 60, 0, 151, 109),
(508, 60, 0, 158, 109),
(509, 60, 0, 173, 109),
(510, 50, 3, 196, 115),
(511, 40, 0, 77, 116),
(512, 40, 3, 42, 116),
(513, 40, 3, 46, 116),
(514, 40, 3, 63, 116),
(515, 40, 3, 84, 116),
(516, 40, 0, 93, 116),
(517, 40, 0, 103, 116),
(518, 40, 0, 133, 116),
(519, 40, 3, 151, 116),
(520, 60, 3, 63, 121),
(521, 60, 0, 42, 121),
(522, 60, 0, 93, 121),
(523, 60, 3, 100, 121),
(524, 60, 0, 103, 121),
(525, 60, 0, 133, 121),
(526, 60, 0, 46, 121),
(527, 60, 0, 77, 121),
(528, 60, 0, 82, 121),
(529, 50, 0, 160, 122),
(530, 50, 0, 185, 122),
(531, 50, 0, 77, 122),
(532, 50, 0, 201, 122),
(533, 50, 0, 204, 122),
(534, 50, 3, 63, 123),
(535, 50, 0, 164, 123),
(536, 50, 0, 42, 123),
(537, 50, 3, 70, 123),
(538, 50, 0, 77, 123),
(539, 50, 0, 93, 123),
(540, 50, 0, 103, 123),
(541, 50, 0, 133, 123),
(542, 50, 0, 151, 123),
(543, 50, 3, 158, 123),
(544, 50, 0, 63, 124),
(545, 50, 3, 201, 124),
(546, 50, 3, 151, 124),
(547, 60, 0, 160, 124),
(548, 45, 3, 173, 124),
(549, 45, 0, 185, 124),
(550, 45, 0, 207, 124),
(551, 60, 3, 63, 137),
(552, 60, 3, 151, 137),
(553, 60, 0, 160, 137),
(554, 60, 0, 196, 137),
(555, 60, 3, 42, 137),
(556, 60, 3, 46, 137),
(557, 60, 0, 93, 137),
(558, 60, 0, 173, 137),
(559, 60, 0, 176, 137),
(560, 60, 3, 185, 137),
(561, 40, 0, 42, 138),
(562, 40, 3, 46, 138),
(563, 40, 3, 63, 138),
(564, 40, 3, 70, 138),
(565, 40, 3, 77, 138),
(566, 40, 0, 84, 138),
(567, 40, 0, 93, 138),
(568, 40, 0, 151, 138),
(569, 40, 0, 158, 138),
(570, 40, 0, 160, 138),
(571, 40, 3, 63, 140),
(572, 40, 0, 82, 140),
(573, 40, 3, 46, 140),
(574, 40, 3, 48, 140),
(575, 40, 0, 70, 140),
(576, 60, 0, 51, 142),
(577, 60, 0, 48, 142),
(578, 60, 0, 63, 142),
(579, 60, 0, 46, 142),
(580, 45, 0, 160, 143),
(581, 45, 0, 208, 143),
(582, 50, 0, 42, 143),
(583, 45, 3, 70, 143),
(584, 50, 3, 77, 143),
(585, 45, 3, 151, 143),
(586, 60, 3, 164, 144),
(587, 60, 3, 42, 144),
(588, 60, 0, 63, 144),
(589, 60, 0, 84, 144),
(590, 60, 0, 93, 144),
(591, 60, 3, 133, 144),
(592, 60, 0, 158, 144),
(593, 60, 0, 160, 144),
(594, 60, 0, 70, 144),
(605, 50, 3, 63, 148),
(606, 45, 3, 160, 148),
(607, 40, 0, 180, 148),
(608, 40, 0, 208, 148),
(609, 50, 3, 42, 148),
(610, 40, 3, 70, 148),
(611, 50, 3, 77, 148),
(612, 50, 0, 84, 148),
(613, 50, 0, 93, 148),
(614, 50, 0, 151, 148),
(615, 50, 0, 63, 156),
(616, 50, 0, 70, 156),
(617, 50, 0, 48, 156),
(618, 50, 0, 46, 156),
(619, 50, 0, 82, 156),
(620, 40, 0, 63, 160),
(621, 35, 0, 208, 160),
(622, 25, 0, 46, 160),
(623, 35, 0, 151, 160),
(624, 40, 0, 157, 160),
(625, 30, 0, 160, 160),
(626, 25, 0, 207, 160),
(627, 40, 0, 42, 160),
(628, 30, 0, 70, 160),
(629, 30, 0, 77, 160),
(630, 50, 0, 173, 166),
(631, 50, 0, 185, 166),
(632, 45, 0, 63, 166),
(633, 50, 3, 70, 166),
(634, 60, 0, 160, 166),
(635, 50, 0, 180, 166),
(636, 45, 0, 201, 166),
(637, 45, 0, 209, 166),
(638, 60, 0, 42, 166),
(639, 45, 3, 63, 168),
(640, 50, 0, 158, 168),
(641, 40, 0, 160, 168),
(642, 50, 3, 158, 173),
(643, 55, 3, 173, 173),
(644, 50, 3, 185, 173),
(645, 50, 0, 180, 173),
(646, 40, 3, 42, 232),
(647, 40, 3, 77, 232),
(648, 40, 3, 93, 232),
(649, 40, 0, 160, 232),
(650, 40, 0, 180, 232),
(651, 40, 0, 201, 232),
(652, 40, 0, 204, 232),
(653, 50, 3, 160, 246),
(654, 45, 3, 63, 246),
(655, 45, 3, 158, 246),
(656, 60, 3, 173, 246),
(657, 60, 3, 180, 246),
(658, 60, 0, 185, 246),
(659, 45, 0, 201, 246),
(660, 45, 0, 208, 246),
(661, 60, 3, 42, 246),
(662, 50, 0, 63, 248),
(663, 50, 3, 158, 248),
(664, 50, 0, 160, 248),
(665, 50, 0, 173, 248),
(666, 50, 0, 176, 248),
(667, 50, 0, 185, 248),
(668, 50, 0, 201, 248),
(669, 50, 0, 42, 248),
(670, 50, 0, 70, 248),
(671, 50, 0, 93, 248),
(672, 50, 3, 63, 252),
(673, 50, 3, 158, 252),
(674, 50, 0, 160, 252),
(675, 50, 3, 173, 252),
(676, 50, 3, 176, 252),
(677, 50, 0, 180, 252),
(678, 50, 3, 185, 252),
(679, 50, 0, 201, 252),
(680, 50, 0, 204, 252),
(681, 50, 3, 42, 252),
(682, 40, 0, 63, 253),
(683, 45, 0, 180, 253),
(684, 35, 0, 42, 253),
(685, 40, 3, 70, 253),
(686, 50, 0, 77, 253),
(687, 50, 0, 93, 253),
(688, 40, 0, 151, 253),
(689, 40, 0, 158, 253),
(690, 50, 0, 160, 253),
(691, 50, 0, 173, 253),
(692, 45, 3, 160, 256),
(693, 50, 0, 208, 256),
(694, 45, 3, 70, 256),
(695, 40, 3, 93, 256),
(696, 50, 0, 158, 256),
(697, 45, 0, 173, 256),
(698, 45, 0, 180, 256),
(699, 50, 0, 63, 262),
(700, 50, 0, 160, 262),
(701, 50, 0, 164, 262),
(702, 50, 0, 42, 262),
(703, 50, 0, 70, 262),
(704, 50, 0, 93, 262),
(705, 50, 3, 133, 262),
(706, 50, 3, 151, 262),
(707, 50, 0, 158, 262),
(708, 50, 0, 162, 262),
(709, 40, 0, 63, 263),
(710, 40, 3, 42, 263),
(711, 40, 0, 84, 263),
(712, 40, 3, 93, 263),
(713, 40, 3, 133, 263),
(714, 40, 0, 151, 263),
(715, 40, 0, 46, 263),
(716, 40, 0, 77, 263),
(717, 40, 0, 82, 263),
(718, 40, 0, 103, 263),
(719, 50, 3, 42, 264),
(720, 45, 3, 70, 264),
(721, 50, 3, 93, 264),
(722, 45, 3, 151, 264),
(723, 40, 0, 158, 264),
(724, 50, 0, 160, 264),
(725, 50, 0, 173, 264),
(726, 45, 0, 180, 264),
(727, 50, 0, 185, 264),
(728, 55, 3, 180, 271),
(729, 45, 0, 63, 271),
(730, 45, 3, 158, 271),
(731, 45, 0, 160, 271),
(732, 50, 0, 173, 271),
(733, 45, 0, 201, 271),
(734, 45, 0, 70, 271),
(735, 40, 3, 77, 271),
(736, 45, 0, 151, 271),
(737, 50, 3, 180, 274),
(738, 45, 0, 185, 274),
(739, 50, 0, 208, 274),
(740, 40, 3, 42, 282),
(741, 50, 3, 63, 282),
(742, 50, 3, 70, 282),
(743, 45, 3, 93, 282),
(744, 45, 0, 158, 282),
(745, 45, 0, 160, 282),
(746, 50, 0, 173, 282),
(747, 50, 0, 185, 282),
(748, 50, 0, 208, 282),
(749, 50, 3, 63, 283),
(750, 50, 0, 208, 283),
(751, 50, 3, 42, 283),
(752, 40, 3, 70, 283),
(753, 40, 0, 93, 283),
(754, 50, 3, 151, 283),
(755, 50, 0, 158, 283),
(756, 50, 0, 173, 283),
(757, 45, 3, 63, 286),
(758, 40, 3, 158, 286),
(759, 45, 3, 160, 286),
(760, 50, 0, 173, 286),
(761, 50, 0, 151, 286),
(762, 40, 0, 201, 286),
(763, 40, 0, 63, 288),
(764, 40, 3, 70, 288),
(765, 40, 0, 158, 288),
(766, 40, 0, 160, 288),
(767, 40, 0, 173, 288),
(768, 40, 0, 176, 288),
(769, 40, 0, 180, 288),
(770, 40, 0, 185, 288),
(771, 40, 0, 42, 288),
(772, 40, 3, 77, 288),
(773, 45, 3, 63, 290),
(774, 50, 4, 158, 290),
(775, 45, 0, 173, 290),
(776, 45, 0, 180, 290),
(777, 50, 0, 204, 290),
(778, 50, 0, 42, 290),
(779, 40, 0, 63, 292),
(780, 50, 4, 42, 292),
(781, 45, 0, 70, 292),
(782, 45, 3, 77, 292),
(783, 50, 0, 93, 292),
(784, 45, 0, 151, 292),
(785, 40, 0, 158, 292),
(786, 50, 0, 160, 292),
(787, 40, 0, 173, 292),
(788, 45, 0, 180, 292),
(789, 45, 0, 63, 293),
(790, 50, 3, 180, 293),
(791, 35, 4, 42, 293),
(792, 45, 3, 70, 293),
(793, 40, 3, 77, 293),
(794, 50, 0, 93, 293),
(795, 45, 0, 151, 293),
(796, 40, 0, 158, 293),
(797, 50, 0, 160, 293),
(798, 50, 0, 173, 293),
(799, 50, 3, 63, 299),
(800, 40, 3, 158, 299),
(801, 50, 0, 160, 299),
(802, 45, 0, 196, 299),
(803, 50, 0, 63, 311),
(804, 55, 0, 196, 311),
(805, 35, 3, 46, 312),
(806, 40, 3, 63, 312),
(807, 40, 3, 70, 312),
(808, 30, 3, 77, 312),
(809, 30, 0, 84, 312),
(810, 30, 0, 93, 312),
(811, 40, 0, 151, 312),
(812, 30, 0, 158, 312),
(813, 30, 0, 160, 312),
(814, 50, 3, 63, 314),
(815, 45, 3, 160, 314),
(816, 50, 0, 208, 314),
(817, 45, 3, 70, 314),
(818, 50, 3, 84, 314),
(819, 50, 3, 93, 314),
(820, 50, 0, 151, 314),
(821, 50, 0, 158, 314),
(822, 45, 0, 173, 314),
(823, 50, 0, 63, 315),
(824, 50, 0, 42, 315),
(825, 50, 0, 158, 315),
(826, 35, 0, 46, 314),
(827, 35, 0, 46, 282),
(828, 35, 0, 46, 274),
(829, 35, 0, 46, 283),
(830, 35, 0, 46, 143),
(831, 35, 0, 46, 256),
(832, 40, 0, 84, 274),
(833, 40, 0, 84, 166),
(834, 50, 0, 151, 274),
(835, 40, 0, 157, 166),
(836, 35, 0, 157, 293),
(837, 35, 0, 157, 286),
(838, 50, 0, 196, 314),
(839, 45, 0, 204, 311),
(840, 40, 0, 207, 282),
(841, 45, 0, 209, 282),
(842, 50, 0, 213, 315),
(843, 50, 0, 213, 311),
(844, 50, 0, 213, 173),
(845, 50, 0, 213, 115),
(846, 45, 0, 213, 283),
(847, 45, 0, 213, 274),
(848, 45, 0, 213, 102),
(849, 45, 0, 213, 282),
(850, 40, 0, 213, 290),
(851, 40, 0, 213, 271),
(852, 45, 0, 215, 311),
(853, 40, 0, 215, 315),
(854, 40, 0, 215, 299),
(855, 40, 0, 215, 271),
(856, 40, 0, 215, 292),
(857, 40, 0, 215, 274),
(858, 40, 0, 215, 173),
(859, 40, 0, 215, 102),
(860, 40, 0, 215, 115),
(861, 40, 0, 215, 148),
(862, 35, 0, 196, 100),
(863, 35, 0, 213, 101),
(864, 35, 0, 196, 101),
(865, 45, 0, 180, 143),
(866, 45, 0, 196, 143),
(867, 40, 0, 207, 148),
(868, 40, 0, 204, 148),
(869, 40, 0, 213, 148),
(870, 40, 0, 196, 148),
(871, 40, 0, 173, 148),
(872, 30, 0, 196, 160),
(873, 30, 0, 180, 160),
(874, 45, 0, 151, 166),
(875, 40, 0, 196, 168),
(876, 45, 0, 208, 232),
(877, 35, 0, 213, 232),
(878, 35, 0, 209, 232),
(879, 45, 0, 196, 246),
(880, 40, 0, 213, 246),
(881, 40, 0, 209, 246),
(882, 45, 0, 196, 253),
(883, 40, 0, 208, 253),
(884, 35, 0, 209, 253),
(885, 35, 0, 213, 253),
(886, 40, 0, 209, 256),
(887, 45, 0, 208, 264),
(888, 40, 0, 207, 264),
(889, 40, 0, 213, 264),
(890, 40, 0, 209, 264),
(891, 45, 0, 151, 282),
(892, 45, 0, 196, 283),
(893, 40, 0, 209, 283),
(894, 45, 0, 208, 286),
(895, 45, 0, 196, 292),
(896, 40, 0, 185, 292),
(897, 45, 0, 208, 293),
(898, 40, 0, 209, 293),
(899, 40, 0, 207, 293),
(900, 45, 0, 208, 299),
(901, 45, 0, 196, 312),
(902, 40, 0, 204, 312),
(903, 40, 0, 173, 312),
(904, 40, 0, 180, 312),
(905, 40, 0, 208, 312),
(906, 35, 0, 213, 312),
(907, 35, 0, 209, 312),
(908, 45, 0, 180, 314),
(909, 45, 0, 204, 314),
(910, 40, 0, 209, 314),
(911, 35, 0, 46, 173),
(912, 40, 0, 84, 311),
(913, 35, 0, 157, 274),
(914, 40, 0, 213, 286),
(915, 40, 0, 215, 168),
(916, 30, 0, 213, 100),
(917, 40, 0, 70, 124),
(918, 25, 0, 209, 160),
(919, 35, 0, 70, 232),
(920, 40, 0, 70, 246),
(921, 35, 0, 215, 253),
(922, 35, 0, 207, 253),
(923, 45, 0, 70, 274),
(924, 40, 0, 70, 290),
(925, 40, 0, 208, 292),
(926, 40, 0, 213, 293);

-- --------------------------------------------------------

--
-- Table structure for table `UserApp_message`
--

CREATE TABLE `UserApp_message` (
  `messageId` int(11) NOT NULL,
  `senderId` varchar(100) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  `senderEmail` varchar(100) DEFAULT NULL,
  `messageDetail` varchar(5000) NOT NULL,
  `dateTime` datetime(6) NOT NULL,
  `messageReply` varchar(5000) DEFAULT NULL,
  `replyDateTime` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserApp_message`
--

INSERT INTO `UserApp_message` (`messageId`, `senderId`, `userType`, `senderEmail`, `messageDetail`, `dateTime`, `messageReply`, `replyDateTime`) VALUES
(50, 'Samsuzzuha Islam', 1, 'smtariqul@gmail.com', 'Assalamu Alykum,\nI am having issue to change my Gender information in my profile.\nCould you please call me at 301-728-5200\n\nThanks and regards,\nTariq', '2023-10-01 06:10:00.000000', 'Walikumussalam,  Gender information is non-editable. You have to create a new profile with correct gender. And you can deactivate/delete this profile that has the wrong gender. Jazakallah', '2023-10-03 04:51:34.000000'),
(54, 'Mohammad Nuruddin', 3, 'mohammad.nuruddin195@gmail.com', 'I have been completed my honors and masters from the International Islamic University Chittagong, Bangladesh. I want to pursue my second masters in USA. Now I am taking the preparation. Can I get the service of MUNA MATRIMONIAL supports to choose my Islamic life partner.', '2023-10-20 05:47:11.000000', 'Assalamu\'alaikum. Please complete your profile at the following link.\nhttps://munamatrimonial.com/#/home\nJazakallahu Khayran for choosing Muna Matrimonial Service.', '2023-10-20 12:21:34.000000'),
(55, 'Tawhid  Chowdhury', 1, 'ctawhid11@gmail.com', 'Assalamu alaikum,\n\nHow are you doing. Hope you’re doing well and with your family. I got a question. My account is active but I don’t see any bride’s match Biodata. Please check it out and let me know if you need anything else from me.\nThank you', '2023-11-26 15:53:38.000000', 'Walikumussalam,\nCan you please update some fields and request for activation.', '2023-11-28 12:52:08.000000'),
(56, 'Sk Fayazul Islam', 1, 'rxfayaz@gmail.com', 'Assalamu alaikum brothers,\nFirstly, I appreciate your efforts in creating a platform for Muslim marriages in the USA. I noticed a discrepancy in the units used for height and weight in the profile creation section (inches, pounds) compared to the actual profile section (cm, kg). This inconsistency could lead to confusion. It would be beneficial if this could be rectified.', '2023-11-28 05:42:59.000000', 'Walikumussalam,We have inches and pounds. Are you referring your profile page or matches profile page?', '2023-11-28 12:40:10.000000'),
(60, 'Shaima', 3, 'shaima2188@yahoo.com', 'Assalamuallikum I am trying to log in but it keeps saying invalid password and email.', '2023-12-04 11:56:58.000000', 'Assalamu\'alaikum. You have two accounts. Did you able to log in?', '2023-12-05 01:31:25.000000'),
(65, 'Tahsin A', 1, 'tahsinazad31@gmail.com', 'Assalamualaikum,\nI\'m confused about how this works. Is it the same for men and women? If I have a received a request how do I accept?\nJazakallahukhayr', '2024-01-05 04:51:40.000000', NULL, NULL),
(70, 'Sharmin R', 2, 'sharminras@icloud.com', 'Assalamualaikum, \nI completed my profile and I’ve been waiting to get approval from Admin for a few weeks now. Is there something work or additional that I have to complete? If you can let me know, thank you.', '2024-03-01 13:14:47.000000', 'Wa\'alykumussalam Warahmatullah Wabarakatuh.  Yes, you need to complete your academic section. You didn\'t mention which year you finished your high school and bachelor\'s degree. We also sent you an email before and have been awaiting your response. Jazakillahu Khayran.', '2024-03-02 00:32:35.000000'),
(71, 'Sharmin R', 2, 'sharminras@icloud.com', 'Assalamualaikum, \nI have a question about how your website works. Who is able to see my profile and who decides the matches? I can only view my matches and no other profiles correct?', '2024-03-03 10:31:12.000000', 'Wa\'alykumussalam Warahmatullah Wabarakatuh. Matching system is auto. When someone requests to see your profile, admin will approve the request and then he will able to see your profile. You can also request to view other profiles, not just your matches. Jazakillahu Khayran.', '2024-03-04 04:34:08.000000');

-- --------------------------------------------------------

--
-- Table structure for table `UserApp_post`
--

CREATE TABLE `UserApp_post` (
  `postId` int(11) NOT NULL,
  `postCode` varchar(4) NOT NULL,
  `pageTitle` varchar(200) DEFAULT NULL,
  `postType` varchar(200) DEFAULT NULL,
  `postDetails` varchar(4000) DEFAULT NULL,
  `postPhoto` varchar(200) DEFAULT NULL,
  `postStatus` varchar(200) DEFAULT NULL,
  `param1` varchar(4000) DEFAULT NULL,
  `param2` varchar(4000) DEFAULT NULL,
  `param3` varchar(4000) DEFAULT NULL,
  `param4` varchar(4000) DEFAULT NULL,
  `param5` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserApp_post`
--

INSERT INTO `UserApp_post` (`postId`, `postCode`, `pageTitle`, `postType`, `postDetails`, `postPhoto`, `postStatus`, `param1`, `param2`, `param3`, `param4`, `param5`) VALUES
(14, '1002', 'Home', 'Slider', 'Nice Night', 'uriel-soberanes_2gXCAZ0.jpg', 'Active', 'MUNA Matrimonial', NULL, NULL, NULL, NULL),
(17, '3001', 'Services', 'Service', '{\"details\":\"Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\", \"icon\":\"calendar\"}', NULL, 'Active', 'PREMARRIAGE SEMINAR', 'calendar', 'We arrange pre-marriage seminar to inspire muslim young for marriage and to spread the importance of marriage. Young generation can get a valuable guideline attending such seminar.', NULL, NULL),
(18, '3002', 'Services', 'Service', '{\n\"details\": \"Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\", \n\n\"icon\": \"university\"\n}', NULL, 'Active', 'ARRANGING MARRIAGE', 'university', 'When two muslim life decided to be life partner with each other, we appreciate them and help them to arrange marriage. We also provide related services.', NULL, NULL),
(19, '3003', 'Services', 'Service', '{\n\"details\":    \"Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\", \n\n\"icon\":    \"shopping-bag\"\n}', NULL, 'Active', 'CONDUCTING MARRIAGE', 'shopping-bag', 'We provide the facilities for planning and conducting marriage as your liking. We follow the religious guideline and discuss the ceremony with couple.', NULL, NULL),
(20, '3004', 'Services', 'Service', '{\n\"details\": \"Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\", \n\n\"icon\": \"book\"\n}', NULL, 'Active', 'MARRIAGE REGISTRATION', 'book', 'We maintain all the necessary and legal procedure to register a marriage. We have experienced and qualified personal to fulfill the  marriage registration process.', NULL, NULL),
(21, '3005', 'Services', 'Service', '{\n\"details\": \"Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\", \n\n\"icon\": \"child\"\n}', NULL, 'Active', 'POST MARRIAGE COUNSELLING', 'child', 'We have qualified marriage therapists to provide post-marriage counseling which is very useful in improving a couple’s relationship and solving certain issues between them.', NULL, NULL),
(22, '1000', 'Home', 'Slider', NULL, '1_vr8qUaH.jpg', 'Inactive', 'Welcome to MUNA Matrimonial', NULL, NULL, NULL, NULL),
(23, '0000', 'Home', 'Banner', NULL, NULL, 'Active', 'MUNA MATRIMONIAL', 'Let\'s Walk Together', NULL, NULL, NULL),
(24, '1001', 'Home', 'Slider', NULL, 'Picture1_Edb0yn6.jpg', 'Active', 'Welcome', NULL, NULL, NULL, NULL),
(26, '4000', 'Events', 'Heading', NULL, NULL, 'Active', 'We undertake complete wedding arrangements and management and reduce your stress of organizing. Our excellent team of young and creative wedding planners takes care of all your wedding needs with perfect planning and execution.', NULL, NULL, NULL, NULL),
(27, '4004', 'Events', 'Event', NULL, '11-8-Marriage-seminar.jpg', 'Active', 'Seminar on Marriage in Islam', 'Arrange regularly.', 'Seminar-hall available.', 'We arrange a regular seminar on Islamic marriage. Our seminars are leaded by well-reputed international Islamic scholars.', NULL),
(28, '4003', 'Events', 'Event', NULL, 'marriage-education.jpg', 'Active', 'Education Program', 'Expert mentor', 'lead the program', 'We arrange educational programs to educate people more about marriage in Islam and to spread awareness.', NULL),
(29, '4002', 'Events', 'Event', NULL, '2.jpg', 'Active', 'Post Marriage Reception', 'Contact us Fixing Suitable Time', 'Help to Seek Appropriate Venue', 'We have a team of experienced event organizers who will help you to plan and organize post-marriage receptions. We select venues to your liking and the time of your selection.', NULL),
(30, '4001', 'Events', 'Event', NULL, 'YSM-Attantance-in-Convention.png', 'Active', 'Islamic Cultural Program', 'National and International  artists', 'perform in the program.', 'We arrange Islamic cultural programs to Introduce the essence of Islamic culture. Our aim is to develop spiritual, moral and social senses, and promote the values of tolerance', NULL),
(31, '5000', 'About Us', 'Heading', NULL, 'about-img_2Rkh8RX.jpg', 'Active', 'Our aim is to provide Grooms and Brides with excellent matchmaking experience by exploring the opportunities and resources to meet true potential partners.', NULL, NULL, NULL, NULL),
(33, '6001', 'About Us', 'Team', NULL, NULL, 'Inactive', 'Harun O Rashid', 'National President', 'https://twitter.com\nhttps://facebook.com\nhttps://google.com\nhttps://linkedin.com', NULL, NULL),
(34, '6002', 'About Us', 'Team', NULL, NULL, 'Inactive', 'Abul Bashar Faizullah', 'Vice President', 'https://twitter.com\nhttps://facebook.com\nhttps://google.com\nhttps://linkedin.com', NULL, NULL),
(35, '6003', 'About Us', 'Team', NULL, NULL, 'Inactive', 'Arman Chowdhury', 'Executive Director', 'https://twitter.com\nhttps://facebook.com\nhttps://google.com\nhttps://linkedin.com', NULL, NULL),
(36, '6004', 'About Us', 'Team', NULL, NULL, 'Active', 'Dr. Riajul Islam', 'Director of Family Development & Support', '509-432-9547', 'https://twitter.com\nhttps://facebook.com\nhttps://google.com\nhttps://linkedin.com', NULL),
(37, '7000', 'FAQ', 'Heading', NULL, 'faqs-image.jpg', 'Active', 'Know about MUNA. You may have some common questions that are answered here.', NULL, NULL, NULL, NULL),
(38, '7001', 'FAQ', 'FAQ', NULL, NULL, 'Active', 'Why do I choose MUNA Matrimonial?', 'This is the only matrimonial platform for North American Bengali Muslims. To choose perfect life partner, you may use MUNA Matrimonial.', NULL, NULL, NULL),
(39, '7002', 'FAQ', 'FAQ', NULL, NULL, 'Active', 'How to register?', 'Go to Login, or Let\'s Begin button on Home page. You will be guided our registration process.', NULL, NULL, NULL),
(40, '7003', 'FAQ', 'FAQ', NULL, NULL, 'Inactive', 'Is registration completely free?', 'Yes. Registration is completely free. But you may donate us if you like our service.', NULL, NULL, NULL),
(41, '7004', 'FAQ', 'FAQ', NULL, NULL, 'Active', 'How may I get supported through this website?', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL, NULL, NULL),
(42, '7005', 'FAQ', 'FAQ', NULL, NULL, 'Active', 'Could you help me to arrange my Post Wedding Reception?', 'Yes. We have the facility to arrange Post Wedding Reception. We have expert and experienced team to handle this type of valuable occasion.', NULL, NULL, NULL),
(43, '9000', 'Contact Us', 'Heading', NULL, NULL, 'Active', 'If you are looking for a service like ours don’t hesitate to contact us.', NULL, NULL, NULL, NULL),
(44, '9001', 'Contact Us', 'Contact', NULL, NULL, 'Active', '1033 Glenmore Ave, Brooklyn, NY 11208. USA', '+1 718-277-7900', 'munamatrimonial@gmail.com', 'https://facebook.com/munamatrimonial\nhttps://twitter.com/munamatrimonial', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d387191.33750346623!2d-73.979681!3d40.6974881!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY%2C+USA!5e0!3m2!1sen!2sin!4v1541477355474'),
(46, '4005', 'Events', 'Event', NULL, NULL, 'Inactive', 'Test Event 1', 'sfafasdfa', NULL, NULL, NULL),
(58, '5001', 'About Us', 'About', NULL, 'about-img_RzryDe8.jpg', 'Active', '350', 'Our mission is to arrange perfect marriage among muslim youngs.', 'Let\'s Walk Together', 'Our Programs:', 'Arranging muslim marriage\nPremarriage Counselling\nSeminar on Islamic marriage\nIslami Cultural Programs'),
(59, '3000', 'Services', 'Heading', NULL, NULL, 'Active', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL, NULL, NULL, NULL),
(60, '9100', 'Signup', 'Privacy Policy', NULL, NULL, 'Active', 'I, hereby certify that the information given in this form is true, correct, and complete in all respects. If there is any incorrect information in this form, I may be removed from the process.\n\n        • I will promptly inform MUNA Matrimonial Team of any changes in the information provided above.\n        • I authorize MUNA Matrimonial Team to utilize the information provided by me according to the needs of the service.\n        • I pledge to keep all the information provided by the MUNA Matrimonial Team confidential.\n        • If I get married at any time, I will inform the MUNA Matrimonial Team.\n        • As the MUNA Matrimonial Team is only introducing 2 parties to each other, in the event of a failure to arrange a marriage, I shall not hold MUNA Matrimonial Team or MUNA responsible. I agree to abide by decisions and rulings given by MUNA National President or his designated representatives in matters of disputes and will abide by decisions of MUNA, its National President, and/or their representatives.\n\n      By submitting this form, I agree to a complete and thorough criminal and background check by MUNA Matrimonial Team.\n      By signing this contract, I approve to a background check.', NULL, NULL, NULL, NULL),
(61, '1003', 'Home', 'Slider', NULL, '11-8-Marriage-seminar_t5zsTSh.jpg', 'Active', 'Welcome to MUNA Matrimonial', NULL, NULL, NULL, NULL),
(63, '7006', 'FAQ', 'FAQ', NULL, NULL, 'Active', 'How much time is required to get certified under MUNA MATRIMONIAL?', 'Normally it takes a minimum of 1 month time to get a certificate under the Muslim marriage act. But, in very emergency case the time duration can be considered.', NULL, NULL, NULL),
(64, '9200', 'Home', 'Important Link', NULL, NULL, 'Active', 'MUNA', 'https://muslimummah.org/', NULL, NULL, NULL),
(65, '9201', 'Home', 'Important Link', NULL, NULL, 'Inactive', 'Quran Research', 'https://corpus.quran.com/', NULL, NULL, NULL),
(66, '9202', 'Home', 'Important Link', NULL, NULL, 'Inactive', 'Hadith', 'https://sunnah.com/', NULL, NULL, NULL),
(67, '9203', 'Home', 'Important Link', NULL, NULL, 'Inactive', 'Islamic Book', 'http://islam.net.bd/', NULL, NULL, NULL),
(68, '9204', 'Home', 'Important Link', NULL, NULL, 'Inactive', 'Prayer Time', 'https://www.islamicfinder.org/', NULL, NULL, NULL),
(69, '9205', 'Home', 'Important Link', NULL, NULL, 'Inactive', 'Moon Sighting', 'https://www.moonsighting.com/', NULL, NULL, NULL),
(70, '6005', 'About Us', 'Team', NULL, NULL, 'Active', 'Prof. Mohammed Nazrul Islam', 'Joint Director of Family Development & Support', '714-461-0456', 'https://twitter.com\nhttps://facebook.com\nhttps://google.com\nhttps://linkedin.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `UserApp_tempuser`
--

CREATE TABLE `UserApp_tempuser` (
  `tempId` int(11) NOT NULL,
  `tempName` varchar(100) DEFAULT NULL,
  `tempPass` varchar(100) DEFAULT NULL,
  `tempEmail` varchar(100) DEFAULT NULL,
  `tempGender` varchar(20) DEFAULT NULL,
  `tempState` varchar(100) DEFAULT NULL,
  `tempCellPhone` varchar(100) DEFAULT NULL,
  `tempVeriCode` varchar(100) DEFAULT NULL,
  `tempDateTime` datetime(6) DEFAULT NULL,
  `tempBirthYear` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserApp_tempuser`
--

INSERT INTO `UserApp_tempuser` (`tempId`, `tempName`, `tempPass`, `tempEmail`, `tempGender`, `tempState`, `tempCellPhone`, `tempVeriCode`, `tempDateTime`, `tempBirthYear`) VALUES
(5, 'gfd', 'VFZSSmVrNUVWVEk9', 'dfgdfs', 'Male', 'Massachusetts', '4646545644654', '812464', '2022-03-01 01:44:10.000000', NULL),
(11, 'bb', 'V1ZoT2F3PT0=', 'rifatdjmc25@gmail.com', 'Female', NULL, NULL, '832508', '2022-03-18 15:46:42.000000', NULL),
(14, 'MOHAMMED R ISLAM', 'VkZoV2RWbFhNV2hrU0Vwd1lsYzVkV0ZYUm5OTlUxRTk=', 'PNW.HALAL@GMAIL.COM', 'Male', 'Washington', '5094329547', '825231', '2022-05-21 03:35:26.000000', 1960),
(15, 'Maruf', 'VFZSSmVrNUJQVDA9', 'innovationbd21@gmail.com', 'Male', 'Maine', '039580935032', '819178', '2022-05-21 19:27:32.000000', 1990),
(16, 'Testing', 'WkVkV2VtUkhiSFZhZWtWNVRYYzlQUT09', 'testing', 'Male', 'Alabama', '7898764566', '571165', '2022-05-21 10:20:19.000000', 1990),
(18, 'Maruf', 'VFZSSmVrNUJQVDA9', 'innovationbd21@gmail.com', 'Male', 'Florida', '092348092348', '689553', '2022-05-21 21:20:49.000000', 1990),
(19, 'Nazmuil', 'VFZSSmVrNUVWVEk9', 'testing@gmail.com', 'Female', NULL, NULL, '438557', '2022-07-23 12:16:01.000000', NULL),
(20, 'Innovation', 'VFZSSmVrNUJQVDA9', 'innovationbd21@gmail.com', 'Male', NULL, NULL, '313241', '2022-07-25 09:15:10.000000', NULL),
(21, 'Innovation', 'VFZSSmVrNUJQVDA9', 'innovationbd21@gmail.com', 'Male', NULL, NULL, '641698', '2022-07-25 09:17:44.000000', NULL),
(24, 'flkjsdklfj', 'VFZSSmVnPT0=', 'lskdfj@dlkfgj.co', 'Male', 'Delaware', '234523424234', '502715', '2022-08-20 21:36:57.000000', 1996),
(25, 'dsfdg', 'VFZFOVBRPT0=', 'dfgdf@ldskjfg.ccl', 'Female', 'Colorado', '34234234242', '633548', '2022-08-20 21:41:37.000000', 1999),
(26, 'testing', 'WkVkV2VtUkhiSFZhZWtWNVRYcFJNVTVuUFQwPQ==', 'testing@gmail.com', 'Male', 'Hawaii', '6465569078', '324580', '2022-08-27 10:43:05.000000', 1986),
(27, 'test123', 'WkVkV2VtUkVSWGxOZHowOQ==', 'test123@gmail.com', 'Male', 'Illinois', '5556668899', '411232', '2022-08-27 10:44:56.000000', 1986),
(28, 'kajjdj', 'VFVSamVFMUVWVEJOYWtFOQ==', 'jaman.cseru@gmail.com', 'Male', 'New York', '6073708910', '330171', '2022-08-30 08:17:31.000000', 1988),
(30, 'MUNA', 'WkVkV2VtUkhiSFZhZWtWNVRYYzlQUT09', 'nazmul.hoquecu98@gmail.com', 'Male', 'New York', '6469067855', '252076', '2022-09-17 04:14:38.000000', 1990),
(31, 'tester', 'WkVkV2VtUkhiSFZhZWtWNVRYYzlQUT09', 'nazmul.hoquecu98@gmail.com', 'Male', 'New York', '6469067855', '900081', '2022-09-17 04:16:55.000000', 1990),
(32, 'test', 'WkVkV2VtUkhiSFZhZWtWNVRYYzlQUT09', 'nazmul.hoquecu98@gmail.com', 'Male', 'New York', '6469067851', '442317', '2022-09-17 04:24:18.000000', 1990),
(33, 'Maruf Barik', 'VFZSSmVrNUJQVDA9', 'innovationbd21@gmail.com', 'Male', 'Georgia', '+10909889393', '646248', '2022-09-17 15:09:14.000000', 1992),
(34, 'sdfsdf', 'VFZSSmVrNUJQVDA9', 'innovationbd21@gmail.com', 'Male', 'District of Columbia', '23345543221', '141857', '2022-09-17 16:17:33.000000', 1990),
(35, 'asdfsdfsdfsd', 'VFZSSmVrNUJQVDA9', 'innovationbd21@gmail.com', 'Female', 'California', '23234232432', '971620', '2022-09-17 16:19:21.000000', 1988),
(40, 'sfsd', 'WXpOTlBRPT0=', 'sdfsdf@gmail.com', 'Male', 'New York', '6469067888', '942167', '2022-10-01 05:16:21.000000', 1988),
(41, 'test', 'VFZSSmVrNUJQVDA9', 'test@gmail.com', 'Male', 'Georgia', 'sdfs', '900447', '2022-11-11 19:32:56.000000', 1956),
(42, 'test', 'VFZSSmVrNUJQVDA9', 'test@gmail.com', 'Male', 'Hawaii', 'dsafasfafaffa', '387777', '2022-11-11 19:34:02.000000', 1990),
(43, 'test', 'VFZSSmVrNUJQVDA9', 'test@gmail.com', 'Male', 'Florida', 'fsdfasdfzsasdfsaf', '873120', '2022-11-12 05:13:59.000000', 1990),
(44, 'Test', 'VFZSSlBRPT0=', 'test@gmail.com', 'Male', 'Florida', 'testing', '233280', '2022-11-12 11:31:51.000000', 1990),
(45, 'Fatema Siddiqa', 'VlRKb2RtTnROV2hpU0d0MVRWRTlQUT09', 'fatemasi@buffalo.edu', 'Female', 'New York', '3475576481', '858364', '2022-11-12 16:30:07.000000', 2000),
(46, 'egljlkfdjsl', 'VFZSSlBRPT0=', 'ldkjflkjfW@dlfkj.com', 'Male', 'South Carolina', '309485038903', '790682', '2022-11-15 12:08:55.000000', 1990),
(47, 'ldfdlfgk', 'WTBoV2RGRkVSWGxOZWxFOQ==', 'dlfldjf@dksfj.com', 'Male', 'South Carolina', '0934809300', '885482', '2022-11-15 12:16:14.000000', 1999),
(52, 'Ali Anan', 'VVZkNGNGRkVTVEJPUkUwd1VVRTlQUT09', 'ali.anan@gmail.com', 'Male', 'District of Columbia', '08801738-2333000', '173741', '2022-11-20 15:11:10.000000', 2000),
(55, 'Abdul Bari', 'V1d0Q2VXRlVSWGxOZWxFOQ==', 'abulbari.bec@gmail.com', 'Male', 'Hawaii', '039409234023', '633460', '2022-11-24 13:59:03.000000', 1990),
(59, 'Tanvir', NULL, 'Ytanvirthasan120@gmail.com', 'Male', 'New York', '7163038253', '738492', '2022-12-16 18:52:25.000000', 1999),
(63, 'Mosammat', 'VmtkV2VtUkZRWGhOYWs1Qg==', 'mdnhouqe1@gmail.com', 'Female', 'New York', '6463037856', '755435', '2022-12-31 04:43:00.000000', 1988),
(65, 'Rahim Hossain', 'Vld0Q2IyRlVSVEZOUkZsM1RucEZQUT09', 'rahimhossain23@gmail.com', 'Male', 'New York', '6073139245', '725518', '2023-01-13 18:38:11.000000', 1996),
(66, 'Rahim Hossain', 'Vld0Q2IyRlVSVEZOUkZsM1RucEZQUT09', 'rahimhossain23@gmail.com', 'Male', 'New York', '6073139245', '958040', '2023-01-13 18:40:47.000000', 1996),
(73, 'SHARAFAT SARKER', 'VFhwQmExSllXbXhqYlVwb1ltMXplVTFEVlQwPQ==', 'SHARAFAT.SARKER@GMAIL.COM', 'Male', 'Georgia', '4704039921', '406578', '2023-01-21 17:23:17.000000', 1983),
(74, 'SHARAFAT SARKER', 'VFhwQmExSllXbXhqYlVwb1ltMXplVTFEVlQwPQ==', 'SHARAFAT.SARKER@GMAIL.COM', 'Male', 'Georgia', '4704039921', '915288', '2023-01-21 17:32:47.000000', 1983),
(75, 'Yahya Habib', 'Vmtkb2JGSnRPWGxaTWxWNlRrUlZkMGxSUFQwPQ==', 'YAHYA.T.HABIB@GMAIL.COM', 'Male', 'Georgia', '4703079416', '169733', '2023-01-22 09:24:31.000000', 2003),
(100, 'Sheuly Ahmed', NULL, 'Sheulyahmed479@icloud.com', 'Female', 'New York', '9179006166', '701348', '2023-02-01 10:33:30.000000', 1963),
(104, 'Shanjida Afrin', 'VlRKb2FHSllRbWhOYWsxcg==', 'shampa.feni@gmail.com', 'Female', 'New York', '5169127996', '928188', '2023-02-06 10:13:16.000000', 2000),
(111, 'rafee', 'VVcxc2MySkhSbTlOZWtWbw==', 'hy1323@gmail.com', 'Male', 'Michigan', '5862378255', '881706', '2023-03-05 10:10:05.000000', 1997),
(115, 'Nori rahman', 'VVVad2RtTkVaM2hpVlRBOQ==', 'nor.70@gmail.com', 'Female', 'Kentucky', '8594235646', '895318', '2023-03-14 22:56:51.000000', 1996),
(116, 'Tasnim Hossain', 'VWpKR2RWcEhSbmxoVjBaQlRucEZQUT09', 'tasnimhossain8@gmail.com', 'Female', 'Arizona', '5204659633', '175532', '2023-03-15 17:40:41.000000', 1998),
(121, 'Fakrul', 'VXpKb2FHSnRPWFJOVlVFOQ==', 'Fakrul91@hotmail.com', 'Male', 'Georgia', '404-513-1291', '633517', '2023-03-23 09:06:09.000000', 1965),
(128, 'Ahmed', NULL, 'muajmetro454@gmail.com', 'Male', 'Michigan', '3137757052', '417620', '2023-03-28 17:14:19.000000', 1995),
(133, 'Muhammad Yasir', 'VmxoS2FHSnVWbnBSUkdjMA==', 'm_yasir87@yahoo.com', 'Male', 'New York', '6469443119', '620416', '2023-05-14 11:40:08.000000', 1987),
(134, 'Muhammad Yasir', 'VmxoS2FHSnVWbnBSUkdjMA==', 'm_yasir87@yahoo.com', 'Male', 'New York', '6469443119', '702749', '2023-05-14 11:41:29.000000', 1987),
(137, 'Lubna', 'WTFWU2JWcHNWWHBOUkdoNFRUQkNNdz09', 'lubnaakter98@gmail.com', 'Female', 'New York', '9295039461', '987512', '2023-05-20 13:54:57.000000', 1998),
(142, 'Mashiya Uddin', 'VTFkS2RXRXlSakJoUjFac1kydEJlRTFFUlQwPQ==', 'mmashiyaauddin@gmail.con', 'Female', 'Michigan', '5868739630', '879733', '2023-07-26 07:01:12.000000', 2005),
(151, 'Md Alamgir Kabir', 'VFZVeGNHTXpUblJsVnpGMllsTkZQUT09', 'mdalamgir.kabir@rockets.utoledo.edu', 'Male', 'Ohio', '12342819334', '615081', '2023-08-05 15:21:12.000000', 1986),
(152, 'Md Alamgir Kabir', 'VFZVeGNHTXpUblJsVnpGMllsTkZQUT09', 'mdalamgir.kabir@rockets.utoledo.edu', 'Male', 'Ohio', '12342819334', '683219', '2023-08-05 15:23:20.000000', 1986),
(153, 'Md Alamgir Kabir', 'VFZVeGNHTXpUblJsVnpGMllsTkZQUT09', 'mkabir2@kent.edu', 'Male', 'Ohio', '12342819334', '531685', '2023-08-05 15:24:41.000000', 1986),
(154, 'Mohammed', 'VGpCT2VWcFlUbXBhVnpVd1MyYzlQUT09', 'sis.athiyaa@gmail.com', 'Male', 'California', '4374296318', '239863', '2023-08-14 03:21:43.000000', 1996),
(158, 'ray', 'VlcxR05XRkhSblZOVkVsNlMyYzlQUT09', 'ray2000@gmail.com', 'Female', 'Michigan', '(248) 762-0356', '900594', '2023-08-15 15:55:49.000000', 2000),
(164, 'Ismail Hossain Rimon', 'VWpKc2RWb3lSbTlaVjJSb1kyMUZlRkZCUFQwPQ==', 'Ismailhossainrimon20@hmail.com', 'Male', 'New York', '9294138551', '706982', '2023-08-16 06:50:04.000000', 1997),
(183, 'Shamima Khatun', 'VXpKR2RGbFhkM2hQVkdzeg==', 'kamalshorker@gmail.com', 'Female', 'Georgia', '01727218439', '592727', '2023-08-28 17:21:52.000000', 1993),
(216, 'Md Mahmudul Hasan', 'VkZkT1QyVldPVUZKZWtGM1RWRTlQUT09', 'mahmudulwh@gmai.com', 'Male', 'New York', '9176602905', '545916', '2023-10-19 15:19:35.000000', 1994),
(234, 'Sk Fayazul Islam', 'VlRKYWNGRkVTWGROYWswOQ==', 'rxfayaz@gmail.com', 'Male', 'Florida', '6892578456', '443996', '2023-11-26 08:56:08.000000', 1991),
(240, 'Tawhid Chowdhury', 'VlcxR2IxcFhkM2xOUkVsNlNrRTlQUT09', 'ctawhid11@gmail.com', 'Male', 'Michigan', '8565039407', '483924', '2023-11-26 15:48:07.000000', 1999),
(254, 'FAHMIDA SHIFAT', 'WkRKR2IyTXpWalJNVkZwVFdWaFNNbVJUTVc5WlYzQjRZVmN3UFE9PQ==', 'sifatnizam48@gmail.com', 'Female', 'Florida', '9294187694', '348299', '2023-12-05 02:20:19.000000', 1990),
(255, 'FAHMIDA SHIFAT', 'WlVoV2NtUXlPVEpNVjFwb1dXNUNhRTlUTVhKaFdGSTJVVmRSUFE9PQ==', 'sifatnizam48@gmail.com', 'Female', 'Florida', '9294187694', '678158', '2023-12-05 02:25:11.000000', 1990),
(256, 'FAHMIDA  SHIFAT', 'V210c2NXTXlPVzVNVjA1b1pHMW9kazFETVc5aFZ6VTJaVmhuUFE9PQ==', 'shifat011@yahoo.com', 'Female', 'Florida', '9294187694', '225176', '2023-12-05 02:28:46.000000', 1990),
(258, 'Zarin Musarrat Manita', 'WVVoV2RGbHRlR3hSUmxKc1pVZEdla2xVU1hjPQ==', 'zmanita@mcneese.edu', 'Female', 'Louisiana', '3374195310', '523438', '2023-12-06 18:33:18.000000', 1998),
(264, 'Yeasin Arafat', 'Vld0Q2JtRkhiR2xOZWswOQ==', 'yeasinraghib@gmaile.com', 'Male', 'Delaware', '2154060326', '722176', '2023-12-27 05:19:36.000000', 1986),
(266, 'B', 'WkVkV2VtUkhWbmxQVkdjOQ==', 'B297@gmail.com', 'Female', 'New York', '7185479700', '275764', '2024-01-01 07:28:27.000000', 1996),
(267, 'NAFIS A HOQUE', 'VlZoa2JHTnVValZOVkVsclNrRTlQUT09', 'nafismarriage5450@gmail.com', 'Male', 'Georgia', '4047831724', '232785', '2024-01-01 11:59:40.000000', 1999),
(308, 'Qulsuma Baig', 'VlZSRmVVMVVSVFZQVkZreVdXYzlQUT09', 'qulsumabegum@gmail.com', 'Female', 'New York', '9293512020', '467394', '2024-03-11 14:22:59.000000', 1996),
(333, 'Demo', 'VWtkV2RHSXdRbXRhVnpGMlRXYzlQUT09', 'demo@gmail.com', 'Male', 'Florida', '012345789704', '241864', '2024-05-13 00:30:32.000000', 1998);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `UserApp_adminlog`
--
ALTER TABLE `UserApp_adminlog`
  ADD PRIMARY KEY (`logId`);

--
-- Indexes for table `UserApp_adminuser`
--
ALTER TABLE `UserApp_adminuser`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `UserApp_femaleuser`
--
ALTER TABLE `UserApp_femaleuser`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `UserApp_maleuser`
--
ALTER TABLE `UserApp_maleuser`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `UserApp_matchingtable`
--
ALTER TABLE `UserApp_matchingtable`
  ADD PRIMARY KEY (`matchingId`);

--
-- Indexes for table `UserApp_matchmaking`
--
ALTER TABLE `UserApp_matchmaking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserApp_matchmaking_femaleId_id_95489998_fk_UserApp_f` (`femaleId_id`),
  ADD KEY `UserApp_matchmaking_maleId_id_a736bbb4_fk_UserApp_m` (`maleId_id`);

--
-- Indexes for table `UserApp_message`
--
ALTER TABLE `UserApp_message`
  ADD PRIMARY KEY (`messageId`);

--
-- Indexes for table `UserApp_post`
--
ALTER TABLE `UserApp_post`
  ADD PRIMARY KEY (`postId`);

--
-- Indexes for table `UserApp_tempuser`
--
ALTER TABLE `UserApp_tempuser`
  ADD PRIMARY KEY (`tempId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `UserApp_adminlog`
--
ALTER TABLE `UserApp_adminlog`
  MODIFY `logId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `UserApp_adminuser`
--
ALTER TABLE `UserApp_adminuser`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `UserApp_femaleuser`
--
ALTER TABLE `UserApp_femaleuser`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `UserApp_maleuser`
--
ALTER TABLE `UserApp_maleuser`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT for table `UserApp_matchingtable`
--
ALTER TABLE `UserApp_matchingtable`
  MODIFY `matchingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `UserApp_matchmaking`
--
ALTER TABLE `UserApp_matchmaking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=927;

--
-- AUTO_INCREMENT for table `UserApp_message`
--
ALTER TABLE `UserApp_message`
  MODIFY `messageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `UserApp_post`
--
ALTER TABLE `UserApp_post`
  MODIFY `postId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `UserApp_tempuser`
--
ALTER TABLE `UserApp_tempuser`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `UserApp_matchmaking`
--
ALTER TABLE `UserApp_matchmaking`
  ADD CONSTRAINT `UserApp_matchmaking_femaleId_id_95489998_fk_UserApp_f` FOREIGN KEY (`femaleId_id`) REFERENCES `UserApp_femaleuser` (`userId`),
  ADD CONSTRAINT `UserApp_matchmaking_maleId_id_a736bbb4_fk_UserApp_m` FOREIGN KEY (`maleId_id`) REFERENCES `UserApp_maleuser` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
