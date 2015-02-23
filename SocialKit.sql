-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2014 at 06:11 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `socialkit`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `about` text COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `avatar_id` int(255) NOT NULL DEFAULT '0',
  `cover_id` int(255) NOT NULL DEFAULT '0',
  `cover_position` int(255) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verification_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified` int(1) NOT NULL DEFAULT '0',
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_logged` int(255) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(255) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timezone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `verified` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE IF NOT EXISTS `announcements` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `time` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_views`
--

CREATE TABLE IF NOT EXISTS `announcement_views` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `account_id` int(255) DEFAULT '0',
  `announcement_id` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE IF NOT EXISTS `blocks` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `active` int(1) NOT NULL DEFAULT '0',
  `blocked_id` int(255) NOT NULL,
  `blocker_id` int(255) NOT NULL,
  `time` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE IF NOT EXISTS `followers` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `active` int(1) NOT NULL DEFAULT '0',
  `is_chatting` int(1) NOT NULL DEFAULT '0',
  `follower_id` int(255) NOT NULL,
  `following_id` int(255) NOT NULL,
  `time` int(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(255) NOT NULL,
  `add_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'members',
  `group_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `timeline_post_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'members',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_admins`
--

CREATE TABLE IF NOT EXISTS `group_admins` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `active` int(1) NOT NULL,
  `admin_id` int(255) NOT NULL,
  `group_id` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hashtags`
--

CREATE TABLE IF NOT EXISTS `hashtags` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_trend_time` int(255) NOT NULL,
  `trend_use_num` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `active` int(1) NOT NULL DEFAULT '0',
  `album_id` int(255) NOT NULL DEFAULT '0',
  `descr` text COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(255) NOT NULL,
  `temp` int(1) NOT NULL DEFAULT '1',
  `timeline_id` int(255) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `active` int(1) NOT NULL,
  `notifier_id` int(255) NOT NULL,
  `post_id` int(255) NOT NULL,
  `seen` int(255) NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `time` int(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timeline_id` int(255) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(255) NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `awards` text COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(255) NOT NULL,
  `message_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'everyone',
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `products` text COLLATE utf8_unicode_ci NOT NULL,
  `timeline_post_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'everyone',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_admins`
--

CREATE TABLE IF NOT EXISTS `page_admins` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `active` int(1) NOT NULL,
  `admin_id` int(255) NOT NULL,
  `page_id` int(255) NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `page_categories`
--

CREATE TABLE IF NOT EXISTS `page_categories` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `active` int(1) NOT NULL,
  `category_id` int(255) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=170 ;

--
-- Dumping data for table `page_categories`
--

INSERT INTO `page_categories` (`id`, `active`, `category_id`, `name`) VALUES
(1, 1, 0, 'Local Business or Place'),
(2, 1, 1, 'Airport'),
(3, 1, 1, 'Arts/Entertainment/Nightlife'),
(4, 1, 1, 'Attractions/Things to Do'),
(5, 1, 1, 'Automotive'),
(6, 1, 1, 'Bank/Financial Services'),
(7, 1, 1, 'Bar'),
(8, 1, 1, 'Book Store'),
(9, 1, 1, 'Business Services'),
(10, 1, 1, 'Church/Religious Organization'),
(11, 1, 1, 'Club'),
(12, 1, 1, 'Community/Government'),
(13, 1, 1, 'Concert Venue'),
(14, 1, 1, 'Doctor'),
(15, 1, 1, 'Education'),
(16, 1, 1, 'Event Planning/Event Services'),
(17, 1, 1, 'Food/Grocery'),
(18, 1, 1, 'Health/Medical/Pharmacy'),
(19, 1, 1, 'Home Improvement'),
(20, 1, 1, 'Hospital/Clinic'),
(21, 1, 1, 'Hotel'),
(22, 1, 1, 'Landmark'),
(23, 1, 1, 'Lawyer'),
(24, 1, 1, 'Library'),
(25, 1, 1, 'Local Business'),
(26, 1, 1, 'Middle School'),
(27, 1, 1, 'Movie Theater'),
(28, 1, 1, 'Museum/Art Gallery'),
(29, 1, 1, 'Outdoor Gear/Sporting Goods'),
(30, 1, 1, 'Pet Services'),
(31, 1, 1, 'Professional Services'),
(32, 1, 1, 'Public Places'),
(33, 1, 1, 'Real Estate'),
(34, 1, 1, 'Restaurant/Cafe'),
(35, 1, 1, 'School'),
(36, 1, 1, 'Shopping/Retail'),
(37, 1, 1, 'Spas/Beauty/Personal Care'),
(38, 1, 1, 'Sports Venue'),
(39, 1, 1, 'Sports/Recreation/Activities'),
(40, 1, 1, 'Tours/Sightseeing'),
(41, 1, 1, 'Transportation'),
(42, 1, 1, 'University'),
(43, 1, 0, 'Company, Organization or Institution'),
(44, 1, 43, 'Aerospace/Defense'),
(45, 1, 43, 'Automobiles and Parts'),
(46, 1, 43, 'Bank/Financial Institution'),
(47, 1, 43, 'Biotechnology'),
(48, 1, 43, 'Cause'),
(49, 1, 43, 'Chemicals'),
(50, 1, 43, 'Church/Religious Organization'),
(51, 1, 43, 'Community Organization'),
(52, 1, 43, 'Company'),
(53, 1, 43, 'Computers/Technology'),
(54, 1, 43, 'Consulting/Business Services'),
(55, 1, 43, 'Education'),
(56, 1, 43, 'Energy/Utility'),
(57, 1, 43, 'Engineering/Construction'),
(58, 1, 43, 'Farming/Agriculture'),
(59, 1, 43, 'Food/Beverages'),
(60, 1, 43, 'Government Organization'),
(61, 1, 43, 'Health/Beauty'),
(62, 1, 43, 'Health/Medical/Pharmaceuticals'),
(63, 1, 43, 'Industrials'),
(64, 1, 43, 'Insurance Company'),
(65, 1, 43, 'Internet/Software'),
(66, 1, 43, 'Legal/Law'),
(67, 1, 43, 'Media/News/Publishing'),
(68, 1, 43, 'Middle School'),
(69, 1, 43, 'Mining/Materials'),
(70, 1, 43, 'Non-Governmental Organization (NGO)'),
(71, 1, 43, 'Non-Profit Organization'),
(72, 1, 43, 'Organization'),
(73, 1, 43, 'Political Organization'),
(74, 1, 43, 'Political Party'),
(75, 1, 43, 'Retail and Consumer Merchandise'),
(76, 1, 43, 'School'),
(77, 1, 43, 'Small Business'),
(78, 1, 43, 'Telecommunication'),
(79, 1, 43, 'Transport/Freight'),
(80, 1, 43, 'Travel/Leisure'),
(81, 1, 43, 'University'),
(82, 1, 0, 'Brand or Product'),
(83, 1, 82, 'Appliances'),
(84, 1, 82, 'Baby Goods/Kids Goods'),
(85, 1, 82, 'Bags/Luggage'),
(86, 1, 82, 'Board Game'),
(87, 1, 82, 'Building Materials'),
(88, 1, 82, 'Camera/Photo'),
(89, 1, 82, 'Cars'),
(90, 1, 82, 'Clothing'),
(91, 1, 82, 'Commercial Equipment'),
(92, 1, 82, 'Computers'),
(93, 1, 82, 'Drugs'),
(94, 1, 82, 'Electronics'),
(95, 1, 82, 'Food/Beverages'),
(96, 1, 82, 'Furniture'),
(97, 1, 82, 'Games/Toys'),
(98, 1, 82, 'Health/Beauty'),
(99, 1, 82, 'Home Decor'),
(100, 1, 82, 'Household Supplies'),
(101, 1, 82, 'Jewelry/Watches'),
(102, 1, 82, 'Kitchen/Cooking'),
(103, 1, 82, 'Office Supplies'),
(104, 1, 82, 'Outdoor Gear/Sporting Goods'),
(105, 1, 82, 'Patio/Garden'),
(106, 1, 82, 'Pet Supplies'),
(107, 1, 82, 'Phone/Tablet'),
(108, 1, 82, 'Product/Service'),
(109, 1, 82, 'Software'),
(110, 1, 82, 'Tools/Equipment'),
(111, 1, 82, 'Video Game'),
(112, 1, 82, 'Vitamins/Supplements'),
(113, 1, 82, 'Website'),
(114, 1, 82, 'Wine/Spirits'),
(115, 1, 0, 'Artist, Band or Public Figure'),
(116, 1, 115, 'Actor/Director'),
(117, 1, 115, 'Artist'),
(118, 1, 115, 'Athlete'),
(119, 1, 115, 'Author'),
(120, 1, 115, 'Business Person'),
(121, 1, 115, 'Chef'),
(122, 1, 115, 'Coach'),
(123, 1, 115, 'Comedian'),
(124, 1, 115, 'Dancer'),
(125, 1, 115, 'Designer'),
(126, 1, 115, 'Entertainer'),
(127, 1, 115, 'Entrepreneur'),
(128, 1, 115, 'Fictional Character'),
(129, 1, 115, 'Government Official'),
(130, 1, 115, 'Journalist'),
(131, 1, 115, 'Movie Character'),
(132, 1, 115, 'Musician/Band'),
(133, 1, 115, 'News Personality'),
(134, 1, 115, 'Pet'),
(135, 1, 115, 'Photographer'),
(136, 1, 115, 'Politician'),
(137, 1, 115, 'Producer'),
(138, 1, 115, 'Public Figure'),
(139, 1, 115, 'Teacher'),
(140, 1, 115, 'Writer'),
(141, 1, 0, 'Entertainment'),
(142, 1, 141, 'Album'),
(143, 1, 141, 'Amateur Sports Team'),
(144, 1, 141, 'Book'),
(145, 1, 141, 'Book Series'),
(146, 1, 141, 'Book Store'),
(147, 1, 141, 'Concert Tour'),
(148, 1, 141, 'Concert Venue'),
(149, 1, 141, 'Fictional Character'),
(150, 1, 141, 'Library'),
(151, 1, 141, 'Magazine'),
(152, 1, 141, 'Movie'),
(153, 1, 141, 'Movie Character'),
(154, 1, 141, 'Movie Theater'),
(155, 1, 141, 'Music Award'),
(156, 1, 141, 'Music Chart'),
(157, 1, 141, 'Music Video'),
(158, 1, 141, 'Professional Sports Team'),
(159, 1, 141, 'Radio Station'),
(160, 1, 141, 'Record Label'),
(161, 1, 141, 'School Sports Team'),
(162, 1, 141, 'Song'),
(163, 1, 141, 'Sports League'),
(164, 1, 141, 'Sports Venue'),
(165, 1, 141, 'Studio'),
(166, 1, 141, 'TV Channel'),
(167, 1, 141, 'TV Network'),
(168, 1, 141, 'TV Show'),
(169, 1, 141, 'TV/Movie Award');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `active` int(1) NOT NULL DEFAULT '0',
  `activity_text` text COLLATE utf8_unicode_ci NOT NULL,
  `google_map_name` text COLLATE utf8_unicode_ci NOT NULL,
  `hidden` int(1) NOT NULL DEFAULT '0',
  `link_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `media_id` int(255) NOT NULL DEFAULT '0',
  `post_id` int(255) NOT NULL DEFAULT '0',
  `recipient_id` int(255) NOT NULL DEFAULT '0',
  `soundcloud_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `soundcloud_uri` text COLLATE utf8_unicode_ci NOT NULL,
  `seen` int(255) NOT NULL DEFAULT '0',
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `PreviewData` text COLLATE utf8_unicode_ci NOT NULL,
  `time` int(255) NOT NULL,
  `timeline_id` int(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `type2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `youtube_video_id` text COLLATE utf8_unicode_ci NOT NULL,
  `youtube_title` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `active` int(1) NOT NULL,
  `post_id` int(255) NOT NULL,
  `reporter_id` int(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(255) NOT NULL,
  `birthday` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1-1-1990',
  `comment_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'everyone',
  `confirm_followers` int(11) NOT NULL DEFAULT '0',
  `current_city` text COLLATE utf8_unicode_ci NOT NULL,
  `follow_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'everyone',
  `gender` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `hometown` text COLLATE utf8_unicode_ci NOT NULL,
  `message_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'everyone',
  `post_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'everyone',
  `timeline_post_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'everyone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
