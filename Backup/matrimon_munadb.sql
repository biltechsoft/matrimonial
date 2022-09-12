-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 12, 2022 at 02:34 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
(52, 'Can view message', 13, 'view_message');

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
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'UserApp', 'adminuser'),
(8, 'UserApp', 'femaleuser'),
(9, 'UserApp', 'maleuser'),
(10, 'UserApp', 'matchingtable'),
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
(48, 'UserApp', '0010_femaleuser_lockedid_maleuser_lockedid_and_more', '2022-08-27 04:33:03.579584');

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
(1, 'munasuperadmin', 'muna1234', 'MUNA Admin', 'TOP', 'Active', '23862848'),
(2, 'karamotali', '1234', 'Karamot Ali', 'MODERATOR', 'Active', '72497287'),
(3, 'adminmuna', 'muna1234', 'Matrimonial Admin', 'MODERATOR', 'Active', '53066453');

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
  `personalWebsite` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `placeOfBirth` varchar(100) DEFAULT NULL,
  `health` varchar(100) DEFAULT NULL,
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
  `preReligiousBrief` varchar(100) DEFAULT NULL,
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
  `photo` varchar(100) DEFAULT NULL,
  `cv` varchar(100) DEFAULT NULL,
  `album` varchar(100) DEFAULT NULL,
  `govIssuedId` varchar(100) DEFAULT NULL,
  `matchShowLimit` int(11) DEFAULT NULL,
  `userPass` varchar(100) DEFAULT NULL,
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
  `signature` varchar(100) DEFAULT NULL,
  `gallery` varchar(1000) DEFAULT NULL,
  `tempGallery` varchar(1000) DEFAULT NULL,
  `lockedId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserApp_femaleuser`
--

INSERT INTO `UserApp_femaleuser` (`userId`, `fullName`, `nickName`, `gender`, `address`, `city`, `state`, `zip`, `cellPhone`, `workPhone`, `homePhone`, `email`, `personalWebsite`, `age`, `dateOfBirth`, `height`, `weight`, `placeOfBirth`, `health`, `maritalStatus`, `children`, `childrenNumber`, `childrenAges`, `immigrationStatus`, `immigrationStatusOther`, `highSchool`, `highSchoolYear`, `bachelors`, `bachelorsYear`, `masters`, `mastersYear`, `doctorate`, `doctorateYear`, `otherDegree`, `otherDegreeYear`, `highestEducation`, `employed`, `employment`, `position`, `income`, `religiousPractice`, `religiousPracticeOther`, `religiousPracticeBrief`, `revertTime`, `wear`, `smoker`, `preReligious`, `preReligiousOther`, `preReligiousBrief`, `preBeard`, `preSmoking`, `preEthnic`, `preEthnicSpecific`, `preImmigrationStatus`, `preImmigrationStatusOther`, `preMaritalStatus`, `preChildren`, `preEducation`, `preEmployment`, `preIncome`, `preAgeGap`, `guarName`, `guarAddress`, `guarCity`, `guarState`, `guarCountry`, `guarPhone`, `guarEmail`, `guarProfession`, `familyBrief`, `refName1`, `refRelation1`, `refPhone1`, `refName2`, `refRelation2`, `refPhone2`, `refName3`, `refRelation3`, `refPhone3`, `photo`, `cv`, `album`, `govIssuedId`, `matchShowLimit`, `userPass`, `status`, `openingDate`, `lastEdit`, `userToken`, `profileCompleteness`, `matchId`, `matchPercentage`, `reqAccepted`, `reqRejected`, `reqSent`, `birthYear`, `signature`, `gallery`, `tempGallery`, `lockedId`) VALUES
(25, 'Candidate 1', NULL, 'Female', 'Address 1', 'Chalfont', 'NY', '101101.0', 'sdfsafwerwf', 'sdfafasdf', 'sdfafsdfa', 'test1', NULL, 29, NULL, NULL, NULL, '<h1> I am test </h1><script> this is test script </script>', NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Doctorate', 'Yes', NULL, NULL, NULL, 'Other', NULL, NULL, NULL, 'Headscarf', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', 'No Preference', 'No Preference', 'nullUS Citizen,H1B,', NULL, 'nullNo Preference,', 'No', 'Bachelor', 'Yes', 50000, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', NULL, '2022-05-21 10:39:43.000000', '86781125', 83, '66,69,78,79,63,67,72,61,65,70,', '60,60,60,60,50,50,50,40,40,40,', NULL, NULL, NULL, 1989, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(26, 'Candidate 3', NULL, 'Female', 'Address 3', 'Woodside', 'NY', '101101.0', '000-000-0002', NULL, NULL, 'test3@gmail.com', NULL, 27, NULL, 63, 130, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Doctorate', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, NULL, 'No', 'Sunni', NULL, NULL, 'Yes', 'No', NULL, 'Bengali', 'US Citizen', NULL, 'Single', 'No', 'Masters', 'Yes', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Capture3.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', NULL, '2022-04-23 08:47:12.000000', '23163609', 83, '61,63,72,78,66,67,69,70,79,65,', '80,70,70,70,60,60,60,60,60,50,', '62,66,67,69', NULL, NULL, 1995, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(27, 'Candidate 4', '4', 'Female', 'Address 4', 'Cary', 'NY', '101101.0', '000-000-0003', NULL, NULL, 'test4@gmail.com', NULL, 28, NULL, 60, 140, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', NULL, NULL, 45000, 'Sunni', NULL, NULL, NULL, 'Jelbab/Abaya', 'No', 'Sunni', NULL, NULL, 'No Preference', NULL, NULL, 'No Preference', 'No Preference', NULL, 'Single', 'No', 'No Preference', 'No Preference', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', NULL, '2022-08-20 21:17:29.000000', '12919348', 80, '78,61,63,67,69,72,79,66,70,71,', '40,30,30,30,30,30,30,20,20,20,', NULL, NULL, NULL, 1991, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(28, 'Candidate 11', NULL, 'Female', 'Address 11', 'Northern NJ', 'NY', '101101.0', '000-000-0010', NULL, NULL, 'test11@gmail.com', NULL, 28, NULL, 61, 107, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, NULL, 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', NULL, 'Bengali', 'US Citizen,Parmanent Resident,F-1', NULL, 'Single', 'No', 'Bachelor', 'No Preference', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', NULL, '2022-04-02 17:52:13.000000', '79160102', 80, '78,61,63,67,69,72,79,66,70,71,', '50,40,40,40,40,40,40,30,30,30,', NULL, NULL, NULL, 1994, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(29, 'Candidate 16', NULL, 'Female', 'Address 16', 'Astoria', 'NY', '101101.0', '000-000-0015', NULL, NULL, 'test16@gmail.com', NULL, 22, NULL, 65, 150, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'Jelbab/Abaya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US Citizen,EAD', NULL, 'Single', 'No', 'Bachelor', 'No Preference', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', NULL, NULL, NULL, NULL, '70,72,61,63,67,69,73,78,79,66,', '30,30,20,20,20,20,20,20,20,10,', NULL, NULL, NULL, 1997, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(30, 'Candidate 18', NULL, 'Female', 'Address 18', 'Gibbsboro', 'NY', '101101.0', '000-000-0017', NULL, NULL, 'test18@gmail.com', NULL, 25, NULL, 62, 125, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, 60000, 'Sunni', NULL, NULL, NULL, 'None', 'No', 'Sunni', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Single', 'No', 'Masters', 'Yes', 150000, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, 1992, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(31, 'Afia Adilah Khan', 'PushpoK', 'Female', 'Tangail,Dhaka Bangladesh.', 'Honolulu', 'Nebraska', '4567', '142323432534', NULL, NULL, 'fatemajohra@munamail.com', 'www.fatema.com', 26, NULL, 61, 130, 'Kalifornia', 'no', 'Single', 'No', NULL, '0', 'US Citizen', NULL, 'azizur', 300009, 'CSE', 2016, 'ICT', 2018, 'Cyber Security', 2021, 'Media', 2022, 'Masters', 'Yes', 'UK', 'IT expart', 119999, 'Sunni', 'Maliki', 'I am so much Happy with my Religious.', NULL, 'Headscarf,Niqab,', 'No', 'Other', 'Habboli', 'Alhamdulillah. I am so much happy.', 'No Preference', 'No Preference', 'Specific Ethnicity', 'Bangladeshi', 'Student Visa,F-1,H1B,Bangladesh,', NULL, 'Divorced,Widowed,', 'No', 'Bachelor', 'Yes', 100000, 3, 'Azizur Rahman', 'Dhaka, Bangladesh', 'Mymensingh', 'Alabama', 'Bangladesh', '222333444878', 'aizur.rahman@gmail.com', 'Teacher', 'Cultural Person', 'Iftekhar', 'Uncle', '12323234234', NULL, NULL, NULL, NULL, NULL, NULL, 'favicon-2.ico', 'MUNA-Matrimonial-Registration-Form-June-2018.pdf', NULL, 'about-img.png', 7, 'VFZSSmVrNUJQVDA9', 'Active', '2022-03-18 12:36:04.000000', '2022-08-27 09:48:33.000000', '85601774', 100, '61,62,70,78,64,66,69,72,73,81,', '40,40,40,40,30,30,30,30,30,30,', '78,70,73,69,64,61', NULL, NULL, 1996, 'client-2.png', 'love-hand.jpg,federico-beccari.jpg,soroush-karimi.jpg,6.jpg', NULL, NULL),
(32, 'Rifat', NULL, 'Female', NULL, NULL, 'Illinois', NULL, NULL, NULL, NULL, 'rifatdjmc25@gmail.com', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sunni', NULL, NULL, 'Beard', 'No', 'Own Ethnicity', NULL, NULL, NULL, 'Single', 'No', 'Masters', 'Employed', NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile-icon.png', NULL, NULL, NULL, 5, 'VFZSSmVnPT0=', 'Locked', '2022-03-18 15:47:32.000000', '2022-03-18 15:47:32.000000', '29183433', NULL, '64,67,69,71,82,61,62,72,78,79,', '50,50,50,50,50,40,40,40,40,40,', NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, 81);

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
  `personalWebsite` varchar(100) DEFAULT NULL,
  `birthYear` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `placeOfBirth` varchar(100) DEFAULT NULL,
  `health` varchar(100) DEFAULT NULL,
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
  `preReligiousBrief` varchar(100) DEFAULT NULL,
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
  `photo` varchar(100) DEFAULT NULL,
  `cv` varchar(100) DEFAULT NULL,
  `album` varchar(100) DEFAULT NULL,
  `govIssuedId` varchar(100) DEFAULT NULL,
  `matchShowLimit` int(11) DEFAULT NULL,
  `userPass` varchar(100) DEFAULT NULL,
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
  `signature` varchar(100) DEFAULT NULL,
  `gallery` varchar(1000) DEFAULT NULL,
  `tempGallery` varchar(1000) DEFAULT NULL,
  `lockedId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserApp_maleuser`
--

INSERT INTO `UserApp_maleuser` (`userId`, `fullName`, `nickName`, `gender`, `address`, `city`, `state`, `zip`, `cellPhone`, `workPhone`, `homePhone`, `email`, `personalWebsite`, `birthYear`, `age`, `dateOfBirth`, `height`, `weight`, `placeOfBirth`, `health`, `maritalStatus`, `children`, `childrenNumber`, `childrenAges`, `immigrationStatus`, `immigrationStatusOther`, `highSchool`, `highSchoolYear`, `bachelors`, `bachelorsYear`, `masters`, `mastersYear`, `doctorate`, `doctorateYear`, `otherDegree`, `otherDegreeYear`, `highestEducation`, `employed`, `employment`, `position`, `income`, `religiousPractice`, `religiousPracticeOther`, `religiousPracticeBrief`, `revertTime`, `beard`, `smoker`, `preReligious`, `preReligiousOther`, `preReligiousBrief`, `preWear`, `preSmoking`, `preEthnic`, `preEthnicSpecific`, `preImmigrationStatus`, `preImmigrationStatusOther`, `preMaritalStatus`, `preChildren`, `preEducation`, `preEmployment`, `preIncome`, `preAgeGap`, `guarName`, `guarAddress`, `guarCity`, `guarState`, `guarCountry`, `guarPhone`, `guarEmail`, `guarProfession`, `familyBrief`, `refName1`, `refRelation1`, `refPhone1`, `refName2`, `refRelation2`, `refPhone2`, `refName3`, `refRelation3`, `refPhone3`, `photo`, `cv`, `album`, `govIssuedId`, `matchShowLimit`, `userPass`, `status`, `profileCompleteness`, `openingDate`, `lastEdit`, `userToken`, `matchId`, `matchPercentage`, `reqAccepted`, `reqRejected`, `reqSent`, `signature`, `gallery`, `tempGallery`, `lockedId`) VALUES
(61, 'Candidate 2', NULL, 'Male', 'Address 2', 'Brooklyn', 'NY', '101101.0', '000-000-0001', NULL, NULL, 'test2@gmail.com', NULL, 1991, 28, NULL, 67, 160, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, NULL, 'Other', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf', 'No', NULL, 'No Preference', 'US Citizen', NULL, 'Single', 'No', 'Bachelor', 'No', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'angular2-logo_FgiPwF5.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', 86, NULL, '2022-08-15 18:00:49.000000', '79200886', '28,27,25,26,29,', '80,70,60,60,60,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(62, 'Candidate 5', NULL, 'Male', 'Address 5', 'Princeton', 'NY', '101101.0', '000-000-0004', NULL, NULL, 'test5@gmail.com', NULL, 1992, 27, NULL, 65, 150, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', NULL, 'No Preference', 'US Citizen,H1B', NULL, 'Single', 'No', 'Bachelor', 'No Preference', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Capture2.PNG', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', 86, NULL, '2022-04-23 10:06:17.000000', '81554157', '27,28,26,29,31,25,32,', '60,60,50,50,50,40,0,', '26', NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(63, 'Candidate 6', NULL, 'Male', 'Address 6', 'Houston', 'NY', '101101.0', '000-000-0005', NULL, NULL, 'test6@gmail.com', NULL, 1987, 32, NULL, 66, 155, NULL, NULL, 'Single', 'No', NULL, NULL, 'Student Visa(OPT)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', NULL, 'No Preference', 'No Preference', NULL, 'Single', 'No', 'Masters', 'No', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', 83, NULL, '2022-04-22 17:44:57.000000', '21217199', '28,26,27,25,29,', '60,50,50,40,40,', '31', NULL, '27', NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(64, 'Candidate 7', NULL, 'Male', 'Address 7', 'Ozone Park', 'NY', '101101.0', '000-000-0006', NULL, NULL, 'test7@gmail.com', NULL, 1989, 33, NULL, 61, 180, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, 100000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, NULL, 'No', NULL, 'Bangladeshi', 'No Preference', NULL, 'Single', 'No', 'Bachelor', 'Yes', NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Deactivated', 80, NULL, '2022-04-22 17:45:14.000000', '25609040', '27,26,28,31,25,29,32,', '70,60,60,60,50,40,0,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(65, 'Candidate 8', NULL, 'Male', 'Address 8', 'Warren', 'NY', '101101.0', '000-000-0007', NULL, NULL, 'test8@gmail.com', NULL, 1982, 37, NULL, 69, 170, NULL, NULL, 'Divorced', 'Yes', NULL, NULL, 'Parmanent Resident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, 150000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Jelbab/Abaya', 'No', NULL, 'Bangladeshi', 'No Preference', NULL, 'No Preference', NULL, 'Masters', 'Yes', 100000, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', NULL, NULL, NULL, '12835553', '27,26,25,28,29,', '40,30,20,20,20,', '26', NULL, '30', NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(66, 'Candidate 9', NULL, 'Male', 'Address 9', 'Staten Islan', 'NY', '101101.0', '000-000-0008', NULL, NULL, 'test9@gmail.com', NULL, 1985, 33, NULL, 66, 150, NULL, NULL, 'Divorced', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', NULL, NULL, 150000, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya', 'No Preference', NULL, 'American', 'US Citizen,Parmanent Resident', NULL, 'No Preference', 'Yes', 'Bachelor', 'No', NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', NULL, NULL, NULL, NULL, '28,27,29,26,25,', '40,30,30,20,10,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(67, 'Candidate 10', NULL, 'Male', 'Address 10', 'Dallas', 'NY', '101101.0', '000-000-0009', NULL, NULL, 'test10@gmail.com', NULL, 1984, 34, NULL, 67, 143, NULL, NULL, 'Single', 'No', NULL, NULL, 'H1B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'Headscarf', NULL, NULL, 'Bengali', 'US Citizen,Parmanent Resident', NULL, 'Single', NULL, 'Bachelor', 'No Preference', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', NULL, NULL, NULL, NULL, '25,27,28,29,26,', '30,30,30,30,20,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(68, 'Candidate 12', NULL, 'Male', 'Address 12', 'Hardson', 'NY', '101101.0', '000-000-0011', NULL, NULL, 'test12@gmail.com', NULL, 1970, 42, NULL, 71, 170, NULL, NULL, 'Divorced', 'No', NULL, NULL, 'EAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', NULL, NULL, 50000, 'Sunni', NULL, NULL, NULL, 'No', 'Yes', 'Sunni', NULL, NULL, 'No Preference', NULL, NULL, NULL, 'No Preference', NULL, 'Divorced,Widowed', 'No', 'No Preference', 'No Preference', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(69, 'Candidate 13', NULL, 'Male', 'Address 13', 'Jersy City', 'NY', '101101.0', '000-000-0012', NULL, NULL, 'test13@gmail.com', NULL, 1986, 32, NULL, 60, 160, NULL, NULL, 'Single', 'No', NULL, NULL, 'Parmanent Resident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, 120000, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No preference', NULL, 'No Preference', 'No Preference', NULL, 'Single', 'No', 'Bachelor', 'No', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', NULL, NULL, NULL, NULL, '28,27,29,26,25,', '60,50,50,40,30,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(70, 'Candidate 14', NULL, 'Male', 'Address 14', 'Fairlawn', 'NY', '101101.0', '000-000-0013', NULL, NULL, 'test14@gmail.com', NULL, 1992, 25, NULL, 68, 155, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Doctorate', 'Yes', NULL, NULL, NULL, 'Other', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', NULL, 'No Preference', NULL, NULL, 'Single', 'No', 'Doctorate', 'No', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', NULL, NULL, NULL, NULL, '26,28,25,27,29,', '60,60,50,50,50,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(71, 'Candidate 15', NULL, 'Male', 'Address 15', 'Harloysville', 'NY', '101101.0', '000-000-0014', NULL, NULL, 'test15@gmail.com', NULL, 1972, 47, NULL, 68, 155, NULL, NULL, 'Divorced', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'No Preference', 'No', NULL, 'No Preference', 'No Preference', NULL, 'Single', 'No', 'Bachelor', 'No Preference', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', NULL, NULL, NULL, NULL, '27,28,26,29,25,', '50,50,40,40,30,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(72, 'Candidate 17', NULL, 'Male', 'Address 17', 'Gibbsboro', 'NY', '101101.0', '000-000-0016', NULL, NULL, 'test17@gmail.com', NULL, 1994, 24, NULL, 66, 150, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf', 'No', NULL, 'Bengali', 'Other', NULL, 'Single', 'No', 'Bachelor', 'Yes', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', NULL, NULL, NULL, NULL, '27,25,26,28,29,', '60,50,50,50,50,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(73, 'Candidate 19', NULL, 'Male', 'Address 19', 'Beaumont', 'NY', '101101.0', '000-000-0018', NULL, NULL, 'test19@gmail.com', NULL, 1982, 36, NULL, 67, 180, NULL, NULL, 'Single', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Other', 'Yes', NULL, NULL, NULL, 'Other', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bachelor', 'No', NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', NULL, NULL, NULL, NULL, '28,29,27,25,26,', '20,20,10,0,0,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(74, 'Candidate 20', NULL, 'Male', 'Address 20', 'Ozone Park', 'NY', '101101.0', '000-000-0019', NULL, NULL, 'test20@gmail.com', NULL, 1982, 30, NULL, 67, 170, NULL, NULL, 'Single', 'No', NULL, NULL, 'F-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, 60000, 'Sunni', NULL, NULL, NULL, 'No', 'No', 'Sunni', NULL, NULL, 'Niqab,Headscarf', 'No', NULL, 'No Preference', 'US Citizen,Parmanent Resident', NULL, 'Single', 'No', 'Bachelor', 'Yes', 10000, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(75, 'Candidate 21', NULL, 'Male', 'Address 21', 'Ozone Park', 'NY', '101101.0', '000-000-0020', NULL, NULL, 'test21@gmail.com', NULL, 1982, 29, NULL, 66, 140, NULL, NULL, 'Single', 'No', NULL, NULL, 'US Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masters', 'Yes', NULL, NULL, NULL, 'Sunni', NULL, NULL, NULL, NULL, NULL, 'Sunni', NULL, NULL, 'No Preference', 'No', NULL, 'No Preference', 'No Preference', NULL, 'Single', 'No', 'Masters', 'No Preference', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(77, 'Maruf Bari', NULL, 'Male', NULL, NULL, 'Wisconsin', NULL, '23435346543645', NULL, NULL, 'marufbuet', NULL, 1990, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No Preference,', NULL, 'Specific Ethnicity', 'Bangladeshi', 'nullParmanent Resident,Bangladesh,', NULL, 'nullDivorced,Widowed,', NULL, NULL, 'Yes', 120000, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', 40, '2022-03-18 12:12:41.000000', '2022-04-19 03:40:50.000000', '49683793', '25,26,27,28,29,', '20,20,20,10,0,', '31', NULL, '26', NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(78, 'Md Karamot Ali', NULL, 'Male', 'Mymensingh,Dhaka, Bangladessh', 'Dhaka', 'Texas', '2216', '23948792304', '123456', '7890', 'karamot.mbstu@gmail.com', NULL, 1994, 28, NULL, 70, 73, NULL, NULL, 'Single', 'No', NULL, NULL, 'Bangladesh', NULL, 'Shibrampur High School', 2009, 'MBSTU', 2016, 'ICT', 2018, 'Cyber Security', 2022, 'Media', 2020, 'Doctorate', 'Yes', 'xxxx', 'officer', 200000, 'Sunni', NULL, 'I am satisfied with my religious', 'No', 'Yes', 'No', 'Sunni', NULL, NULL, 'nullHeadscarf,Jelbab/Abaya,', 'No', 'No Preference', 'No Preference', 'nullUS Citizen,Parmanent Resident,Bangladesh,', NULL, 'nullSingle,', 'Yes', 'Masters', 'No Preference', NULL, 6, 'Azizur RAhman , Father', 'Dhaka, Bangladesh', 'dhaka', 'Kansas', 'Bangladesh', '234333', 'father@gmail.com', 'Teacher', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Active', 90, '2022-04-08 16:14:30.000000', '2022-04-21 15:04:08.000000', '30805283', '26,27,28,25,29,', '30,30,30,20,20,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(79, 'Md Rasheduzzaman', NULL, 'Male', '1033 glenmore Ave', 'Brooklyn', 'New York', '11208', '6073708910', NULL, NULL, 'rashed.cseru@gmail.com', NULL, 1988, 34, NULL, 66, 154, 'Bangladesh', NULL, 'Single', 'No', NULL, NULL, 'Student Visa', NULL, 'kushita Govt college', 2005, 'BSC in Computer science & Engineering', 2013, 'MSC in CSE  Gannon University PA, USA', 2021, NULL, NULL, NULL, NULL, NULL, 'Yes', 'software farm', 'programmer', 60000, 'Sunni', NULL, 'I am  a practicing Muslim , Ex member of BICS and Rukon of BJI', NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Headscarf,Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'No Preference,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', NULL, 15, 'Father Md Jamal uddin', 'poradaha kushtia', 'khulna', NULL, 'Bangladesh', '01723282950', NULL, 'Retired', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFVSamVFMUVWVEJOYWtFOQ==', 'Active', 73, '2022-05-18 11:30:01.000000', '2022-08-27 09:48:46.000000', '53815655', '27,28,26,29,25,', '50,50,40,40,30,', '31', NULL, '27', NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(80, 'Tarek Hasan', NULL, 'Male', NULL, NULL, 'Florida', NULL, '23424235235', NULL, NULL, 'tarekhasan', NULL, 1993, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'new_logo.png', NULL, NULL, NULL, 5, 'VFZSSmVrNUJQVDA9', 'Inactive', 20, '2022-05-19 21:30:46.000000', '2022-05-19 21:31:49.000000', '40012292', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL),
(81, 'Md Nazmul Hoque', NULL, 'Male', '446 Eldert Ln', 'Brooklyn', 'New York', '11208', 'sdfasdfasfasf', NULL, NULL, 'nazmulmoffice@gmail.com', NULL, 1990, 32, NULL, NULL, NULL, NULL, NULL, 'Single', 'No', NULL, NULL, NULL, NULL, 'testing high school', 1998, 'testing bachelors', 2004, NULL, NULL, NULL, NULL, 'sfsfsfsdfs', 2006, NULL, 'Yes', 'testing', 'manager', 202222222, NULL, NULL, NULL, NULL, 'Yes', 'No', 'Sunni', NULL, NULL, 'Jelbab/Abaya,Niqab,', 'No', 'No Preference', 'No Preference', 'Parmanent Resident,', NULL, 'Single,', 'No', 'Doctorate', 'Yes', 100000, 5, 'testing', 'testing address', 'chity', 'Washington', 'United States', '6469067855', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 10, 'VmtkV2VtUkhiSFZhTUVGNVRVUkplUT09', 'Locked', 80, '2022-05-21 10:26:55.000000', '2022-07-23 11:25:41.000000', '26086711', '26,25,27,31,28,29,32,', '60,50,50,50,40,20,0,', NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, 32),
(82, 'Ramim', 'Ramim', 'Male', 'Dhaka', 'Dhaka', 'New Jersey', NULL, '01776344872', NULL, NULL, 'ramimbuet12@gmail.com', NULL, 1993, 29, NULL, 72, 120, 'Bangladesh', 'NA', 'Single', 'No', NULL, NULL, 'Bangladesh', NULL, 'Zilla', 2010, 'DU', 2017, 'NU', 2021, NULL, NULL, NULL, NULL, 'Masters', 'Yes', 'Own', 'Department Head', 15000, 'Sunni', NULL, 'Attend mosque regularly, Do compulsory fasting, attend halaqa', NULL, 'Yes', 'No', 'Sunni', NULL, 'Attend mosque regularly, Do compulsory fasting, attend halaqa.', 'Niqab,', 'No', 'Own Ethnicity', 'Bangladeshi', 'US Citizen,', NULL, 'Single,', 'No', 'Bachelor', 'No Preference', NULL, 5, 'Abdus Samad', 'Naoga', 'Naoga', 'New York', 'USA', NULL, NULL, 'Teacher', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IMG_6294.jpg', 'Md.-Ashraful-Haque_Resume.pdf', NULL, NULL, 5, 'VFdwUk1FMTZVVDA9', 'Pending', 93, '2022-08-03 10:59:14.000000', '2022-08-03 11:34:51.000000', '25663174', '27,28,26,31,25,29,32,', '50,50,40,40,30,30,0,', NULL, NULL, NULL, '20191026_173548.jpg', NULL, NULL, NULL),
(83, 'Bin', NULL, 'Male', NULL, NULL, 'Delaware', NULL, '01776344872', NULL, NULL, 'faxof58441@agrolivana.com', NULL, 1997, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VFdwUk1FMTZVVDA9', 'Inactive', NULL, '2022-08-10 18:06:24.000000', '2022-08-10 18:06:24.000000', '81059880', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'md afil hossain', NULL, 'Male', NULL, NULL, 'Florida', NULL, '01723282950', NULL, NULL, 'sourcerweb@gmail.com', NULL, 1990, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anonymous.png', NULL, NULL, NULL, 5, 'VG5wbk5VNUVWVEk9', 'Inactive', 12, '2022-09-01 05:48:00.000000', '2022-09-01 06:50:31.000000', '76481807', NULL, NULL, NULL, NULL, NULL, NULL, 'gallery1.jpg,gallery2.jpg,gallery3.jpg,gallery4.jpg', NULL, NULL);

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
(1, 'BIL MARUF BIN BARIK', 3, 'marufbuet09@gmail.com', 'This is test Message', '2022-07-23 11:34:55.000000', 'Test message reply', '2022-07-29 18:04:35.000000'),
(6, 'Fatema Johra', 2, 'fatemajohra@munamail.com', 'Assalamu Alaikum. This is a great initiative for North American musling youngs. I appreciate this website.', '2022-07-29 18:13:50.000000', NULL, NULL),
(7, 'Ramim', 1, 'ramimbuet12@gmail.com', 'Hello', '2022-08-10 18:07:20.000000', 'Assalamualaikum.', '2022-08-10 18:10:34.000000'),
(8, 'BIL MARUF BIN BARIK', 3, 'marufbuet09@gmail.com', 'Hi', '2022-08-10 18:28:45.000000', 'Hello reply', '2022-08-10 18:29:05.000000'),
(9, 'Ramim', 3, 'ramimbuet12@gmail.com', 'Test message', '2022-08-10 18:30:53.000000', 'Test reply. Did you get it?', '2022-08-10 18:31:28.000000'),
(10, 'Ramim', 3, 'ramimbuet12@gmail.com', 'Test message 2', '2022-08-10 18:36:31.000000', 'Assaslamualaikum', '2022-08-10 19:44:14.000000'),
(11, 'Ramim', 1, 'ramimbuet12@gmail.com', 'Assaslamualaikum', '2022-08-10 19:45:46.000000', 'Walaikumassalam', '2022-08-10 19:46:25.000000'),
(12, 'Bin', 1, 'faxof58441@agrolivana.com', 'Hello', '2022-08-10 19:50:25.000000', 'Hey, This is test e-mail', '2022-08-10 19:51:20.000000'),
(13, 'Bin', 1, 'faxof58441@agrolivana.com', 'Hello', '2022-08-10 20:08:42.000000', 'Test', '2022-08-10 20:08:59.000000'),
(14, 'Ramim', 1, 'ramimbuet12@gmail.com', 'Hello', '2022-08-10 20:10:28.000000', 'Test, Hello', '2022-08-10 20:10:58.000000'),
(15, 'Ramim', 1, 'ramimbuet12@gmail.com', 'Hello', '2022-08-10 22:47:24.000000', 'Test', '2022-08-10 22:47:48.000000'),
(16, 'Ramim', 1, 'ramimbuet12@gmail.com', 'Hello', '2022-08-10 22:49:43.000000', 'Test', '2022-08-10 22:50:10.000000'),
(17, 'MUNA', 3, 'test@gamil.com', 'Testing purpose', '2022-08-13 08:47:17.000000', NULL, NULL),
(18, 'MUNA', 3, 'test@gamil.com', 'Testing purpose', '2022-08-13 08:55:21.000000', NULL, NULL),
(19, 'testing', 3, 'testing@gmail.com', 'testing messages muna office', '2022-08-13 11:24:18.000000', NULL, NULL),
(20, 'testing', 3, 'testing@gmail.com', 'hello testing', '2022-08-20 09:36:11.000000', NULL, NULL),
(21, 'testing', 3, 'testing@gmail.com', 'hello testing', '2022-08-20 09:36:20.000000', NULL, NULL),
(22, 'Fatema Johra', 2, 'fatemajohra@munamail.com', 'hi', '2022-08-21 17:18:02.000000', NULL, NULL),
(23, 'today test', 3, 'todaytest@gmail.com', 'this is for testing purposes', '2022-08-27 10:49:53.000000', NULL, NULL),
(24, 'testing', 3, 'test@gmail.com', 'testing purpose', '2022-08-27 11:17:22.000000', NULL, NULL),
(25, '654jkkkj', 3, 'sdufhhfs@jhjh.com', 'sdgsgsergsggsdg', '2022-08-30 04:52:59.000000', NULL, NULL),
(26, '5555', 3, 'hdf@dhh.com', 'g', '2022-08-30 04:55:19.000000', NULL, NULL),
(27, 'hfhgfhjhg', 3, 'fghv@ggjjg.com', 'sef', '2022-08-30 06:36:27.000000', NULL, NULL);

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
(14, '1002', 'Home', 'Slider', 'Nice Night', 'uriel-soberanes_2gXCAZ0.jpg', 'Active', 'Nice night', NULL, NULL, NULL, NULL),
(17, '3001', 'Services', 'Service', '{\"details\":\"Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\", \"icon\":\"calendar\"}', NULL, 'Active', 'PREMARRIAGE SEMINAR', 'calendar', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL, NULL),
(18, '3002', 'Services', 'Service', '{\n\"details\": \"Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\", \n\n\"icon\": \"university\"\n}', NULL, 'Active', 'ARRANGING MARRIAGE', 'university', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL, NULL),
(19, '3003', 'Services', 'Service', '{\n\"details\":    \"Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\", \n\n\"icon\":    \"shopping-bag\"\n}', NULL, 'Active', 'CONDUCTING MARRIAGE', 'shopping-bag', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL, NULL),
(20, '3004', 'Services', 'Service', '{\n\"details\": \"Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\", \n\n\"icon\": \"book\"\n}', NULL, 'Active', 'MARRIAGE REGISTRATION', 'book', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\n\nFind your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL, NULL),
(21, '3005', 'Services', 'Service', '{\n\"details\": \"Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\", \n\n\"icon\": \"child\"\n}', NULL, 'Active', 'POST MARRIAGE COUNSELLING', 'child', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\n\nFind your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\n\nFind your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL, NULL),
(22, '1000', 'Home', 'Slider', NULL, '1_vr8qUaH.jpg', 'Inactive', 'Interior Beauty', NULL, NULL, NULL, NULL),
(23, '0000', 'Home', 'Banner', NULL, NULL, 'Active', 'MUNA MATRIMONIAL', 'Let\'s Walk Together', NULL, NULL, NULL),
(24, '1001', 'Home', 'Slider', NULL, 'Picture1_Edb0yn6.jpg', 'Active', 'Beautiful Nature', NULL, NULL, NULL, NULL),
(26, '4000', 'Events', 'Heading', NULL, NULL, 'Active', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL, NULL, NULL, NULL),
(27, '4004', 'Events', 'Event', NULL, '11-8-Marriage-seminar.jpg', 'Active', 'Seminar on Marriage in Islam', 'May 22, 2022 at 3.00 PM CST', 'New York Auditorium', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\n\nFind your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\n\nFind your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL),
(28, '4003', 'Events', 'Event', NULL, 'marriage-education.jpg', 'Active', 'Education Program', '25th May, 2022 at 10 AM CST', 'Florida State University Playground', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\n\nFind your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\n\nFind your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\n\nFind your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL),
(29, '4002', 'Events', 'Event', NULL, '2.jpg', 'Inactive', 'Post Marriage Reception', 'Contact us Fixing Suitable Time', 'Help to Seek Appropriate Venue', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\n\nFind your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL),
(30, '4001', 'Events', 'Event', NULL, 'YSM-Attantance-in-Convention.png', 'Active', 'Islamic Cultural Program', '3rd June, 2022 at 7.00 PM CST', 'Wisconsin Central Auditorium', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\n\nFind your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.\n\nFind your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling. Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL),
(31, '5000', 'About Us', 'Heading', NULL, 'about-img_2Rkh8RX.jpg', 'Active', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL, NULL, NULL, NULL),
(33, '6001', 'About Us', 'Team', NULL, NULL, 'Active', 'Harun O Rashid', 'National President', 'https://twitter.com\nhttps://facebook.com\nhttps://google.com\nhttps://linkedin.com', NULL, NULL),
(34, '6002', 'About Us', 'Team', NULL, NULL, 'Active', 'Abul Bashar Faizullah', 'Vice President', 'https://twitter.com\nhttps://facebook.com\nhttps://google.com\nhttps://linkedin.com', NULL, NULL),
(35, '6003', 'About Us', 'Team', NULL, NULL, 'Inactive', 'Arman Chowdhury', 'Executive Director', 'https://twitter.com\nhttps://facebook.com\nhttps://google.com\nhttps://linkedin.com', NULL, NULL),
(36, '6004', 'About Us', 'Team', NULL, NULL, 'Active', 'Dr. Riajul Islam', 'Director of Family Development', 'https://twitter.com\nhttps://facebook.com\nhttps://google.com\nhttps://linkedin.com', NULL, NULL),
(37, '7000', 'FAQ', 'Heading', NULL, 'faqs-image.jpg', 'Active', 'Know about MUNA. You may have some common questions that are answered here.', NULL, NULL, NULL, NULL),
(38, '7001', 'FAQ', 'FAQ', NULL, NULL, 'Active', 'Why do I choose MUNA Matrimonial?', 'This is the only matrimonial platform for North American Bengali Muslims. To choose perfect life partner, you may use MUNA Matrimonial.', NULL, NULL, NULL),
(39, '7002', 'FAQ', 'FAQ', NULL, NULL, 'Active', 'How to register?', 'Go to Login, or Let\'s Begin button on Home page. You will be guided our registration process.', NULL, NULL, NULL),
(40, '7003', 'FAQ', 'FAQ', NULL, NULL, 'Inactive', 'Is registration completely free?', 'Yes. Registration is completely free. But you may donate us if you like our service.', NULL, NULL, NULL),
(41, '7004', 'FAQ', 'FAQ', NULL, NULL, 'Active', 'How may I get supported through this website?', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL, NULL, NULL),
(42, '7005', 'FAQ', 'FAQ', NULL, NULL, 'Active', 'Could you help me to arrange my Post Wedding Reception?', 'Yes. We have the facility to arrange Post Wedding Reception. We have expert and experienced team to handle this type of valuable occasion.', NULL, NULL, NULL),
(43, '9000', 'Contact Us', 'Heading', NULL, NULL, 'Active', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL, NULL, NULL, NULL),
(44, '9001', 'Contact Us', 'Contact', NULL, NULL, 'Active', 'MN-12 Lincon Street, NewYork 12356, USA', '+1 2345 67890 12', 'admin@munamatrimonial.com', 'https://facebook.com/munamatrimonial\nhttps://twitter.com/munamatrimonial', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d387191.33750346623!2d-73.979681!3d40.6974881!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY%2C+USA!5e0!3m2!1sen!2sin!4v1541477355474'),
(45, '4005', 'Events', 'Event', NULL, '472627-peaceful-desktop-wallpaper-1920x1080-mobile.jpg', 'Inactive', 'Test Event', '04/12/2022', 'Hello World', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tellus ut enim scelerisque, at gravida lectus auctor. Quisque mattis feugiat dolor, eu vehicula arcu facilisis sed. Maecenas pellentesque diam sit amet eros rhoncus suscipit. Fusce cursus blandit massa, at interdum metus. Aliquam bibendum tortor quis ligula iaculis, ut venenatis libero tincidunt. Vestibulum convallis finibus maximus. Donec fermentum dolor eget metus interdum, a vehicula ipsum semper. Integer blandit, est auctor ornare ultricies, urna libero mattis felis, ac tincidunt orci nibh nec dui.', NULL),
(46, '4005', 'Events', 'Event', NULL, NULL, 'Inactive', 'Test Event 1', 'sfafasdfa', NULL, NULL, NULL),
(58, '5001', 'About Us', 'About', NULL, 'about-img_RzryDe8.jpg', 'Active', '350', 'Our mission is to arrange perfect marriage among muslim youngs.', 'Let\'s Walk Together', 'Our Programs:', 'Arranging muslim marriage\nPremarriage Counselling\nSeminar on Islamic marriage\nIslami Cultural Programs'),
(59, '3000', 'Services', 'Heading', NULL, NULL, 'Active', 'Find your soulmate here. We arrange premarriage seminar/counseling, mediate marriage, Conduct marriages, Marriage Registration, Post marriage Counselling.', NULL, NULL, NULL, NULL),
(60, '9100', 'Signup', 'Privacy Policy', NULL, NULL, 'Active', 'I, hereby certify that the information given in this form is true, correct, and complete in all respects. If there is any incorrect information in this form, I may be removed from the process.\n\n        • I will promptly inform MUNA Matrimonial Team of any changes in the information provided above.\n        • I authorize MUNA Matrimonial Team to utilize the information provided by me according to the needs of the service.\n        • I pledge to keep all the information provided by the MUNA Matrimonial Team confidential.\n        • If I get married at any time, I will inform the MUNA Matrimonial Team.\n        • As the MUNA Matrimonial Team is only introducing 2 parties to each other, in the event of a failure to arrange a marriage, I shall not hold MUNA Matrimonial Team or MUNA responsible. I agree to abide by decisions and rulings given by MUNA National President or his designated representatives in matters of disputes and will abide by decisions of MUNA, its National President, and/or their representatives.\n\n      By submitting this form, I agree to a complete and thorough criminal and background check by MUNA Matrimonial Team.\n      By signing this contract, I approve to a background check.', NULL, NULL, NULL, NULL);

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
(28, 'kajjdj', 'VFVSamVFMUVWVEJOYWtFOQ==', 'jaman.cseru@gmail.com', 'Male', 'New York', '6073708910', '330171', '2022-08-30 08:17:31.000000', 1988);

--
-- Indexes for dumped tables
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `UserApp_adminuser`
--
ALTER TABLE `UserApp_adminuser`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `UserApp_femaleuser`
--
ALTER TABLE `UserApp_femaleuser`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `UserApp_maleuser`
--
ALTER TABLE `UserApp_maleuser`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `UserApp_matchingtable`
--
ALTER TABLE `UserApp_matchingtable`
  MODIFY `matchingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `UserApp_message`
--
ALTER TABLE `UserApp_message`
  MODIFY `messageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `UserApp_post`
--
ALTER TABLE `UserApp_post`
  MODIFY `postId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `UserApp_tempuser`
--
ALTER TABLE `UserApp_tempuser`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
