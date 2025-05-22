-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 02:30 PM
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
-- Database: `my_boutique`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `created_at`) VALUES
(33, 5, 26, 1, '2025-05-17 23:31:26'),
(34, 5, 27, 1, '2025-05-18 00:33:41'),
(35, 5, 24, 1, '2025-05-18 01:26:30'),
(36, 10, 23, 1, '2025-05-21 10:12:21'),
(37, 10, 22, 1, '2025-05-21 10:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(1, 'Chemises', '2025-05-14 23:40:04'),
(2, 'Pantalons', '2025-05-14 23:40:04'),
(3, 'Vestes', '2025-05-14 23:40:04'),
(4, 'Chaussures', '2025-05-14 23:40:04');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `event_time` datetime DEFAULT NULL,
  `admin_comment` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `image_url`, `status`, `created_by`, `created_at`, `event_time`, `admin_comment`, `updated_at`) VALUES
(1, 'promotion', 'ggood offers', 'uploads/events/68289dbfe9fb7.jpg', 'rejected', 2, '2025-05-17 14:31:27', '2025-04-23 12:30:00', '', '2025-05-17 15:13:28'),
(2, 'promotion', 'free', 'uploads/events/68289e00c4935.jpg', 'approved', 2, '2025-05-17 14:32:33', '2015-03-12 12:30:00', '', '2025-05-17 15:13:17'),
(3, 'promotion', 'batl ya mwaten', 'uploads/events/6828a290daa98.jpg', 'rejected', 4, '2025-05-17 14:52:00', NULL, '', '2025-05-17 15:13:24'),
(4, '123', '134', 'uploads/events/6828a7e7d6d0d.webp', 'rejected', 3, '2025-05-17 15:14:47', NULL, '', '2025-05-17 15:17:53'),
(5, '13', 'EZ', 'uploads/events/682929ee63d46.webp', 'rejected', 4, '2025-05-18 00:29:34', NULL, '', '2025-05-18 00:31:19'),
(6, 'E MARKET', 'WOWO', 'uploads/events/68292a09c6a86.jpeg', 'approved', 4, '2025-05-18 00:30:01', NULL, '', '2025-05-18 00:31:14'),
(7, 'Summer sales', 'free', 'uploads/events/682b1678cfe5c.avif', 'approved', 4, '2025-05-19 11:31:04', NULL, '', '2025-05-19 11:31:33');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `status`, `created_at`, `product_id`, `quantity`) VALUES
(1, 5, 0.00, 'pending', '2025-05-17 17:09:17', 21, 1),
(2, 5, 0.00, 'pending', '2025-05-17 17:10:47', 21, 1),
(3, 5, 0.00, 'pending', '2025-05-17 17:14:37', 21, 1),
(4, 4, 0.00, 'pending', '2025-05-17 17:21:53', 11, 1),
(5, 5, 2000.00, 'pending', '2025-05-17 19:09:24', 24, 1),
(6, 5, 2000.00, 'pending', '2025-05-17 19:15:57', 24, 1),
(7, 5, 2331.00, 'pending', '2025-05-17 19:15:57', 23, 1),
(8, 5, 200.00, 'pending', '2025-05-17 19:15:57', 21, 1),
(9, 5, 2000.00, 'pending', '2025-05-17 19:51:14', 24, 1),
(10, 5, 2331.00, 'pending', '2025-05-17 19:51:16', 23, 1),
(11, 5, 200.00, 'pending', '2025-05-17 19:51:18', 21, 1),
(12, 5, 123.00, 'pending', '2025-05-17 19:51:20', 22, 1),
(13, 4, 400.00, 'pending', '2025-05-17 19:57:12', 21, 2),
(14, 4, 500.00, 'pending', '2025-05-17 19:57:13', 25, 1),
(15, 4, 4000.00, 'pending', '2025-05-17 19:57:13', 24, 2),
(16, 4, 2331.00, 'pending', '2025-05-17 19:57:13', 23, 1),
(17, 4, 123.00, 'pending', '2025-05-17 19:57:13', 22, 1),
(18, 5, 2331.00, 'pending', '2025-05-17 23:30:39', 23, 1),
(19, 5, 2000.00, 'pending', '2025-05-17 23:31:14', 26, 1),
(20, 5, 2331.00, 'pending', '2025-05-17 23:31:19', 23, 1),
(21, 5, 200.00, 'pending', '2025-05-17 23:35:02', 21, 1),
(22, 5, 200.00, 'pending', '2025-05-17 23:35:05', 21, 1),
(23, 5, 200.00, 'pending', '2025-05-17 23:35:10', 21, 1),
(24, 4, 2000.00, 'pending', '2025-05-18 23:27:47', 26, 1),
(25, 10, 2000.00, 'pending', '2025-05-21 11:35:02', 24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `stock`, `image_url`, `created_at`, `updated_at`) VALUES
(21, 1, 'FCB SHIRT', '4', 200.00, 15, 'uploads/products/682888a72b090.jpeg', '2025-05-17 13:02:21', '2025-05-17 23:35:10'),
(22, 2, 'short', 'impermiable', 123.00, 0, 'uploads/products/6828a15a45c67.jpeg', '2025-05-17 14:47:34', '2025-05-17 19:57:13'),
(23, 3, 'arthur vest', 'cool', 2331.00, 0, 'uploads/products/6828d23a2a86d.avif', '2025-05-17 18:15:57', '2025-05-17 23:31:19'),
(24, 4, 'messi boot', 'fine', 2000.00, 0, 'uploads/products/6828d1d343df8.webp', '2025-05-17 18:16:00', '2025-05-21 11:35:02'),
(25, 1, 'ensenble', 'cotuon 100%', 500.00, 4, 'uploads/products/6828e936e5290.jpeg', '2025-05-17 19:54:28', '2025-05-17 19:57:13'),
(26, 3, 'costume black black', 'black black', 2000.00, 0, 'uploads/products/6828eabc6f16e.webp', '2025-05-17 20:08:30', '2025-05-18 23:27:47'),
(27, 1, 'BLUE SUITE', 'COUTON', 299.00, 5, 'uploads/products/6829271b6692f.webp', '2025-05-18 00:17:56', '2025-05-18 00:17:56'),
(28, 3, 'VISTA', 'IMMPERMIABLE', 2000.00, 5, 'uploads/products/682a6d37e2c0c.jpg', '2025-05-18 23:29:13', '2025-05-18 23:29:13');

-- --------------------------------------------------------

--
-- Table structure for table `products_backup`
--

CREATE TABLE `products_backup` (
  `id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_backup`
--

INSERT INTO `products_backup` (`id`, `category_id`, `name`, `description`, `price`, `stock`, `image_url`, `created_at`, `updated_at`) VALUES
(3, 1, 'qq', 'jdida', 200.00, 2, 'uploads/products/6825f7bc02442.jpg', '2025-05-15 14:19:07', '2025-05-15 14:19:07'),
(4, 4, 'ss', '123', 1234.00, 1, 'uploads/products/6825fa73edd75.jpg', '2025-05-15 14:30:33', '2025-05-15 14:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_approvals`
--

CREATE TABLE `product_approvals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `admin_comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_approvals`
--

INSERT INTO `product_approvals` (`id`, `user_id`, `name`, `description`, `price`, `stock`, `category_id`, `image_url`, `status`, `admin_comment`, `created_at`, `updated_at`) VALUES
(1, 3, 'qq', 'jdida', 200.00, 2, 1, 'uploads/products/6825f7bc02442.jpg', 'approved', '', '2025-05-15 14:18:36', '2025-05-15 14:19:07'),
(2, 3, 'ss', '123', 1234.00, 1, 4, 'uploads/products/6825fa73edd75.jpg', 'approved', '', '2025-05-15 14:30:11', '2025-05-15 14:30:33'),
(4, 2, 'ss21', '213', 2134.00, 123, 4, 'uploads/products/6825fb4e54947.jpg', 'approved', '', '2025-05-15 14:33:50', '2025-05-15 14:43:24'),
(5, 2, 'ddd', 'ddd', 2.00, 2, 2, 'uploads/products/6825fddbbf7b1.png', 'approved', '', '2025-05-15 14:44:43', '2025-05-15 14:44:47'),
(6, 2, '1222', '345', 213.00, 2, 4, 'uploads/products/6825ff6c02583.png', 'approved', '', '2025-05-15 14:51:24', '2025-05-15 14:51:34'),
(7, 2, 'olkgjtk', '123', 1245.00, 21, 1, 'uploads/products/6826000e0cb9a.png', 'approved', '', '2025-05-15 14:54:06', '2025-05-15 14:54:15'),
(8, 3, 'tshittts', '124', 1345.00, 12, 1, 'uploads/products/6826015b9cf70.png', 'approved', '', '2025-05-15 14:59:39', '2025-05-15 15:00:05'),
(10, 2, 'ex', '21', 12.00, 2, 2, 'uploads/products/682703950be15.jpg', 'approved', '', '2025-05-16 09:21:25', '2025-05-16 09:21:34'),
(11, 4, 'FCB SHIRT', '4', 200.00, 22, 1, 'uploads/products/682888a72b090.jpeg', 'approved', '', '2025-05-17 13:01:27', '2025-05-17 13:02:21'),
(12, 3, 'short', 'impermiable', 123.00, 2, 2, 'uploads/products/6828a15a45c67.jpeg', 'approved', '', '2025-05-17 14:46:50', '2025-05-17 14:47:34'),
(13, 5, 'messi boot', 'fine', 2000.00, 6, 4, 'uploads/products/6828d1d343df8.webp', 'approved', '', '2025-05-17 18:13:39', '2025-05-17 18:16:00'),
(14, 5, 'arthur vest', 'cool', 2331.00, 5, 3, 'uploads/products/6828d23a2a86d.avif', 'approved', '', '2025-05-17 18:15:22', '2025-05-17 18:15:58'),
(15, 5, 'ensenble', 'cotuon 100%', 500.00, 5, 1, 'uploads/products/6828e936e5290.jpeg', 'approved', '', '2025-05-17 19:53:26', '2025-05-17 19:54:29'),
(16, 4, 'costume black black', 'black black', 2000.00, 2, 3, 'uploads/products/6828eabc6f16e.webp', 'approved', '', '2025-05-17 19:59:56', '2025-05-17 20:08:30'),
(17, 4, 'BLUE SUITE', 'COUTON', 299.00, 5, 1, 'uploads/products/6829271b6692f.webp', 'approved', '', '2025-05-18 00:17:31', '2025-05-18 00:17:56'),
(18, 4, 'VISTA', 'IMMPERMIABLE', 2000.00, 5, 3, 'uploads/products/682a6d37e2c0c.jpg', 'approved', '', '2025-05-18 23:28:55', '2025-05-18 23:29:13');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `created_at`) VALUES
(2, 5, 21, 1, 'ez', '2025-05-17 15:28:09'),
(3, 10, 28, 1, 'NIKMOK', '2025-05-21 10:33:33'),
(4, 10, 23, 4, 'nice', '2025-05-21 11:23:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `credit_card_number` varchar(255) DEFAULT NULL,
  `role` enum('client','it_commercial','admin') DEFAULT 'client',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `address`, `credit_card_number`, `role`, `created_at`, `updated_at`) VALUES
(2, 'Boudjerda', 'Adem', 'kofgame979@gmail.com', '12345', 'Cité 280 logements, Mouzaïa', '', 'admin', '2025-05-15 00:27:14', '2025-05-17 15:37:23'),
(3, 'Boudj', 'Ad', 'bdademo4@gmail.com', '202cb962ac59075b964b07152d234b70', 'Cité 2', '123456', 'admin', '2025-05-15 13:57:40', '2025-05-17 15:40:06'),
(4, 'qww', 'Adem3', 'boudadakam@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'Mouzaia Blida 280 Logement', '', 'it_commercial', '2025-05-15 15:11:36', '2025-05-17 14:43:55'),
(5, 'ademoo', 'Adem2', 'swo2@innovate.com', '$2y$10$Qh0WPEnowpcWQF5iWx0mdexgLfg3JaZiXPkwR.pssXHVgjs.KZ5ja', 'Mouzaia Blida 280 Logement', '', 'client', '2025-05-17 15:16:52', '2025-05-18 23:41:23'),
(10, 'Boudjerda', 'Adem', 'bakibatiho@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'Mouzaia Blida 280 Logement', '00392818', 'client', '2025-05-19 11:27:06', '2025-05-19 11:27:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_approvals`
--
ALTER TABLE `product_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_approvals`
--
ALTER TABLE `product_approvals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_approvals`
--
ALTER TABLE `product_approvals`
  ADD CONSTRAINT `product_approvals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `product_approvals_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
