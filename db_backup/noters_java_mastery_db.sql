-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2026 at 08:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `noters_java_mastery_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `password` varchar(500) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `user_code` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `mobile_no`, `password`, `name`, `created_at`, `user_code`) VALUES
(1, 'abd123@gmail.com', '+966567020030', '123123', 'Abd AbuGhazaleh', '2026-02-25 00:35:46', 'e13b9bb0-5224-4990-b586-be7ddc31c0cf'),
(2, 'ahmad@gmail.com', '+96666666666', '123456789', 'Ahmad Issa', '2026-02-25 00:00:00', 'fdebff1c-a9c1-46f2-888c-d6530fae7da3');

-- --------------------------------------------------------

--
-- Table structure for table `user_notes`
--

CREATE TABLE `user_notes` (
  `note_id` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `note_code` varchar(255) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_notes`
--

INSERT INTO `user_notes` (`note_id`, `title`, `note`, `note_code`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 'Demo  222', 'My first demo note 222222', 'abd562ab-2a0c-4792-aec9-afa24602c8d8', 1, '2026-02-27 00:00:00', NULL),
(4, 'Java Basics for Absolute Beginners: Variables, Types, and Control Flow Essentials', 'Java is a statically typed, object-oriented language, which means every variable must declare its type before use. Primitive types include int, double, boolean, and char, while reference types include classes like String and arrays. Execution starts from the main method. Control flow is handled using if, else, switch, for, while, and do-while statements. Java enforces strong type checking at compile time, reducing runtime errors. Code is compiled into bytecode and executed by the JVM, making Java platform-independent. Understanding scope, methods, and basic input/output is essential before moving to advanced topics.', '637935f5-d68c-4f26-ace5-da7cc14edb0c', 1, '2026-02-27 00:00:00', NULL),
(6, 'My ahad note ', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', 'bf03e448-cda0-4874-a435-375916e9d173', 2, '2026-02-27 00:00:00', NULL),
(7, 'after updateqqq', 'my note after update is .... aaaasfasfzzzz', 'c315df1d-fe54-489a-a31f-6816b802e990', 2, '2026-02-27 00:00:00', '2026-02-27 05:34:31'),
(8, 'test test', 'axzf asdgsadg fg f gfsdg fdg ', '338c2d0d-e434-4f88-8eea-4fef5bb973f1', 2, '2026-02-27 00:00:00', NULL),
(9, 'hhhhhhhhhhhhhhhhhh', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzz', 'c000a356-9327-49a9-9b0e-00ab932e01a6', 2, '2026-02-27 00:00:00', '2026-02-27 00:00:00'),
(10, 'sssssssvvvbbb', 'null', '169b41f8-afa7-42f3-a01d-92e3758965fb', 2, '2026-02-27 00:00:00', NULL),
(11, 'eeeeeeeerrrr', 'null', '283526a5-e6cb-4612-9e94-beee4dec2606', 2, '2026-02-27 00:00:00', NULL),
(12, 'eeeeeeeerrrr', 'null', '284e98c8-584d-43eb-8f08-418058ae3936', 2, '2026-02-27 00:00:00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_notes`
--
ALTER TABLE `user_notes`
  ADD PRIMARY KEY (`note_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_notes`
--
ALTER TABLE `user_notes`
  MODIFY `note_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
