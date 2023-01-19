-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2023 at 10:16 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_pet_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `p_access_log`
--

CREATE TABLE `p_access_log` (
  `id` int(11) NOT NULL,
  `sessionid` varchar(128) NOT NULL,
  `login_name` varchar(64) NOT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `li` datetime NOT NULL,
  `lo` datetime DEFAULT NULL,
  `account_id` varchar(40) DEFAULT NULL,
  `result` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p_cart`
--

CREATE TABLE `p_cart` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `creation_time` datetime DEFAULT current_timestamp(),
  `last_modified_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `deleted_by` varchar(250) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_cart`
--

INSERT INTO `p_cart` (`id`, `customer_id`, `creation_time`, `last_modified_time`, `is_deleted`, `deleted_by`, `deleted_time`) VALUES
(9, 7, '2023-01-10 12:11:28', '2023-01-10 12:11:28', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `p_cart_item`
--

CREATE TABLE `p_cart_item` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT 0,
  `product_id` int(11) DEFAULT 0,
  `seller_id` int(11) DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `added_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_cart_item`
--

INSERT INTO `p_cart_item` (`id`, `cart_id`, `product_id`, `seller_id`, `quantity`, `added_at`) VALUES
(62, 9, 21, 8, 1, '2023-01-19 13:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `p_categories`
--

CREATE TABLE `p_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  `creation_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_categories`
--

INSERT INTO `p_categories` (`id`, `name`, `description`, `seller_id`, `creation_time`, `updated_at`) VALUES
(1, 'Pets', NULL, 1, '2022-06-23 13:41:46', '2022-06-23 13:43:31'),
(2, 'Food', NULL, 1, '2022-06-23 13:41:46', '2022-06-23 13:43:31'),
(3, 'Accessories', NULL, 1, '2022-06-23 13:41:46', '2022-06-23 13:43:31');

-- --------------------------------------------------------

--
-- Table structure for table `p_credential_cache`
--

CREATE TABLE `p_credential_cache` (
  `id` int(11) NOT NULL,
  `cache` text NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `valid_until` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p_last_order_no`
--

CREATE TABLE `p_last_order_no` (
  `id` int(11) NOT NULL,
  `order_num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_last_order_no`
--

INSERT INTO `p_last_order_no` (`id`, `order_num`) VALUES
(1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `p_orders`
--

CREATE TABLE `p_orders` (
  `id` int(11) NOT NULL,
  `order_no` varchar(20) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `price` float NOT NULL DEFAULT 0,
  `shipping_price` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `grand_price` int(11) NOT NULL DEFAULT 0,
  `creation_time` datetime DEFAULT current_timestamp(),
  `last_modified_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(40) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_orders`
--

INSERT INTO `p_orders` (`id`, `order_no`, `seller_id`, `customer_id`, `price`, `shipping_price`, `tax_amount`, `grand_price`, `creation_time`, `last_modified_time`, `is_deleted`, `deleted_by`, `deleted_time`) VALUES
(7, 'p202212286', 8, 7, 11998, 40, 0, 12038, '2022-12-28 13:20:34', '2022-12-28 13:20:34', 0, NULL, NULL),
(13, 'p202301039', 8, 7, 4699, 40, 0, 4739, '2023-01-03 15:21:31', '2023-01-03 15:21:31', 0, NULL, NULL),
(14, 'p2023010310', 8, 7, 4699, 40, 0, 4739, '2023-01-03 15:21:32', '2023-01-03 15:21:32', 0, NULL, NULL),
(15, 'p2023011210', 8, 7, 11998, 40, 0, 12038, '2023-01-12 15:16:52', '2023-01-12 15:16:52', 0, NULL, NULL),
(16, 'p2023011911', 8, 7, 510, 40, 0, 550, '2023-01-19 12:35:59', '2023-01-19 12:35:59', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `p_orders_address`
--

CREATE TABLE `p_orders_address` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_orders_address`
--

INSERT INTO `p_orders_address` (`id`, `order_id`, `full_name`, `email`, `address`, `contact_no`, `area`, `landmark`, `city`, `state`, `zip`) VALUES
(6, 7, 'Abhishek Nayak', 'abhi113112@gmail.com', 'Anugraha', '8277519304', 'Kuntagni achave', 'Bridge', 'Ankola', 'Karnataka', '581314'),
(7, 8, 'abhishek', 'abhi4@gmail.com', 'anugraha', '9087654321', 'kuntagni', 'bridge', 'ankola', 'karnataka', '581314'),
(8, 12, 'Abhishek Nayak', 'abhi05@gmail.com', '#453', '8277519304', 'Kuntagani', 'Bridge', 'Ankola', 'Karnataka', '581344'),
(9, 13, 'Arjun Nayak', 'arjun1@gmail.com', '#556', '9900551234', 'Kuntagani', 'Bridge', 'Ankola', 'Karnataka', '581314'),
(10, 15, 'abhisheknayak', 'abhi009@gmail.com', 'wqdqwe', '9098753221', 'qCWED', 'ced', 'ajjddacdcwdf', 'fwwrf', '232331'),
(11, 16, 'Abhishek Nayak', 'abhi05@gmail.com', '#453', '9900551246', 'Ankola,Achave', 'Bridge', 'Ankola', 'Karnataka', '583143');

-- --------------------------------------------------------

--
-- Table structure for table `p_orders_details`
--

CREATE TABLE `p_orders_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` float NOT NULL DEFAULT 0,
  `status` varchar(250) NOT NULL DEFAULT 'Ordered' COMMENT '0-Ordered 1-Shipped 2-Out for delivery 3-Order delivered 4-cancelled	',
  `creation_time` datetime NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_orders_details`
--

INSERT INTO `p_orders_details` (`id`, `order_id`, `product_id`, `quantity`, `price`, `status`, `creation_time`, `last_modified_time`) VALUES
(10, 7, 20, 1, 5999, 'Order_delivered', '2022-12-28 13:20:34', '2023-01-02 15:21:02'),
(11, 7, 19, 1, 5999, 'Shipped', '2022-12-28 13:20:34', '2022-12-28 14:32:54'),
(15, 13, 21, 1, 4699, 'Shipped', '2023-01-03 15:21:31', '2023-01-03 15:22:05'),
(16, 15, 19, 1, 5999, 'Ordered', '2023-01-12 15:16:52', '2023-01-12 15:16:52'),
(17, 15, 20, 1, 5999, 'Ordered', '2023-01-12 15:16:52', '2023-01-12 15:16:52'),
(18, 16, 24, 1, 70, 'Ordered', '2023-01-19 12:35:59', '2023-01-19 12:35:59'),
(19, 16, 30, 1, 440, 'Ordered', '2023-01-19 12:35:59', '2023-01-19 12:35:59');

-- --------------------------------------------------------

--
-- Table structure for table `p_product_images`
--

CREATE TABLE `p_product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_image` varchar(250) NOT NULL,
  `creation_time` datetime DEFAULT current_timestamp(),
  `modified_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_product_images`
--

INSERT INTO `p_product_images` (`id`, `product_id`, `product_image`, `creation_time`, `modified_time`) VALUES
(17, 19, 'file-1672212121385.jpg', '2022-12-28 13:02:17', '2022-12-28 13:02:17'),
(18, 20, 'file-1672212765118.jpg', '2022-12-28 13:05:20', '2022-12-28 13:05:20'),
(19, 21, 'file-1672299071451.jpg', '2022-12-29 13:01:52', '2022-12-29 13:01:52'),
(20, 22, 'file-1674109207640.jpg', '2023-01-19 11:51:10', '2023-01-19 11:51:10'),
(21, 23, 'file-1674109378273.jpg', '2023-01-19 11:53:54', '2023-01-19 11:53:54'),
(22, 24, 'file-1674109514786.jpg', '2023-01-19 11:56:04', '2023-01-19 11:56:04'),
(23, 25, 'file-1674109701046.jpg', '2023-01-19 11:59:10', '2023-01-19 11:59:10'),
(24, 26, 'file-1674109925229.jpg', '2023-01-19 12:02:57', '2023-01-19 12:02:57'),
(25, 27, 'file-1674110113717.jpg', '2023-01-19 12:06:02', '2023-01-19 12:06:02'),
(26, 28, 'file-1674110259321.jpg', '2023-01-19 12:08:14', '2023-01-19 12:08:14'),
(27, 29, 'file-1674110372302.jpg', '2023-01-19 12:10:04', '2023-01-19 12:10:04'),
(28, 30, 'file-1674110446618.jpg', '2023-01-19 12:11:13', '2023-01-19 12:11:13');

-- --------------------------------------------------------

--
-- Table structure for table `p_product_inventory`
--

CREATE TABLE `p_product_inventory` (
  `id` int(11) NOT NULL,
  `product_name` varchar(40) DEFAULT NULL,
  `pet_gender` varchar(50) DEFAULT NULL COMMENT '"Male","Female","None"',
  `pet_age` float NOT NULL DEFAULT 0,
  `seller_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `product_type` varchar(100) DEFAULT NULL,
  `product_price` float NOT NULL,
  `product_total_quantity` int(11) DEFAULT NULL,
  `product_description` varchar(500) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `image_type` varchar(100) DEFAULT NULL,
  `in_stock` int(11) NOT NULL DEFAULT 0 COMMENT '0-disable 1-enable',
  `created_by` varchar(40) DEFAULT NULL,
  `creation_time` datetime DEFAULT current_timestamp(),
  `last_modified_by` varchar(40) DEFAULT NULL,
  `last_modified_time` datetime DEFAULT current_timestamp(),
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` varchar(40) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_product_inventory`
--

INSERT INTO `p_product_inventory` (`id`, `product_name`, `pet_gender`, `pet_age`, `seller_id`, `category_id`, `product_type`, `product_price`, `product_total_quantity`, `product_description`, `image_url`, `image_type`, `in_stock`, `created_by`, `creation_time`, `last_modified_by`, `last_modified_time`, `is_deleted`, `deleted_by`, `deleted_time`) VALUES
(19, 'Gordon Setter', 'Female', 1, 8, 1, 'Puppy', 5999, 9, 'Black Hair Puppy', 'file-1672212121385.jpg', 'null', 1, NULL, '2022-12-28 13:02:17', NULL, '2022-12-28 13:02:17', 0, NULL, NULL),
(20, 'Weimaraner', 'Male', 2, 8, 1, 'Puppy', 5999, 9, 'Silky Softy Hair puppy', 'file-1672212765118.jpg', 'null', 1, NULL, '2022-12-28 13:05:20', NULL, '2022-12-28 13:05:20', 0, NULL, NULL),
(21, 'Keeshond', 'Male', 2, 8, 1, 'Puppy', 4699, 11, 'White Hair Puppy', 'file-1672299071451.jpg', 'null', 1, NULL, '2022-12-29 13:01:52', NULL, '2022-12-29 13:01:52', 0, NULL, NULL),
(22, 'SmartyKat Bungee Dangler Bouncy Mouse Pl', 'null', 0, 8, 3, 'Accessories', 779, 30, 'ENTICES CATS: The Bouncy Mouse teaser toy bobs and bounces at the end of a stretchy elastic string; the toy\'s motion entices cats and brings out their hunter instincts', 'file-1674109207640.jpg', 'null', 0, NULL, '2023-01-19 11:51:10', NULL, '2023-01-19 11:51:10', 0, NULL, NULL),
(23, 'Whiskas Kitten (2-12 months) Wet Cat Foo', 'null', 0, 8, 2, 'Food', 410, 112, 'Whiskas Kitten (2-12 months) Wet Cat Food, Chicken in Gravy, 12 Pouches (12 x 85g,Complete and balanced nutrition for all breeds of cats Gravy format of this meal helps promote urinary tract health', 'file-1674109378273.jpg', 'null', 0, NULL, '2023-01-19 11:53:54', NULL, '2023-01-19 11:53:54', 0, NULL, NULL),
(24, 'Jerhigh Chicken Grilled in Gravy Dog Foo', 'null', 0, 8, 2, 'Food', 70, 199, 'Chicken Grilled in Gravy Flavour adds to the palatability of food. Encourages healthy skin and hair. Boosts eyesight in dogs. Gives an anti-inflammatory effect in dogs. Omega 3 fatty acids keep a healthy heart. Hydrates your canine thoroughly.', 'file-1674109514786.jpg', 'null', 1, NULL, '2023-01-19 11:56:04', NULL, '2023-01-19 11:56:04', 0, NULL, NULL),
(25, 'INTAS Takfa Pet Spray 50 Ml', 'null', 0, 8, 3, 'Health Care', 349, 200, 'Treats skin infections due to allergies Gives relief against itching and scratching Soothness redness of skin Works for all dog breeds Dogs experiencing atopic dermatitis', 'file-1674109701046.jpg', 'null', 1, NULL, '2023-01-19 11:59:10', NULL, '2023-01-19 11:59:10', 0, NULL, NULL),
(26, 'Beagle pet puppy', 'Male', 1, 8, 1, 'Puppy', 4999, 30, 'Cute And Brave', 'file-1674109925229.jpg', 'null', 0, NULL, '2023-01-19 12:02:57', NULL, '2023-01-19 12:02:57', 0, NULL, NULL),
(27, 'CP CLASSIC OPTIMUM BETTA FISH FOOD (20GM', 'null', 0, 8, 2, 'Fish Food', 89, 208, 'Is  a special  nutritional formulation for all  betta  fish. It is complete and balanced  nutrition. Spirulina supplement to color enhance your fish. Rich in vitamin C and vitamin E  to help reduce  stress  and  increase immunity Complete nutrition  and Vitamins. Non - Water fouling ', 'file-1674110113717.jpg', 'null', 1, NULL, '2023-01-19 12:06:02', NULL, '2023-01-19 12:06:02', 0, NULL, NULL),
(28, 'ALL4PETS CLOTHS SWEAT SHIRTS NO 16', 'null', 0, 8, 3, 'Dog Clothes', 499, 89, 'Perfit for everyday wear, holiday ,parties ,and photos  Soft material keep your fur baby comfortable and warm during the cold winter  *Colors and designs may be vary according to the stock arability  size - 16  Dimensions  Neck Girth:    11 inch       Body Length: 16 inch  Breast Girth:  21 inch', 'file-1674110259321.jpg', 'null', 1, NULL, '2023-01-19 12:08:14', NULL, '2023-01-19 12:08:14', 0, NULL, NULL),
(29, 'PET RUBBER TOY BONE SPIRAL SHAPE 5.5 INC', 'null', 0, 8, 3, 'Toys', 220, 100, 'pet rubber bone toy.  dog bone Spiral shape.  good quality.  size: 5.5 inc.', 'file-1674110372302.jpg', 'null', 1, NULL, '2023-01-19 12:10:04', NULL, '2023-01-19 12:10:04', 0, NULL, NULL),
(30, 'JW PET HOL -EE ROLLER DOG TOY LARGE', 'null', 0, 8, 3, 'Toys', 440, 117, 'These toys are fashioned of thick-walled Heavy-duty 100% natural rubber that is certified Non-toxic This out-of-this-world dome toy is a fun, stretchy and virtually indestructible ball. Great for fetching, chewing, tugging and hiding treats', 'file-1674110446618.jpg', 'null', 1, NULL, '2023-01-19 12:11:13', NULL, '2023-01-19 12:11:13', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `p_user`
--

CREATE TABLE `p_user` (
  `id` int(11) NOT NULL,
  `org_id` varchar(40) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `profile_img` varchar(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `account_status` tinyint(4) DEFAULT 0 COMMENT '1-Inactive 2-Active 3-Blocked',
  `created_by` varchar(40) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `last_modified_by` varchar(40) DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `deleted_by` varchar(40) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_user`
--

INSERT INTO `p_user` (`id`, `org_id`, `full_name`, `user_name`, `password`, `user_type`, `contact_no`, `profile_img`, `last_login`, `account_status`, `created_by`, `creation_time`, `last_modified_by`, `last_modified_time`, `is_deleted`, `deleted_by`, `deleted_time`) VALUES
(7, '71dedcc6606479dc82e23f3fe1bfb83355935e16', 'Abhishek Nayak', 'abhi05@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'Customer', '8277519304', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(8, '71dedcc6606479dc82e23f3fe1bfb83355935e16', 'Abhishek Nayak', 'abhi05admin@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'Seller', '8310571419', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `p_access_log`
--
ALTER TABLE `p_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_cart`
--
ALTER TABLE `p_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_cart_item`
--
ALTER TABLE `p_cart_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_categories`
--
ALTER TABLE `p_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_credential_cache`
--
ALTER TABLE `p_credential_cache`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_last_order_no`
--
ALTER TABLE `p_last_order_no`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_orders`
--
ALTER TABLE `p_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_orders_address`
--
ALTER TABLE `p_orders_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_orders_details`
--
ALTER TABLE `p_orders_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_product_images`
--
ALTER TABLE `p_product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_product_inventory`
--
ALTER TABLE `p_product_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_user`
--
ALTER TABLE `p_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `p_access_log`
--
ALTER TABLE `p_access_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p_cart`
--
ALTER TABLE `p_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `p_cart_item`
--
ALTER TABLE `p_cart_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `p_categories`
--
ALTER TABLE `p_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `p_credential_cache`
--
ALTER TABLE `p_credential_cache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p_last_order_no`
--
ALTER TABLE `p_last_order_no`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `p_orders`
--
ALTER TABLE `p_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `p_orders_address`
--
ALTER TABLE `p_orders_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `p_orders_details`
--
ALTER TABLE `p_orders_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `p_product_images`
--
ALTER TABLE `p_product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `p_product_inventory`
--
ALTER TABLE `p_product_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `p_user`
--
ALTER TABLE `p_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
