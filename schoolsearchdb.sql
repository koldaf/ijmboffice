-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 12, 2024 at 05:25 PM
-- Server version: 8.0.31
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schoolsearchdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `application_dummy`
--

DROP TABLE IF EXISTS `application_dummy`;
CREATE TABLE IF NOT EXISTS `application_dummy` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(250) NOT NULL,
  `othernames` varchar(250) NOT NULL,
  `regno` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `centre` varchar(250) NOT NULL DEFAULT 'nill',
  `exam_type` varchar(200) NOT NULL,
  `datetime` datetime NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `payment_status` enum('not validated','validated') NOT NULL DEFAULT 'not validated',
  `acceptance` enum('True','False') NOT NULL DEFAULT 'False',
  `session` varchar(20) NOT NULL,
  `application_status` enum('Incomplete','Complete') NOT NULL DEFAULT 'Incomplete',
  `registration_status` enum('Incomplete','Complete','Partial') NOT NULL DEFAULT 'Incomplete',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_biodata`
--

DROP TABLE IF EXISTS `app_biodata`;
CREATE TABLE IF NOT EXISTS `app_biodata` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `regno` varchar(20) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `othernames` varchar(100) NOT NULL,
  `app_session` varchar(6) NOT NULL,
  `dob` date NOT NULL,
  `sex` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `country` varchar(5) NOT NULL,
  `state` varchar(5) NOT NULL,
  `lga` varchar(5) DEFAULT NULL,
  `entry_date` date NOT NULL,
  `entry_time` time NOT NULL,
  `entry_by` varchar(20) NOT NULL,
  UNIQUE KEY `Reference Id` (`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_exam`
--

DROP TABLE IF EXISTS `app_exam`;
CREATE TABLE IF NOT EXISTS `app_exam` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `regno` varchar(20) NOT NULL,
  `exam_type` varchar(50) NOT NULL,
  `center` varchar(100) NOT NULL,
  `course` varchar(200) NOT NULL,
  `resume_date` date DEFAULT NULL,
  `entry_date` date NOT NULL,
  `entry_time` time NOT NULL,
  `entry_by` varchar(20) NOT NULL,
  UNIQUE KEY `Reference Id` (`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_olevel`
--

DROP TABLE IF EXISTS `app_olevel`;
CREATE TABLE IF NOT EXISTS `app_olevel` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `regno` varchar(20) NOT NULL,
  `exam_type` varchar(50) NOT NULL,
  `exam_no` varchar(50) NOT NULL,
  `exam_year` varchar(5) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `grade` varchar(8) NOT NULL,
  `no_of_sitting` int NOT NULL,
  `entry_date` date NOT NULL,
  `entry_time` time NOT NULL,
  UNIQUE KEY `Reference Id` (`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_pandg`
--

DROP TABLE IF EXISTS `app_pandg`;
CREATE TABLE IF NOT EXISTS `app_pandg` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `regno` varchar(20) NOT NULL,
  `p_name` varchar(250) NOT NULL,
  `p_occupation` varchar(50) NOT NULL,
  `p_address` varchar(250) NOT NULL,
  `p_phone` varchar(20) NOT NULL,
  `entry_date` date NOT NULL,
  `entry_time` time NOT NULL,
  UNIQUE KEY `Reference ID` (`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  UNIQUE KEY `id` (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`ref_id`, `country`) VALUES
(1, 'Afghanistan'),
(2, 'Albania '),
(3, 'Algeria '),
(4, 'American Samoa '),
(5, 'Andorra '),
(6, 'Angola '),
(7, 'Anguilla '),
(8, 'Antarctica '),
(9, 'Antigua and Barbuda '),
(10, 'Argentina '),
(11, 'Armenia '),
(12, 'Aruba '),
(13, 'Australia '),
(14, 'Austria '),
(15, 'Azerbaijan '),
(16, 'Bahamas '),
(17, 'Bahrain '),
(18, 'Bangladesh '),
(19, 'Barbados '),
(20, 'Belarus '),
(21, 'Belgium '),
(22, 'Belize '),
(23, 'Benin '),
(24, 'Bermuda '),
(25, 'Bhutan '),
(26, 'Bolivia '),
(27, 'Bosnia and Herzegovina '),
(28, 'Botswana '),
(29, 'Brazil '),
(30, 'Brunei Darussalam '),
(31, 'Bulgaria '),
(32, 'Burkina Faso '),
(33, 'Burundi '),
(34, 'Cambodia '),
(35, 'Cameroon '),
(36, 'Canada '),
(37, 'Cape Verde '),
(38, 'Cayman Islands '),
(39, 'Central African Republic '),
(40, 'Chad '),
(41, 'Chile '),
(42, 'China '),
(43, 'Christmas Island '),
(44, 'Cocos (Keeling) Islands '),
(45, 'Colombia '),
(46, 'Comoros '),
(47, 'Democratic Republic of the Congo (Kinshasa) '),
(48, 'Congo, Republic of (Brazzaville) '),
(49, 'Cook Islands '),
(50, 'Costa Rica '),
(51, 'Ivory Coast '),
(52, 'Croatia '),
(53, 'Cuba '),
(54, 'Cyprus '),
(55, 'Czech Republic '),
(56, 'Denmark '),
(57, 'Djibouti '),
(58, 'Dominica '),
(59, 'Dominican Republic '),
(60, 'East Timor (Timor-Leste) '),
(61, 'Ecuador '),
(62, 'Egypt '),
(63, 'El Salvador '),
(64, 'Equatorial Guinea '),
(65, 'Eritrea '),
(66, 'Estonia '),
(67, 'Ethiopia '),
(68, 'Falkland Islands '),
(69, 'Faroe Islands '),
(70, 'Fiji '),
(71, 'Finland '),
(72, 'France '),
(73, 'French Guiana '),
(74, 'French Polynesia '),
(75, 'French Southern Territories '),
(76, 'Gabon '),
(77, 'Gambia '),
(78, 'Georgia '),
(79, 'Germany '),
(80, 'Ghana '),
(81, 'Gibraltar '),
(82, 'Great Britain '),
(83, 'Greece '),
(84, 'Greenland '),
(85, 'Grenada '),
(86, 'Guadeloupe '),
(87, 'Guam '),
(88, 'Guatemala '),
(89, 'Guinea '),
(90, 'Guinea-Bissau '),
(91, 'Guyana '),
(92, 'Haiti '),
(93, 'Holy See '),
(94, 'Honduras '),
(95, 'Hong Kong '),
(96, 'Hungary '),
(97, 'Iceland '),
(98, 'India '),
(99, 'Indonesia '),
(100, 'Iran (Islamic Republic of) '),
(101, 'Iraq '),
(102, 'Ireland '),
(103, 'Israel '),
(104, 'Italy '),
(105, 'Jamaica '),
(106, 'Japan '),
(107, 'Jordan '),
(108, 'Kazakhstan '),
(109, 'Kenya '),
(110, 'Kiribati '),
(111, 'Korea, Democratic People\'s Rep. (North Korea) '),
(112, 'Korea, Republic of (South Korea) '),
(113, 'Kosovo '),
(114, 'Kuwait '),
(115, 'Kyrgyzstan '),
(116, 'Lao, People\'s Democratic Republic '),
(117, 'Latvia '),
(118, 'Lebanon '),
(119, 'Lesotho '),
(120, 'Liberia '),
(121, 'Libya '),
(122, 'Liechtenstein '),
(123, 'Lithuania '),
(124, 'Luxembourg '),
(125, 'Macau '),
(126, 'Macedonia, Rep. of '),
(127, 'Madagascar '),
(128, 'Malawi '),
(129, 'Malaysia '),
(130, 'Maldives '),
(131, 'Mali '),
(132, 'Malta '),
(133, 'Marshall Islands '),
(134, 'Martinique '),
(135, 'Mauritania '),
(136, 'Mauritius '),
(137, 'Mayotte '),
(138, 'Mexico '),
(139, 'Micronesia, Federal States of '),
(140, 'Moldova, Republic of '),
(141, 'Monaco '),
(142, 'Mongolia '),
(143, 'Montenegro '),
(144, 'Montserrat '),
(145, 'Morocco '),
(146, 'Mozambique '),
(147, 'Myanmar, Burma '),
(148, 'Namibia '),
(149, 'Nauru '),
(150, 'Nepal '),
(151, 'Netherlands '),
(152, 'Netherlands Antilles '),
(153, 'New Caledonia '),
(154, 'New Zealand '),
(155, 'Nicaragua '),
(156, 'Niger '),
(157, 'Nigeria '),
(158, 'Niue '),
(159, 'Northern Mariana Islands '),
(160, 'Norway '),
(161, 'Oman '),
(162, 'Pakistan '),
(163, 'Palau '),
(164, 'Palestinian territories '),
(165, 'Panama '),
(166, 'Papua New Guinea '),
(167, 'Paraguay '),
(168, 'Peru '),
(169, 'Philippines '),
(170, 'Pitcairn Island '),
(171, 'Poland '),
(172, 'Portugal '),
(173, 'Puerto Rico '),
(174, 'Qatar '),
(175, 'Reunion Island '),
(176, 'Romania '),
(177, 'Russian Federation '),
(178, 'Rwanda '),
(179, 'Saint Kitts and Nevis '),
(180, 'Saint Lucia '),
(181, 'Saint Vincent and the Grenadines '),
(182, 'Samoa '),
(183, 'San Marino '),
(184, 'Sao Tome and Principe '),
(185, 'Saudi Arabia '),
(186, 'Senegal '),
(187, 'Serbia '),
(188, 'Seychelles '),
(189, 'Sierra Leone '),
(190, 'Singapore '),
(191, 'Slovakia (Slovak Republic) '),
(192, 'Slovenia '),
(193, 'Solomon Islands '),
(194, 'Somalia '),
(195, 'South Africa '),
(196, 'South Sudan '),
(197, 'Spain '),
(198, 'Sri Lanka '),
(199, 'Sudan '),
(200, 'Suriname '),
(201, 'Swaziland '),
(202, 'Sweden '),
(203, 'Switzerland '),
(204, 'Syria, Syrian Arab Republic '),
(205, 'Taiwan (Republic of China) '),
(206, 'Tajikistan '),
(207, 'Tanzania; officially the United Republic of Tanzan'),
(208, 'Thailand '),
(209, 'Tibet '),
(210, 'Timor-Leste (East Timor) '),
(211, 'Togo '),
(212, 'Tokelau '),
(213, 'Tonga '),
(214, 'Trinidad and Tobago '),
(215, 'Tunisia '),
(216, 'Turkey '),
(217, 'Turkmenistan '),
(218, 'Turks and Caicos Islands '),
(219, 'Tuvalu '),
(220, 'Uganda '),
(221, 'Ukraine '),
(222, 'United Arab Emirates '),
(223, 'United Kingdom '),
(224, 'United States '),
(225, 'Uruguay '),
(226, 'Uzbekistan '),
(227, 'Vanuatu '),
(228, 'Vatican City State (Holy See) '),
(229, 'Venezuela '),
(230, 'Vietnam '),
(231, 'Virgin Islands (British) '),
(232, 'Virgin Islands (U.S.) '),
(233, 'Wallis and Futuna Islands '),
(234, 'Western Sahara '),
(235, 'Yemen '),
(236, 'Zambia '),
(237, 'Zimbabwe ');

-- --------------------------------------------------------

--
-- Table structure for table `locationtb`
--

DROP TABLE IF EXISTS `locationtb`;
CREATE TABLE IF NOT EXISTS `locationtb` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `loc_id` varchar(15) NOT NULL,
  `location` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `state` varchar(50) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locationtb`
--

INSERT INTO `locationtb` (`ref_id`, `loc_id`, `location`, `address`, `state`, `phone`, `contact`, `status`) VALUES
(1, 'WIN_LOC_001', ' Ikorodu ', '23, Mulikat Musediku Street Behind Zenith Bank Benson Bus Stop Ikorodu.', 'Lagos State', '8020543280', 'Mr Sam', 'Active'),
(2, 'WIN_LOC_002', 'Ikeja', '37, Obafemi Awolowo Way Behind Ecobank Close to Under Bridge, Ikeja', 'Lagos State', '8020543280', 'Mr Sam', 'Active'),
(3, 'WIN_LOC_003', 'Ilorin', '4, Kayode Sadiku Street, Opp Gboyad Hotel, Panat Junction Behind Habeeb Filling Station Zango, Ilorin', 'Kwara State', '8037647164', 'Mr Emmanuel', 'Active'),
(4, 'WIN_LOC_004', 'Abuja', '65, 1Q2 Road FHA CBN Quarters New Bennyrose Opp Amac MKT Gate Lugbe, Abuja', 'FCT', '07032635224', 'Mrs Omorinoye', 'Active'),
(5, 'WIN_LOC_005', 'Port Harcourt', '15, Eastwest Road Alh Estate Behind Army Barack Rumuokoro Port Harcourt', 'Rivers State', '07030476792', 'Mr Maxwel', 'Active'),
(6, 'WIN_LOC_006', 'Ijaiye', '696, Lagos Abeokuta Express Road Opp Ojokoro Microfinance BankIjaye.', 'Lagos State', '8038081116', 'Mr Adebayo', 'Active'),
(7, 'WIN_LOC_007', 'Mowe', '6 Onasanya Arigbawonwo Mowe.', 'Ogun State', '8168853781', 'Mr  Ayo', 'Inactive'),
(8, 'WIN_LOC_008', 'Ibadan', 'Km 130, Lagos Ibadan Express Way. Opp OKT Filling Station, Hosanna Bus Stop Boluwaji Area, Ibadan', 'Oyo State', '8068783466', 'Mr Sunday', 'Active'),
(9, 'WIN_LOC_009', 'Delta', '115 Ewherhe Road After Cornerstone Junction Agbarho.', 'Delta State', '8038081116', 'Mr Adebayo', 'Active'),
(10, 'WIN_LOC_010', 'Oshogbo', 'Opposite O Ambulance Dada Estate Oshogbo', 'Osun State', '8034384279', 'Mr Paul', 'Inactive'),
(11, 'WIN_LOC_011', 'Ondo', 'Ade-Super Junction Ademulegun Road Ondo City', 'Ondo State', '8034384279', 'Mr Paul', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `news_tbl`
--

DROP TABLE IF EXISTS `news_tbl`;
CREATE TABLE IF NOT EXISTS `news_tbl` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `link_sash` varchar(250) NOT NULL,
  `is_deleted` enum('true','false') NOT NULL DEFAULT 'false',
  `posted_by` varchar(250) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news_tbl`
--

INSERT INTO `news_tbl` (`ref_id`, `title`, `content`, `link_sash`, `is_deleted`, `posted_by`, `datetime`) VALUES
(1, 'Portal Update', '&lt;div&gt;Dear Pogsites, it has come to the notice of the leadership of POGSASS that we are apprehensive about the University\'s Portal. Particularly because we are unable to register as well as engage in other activities relating to our academics. It is of common knowledge that the difficulty we are experiencing is not peculiar to us neither is it because the University authority do not want us to engage in those &amp;nbsp;activities nor despised us. But its as a result of a technical challenge which the authority are seriously combating day-in day-out.&amp;nbsp;&lt;/div&gt;&lt;div&gt;You can be sure that the University is fully aware of our predicament and even more concerned. We want to assure you that, our concerns are being addressed not only regarding the registration of our courses but holistically.&lt;/div&gt;&lt;div&gt;It is important to mention that under no circumstance should any of us act in contravention of the University\'s directive by purchasing bank draft or scratch card except when duly communicated. We believe strongly that the efforts of the management in restoring the portal will soon become fruitful. We therefore urge all and sundry as ambassador of the better by far University, to kindly go about their lawful businesses within and outside the School. We pray God Almighty crowns our efforts with resounding success. Permit us to, on behalf of the President and the entire leadership of the Association wish you a full-filling 2017 and the very best in life.&amp;nbsp;&lt;/div&gt;&lt;div&gt;God bless you.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Signed:&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Postgraduate Students\' Association (POGSASS).&lt;/div&gt;', 'Portal-Update', 'true', 'president@pogsassunilorin.org.ng', '2017-01-12 11:35:15'),
(2, 'ACU Summer School', 'ACU Commonwealth Wealth Summer School 2017: Creating Greener Narratives through the Environment Arts and Humanities.&lt;div&gt;Applications are invited from from Masters and Doctoral students of Commonwealth Countries and ACU members Institutions in Zimbabwe and Hong Kong. The Summer School is scheduled for &amp;nbsp;Saturday 5 - Sunday 13 August 2017 at Bath Spa University, United Kingdom.&amp;nbsp;&lt;/div&gt;&lt;div&gt;The school is open to 45 participants across disciplines. Students who have already attended an ACU Commonwealth Summer School in a previous year are not eligible to attend.&lt;/div&gt;&lt;div&gt;To apply visit: https://www.acu.ac.uk/events/commonwealth-summer-school/commonwealth-summer-school-2017/how-to-apply&lt;/div&gt;&lt;div&gt;Application closes at 12am (midnight GMT) on Wednesday 15 Febraury, 2017.&lt;/div&gt;&lt;div&gt;For further details visit: &amp;nbsp;https://www.acu.ac.uk/events/commonwealth-summer-school/commonwealth-summer-school-2017/costs-bursaries-visa-information&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;', 'ACU-Summer-School', 'true', 'president@pogsassunilorin.org.ng', '2017-01-12 12:50:24'),
(3, 'Image ACU Summer School', 'Image of ACU Summer School.&lt;img src=&quot;http://i.imgur.com/uwJ2yKu.jpg&quot; width=&quot;689&quot; data-pin-nopin=&quot;true&quot;&gt;', 'Image-ACU-Summer-School', 'true', 'president@pogsassunilorin.org.ng', '2017-01-12 13:35:22'),
(4, 'Notice of Congress', 'This is to inform all Postgraduate Students\' of the University that the Postgraduate Students\' Association would be organizing a congress next week. The congress is scheduled to hold on Tuesday, the 17th of January, 2017 at Faculty of Life Sciences Lecture Theatre (Behind Old Faculty of Arts Building). The congress is to address pressing issues which include: Account of Stewardship, Presentation of Statement of Account, Constitution of Electoral Committee among others. &amp;nbsp;We would appreciate that you grace the congress with your presence.&amp;nbsp;', 'Notice-of-Congress', 'true', 'president@pogsassunilorin.org.ng', '2017-01-13 23:24:45'),
(5, 'CONGRESS UPDATE', 'Due to logistics reasons, the general assembly (Congress) of all Postgraduate Students of the University of Ilorin which was earlier scheduled for Tuesday 17th January, 2017, has been postponed &amp;nbsp;to Wednesday 18th of January, 2017. The venue for the programme remains the same, New Faculty of Life Science Lecture Theatre, behind Old Faculty of Arts. Time: 3:00pm.&amp;nbsp;', 'CONGRESS-UPDATE', 'true', 'secretary@pogsassunilorin.org.ng', '2017-01-16 19:03:42'),
(6, 'CREDIT - ACU Summer School Seminar', '&lt;font size=&quot;4&quot;&gt;Centre for Research and In-House Training (CREDIT), organizes&amp;nbsp;seminar for all intending ACU Summer School participants from University of Ilorin. The seminar is aimed at giving the intending participants the necessary impetus so as to boost their chances of participating at the summer school. It is scheduled to hold at University Auditorium by 10:00 am prompt. The seminar will feature talks from renown scholars, tips on sponsorship and gist from former participants of the summer school from the University.&lt;/font&gt;&lt;br&gt;', 'CREDIT---ACU-Summer-School-Seminar', 'true', 'pro@pogsassunilorin.org.ng', '2017-01-23 22:13:43'),
(7, 'CREDIT - ACU Summer School Intending Participants Seminar Update', '&lt;span style=&quot;font-size: large;&quot;&gt;Centre for Research and In-House Training (CREDIT), organizes&amp;nbsp;seminar for all intending ACU Summer School participants from University of Ilorin. The seminar is aimed at giving the intending participants the necessary impetus so as to boost their chances of participating at the summer school. It is scheduled to hold on Wednesday, January 25th, 2017 at University Auditorium by 10:00 am prompt. The seminar will feature talks from renown scholars, tips on sponsorship and gist from former participants of the summer school from the University.&lt;/span&gt;&lt;div&gt;&lt;font size=&quot;4&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;div&gt;&lt;span style=&quot;font-size: large;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;', 'CREDIT---ACU-Summer-School-Intending-Participants-Seminar-Update', 'true', 'pro@pogsassunilorin.org.ng', '2017-01-23 23:27:01'),
(8, 'CONGRESS', 'The Postgraduate Students Association would be holding another edition of its congress on Wednesday, the 15th of February, 2017 at Faculty of Life Sciences New Science Lecture Theatre, behind Old Faculty of Arts. The Congress which is scheduled to hold between the hours of 3:30pm to 6:00pm is to among other things address the State of the Union, Presentation of Administrative and Financial reports, Constitution of Electoral Committee. Your presence at the congress will be highly appreciated.&amp;nbsp;', 'CONGRESS', 'true', 'pro@pogsassunilorin.org.ng', '2017-02-12 11:43:42'),
(9, 'Administrative Report', 'The Postgraduate Students Association would be holding another edition of its congress on Wednesday, the 15th of February, 2017 at Faculty of Life Sciences New Science Lecture Theatre, behind Old Faculty of Arts. The Congress which is scheduled to hold between the hours of 3:30pm to 6:00pm is to among other things address the State of the Union, Presentation of Administrative and Financial reports, Constitution of Electoral Committee. Your presence at the congress will be highly appreciated.&amp;nbsp;', 'Administrative-Report', 'true', 'pro@pogsassunilorin.org.ng', '2017-02-12 11:54:09'),
(10, 'IPEC SCREENING RESULT', 'IPEC SCREENING RESULT FOR 2016/2017 POGSASS ELECTION\r\nS/N	NAME	SEX	FACULTY	OFFICE ASPIRED	REMARKS	REASON\r\n1.	BALOGUN  Kabir Ishola	Male	Life Sciences	President	QUALIFIED	NIL\r\n2.	KURANGA Hakeem Abiodun	Male	Agriculture	President 	QUALIFIED	NIL\r\n3.	OLUSHOLA Yemi Superb	Male	Arts	President	QUALIFIED	NIL\r\n4.	OGUNSOLA Oladipupo Mathew	Male	Social Sciences	President	QUALIFIED	NIL\r\n5.	OGUNYEMI Olubunmi Esther	Female	BMS	Vice President	QUALIFIED	NIL\r\n6.	ABDULRAHEEM Isiaka Olalekan	Male	Arts	General Secretary	QUALIFIED	NIL\r\n7.	ENIKANOSAYE Adebowale Martins	Male	Social Sciences	General Secretary	QUALIFIED	NIL\r\n8.	OLAYINKA Aremon Abiodun 	Male	Physical Sciences	General Secretary	QUALIFIED	NIL\r\n9.	SAADU Rafiat Ajoke	Female	IBS	Financial Secretary	QUALIFIED	NIL\r\n10.	ADELAKUN Tajudeen Abiodun	Male	Education	Assistant General Secretary	QUALIFIED	NIL\r\n11.	ABDULLAHI Abdulfatahi	Male	Arts	Welfare Director I	QUALIFIED	NIL\r\n12.	ISAWODE Mayowa Michael	Male	BMS	Welfare Director II	QUALIFIED	NIL\r\n13.	ADEJUMO Babatunde Afeez	Male	Education	Social Director	QUALIFIED	NIL\r\n14.	AKINSULI Vincent Olawale	Male	Physical Sciences 	Social Director	QUALIFIED	NIL\r\n15.	OMOTOSHO Michael Olawale	Male	Physical Sciences	P.R.O.	QUALIFIED	NIL\r\n16.	MIFTAUDEEN Sulaiman Funsho	Male	Arts	Journal Director	DISQUALIFIED	NO SCREENING  ATTENDANCE\r\n17.	OLAWEPO Emmanuel Tosin	Male	Education	Journal Director	QUALIFIED	NIL\r\n18.	OWODELE David Ayobami	Male	Education	Sports Director	QUALIFIED	NIL\r\n\r\nS/N	\r\nNAME	\r\nSEX	FACULTY TO BE REPRESENTED	\r\nPOST ASPIRED	\r\nREMARKS	NIL\r\n1.		AMOO Kayode	Male	Agriculture	PGSLC	QUALIFIED	NIL\r\n2.		FATOLA Fatai Oyewole	Male	Agriculture	PGSLC	QUALIFIED	NIL\r\n3.		ZACCHEAUS Gbenga Ayobami	Male	Arts	PGSLC	QUALIFIED	NIL\r\n4.		OLORU Bamidele Wasiu	Male	Arts	PGSLC	QUALIFIED	NIL\r\n5.		BALOGUN Olanrewaju Isiak	Male	Arts	PGSLC	QUALIFIED	NIL\r\n6.		IMAM-FULANI Abdulkadir Yaradua	Male	Basic Medical Sciences	PGSLC	DISQUALIFIED	\r\nFAILURE TO RESIGN\r\n7.		UKWUBILE Ileje Inelo	Male	Basic Medical Sciences	PGSLC	DISQUALIFIED	NO SCREENING  ATTENDANCE\r\n8.		BAKARE Ismail Afolabi 	Male	Clinical Sciences	PGSLC	DISQUALIFIED	NO SCREENING  ATTENDANCE\r\n9.		BABATUNDE Peter Femi	Male	Clinical Sciences	PGSLC	DISQUALIFIED	NO SCREENING  ATTENDANCE\r\n10.		ADEWOJO Akinade Adebowale	Male	Communication &amp; Information Sciences	PGSLC	DISQUALIFIED	NO SCREENING  ATTENDANCE\r\n11.		ADEFAJO Nurudeen Adewale	Male	Communication &amp; Information Sciences	PGSLC	QUALIFIED	NIL\r\n12.		EKERUVWE Omonigho Edward	Male	Communication &amp; Information Sciences	PGSLC	QUALIFIED	NIL\r\n13.		HAMEED Olalekan Fatai	Male	Education	PGSLC	QUALIFIED	NIL\r\n14.		HAMZA Abdullateef Olayinka	Male	Education	PGSLC	QUALIFIED	NIL\r\n15.		NAFIU Hakeem Ayodeji	Male	Education	PGSLC	QUALIFIED	NIL\r\n16.		RAJI Oyewale Saheed	Male	Education	PGSLC	QUALIFIED	NIL\r\n17.		MUMEEN Habeeb Olalekan	Male	Engineering	PGSLC	QUALIFIED	NIL\r\n18.		ADESOYE Abimbola Iyiola	Male	Law	PGSLC	QUALIFIED	NIL\r\n19.		ADEJARE Elijah Olusegun 	Male	Law	PGSLC	QUALIFIED	NIL\r\n20.		AFOLAYAN Opeyemi Moshood	Male	Life Sciences	PGSLC	QUALIFIED	NIL\r\n21.		MURTADHA Rahmat Biola	Male	Life Sciences	PGSLC	QUALIFIED	NIL\r\n22.		OLUGBODE Ayomikun Emmanuel	Male	Life Sciences	PGSLC	QUALIFIED	NIL\r\n23.		AZEEZ Abdullahi Opeyemi	Male	Management Science	PGSLC	QUALIFIED	NIL\r\n24.		OLANREWAJU Yusuf Akanbi	Male	Physical Sciences	PGSLC	QUALIFIED	NIL\r\n25.		ALAO Sikirat Tunrayo	Female	Physical Sciences	PGSLC	QUALIFIED	NIL\r\n26.		ADEROJU Shamsudeen Adedapo	Male	Physical Sciences	PGSLC	QUALIFIED	NIL\r\n27.		ADEOYE Sheriff Oluwagbenga	Female	Physical Sciences	PGSLC	QUALIFIED	NIL\r\n28.		ABAYOMI Barakat Motunrayo	Female	Social Sciences	PGSLC	QUALIFIED	NIL\r\n29.		AJAYI Oluwatosin Esther	Female	Social Sciences	PGSLC	QUALIFIED	NIL\r\n\r\n_____________________										_______________________\r\n  ILO, Mobolaji Monsuru 										        KAREEM, Kola\r\n      Chairman (IPEC)											        Secretary (IPEC)\r\n\r\n', 'IPEC-SCREENING-RESULT', 'true', 'president@pogsassunilorin.org.ng', '2017-04-06 09:19:20'),
(11, 'Hello Try', 'get all of those gist somewhere in the cloud..&lt;div&gt;score time...&lt;/div&gt;', 'Hello-Try', 'true', '', '2017-07-10 05:04:14'),
(12, '2017 Admission', 'You can bank your future in 2017 IJMB and worryless about Jamb. Let\'s help you solve your admission problems. Visit ijmboffice.org.ng for application.&amp;nbsp;', '2017-Admission', 'true', '', '2017-07-13 20:46:44'),
(13, '2017 DE form', 'We advice all Direct Entry applicants to obtain the form starting from 17th July, 2017.&amp;nbsp;', '2017-DE-form', 'true', '', '2017-07-13 20:49:49'),
(14, 'Admission 2017', 'Stop the trend of fruitless JAMB exercise and register for an awakening and reassuring 200level Admission to any university across Nigeria. Visit ijmboffice.org.ng for more details. &lt;br&gt;', 'Admission-2017', 'true', '', '2017-07-16 13:03:30'),
(15, 'Smart Solution to Failed 2017 WAEC May/June.', '&lt;div&gt;Failed 2017 WAEC May/June Exam?&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;From the statistics released by WAEC, out of 1,559,162 candidates that sat for the examination, a total of 923,486 candidates, representing 59.22%, obtained credits in five subjects &amp;amp; above, including English Language &amp;amp; Mathematics. &amp;nbsp;we admonish candidates that wish to upgrade their WAEC results to desist from such act, as it&rsquo;s not possible&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;The way forward is to register for another exam. Remember, no hope is lost.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;The smart solution is that you enrol for IJMB A\'level program which caters for your O\'Level deficiency. Registration is still on via ijmboffice.org.ng&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Recommended: 2017 IJMB A\'level Registration Procedures&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Someone need this. Click on the share button below to keep others informed&lt;/div&gt;', 'Smart-Solution-to-Failed-2017-WAEC-May-June.', 'true', '', '2017-07-19 16:40:38'),
(16, 'Religious Studies have been revisited by Federal Govt of Nigeria. ', '&lt;div&gt;The Federal Government of Nigeria has restored IRK and CRK as separate subjects in schools curriculum. Islamic Religious Knowledge and Christian Religious Knowledge are now to be separate subjects as they once were in primary and secondary schools in Nigeria.&lt;/div&gt;&lt;div&gt;The Federal Government (FG) directed the Nigerian Educational Research and Development Council (NERDC) to make the Christian Religious Knowledge and the Islamic Religious Knowledge distinctive subjects in the basic education curriculum.&lt;/div&gt;&lt;div&gt;FG Restores IRK, CRK as Separate Subjects in Schools Curriculum&lt;/div&gt;&lt;div&gt;The government asked the Nigerian Educational Research and Development Council, NERDC, the country&rsquo;s education body to immediately reinstall the two subjects where they were before their grouping under the Civil Education.&lt;/div&gt;&lt;div&gt;Minister of Education, Adamu Adamu, gave the directive at a meeting of Ministers of Education with education stakeholders from six geo-political zones and the Federal Capital Territory (FCT) in Abuja on Thursday.&lt;/div&gt;&lt;div&gt;The meeting, which was also attended by the commissioners for education in the 36 states, focused on the strengthening of partnership in the implementation of the Sustainable Development Goals.&lt;/div&gt;&lt;div&gt;Speaking through the Minister of State for Education, Prof. Anthony Anwukah, Adamu said the directive to separate the subjects became imperative in view of the various complaints by Nigerians, especially the Christian Association of Nigeria.&lt;/div&gt;&lt;div&gt;He explained that the collapse of the two subjects was done by former President Goodluck Jonathan\'s administration to reduce the number of subjects offered by pupils and students in schools.&lt;/div&gt;&lt;div&gt;The minister said: &ldquo;There is this controversy over the merger of CRK and IRK in the school curriculum. There were complaints by parents that children were overloaded with so many subjects and the recommendation then was to merge one or two subjects. Unfortunately, water and oil were merged together and it is not working.&lt;/div&gt;&lt;div&gt;&ldquo;So, to save ourselves the agony, the two subjects should be separated. We push that to the NERDC,&rdquo;&lt;/div&gt;&lt;div&gt;Adamu, in his keynote address, reiterated the commitment of the Federal Government to revamping the education sector, while appealing to the state governments, as well as relevant stakeholders, to support the Federal Government&rsquo;s effort. For more info about admission to 200Level visit ijmboffice.org.ng&lt;/div&gt;', 'Religious-Studies-have-been-revisited-by-Federal-Govt-of-Nigeria.-', 'true', '', '2017-07-22 04:50:15'),
(17, 'Apply for your WAEC 2017 Remark Now. ', '&lt;div&gt;The West African Examination Council has advised candidates who are not satisfied with the marking of their result to apply for remarking.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;The Examination council gave the counsel while responding to @LawalKunle who wanted his sister&rsquo;s result remarked.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&amp;nbsp;&lt;/div&gt;&lt;div&gt;The twitter user asked, &ldquo;How do I call for a remark. My sister made all her results except physics D7 and she&rsquo;s very sure of herself.&rdquo;&lt;/div&gt;&lt;div&gt;And in response, WAEC wrote, &ldquo;Let her school apply for her.&lt;/div&gt;&lt;div&gt;&ldquo;It must be received 60 days after the release of the results &amp;amp; there is a fee.&rdquo;visit&amp;nbsp;ijmboffice.org.ng&amp;nbsp;for 200level&amp;nbsp;admission&amp;nbsp;to&amp;nbsp;any&amp;nbsp;Nigeria&amp;nbsp;University.&amp;nbsp;&lt;/div&gt;', 'Apply-for-your-WAEC-2017-Remark-Now.-', 'true', '', '2017-07-22 05:52:30'),
(18, 'Admission For All', 'We&amp;nbsp;advice&amp;nbsp;our&amp;nbsp;teaming&amp;nbsp;youth&amp;nbsp;waiting&amp;nbsp;for&amp;nbsp;admission&amp;nbsp;and&amp;nbsp;have been&amp;nbsp;disappointed&amp;nbsp;by&amp;nbsp;JAMB&amp;nbsp;to&amp;nbsp;register&amp;nbsp;for&amp;nbsp;IJMB&amp;nbsp;A\'level&amp;nbsp;program&amp;nbsp;via&amp;nbsp;ijmboffice.org.ng&amp;nbsp;And&amp;nbsp;gain&amp;nbsp;A&amp;nbsp;200Level&amp;nbsp;admission&amp;nbsp;to&amp;nbsp;any&amp;nbsp;university&amp;nbsp;of&amp;nbsp;their&amp;nbsp;choice.&amp;nbsp;&lt;br&gt;There&amp;nbsp;are&amp;nbsp;enough&amp;nbsp;facilities&amp;nbsp;awaiting you.&amp;nbsp;We&amp;nbsp;are your partner&amp;nbsp;for&amp;nbsp;educational&amp;nbsp;Success.&amp;nbsp;&lt;br&gt;', 'Admission-For-All', 'true', '', '2017-07-30 06:38:15'),
(19, '2018/2019 Academic Session Begins. ', 'A\'Level Admits More than Enough into Nigerian Universities.&lt;br&gt;&lt;br&gt;2018&amp;nbsp;registration begins&amp;nbsp;and&amp;nbsp;all&amp;nbsp;aspiring&amp;nbsp;admission&amp;nbsp;seekers&amp;nbsp;are&amp;nbsp;advised&amp;nbsp;to&amp;nbsp;upload&amp;nbsp;or&amp;nbsp;fill&amp;nbsp;their&amp;nbsp;form&amp;nbsp;via www.ijmboffice.org.ng&amp;nbsp;before&amp;nbsp;registration&amp;nbsp;closes.&amp;nbsp;&lt;br&gt;&lt;br&gt;Federal&amp;nbsp;Government&amp;nbsp;of&amp;nbsp;Nigeria&amp;nbsp;has&amp;nbsp;laid&amp;nbsp;down&amp;nbsp;a&amp;nbsp;supportive grounds&amp;nbsp;to&amp;nbsp;register&amp;nbsp;at&amp;nbsp;due&amp;nbsp;time&amp;nbsp;to&amp;nbsp;avoid&amp;nbsp;late&amp;nbsp;minutes&amp;nbsp;rushing.&amp;nbsp;&lt;br&gt;&lt;br&gt;We&amp;nbsp;will&amp;nbsp;be&amp;nbsp;more&amp;nbsp;than&amp;nbsp;ready&amp;nbsp;to&amp;nbsp;accept&amp;nbsp;respond&amp;nbsp;to&amp;nbsp;all&amp;nbsp;aspirant&amp;nbsp;without&amp;nbsp;delay.&amp;nbsp;&lt;br&gt;&lt;br&gt;Register&amp;nbsp;now&amp;nbsp;for 200&amp;nbsp;Level&amp;nbsp;program&amp;nbsp;that&amp;nbsp;guarantees&amp;nbsp;you&amp;nbsp;to &amp;nbsp;any&amp;nbsp;University&amp;nbsp;in&amp;nbsp;Nigeria.&amp;nbsp;&lt;br&gt;', '2018-2019-Academic-Session-Begins.-', 'true', '', '2017-12-22 23:36:50'),
(20, 'IJMB Timetable 2017/2018 is out. ', '&lt;img src=&quot;https://i.imgur.com/OOQatUH.jpg&quot; width=&quot;278&quot;&gt;&lt;br&gt;', 'IJMB-Timetable-2017-2018-is-out.-', 'true', '', '2017-12-24 16:40:22'),
(21, 'Academic Year 2018', '&lt;div&gt;This is to inform all that we guarantee your admission to 200 Level to any university home and abroad.&amp;nbsp;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;For more info visit www.ijmboffice.org.ng&amp;nbsp;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Registration is on for 2018/2019 session. Obtain your form now from my our online link ijmboffice.org.ng&amp;nbsp;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Resumption is Monday 5th of March 2018.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Your academic pursuit is handled with strategic management through experts.&amp;nbsp;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;@ ijmboffice.org.ng we are your ticket to 200Level Universities Admission to any University Home and Abroad.&lt;/div&gt;', 'Academic-Year-2018', 'true', '', '2018-01-06 15:25:39'),
(22, 'Know IJMB Better. ', 'IJMB has become a perfect substitution for school leavers who couldn&rsquo;t meet up with the school rigorous challenges faced in processing admission into Tertiary Institution in Nigeria.\r\nWith the right combination of subjects/courses, the maximum point a student can attain in IJMB examination is 16 points, an extra point is given if there is no grade &ldquo;F&rdquo; in the result. The IJMB result grading ranges from A to F.\r\n\r\nREQUIREMENTS AND ELIGIBILTY\r\n-	O&rsquo; Level Result (WAEC, NECO, NABTEB, O&rsquo;LEVEL and Equivalents). With minimum of Five Credits, English and Mathematics Included.\r\n-	12 Passports with any background, Should be available for submission on resumption.\r\n-	Awaiting result can also apply.\r\n\r\nREQUIREMENTS AND ELIGIBILTY\r\n-	O&rsquo; Level Result (WAEC, NECO, NABTEB, O&rsquo;LEVEL and Equivalents). With minimum of Five Credits, English and Mathematics Included.\r\n-	12 Passports with any background, Should be available for submission on resumption.\r\n-	Awaiting result can also apply.\r\n\r\nREMARKS	GRADE	POINTS\r\nEXCELLENT	A	5\r\nVERY GOOD	B	4\r\nGOOD	C	3\r\nFAIR	D	2\r\nPASS	E	1\r\nFAIL	F	0\r\nA student with combination of subject such as Physics, Chemistry and Biology with grades \r\nPhysics &ndash; A = 5 Points\r\nChemistry &ndash; B = 4 Points\r\nBiology &ndash; c = 3 Points\r\nTotal = 12 + 1 (Additional Points)\r\nSince, there is no grade &ldquo;F&rdquo; in the result, the IJMB board automatically awards an additional &ldquo;One Point&rdquo; to such result. Therefore a student with the grades above can boasts of 13 points in his/her IJMB examination which is enough to study any course of his/her choice.\r\n\r\nwww.ijmboffice.org.ng Cares. ', 'Know-IJMB-Better.-', 'true', '', '2018-02-02 05:18:02'),
(23, 'Know IJMB 2018 Better. ', 'IJMB has become a perfect substitution for school leavers who couldn&rsquo;t meet up with the JAMB/UTME rigorous challenges faced in processing admission into Tertiary Institution in Nigeria.\r\nWith the right combination of subjects/courses, the maximum point a student can attain in IJMB examination is 16 points, an extra point is given if there is no grade &ldquo;F&rdquo; in the result. The IJMB result grading ranges from A to F.\r\n\r\nREQUIREMENTS AND ELIGIBILTY\r\n-	O&rsquo; Level Result (WAEC, NECO, NABTEB, O&rsquo;LEVEL and Equivalents). With minimum of Five Credits, English and Mathematics Included.\r\n-	12 Passports with any background, Should be available for submission on resumption.\r\n-	Awaiting result can also apply.\r\n\r\nREQUIREMENTS AND ELIGIBILTY\r\n-	O&rsquo; Level Result (WAEC, NECO, NABTEB, O&rsquo;LEVEL and Equivalents). With minimum of Five Credits, English and Mathematics Included.\r\n-	12 Passports with any background, Should be available for submission on resumption.\r\n-	Awaiting result can also apply.\r\n\r\nREMARKS	GRADE	POINTS\r\nEXCELLENT	A	5\r\nVERY GOOD	B	4\r\nGOOD	C	3\r\nFAIR	D	2\r\nPASS	E	1\r\nFAIL	F	0\r\nA student with combination of subject such as Physics, Chemistry and Biology with grades \r\nPhysics &ndash; A = 5 Points\r\nChemistry &ndash; B = 4 Points\r\nBiology &ndash; c = 3 Points\r\nTotal = 12 + 1 (Additional Points)\r\nSince, there is no grade &ldquo;F&rdquo; in the result, the IJMB board automatically awards an additional &ldquo;One Point&rdquo; to such result. Therefore a student with the grades above can boasts of 13 points in his/her IJMB examination which is enough to study any course of his/her choice.', 'Know-IJMB-2018-Better.-', 'true', '', '2018-02-02 05:24:38'),
(24, 'Reasons Why You Must Be Admitted', 'Gaining admission is a top priority in the world we live today and school leavers must ensure that they are admitted to 200Level to any university across Nigeria and beyond. \r\n\r\nThe Reasons are:\r\n1. JAMB is not meeting up with the requirement of successful applicants. \r\n2. Nigeria university system is too small to accommodate millions of JAMB/UTME applicants but can accommodate DIRECT ENTRY STUDENTS through our list of A\'Level programme. \r\n3. Our list of A\'Level programme does not expire but JAMB and REMEDIAL programmes expires within the year it is written. \r\n4. You will gain 85% of knowledge you will be lectured when you are admitted to your university of choice. \r\n5. Your academic excellence is our watchword. Meaning you can beat the best in any High Level of Learning.\r\n6. You can be rest assured that your admission to 200Level is guaranteed. \r\nFor more information visit us @ www.ijmboffice.org.ng or contact admin via +2348089186066', 'Reasons-Why-You-Must-Be-Admitted', 'true', '', '2018-03-09 07:51:25'),
(25, 'ADMISSION 2018/2019', 'We have living testimonies regarding 200LEVEL UNIVERSITIES ADMISSIONS. And we will be glad if you can join the winning team for a continuous experience in the educational world. Your admission is our ultimate concern. Visit www.ijmboffice.org.ng for exclusive details. ', 'ADMISSION-2018-2019', 'true', '', '2018-03-21 00:31:41'),
(26, 'Guaranteed Admission 2018', 'We guarantee your admission 200Level to any university across Nigeria and beyond. Speak with the director in charge of operations +2348089186066. You\'ll be glad you did. ', 'Guaranteed-Admission-2018', 'true', '', '2018-03-21 00:36:13'),
(27, 'Solution To Your Admission Problems. ', 'POST UTME BAN LIFTING: FROM FRYING PAN TO FIRE.\r\n\r\nThe re-introduction of the Post University Matriculation Examination (Post UTME) in Nigeria which was earlier suspended for being a medium of exploitation has been marred with lot of confusion particularly being the major exam that determines the destiny of our children.ðŸ”‘ðŸ”‘ðŸ”‘ðŸ”‘ The test has become so controversial and ought to be challenged in the court of law. âš–âš–âš–âš–âš–âš–âš–âš–âš–âš–âš–âš–âš–While our organisation is making attempt to challenge the legality of the Test, it is a pity that before then it would have truncated the aspirations of many students what a pity from frying pan to fire.  ðŸ˜­ðŸ˜­ðŸ˜­ðŸ˜­ðŸ˜­ðŸ˜­ðŸ˜­ðŸ˜­Many have been denied admissions not because they failed UTME but because they could not meet up with the required Cut off mark in Post Utme what a pity! Imagine a Law or Medical Student with 290 in Jamb and 49 in Post Utme, Chai! Hard luck?ðŸ™†&zwj;â™‚ðŸ™†&zwj;â™‚ðŸ™†&zwj;â™‚ðŸ™†&zwj;â™‚ðŸ™†&zwj;â™‚ðŸ™†&zwj;â™‚ðŸ™†&zwj;â™‚ðŸ™†&zwj;â™‚\r\nLooking at the havoc this Test might cause before it could be properly challenged in Court, we recommend that you call us on 08089186066 and we may help secure your future by: Balancing the admission requirements with 70 upward in Post Utme.\r\nWe don\'t sleep until you achieve your dream.\r\nWe prepare you for Post Utme by giving you the best lecture and tutorials.\r\nWe educate you passionately and with vision because we care about your future. \r\n\r\nFrom all of us @ ijmboffice.org.ng ', 'Solution-To-Your-Admission-Problems.-', 'true', '', '2018-05-20 16:23:46'),
(28, 'JUPEB Registration 2019 is on. ', 'We advise all aspiring candidates who wish to secure admission to 200Level to any University in Nigeria should apply via www.alevellinks.sch.ng for all A\'Level Programs across African.&amp;nbsp;&lt;div&gt;Benefits are&amp;nbsp;&lt;/div&gt;&lt;div&gt;1. Direct Level admissions to 200Level without delay.&amp;nbsp;&lt;/div&gt;&lt;div&gt;2. It\'s results does not expire.&amp;nbsp;&lt;/div&gt;&lt;div&gt;3. Guaranteed and approved across Africa.&amp;nbsp;&lt;/div&gt;&lt;div&gt;4. Both applications and admissions is time limited within a short time frame.&amp;nbsp;&lt;/div&gt;&lt;div&gt;5. You can use our results for multiple admission applications across Africa.&amp;nbsp;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Download form now @ www.alevellinks.sch.ng and scan all documents to admissions@alevellinks.sch.ng for admission purposes but for further enquiry drop messages @ info@alevellinks.sch.ng or call 08089186066 or 07030400348.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Your admission our priorities.&amp;nbsp;&lt;/div&gt;', 'JUPEB-Registration-2019-is-on.-', 'true', '', '2019-01-14 04:39:47'),
(29, 'Hello News 2019', 'You can now buy your IJMB form for free', 'Hello-News-2019', 'true', '', '2020-04-06 14:24:55'),
(30, 'IJMB REGISTRATION 2020', 'IJMB Registration is currently ongoing and it\'s closing 12th of April 2020.  Click here to proceed ', 'IJMB-REGISTRATION-2020', 'true', '', '2020-04-07 22:43:53'),
(31, 'IJMB REGISTRATION 2020 Closes 12th of April 2020', 'IJMB Registration is currently ongoing and it\'s closing 12th of April 2020. Click on `Apply Now`\r\n\r\n', 'IJMB-REGISTRATION-2020-Closes-12th-of-April-2020', 'true', '', '2020-04-08 09:19:26'),
(32, 'JUPEB Registration for 2020/2021 Academic Session is on now. Apply now', 'For Applicant who have been calling endlessly and those who are fully  prepared to join us for the new academic session.\r\n\r\nGood News our portal is fully opened for JUPEB registration. Note - We have limited space and it\'s going to be on a first come first serve. Click here to apply now. ', 'JUPEB-Registration-for-2020-2021-Academic-Session-is-on-now.-Apply-now', 'false', '', '2020-04-08 09:28:39'),
(33, 'Please submit your questions here.', '&lt;img src=&quot;https://i.imgur.com/TWWyVUg.png&quot; width=&quot;130&quot;&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Welcome to the board of governing council of Jupeb&lt;/div&gt;', 'Please-submit-your-questions-here.', 'true', '', '2020-04-11 08:12:15'),
(34, 'IJMB', '&lt;img src=&quot;https://i.imgur.com/BDJUCs4.jpg&quot; width=&quot;228&quot;&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Registration is closing soon.&amp;nbsp;&lt;/div&gt;', 'IJMB', 'true', '', '2020-04-11 09:40:40'),
(35, 'IJMB REGISTRATION CLOSES 30TH OF APRIL... HURRY NOW FOR DISCOUNT. ', 'IJMB Registration is currently ongoing and it\'s closing 30th of April 2020. Click on `Apply Now`', 'IJMB-REGISTRATION-CLOSES-30TH-OF-APRIL...-HURRY-NOW-FOR-DISCOUNT.-', 'true', '', '2020-04-27 05:20:47'),
(36, 'IJMB REGISTRATION 2020', 'IJMB Registration is currently ongoing and it\'s closing 20th of MAY 2020. Click on `Apply Now`\r\n', 'IJMB-REGISTRATION-2020', 'true', '', '2020-05-11 15:54:55'),
(37, 'IJMB REGISTRATION 2020', '\r\nIJMB Registration is currently ongoing and it\'s closing 10th of JULY  2020. Click on `Apply Now`', 'IJMB-REGISTRATION-2020', 'true', '', '2020-07-02 00:30:36'),
(38, '16 UTME Candidates Get Scholarships For their Excellent Performance', 'The Nigerian Society of Engineers (NSE) has awarded scholarships to 16 candidates who took the 2020 UTME for their excellent performance in the 2020 Unified Tertiary Matriculation Examination (UTME).\r\n\r\n\r\n \r\n\r\n \r\nThe beneficiaries, comprising males and females, have indicated interest to study mechanical, industrial production, electrical, computer as well as civil engineering in Nigerian universities. The best three of the 16 candidates, Maduafokwa Egoagwuagwa Agnes, Nwobi Okwuchuwu David, and Ojuba Mezisasha Shalom, scored 369, 363 and 359 in the examination.\r\n\r\n16 UTME Candidates Get Scholarships For their Excellent Performance\r\nEach of the candidates will get N200, 000 per year for the next five years if they gained admission into any tertiary institution this year. Each of them will also be given a brand new laptop while the best candidate, Maduafokwa got an extra new laptop and a tablet donated by the President, Association of Professional Women Engineers of Nigeria, Mrs. Funmilola Ojelade, and other sponsors.\r\n\r\nAddressing the gathering, which attracted parents, top practicing engineers in Nigeria and across the world as well as officials of the Joint Admission and Matriculation Board (JAMB), the President of NSE, Babagana Mohammed, explained that the gesture was in line with the institution&rsquo;s strategic mission and objective of getting more Nigerians to study and practice engineering, and to grow the profession in all its ramifications.', '16-UTME-Candidates-Get-Scholarships-For-their-Excellent-Performance', 'true', '', '2020-07-02 00:39:25'),
(39, 'Post-UTME 2020: List Of Schools That Have Released Forms', 'Post-UTME screening exercise for 2020/2021 session has already kickstarted. A good number of schools have already announced sales of Post-UTME form as well as other screening details. As usual, we wouldn\'t like you to be in the dark as to whether or not your school of choice has announced sales of Post-UTME form or not which is the reason we have decided to use this thread to keep you updated on schools that their Post-UTME forms have been released.\r\n\r\nFUTA Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nFUNAAB Post-UTME 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nChrisland University Post UTME 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nClifford University Post UTME 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nADSU Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nFUTMINNA Post-UTME/DE 2020: Cut-off Marks, Dates, Eligibility And Registration Details\r\n\r\nUNIJOS Post-UTME/DE 2020: Cut-off marks, Eligibility and Registration Details\r\n\r\nEKSU Post-UTME 2020: Cut-off mark, Eligibility And Registration Details\r\n\r\nUI Post-UTME/DE 2020: Cut-off Mark, Eligibility and Registration Details\r\n\r\nKWACOEILORIN-EKSU Post-UTME 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nBASU Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nUNIMED Post UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nOAUSTECH Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nAl-Hikmah University Post-UTME 2020: Cut-off marks, Eligibility and Registration Details\r\n\r\nKWASU Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nLAUTECH Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nUNIOSUN Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nGregory University Post-UTME Screening 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nNWU Post-UTME/DE 2020: Cut-off Marks, Eligibility, and Registration Details\r\n\r\nMOUAU Post-UTME 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nFUKashere Post-UTME 2020: Cut-off mark, Eligibility and Registration details\r\n\r\nIBBU Post-UTME/DE 2020: Cut-off mark, Eligibility And Registration Details\r\n\r\nUNIABUJA Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nBSU Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nIMT/UNN Degree Post-UTME 2020: Cut-off marks, Eligibility and Registration Details\r\n\r\nTASUED Post-UTME 2020: Cut-off Mark, Date, Eligibility and Registration Details\r\n\r\nKASU Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nFUDutsinma Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nUNIBEN Post-UTME 2020: Cut-Off Mark, Eligibility and Registration Details\r\n\r\nFUPRE Post-UTME 2020: Cut-off marks, Eligibility and Registration Details\r\n\r\nUNIZIK Post-UTME/DE 2020: Cut-Off Mark, Eligibility, and Registration Details\r\n\r\nCOOU Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nAAUA Post-UTME/DE 2020: Cut-off mark, Eligibility And Registration Details\r\n\r\nESUT Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nUNILORIN Post-UTME 2020: Cut-off Mark, Eligibility and Registration Details\r\n\r\nKSU Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nUMYU Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nTASCE In Affiliation With OOU Post-UTME 2020: Cut-off mark, Screening and Registration Details\r\n\r\nUNN Post-UTME/DE 2020: Cut-off marks, Eligibility, and Registration Details\r\n\r\nFUOTUOKE Post-UTME 2020: Cut-off Mark, Eligibility and Registration Details\r\n\r\nBUK Post-UTME 2020: Cut-off Marks, Eligibility and Registration\r\n\r\nAKSU Post-UTME/DE 2020: Cut-off Mark, Eligibility, Application Details\r\n\r\nTaraba State University Post UTME/DE 2020: Cut-Off mark, Eligibility and Registration Details\r\n\r\nFUOYE Post-UTME 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nOOU Post-UTME 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nFUTO Post-UTME/DE 2020: Cut-off Mark, Eligibility and Registration Details\r\n\r\nMAUTECH Post UTME/DE 2020: Cut-Off Mark, Eligibility and Registration Details\r\n\r\nUNIPORT Post-UTME 2020: Cut-off-mark, Eligibility and Registration Details.\r\n\r\nKolaDaisi University Post-UTME 2020: Eligibility and Registration Details\r\n\r\nFountain University Post-UTME 2020: Eligibility, Screening Dates, Registration Details\r\n\r\nFULAFIA Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nFUNAI Post-UTME/DE 2020: Cut-off Mark, Eligibility and Registration Details\r\n\r\nGSU Post-UTME 2020: Cut-off mark, Eligibility, Screening Date and Registration Details\r\n\r\nFUWukari Post-UTME 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nYSU Post-UTME 2020: Cut-off mark, Eligibility, And Registration Details\r\n\r\nABSU Post-UTME 2020: Cut-off mark, Date, Eligibility and Registration Details\r\n\r\nIgbinedion University Post-UTME/DE 2020: Eligibility and Registration Details\r\n\r\nJABU Post-UTME/DE 2020: Cut-off Mark, Eligibility and Registration Details\r\n\r\nEBSU Post-UTME/DE 2020: Cut-off Mark, Eligibility and Registration Details (Updated)\r\n\r\nIAUE Post-UTME/DE 2020: Cut-off Mark, Eligibility and Registration Details\r\n\r\nVeritas University Post-UTME/DE 2020: Cut-off mark, Eligibility, and Application Details\r\n\r\nNDU Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nRSUST Post UTME 2020: Cut-Off Mark, Eligibility, and Registration Details\r\n\r\nDELSU Post-UTME/DE 2020: Cut-off Mark, Eligibility, Screening Date and Registration Details\r\n\r\nArthur Jarvis University Post UTME/DE 2020: Eligibility and Registration Details\r\n\r\nChrisland University Post-UTME 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nAdeleke University Post-UTME/DE 2020: Eligibility and Registration Details\r\n\r\nAdmiralty University Post-UTME/DE Screening Form For 2020/2021\r\n\r\nAtiba University Oyo Post UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nUNIMAID Post-UTME 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nBingham University Post-UTME/DE 2020: Cut-off Mark, Eligibility and Registration Details\r\n\r\nCRUTECH Post-UTME/DE 2020: Cut-off mark, Eligibility and Registration Details\r\n\r\nBabcock University Post-UTME 2020: Eligibility and Screening Dates Announced\r\n\r\nGodfrey Okoye University Post-UTME 2020: Eligibility, Cut-off Mark and Registration Details\r\n\r\nUNICAL Post-UTME/DE 2020: Cut-off Mark, Eligibility and Registration Details\r\n\r\nAAU Post-UTME/DE 2020: Cut-off Mark, Eligibility and Registration Details\r\n\r\nUNIUYO Post-UTME 2020: Cut-off mark, Eligibility, and Registration Details\r\n\r\nNile University Post-UTME/DE 2020: Eligibility and Registration Details\r\n\r\nCoal City University (CCU) Post UTME 2020: Eligibility and Registration Details\r\n\r\nWellspring University Post-UTME 2020: Eligibility and Registration Details\r\n\r\nPrecious Cornerstone University Post-UTME 2020: Eligibility and Registration Details\r\n\r\nOduduwa University Post-UTME 2020: Eligibility And Registration Details\r\n\r\nPan-Atlantic University (PAU) Post UTME 2020: Eligibility and Registration Details\r\n\r\nLead City University (LCU) Post UTME/DE 2020: Eligibility, Dates, Application Details.\r\n\r\nEvangel University Post-UTME 2020: Eligibility and Registration Details\r\n\r\nMountain Top University Post-UTME 2020: Eligibility and Registration Details\r\n\r\nAugustine University Post-UTME/DE 2020: Eligibility and Registration Details\r\n\r\nMcPherson University Post-UTME 2020: Eligibility and Registration Details\r\n\r\nBowen University Post-UTME/DE 2020: Eligibility, Screening and Registration Details\r\n\r\nKings University Post-UTME/DE Screening Form 2020/2021 Session\r\n\r\nEdo State University Post-UTME 2020: Cut-off mark, Eligibility And Registration Details\r\n\r\nSalem University Post-UTME 2020: Eligibility and Registration Details\r\n\r\nDominion University Post-UTME 2020: Eligibility and Registration Details\r\n\r\nRedeemers University (RUN) Post-UTME 2020: Eligibility and Registration Details\r\n\r\nBells University of Technology Post-UTME 2020: Eligibility and Registration Details Announced\r\n\r\nCrawford University Post-UTME 2020: Eligibility and Registration Details\r\n\r\nBaze University Post-UTME/DE 2020: Application Guidelines\r\n\r\nABUAD Post-UTME/DE 2020: Eligibility and Registration Details Announced\r\n\r\nCovenant University Post-UME/DE 2020: Eligibility, Cost and Registration Details\r\n\r\nElizade University Post-UTME 2020: Eligibility And Registration Details\r\n\r\nAnchor University Post-UTME/DE 2020:, Eligibility and Application Details\r\n\r\nAjayi Crowther University Post-UTME/DE 2020: Eligibility and Registration Details\r\n\r\nLandmark University Post-UTME 2020: Eligibility, Cost and Registration Details\r\n', 'Post-UTME-2020-List-Of-Schools-That-Have-Released-Forms', 'true', '', '2020-09-16 13:23:52'),
(40, 'Post-UTME 2020: List Of Schools That Have Released Forms', 'FUTA, \r\nFUNAAB\r\n, Chrisland University, \r\nClifford University\r\n, ADSU \r\nFUTMINNA\r\n, UNIJOS, \r\nEKSU, \r\nKWACOEILORIN-EKSU, \r\nBASU,\r\n UNIMED \r\nOAUSTECH \r\nAl-Hikmah University \r\nKWASU \r\nLAUTECH \r\nUNIOSUN \r\nGregory University \r\nNWU \r\nMOUAU\r\nFUKashere \r\nIBBU\r\nUNIABUJA \r\nBSU \r\nIMT/UNN \r\nTASUED \r\nKASU \r\nFUDutsinma \r\nUNIBEN \r\nFUPRE \r\nUNIZIK\r\nCOOU \r\nAAUA \r\nESUT\r\nUNILORIN \r\nKSU\r\nUMYU\r\nTASCE\r\nUnn\r\nFUOTUOKE\r\nBUK\r\nAKSU\r\nTRABANT STATE UNIVERSITY \r\nFUOYE\r\nOOU\r\nFUTO\r\nMAUTECH\r\nUNIPORT\r\nKOLADAISI\r\nFOUNTAIN UNIVERSITY \r\nFALAFIA\r\nFUNAI\r\nGSU\r\nFUWUKARI\r\nYSU\r\nABSU\r\nIGBINEDION\r\nJABU\r\nEBSU\r\nIAUE\r\nVERITAS UNIVERSITY \r\nNDU\r\nRSUST\r\nDELSU\r\nArthur Jarvis University \r\nChrisland\r\nAdeleke\r\nAdmiralty University \r\nAtiba University Oyo\r\nUnimaid\r\nBingham University \r\nCRUTECH\r\nBabcock University\r\nGodfrey Okoye University\r\nUNICAL\r\nAAU \r\nUNIUYO\r\nNile University \r\nCoal City University (CCU)\r\nWellspring University \r\nPrecious Cornerstone \r\nOduduwa University \r\nPan-Atlantic University (PAU)\r\nLead City University (LCU) \r\nEvangel University \r\nMountain Top University\r\nAugustine University \r\nMcPherson University \r\nBowen University \r\nKings University \r\nEdo state university \r\nSalem University \r\nDominion University \r\nRedeemers University \r\nBells University of technology \r\nCrawford University \r\nBaze University \r\nCrawford University \r\nBaze University \r\nABUAD \r\nCovenant University \r\nElizade University \r\nAnchor University ', 'Post-UTME-2020-List-Of-Schools-That-Have-Released-Forms', 'false', '', '2020-09-16 15:31:05'),
(41, 'Latest JAMB Brochure For All Institutions', 'The official JAMB brochure shows you a list of courses offered in various institutions, their JAMB UTME, O\'level and Direct Entry subject combination, and requirements for entry into those courses, in various faculties across all institutions in Nigeria. You can also download the PDF Version of the JAMB Brochure here, and It\'s all Totally Free!\r\n\r\nClick on the link below\r\n\r\nhttp://api.whatsapp.com/send?phone=2348037647164\r\n', 'Latest-JAMB-Brochure-For-All-Institutions', 'false', '', '2020-09-16 15:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `olevelgradeslist`
--

DROP TABLE IF EXISTS `olevelgradeslist`;
CREATE TABLE IF NOT EXISTS `olevelgradeslist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grade` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `olevelgradeslist`
--

INSERT INTO `olevelgradeslist` (`id`, `grade`) VALUES
(1, 'A.R.\r'),
(2, 'A1\r'),
(3, 'A2\r'),
(4, 'B2\r'),
(5, 'A3\r'),
(6, 'B3\r'),
(7, 'C4\r'),
(8, 'C5\r'),
(9, 'C6\r'),
(10, 'P7\r'),
(11, 'D7\r'),
(12, 'P8\r'),
(13, 'E8\r'),
(14, 'F9\r'),
(15, 'Others\r'),
(16, 'A'),
(17, 'B'),
(18, 'C'),
(19, 'D'),
(20, 'E');

-- --------------------------------------------------------

--
-- Table structure for table `olevelsubjectslist`
--

DROP TABLE IF EXISTS `olevelsubjectslist`;
CREATE TABLE IF NOT EXISTS `olevelsubjectslist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `olevelsubjectslist`
--

INSERT INTO `olevelsubjectslist` (`id`, `subject`) VALUES
(1, 'Agricultural Science\r'),
(2, 'Applied Electricity\r'),
(3, 'Arabic Language\r'),
(4, 'Auto Mechanics\r'),
(5, 'Biology\r'),
(6, 'Building Construction \r'),
(7, 'Chemistry\r'),
(8, 'Christian Religious Studies \r'),
(9, 'Commerce\r'),
(10, 'Computer Studies\r'),
(11, 'Economics\r'),
(12, 'Electronics\r'),
(13, 'English Language\r'),
(14, 'Financial Accounting\r'),
(15, 'Food and Nutrition\r'),
(16, 'French\r'),
(17, 'Further Mathematics\r'),
(18, 'General Mathematics\r'),
(19, 'Geography\r'),
(20, 'Government\r'),
(21, 'Hausa\r'),
(22, 'Health Science\r'),
(23, 'History\r'),
(24, 'Home Management\r'),
(25, 'Igbo\r'),
(26, 'Islamic Studies\r'),
(27, 'Literature in English\r'),
(28, 'Metal Work\r'),
(29, 'Music\r'),
(30, 'Physical Education\r'),
(31, 'Physics\r'),
(32, 'Shorthand\r'),
(33, 'Social Studies\r'),
(34, 'Technical Drawing\r'),
(35, 'Typewriting\r'),
(36, 'Woodwork\r'),
(37, 'Yoruba\r');

-- --------------------------------------------------------

--
-- Table structure for table `olevel_result`
--

DROP TABLE IF EXISTS `olevel_result`;
CREATE TABLE IF NOT EXISTS `olevel_result` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `form_id` varchar(30) NOT NULL,
  `f_exam_year` varchar(10) NOT NULL,
  `f_exam_type` varchar(20) NOT NULL,
  `f_exam_no` varchar(50) NOT NULL,
  `f_s1` varchar(50) NOT NULL,
  `f_s2` varchar(50) NOT NULL,
  `f_s3` varchar(50) NOT NULL,
  `f_s4` varchar(50) NOT NULL,
  `f_s5` varchar(50) NOT NULL,
  `f_s6` varchar(50) NOT NULL,
  `f_s7` varchar(50) NOT NULL,
  `f_s8` varchar(50) NOT NULL,
  `f_s9` varchar(50) NOT NULL,
  `f_g1` varchar(10) NOT NULL,
  `f_g2` varchar(10) NOT NULL,
  `f_g3` varchar(10) NOT NULL,
  `f_g4` varchar(10) NOT NULL,
  `f_g5` varchar(10) NOT NULL,
  `f_g6` varchar(10) NOT NULL,
  `f_g7` varchar(10) NOT NULL,
  `f_g8` varchar(10) NOT NULL,
  `f_g9` varchar(10) NOT NULL,
  `s_exam_no` varchar(50) NOT NULL,
  `s_exam_year` varchar(50) NOT NULL,
  `s_exam_type` varchar(50) NOT NULL,
  `s_s1` varchar(50) NOT NULL,
  `s_s2` varchar(50) NOT NULL,
  `s_s3` varchar(50) NOT NULL,
  `s_s4` varchar(50) NOT NULL,
  `s_s5` varchar(50) NOT NULL,
  `s_s6` varchar(50) NOT NULL,
  `s_s7` varchar(50) NOT NULL,
  `s_s8` varchar(50) NOT NULL,
  `s_s9` varchar(50) NOT NULL,
  `s_g1` varchar(10) NOT NULL,
  `s_g2` varchar(10) NOT NULL,
  `s_g3` varchar(10) NOT NULL,
  `s_g4` varchar(10) NOT NULL,
  `s_g5` varchar(10) NOT NULL,
  `s_g6` varchar(10) NOT NULL,
  `s_g7` varchar(10) NOT NULL,
  `s_g8` varchar(10) NOT NULL,
  `s_g9` varchar(10) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `olevel_result`
--

INSERT INTO `olevel_result` (`ref_id`, `form_id`, `f_exam_year`, `f_exam_type`, `f_exam_no`, `f_s1`, `f_s2`, `f_s3`, `f_s4`, `f_s5`, `f_s6`, `f_s7`, `f_s8`, `f_s9`, `f_g1`, `f_g2`, `f_g3`, `f_g4`, `f_g5`, `f_g6`, `f_g7`, `f_g8`, `f_g9`, `s_exam_no`, `s_exam_year`, `s_exam_type`, `s_s1`, `s_s2`, `s_s3`, `s_s4`, `s_s5`, `s_s6`, `s_s7`, `s_s8`, `s_s9`, `s_g1`, `s_g2`, `s_g3`, `s_g4`, `s_g5`, `s_g6`, `s_g7`, `s_g8`, `s_g9`, `date`) VALUES
(1, 'LSA/IJMB2015/006', '2014', 'WAEC', '4251506092', 'Further Mathematics\r\n', 'English Language\r\n', 'Geography\r\n', 'Biology\r\n', 'Physics\r\n', 'Chemistry\r\n', 'Technical Drawing\r\n', 'Economics\r\n', 'General Mathematics\r\n', 'D7\r\n', 'B3\r\n', 'A1\r\n', 'C5\r\n', 'C4\r\n', 'B3\r\n', 'C6\r\n', 'B3\r\n', 'B3\r\n', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1439571765'),
(2, 'LSA/IJMB2015/046', '2013', 'WAEC', '4251462163', 'Commerce\r\n', 'Financial Accounting\r\n', 'Economics\r\n', 'Government\r\n', 'English Language\r\n', 'Yoruba\r\n', 'General Mathematics\r\n', 'Agricultural Science\r\n', 'Biology\r\n', 'C6\r\n', 'B3\r\n', 'C5\r\n', 'C4\r\n', 'C6\r\n', 'C6\r\n', 'C6\r\n', 'C4\r\n', 'C6\r\n', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1440419824'),
(3, 'LSA/IJMB2015/058', '2013', 'WAEC', '4251462163', 'Commerce\r\n', 'Financial Accounting\r\n', 'Economics\r\n', 'Government\r\n', 'English Language\r\n', 'Yoruba\r\n', 'General Mathematics\r\n', 'Agricultural Science\r\n', 'Biology\r\n', 'C6\r\n', 'B3\r\n', 'C5\r\n', 'C4\r\n', 'C6\r\n', 'C6\r\n', 'C6\r\n', 'C4\r\n', 'C6\r\n', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1440520884'),
(4, 'LSA/IJMB2015/025', '2013', 'NECO', '30184628HI', 'English Language\r\n', 'General Mathematics\r\n', 'Christian Religious Studies \r\n', 'Economics\r\n', 'Government\r\n', 'Literature in English\r\n', 'Biology\r\n', 'Agricultural Science\r\n', '', 'C6\r\n', 'E8\r\n', 'C5\r\n', 'C6\r\n', 'C6\r\n', 'C5\r\n', 'C5\r\n', 'C6\r\n', '', '34011196', '2014', 'NABTEB', 'General Mathematics\r\n', '', '', '', '', '', '', '', '', 'C5\r\n', '', '', '', '', '', '', '', '', '1440607519');

-- --------------------------------------------------------

--
-- Table structure for table `payment_attempttb`
--

DROP TABLE IF EXISTS `payment_attempttb`;
CREATE TABLE IF NOT EXISTS `payment_attempttb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `regno` varchar(20) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `other_name` varchar(50) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `trans_id` varchar(50) NOT NULL,
  `payment_desc` varchar(400) NOT NULL,
  `fee_code` varchar(20) NOT NULL,
  `bank_charges` decimal(12,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `response_code` varchar(5) DEFAULT NULL,
  `response_desc` text,
  `card_number` varchar(5) DEFAULT NULL,
  `pay_ref` text,
  `ret_ref` text,
  `leadbank_cbncode` text,
  `leadbank_name` varchar(50) DEFAULT NULL,
  `trans_date` text NOT NULL,
  `session` varchar(10) DEFAULT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `new_course_desired` varchar(50) DEFAULT NULL,
  `mode_of_entry` varchar(20) DEFAULT NULL,
  `choice` varchar(10) DEFAULT NULL,
  `json_val` text NOT NULL,
  PRIMARY KEY (`payment_desc`,`regno`) USING BTREE,
  UNIQUE KEY `id` (`id`),
  KEY `session` (`session`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_fee_setup`
--

DROP TABLE IF EXISTS `payment_fee_setup`;
CREATE TABLE IF NOT EXISTS `payment_fee_setup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fee_code` varchar(50) NOT NULL,
  `fee_name` varchar(250) DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`fee_code`) USING BTREE,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_fee_setup`
--

INSERT INTO `payment_fee_setup` (`id`, `fee_code`, `fee_name`, `status`) VALUES
(1, 'WIN_FEE_001', 'Application Form', 'Active'),
(2, 'WIN_FEE_002', 'Exam Fee', 'Active'),
(3, 'WIN_FEE_003', 'Acceptance Fee', 'Active'),
(4, 'WIN_FEE_004', 'Tuition Fee', 'Active'),
(5, 'WIN_FEE_005', 'Hostel Fee', 'Active'),
(6, 'WIN_FEE_006', 'Textbooks', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `payment_setup`
--

DROP TABLE IF EXISTS `payment_setup`;
CREATE TABLE IF NOT EXISTS `payment_setup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fee_code` varchar(50) NOT NULL,
  `prog_id` varchar(10) NOT NULL,
  `loc_id` varchar(20) NOT NULL,
  `fee_amount` decimal(12,2) DEFAULT NULL,
  `fee_status` enum('Active','Inactive') DEFAULT 'Active',
  `end_date` date NOT NULL,
  `time` time NOT NULL,
  `entry_by` varchar(100) NOT NULL,
  `level` enum('100','200','300','400','500','600','700','All') NOT NULL DEFAULT 'All',
  PRIMARY KEY (`fee_code`,`prog_id`,`loc_id`) USING BTREE,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_setup`
--

INSERT INTO `payment_setup` (`id`, `fee_code`, `prog_id`, `loc_id`, `fee_amount`, `fee_status`, `end_date`, `time`, `entry_by`, `level`) VALUES
(26, 'WIN_FEE_001', 'Prog-01', 'WIN_LOC_002', '226.00', 'Active', '2023-08-31', '17:56:23', 'koldaf20@gmail.com', 'All'),
(8, 'WIN_FEE_001', 'Prog-01', 'WIN_LOC_004', '8000.00', 'Active', '2023-08-31', '17:52:36', 'koldaf20@gmail.com', 'All'),
(80, 'WIN_FEE_001', 'Prog-02', 'WIN_LOC_003', '9287472.00', 'Active', '2023-08-31', '18:09:57', 'koldaf20@gmail.com', 'All'),
(62, 'WIN_FEE_001', 'Prog-02', 'WIN_LOC_005', '7736.00', 'Active', '2023-08-31', '18:05:23', 'koldaf20@gmail.com', 'All'),
(38, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_001', '78.00', 'Active', '2023-08-31', '18:01:03', 'koldaf20@gmail.com', 'All'),
(92, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_002', '828263.00', 'Active', '2023-08-31', '18:14:12', 'koldaf20@gmail.com', 'All'),
(68, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_008', '38497.00', 'Active', '2023-08-31', '18:06:00', 'koldaf20@gmail.com', 'All'),
(74, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_009', '92827.00', 'Active', '2023-08-31', '18:07:38', 'koldaf20@gmail.com', 'All'),
(86, 'WIN_FEE_001', 'Prog-05', 'WIN_LOC_004', '997373.00', 'Active', '2023-08-31', '18:12:01', 'koldaf20@gmail.com', 'All'),
(50, 'WIN_FEE_001', 'Prog-05', 'WIN_LOC_006', '826290.00', 'Active', '2023-08-31', '18:03:58', 'koldaf20@gmail.com', 'All'),
(20, 'WIN_FEE_001', 'Prog-05', 'WIN_LOC_009', '827329.00', 'Active', '2023-08-31', '17:55:35', 'koldaf20@gmail.com', 'All'),
(27, 'WIN_FEE_002', 'Prog-01', 'WIN_LOC_002', '98263.00', 'Active', '2023-08-31', '17:56:23', 'koldaf20@gmail.com', 'All'),
(9, 'WIN_FEE_002', 'Prog-01', 'WIN_LOC_004', '839090.00', 'Active', '2023-08-31', '17:52:36', 'koldaf20@gmail.com', 'All'),
(81, 'WIN_FEE_002', 'Prog-02', 'WIN_LOC_003', '3388937.00', 'Active', '2023-08-31', '18:09:57', 'koldaf20@gmail.com', 'All'),
(63, 'WIN_FEE_002', 'Prog-02', 'WIN_LOC_005', '373649.00', 'Active', '2023-08-31', '18:05:23', 'koldaf20@gmail.com', 'All'),
(39, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_001', '920082.00', 'Active', '2023-08-31', '18:01:03', 'koldaf20@gmail.com', 'All'),
(93, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_002', '973638.00', 'Active', '2023-08-31', '18:14:12', 'koldaf20@gmail.com', 'All'),
(69, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_008', '736363.00', 'Active', '2023-08-31', '18:06:00', 'koldaf20@gmail.com', 'All'),
(75, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_009', '283749.00', 'Active', '2023-08-31', '18:07:38', 'koldaf20@gmail.com', 'All'),
(87, 'WIN_FEE_002', 'Prog-05', 'WIN_LOC_004', '87636.00', 'Active', '2023-08-31', '18:12:01', 'koldaf20@gmail.com', 'All'),
(51, 'WIN_FEE_002', 'Prog-05', 'WIN_LOC_006', '2726438.00', 'Active', '2023-08-31', '18:03:58', 'koldaf20@gmail.com', 'All'),
(21, 'WIN_FEE_002', 'Prog-05', 'WIN_LOC_009', '7292736.00', 'Active', '2023-08-31', '17:55:35', 'koldaf20@gmail.com', 'All'),
(25, 'WIN_FEE_003', 'Prog-01', 'WIN_LOC_002', '245.00', 'Active', '2023-08-31', '17:56:23', 'koldaf20@gmail.com', 'All'),
(7, 'WIN_FEE_003', 'Prog-01', 'WIN_LOC_004', '30000.00', 'Active', '2023-08-31', '17:52:36', 'koldaf20@gmail.com', 'All'),
(79, 'WIN_FEE_003', 'Prog-02', 'WIN_LOC_003', '124367.00', 'Active', '2023-08-31', '18:09:57', 'koldaf20@gmail.com', 'All'),
(61, 'WIN_FEE_003', 'Prog-02', 'WIN_LOC_005', '256739.00', 'Active', '2023-08-31', '18:05:22', 'koldaf20@gmail.com', 'All'),
(37, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_001', '633873.00', 'Active', '2023-08-31', '18:01:03', 'koldaf20@gmail.com', 'All'),
(91, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_002', '42637.00', 'Active', '2023-08-31', '18:14:12', 'koldaf20@gmail.com', 'All'),
(67, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_008', '253738.00', 'Active', '2023-08-31', '18:06:00', 'koldaf20@gmail.com', 'All'),
(73, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_009', '4527.00', 'Active', '2023-08-31', '18:07:38', 'koldaf20@gmail.com', 'All'),
(85, 'WIN_FEE_003', 'Prog-05', 'WIN_LOC_004', '63996.00', 'Active', '2023-08-31', '18:12:01', 'koldaf20@gmail.com', 'All'),
(49, 'WIN_FEE_003', 'Prog-05', 'WIN_LOC_006', '123456.00', 'Active', '2023-08-31', '18:03:58', 'koldaf20@gmail.com', 'All'),
(19, 'WIN_FEE_003', 'Prog-05', 'WIN_LOC_009', '62770.00', 'Active', '2023-08-31', '17:55:35', 'koldaf20@gmail.com', 'All'),
(30, 'WIN_FEE_004', 'Prog-01', 'WIN_LOC_002', '6353.00', 'Active', '2023-08-31', '17:56:23', 'koldaf20@gmail.com', 'All'),
(12, 'WIN_FEE_004', 'Prog-01', 'WIN_LOC_004', '8383974.00', 'Active', '2023-08-31', '17:52:36', 'koldaf20@gmail.com', 'All'),
(84, 'WIN_FEE_004', 'Prog-02', 'WIN_LOC_003', '76337.00', 'Active', '2023-08-31', '18:09:57', 'koldaf20@gmail.com', 'All'),
(66, 'WIN_FEE_004', 'Prog-02', 'WIN_LOC_005', '8339.00', 'Active', '2023-08-31', '18:05:23', 'koldaf20@gmail.com', 'All'),
(42, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_001', '7727.00', 'Active', '2023-08-31', '18:01:04', 'koldaf20@gmail.com', 'All'),
(96, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_002', '73737.00', 'Active', '2023-08-31', '18:14:12', 'koldaf20@gmail.com', 'All'),
(72, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_008', '774647.00', 'Active', '2023-08-31', '18:06:00', 'koldaf20@gmail.com', 'All'),
(78, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_009', '2764.00', 'Active', '2023-08-31', '18:07:38', 'koldaf20@gmail.com', 'All'),
(90, 'WIN_FEE_004', 'Prog-05', 'WIN_LOC_004', '27277.00', 'Active', '2023-08-31', '18:12:01', 'koldaf20@gmail.com', 'All'),
(54, 'WIN_FEE_004', 'Prog-05', 'WIN_LOC_006', '27220.00', 'Active', '2023-08-31', '18:03:58', 'koldaf20@gmail.com', 'All'),
(24, 'WIN_FEE_004', 'Prog-05', 'WIN_LOC_009', '376363.00', 'Active', '2023-08-31', '17:55:35', 'koldaf20@gmail.com', 'All'),
(28, 'WIN_FEE_005', 'Prog-01', 'WIN_LOC_002', '62526.00', 'Active', '2023-08-31', '17:56:23', 'koldaf20@gmail.com', 'All'),
(10, 'WIN_FEE_005', 'Prog-01', 'WIN_LOC_004', '838399.00', 'Active', '2023-08-31', '17:52:36', 'koldaf20@gmail.com', 'All'),
(82, 'WIN_FEE_005', 'Prog-02', 'WIN_LOC_003', '2726648.00', 'Active', '2023-08-31', '18:09:57', 'koldaf20@gmail.com', 'All'),
(64, 'WIN_FEE_005', 'Prog-02', 'WIN_LOC_005', '737370.00', 'Active', '2023-08-31', '18:05:23', 'koldaf20@gmail.com', 'All'),
(40, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_001', '7276.00', 'Active', '2023-08-31', '18:01:03', 'koldaf20@gmail.com', 'All'),
(94, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_002', '2636.00', 'Active', '2023-08-31', '18:14:12', 'koldaf20@gmail.com', 'All'),
(70, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_008', '2736469.00', 'Active', '2023-08-31', '18:06:00', 'koldaf20@gmail.com', 'All'),
(76, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_009', '374649.00', 'Active', '2023-08-31', '18:07:38', 'koldaf20@gmail.com', 'All'),
(88, 'WIN_FEE_005', 'Prog-05', 'WIN_LOC_004', '7533788.00', 'Active', '2023-08-31', '18:12:01', 'koldaf20@gmail.com', 'All'),
(52, 'WIN_FEE_005', 'Prog-05', 'WIN_LOC_006', '262738.00', 'Active', '2023-08-31', '18:03:58', 'koldaf20@gmail.com', 'All'),
(22, 'WIN_FEE_005', 'Prog-05', 'WIN_LOC_009', '36637.00', 'Active', '2023-08-31', '17:55:35', 'koldaf20@gmail.com', 'All'),
(29, 'WIN_FEE_006', 'Prog-01', 'WIN_LOC_002', '93635.00', 'Active', '2023-08-31', '17:56:23', 'koldaf20@gmail.com', 'All'),
(11, 'WIN_FEE_006', 'Prog-01', 'WIN_LOC_004', '8383939.00', 'Active', '2023-08-31', '17:52:36', 'koldaf20@gmail.com', 'All'),
(83, 'WIN_FEE_006', 'Prog-02', 'WIN_LOC_003', '737382.00', 'Active', '2023-08-31', '18:09:57', 'koldaf20@gmail.com', 'All'),
(65, 'WIN_FEE_006', 'Prog-02', 'WIN_LOC_005', '7373083.00', 'Active', '2023-08-31', '18:05:23', 'koldaf20@gmail.com', 'All'),
(41, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_001', '2727873.00', 'Active', '2023-08-31', '18:01:04', 'koldaf20@gmail.com', 'All'),
(95, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_002', '26334.00', 'Active', '2023-08-31', '18:14:12', 'koldaf20@gmail.com', 'All'),
(71, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_008', '373840.00', 'Active', '2023-08-31', '18:06:00', 'koldaf20@gmail.com', 'All'),
(77, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_009', '27377.00', 'Active', '2023-08-31', '18:07:38', 'koldaf20@gmail.com', 'All'),
(89, 'WIN_FEE_006', 'Prog-05', 'WIN_LOC_004', '6635510.00', 'Active', '2023-08-31', '18:12:01', 'koldaf20@gmail.com', 'All'),
(53, 'WIN_FEE_006', 'Prog-05', 'WIN_LOC_006', '7262738.00', 'Active', '2023-08-31', '18:03:58', 'koldaf20@gmail.com', 'All'),
(23, 'WIN_FEE_006', 'Prog-05', 'WIN_LOC_009', '26347.00', 'Active', '2023-08-31', '17:55:35', 'koldaf20@gmail.com', 'All');

-- --------------------------------------------------------

--
-- Table structure for table `payment_setupsss`
--

DROP TABLE IF EXISTS `payment_setupsss`;
CREATE TABLE IF NOT EXISTS `payment_setupsss` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fee_code` varchar(50) NOT NULL,
  `prog_id` varchar(10) NOT NULL,
  `loc_id` varchar(20) NOT NULL,
  `fee_amount` decimal(12,2) DEFAULT NULL,
  `fee_status` enum('Active','Inactive') DEFAULT 'Active',
  `end_date` date NOT NULL,
  `level` enum('100','200','300','400','500','600','700','All') NOT NULL DEFAULT 'All',
  PRIMARY KEY (`fee_code`,`prog_id`,`loc_id`) USING BTREE,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_setupsss`
--

INSERT INTO `payment_setupsss` (`id`, `fee_code`, `prog_id`, `loc_id`, `fee_amount`, `fee_status`, `end_date`, `level`) VALUES
(1, 'WIN_FEE_001', 'Prog-01', 'WIN_LOC_001', '5000.00', 'Active', '0000-00-00', ''),
(2, 'WIN_FEE_001', 'Prog-01', 'WIN_LOC_002', '5000.00', 'Active', '0000-00-00', ''),
(3, 'WIN_FEE_001', 'Prog-01', 'WIN_LOC_003', '5000.00', 'Active', '0000-00-00', ''),
(4, 'WIN_FEE_001', 'Prog-01', 'WIN_LOC_004', '5000.00', 'Active', '0000-00-00', ''),
(5, 'WIN_FEE_001', 'Prog-01', 'WIN_LOC_005', '5000.00', 'Active', '0000-00-00', ''),
(6, 'WIN_FEE_001', 'Prog-01', 'WIN_LOC_006', '5000.00', 'Active', '0000-00-00', ''),
(7, 'WIN_FEE_001', 'Prog-01', 'WIN_LOC_007', '5000.00', 'Active', '0000-00-00', ''),
(8, 'WIN_FEE_001', 'Prog-01', 'WIN_LOC_008', '5000.00', 'Active', '0000-00-00', ''),
(9, 'WIN_FEE_001', 'Prog-01', 'WIN_LOC_009', '5000.00', 'Active', '0000-00-00', ''),
(10, 'WIN_FEE_001', 'Prog-01', 'WIN_LOC_010', '5000.00', 'Active', '0000-00-00', ''),
(11, 'WIN_FEE_001', 'Prog-01', 'WIN_LOC_011', '8000.00', 'Active', '0000-00-00', ''),
(67, 'WIN_FEE_001', 'Prog-02', 'WIN_LOC_001', '10000.00', 'Active', '0000-00-00', ''),
(68, 'WIN_FEE_001', 'Prog-02', 'WIN_LOC_002', '10000.00', 'Active', '0000-00-00', ''),
(69, 'WIN_FEE_001', 'Prog-02', 'WIN_LOC_003', '10000.00', 'Active', '0000-00-00', ''),
(70, 'WIN_FEE_001', 'Prog-02', 'WIN_LOC_004', '10000.00', 'Active', '0000-00-00', ''),
(71, 'WIN_FEE_001', 'Prog-02', 'WIN_LOC_005', '10000.00', 'Active', '0000-00-00', ''),
(72, 'WIN_FEE_001', 'Prog-02', 'WIN_LOC_006', '10000.00', 'Active', '0000-00-00', ''),
(73, 'WIN_FEE_001', 'Prog-02', 'WIN_LOC_007', '10000.00', 'Active', '0000-00-00', ''),
(74, 'WIN_FEE_001', 'Prog-02', 'WIN_LOC_008', '10000.00', 'Active', '0000-00-00', ''),
(75, 'WIN_FEE_001', 'Prog-02', 'WIN_LOC_009', '10000.00', 'Active', '0000-00-00', ''),
(76, 'WIN_FEE_001', 'Prog-02', 'WIN_LOC_010', '10000.00', 'Active', '0000-00-00', ''),
(77, 'WIN_FEE_001', 'Prog-02', 'WIN_LOC_011', '10000.00', 'Active', '0000-00-00', ''),
(133, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_001', '5000.00', 'Active', '0000-00-00', ''),
(134, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_002', '5000.00', 'Active', '0000-00-00', ''),
(135, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_003', '5000.00', 'Active', '0000-00-00', ''),
(136, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_004', '5000.00', 'Active', '0000-00-00', ''),
(137, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_005', '5000.00', 'Active', '0000-00-00', ''),
(138, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_006', '5000.00', 'Active', '0000-00-00', ''),
(139, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_007', '5000.00', 'Active', '0000-00-00', ''),
(140, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_008', '5000.00', 'Active', '0000-00-00', ''),
(141, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_009', '5000.00', 'Active', '0000-00-00', ''),
(142, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_010', '5000.00', 'Active', '0000-00-00', ''),
(143, 'WIN_FEE_001', 'Prog-03', 'WIN_LOC_011', '5000.00', 'Active', '0000-00-00', ''),
(12, 'WIN_FEE_002', 'Prog-01', 'WIN_LOC_001', '50000.00', 'Active', '0000-00-00', ''),
(13, 'WIN_FEE_002', 'Prog-01', 'WIN_LOC_002', '50000.00', 'Active', '0000-00-00', ''),
(14, 'WIN_FEE_002', 'Prog-01', 'WIN_LOC_003', '50000.00', 'Active', '0000-00-00', ''),
(15, 'WIN_FEE_002', 'Prog-01', 'WIN_LOC_004', '50000.00', 'Active', '0000-00-00', ''),
(16, 'WIN_FEE_002', 'Prog-01', 'WIN_LOC_005', '50000.00', 'Active', '0000-00-00', ''),
(17, 'WIN_FEE_002', 'Prog-01', 'WIN_LOC_006', '50000.00', 'Active', '0000-00-00', ''),
(18, 'WIN_FEE_002', 'Prog-01', 'WIN_LOC_007', '50000.00', 'Active', '0000-00-00', ''),
(19, 'WIN_FEE_002', 'Prog-01', 'WIN_LOC_008', '50000.00', 'Active', '0000-00-00', ''),
(20, 'WIN_FEE_002', 'Prog-01', 'WIN_LOC_009', '50000.00', 'Active', '0000-00-00', ''),
(21, 'WIN_FEE_002', 'Prog-01', 'WIN_LOC_010', '50000.00', 'Active', '0000-00-00', ''),
(22, 'WIN_FEE_002', 'Prog-01', 'WIN_LOC_011', '50000.00', 'Active', '0000-00-00', ''),
(78, 'WIN_FEE_002', 'Prog-02', 'WIN_LOC_001', '80000.00', 'Active', '0000-00-00', ''),
(79, 'WIN_FEE_002', 'Prog-02', 'WIN_LOC_002', '80000.00', 'Active', '0000-00-00', ''),
(80, 'WIN_FEE_002', 'Prog-02', 'WIN_LOC_003', '80000.00', 'Active', '0000-00-00', ''),
(81, 'WIN_FEE_002', 'Prog-02', 'WIN_LOC_004', '90000.00', 'Active', '0000-00-00', ''),
(82, 'WIN_FEE_002', 'Prog-02', 'WIN_LOC_005', '90000.00', 'Active', '0000-00-00', ''),
(83, 'WIN_FEE_002', 'Prog-02', 'WIN_LOC_006', '90000.00', 'Active', '0000-00-00', ''),
(84, 'WIN_FEE_002', 'Prog-02', 'WIN_LOC_007', '80000.00', 'Active', '0000-00-00', ''),
(85, 'WIN_FEE_002', 'Prog-02', 'WIN_LOC_008', '80000.00', 'Active', '0000-00-00', ''),
(86, 'WIN_FEE_002', 'Prog-02', 'WIN_LOC_009', '90000.00', 'Active', '0000-00-00', ''),
(87, 'WIN_FEE_002', 'Prog-02', 'WIN_LOC_010', '80000.00', 'Active', '0000-00-00', ''),
(88, 'WIN_FEE_002', 'Prog-02', 'WIN_LOC_011', '80000.00', 'Active', '0000-00-00', ''),
(144, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_001', '30000.00', 'Active', '0000-00-00', ''),
(145, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_002', '30000.00', 'Active', '0000-00-00', ''),
(146, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_003', '30000.00', 'Active', '0000-00-00', ''),
(147, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_004', '30000.00', 'Active', '0000-00-00', ''),
(148, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_005', '30000.00', 'Active', '0000-00-00', ''),
(149, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_006', '30000.00', 'Active', '0000-00-00', ''),
(150, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_007', '30000.00', 'Active', '0000-00-00', ''),
(151, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_008', '30000.00', 'Active', '0000-00-00', ''),
(152, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_009', '30000.00', 'Active', '0000-00-00', ''),
(153, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_010', '30000.00', 'Active', '0000-00-00', ''),
(154, 'WIN_FEE_002', 'Prog-03', 'WIN_LOC_011', '30000.00', 'Active', '0000-00-00', ''),
(23, 'WIN_FEE_003', 'Prog-01', 'WIN_LOC_001', '20000.00', 'Active', '0000-00-00', ''),
(24, 'WIN_FEE_003', 'Prog-01', 'WIN_LOC_002', '20000.00', 'Active', '0000-00-00', ''),
(25, 'WIN_FEE_003', 'Prog-01', 'WIN_LOC_003', '20000.00', 'Active', '0000-00-00', ''),
(26, 'WIN_FEE_003', 'Prog-01', 'WIN_LOC_004', '20000.00', 'Active', '0000-00-00', ''),
(27, 'WIN_FEE_003', 'Prog-01', 'WIN_LOC_005', '20000.00', 'Active', '0000-00-00', ''),
(28, 'WIN_FEE_003', 'Prog-01', 'WIN_LOC_006', '20000.00', 'Active', '0000-00-00', ''),
(29, 'WIN_FEE_003', 'Prog-01', 'WIN_LOC_007', '20000.00', 'Active', '0000-00-00', ''),
(30, 'WIN_FEE_003', 'Prog-01', 'WIN_LOC_008', '20000.00', 'Active', '0000-00-00', ''),
(31, 'WIN_FEE_003', 'Prog-01', 'WIN_LOC_009', '20000.00', 'Active', '0000-00-00', ''),
(32, 'WIN_FEE_003', 'Prog-01', 'WIN_LOC_010', '20000.00', 'Active', '0000-00-00', ''),
(33, 'WIN_FEE_003', 'Prog-01', 'WIN_LOC_011', '20000.00', 'Active', '0000-00-00', ''),
(89, 'WIN_FEE_003', 'Prog-02', 'WIN_LOC_001', '20000.00', 'Active', '0000-00-00', ''),
(90, 'WIN_FEE_003', 'Prog-02', 'WIN_LOC_002', '20000.00', 'Active', '0000-00-00', ''),
(91, 'WIN_FEE_003', 'Prog-02', 'WIN_LOC_003', '20000.00', 'Active', '0000-00-00', ''),
(92, 'WIN_FEE_003', 'Prog-02', 'WIN_LOC_004', '20000.00', 'Active', '0000-00-00', ''),
(93, 'WIN_FEE_003', 'Prog-02', 'WIN_LOC_005', '20000.00', 'Active', '0000-00-00', ''),
(94, 'WIN_FEE_003', 'Prog-02', 'WIN_LOC_006', '20000.00', 'Active', '0000-00-00', ''),
(95, 'WIN_FEE_003', 'Prog-02', 'WIN_LOC_007', '20000.00', 'Active', '0000-00-00', ''),
(96, 'WIN_FEE_003', 'Prog-02', 'WIN_LOC_008', '20000.00', 'Active', '0000-00-00', ''),
(97, 'WIN_FEE_003', 'Prog-02', 'WIN_LOC_009', '20000.00', 'Active', '0000-00-00', ''),
(98, 'WIN_FEE_003', 'Prog-02', 'WIN_LOC_010', '20000.00', 'Active', '0000-00-00', ''),
(99, 'WIN_FEE_003', 'Prog-02', 'WIN_LOC_011', '20000.00', 'Active', '0000-00-00', ''),
(155, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_001', '20000.00', 'Active', '0000-00-00', ''),
(156, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_002', '20000.00', 'Active', '0000-00-00', ''),
(157, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_003', '20000.00', 'Active', '0000-00-00', ''),
(158, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_004', '20000.00', 'Active', '0000-00-00', ''),
(159, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_005', '20000.00', 'Active', '0000-00-00', ''),
(160, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_006', '20000.00', 'Active', '0000-00-00', ''),
(161, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_007', '20000.00', 'Active', '0000-00-00', ''),
(162, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_008', '20000.00', 'Active', '0000-00-00', ''),
(163, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_009', '20000.00', 'Active', '0000-00-00', ''),
(164, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_010', '20000.00', 'Active', '0000-00-00', ''),
(165, 'WIN_FEE_003', 'Prog-03', 'WIN_LOC_011', '20000.00', 'Active', '0000-00-00', ''),
(34, 'WIN_FEE_004', 'Prog-01', 'WIN_LOC_001', '60000.00', 'Active', '0000-00-00', ''),
(35, 'WIN_FEE_004', 'Prog-01', 'WIN_LOC_002', '100000.00', 'Active', '0000-00-00', ''),
(36, 'WIN_FEE_004', 'Prog-01', 'WIN_LOC_003', '50000.00', 'Active', '0000-00-00', ''),
(37, 'WIN_FEE_004', 'Prog-01', 'WIN_LOC_004', '100000.00', 'Active', '0000-00-00', ''),
(38, 'WIN_FEE_004', 'Prog-01', 'WIN_LOC_005', '65000.00', 'Active', '0000-00-00', ''),
(39, 'WIN_FEE_004', 'Prog-01', 'WIN_LOC_006', '100000.00', 'Active', '0000-00-00', ''),
(40, 'WIN_FEE_004', 'Prog-01', 'WIN_LOC_007', '60000.00', 'Active', '0000-00-00', ''),
(41, 'WIN_FEE_004', 'Prog-01', 'WIN_LOC_008', '50000.00', 'Active', '0000-00-00', ''),
(42, 'WIN_FEE_004', 'Prog-01', 'WIN_LOC_009', '65000.00', 'Active', '0000-00-00', ''),
(43, 'WIN_FEE_004', 'Prog-01', 'WIN_LOC_010', '50000.00', 'Active', '0000-00-00', ''),
(44, 'WIN_FEE_004', 'Prog-01', 'WIN_LOC_011', '60000.00', 'Active', '0000-00-00', ''),
(100, 'WIN_FEE_004', 'Prog-02', 'WIN_LOC_001', '100000.00', 'Active', '0000-00-00', ''),
(101, 'WIN_FEE_004', 'Prog-02', 'WIN_LOC_002', '120000.00', 'Active', '0000-00-00', ''),
(102, 'WIN_FEE_004', 'Prog-02', 'WIN_LOC_003', '90000.00', 'Active', '0000-00-00', ''),
(103, 'WIN_FEE_004', 'Prog-02', 'WIN_LOC_004', '120000.00', 'Active', '0000-00-00', ''),
(104, 'WIN_FEE_004', 'Prog-02', 'WIN_LOC_005', '100000.00', 'Active', '0000-00-00', ''),
(105, 'WIN_FEE_004', 'Prog-02', 'WIN_LOC_006', '100000.00', 'Active', '0000-00-00', ''),
(106, 'WIN_FEE_004', 'Prog-02', 'WIN_LOC_007', '100000.00', 'Active', '0000-00-00', ''),
(107, 'WIN_FEE_004', 'Prog-02', 'WIN_LOC_008', '90000.00', 'Active', '0000-00-00', ''),
(108, 'WIN_FEE_004', 'Prog-02', 'WIN_LOC_009', '100000.00', 'Active', '0000-00-00', ''),
(109, 'WIN_FEE_004', 'Prog-02', 'WIN_LOC_010', '90000.00', 'Active', '0000-00-00', ''),
(110, 'WIN_FEE_004', 'Prog-02', 'WIN_LOC_011', '100000.00', 'Active', '0000-00-00', ''),
(166, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_001', '40000.00', 'Active', '0000-00-00', ''),
(167, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_002', '80000.00', 'Active', '0000-00-00', ''),
(168, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_003', '30000.00', 'Active', '0000-00-00', ''),
(169, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_004', '80000.00', 'Active', '0000-00-00', ''),
(170, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_005', '45000.00', 'Active', '0000-00-00', ''),
(171, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_006', '80000.00', 'Active', '0000-00-00', ''),
(172, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_007', '40000.00', 'Active', '0000-00-00', ''),
(173, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_008', '30000.00', 'Active', '0000-00-00', ''),
(174, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_009', '45000.00', 'Active', '0000-00-00', ''),
(175, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_010', '30000.00', 'Active', '0000-00-00', ''),
(176, 'WIN_FEE_004', 'Prog-03', 'WIN_LOC_011', '40000.00', 'Active', '0000-00-00', ''),
(45, 'WIN_FEE_005', 'Prog-01', 'WIN_LOC_001', '35000.00', 'Active', '0000-00-00', ''),
(46, 'WIN_FEE_005', 'Prog-01', 'WIN_LOC_002', '70000.00', 'Active', '0000-00-00', ''),
(47, 'WIN_FEE_005', 'Prog-01', 'WIN_LOC_003', '30000.00', 'Active', '0000-00-00', ''),
(48, 'WIN_FEE_005', 'Prog-01', 'WIN_LOC_004', '50000.00', 'Active', '0000-00-00', ''),
(49, 'WIN_FEE_005', 'Prog-01', 'WIN_LOC_005', '40000.00', 'Active', '0000-00-00', ''),
(50, 'WIN_FEE_005', 'Prog-01', 'WIN_LOC_006', '40000.00', 'Active', '0000-00-00', ''),
(51, 'WIN_FEE_005', 'Prog-01', 'WIN_LOC_007', '35000.00', 'Active', '0000-00-00', ''),
(52, 'WIN_FEE_005', 'Prog-01', 'WIN_LOC_008', '30000.00', 'Active', '0000-00-00', ''),
(53, 'WIN_FEE_005', 'Prog-01', 'WIN_LOC_009', '40000.00', 'Active', '0000-00-00', ''),
(54, 'WIN_FEE_005', 'Prog-01', 'WIN_LOC_010', '30000.00', 'Active', '0000-00-00', ''),
(55, 'WIN_FEE_005', 'Prog-01', 'WIN_LOC_011', '35000.00', 'Active', '0000-00-00', ''),
(111, 'WIN_FEE_005', 'Prog-02', 'WIN_LOC_001', '35000.00', 'Active', '0000-00-00', ''),
(112, 'WIN_FEE_005', 'Prog-02', 'WIN_LOC_002', '70000.00', 'Active', '0000-00-00', ''),
(113, 'WIN_FEE_005', 'Prog-02', 'WIN_LOC_003', '30000.00', 'Active', '0000-00-00', ''),
(114, 'WIN_FEE_005', 'Prog-02', 'WIN_LOC_004', '50000.00', 'Active', '0000-00-00', ''),
(115, 'WIN_FEE_005', 'Prog-02', 'WIN_LOC_005', '40000.00', 'Active', '0000-00-00', ''),
(116, 'WIN_FEE_005', 'Prog-02', 'WIN_LOC_006', '40000.00', 'Active', '0000-00-00', ''),
(117, 'WIN_FEE_005', 'Prog-02', 'WIN_LOC_007', '35000.00', 'Active', '0000-00-00', ''),
(118, 'WIN_FEE_005', 'Prog-02', 'WIN_LOC_008', '30000.00', 'Active', '0000-00-00', ''),
(119, 'WIN_FEE_005', 'Prog-02', 'WIN_LOC_009', '40000.00', 'Active', '0000-00-00', ''),
(120, 'WIN_FEE_005', 'Prog-02', 'WIN_LOC_010', '30000.00', 'Active', '0000-00-00', ''),
(121, 'WIN_FEE_005', 'Prog-02', 'WIN_LOC_011', '35000.00', 'Active', '0000-00-00', ''),
(177, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_001', '35000.00', 'Active', '0000-00-00', ''),
(178, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_002', '70000.00', 'Active', '0000-00-00', ''),
(179, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_003', '30000.00', 'Active', '0000-00-00', ''),
(180, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_004', '50000.00', 'Active', '0000-00-00', ''),
(181, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_005', '40000.00', 'Active', '0000-00-00', ''),
(182, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_006', '40000.00', 'Active', '0000-00-00', ''),
(183, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_007', '35000.00', 'Active', '0000-00-00', ''),
(184, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_008', '30000.00', 'Active', '0000-00-00', ''),
(185, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_009', '40000.00', 'Active', '0000-00-00', ''),
(186, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_010', '30000.00', 'Active', '0000-00-00', ''),
(187, 'WIN_FEE_005', 'Prog-03', 'WIN_LOC_011', '35000.00', 'Active', '0000-00-00', ''),
(56, 'WIN_FEE_006', 'Prog-01', 'WIN_LOC_001', '20000.00', 'Active', '0000-00-00', ''),
(57, 'WIN_FEE_006', 'Prog-01', 'WIN_LOC_002', '20000.00', 'Active', '0000-00-00', ''),
(58, 'WIN_FEE_006', 'Prog-01', 'WIN_LOC_003', '20000.00', 'Active', '0000-00-00', ''),
(59, 'WIN_FEE_006', 'Prog-01', 'WIN_LOC_004', '20000.00', 'Active', '0000-00-00', ''),
(60, 'WIN_FEE_006', 'Prog-01', 'WIN_LOC_005', '20000.00', 'Active', '0000-00-00', ''),
(61, 'WIN_FEE_006', 'Prog-01', 'WIN_LOC_006', '20000.00', 'Active', '0000-00-00', ''),
(62, 'WIN_FEE_006', 'Prog-01', 'WIN_LOC_007', '20000.00', 'Active', '0000-00-00', ''),
(63, 'WIN_FEE_006', 'Prog-01', 'WIN_LOC_008', '20000.00', 'Active', '0000-00-00', ''),
(64, 'WIN_FEE_006', 'Prog-01', 'WIN_LOC_009', '20000.00', 'Active', '0000-00-00', ''),
(65, 'WIN_FEE_006', 'Prog-01', 'WIN_LOC_010', '20000.00', 'Active', '0000-00-00', ''),
(66, 'WIN_FEE_006', 'Prog-01', 'WIN_LOC_011', '20000.00', 'Active', '0000-00-00', ''),
(122, 'WIN_FEE_006', 'Prog-02', 'WIN_LOC_001', '20000.00', 'Active', '0000-00-00', ''),
(123, 'WIN_FEE_006', 'Prog-02', 'WIN_LOC_002', '20000.00', 'Active', '0000-00-00', ''),
(124, 'WIN_FEE_006', 'Prog-02', 'WIN_LOC_003', '20000.00', 'Active', '0000-00-00', ''),
(125, 'WIN_FEE_006', 'Prog-02', 'WIN_LOC_004', '20000.00', 'Active', '0000-00-00', ''),
(126, 'WIN_FEE_006', 'Prog-02', 'WIN_LOC_005', '20000.00', 'Active', '0000-00-00', ''),
(127, 'WIN_FEE_006', 'Prog-02', 'WIN_LOC_006', '20000.00', 'Active', '0000-00-00', ''),
(128, 'WIN_FEE_006', 'Prog-02', 'WIN_LOC_007', '20000.00', 'Active', '0000-00-00', ''),
(129, 'WIN_FEE_006', 'Prog-02', 'WIN_LOC_008', '20000.00', 'Active', '0000-00-00', ''),
(130, 'WIN_FEE_006', 'Prog-02', 'WIN_LOC_009', '20000.00', 'Active', '0000-00-00', ''),
(131, 'WIN_FEE_006', 'Prog-02', 'WIN_LOC_010', '20000.00', 'Active', '0000-00-00', ''),
(132, 'WIN_FEE_006', 'Prog-02', 'WIN_LOC_011', '20000.00', 'Active', '0000-00-00', ''),
(188, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_001', '20000.00', 'Active', '0000-00-00', ''),
(189, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_002', '20000.00', 'Active', '0000-00-00', ''),
(190, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_003', '20000.00', 'Active', '0000-00-00', ''),
(191, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_004', '20000.00', 'Active', '0000-00-00', ''),
(192, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_005', '20000.00', 'Active', '0000-00-00', ''),
(193, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_006', '20000.00', 'Active', '0000-00-00', ''),
(194, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_007', '20000.00', 'Active', '0000-00-00', ''),
(195, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_008', '20000.00', 'Active', '0000-00-00', ''),
(196, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_009', '20000.00', 'Active', '0000-00-00', ''),
(197, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_010', '20000.00', 'Active', '0000-00-00', ''),
(198, 'WIN_FEE_006', 'Prog-03', 'WIN_LOC_011', '20000.00', 'Active', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `payment_transactiontb`
--

DROP TABLE IF EXISTS `payment_transactiontb`;
CREATE TABLE IF NOT EXISTS `payment_transactiontb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trans_id` varchar(50) NOT NULL,
  `payment_desc` text NOT NULL,
  `pay_item_id` varchar(5) NOT NULL,
  `regno` varchar(20) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `bank_charges` decimal(12,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `response_code` varchar(5) NOT NULL,
  `response_desc` text NOT NULL,
  `card_number` varchar(5) NOT NULL,
  `pay_ref` text NOT NULL,
  `ret_ref` text NOT NULL,
  `leadbank_cbncode` text NOT NULL,
  `leadbank_name` varchar(50) NOT NULL,
  `trans_date` text NOT NULL,
  `semester` varchar(5) NOT NULL,
  `session` varchar(10) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `json_val` text NOT NULL,
  `level` varchar(10) NOT NULL,
  PRIMARY KEY (`trans_id`,`pay_item_id`,`regno`,`session`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `programmetb`
--

DROP TABLE IF EXISTS `programmetb`;
CREATE TABLE IF NOT EXISTS `programmetb` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `prog_name` varchar(50) NOT NULL,
  `prog_id` varchar(10) NOT NULL,
  `prog_duration` varchar(50) NOT NULL COMMENT 'In Months',
  `prog_description` text NOT NULL,
  `prog_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`prog_id`) USING BTREE,
  UNIQUE KEY `ref_id` (`ref_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `programmetb`
--

INSERT INTO `programmetb` (`ref_id`, `prog_name`, `prog_id`, `prog_duration`, `prog_description`, `prog_status`) VALUES
(1, 'IJMB', 'Prog-01', '8', 'This is an eight month programme...', 'Active'),
(2, 'JUPEB', 'Prog-02', '8', 'This is an eight month programme...', 'Active'),
(3, 'NABTEB', 'Prog-03', '8', 'This is an eight month programme...', 'Active'),
(4, 'Cambridge', 'Prog-04', '8', 'This is an eight month programme...', 'Inactive'),
(5, 'CAILS-KWASU', 'Prog-05', '9', 'The Foundation Diploma Program at CAILS-KWASU is a 9-month accelerated programme that awards diplomas in a number of disciplines. After completing this programme, students will move directly into the 200-level of their chosen speciality to pursue their degree', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `role_menu`
--

DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE IF NOT EXISTS `role_menu` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `menu_caption` varchar(250) NOT NULL,
  `cmd` varchar(250) NOT NULL COMMENT 'Posting Get parameters',
  `link` varchar(250) NOT NULL,
  `role_id` varchar(250) NOT NULL,
  `order_id` varchar(3) NOT NULL,
  `tip` varchar(250) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  PRIMARY KEY (`ref_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_menu`
--

INSERT INTO `role_menu` (`ref_id`, `menu_caption`, `cmd`, `link`, `role_id`, `order_id`, `tip`, `status`) VALUES
(1, 'Payments', 'validate', 'accounts.php', 'role_01', '1', 'Process Payment', 'active'),
(2, 'Print Successful payment', 'print-payment', 'print-payment', 'role_01', '2', 'Print all successful payment', 'inactive'),
(3, 'News ', 'upload-news', 'uploadnews.php', 'role_03', '1', 'Upload News', 'active'),
(4, 'Manage Uploaded News', 'manage-news', 'uploadnews.php', 'role_03', '2', 'Edit or Delete Uploaded News', 'active'),
(5, 'Events Upload', 'event-upload', 'event-upload', 'role_03', '3', 'Upload Events like workshop, conferences, training, etc...', 'inactive'),
(6, 'Manage Registration', 'manage-reg', 'manage-reg', 'role_03', '4', 'Assign Roles to Users', 'active'),
(7, 'Tracks', 'print-reg', 'print-reg', 'role_01', '3', 'Print COnference Registration Tracks', 'inactive'),
(8, 'Meal Ticket', 'meal', 'meal', 'role_05', '1', 'Print Meal Ticket', 'inactive'),
(9, 'Conferences', 'conferences', 'conferences.php', 'role_05', '5', 'Manage conference', 'active'),
(10, 'Conference Registration', 'conference_reg', 'conference_reg.php', 'role_05', '2', 'Preview conference registration', 'inactive'),
(11, 'Change Password', 'PasswordManagement', 'changepwd.php', 'role_04', '7', 'Change Password', 'active'),
(12, 'My Profile', 'Profiles', 'profile.php', 'role_04', '1', 'View Profile', 'active'),
(13, 'Create Conference', 'conferences', 'uploadconference.php', 'role_05', '1', 'Set Up a new conference event', 'active'),
(14, 'Membership Directory', 'mem_dir', 'mem_dir.php', 'role_05', '4', 'View the membership directory', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `role_tbl`
--

DROP TABLE IF EXISTS `role_tbl`;
CREATE TABLE IF NOT EXISTS `role_tbl` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `role_id` varchar(10) NOT NULL,
  `role` varchar(50) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`role_id`),
  KEY `ref_id` (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_tbl`
--

INSERT INTO `role_tbl` (`ref_id`, `role_id`, `role`, `status`) VALUES
(1, 'role_01', 'Account Officer', 'inactive'),
(2, 'role_02', 'Journal Manager', 'inactive'),
(3, 'role_03', 'Site Manager', 'active'),
(4, 'role_04', 'Members', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `setting` varchar(20) NOT NULL,
  `value` varchar(100) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`ref_id`, `setting`, `value`, `status`) VALUES
(1, 'session', '2020/2021', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `state_id` varchar(10) NOT NULL,
  `state_name` varchar(50) NOT NULL,
  PRIMARY KEY (`state_id`),
  UNIQUE KEY `id` (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`ref_id`, `state_id`, `state_name`) VALUES
(2, '1', 'Abia  '),
(11, '10', 'Delta  '),
(12, '11', 'Ebonyi  '),
(13, '12', 'Edo  '),
(14, '13', 'Ekiti  '),
(15, '14', 'Enugu  '),
(16, '15', 'Federal Capital Territory '),
(17, '16', 'Gombe  '),
(18, '17', 'Imo  '),
(19, '18', 'Jigawa  '),
(20, '19', 'Kaduna  '),
(3, '2', 'Adamawa  '),
(21, '20', 'Kano  '),
(22, '21', 'Katsina  '),
(23, '22', 'Kebbi  '),
(24, '23', 'Kogi  '),
(25, '24', 'Kwara  '),
(26, '25', 'Lagos  '),
(27, '26', 'Nasarawa  '),
(28, '27', 'Niger  '),
(29, '28', 'Ogun  '),
(30, '29', 'Ondo  '),
(4, '3', 'Akwa Ibom  '),
(31, '30', 'Osun  '),
(32, '31', 'Oyo  '),
(33, '32', 'Plateau  '),
(34, '33', 'Rivers  '),
(35, '34', 'Sokoto  '),
(36, '35', 'Taraba  '),
(37, '36', 'Yobe  '),
(38, '37', 'Zamfara  '),
(5, '4', 'Anambra  '),
(6, '5', 'Bauchi  '),
(7, '6', 'Bayelsa  '),
(8, '7', 'Benue  '),
(9, '8', 'Borno  '),
(10, '9', 'Cross River  ');

-- --------------------------------------------------------

--
-- Table structure for table `studenttb`
--

DROP TABLE IF EXISTS `studenttb`;
CREATE TABLE IF NOT EXISTS `studenttb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appno` varchar(50) NOT NULL,
  `regno` varchar(50) NOT NULL,
  `title` varchar(15) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `other_name` varchar(50) NOT NULL,
  `mailing_address` text NOT NULL,
  `contact_address` varchar(150) NOT NULL,
  `date_of_birth` date NOT NULL,
  `place_of_birth` varchar(70) NOT NULL,
  `marital_status` varchar(8) NOT NULL,
  `religion` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `nationality` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state_id` varchar(50) NOT NULL,
  `lga_id` varchar(50) NOT NULL,
  `tel_no` varchar(20) NOT NULL,
  `prog_id` varchar(10) NOT NULL,
  `specialization` varchar(150) NOT NULL,
  `level_of_entry` varchar(20) NOT NULL,
  `mode_of_study` varchar(20) NOT NULL,
  `mode_of_entry` varchar(20) NOT NULL,
  `session_of_entry` varchar(10) DEFAULT NULL,
  `studentship_category` varchar(20) NOT NULL DEFAULT 'Local',
  `disability` varchar(50) NOT NULL,
  `disability_reason` text NOT NULL,
  `pix` varchar(50) DEFAULT NULL,
  `signature` varchar(50) NOT NULL,
  `spouse_surname` varchar(30) NOT NULL,
  `spouse_first_name` varchar(30) NOT NULL,
  `spouse_other_name` varchar(30) NOT NULL,
  `spouse_address` text NOT NULL,
  `guardian_name` varchar(100) NOT NULL,
  `guardian_address` varchar(100) NOT NULL,
  `guardian_phone` varchar(20) NOT NULL,
  `guardian_email` varchar(100) NOT NULL,
  `guardian_relationship` varchar(50) NOT NULL,
  `kin_name` varchar(100) NOT NULL,
  `kin_address` varchar(100) NOT NULL,
  `kin_relationship` varchar(50) NOT NULL,
  `kin_phone` varchar(20) NOT NULL,
  `kin_email` varchar(100) NOT NULL,
  `sponsor_name` varchar(70) NOT NULL,
  `sponsor_address` varchar(100) NOT NULL,
  `sponsor_phone` varchar(20) NOT NULL,
  `sponsor_email` varchar(50) NOT NULL,
  `extra_curricular` varchar(100) NOT NULL,
  `old_matric_number` varchar(20) DEFAULT NULL,
  `remedial_no` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `last_login_date` varchar(50) NOT NULL,
  `last_login_time` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Active',
  `online_status` enum('Off','On') NOT NULL DEFAULT 'Off',
  `entry_by` varchar(50) NOT NULL,
  PRIMARY KEY (`regno`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `studenttb`
--

INSERT INTO `studenttb` (`id`, `appno`, `regno`, `title`, `surname`, `first_name`, `other_name`, `mailing_address`, `contact_address`, `date_of_birth`, `place_of_birth`, `marital_status`, `religion`, `email`, `sex`, `nationality`, `country`, `state_id`, `lga_id`, `tel_no`, `prog_id`, `specialization`, `level_of_entry`, `mode_of_study`, `mode_of_entry`, `session_of_entry`, `studentship_category`, `disability`, `disability_reason`, `pix`, `signature`, `spouse_surname`, `spouse_first_name`, `spouse_other_name`, `spouse_address`, `guardian_name`, `guardian_address`, `guardian_phone`, `guardian_email`, `guardian_relationship`, `kin_name`, `kin_address`, `kin_relationship`, `kin_phone`, `kin_email`, `sponsor_name`, `sponsor_address`, `sponsor_phone`, `sponsor_email`, `extra_curricular`, `old_matric_number`, `remedial_no`, `password`, `last_login_date`, `last_login_time`, `status`, `online_status`, `entry_by`) VALUES
(108, 'CAILS/AP2017/0001', 'CAILS/AP2017/0001', '', 'YAHAYA', 'Muhammed al-ameen', 'Modibbo', '', '7, ABOKI CLOSE, IREWOLEDE HOUSING ESTATE, ILORIN, KWARA STATE', '2001-04-10', 'ILORIN', '', 'Islam', 'abolajiyahaya@yahoo.com', 'Male', 'Nigerian', 'Nigeria', '24', '495', '07012786314', 'DAF', '', 'DIP I', '', 'DIPLOMA', '2016/2017', '', 'No', '', 'pictures/cailsap20170001.jpg', 'pictures/cailsap20170001_sign.jpg', '', '', '', '', 'MALLAM ABDULLATEEF YAHAYA', '7, ABOKI CLOSE, IREWOLEDE HOUSING ESTATE, ILORIN, KWARA STATE', '09084665290', 'abdullateefyahaya11@gmail.com', 'FATHER', 'MALLAM ABDULLATEEF YAHAYA', '7, ABOKI CLOSE, IREWOLEDE HOUSING ESTATE, ILORIN, KWARA STATE', 'FATHER', '09084665290', 'abdullateefyahaya11@gmail.com', 'MALLAM ABDULLATEEF YAHAYA', '7, ABOKI CLOSE, IREWOLEDE HOUSING ESTATE, ILORIN, KWARA STATE', '09084665290', 'abdullateefyahaya11@gmail.com', '', '', '', 'YAHAYA', 'Sunday, October 07, 2018', '04:24:20 am', 'Active', 'Off', '');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

DROP TABLE IF EXISTS `testimonial`;
CREATE TABLE IF NOT EXISTS `testimonial` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `pix` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testimonial`
--

INSERT INTO `testimonial` (`ref_id`, `name`, `content`, `pix`, `date`, `status`) VALUES
(1, 'Olawale Koledafe', 'This is my story, I tell it wherever I go... Meet winners academy, they are brilliant.', 'testimonial/1586166850DSC_0777 passport.jpg', '2020-04-06', 'Inactive'),
(2, 'Otemuyiwa', 'Testimonials should include the person\'s name, title, company and picture. The least credible testimonials include just the person\'s initials. Compare these examples: The testimonial text is the same.', 'testimonial/158616885412341308_1112165112149749_5923361735754689813_n.jpg', '2020-04-06', 'Inactive'),
(3, 'koldaf TellAviv', 'A PHP script can be used with a HTML form to allow users to upload files to the server. Initially files are uploaded into a temporary directory and then relocated to a target destination by a PHP script. The user opens the page containing a HTML form featuring a text files, a browse button and a submit button.\r\n\r\nHere are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. Here are some of the jargons. ', 'testimonial/1586173341918012364249.jpg', '2020-04-06', 'Inactive'),
(4, 'Samson Opeyemi', 'Registration was very reliable and easy to access. Am so happy it came out great. ', 'testimonial/1586296771IMG_20200405_183414_5_91546.jpg', '2020-04-07', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
CREATE TABLE IF NOT EXISTS `university` (
  `ref_id` int NOT NULL COMMENT 'University number',
  `university_name` varchar(56) NOT NULL,
  `website` varchar(39) NOT NULL,
  `year_founded` varchar(12) NOT NULL,
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='List of all universities in Nigeria with their website';

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`ref_id`, `university_name`, `website`, `year_founded`) VALUES
(1, 'Abubakar Tafawa Balewa University, Bauchi', 'http://www.atbu.edu.ng ', '1988'),
(2, 'Adeyemi University of Education, Ondo', '', '2015'),
(3, 'Ahmadu Bello University, Zaria', 'http://www.abu.edu.ng ', '1962'),
(4, 'Alvan Ikoku University of Education, Owerri', '', '2015'),
(5, 'Bayero University,Kano', 'http://www.buk.edu.ng ', '1975'),
(6, 'Federal University Gashua', 'www.fugashua.edu.ng ', '2013'),
(7, 'Federal University of Education, Kano', '', '2015'),
(8, 'Federal University of Education, Zaria', '', '2015'),
(9, 'Federal University of Health Sciences, Otukpo', '', '2015'),
(10, 'Federal University of Petroleum Resources, Effurun', 'http://www.fupre.edu.ng ', '2007'),
(11, 'Federal University of Technology, Akure', 'http://www.futa.edu.ng ', '1981'),
(12, 'Federal University of Technology, Minna.', 'http://www.futminna.edu.ng ', '1982'),
(13, 'Federal University of Technology, Owerri', 'http://www.futo.edu.ng ', '1980'),
(14, 'Federal University, Dutse, Jigawa State', 'http://www.fud.edu.ng/ ', '2011'),
(15, 'Federal University, Dutsin-Ma, Katsina', 'http://www.fudutsinma.edu.ng ', '2011'),
(16, 'Federal University, Kashere, Gombe State', 'www.fukashere.edu.ng ', '2011'),
(17, 'Federal University, Lafia, Nasarawa State', 'http://www.fulafia.edu.ng ', '2011'),
(18, 'Federal University, Lokoja, Kogi State', 'http://www.fulokoja.edu.ng ', '2011'),
(19, 'Federal University, Ndufu-Alike, Ebonyi State', 'http://www.funai.edu.ng ', '2011'),
(20, 'Federal University, Otuoke, Bayelsa', 'http://www.fuotuoke.edu.ng/ ', '2011'),
(21, 'Federal University, Oye-Ekiti, Ekiti State', 'http://www.fuoye.edu.ng/ ', '2011'),
(22, 'Federal University, Wukari, Taraba State', 'http://www.fuwukari.edu.ng/ ', '2011'),
(23, 'Federal University,Birnin Kebbi.', 'www.fubk.edu.ng ', '2013'),
(24, 'Federal University,Gusau.', 'www.fugus.edu.ng ', '2013'),
(25, 'Michael Okpara Uni. of Agric., Umudike', 'http://www.moua.org ', '1992'),
(26, 'Achievers University, Owo', 'http://www.achievers.edu.ng ', '2007'),
(27, 'Adeleke University,Ede.', 'http://www.adelekeuniversity.edu.ng ', '2011'),
(28, 'Afe Babalola University, Ado-Ekiti - Ekiti State', 'http://www.abuad.edu.ng ', '2009'),
(29, 'African University of Science & Technology, Abuja', 'http://aust-abuja.org ', '2007'),
(30, 'Ajayi Crowther University, Ibadan', 'http://www.acu.edu.ng ', '2005'),
(31, 'Al-Hikmah University, Ilorin', 'https://www.alhikmah.edu.ng ', '2005'),
(32, 'Al-Qalam University, Katsina', 'http://www.auk.edu.ng ', '2005'),
(33, 'American University of Nigeria, Yola', 'http://www.aun.edu.ng ', '2003'),
(34, 'Augustine University', '', '2015'),
(35, 'Babcock University,Ilishan-Remo', 'http://www.babcock.edu.ng ', '1999'),
(36, 'Baze University', 'http://www.bazeuniversity.edu.ng ', '2011'),
(37, 'Bells University of Technology, Otta', 'http://www.bellsuniversity.org ', '2005'),
(38, 'Benson Idahosa University,Benin City', 'http://www.idahosauniversity.com ', '2002'),
(39, 'Bingham University, New Karu', 'http://www.binghamuni.edu.ng ', '2005'),
(40, 'Bowen University, Iwo', 'http://www.bowenuniversity-edu.org ', '2001'),
(41, 'Caleb University, Lagos', 'http://www.calebuniversity.edu.ng ', '2007'),
(42, 'Caritas University, Enugu', 'http://www.caritasuni.edu.ng/ ', '2005'),
(43, 'CETEP City University, Lagos', 'http://www.cetepuniversity.com ', '2005'),
(44, 'Chrisland University', '', '2015'),
(45, 'Christopher University', '', '2015'),
(46, 'Covenant University Ota', 'http://www.covenantuniversity.edu.ng/ ', '2002'),
(47, 'Crawford University Igbesa', 'http://www.crawforduniversity.edu.ng ', '2005'),
(48, 'Crescent University,', 'http://www.crescent-university.edu.ng ', '2005'),
(49, 'Edwin Clark University, Kaigbodo', '', '2015'),
(50, 'Elizade University, Ilara-Mokin', 'http://www.elizadeuniversity.edu.ng ', '2012'),
(51, 'Evangel University, Akaeze', '', '2012'),
(52, 'Fountain Unveristy,Oshogbo', 'http://www.fountainuniversity.edu.ng ', '2007'),
(53, 'Godfrey Okoye University, Ugwuomu-Nike - Enugu State', '', '2009'),
(54, 'Gregory University, Uturu', 'http://www.gregoryuniversity.com ', '2012'),
(55, 'Hallmark University', '', '2015'),
(56, 'Hezekiah University, Umudi', '', '2015'),
(57, 'Igbinedion University Okada', 'http://www.iuokada.edu.ng ', '1999'),
(58, 'Joseph Ayo Babalola University, Ikeji-Arakeji', 'http://www.jabu.edu.ng ', '2006'),
(59, 'Kings University', '', '2015'),
(60, 'Kwararafa University, Wukari', 'http://www.wukarijubileeuniversity.org ', '2005'),
(61, 'Landmark University,Omu-Aran.', 'http://www.lmu.edu.ng ', '2011'),
(62, 'Lead City University, Ibadan', 'http://www.lcu.edu.ng ', '2005'),
(63, 'Madonna University, Okija', 'http://www.madonnauniversity.edu.ng ', '1999'),
(64, 'Mcpherson University, Seriki Sotayo, Ajebo', 'www.mcu.edu.ng ', '2012'),
(65, 'Micheal & Cecilia University', '', '2015'),
(66, 'Mountain Top University', '', '2015'),
(67, 'Nigerian-Turkish Nile University, Abuja', 'http://www.ntnu.edu.ng ', '2009'),
(68, 'Novena University, Ogume', 'http://www.novenauniversity.edu.ng ', '2005'),
(69, 'Obong University, Obong Ntak', 'http://www.obonguniversity.net ', '2007'),
(70, 'Oduduwa University, Ipetumodu - Osun State', 'http://www.oduduwauniversity.edu.ng ', '2009'),
(71, 'Pan-African University, Lagos', 'http://www.pau.edu.ng ', '2002'),
(72, 'Paul University, Awka - Anambra State', 'http://www.pauluniversity.edu.ng ', '2009'),
(73, 'Redeemer\'s University, Mowe', 'http://www.run.edu.ng ', '2005'),
(74, 'Renaissance University,Enugu', 'http://www.renaissanceuniversityng.com ', '2005'),
(75, 'Rhema University, Obeama-Asa - Rivers State', '', '2009'),
(76, 'Ritman University', '', '2015'),
(77, 'Salem University,Lokoja', 'http://www.salemuniversity.org ', '2007'),
(78, 'Samuel Adegboyega University,Ogwa.', '', '2011'),
(79, 'Southwestern University, Oku Owa', '', '2012'),
(80, 'Summit University', '', '2015'),
(81, 'Tansian University,Umunya', 'http://www.tansian-edu.com ', '2007'),
(82, 'University of Mkar, Mkar', 'http://www.unimkar.edu.ng ', '2005'),
(83, 'Veritas University', 'http://www.veritas.edu.ng ', '2007'),
(84, 'Wellspring University, Evbuobanosa - Edo State', 'http://www.wellspringuniversity.net ', '2009'),
(85, 'Wesley Univ. of Science & Tech.,Ondo', 'http://www.wusto.edu.ng ', '2007'),
(86, 'Western Delta University, Oghara', 'http://www.wduniversity.net ', '2007'),
(87, 'Modibbo Adama University of Technology, Yola', 'http://www.futy.edu.ng ', '1988'),
(88, 'National Open University of Nigeria, Lagos.', 'http://www.nou.edu.ng ', '2002'),
(89, 'Nigeria Maritime University, Okerenkoko', '', '2015'),
(90, 'Nigeria Police Academy Wudil', 'www.npf.gov.ng ', '2012'),
(91, 'Nigerian Defence Academy,Kaduna', 'www.nda.edu.ng ', '1985'),
(92, 'Nnamdi Azikiwe University, Awka', 'http://www.unizik.edu.ng ', '1992'),
(93, 'Obafemi Awolowo University,Ile-Ife', 'http://www.oauife.edu.ng ', '1962'),
(94, 'University of Abuja, Gwagwalada', 'http://www.uniabuja.edu.ng ', '1988'),
(95, 'University of Agriculture, Abeokuta.', 'http://www.unaab.edu.ng ', '1988'),
(96, 'University of Agriculture, Makurdi.', 'http://www.uam.edu.ng ', '1988'),
(97, 'University of Benin', 'http://www.uniben.edu.ng ', '1970'),
(98, 'University of Calabar', 'http://www.unical.edu.ng ', '1975'),
(99, 'University of Ibadan', 'http://www.ui.edu.ng ', '1948'),
(100, 'University of Ilorin', 'http://www.unilorin.edu.ng ', '1975'),
(101, 'University of Jos', 'http://www.unijos.edu.ng ', '1975'),
(102, 'University of Lagos', 'http://www.unilag.edu.ng ', '1962'),
(103, 'University of Maiduguri', 'http://www.unimaid.edu.ng ', '1975'),
(104, 'University of Nigeria, Nsukka', 'http://www.unn.edu.ng ', '1960'),
(105, 'University of Port-Harcourt', 'http://www.uniport.edu.ng ', '1975'),
(106, 'University of Uyo', 'http://www.uniuyo.edu.ng ', '1991'),
(107, 'Usumanu Danfodiyo University', 'http://www.udusok.edu.ng ', '1975'),
(108, 'Lagos State University Ojo, Lagos.', 'http://www.lasunigeria.org ', '1983'),
(109, 'Nasarawa State University, Keffi', 'http://www.nsuk.edu.ng ', '2002'),
(110, 'Niger Delta Unversity, Yenagoa', 'http://www.ndu.edu.ng ', '2000'),
(111, 'Northwest University, Kano', '', '2012'),
(112, 'Olabisi Onabanjo University Ago-Iwoye', 'http://www.oouagoiwoye.edu.ng ', '1982'),
(113, 'Ondo State University of Science & Technology, Okitipupa', 'http://www.osustech.edu.ng ', '2008'),
(114, 'Ondo State Unversity of Medical Sciences', '', '2015'),
(115, 'Osun State University, Oshogbo', 'http://www.uniosun.edu.ng ', '2006'),
(116, 'Plateau State University, Bokkos', 'http://www.plasu.edu.ng ', '2005'),
(117, 'Rivers State University of Science & Technology', 'http://www.ust.edu.ng ', '1979'),
(118, 'Sokoto State University, Sokoto', '', '2009'),
(119, 'Tai Solarin Univ. of Education, Ijebu-Ode', 'http://www.tasued.edu.ng ', '2005'),
(120, 'Taraba State University, Jalingo', 'http://www.tsuniversity.edu.ng ', '2008'),
(121, 'Technical University,Ibadan', '', '2012'),
(122, 'Umaru Musa Yar\'Adua University, Katsina', 'http://www.umyu.edu.ng ', '2006');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(250) NOT NULL,
  `othernames` varchar(250) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ref_id`, `surname`, `othernames`, `email`, `phone`, `password`, `date`, `status`) VALUES
(1, 'Koledafe', 'Olawale', 'koldaf20@gmail.com', '8097946436', 'YmluZ29v', '2017-07-08', 'active'),
(2, 'Abiola', 'Prince', 'info@alevellinks.sch.ng', '07030400348', 'cHJpbmNlMDE=', '2017-07-12', 'active'),
(3, 'Winners', 'Academy', 'admin@winnersacademy.sch.ng', '08037647164', 'QWRtaW5QYXNzd29yZA==', '2020-04-07', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `user_role_tbl`
--

DROP TABLE IF EXISTS `user_role_tbl`;
CREATE TABLE IF NOT EXISTS `user_role_tbl` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `role_id` varchar(50) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`ref_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role_tbl`
--

INSERT INTO `user_role_tbl` (`ref_id`, `email`, `role_id`, `status`) VALUES
(1, 'koldaf20@gmail.com', 'role_01', 'active'),
(2, 'koldaf20@gmail.com', 'role_02', 'active'),
(3, 'koldaf20@gmail.com', 'role_03', 'active'),
(4, 'koldaf20@gmail.com', 'role_04', 'active'),
(5, 'info@alevellinks.sch.ng', 'role_03', 'active');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
