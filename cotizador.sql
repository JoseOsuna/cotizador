-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-07-2021 a las 04:52:47
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cotizador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aps_article`
--

CREATE TABLE `aps_article` (
  `id` bigint(20) NOT NULL,
  `name` longtext NOT NULL,
  `desc` longtext DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` decimal(12,3) NOT NULL,
  `type_article` varchar(8) NOT NULL,
  `service_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aps_article`
--

INSERT INTO `aps_article` (`id`, `name`, `desc`, `image`, `price`, `type_article`, `service_id`) VALUES
(1, 'Pack dominio.com hosting - hasta 50 cuentas de correo - por 1 año', 'Pack dominio.com hosting - hasta 50 cuentas de correo - por 1 año', '', '100000.000', 'OPCIONAL', 1),
(2, 'Pack dominio.com hosting - hasta 100 cuentas de correo - por 1 año', 'Pack dominio.com hosting - hasta 100 cuentas de correo - por 1 año', '', '110000.000', 'OPCIONAL', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aps_business`
--

CREATE TABLE `aps_business` (
  `id` bigint(20) NOT NULL,
  `company_name` varchar(150) NOT NULL,
  `Legal_representative` varchar(150) NOT NULL,
  `nit` varchar(13) NOT NULL,
  `company_address` longtext DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aps_costumer`
--

CREATE TABLE `aps_costumer` (
  `id` bigint(20) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aps_discount`
--

CREATE TABLE `aps_discount` (
  `id` bigint(20) NOT NULL,
  `percentage` decimal(3,2) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aps_discount`
--

INSERT INTO `aps_discount` (`id`, `percentage`, `created_at`) VALUES
(1, '5.00', '2021-07-26 02:32:21.092024'),
(2, '9.00', '2021-07-26 02:32:38.009660');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aps_plan`
--

CREATE TABLE `aps_plan` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `desc` longtext DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aps_plan`
--

INSERT INTO `aps_plan` (`id`, `name`, `desc`, `image`) VALUES
(1, 'Plan Básico', 'Páginas Web a la medida, eCommerce, Blogs, LandinPages…', 'imgs/plan/2021/07/25/Enmascarar_grupo_-1.png'),
(2, 'Plan Emprender', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent interdum rutru.', 'imgs/plan/2021/07/25/Enmascarar_grupo_8.png'),
(3, 'Plan Standar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent interdum rutru.', 'imgs/plan/2021/07/25/Enmascarar_grupo_9.png'),
(4, 'Tienda Virtual', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent interdum rutru.', 'imgs/plan/2021/07/25/Enmascarar_grupo_10.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aps_quote`
--

CREATE TABLE `aps_quote` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `time` datetime(6) NOT NULL,
  `subtotal` decimal(12,3) NOT NULL,
  `total` decimal(12,3) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `Articles_id` bigint(20) NOT NULL,
  `business_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `discounts_id` bigint(20) NOT NULL,
  `services_id` bigint(20) NOT NULL,
  `tax_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aps_service`
--

CREATE TABLE `aps_service` (
  `id` bigint(20) NOT NULL,
  `name` longtext NOT NULL,
  `desc` longtext DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` decimal(12,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aps_service`
--

INSERT INTO `aps_service` (`id`, `name`, `desc`, `image`, `price`) VALUES
(1, 'Diseño de Páginas Web', 'Páginas Web a la medida, eCommerce, Blogs, LandinPages…', 'imgs/service/2021/07/25/Enmascarar_grupo_-1.png', '500000.000'),
(2, 'Marketing Digital', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent interdum rutru.', 'imgs/service/2021/07/25/Enmascarar_grupo_3.png', '0.000'),
(3, 'Diseño Gráfico', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent interdum rutru.', 'imgs/service/2021/07/25/Enmascarar_grupo_4.png', '100000.000'),
(4, 'Imagen Corporativa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent interdum rutru.', 'imgs/service/2021/07/25/Imagen_8.png', '1000000.000'),
(5, 'Renderizado 3D', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent interdum rutru.', 'imgs/service/2021/07/25/Enmascarar_grupo_6.png', '100000.000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aps_tax`
--

CREATE TABLE `aps_tax` (
  `id` bigint(20) NOT NULL,
  `percentage` decimal(3,2) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aps_tax`
--

INSERT INTO `aps_tax` (`id`, `percentage`, `created_at`) VALUES
(1, '9.00', '2021-07-26 02:36:10.789141');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'programadores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 1, 56);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_permission`
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
(25, 'Can add Article', 7, 'add_article'),
(26, 'Can change Article', 7, 'change_article'),
(27, 'Can delete Article', 7, 'delete_article'),
(28, 'Can view Article', 7, 'view_article'),
(29, 'Can add Business', 8, 'add_business'),
(30, 'Can change Business', 8, 'change_business'),
(31, 'Can delete Business', 8, 'delete_business'),
(32, 'Can view Business', 8, 'view_business'),
(33, 'Can add Costumer', 9, 'add_costumer'),
(34, 'Can change Costumer', 9, 'change_costumer'),
(35, 'Can delete Costumer', 9, 'delete_costumer'),
(36, 'Can view Costumer', 9, 'view_costumer'),
(37, 'Can add Discount', 10, 'add_discount'),
(38, 'Can change Discount', 10, 'change_discount'),
(39, 'Can delete Discount', 10, 'delete_discount'),
(40, 'Can view Discount', 10, 'view_discount'),
(41, 'Can add Plan', 11, 'add_plan'),
(42, 'Can change Plan', 11, 'change_plan'),
(43, 'Can delete Plan', 11, 'delete_plan'),
(44, 'Can view Plan', 11, 'view_plan'),
(45, 'Can add Service', 12, 'add_service'),
(46, 'Can change Service', 12, 'change_service'),
(47, 'Can delete Service', 12, 'delete_service'),
(48, 'Can view Service', 12, 'view_service'),
(49, 'Can add Tax', 13, 'add_tax'),
(50, 'Can change Tax', 13, 'change_tax'),
(51, 'Can delete Tax', 13, 'delete_tax'),
(52, 'Can view Tax', 13, 'view_tax'),
(53, 'Can add Quote', 14, 'add_quote'),
(54, 'Can change Quote', 14, 'change_quote'),
(55, 'Can delete Quote', 14, 'delete_quote'),
(56, 'Can view Quote', 14, 'view_quote');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
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
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$e77FdFsjFtpHJWuzekxH10$QTS486U8KyHAEvA09qbryUe5ObjmGIGCNv+lIlQ3UTo=', '2021-07-26 02:43:01.578666', 1, 'admin', '', '', 'jose.19.osuna@gmail.com', 1, 1, '2021-07-26 02:10:56.575216'),
(2, 'pbkdf2_sha256$260000$QALWG3sgVjZDaNYpPOnLyz$Dm/2hdgZYYTfHshnDdVR9HUkYJoPMhZbBe0wezKOgEo=', NULL, 0, 'manuel', '', '', '', 0, 1, '2021-07-26 02:39:14.129846');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL
) ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-07-26 02:12:50.269957', '1', 'Plan Básico', 1, '[{\"added\": {}}]', 12, 1),
(2, '2021-07-26 02:13:31.997682', '1', 'Diseño de Páginas Web', 2, '[{\"changed\": {\"fields\": [\"Nombre del servicio\"]}}]', 12, 1),
(3, '2021-07-26 02:15:00.207117', '1', 'Plan Básico', 1, '[{\"added\": {}}]', 11, 1),
(4, '2021-07-26 02:27:39.054287', '2', 'Marketing Digital', 1, '[{\"added\": {}}]', 12, 1),
(5, '2021-07-26 02:32:02.513234', '1', 'Pack dominio.com hosting - hasta 50 cuentas de correo - por 1 año', 1, '[{\"added\": {}}]', 7, 1),
(6, '2021-07-26 02:32:21.247436', '1', '5', 1, '[{\"added\": {}}]', 10, 1),
(7, '2021-07-26 02:32:38.087602', '2', '9', 1, '[{\"added\": {}}]', 10, 1),
(8, '2021-07-26 02:33:31.586557', '2', 'Plan Emprender', 1, '[{\"added\": {}}]', 11, 1),
(9, '2021-07-26 02:34:06.652528', '3', 'Plan Standar', 1, '[{\"added\": {}}]', 11, 1),
(10, '2021-07-26 02:34:50.065865', '3', 'Diseño Gráfico', 1, '[{\"added\": {}}]', 12, 1),
(11, '2021-07-26 02:35:49.955091', '4', 'Imagen Corporativa', 1, '[{\"added\": {}}]', 12, 1),
(12, '2021-07-26 02:36:10.860097', '1', '9', 1, '[{\"added\": {}}]', 13, 1),
(13, '2021-07-26 02:36:42.991423', '1', 'programadores', 1, '[{\"added\": {}}]', 3, 1),
(14, '2021-07-26 02:39:14.652314', '2', 'manuel', 1, '[{\"added\": {}}]', 4, 1),
(15, '2021-07-26 02:43:36.368725', '2', 'Pack dominio.com hosting - hasta 100 cuentas de correo - por 1 año', 1, '[{\"added\": {}}]', 7, 1),
(16, '2021-07-26 02:44:23.044249', '4', 'Tienda Virtual', 1, '[{\"added\": {}}]', 11, 1),
(17, '2021-07-26 02:45:07.546033', '5', 'Renderizado 3D', 1, '[{\"added\": {}}]', 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'aps', 'article'),
(8, 'aps', 'business'),
(9, 'aps', 'costumer'),
(10, 'aps', 'discount'),
(11, 'aps', 'plan'),
(14, 'aps', 'quote'),
(12, 'aps', 'service'),
(13, 'aps', 'tax'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-07-26 02:08:04.865856'),
(2, 'auth', '0001_initial', '2021-07-26 02:08:39.795385'),
(3, 'admin', '0001_initial', '2021-07-26 02:08:51.167885'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-07-26 02:08:51.515809'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-07-26 02:08:52.146423'),
(6, 'aps', '0001_initial', '2021-07-26 02:09:21.591729'),
(7, 'contenttypes', '0002_remove_content_type_name', '2021-07-26 02:09:23.916570'),
(8, 'auth', '0002_alter_permission_name_max_length', '2021-07-26 02:09:24.249202'),
(9, 'auth', '0003_alter_user_email_max_length', '2021-07-26 02:09:25.023462'),
(10, 'auth', '0004_alter_user_username_opts', '2021-07-26 02:09:25.129478'),
(11, 'auth', '0005_alter_user_last_login_null', '2021-07-26 02:09:26.821625'),
(12, 'auth', '0006_require_contenttypes_0002', '2021-07-26 02:09:26.869668'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2021-07-26 02:09:26.943864'),
(14, 'auth', '0008_alter_user_username_max_length', '2021-07-26 02:09:27.404891'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2021-07-26 02:09:28.521264'),
(16, 'auth', '0010_alter_group_name_max_length', '2021-07-26 02:09:28.704491'),
(17, 'auth', '0011_update_proxy_permissions', '2021-07-26 02:09:28.802204'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2021-07-26 02:09:29.254484'),
(19, 'sessions', '0001_initial', '2021-07-26 02:09:30.946881');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('gbh2sxqg5r4048aemxpj22bq5adbepie', '.eJxVjEEOwiAQRe_C2hDATgGX7j0DmRlGqRpISrsy3l2bdKHb_977L5VwXUpau8xpyuqkrDr8boT8kLqBfMd6a5pbXeaJ9KbonXZ9aVme5939OyjYy7cmcTFz9ldnHQBEa9ACMhIfDXuORgY7SgArLoCXEcBRpOgdDeCHHNT7A-TFN3U:1m7qa5:woT7O02KKcm-4UFebvDzx7fcgEGrYrycjdBDP9Or3qQ', '2021-08-09 02:43:01.697644');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aps_article`
--
ALTER TABLE `aps_article`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING HASH,
  ADD KEY `aps_article_service_id_649587eb_fk_aps_service_id` (`service_id`);

--
-- Indices de la tabla `aps_business`
--
ALTER TABLE `aps_business`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `aps_costumer`
--
ALTER TABLE `aps_costumer`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `aps_discount`
--
ALTER TABLE `aps_discount`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `aps_plan`
--
ALTER TABLE `aps_plan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `aps_quote`
--
ALTER TABLE `aps_quote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aps_quote_Articles_id_6c71340e_fk_aps_article_id` (`Articles_id`),
  ADD KEY `aps_quote_business_id_49538335_fk_aps_business_id` (`business_id`),
  ADD KEY `aps_quote_customer_id_a0c51309_fk_aps_costumer_id` (`customer_id`),
  ADD KEY `aps_quote_discounts_id_23aa020a_fk_aps_discount_id` (`discounts_id`),
  ADD KEY `aps_quote_services_id_a2b6db00_fk_aps_service_id` (`services_id`),
  ADD KEY `aps_quote_tax_id_4802bf14_fk_aps_tax_id` (`tax_id`);

--
-- Indices de la tabla `aps_service`
--
ALTER TABLE `aps_service`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING HASH;

--
-- Indices de la tabla `aps_tax`
--
ALTER TABLE `aps_tax`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aps_article`
--
ALTER TABLE `aps_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `aps_business`
--
ALTER TABLE `aps_business`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aps_costumer`
--
ALTER TABLE `aps_costumer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aps_discount`
--
ALTER TABLE `aps_discount`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `aps_plan`
--
ALTER TABLE `aps_plan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `aps_quote`
--
ALTER TABLE `aps_quote`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aps_service`
--
ALTER TABLE `aps_service`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `aps_tax`
--
ALTER TABLE `aps_tax`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aps_article`
--
ALTER TABLE `aps_article`
  ADD CONSTRAINT `aps_article_service_id_649587eb_fk_aps_service_id` FOREIGN KEY (`service_id`) REFERENCES `aps_service` (`id`);

--
-- Filtros para la tabla `aps_quote`
--
ALTER TABLE `aps_quote`
  ADD CONSTRAINT `aps_quote_Articles_id_6c71340e_fk_aps_article_id` FOREIGN KEY (`Articles_id`) REFERENCES `aps_article` (`id`),
  ADD CONSTRAINT `aps_quote_business_id_49538335_fk_aps_business_id` FOREIGN KEY (`business_id`) REFERENCES `aps_business` (`id`),
  ADD CONSTRAINT `aps_quote_customer_id_a0c51309_fk_aps_costumer_id` FOREIGN KEY (`customer_id`) REFERENCES `aps_costumer` (`id`),
  ADD CONSTRAINT `aps_quote_discounts_id_23aa020a_fk_aps_discount_id` FOREIGN KEY (`discounts_id`) REFERENCES `aps_discount` (`id`),
  ADD CONSTRAINT `aps_quote_services_id_a2b6db00_fk_aps_service_id` FOREIGN KEY (`services_id`) REFERENCES `aps_service` (`id`),
  ADD CONSTRAINT `aps_quote_tax_id_4802bf14_fk_aps_tax_id` FOREIGN KEY (`tax_id`) REFERENCES `aps_tax` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
