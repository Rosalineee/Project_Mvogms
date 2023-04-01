-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 23, 2023 lúc 04:42 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mvogms_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(10, 4, 'Đồng hồ', 'Danh mục Đồng hồ', 1, 0, '2023-03-11 22:56:19', NULL),
(11, 4, 'Nhẫn ', 'Nhẫn vàng, bạc, kim cương', 1, 0, '2023-03-22 23:02:59', '2023-03-23 17:40:44'),
(12, 4, 'Vòng tay', 'Trang sức', 1, 0, '2023-03-22 23:10:03', NULL),
(13, 5, 'Rau', 'Các loại rau củ quả', 1, 0, '2023-03-22 23:18:35', NULL),
(14, 5, 'Đồ uống', 'Đồ uống có ga, nước trái cây,...', 1, 0, '2023-03-22 23:19:07', NULL),
(15, 5, 'Thịt', 'Các loại thịt động vật', 1, 0, '2023-03-22 23:19:29', NULL),
(16, 6, 'Nước hoa', 'Nước hoa', 1, 0, '2023-03-22 23:41:58', '2023-03-22 23:59:34'),
(17, 6, 'Mỹ phẩm', 'Mỹ phẩm', 1, 0, '2023-03-22 23:42:13', '2023-03-23 00:00:28'),
(18, 7, 'Hạt khô', 'Các loại hạt', 1, 0, '2023-03-23 21:55:58', NULL),
(19, 7, 'Bimbim', 'Các loại bim bim', 1, 0, '2023-03-23 21:56:12', NULL),
(20, 7, 'Thịt khô', 'Các loại thịt khô', 1, 0, '2023-03-23 21:57:10', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 'Nguyen', '', 'Thoa', 'Nữ', '09123456789', 'Hà Nội', 'thoanguyen@gmail.com', '1254737c076cf867dc53d60a0364f38e', 'uploads/clients/1.png?v=1644386016', 1, 0, '2022-02-09 13:53:36', '2023-03-23 11:06:02'),
(2, '202202-00002', 'test', 'test', 'test', 'Male', '094564654', 'test', 'test@sample.com', '098f6bcd4621d373cade4e832627b4f6', 'uploads/clients/2.png?v=1644471867', 1, 1, '2022-02-10 13:44:26', '2022-02-10 13:44:35'),
(3, '202303-00001', 'Vu', '', 'Hoi', 'Male', '09876536745', 'Thai Binh', 'hoivu2k1@gmail.com', 'c70c78ad1d547b8ab235b52604cddd17', 'uploads/clients/3.png?v=1678548529', 1, 0, '2023-03-11 22:28:49', '2023-03-11 22:28:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`, `date_created`) VALUES
(6, 9, 1, 1300, '2023-03-11 22:58:24'),
(7, 9, 1, 1300, '2023-03-11 23:03:46'),
(8, 9, 1, 1300, '2023-03-11 23:07:25'),
(9, 15, 1, 25790000, '2023-03-23 20:57:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `client_id`, `vendor_id`, `total_amount`, `delivery_address`, `status`, `date_created`, `date_updated`) VALUES
(2, '202202-00002', 1, 2, 7359.9, 'This is only my sample address', 0, '2022-02-10 09:56:49', '2022-02-10 09:56:49'),
(4, '202202-00004', 1, 2, 2320.61, 'This is only my sample address', 0, '2022-02-10 10:29:01', '2022-02-10 10:29:01'),
(5, '202303-00001', 3, 2, 285.99, 'Thai Binh', 0, '2023-03-11 22:30:37', '2023-03-11 22:30:37'),
(6, '202303-00002', 3, 4, 1300, 'Thai Binh', 5, '2023-03-11 22:58:24', '2023-03-11 23:11:04'),
(7, '202303-00003', 3, 4, 1300, 'Thai Binh', 5, '2023-03-11 23:03:46', '2023-03-11 23:06:13'),
(8, '202303-00004', 3, 4, 1300, 'Thai Binh', 4, '2023-03-11 23:07:25', '2023-03-23 20:55:10'),
(9, '202303-00005', 3, 4, 25790000, 'Thai Binh', 4, '2023-03-23 20:57:44', '2023-03-23 21:00:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(9, 4, 10, 'Đồng hồ Omega', '&lt;p&gt;Gi&aacute; cả phải chăng&lt;/p&gt;', 1300, 'uploads/products/9.png?v=1678550239', 1, 1, '2023-03-11 22:57:18', '2023-03-18 10:08:24'),
(10, 4, 10, 'Bánh', '&lt;p&gt;Kh&aacute; đẹp&lt;/p&gt;', 500000, 'uploads/products/10.png?v=1679413061', 1, 1, '2023-03-21 22:37:41', '2023-03-21 23:34:58'),
(11, 4, 10, 'Đồng hồ Omega DeVille Prestige', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 1px; text-align: justify; outline: none !important;&quot;&gt;-&nbsp;&lt;u style=&quot;margin: 0px; padding: 0px; outline: none !important;&quot;&gt;&lt;a href=&quot;https://bdtwatch.com/dong-ho-omega&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(51, 122, 183); transition: color 0.5s ease 0s; outline: none !important;&quot;&gt;Đồng Hồ Omega&lt;/a&gt;&lt;/u&gt;&nbsp;DeVille Prestige Co-Axial Chronomete được trang bị bộ m&aacute;y Calibre&nbsp;Omega&nbsp;2500 với thời gian&nbsp;trữ c&oacute;t l&ecirc;n đến 48 giờ, tần số giao động 25200 vph, 27 ch&acirc;n k&iacute;nh. M&aacute;y đạt chuẩn Chronometer chạy cực kỳ ch&iacute;nh x&aacute;c v&agrave; bền bỉ.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 1px; text-align: justify; outline: none !important;&quot;&gt;- Vỏ được l&agrave;m bằng th&eacute;p chống ghỉ 316L cao cấp, viền tr&ecirc;n l&agrave;m bằng v&agrave;ng nguy&ecirc;n khối 18k. Mặt dial m&agrave;u trắng ng&agrave; cực đẹp,&nbsp;thiết kế với 3 kim 1&nbsp;lịch đơn giản, cọc số la m&atilde; xen kẽ cổ điển.&lt;br style=&quot;margin: 0px; padding: 0px; outline: none !important;&quot;&gt;- Đồng hồ được&nbsp;trang bị k&iacute;nh Sapphire nguy&ecirc;n khối chống xước tốt.&lt;br style=&quot;margin: 0px; padding: 0px; outline: none !important;&quot;&gt;-&nbsp;Size mặt 37 mm rất ph&ugrave; hợp với người c&oacute; cổ tay vừa v&agrave;&nbsp;nhỏ. Độ d&agrave;y chỉ 9.9 mm.&lt;br style=&quot;margin: 0px; padding: 0px; outline: none !important;&quot;&gt;-&nbsp;Độ chống nước 30m gi&uacute;p người đeo thoải m&aacute;i đi mưa, rửa tay.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 1px; text-align: justify; outline: none !important;&quot;&gt;- D&acirc;y da m&agrave;u n&acirc;u nhạt&nbsp;kết hợp c&ugrave;ng kh&oacute;a xi&ecirc;n đơn giản&lt;/p&gt;', 7000000, 'uploads/products/11.png?v=1679500934', 1, 0, '2023-03-22 22:41:14', '2023-03-22 23:02:14'),
(12, 4, 10, 'Đồng hồ DeVille Prestige', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 1px; text-align: justify; outline: none !important;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-weight: 700; outline: none !important;&quot;&gt;&lt;u style=&quot;margin: 0px; padding: 0px; outline: none !important;&quot;&gt;&lt;a href=&quot;https://bdtwatch.com/dong-ho-omega&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(51, 122, 183); transition: color 0.5s ease 0s; outline: none !important;&quot;&gt;Đồng Hồ Omega&lt;/a&gt;&lt;/u&gt;&nbsp;&lt;/span&gt;DeVille Prestige được trang bị bộ m&aacute;y Calibre&nbsp;Omega&nbsp;2500 - Trữ c&oacute;t 48 giờ, tần số giao động 25200 vph, 27 ch&acirc;n k&iacute;nh. M&aacute;y đạt chuẩn Chronometer chạy cực kỳ ch&iacute;nh x&aacute;c v&agrave; bền bỉ&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 1px; text-align: justify; outline: none !important;&quot;&gt;- V&otilde; được l&agrave;m bằng th&eacute;p chống ghỉ 316L cao cấp, viền tr&ecirc;n l&agrave;m bằng v&agrave;ng nguy&ecirc;n khối 18&nbsp;. Mặt dial m&agrave;u v&agrave;ng nổi bật v&agrave; đẹp mắt&nbsp; ,&nbsp;thiết kế với 3 kim 1&nbsp;lịch đơn giản, cọc số la m&atilde; cổ điển kết hợp cọc kim cương sang trọng&lt;br style=&quot;margin: 0px; padding: 0px; outline: none !important;&quot;&gt;- Đồng hồ được&nbsp;trang bị k&iacute;nh Sapphire nguy&ecirc;n khối chống xước tốt. Size mặt 37 mm rất ph&ugrave; hợp với người c&oacute; cổ tay vừa v&agrave;&nbsp; nhỏ. Độ d&agrave;y chỉ 9 mm. Độ chống nước 30m gi&uacute;p người đeo thoải m&aacute;i đi mưa , rửa tay.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 1px; text-align: justify; outline: none !important;&quot;&gt;- D&acirc;y l&agrave;m bằng th&eacute;p chống ghỉ 316L kết hợp v&agrave;ng 18k.&lt;/p&gt;', 157900000, 'uploads/products/12.png?v=1679500923', 1, 0, '2023-03-22 22:42:48', '2023-03-22 23:02:03'),
(13, 4, 10, 'Đòng hồ Casio  MTP-1381D-1AVDF', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &quot;Arial, Helvetica, sans-serif&quot;; font-size: 14px;&quot;&gt;Đồng hồ Casio MTP-1381D-1AVDF c&oacute; vỏ v&agrave; d&acirc;y đeo kim loại phủ bạc s&aacute;ng b&oacute;ng, nền số m&agrave;u đen mạnh mẽ với kim chỉ v&agrave; vạch số được phủ phản quang nổi bật, lịch thứ vị tr&iacute; 12h v&agrave; lịch ng&agrave;y vị tr&iacute; 6h.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 500000, 'uploads/products/13.png?v=1679500811', 1, 0, '2023-03-22 22:47:00', '2023-03-22 23:00:11'),
(14, 4, 10, 'Đồng hồ nam Casio MTP-1370D-1A1VDF', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &quot;Arial, Helvetica, sans-serif&quot;; font-size: 14px;&quot;&gt;Đồng hồ nam Casio MTP-1370D-1A1VDF thanh lịch với kiểu d&aacute;ng nam t&iacute;nh mặt đồng hồ nền đen c&ugrave;ng chữ số vạch trắng, vỏ m&aacute;y c&ugrave;ng d&acirc;y đeo kim loại bạc sang trọng, k&egrave;m th&ecirc;m 1 lịch ng&agrave;y v&agrave; 1 lịch thứ.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1060700, 'uploads/products/14.png?v=1679500884', 1, 0, '2023-03-22 22:49:24', '2023-03-22 23:01:24'),
(15, 4, 11, 'Nhẫn kim cương 18K', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(35, 35, 35); font-family: Quicksand;&quot;&gt;Sở hữu thiết kế kết hợp đ&aacute; CZ đ&iacute;nh kết ho&agrave;n hảo, chiếc nhẫn v&agrave;ng trắng đến từ thương hiệu APJ t&ocirc;n l&ecirc;n được vẻ đẹp sang trọng v&agrave; trẻ trung cho ph&aacute;i nữ.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(35, 35, 35); font-family: Quicksand;&quot;&gt;&lt;span data-sheets-value=&quot;{&amp;quot;1&amp;quot;:2,&amp;quot;2&amp;quot;:&amp;quot;Th&ocirc;ng số đ&aacute;:8v1.5;1v5.0&amp;quot;}&quot; data-sheets-userformat=&quot;{&amp;quot;2&amp;quot;:14915,&amp;quot;3&amp;quot;:{&amp;quot;1&amp;quot;:0},&amp;quot;4&amp;quot;:{&amp;quot;1&amp;quot;:3,&amp;quot;3&amp;quot;:4},&amp;quot;9&amp;quot;:0,&amp;quot;12&amp;quot;:0,&amp;quot;14&amp;quot;:{&amp;quot;1&amp;quot;:2,&amp;quot;2&amp;quot;:0},&amp;quot;15&amp;quot;:&amp;quot;Calibri&amp;quot;,&amp;quot;16&amp;quot;:11}&quot;&gt;Th&ocirc;ng số đ&aacute;: 8v1.5; 1v5.0&lt;/span&gt;&lt;/p&gt;', 25790000, 'uploads/products/15.png?v=1679501133', 1, 0, '2023-03-22 23:05:33', '2023-03-22 23:05:33'),
(16, 4, 11, 'Nhẫn vàng 24K', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(35, 35, 35); font-family: Quicksand;&quot;&gt;Sở hữu thiết kế kết hợp đ&aacute; CZ đ&iacute;nh kết ho&agrave;n hảo, chiếc nhẫn v&agrave;ng đến từ thương hiệu APJ t&ocirc;n l&ecirc;n được vẻ đẹp sang trọng v&agrave; trẻ trung cho ph&aacute;i nữ.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(35, 35, 35); font-family: Quicksand;&quot;&gt;&lt;span data-sheets-value=&quot;{&amp;quot;1&amp;quot;:2,&amp;quot;2&amp;quot;:&amp;quot;Th&ocirc;ng số đ&aacute;:8v1.5;1v5.0&amp;quot;}&quot; data-sheets-userformat=&quot;{&amp;quot;2&amp;quot;:14915,&amp;quot;3&amp;quot;:{&amp;quot;1&amp;quot;:0},&amp;quot;4&amp;quot;:{&amp;quot;1&amp;quot;:3,&amp;quot;3&amp;quot;:4},&amp;quot;9&amp;quot;:0,&amp;quot;12&amp;quot;:0,&amp;quot;14&amp;quot;:{&amp;quot;1&amp;quot;:2,&amp;quot;2&amp;quot;:0},&amp;quot;15&amp;quot;:&amp;quot;Calibri&amp;quot;,&amp;quot;16&amp;quot;:11}&quot;&gt;Th&ocirc;ng số đ&aacute;: 8v1.5; 1v5.0&lt;/span&gt;&lt;/p&gt;', 5000000, 'uploads/products/16.png?v=1679501180', 1, 0, '2023-03-22 23:06:20', '2023-03-22 23:06:20'),
(17, 4, 11, 'Nhẫn vàng 18K', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(35, 35, 35); font-family: Quicksand;&quot;&gt;Sở hữu thiết kế kết hợp đ&aacute; CZ đ&iacute;nh kết ho&agrave;n hảo, chiếc nhẫn v&agrave;ng trắng đến từ thương hiệu APJ t&ocirc;n l&ecirc;n được vẻ đẹp sang trọng v&agrave; trẻ trung cho ph&aacute;i nữ.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(35, 35, 35); font-family: Quicksand;&quot;&gt;&lt;span data-sheets-value=&quot;{&amp;quot;1&amp;quot;:2,&amp;quot;2&amp;quot;:&amp;quot;Th&ocirc;ng số đ&aacute;:8v1.5;1v5.0&amp;quot;}&quot; data-sheets-userformat=&quot;{&amp;quot;2&amp;quot;:14915,&amp;quot;3&amp;quot;:{&amp;quot;1&amp;quot;:0},&amp;quot;4&amp;quot;:{&amp;quot;1&amp;quot;:3,&amp;quot;3&amp;quot;:4},&amp;quot;9&amp;quot;:0,&amp;quot;12&amp;quot;:0,&amp;quot;14&amp;quot;:{&amp;quot;1&amp;quot;:2,&amp;quot;2&amp;quot;:0},&amp;quot;15&amp;quot;:&amp;quot;Calibri&amp;quot;,&amp;quot;16&amp;quot;:11}&quot;&gt;Th&ocirc;ng số đ&aacute;: 8v1.5; 1v5.0&lt;/span&gt;&lt;/p&gt;', 2469000, 'uploads/products/17.png?v=1679501230', 1, 0, '2023-03-22 23:07:10', '2023-03-22 23:07:10'),
(18, 4, 11, 'Nhẫn vàng trắng kim cương', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(35, 35, 35); font-family: Quicksand;&quot;&gt;Sở hữu thiết kế kết hợp đ&aacute; CZ đ&iacute;nh kết ho&agrave;n hảo, chiếc nhẫn v&agrave;ng trắng đến từ thương hiệu APJ t&ocirc;n l&ecirc;n được vẻ đẹp sang trọng v&agrave; trẻ trung cho ph&aacute;i nữ.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(35, 35, 35); font-family: Quicksand;&quot;&gt;&lt;span data-sheets-value=&quot;{&amp;quot;1&amp;quot;:2,&amp;quot;2&amp;quot;:&amp;quot;Th&ocirc;ng số đ&aacute;:8v1.5;1v5.0&amp;quot;}&quot; data-sheets-userformat=&quot;{&amp;quot;2&amp;quot;:14915,&amp;quot;3&amp;quot;:{&amp;quot;1&amp;quot;:0},&amp;quot;4&amp;quot;:{&amp;quot;1&amp;quot;:3,&amp;quot;3&amp;quot;:4},&amp;quot;9&amp;quot;:0,&amp;quot;12&amp;quot;:0,&amp;quot;14&amp;quot;:{&amp;quot;1&amp;quot;:2,&amp;quot;2&amp;quot;:0},&amp;quot;15&amp;quot;:&amp;quot;Calibri&amp;quot;,&amp;quot;16&amp;quot;:11}&quot;&gt;Th&ocirc;ng số đ&aacute;: 8v1.5; 1v5.0&lt;/span&gt;&lt;/p&gt;', 10000000, 'uploads/products/18.png?v=1679501279', 1, 0, '2023-03-22 23:07:59', '2023-03-22 23:07:59'),
(19, 4, 12, 'Lắc tay vàng 18K', '&lt;ul class=&quot;product_info&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; width: 489.833px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 12px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 5px; padding: 6px; font-size: 13px; border: 1px solid rgb(238, 238, 238);&quot;&gt;B&ocirc;ng tai, NHẪN, V&ograve;ng Tay, V&Ograve;NG TAY BẢN LỚN, mặt d&acirc;y CHUYỀN, lắc tay, v&ograve;ng Ximen bộ, lẻ xinh sắn l&agrave; m&oacute;n qu&agrave; dễ thương d&agrave;nh tặng cho những c&ocirc; g&aacute;i xinh đẹp v&agrave; đ&aacute;ng y&ecirc;u. Ch&uacute;ng t&ocirc;i C&oacute; nhiều m&agrave;u sắc kh&aacute;c nhau để lựa chọn&lt;/li&gt;&lt;/ul&gt;', 2589000, 'uploads/products/19.png?v=1679501475', 1, 0, '2023-03-22 23:11:15', '2023-03-22 23:11:15'),
(20, 4, 12, 'Lắc tay bạc cỏ 4 lá', '&lt;ul class=&quot;product_info&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; width: 489.833px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 12px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 5px; padding: 6px; font-size: 13px; border: 1px solid rgb(238, 238, 238);&quot;&gt;B&ocirc;ng tai, NHẪN, V&ograve;ng Tay, V&Ograve;NG TAY BẢN LỚN, mặt d&acirc;y CHUYỀN, lắc tay, v&ograve;ng Ximen bộ, lẻ xinh sắn l&agrave; m&oacute;n qu&agrave; dễ thương d&agrave;nh tặng cho những c&ocirc; g&aacute;i xinh đẹp v&agrave; đ&aacute;ng y&ecirc;u. Ch&uacute;ng t&ocirc;i C&oacute; nhiều m&agrave;u sắc kh&aacute;c nhau để lựa chọn&lt;/li&gt;&lt;/ul&gt;', 300000, 'uploads/products/20.png?v=1679501519', 1, 0, '2023-03-22 23:11:59', '2023-03-22 23:11:59'),
(21, 4, 12, 'Lắc tay', '&lt;ul class=&quot;product_info&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; width: 489.833px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 12px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 5px; padding: 6px; font-size: 13px; border: 1px solid rgb(238, 238, 238);&quot;&gt;B&ocirc;ng tai, NHẪN, V&ograve;ng Tay, V&Ograve;NG TAY BẢN LỚN, mặt d&acirc;y CHUYỀN, lắc tay, v&ograve;ng Ximen bộ, lẻ xinh sắn l&agrave; m&oacute;n qu&agrave; dễ thương d&agrave;nh tặng cho những c&ocirc; g&aacute;i xinh đẹp v&agrave; đ&aacute;ng y&ecirc;u. Ch&uacute;ng t&ocirc;i C&oacute; nhiều m&agrave;u sắc kh&aacute;c nhau để lựa chọn&lt;/li&gt;&lt;/ul&gt;', 500000, 'uploads/products/21.png?v=1679501559', 1, 0, '2023-03-22 23:12:39', '2023-03-22 23:12:39'),
(22, 4, 12, 'Vòng tay vàng 24K', '&lt;ul class=&quot;product_info&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; width: 489.833px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 12px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 5px; padding: 6px; font-size: 13px; border: 1px solid rgb(238, 238, 238);&quot;&gt;B&ocirc;ng tai, NHẪN, V&ograve;ng Tay, V&Ograve;NG TAY BẢN LỚN, mặt d&acirc;y CHUYỀN, lắc tay, v&ograve;ng Ximen bộ, lẻ xinh sắn l&agrave; m&oacute;n qu&agrave; dễ thương d&agrave;nh tặng cho những c&ocirc; g&aacute;i xinh đẹp v&agrave; đ&aacute;ng y&ecirc;u. Ch&uacute;ng t&ocirc;i C&oacute; nhiều m&agrave;u sắc kh&aacute;c nhau để lựa chọn&lt;/li&gt;&lt;/ul&gt;', 30000000, 'uploads/products/22.png?v=1679501602', 1, 0, '2023-03-22 23:13:22', '2023-03-22 23:13:22'),
(23, 4, 12, 'Vòng tay vàng', '&lt;ul class=&quot;product_info&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; width: 489.833px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 12px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 5px; padding: 6px; font-size: 13px; border: 1px solid rgb(238, 238, 238);&quot;&gt;B&ocirc;ng tai, NHẪN, V&ograve;ng Tay, V&Ograve;NG TAY BẢN LỚN, mặt d&acirc;y CHUYỀN, lắc tay, v&ograve;ng Ximen bộ, lẻ xinh sắn l&agrave; m&oacute;n qu&agrave; dễ thương d&agrave;nh tặng cho những c&ocirc; g&aacute;i xinh đẹp v&agrave; đ&aacute;ng y&ecirc;u. Ch&uacute;ng t&ocirc;i C&oacute; nhiều m&agrave;u sắc kh&aacute;c nhau để lựa chọn&lt;/li&gt;&lt;/ul&gt;', 45000000, 'uploads/products/23.png?v=1679501669', 1, 0, '2023-03-22 23:14:29', '2023-03-22 23:14:29'),
(24, 5, 15, 'Cánh gà', '&lt;p&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga-canh-ga&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;C&aacute;nh g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;nhập khẩu tươi ngon, thịt chắc, nhiều dinh dưỡng thường d&ugrave;ng để chi&ecirc;n với nước mắm hoặc hấp h&agrave;nh.&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga/canh-ga-nhap-khau-dong-lanh-tui-500g-3-5-canh&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;C&aacute;nh g&agrave; nhập khẩu đ&ocirc;ng lạnh&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;với phương ph&aacute;p cấp đ&ocirc;ng hiện đại, gi&uacute;p lưu giữ hương vị tự nhi&ecirc;n, mang đến những m&oacute;n ăn ngon cho gia đ&igrave;nh&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 35000, 'uploads/products/24.png?v=1679502243', 1, 0, '2023-03-22 23:24:03', '2023-03-23 21:22:57'),
(25, 5, 15, 'Đùi gà', '&lt;p&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga-cp&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Đ&ugrave;i g&agrave; g&oacute;c tư&amp;nbsp;CP&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n thực phẩm, đảm bảo về chất lượng, độ tươi v&agrave; ngon, xuất xứ r&otilde; r&agrave;ng.&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga/dui-ga-goc-tu-vi-500g&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Đ&ugrave;i g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;l&agrave; một một nguy&ecirc;n liệu th&iacute;ch hợp để nấu m&oacute;n g&agrave; r&aacute;n, cơm đ&ugrave;i&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;quay ti&ecirc;u hay g&agrave; chi&ecirc;n nước mắm,...&amp;nbsp;C&oacute; thể d&ugrave;ng điện thoại qu&eacute;t code QR tr&ecirc;n sản phẩm để kiểm tra nguồn g&oacute;c.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 60000, 'uploads/products/25.png?v=1679502301', 1, 1, '2023-03-22 23:25:01', '2023-03-23 21:51:06'),
(26, 5, 15, 'Lườn gà phi lê', '&lt;p&gt;G&agrave;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&nbsp;nhập khẩu từ Mỹ được đ&oacute;ng g&oacute;i v&agrave; bảo quản theo những ti&ecirc;u chuẩn nghi&ecirc;m ngặt về vệ sinh v&agrave; an to&agrave;n thực phẩm, đảm bảo về chất lượng.&nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga/dui-toi-ga-nhap-khau-dong-lanh-tui-500g-2-4-cai&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Đ&ugrave;i tỏi g&agrave; nhập khẩu&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&nbsp;đ&ocirc;ng lạnh với phương ph&aacute;p cấp đ&ocirc;ng hiện đại, gi&uacute;p lưu giữ hương vị tự nhi&ecirc;n, mang đến những m&oacute;n ăn ngon cho gia đ&igrave;nh.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 47000, 'uploads/products/26.png?v=1679582889', 1, 1, '2023-03-22 23:25:58', '2023-03-23 21:48:22'),
(27, 5, 15, 'Lòng mề gà', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Mề&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga-cp&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;g&agrave; CP&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n thực phẩm, đảm bảo về chất lượng, độ tươi v&agrave; ngon, xuất xứ r&otilde; r&agrave;ng...&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga/me-ga-tuoi-khay-500g&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Mể g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;th&iacute;ch hợp để nấu m&oacute;n mề g&agrave; sốt gừng, mể g&agrave; sốt lạc, mề&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;trộn chua cay, mề g&agrave; x&agrave;o,....&amp;nbsp;C&oacute; thể d&ugrave;ng điện thoại qu&eacute;t code QR tr&ecirc;n sản phẩm để kiểm tra nguồn g&oacute;c.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 22000, 'uploads/products/27.png?v=1679502444', 1, 0, '2023-03-22 23:27:24', '2023-03-23 21:25:00'),
(28, 5, 15, 'Gà nguyên con', '&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga/ga-ta-nguyen-con-cp-11kg-15kg-con&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;G&agrave; ta nguy&ecirc;n con&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&nbsp;c&oacute; thịt dai ngon, mềm thơm chất lượng.&nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Thịt g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&nbsp;c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon, hấp dẫn cho gia đ&igrave;nh v&agrave; bạn b&egrave; thưởng thức. G&agrave; ta được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.&lt;/span&gt;', 110000, 'uploads/products/28.png?v=1679582720', 1, 1, '2023-03-22 23:28:30', '2023-03-23 21:45:49'),
(29, 5, 15, 'Sườn bò Úc', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Sườn b&ograve; c&oacute; vị ngon tương tự phần m&ocirc;ng b&ograve; v&agrave; thường được cắt th&agrave;nh l&aacute;t d&agrave;y như b&iacute;t-tết để nướng.&amp;nbsp;Đ&ugrave;i b&ograve; nhập khẩu đ&ocirc;ng lạnh được cấp đ&ocirc;ng từ&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-bo&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;thịt b&ograve;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;tươi ngon l&agrave; sản phẩm c&oacute; xuất xứ r&otilde; r&agrave;ng n&ecirc;n&amp;nbsp;đảm bảo an to&agrave;n thực phẩm v&agrave; gi&agrave;u chất dinh dưỡng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 145000, 'uploads/products/29.png?v=1679502612', 1, 0, '2023-03-22 23:30:12', '2023-03-23 21:28:09'),
(30, 5, 15, 'Thăn bò úc', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;C&oacute; vị ngon tương tự phần m&ocirc;ng b&ograve; v&agrave; thường được cắt th&agrave;nh l&aacute;t d&agrave;y như b&iacute;t-tết để nướng.&amp;nbsp;Đ&ugrave;i b&ograve; nhập khẩu đ&ocirc;ng lạnh được cấp đ&ocirc;ng từ&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-bo&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;thịt b&ograve;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;tươi ngon l&agrave; sản phẩm c&oacute; xuất xứ r&otilde; r&agrave;ng n&ecirc;n&amp;nbsp;đảm bảo an to&agrave;n thực phẩm v&agrave; gi&agrave;u chất dinh dưỡng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 350000, 'uploads/products/30.png?v=1679502655', 1, 0, '2023-03-22 23:30:55', '2023-03-23 21:28:23'),
(31, 5, 15, 'Nạc thăn bò xay', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Thịt b&ograve; c&oacute; vị ngon tương tự phần m&ocirc;ng b&ograve; v&agrave; thường được cắt th&agrave;nh l&aacute;t d&agrave;y như b&iacute;t-tết để nướng.&amp;nbsp;Đ&ugrave;i b&ograve; nhập khẩu đ&ocirc;ng lạnh được cấp đ&ocirc;ng từ&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-bo&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;thịt b&ograve;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;tươi ngon l&agrave; sản phẩm c&oacute; xuất xứ r&otilde; r&agrave;ng n&ecirc;n&amp;nbsp;đảm bảo an to&agrave;n thực phẩm v&agrave; gi&agrave;u chất dinh dưỡng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 230000, 'uploads/products/31.png?v=1679502724', 1, 0, '2023-03-22 23:32:04', '2023-03-23 21:27:47'),
(32, 5, 14, 'Coca 390ml', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Từ thương hiệu nước giải kh&aacute;t h&agrave;ng đầu thế giới, nước ngọt Coca Cola chai 390ml xua tan nhanh mọi cảm gi&aacute;c mệt mỏi, căng thẳng, đặc biệt th&iacute;ch hợp sử dụng với c&aacute;c hoạt động ngo&agrave;i trời. B&ecirc;n cạnh đ&oacute; thiết kế dạng chai nhỏ gọn, tiện lợi dễ d&agrave;ng bảo quản khi kh&ocirc;ng sử dụng hết&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 7500, 'uploads/products/32.png?v=1679502860', 1, 0, '2023-03-22 23:34:20', '2023-03-23 21:23:54'),
(33, 5, 14, 'Coca 1,5l', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Từ thương hiệu nước giải kh&aacute;t h&agrave;ng đầu thế giới, nước ngọt Coca Cola chai 1,5l xua tan nhanh mọi cảm gi&aacute;c mệt mỏi, căng thẳng, đặc biệt th&iacute;ch hợp sử dụng với c&aacute;c hoạt động ngo&agrave;i trời. B&ecirc;n cạnh đ&oacute; thiết kế dạng chai nhỏ gọn, tiện lợi dễ d&agrave;ng bảo quản khi kh&ocirc;ng sử dụng hết&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 20000, 'uploads/products/33.png?v=1679502927', 1, 0, '2023-03-22 23:35:27', '2023-03-23 21:24:07'),
(34, 5, 13, 'Cải chip', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Cải th&igrave;a baby l&agrave; giống&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/rau-sach&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;rau&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;được nu&ocirc;i trồng v&agrave; đ&oacute;ng g&oacute;i theo những ti&ecirc;u chuẩn nghi&ecirc;m ngặt, bảo đảm c&aacute;c ti&ecirc;u chuẩn xanh - sạch, chất lượng v&agrave; an to&agrave;n với người d&ugrave;ng.&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/rau-sach/cai-thia-baby-goi-300g&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Cải th&igrave;a&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;nhỏ gi&ograve;n ngọt, chứa nhiều chất xơ n&ecirc;n thường được d&ugrave;ng để luộc hoặc x&agrave;o để giữ được độ tươi ngon nhất cho rau.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 15000, 'uploads/products/34.png?v=1679502998', 1, 0, '2023-03-22 23:36:38', '2023-03-23 21:21:51'),
(35, 5, 13, 'Cải bẹ 500g', '&lt;div class=&quot;short-description&quot; style=&quot;margin: 0px; padding: 5px; font-size: 14px; line-height: 25px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif;&quot;&gt;Cải bẹ xanh được nu&ocirc;i trồng v&agrave; đ&oacute;ng g&oacute;i theo những ti&ecirc;u chuẩn nghi&ecirc;m ngặt, bảo đảm c&aacute;c ti&ecirc;u chuẩn xanh - sach, chất lượng v&agrave; an to&agrave;n với người d&ugrave;ng. Với bẹ l&aacute; to, vị hơi đắng nhẹ, m&aacute;t v&agrave; thơm n&ecirc;n thường được d&ugrave;ng để nấu canh hoặc rau cuốn ăn k&egrave;m với b&aacute;nh x&egrave;o, gỏi cuốn.&lt;/div&gt;&lt;div class=&quot;short-description&quot; style=&quot;margin: 0px; padding: 5px; font-size: 14px; line-height: 25px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif;&quot;&gt;Cũng như nhiều loại&amp;nbsp;&lt;a href=&quot;https://www.bachhoaxanh.com/rau-sach&quot; target=&quot;_blank&quot; style=&quot;color: rgb(40, 138, 214); background-color: rgb(255, 255, 255); margin: 0px; padding: 0px;&quot;&gt;rau&lt;/a&gt;&amp;nbsp;kh&aacute;c, cải bẹ xanh chứa h&agrave;m lượng calories rất thấp nhưng lại c&oacute; nhiều chất dinh dưỡng cần thiết cho cơ thể như&amp;nbsp;&lt;strong style=&quot;font-weight: bold; margin: 0px; padding: 0px;&quot;&gt;Vitamin A, B, C, K, Axit nicotic, Abumin, Catoten&hellip;&lt;/strong&gt;&lt;br&gt;&lt;/div&gt;&lt;div class=&quot;short-description&quot; style=&quot;margin: 0px; padding: 5px; font-size: 14px; line-height: 25px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif;&quot;&gt;&lt;br&gt;&lt;/div&gt;', 30000, 'uploads/products/35.png?v=1679503061', 1, 0, '2023-03-22 23:37:41', '2023-03-23 21:21:04'),
(36, 5, 13, 'Cải thảo', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Bắp cải thảo l&agrave;&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/rau-sach&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;loại rau&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;c&oacute; bẹ l&aacute; to, gi&ograve;n, ngọt thường được d&ugrave;ng để nấu canh, x&agrave;o chung với rau củ hoặc để muối kim chi.&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/rau-sach/bap-cai-thao-tui-500gr&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Bắp cải thảo&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;của B&aacute;ch h&oacute;a Xanh được trồng tại L&acirc;m Đồng v&agrave; đ&oacute;ng g&oacute;i theo những ti&ecirc;u chuẩn nghi&ecirc;m ngặt, bảo đảm c&aacute;c ti&ecirc;u chuẩn xanh - sạch, chất lượng v&agrave; an to&agrave;n với người d&ugrave;ng.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 35000, 'uploads/products/36.png?v=1679503105', 1, 0, '2023-03-22 23:38:25', '2023-03-23 21:22:19'),
(37, 6, 17, 'Sữa rửa mặt tạo bọt Senka Perfect Whip 120g', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Roboto, Arial, sans-serif; font-size: 18px; font-weight: bold;&quot;&gt;C&ocirc;ng dụng của sữa rửa mặt tạo bọt Senka Perfect Whip 120g&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 8px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; line-height: inherit; font-family: Roboto, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; list-style: none; color: rgb(51, 51, 51);&quot;&gt;&lt;li style=&quot;margin: 5px 0px 0px 20px; padding: 0px; border: 0px; font: inherit; position: relative;&quot;&gt;&lt;a href=&quot;https://meta.vn/sua-rua-mat-c916&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font: inherit; color: rgb(0, 113, 196); cursor: pointer; display: initial;&quot;&gt;Sữa rửa mặt&lt;/a&gt;&amp;nbsp;Senka l&agrave; thương hiệu đến từ Nhật Bản, sản xuất ở H&agrave;n Quốc đảm bảo chất lượng v&agrave; an to&agrave;n cho l&agrave;n da.&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;margin: 5px 0px 0px 20px; padding: 0px; border: 0px; font: inherit; position: relative;&quot;&gt;&lt;a href=&quot;https://meta.vn/sua-rua-mat-tao-bot-senka-perfect-whip-120g-p68317&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font: inherit; color: rgb(0, 113, 196); cursor: pointer; display: initial;&quot;&gt;Senka Perfect Whip&lt;/a&gt;&amp;nbsp;120g được chiết xuất tơ tằm với c&ocirc;ng thức cải tiến tạo bọt cực mịn gi&uacute;p rửa bề mặt da v&agrave; cả b&ecirc;n trong lỗ ch&acirc;n l&ocirc;ng sạch ho&agrave;n hảo, cho l&agrave;n da s&aacute;ng mịn m&agrave;ng hơn.&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;margin: 5px 0px 0px 20px; padding: 0px; border: 0px; font: inherit; position: relative;&quot;&gt;Hơn nữa trong sữa rửa mặt Senka c&ograve;n chứa 2 loại Hyaluronic kết hợp kh&ocirc;ng chỉ gi&uacute;p kh&oacute;a lại độ ẩm tr&ecirc;n da m&agrave; c&ograve;n dễ d&agrave;ng thẩm thấu v&agrave;o da v&agrave; k&eacute;o d&agrave;i t&aacute;c dụng giữ ẩm.&lt;/li&gt;&lt;li style=&quot;margin: 5px 0px 0px 20px; padding: 0px; border: 0px; font: inherit; position: relative;&quot;&gt;Kh&ocirc;ng chỉ l&agrave;m sạch bụi bẩn m&agrave; sữa rửa mặt c&ograve;n gi&uacute;p l&agrave;m sạch b&atilde; nhờn s&acirc;u trong lỗ ch&acirc;n l&ocirc;ng, ngăn ngừa mụn hiệu quả.&lt;/li&gt;&lt;li style=&quot;margin: 5px 0px 0px 20px; padding: 0px; border: 0px; font: inherit; position: relative;&quot;&gt;Sữa rửa mặt tạo bọt Senka Perfect Whip thiết kế dạng tu&yacute;p với trọng lượng 120g cho thời gian sử dụng l&acirc;u d&agrave;i.&lt;/li&gt;&lt;li style=&quot;margin: 5px 0px 0px 20px; padding: 0px; border: 0px; font: inherit; position: relative;&quot;&gt;Sản phẩm th&iacute;ch hợp cho da dầu v&agrave; da hỗn hợp. D&ugrave;ng cho người từ 16 tuổi trở l&ecirc;n.&amp;nbsp;&lt;/li&gt;&lt;/ul&gt;', 345000, 'uploads/products/37.png?v=1679504684', 1, 0, '2023-03-22 23:44:45', '2023-03-23 00:04:44'),
(38, 6, 17, 'Sữa rửa mặt Simple', '&lt;div class=&quot;tt_box_detail width_common&quot; style=&quot;width: 894px; float: left; font-weight: 700; font-size: 18px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif;&quot;&gt;Th&agrave;nh phần sản phẩm&lt;/div&gt;&lt;div class=&quot;ct_box_detail width_common&quot; style=&quot;width: 894px; float: left; font-family: arial, helvetica, sans-serif; color: rgb(0, 0, 0); font-size: 13px;&quot;&gt;&lt;div class=&quot;width_common&quot; style=&quot;width: 894px; float: left;&quot;&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;Th&agrave;nh phần ch&iacute;nh:&lt;/strong&gt;&lt;/p&gt;&lt;ul style=&quot;margin-bottom: 10px;&quot;&gt;&lt;li&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;Nước tinh khiết lọc 3 lần:&amp;nbsp;&lt;/strong&gt;hỗ trợ l&agrave;m dịu l&agrave;n da nhạy cảm, k&iacute;ch ứng.&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;Pro-Vitamin B5 (Panthenol):&lt;/strong&gt;&amp;nbsp;gi&uacute;p phục hồi da, đặc biệt c&aacute;c v&ugrave;ng da bị sần s&ugrave;i, kh&ocirc; r&aacute;p, gi&uacute;p da mềm v&agrave; mịn m&agrave;ng hơn, nu&ocirc;i dưỡng da từ s&acirc;u b&ecirc;n trong.&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;Vitamin E:&amp;nbsp;&lt;/strong&gt;dưỡng ẩm v&agrave; chống oxy h&oacute;a.&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;B&lt;/strong&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;isalolol:&amp;nbsp;&lt;/strong&gt;chiết xuất từ hoa c&uacute;c Chamomile c&oacute; đặc t&iacute;nh kh&aacute;ng vi&ecirc;m, kh&aacute;ng khuẩn, ngăn ngừa k&iacute;ch ứng v&agrave; gi&uacute;p l&agrave;m dịu l&agrave;n da bị tổn thương, chống oxy h&oacute;a, dưỡng da mịn m&agrave;ng.&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;Th&agrave;nh phần chi tiết:&lt;/strong&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;Aqua, Cocamidopropyl Betaine, Propylene Glycol, Hydroxypropyl Methylcellulose, Panthenol, Disodium EDTA, Hydroxypropyl Cyclodextrin, Iodopropynyl Butylcarbamate, Pantolactone, Phenoxyethanol, Sodium Benzoate, Sodium Chloride, Sodium Hydroxide, Tocopheryl Acetate.&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &quot; helvetica=&quot;&quot; neue&quot;,=&quot;&quot; helvetica,=&quot;&quot; arial,=&quot;&quot; 文泉驛正黑,=&quot;&quot; &quot;wenquanyi=&quot;&quot; zen=&quot;&quot; hei&quot;,=&quot;&quot; &quot;hiragino=&quot;&quot; sans=&quot;&quot; gb&quot;,=&quot;&quot; &quot;儷黑=&quot;&quot; pro&quot;,=&quot;&quot; &quot;lihei=&quot;&quot; &quot;heiti=&quot;&quot; tc&quot;,=&quot;&quot; 微軟正黑體,=&quot;&quot; &quot;microsoft=&quot;&quot; jhenghei=&quot;&quot; ui&quot;,=&quot;&quot; jhenghei&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 14px;=&quot;&quot; white-space:=&quot;&quot; pre-wrap;&quot;=&quot;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;', 230000, 'uploads/products/38.png?v=1679504545', 1, 0, '2023-03-22 23:46:22', '2023-03-23 00:02:25'),
(39, 6, 17, 'Son Bbia Last Velvet Lip Tint', '&lt;p style=&quot;border: 0px solid rgb(229, 231, 235); --tw-shadow:0 0 transparent; --tw-ring-inset:var(--tw-empty, ); --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff; --tw-ring-color:rgba(59,130,246,0.5); --tw-ring-offset-shadow:0 0 transparent; --tw-ring-shadow:0 0 transparent; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(107, 114, 128); font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: medium; white-space: pre-wrap;&quot;&gt;&lt;a href=&quot;https://beecost.vn/t1264.b2097-son-moi-bbia.html&quot; style=&quot;border: 0px solid rgb(229, 231, 235); --tw-shadow:0 0 transparent; --tw-ring-inset:var(--tw-empty, ); --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff; --tw-ring-color:rgba(59,130,246,0.5); --tw-ring-offset-shadow:0 0 transparent; --tw-ring-shadow:0 0 transparent; color: inherit; text-decoration: inherit;&quot;&gt;Son Bbia&lt;/a&gt; Last Velvet Lip Tint l&agrave; bộ sưu tập mới toanh của &lt;a href=&quot;https://beecost.vn/b2097-bbia.html&quot; style=&quot;border: 0px solid rgb(229, 231, 235); --tw-shadow:0 0 transparent; --tw-ring-inset:var(--tw-empty, ); --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff; --tw-ring-color:rgba(59,130,246,0.5); --tw-ring-offset-shadow:0 0 transparent; --tw-ring-shadow:0 0 transparent; color: inherit; text-decoration: inherit;&quot;&gt;Bbia&lt;/a&gt; tiếp nối th&agrave;nh c&ocirc;ng của những d&ograve;ng son trước, với thiết kế nhỏ gọn đơn giản, trẻ trung, tuy kh&ocirc;ng bắt mắt lắm nhưng b&ugrave; lại m&agrave;u son th&igrave; đẹp tuyệt vời miễn ch&ecirc; lu&ocirc;n nh&eacute; c&aacute;c n&agrave;ng.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(107, 114, 128); font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: medium; white-space: pre-wrap;&quot;&gt; \r\n&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px solid rgb(229, 231, 235); --tw-shadow:0 0 transparent; --tw-ring-inset:var(--tw-empty, ); --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff; --tw-ring-color:rgba(59,130,246,0.5); --tw-ring-offset-shadow:0 0 transparent; --tw-ring-shadow:0 0 transparent; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(107, 114, 128); font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: medium; white-space: pre-wrap;&quot;&gt;Kết cấu của Bbia Last Velvet Lip Tint c&oacute; phần đặc hơn son tint v&agrave; lỏng hơn so với son kem một tẹo nhưng khi thoa l&ecirc;n m&ocirc;i th&igrave; c&aacute;c ph&acirc;n tử nhỏ li&ecirc;n kết chặt chẽ v&agrave; tiệp ngay v&agrave;o m&ocirc;i như son tint gi&uacute;p che đi những khuyết điểm của m&ocirc;i, cho bờ m&ocirc;i cảm gi&aacute;c tươi tắn khỏe mạnh.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(107, 114, 128); font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: medium; white-space: pre-wrap;&quot;&gt; \r\n&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px solid rgb(229, 231, 235); --tw-shadow:0 0 transparent; --tw-ring-inset:var(--tw-empty, ); --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff; --tw-ring-color:rgba(59,130,246,0.5); --tw-ring-offset-shadow:0 0 transparent; --tw-ring-shadow:0 0 transparent; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(107, 114, 128); font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: medium; white-space: pre-wrap;&quot;&gt;Chất son mướt mịn, l&ecirc;n m&agrave;u cực k&igrave; chuẩn, chỉ cần một lần thoa l&agrave; l&ecirc;n m&agrave;u r&otilde; v&agrave; sống động, dễ d&agrave;ng d&agrave;n trải đều tr&ecirc;n bờ m&ocirc;i v&agrave; nhanh ch&oacute;ng kh&ocirc; đi tạo th&agrave;nh một lớp son l&igrave; si&ecirc;u mịn c&oacute; thể giữ m&agrave;u bền l&acirc;u suốt nhiều giờ liền, kh&ocirc;ng g&acirc;y cảm gi&aacute;c d&agrave;y hay b&oacute;ng m&ocirc;i như một số d&ograve;ng son kem kh&aacute;c.&lt;/p&gt;', 450000, 'uploads/products/39.png?v=1679504863', 1, 0, '2023-03-22 23:48:14', '2023-03-23 00:07:43'),
(40, 6, 17, 'Phấn Nền Mac Chính Hãng', '&lt;p&gt;&lt;span style=&quot;font-weight: bolder; color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: medium;&quot;&gt;Phấn Mac&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: medium;&quot;&gt;&nbsp;l&agrave; d&ograve;ng sản phẩm nổi bật của thương hiệu c&ugrave;ng t&ecirc;n đến từ Mỹ, được rất nhiều kh&aacute;ch h&agrave;ng ưa chuộng với khả năng bắt s&aacute;ng tốt, tạo độ mịn cao, khả năng make up 2in1 vừa l&agrave;&nbsp;&lt;/span&gt;&lt;a title=&quot;phấn nền&quot; href=&quot;https://xachtaynhat.net/groups/trang-diem/phan/&quot; style=&quot;background-color: rgb(255, 255, 255); touch-action: manipulation; color: rgb(221, 51, 51); font-family: Lato, sans-serif; font-size: medium;&quot;&gt;phấn nền&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: medium;&quot;&gt;&nbsp;vừa l&agrave; phấn phủ, mang đến cho n&agrave;ng độ che phủ ho&agrave;n hảo kh&ocirc;ng t&igrave; viết nhưng kh&ocirc;ng l&agrave;m b&iacute; da. Ch&iacute;nh v&igrave; điều đ&oacute; m&agrave; M.A.C được nhiều chuy&ecirc;n gia trang điểm tr&ecirc;n thế giới tin d&ugrave;ng.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 280000, 'uploads/products/40.png?v=1679504782', 1, 0, '2023-03-22 23:49:56', '2023-03-23 00:06:22');
INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(41, 6, 17, 'Gel Rửa Mặt La Roche-Posay Dành Cho Da Dầu, Nhạy Cảm 200ml', '&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;L&agrave; kh&aacute;ch h&agrave;ng của L66 Studio, bạn sẽ được:&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;\r\n&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;👉 FREESHIP cho tất cả c&aacute;c đơn h&agrave;ng từ 150K&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;\r\n&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;👉 Cam kết chất lượng v&agrave; mẫu m&atilde; sản phẩm giống với h&igrave;nh ảnh.&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;\r\n&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;👉 Ho&agrave;n tiền nếu sản phẩm kh&ocirc;ng giống với m&ocirc; tả.&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;\r\n&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;👉 Cam kết được đổi trả h&agrave;ng trong v&ograve;ng 2 ng&agrave;y&lt;/p&gt;', 178000, 'uploads/products/41.png?v=1679504608', 1, 0, '2023-03-22 23:51:33', '2023-03-23 00:03:28'),
(42, 5, 15, 'Thịt gà nguyên con', '&lt;p&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga/ga-ta-nguyen-con-cp-11kg-15kg-con&quot; style=&quot;color: rgb(40, 138, 214); background-color: rgb(255, 255, 255); margin: 0px; padding: 0px; font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;G&agrave; ta nguy&ecirc;n con&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&nbsp;c&oacute; thịt dai ngon, mềm thơm chất lượng.&nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga&quot; style=&quot;color: rgb(40, 138, 214); background-color: rgb(255, 255, 255); margin: 0px; padding: 0px; font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Thịt g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&nbsp;c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon, hấp dẫn cho gia đ&igrave;nh v&agrave; bạn b&egrave; thưởng thức. G&agrave; ta được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 110000, 'uploads/products/42.png?v=1679582801', 1, 0, '2023-03-23 21:46:11', '2023-03-23 21:46:41'),
(43, 5, 15, 'Lườn gà phi lê', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Lườn g&agrave; c&oacute; thịt dai ngon, mềm thơm chất lượng.&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga&quot; style=&quot;color: rgb(40, 138, 214); background-color: rgb(255, 255, 255); margin: 0px; padding: 0px; font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Thịt g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon, hấp dẫn cho gia đ&igrave;nh v&agrave; bạn b&egrave; thưởng thức. G&agrave; ta được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 45000, 'uploads/products/43.png?v=1679582936', 1, 0, '2023-03-23 21:48:56', '2023-03-23 21:48:56'),
(44, 5, 15, 'Đùi gà', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;G&agrave; c&oacute; thịt dai ngon, mềm thơm chất lượng.&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga&quot; style=&quot;color: rgb(40, 138, 214); background-color: rgb(255, 255, 255); margin: 0px; padding: 0px; font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Thịt g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon, hấp dẫn cho gia đ&igrave;nh v&agrave; bạn b&egrave; thưởng thức. G&agrave; ta được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 35000, 'uploads/products/44.png?v=1679583096', 1, 0, '2023-03-23 21:51:36', '2023-03-23 21:51:36'),
(45, 7, 19, 'Snack bí đỏ', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;Loại bánh Snack b&iacute; đỏ\r\n&bull;	Năng lượng 570kcal/100g\r\n&bull;	Thành ph&acirc;̀n Khoai t&acirc;y tươi, dầu thực vật, bột gia vị tảo biển 5% (đường, maltodextrin, muối, bột sữa, chất điều vị mononatri glutamat (E621), bột h&agrave;nh, bột tỏi, tảo biển), dầu chiết xuất từ c&acirc;y hương thảo\r\n&bull;	Bảo quản Bảo quản nơi kh&ocirc; m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp v&agrave; nhiệt độ cao\r\n&bull;	Nơi sản xu&acirc;́t Việt Nam&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 5000, 'uploads/products/45.png?v=1679583979', 1, 0, '2023-03-23 22:06:19', '2023-03-23 22:06:19'),
(46, 7, 19, 'Snack khoai tây kim chi', '&lt;p&gt;Loại bánh Snack khoai t&acirc;y kim chi H&agrave;n Quốc&lt;/p&gt;&lt;p&gt;&bull;&lt;span style=&quot;white-space:pre&quot;&gt;	&lt;/span&gt;Năng lượng 570kcal/100g&lt;/p&gt;&lt;p&gt;&bull;&lt;span style=&quot;white-space:pre&quot;&gt;	&lt;/span&gt;Thành ph&acirc;̀n Khoai t&acirc;y tươi, dầu thực vật, bột gia vị tảo biển 5% (đường, maltodextrin, muối, bột sữa, chất điều vị mononatri glutamat (E621), bột h&agrave;nh, bột tỏi, tảo biển), dầu chiết xuất từ c&acirc;y hương thảo&lt;/p&gt;&lt;p&gt;&bull;&lt;span style=&quot;white-space:pre&quot;&gt;	&lt;/span&gt;Bảo quản Bảo quản nơi kh&ocirc; m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp v&agrave; nhiệt độ cao&lt;/p&gt;&lt;p&gt;&bull;&lt;span style=&quot;white-space:pre&quot;&gt;	&lt;/span&gt;Thương hiệu O&#039;Star (H&agrave;n Quốc)&lt;/p&gt;', 6000, 'uploads/products/46.png?v=1679584061', 1, 0, '2023-03-23 22:07:41', '2023-03-23 22:07:41'),
(47, 7, 20, 'Thị gà xé sợi', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;🌾🌾&amp;nbsp;L&agrave; m&oacute;n ăn đặc trưng để l&agrave;m mồi khai vị cho bữa tiệc,&amp;nbsp; ăn vặt,&amp;nbsp; hay l&agrave;m qu&agrave; biếu,&amp;nbsp; mang đi xa.&amp;nbsp;\r\n\r\n🌾🌾&amp;nbsp;H&agrave;ng mới tinh, đ&oacute;ng g&oacute;i cẩn thận n&ecirc;n kh&aacute;ch h&agrave;ng c&oacute; thể y&ecirc;n t&acirc;m.&amp;nbsp;\r\n\r\n🌾🌾&amp;nbsp;Sử dụng đơn giản. Khi nhận được h&agrave;ng qu&yacute; kh&aacute;ch c&oacute; thể b&oacute;c ra ăn lu&ocirc;n,&amp;nbsp; ăn bất kỳ nơi đ&acirc;u v&agrave; mọi l&uacute;c (chỉ cần b&oacute;c ra x&eacute; l&agrave; ăn ngay được) m&agrave; kh&ocirc;ng cần quay l&ograve; vi s&oacute;ng hay hấp n&oacute;ng.&amp;nbsp;\r\n\r\n🌾🌾&amp;nbsp;Gia vị vừa đủ để ăn ngay,&amp;nbsp; nếu th&iacute;ch cay đậm qu&yacute; kh&aacute;ch c&oacute; thể chấm th&ecirc;m tương ớt,&amp;nbsp; ,&amp;nbsp; hoặc vắt chanh th&ecirc;m , qu&yacute; kh&aacute;ch vắt chanh v&agrave;o chấm thịt thơm ngon nh&eacute;.&amp;nbsp;\r\n\r\n🌾🌾&amp;nbsp;H&agrave;ng kh&ocirc;ng chất bảo quản, khi nhận h&agrave;ng kh&aacute;ch h&agrave;ng nhớ bảo quản theo hướng dẫn in tr&ecirc;n bao b&igrave;\r\n\r\n🌿&amp;nbsp;Cam kết h&agrave;ng loại 1. H&agrave;ng lu&ocirc;n lu&ocirc;n đảm bảo l&agrave;m từ thịt tươi mới, kh&ocirc;ng chất bảo quản, kh&ocirc;ng phẩm m&agrave;u.&amp;nbsp; Nhận h&agrave;ng ăn ngay kh&ocirc;ng cần ch&agrave;y cối đập dập.&amp;nbsp;\r\n\r\n🌿Hạn d&ugrave;ng 6 thang kể từ ng&agrave;y sản xuất&amp;nbsp;\r\n\r\n🌿Xuất xứ: Việt Nam&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 30000, 'uploads/products/47.png?v=1679584227', 1, 0, '2023-03-23 22:10:27', '2023-03-23 22:10:27'),
(48, 7, 20, 'Khô bò ', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;Hũ 500gram KH&Ocirc; B&Ograve; SỢI - kh&ocirc; b&ograve; tẩm vị\r\n- Cam kết Kh&ocirc; b&ograve; sợi h&agrave;ng loại 1 c&ugrave;ng với c&aacute;c gia vị gi&uacute;p sản phẩm chuẩn vị THỊT B&Ograve; . \r\n\r\n🌾🌾 L&agrave; một m&oacute;n ăn vặt th&uacute; vị trong những ng&agrave;y trời se lạnh , m&oacute;n thịt kh&ocirc; thơm lừng đặc trưng m&ugrave;i\r\n THỊT B&Ograve;, hương vị kh&ocirc;ng thể n&agrave;o qu&ecirc;n nếu 1 lần được thưởng thức. \r\n\r\n 🌾🌾 B&Ograve; KH&Ocirc; SỢI của shop  l&agrave; thịt tươi được lựa chọn kỹ c&agrave;ng l&agrave; những con lợn gi&agrave;, lợn n&aacute;i th&igrave; thịt mới sạch, dai v&agrave; thơm ngon được. Nh&agrave; m&igrave;nh kh&ocirc;ng l&agrave;m lợn bổi đại tr&agrave; như h&agrave;ng b&aacute;n ngo&agrave;i chợ (lợn bổi b&aacute;n ngo&agrave;i chợ l&agrave;m rất hao v&agrave; bở ăn ko ngon).\r\n\r\n🌾🌾 3kg thịt tươi mới sẽ cho ra th&agrave;nh phẩm l&agrave; 1kg thịt kh&ocirc; như &yacute;. \r\n\r\n🌾🌾 L&agrave; m&oacute;n ăn đặc trưng để l&agrave;m mồi khai vị cho bữa tiệc,  ăn vặt,  hay l&agrave;m qu&agrave; biếu,  mang đi xa. \r\n\r\n🌾🌾 L&agrave; m&oacute;n ăn thơm lừng vị TI&Ecirc;U ĐẮC N&Ocirc;NG, ỚT HIỂM LẠNG SƠN,  vị ngọt dai của thịt,  rất ngon. \r\n\r\n🌾🌾 H&agrave;ng mới tinh, đ&oacute;ng g&oacute;i cẩn thận n&ecirc;n kh&aacute;ch h&agrave;ng c&oacute; thể y&ecirc;n t&acirc;m. \r\n\r\n🌾🌾 Sử dụng đơn giản. Khi nhận được h&agrave;ng qu&yacute; kh&aacute;ch c&oacute; thể b&oacute;c ra ăn lu&ocirc;n,  ăn bất kỳ nơi đ&acirc;u v&agrave; mọi l&uacute;c (chỉ cần b&oacute;c ra x&eacute; l&agrave; ăn ngay được) m&agrave; kh&ocirc;ng cần quay l&ograve; vi s&oacute;ng hay hấp n&oacute;ng. \r\n\r\n🌾🌾 Gia vị vừa đủ để ăn ngay,  nếu th&iacute;ch cay đậm qu&yacute; kh&aacute;ch c&oacute; thể chấm th&ecirc;m tương ớt,  ,  hoặc vắt chanh th&ecirc;m , qu&yacute; kh&aacute;ch vắt chanh v&agrave;o chấm thịt thơm ngon nh&eacute;. \r\n\r\n🌾🌾 H&agrave;ng kh&ocirc;ng chất bảo quản, khi nhận h&agrave;ng kh&aacute;ch h&agrave;ng nhớ bảo quản theo hướng dẫn in tr&ecirc;n bao b&igrave;\r\n\r\n🌿 Cam kết h&agrave;ng loại 1. H&agrave;ng lu&ocirc;n lu&ocirc;n đảm bảo l&agrave;m từ thịt tươi mới, kh&ocirc;ng chất bảo quản, kh&ocirc;ng phẩm m&agrave;u.  Nhận h&agrave;ng ăn ngay kh&ocirc;ng cần ch&agrave;y cối đập dập. \r\nNg&agrave;y sản xuất in tr&ecirc;n bao b&igrave;\r\n🌿Hạn d&ugrave;ng 6 năm kể từ ng&agrave;y sản xuất &lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 55000, 'uploads/products/48.png?v=1679584397', 1, 0, '2023-03-23 22:13:17', '2023-03-23 22:13:17'),
(49, 7, 18, 'Hạt hướng dương 500g', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;Hướng dương tẩm vị Caramen nh&atilde;n hiệu Lao jie kou g&oacute;i 500g - H&agrave;ng ch&iacute;nh h&atilde;ng, c&oacute; h&oacute;a đơn nhập khẩu ch&iacute;nh nghạch\r\nKH&Aacute;CH H&Agrave;NG LƯU &Yacute;: HIỆN TẠI M&Atilde; HƯỚNG DƯƠNG N&Agrave;Y Đ&Atilde; C&Oacute; H&Agrave;NG GIẢ, H&Agrave;NG NH&Aacute;I, VẬY N&Ecirc;N H&Atilde;Y THẬT S&Aacute;NG SUỐT KHI LỰA CHỌN SẢN PHẨM NH&Eacute;!\r\n- Tại sao lại mua hướng dương bịch bịch kh&ocirc;ng r&otilde; ng&agrave;y sản xuất v&agrave; hạn sử dụng b&aacute;n theo k&iacute; ngo&agrave;i chợ, khi m&agrave; loại hạt được lựa đều, tẩm ướp, đ&oacute;ng g&oacute;i, c&oacute; zip tr&aacute;nh ẩm gi&aacute; gom rẻ như thế n&agrave;yyyy 😹\r\n- Hạt tẩm vị đặc trưng hoặc c&aacute;c vị nổi bật theo từng g&oacute;i &amp;lt;3\r\n- Date 6th từ ng&agrave;y sản xuất \r\nShop c&ograve;n sẵn 2 vị: &oacute;c ch&oacute;, Caramen\r\nXuất xứ: Trung Quốc\r\nHạn sử dụng: 6 th&aacute;ng kể từ NSX in tr&ecirc;n bao b&igrave;\r\nHDSD: Ăn trực tiếp, sử dụng ngay sau khi mở t&uacute;i\r\nBảo quản ở nhiệt độ thường, tr&aacute;nh &aacute;nh nắng chiếu trực tiếp v&agrave; nơi ẩm ướt\r\n**Cam kết từ shop: \r\n- Sản phẩm đ&atilde; được kiểm duyệt v&agrave; đảm bảo An to&agrave;n vệ sinh thực phẩm.\r\n - Cam kết h&agrave;ng đ&uacute;ng ch&iacute;nh h&atilde;ng, nếu ph&aacute;t hiện giả đền gấp đ&ocirc;i đơn h&agrave;ng.\r\n - Nhận được h&agrave;ng, qu&yacute; kh&aacute;ch vui l&ograve;ng kiểm tra đơn h&agrave;ng. Qu&yacute; kh&aacute;ch chỉ được đổi trả sản phẩm nếu b&ecirc;n shop giao sai sản phẩm. Kh&ocirc;ng nhận đổi trả nếu b&aacute;nh chỉ bị bẹp, dẹp về ngoại quan, đ&acirc;y l&agrave; vấn đề kh&aacute;ch quan do b&ecirc;n vận chuyển n&ecirc;n b&ecirc;n shop kh&ocirc;ng giải quyết.&lt;/span&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;Hướng dương tẩm vị Caramen nh&atilde;n hiệu Lao jie kou g&oacute;i 500g - H&agrave;ng ch&iacute;nh h&atilde;ng, c&oacute; h&oacute;a đơn nhập khẩu ch&iacute;nh nghạch&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;KH&Aacute;CH H&Agrave;NG LƯU &Yacute;: HIỆN TẠI M&Atilde; HƯỚNG DƯƠNG N&Agrave;Y Đ&Atilde; C&Oacute; H&Agrave;NG GIẢ, H&Agrave;NG NH&Aacute;I, VẬY N&Ecirc;N H&Atilde;Y THẬT S&Aacute;NG SUỐT KHI LỰA CHỌN SẢN PHẨM NH&Eacute;!\r\n- Tại sao lại mua hướng dương bịch bịch kh&ocirc;ng r&otilde; ng&agrave;y sản xuất v&agrave; hạn sử dụng b&aacute;n theo k&iacute; ngo&agrave;i chợ, khi m&agrave; loại hạt được lựa đều, tẩm ướp, đ&oacute;ng g&oacute;i, c&oacute; zip tr&aacute;nh ẩm gi&aacute; gom rẻ như thế n&agrave;yyyy 😹\r\n- Hạt tẩm vị đặc trưng hoặc c&aacute;c vị nổi bật theo từng g&oacute;i &amp;lt;3\r\n- Date 6th từ ng&agrave;y sản xuất \r\nShop c&ograve;n sẵn 2 vị: &oacute;c ch&oacute;, Caramen\r\nXuất xứ: Trung Quốc\r\nHạn sử dụng: 6 th&aacute;ng kể từ NSX in tr&ecirc;n bao b&igrave;\r\nHDSD: Ăn trực tiếp, sử dụng ngay sau khi mở t&uacute;i\r\nBảo quản ở nhiệt độ thường, tr&aacute;nh &aacute;nh nắng chiếu trực tiếp v&agrave; nơi ẩm ướt\r\n**Cam kết từ shop: \r\n- Sản phẩm đ&atilde; được kiểm duyệt v&agrave; đảm bảo An to&agrave;n vệ sinh thực phẩm.\r\n - Cam kết h&agrave;ng đ&uacute;ng ch&iacute;nh h&atilde;ng, nếu ph&aacute;t hiện giả đền gấp đ&ocirc;i đơn h&agrave;ng.\r\n - Nhận được h&agrave;ng, qu&yacute; kh&aacute;ch vui l&ograve;ng kiểm tra đơn h&agrave;ng. Qu&yacute; kh&aacute;ch chỉ được đổi trả sản phẩm nếu b&ecirc;n shop giao sai sản phẩm. Kh&ocirc;ng nhận đổi trả nếu b&aacute;nh chỉ bị bẹp, dẹp về ngoại quan, đ&acirc;y l&agrave; vấn đề kh&aacute;ch quan do b&ecirc;n vận chuyển n&ecirc;n b&ecirc;n shop kh&ocirc;ng giải quyết.&lt;/span&gt;', 50000, 'uploads/products/49.png?v=1679584517', 1, 0, '2023-03-23 22:15:17', '2023-03-23 22:15:17'),
(50, 7, 18, 'Hạt Macca', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;H&agrave;ng lu&ocirc;n mới     MACCA SẠCH L&Acirc;M ĐỒNG 100%\r\n\r\nNh&agrave; m&igrave;nh chuy&ecirc;n cung cấp sỉ MACCA vậy n&ecirc;n m&igrave;nh b&aacute;n lẻ cho c&aacute;c bạn ăn thử với gi&aacute; cực y&ecirc;u thương nh&eacute;.\r\n -  H&agrave;ng mới thơm ngon đảm bảo kh&ocirc;ng bị h&ocirc;i dầu.\r\n- MACCA nh&agrave; m&igrave;nh lu&ocirc;n mới đảm bảo kh&ocirc;ng c&oacute; chất bảo quản l&ecirc;n cực kỳ an to&agrave;n cho b&eacute; v&agrave; phụ nữ mang thai nh&eacute;.\r\n\r\nTH&Agrave;NH PHẦN DINH DƯỠNG TRONG 100GR HẠT MACCA\r\n\r\n- 8.6gr (23%) lượng chất xơ thực phẩm được khuy&ecirc;n d&ugrave;ng.\r\n- Với 718 calo/100gr hạt mắc ca l&agrave; loại hạt c&oacute; gi&aacute; trị calo cao nhất trong c&aacute;c loại hạt dinh dưỡng.\r\n- 21% vitamin B6, 100% thiamin, v&agrave; 12% riboflavin\r\n- L&agrave; nguồn cung cấp dồi d&agrave;o c&aacute;c kho&aacute;ng chất quan trọng cho cơ thể như: canxi, kẽm, maz&ecirc;, sắt&hellip;\r\n\r\n8 C&Ocirc;NG DỤNG TUYỆT VỜI CỦA HẠT MACCA M&Agrave; BẠN N&Ecirc;N BIẾT\r\n\r\n    1.Chứa chất b&eacute;o l&agrave;nh mạnh tốt cho tim mạch.\r\n    2. Chứa nguồn chất đạm (protein) phong ph&uacute;:    \r\n    3. Cung cấp năng lượng cho cơ thể\r\n    4. Hạt Mắc ca gi&agrave;u chất xơ, hỗ trợ giảm c&acirc;n v&agrave;&amp;nbsp;nhuận tr&agrave;ng\r\n    5. Hạt mắc ca tốt cho xương\r\n     6. Tốt cho n&atilde;o bộ\r\n     7. Hạt mắc ca tốt cho sức khỏe sinh lữ\r\n     8. Mắc ca nguồn dinh dưỡng thực vật đặc biệt\r\nHsd : 12 th&aacute;ng\r\nXuất xứ : L&acirc;m Đồng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 185000, 'uploads/products/50.png?v=1679584605', 1, 0, '2023-03-23 22:16:45', '2023-03-23 22:16:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Đồ khô', 1, 0, '2022-02-09 08:49:34', '2023-03-23 11:00:06'),
(2, 'Mỹ phẩm', 1, 0, '2022-02-09 08:49:46', '2023-03-23 11:00:21'),
(3, 'Trang sức', 1, 0, '2022-02-09 08:50:31', '2023-03-23 10:59:52'),
(4, 'Thực phẩm', 1, 0, '2022-02-09 08:50:36', '2023-03-23 10:53:58'),
(5, 'Others', 1, 1, '2022-02-09 08:50:41', '2022-02-09 08:50:45'),
(6, 'Đồ gia dụng', 1, 0, '2023-03-23 16:43:54', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'HỆ THỐNG QUẢN LÝ CÁC GIAN HÀNG TRỰC TUYẾN  '),
(6, 'short_name', 'MVOGMS - PHP'),
(11, 'logo', 'uploads/logo-1679584865.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1679585902.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1644472635', NULL, 1, '2021-01-20 14:02:37', '2022-02-10 13:57:15'),
(11, 'Vu', 'Hoi', 'Rosalie', 'c70c78ad1d547b8ab235b52604cddd17', 'uploads/avatar-11.png?v=1678549087', NULL, 1, '2022-02-10 13:55:52', '2023-03-23 11:16:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(2, '202202-00002', 1, 'Shop102', 'John Miller', '09123456789', 'shop102', '90be022251077e3488c998613214df74', 'uploads/vendors/2.png?v=1644375129', 1, 1, '2022-02-09 10:52:09', '2023-03-22 23:56:26'),
(4, '202303-00001', 2, 'Shop Linh Giang', 'Rosalie', '09876536745', 'Rosalie', 'c70c78ad1d547b8ab235b52604cddd17', 'uploads/vendors/4.png?v=1678549766', 1, 0, '2023-03-11 22:49:26', '2023-03-11 22:49:26'),
(5, '202303-00002', 3, 'Shop Thỏa Hý', 'Nguyễn Thị Thỏa', '09876536745', 'ThoaHy', '908a316ea8afa378a0d5b9b3345aa108', 'uploads/vendors/5.png?v=1679501863', 1, 0, '2023-03-22 23:17:43', '2023-03-23 11:26:42'),
(6, '202303-00003', 3, 'Thu Hoài', 'Trương Thị Thu Hoài', '09876536745', 'ThuHoai', '25f9e794323b453885f5181f1b624d0b', 'uploads/vendors/6.png?v=1679503271', 1, 0, '2023-03-22 23:41:11', '2023-03-22 23:41:11'),
(7, '202303-00004', 1, 'Shop Duy Hiếu', 'Cao Duy Hiếu', '04363674748', 'DuyHieu', '25f9e794323b453885f5181f1b624d0b', 'uploads/vendors/7.png?v=1679583240', 1, 0, '2023-03-23 21:54:00', '2023-03-23 21:54:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Chỉ mục cho bảng `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Chỉ mục cho bảng `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Chỉ mục cho bảng `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
