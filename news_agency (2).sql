-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 19, 2025 at 10:31 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news_agency`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `news_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `comment` text COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('pending','approved') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `news_id`, `user_id`, `comment`, `status`, `created_at`) VALUES
(2, 67, NULL, 'ای بابا', 'approved', '2025-07-13 14:55:05'),
(5, 68, NULL, 'دنیای عجیبی شده', 'approved', '2025-07-15 09:46:28'),
(6, 75, NULL, 'awaliii', 'approved', '2025-07-17 10:52:58'),
(7, 79, NULL, 'عالی', 'approved', '2025-07-18 12:26:27'),
(8, 81, NULL, 'چه عجب', 'pending', '2025-07-19 10:30:39'),
(9, 77, NULL, 'khhhhh', 'pending', '2025-07-19 10:31:08');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` int NOT NULL,
  `author_username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category` enum('politics','sports','art') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'politics',
  `status` enum('approved','pending','rejected') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `author_username` (`author_username`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `author_id`, `author_username`, `image`, `category`, `status`, `created_at`) VALUES
(61, 'برگزاری نمایشگاه نقاشی در نگارخانه سرو', 'هنرمندان خراسان جنوبی در نگارخانه سرو باع اکبریه بیرجند آثار خود را برای بازدید عموم به نمایش گذاشتند.', 11, '', 'http://localhost/NewsAgency/img/zz7.jpeg', 'art', 'approved', '2025-06-25 19:28:38'),
(62, 'برگزاری دوره آموزشی اوریگامی ', 'خردسالان بین 5 تا 14 سال می توانند در دوره شرکت نمایند.', 11, '', 'http://localhost/NewsAgency/img/zz6.jpeg', 'art', 'approved', '2025-06-25 19:30:52'),
(63, 'افتتاح موسسه هنری عرفان ', 'موسسه هنری عرفان واجد شرایط آموزش در بخش های هنری موسیقی ، ویترای، معرق واقع در خیابان شهدا بیرجند افتتاح گردید.', 11, '', 'http://localhost/NewsAgency/img/zz5.jpeg', 'art', 'approved', '2025-06-25 19:37:35'),
(64, 'gh', 'kljnlfsn;', 11, '', 'http://localhost/News Agencyimg/breakingnews.jpg', '', 'approved', '2025-06-25 19:40:35'),
(65, 'راز موفقیت سردار آزمون', 'سردار آزمون در مصاحبه ای راز موفقیت خود را بین کرد : تلاش مداوم و ممارست و امیدواری', 10, '', 'http://localhost/newsAgency/img/ss.jpg', 'sports', 'approved', '2025-06-25 20:50:16'),
(66, 'هنرمندان ایرانی ', 'دسته ای از هنرمندان ایرانی که برای جشنواره هنری به هلند رفته بودند ، بسیار مورد توجه هنرمندان قرار گرفتند.', 10, '', 'http://localhost/NewsAgency/img/zz4.jpeg', 'art', 'approved', '2025-06-25 20:52:48'),
(67, 'توافق نامه  ایران و آمریکا بر سر انرژی هسته ای', 'ایران و کشورهای غربی به توافق جدیدی در مورد برنامه هسته‌ای ایران دست یافتند که شامل کاهش تحریم‌ها است.', 10, '', 'http://localhost/newsAgency/img/iiiii.jpg', 'politics', 'approved', '2025-06-25 21:01:15'),
(68, 'تنش مسئولان نسبت به بحران کم آبی', 'کم‌آبی یکی از بزرگ‌ترین چالش‌های کشاورزی در ایران محسوب می‌شود و کارشناسان نسبت به پیامدهای آن هشدار داده‌اند.', 10, '', 'http://localhost/newsAgency/img/iii.jpg', 'politics', 'approved', '2025-06-25 21:03:18'),
(69, 'موافقت مجلس در جهت اصلاحات قانونی جدید', 'مجلس ایران اصلاحات قانونی جدیدی را در زمینه مالیات‌ها و حمایت از سرمایه‌گذاری خارجی تصویب کرد.', 10, '', 'http://localhost/newsAgency/img/ii.jpg', 'politics', 'approved', '2025-06-25 21:04:42'),
(70, 'پیروزی تیم ملی والیبال ', 'تیم ملی والیبال بانوان ایران در بازی دوستانه مقدماتی دور نهم لیگ قهرمانی آسیا به مصاف کره جنوبی با پیروزی 3-0بر حریف خود مغلوب شدند.', 10, '', 'http://localhost/newsAgency/img/iiii.jpg', 'sports', 'approved', '2025-06-25 21:07:31'),
(71, 'بررسی معماری جدید در مقایسه با معماری قدیم', 'معماری ایرانی یکی از غنی‌ترین سبک‌های معماری در جهان به شمار می‌رود و دارای پیشینه‌ای ارزشمند است.', 10, '', 'http://localhost/NewsAgency/img/zz3.jpeg', 'art', 'approved', '2025-06-25 21:12:36'),
(73, 'برگزاری لیگ برتر فوتبال ساحلی بانوان', 'دور برگشت لیگ برتر فوتبال ساحلی بانوان روز گذشته با سه دیدار در بندرعباس برگزار شد. این دیدارها با نتایج جوانان فارسان ۳ - شهید نوروزی چلیچه ۴ ، شهرداری بندرعباس ۸ - تیم چای ناطق لاهیجان ۷ و سیمان لامرد فارس ۵ - ملوان بندر گز ۳ به پایان رسیدند.', 11, 'tf', 'http://localhost/newsAgency/img/z5.jpeg', 'sports', 'approved', '2025-07-07 17:18:50'),
(74, 'مسابقه دوچرخه سواری بین المللی البرز', 'مسابقه دوچرخه سواری بین المللی البرز، یادواره شهدای کندر، امروز یکشنبه ۳۰ اردیبهشت ماه در انتهای بزرگراه همت غرب (حوزه البرز) آغاز و سپس در روستای کندر به پایان رسید.', 10, '', 'http://localhost/NewsAgency/img/z4.jpeg', 'sports', 'approved', '2025-07-07 17:28:03'),
(75, 'ایلان ماسک باز هم یقه ترامپ را گرفت', 'یلان ماسک بار دیگر با انتشار پستی طعنه‌آمیز درباره یک پرونده جنجالی، به عدم پیگیری قضایی این پرونده از سوی واشنگتن تاخت و به شخص ترامپ حمله کرد.\r\n\r\n', 11, 'ft', 'http://localhost/NewsAgency/img/z2.jpeg', 'politics', 'approved', '2025-07-07 22:34:11'),
(76, 'قدردانی علم‌الهدی از محارب خواندن ترامپ', 'ماینده ولی فقیه در خراسان رضوی با صدور پیامی از فتاوای آیت‌الله «ناصر مکارم شیرازی» و «حسینعلی نوری همدانی» از مراجع تقلید مبنی بر محارب خواندن رییس‌جمهور آمریکا قدردانی و حمایت کرد.', 11, 'ft', 'http://localhost/NewsAgency/img/z1.jpeg', 'politics', 'approved', '2025-07-07 22:37:24'),
(77, 'بازدید میدانی رئیس جمهوری از مجتمع بندری آستارا', 'رئیس جمهوری از مجتمع بندری و منطقه ویژه اقتصادی شهرستان مرزی آستارا در شمال غربی استان گیلان بازدید کرد.', 10, '', 'http://localhost/NewsAgency/img/images.jpeg', 'politics', 'approved', '2025-07-07 22:39:37'),
(78, 'گروسی خواستار نقش‌آفرینی در توافق ایران و آمریکا شد!', 'مدیرکل آژانس بین‌المللی انرژی اتمی در اظهاراتی بدون محکوم کردن حملات آمریکا و رژیم صهیونیستی به ایران، گفت: «با توجه به تخریب بخش قابل توجهی از زیرساخت‌های هسته‌ای ایران، ما هنوز به یک راه حل پایدار برای این مشکل نیاز داریم. این راه حل نمی‌تواند نظامی باشد.»\r\n\r\n', 10, '', 'http://localhost/NewsAgency/img/politic4', 'politics', 'approved', '2025-07-07 22:41:58'),
(79, 'برنامه دیدارهای نهایی لیگ ملت‌های والیبال', 'ا فرا رسیدن روزهای پایانی مرحله گروهی لیگ ملت‌های والیبال ۲۰۲۵، فدراسیون جهانی والیبال (FIVB) برنامه دقیق مسابقات مرحله پایانی این تورنمنت را منتشر کرد.', 11, '', 'http://localhost/NewsAgency/img/z3.jpeg', 'sports', 'approved', '2025-07-07 22:59:11'),
(80, 'پایان نگرانی‌ها درباره مصدومیت ستاره استقلال ', 'حضور جلال‌الدین ماشاریپوف در تمرین روز گذشته استقلال، شایعه مصدومیت جدی او را رد کرد و خیال هواداران را راحت کرد.\r\n\r\n', 12, '', 'http://localhost/NewsAgency/img/steqlal.jpg', 'sports', 'approved', '2025-07-17 09:41:02'),
(81, 'معاون صدا از تلاش رادیویی‌ها تقدیر کرد', 'در پی تحولات اخیر و در کوران عملیات موفق «وعده صادق ۳»، علی بخشی‌زاده، معاون صدای رسانه ملی، با حضور در استودیوهای پخش رادیو، از تلاش‌های بی‌وقفه و متعهدانه کارکنان این رسانه قدردانی کرد.', 12, '', 'http://localhost/NewsAgency/img/zz2.jpeg', 'art', 'approved', '2025-07-17 09:56:17'),
(82, 'ایرانصدا پناهگاه امن کودکان ایران', '\"قصه امیرعلی، قهرمان محله چمران\"؛ روایت حماسه یک نوجوان قهرمان در ایرانصدا منتشر شد.', 12, '', 'http://localhost/NewsAgency/img/zz1.jpeg', 'art', 'approved', '2025-07-17 09:57:25'),
(83, 'محتوای کودک یک پلتفرم رایگان شد', 'در شرایط فعلی یکی از دغدغه‌های مهم خانواده‌ها و مراکز نگهداری کودکان، دور نگه داشتن آنها از اخبار و استرس‌های جنگ است به‌همین منظور پلتفرم فیلم‌نت تمامی محتوای کودک خود را رایگان عرضه می‌کند', 12, '', 'http://localhost/NewsAgency/img/z9.jpeg', 'art', 'approved', '2025-07-17 09:58:31'),
(84, 'حمله ترکیه به ماشین جنگی اسرائیل', 'وزیر خارجه ترکیه با محکوم کردن حملات رژیم صهیونیستی در منطقه و با بیان اینکه جامعه بین‌المللی باید اقدام فوری انجام دهد، گفت: «اسرائیل در تلاش است تا استراتژی تجاوز خود را نه تنها در فلسطین، بلکه در لبنان، سوریه و ایران نیز اجرا کند.»', 12, '', 'http://localhost/NewsAgency/img/z6.jpeg', 'politics', 'approved', '2025-07-17 10:00:26'),
(85, 'تراکتور از سه خرید جدید رونمایی می‌کند', 'باشگاه تراکتور به زودی از سه خرید جدید رونمایی می‌کند.', 12, '', 'http://localhost/NewsAgency/img/z7.jpeg', 'sports', 'approved', '2025-07-17 10:03:13'),
(86, 'دلیل غیبت گلر استقلال در اردوی ترکیه', 'دروازه‌بان جدید استقلال به دلیل مصدومیت در بازی , تا پایان تیرماه نمی‌تواند در تمرینات این تیم شرکت کند .', 12, '', 'http://localhost/NewsAgency/img/z8.jpeg', 'sports', 'approved', '2025-07-17 10:03:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('admin','writer') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'writer',
  `approved` enum('pending','approved','rejected') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `approved`) VALUES
(10, 'فائزه علی پور', 'faezeh@gmail.com', '$2y$10$TspzNC1nareTkGjHWS2cSuXIIa9PKnBKQWyn8be0HVGTax230ipfC', 'admin', 'approved'),
(11, 'سهیلا خرم نیا', 'sohaky19@gmail.com', '$2y$10$NxCOaE9KHLT/en9MhfOzCeHeIGLurjYGPIeg7WeJGokN19/eElLRy', 'admin', 'approved'),
(12, 'zahra', 'zahraadiib2001@gmail.com', '$2y$10$wwnJdvp7gkW4xY3UV8FEoORH5PI7NckcTMOye7iZUhNJbTNMlJw8O', 'writer', 'approved');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
