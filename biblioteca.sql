-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-07-2024 a las 20:51:05
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(25, 'Can add Estado', 7, 'add_estado'),
(26, 'Can change Estado', 7, 'change_estado'),
(27, 'Can delete Estado', 7, 'delete_estado'),
(28, 'Can view Estado', 7, 'view_estado'),
(29, 'Can add Libro', 8, 'add_libro'),
(30, 'Can change Libro', 8, 'change_libro'),
(31, 'Can delete Libro', 8, 'delete_libro'),
(32, 'Can view Libro', 8, 'view_libro'),
(33, 'Can add Login', 9, 'add_login'),
(34, 'Can change Login', 9, 'change_login'),
(35, 'Can delete Login', 9, 'delete_login'),
(36, 'Can view Login', 9, 'view_login'),
(37, 'Can add Tipo de Usuario', 10, 'add_tipousuario'),
(38, 'Can change Tipo de Usuario', 10, 'change_tipousuario'),
(39, 'Can delete Tipo de Usuario', 10, 'delete_tipousuario'),
(40, 'Can view Tipo de Usuario', 10, 'view_tipousuario'),
(41, 'Can add Stock de Libro', 11, 'add_stocklibro'),
(42, 'Can change Stock de Libro', 11, 'change_stocklibro'),
(43, 'Can delete Stock de Libro', 11, 'delete_stocklibro'),
(44, 'Can view Stock de Libro', 11, 'view_stocklibro'),
(45, 'Can add Préstamo', 12, 'add_prestamo'),
(46, 'Can change Préstamo', 12, 'change_prestamo'),
(47, 'Can delete Préstamo', 12, 'delete_prestamo'),
(48, 'Can view Préstamo', 12, 'view_prestamo'),
(49, 'Can add Usuario', 13, 'add_usuario'),
(50, 'Can change Usuario', 13, 'change_usuario'),
(51, 'Can delete Usuario', 13, 'delete_usuario'),
(52, 'Can view Usuario', 13, 'view_usuario'),
(53, 'Can add Deuda', 14, 'add_deuda'),
(54, 'Can change Deuda', 14, 'change_deuda'),
(55, 'Can delete Deuda', 14, 'delete_deuda'),
(56, 'Can view Deuda', 14, 'view_deuda'),
(57, 'Can add Renovación', 15, 'add_renovacion'),
(58, 'Can change Renovación', 15, 'change_renovacion'),
(59, 'Can delete Renovación', 15, 'delete_renovacion'),
(60, 'Can view Renovación', 15, 'view_renovacion'),
(61, 'Can add Multa', 16, 'add_multa'),
(62, 'Can change Multa', 16, 'change_multa'),
(63, 'Can delete Multa', 16, 'delete_multa'),
(64, 'Can view Multa', 16, 'view_multa');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$WKyk53n3IDJXIc9oqaNmtH$VYO50Wsp+QP5YeSuQ4ia2zTeId1pwD5RajPA6yMEKL0=', '2024-07-23 18:24:43.905989', 1, 'admin', '', '', 'admin@inacap.cl', 1, 1, '2024-07-23 12:47:40.067200');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-07-23 12:50:17.762732', '1', 'Introduction to Algorithms', 1, '[{\"added\": {}}]', 8, 1),
(2, '2024-07-23 12:51:21.959724', '2', 'Inteligencia Artificial: Un enfoque moderno', 1, '[{\"added\": {}}]', 8, 1),
(3, '2024-07-23 12:52:05.474189', '3', 'Redes de computadoras: Enfoque descendente', 1, '[{\"added\": {}}]', 8, 1),
(4, '2024-07-23 12:52:37.476687', '4', 'Conceptos de sistemas de base de datos', 1, '[{\"added\": {}}]', 8, 1),
(5, '2024-07-23 12:53:20.909401', '5', 'Conceptos Se Sistema Operativos', 1, '[{\"added\": {}}]', 8, 1),
(6, '2024-07-23 12:53:44.897133', '6', 'Matematicas Discretas y Sus Aplicaciones', 1, '[{\"added\": {}}]', 8, 1),
(7, '2024-07-23 12:54:12.124933', '7', 'Ingenieria De Control Moderna', 1, '[{\"added\": {}}]', 8, 1),
(8, '2024-07-23 12:54:54.534193', '8', 'Diseño Digital y Aquitectura De Computadoras', 1, '[{\"added\": {}}]', 8, 1),
(9, '2024-07-23 12:56:27.706920', '9', 'Circuitos Microelectrónicos', 1, '[{\"added\": {}}]', 8, 1),
(10, '2024-07-23 12:56:46.085892', '10', 'Introducción a la Teoría de la Computación', 1, '[{\"added\": {}}]', 8, 1),
(11, '2024-07-23 12:57:05.790693', '11', 'El Arte de Programar Computadoras', 1, '[{\"added\": {}}]', 8, 1),
(12, '2024-07-23 12:57:20.893986', '12', 'Arquitectura de Computadoras: Un Enfoque Cuantitativo', 1, '[{\"added\": {}}]', 8, 1),
(13, '2024-07-23 12:57:39.206303', '13', 'Probabilidad y Estadística para Ingeniería y Ciencias', 1, '[{\"added\": {}}]', 8, 1),
(14, '2024-07-23 12:57:54.186763', '14', 'Principios de Economía', 1, '[{\"added\": {}}]', 8, 1),
(15, '2024-07-23 12:58:11.823735', '15', 'Mecánica para Ingenieros: Dinámica', 1, '[{\"added\": {}}]', 8, 1),
(16, '2024-07-23 12:58:25.405235', '16', 'Mecánica para Ingenieros: Estática', 1, '[{\"added\": {}}]', 8, 1),
(17, '2024-07-23 12:58:40.480739', '17', 'Fundamentos de Termodinámica', 1, '[{\"added\": {}}]', 8, 1),
(18, '2024-07-23 12:58:52.635223', '18', 'Transferencia de Calor y Masa: Fundamentos y Aplicaciones', 1, '[{\"added\": {}}]', 8, 1),
(19, '2024-07-23 12:59:06.164550', '19', 'Circuitos Eléctricos', 1, '[{\"added\": {}}]', 8, 1),
(20, '2024-07-23 12:59:19.775226', '20', 'Señales y Sistemas', 1, '[{\"added\": {}}]', 8, 1),
(21, '2024-07-23 12:59:35.368618', '21', 'Mecánica de Materiales', 1, '[{\"added\": {}}]', 8, 1),
(22, '2024-07-23 12:59:49.878617', '22', 'Principios de Química Moderna', 1, '[{\"added\": {}}]', 8, 1),
(23, '2024-07-23 13:00:00.632013', '23', 'Química Orgánica', 1, '[{\"added\": {}}]', 8, 1),
(24, '2024-07-23 13:00:11.232526', '24', 'Química Física', 1, '[{\"added\": {}}]', 8, 1),
(25, '2024-07-23 13:00:25.847500', '25', 'Química Inorgánica', 1, '[{\"added\": {}}]', 8, 1),
(26, '2024-07-23 13:00:39.166112', '26', 'Química General: Principios y Aplicaciones Modernas', 1, '[{\"added\": {}}]', 8, 1),
(27, '2024-07-23 13:00:51.027459', '27', 'Fundamentos de Física', 1, '[{\"added\": {}}]', 8, 1),
(28, '2024-07-23 13:01:02.639605', '28', 'Física Universitaria con Física Moderna', 1, '[{\"added\": {}}]', 8, 1),
(29, '2024-07-23 13:01:31.265666', '29', 'Física Conceptual', 1, '[{\"added\": {}}]', 8, 1),
(30, '2024-07-23 13:01:42.131370', '30', 'Introducción a la Electrodinámica', 1, '[{\"added\": {}}]', 8, 1),
(31, '2024-07-23 13:01:52.851686', '31', 'Mecánica Clásica', 1, '[{\"added\": {}}]', 8, 1),
(32, '2024-07-23 13:02:06.153477', '32', 'Introducción a la Mecánica Cuántica', 1, '[{\"added\": {}}]', 8, 1),
(33, '2024-07-23 13:02:19.487853', '33', 'Ecuaciones Diferenciales y Problemas con Valores en la Frontera', 1, '[{\"added\": {}}]', 8, 1),
(34, '2024-07-23 13:02:31.623950', '34', 'Álgebra Lineal y sus Aplicaciones', 1, '[{\"added\": {}}]', 8, 1),
(35, '2024-07-23 13:02:44.804621', '35', 'Cálculo: Trascendentes Tempranas', 1, '[{\"added\": {}}]', 8, 1),
(36, '2024-07-23 13:02:58.306233', '36', 'Cálculo de Varias Variables', 1, '[{\"added\": {}}]', 8, 1),
(37, '2024-07-23 13:03:11.086216', '37', 'Fundamentos de Matemáticas', 1, '[{\"added\": {}}]', 8, 1),
(38, '2024-07-23 13:03:24.555150', '38', 'Estructuras de Datos y Algoritmos en Java', 1, '[{\"added\": {}}]', 8, 1),
(39, '2024-07-23 13:03:36.515220', '39', 'Fundamentos de Bases de Datos', 1, '[{\"added\": {}}]', 8, 1),
(40, '2024-07-23 13:03:53.036142', '40', 'Análisis de Algoritmos', 1, '[{\"added\": {}}]', 8, 1),
(41, '2024-07-23 13:04:04.471436', '41', 'Teoría de Autómatas, Lenguajes y Computación', 1, '[{\"added\": {}}]', 8, 1),
(42, '2024-07-23 13:04:16.820098', '42', 'Compiladores: Principios, Técnicas y Herramientas', 1, '[{\"added\": {}}]', 8, 1),
(43, '2024-07-23 13:04:30.387075', '43', 'Principios de Programación y Estructuras de Datos', 1, '[{\"added\": {}}]', 8, 1),
(44, '2024-07-23 13:04:40.926060', '44', 'Sistemas de Control Automático', 1, '[{\"added\": {}}]', 8, 1),
(45, '2024-07-23 13:04:58.069389', '45', 'Ingeniería de Software', 1, '[{\"added\": {}}]', 8, 1),
(46, '2024-07-23 13:05:11.843004', '46', 'Estructura y Análisis de Algoritmos', 1, '[{\"added\": {}}]', 8, 1),
(47, '2024-07-23 13:05:22.491706', '47', 'Análisis y Diseño de Sistemas', 1, '[{\"added\": {}}]', 8, 1),
(48, '2024-07-23 13:05:34.884958', '48', 'Sistemas de Información Gerencial', 1, '[{\"added\": {}}]', 8, 1),
(49, '2024-07-23 13:05:52.100151', '49', 'Administración: Una Perspectiva Global y Empresarial', 1, '[{\"added\": {}}]', 8, 1),
(50, '2024-07-23 13:06:04.328967', '50', 'Diseño y Análisis de Experimentos', 1, '[{\"added\": {}}]', 8, 1),
(51, '2024-07-23 13:06:35.094255', '1', 'alumno', 1, '[{\"added\": {}}]', 10, 1),
(52, '2024-07-23 13:06:40.057339', '2', 'docente', 1, '[{\"added\": {}}]', 10, 1),
(53, '2024-07-23 13:06:53.752899', '1', 'activo', 1, '[{\"added\": {}}]', 7, 1),
(54, '2024-07-23 13:07:02.348993', '2', 'Devuelto', 1, '[{\"added\": {}}]', 7, 1),
(55, '2024-07-23 13:07:50.577771', '18939296-6', 'Brandon Castro', 1, '[{\"added\": {}}]', 13, 1),
(56, '2024-07-23 13:08:35.437103', '1', 'Stock de Introduction to Algorithms', 1, '[{\"added\": {}}]', 11, 1),
(57, '2024-07-23 13:08:41.443987', '2', 'Stock de Inteligencia Artificial: Un enfoque moderno', 1, '[{\"added\": {}}]', 11, 1),
(58, '2024-07-23 13:08:45.210613', '3', 'Stock de Redes de computadoras: Enfoque descendente', 1, '[{\"added\": {}}]', 11, 1),
(59, '2024-07-23 13:08:48.593971', '4', 'Stock de Conceptos de sistemas de base de datos', 1, '[{\"added\": {}}]', 11, 1),
(60, '2024-07-23 13:08:52.538682', '5', 'Stock de Conceptos Se Sistema Operativos', 1, '[{\"added\": {}}]', 11, 1),
(61, '2024-07-23 13:09:02.671272', '6', 'Stock de Matematicas Discretas y Sus Aplicaciones', 1, '[{\"added\": {}}]', 11, 1),
(62, '2024-07-23 13:09:06.607410', '7', 'Stock de Ingenieria De Control Moderna', 1, '[{\"added\": {}}]', 11, 1),
(63, '2024-07-23 13:09:20.220080', '8', 'Stock de Diseño Digital y Aquitectura De Computadoras', 1, '[{\"added\": {}}]', 11, 1),
(64, '2024-07-23 13:09:58.550366', '9', 'Stock de Circuitos Microelectrónicos', 1, '[{\"added\": {}}]', 11, 1),
(65, '2024-07-23 13:10:02.137935', '10', 'Stock de Introducción a la Teoría de la Computación', 1, '[{\"added\": {}}]', 11, 1),
(66, '2024-07-23 13:10:08.566523', '11', 'Stock de El Arte de Programar Computadoras', 1, '[{\"added\": {}}]', 11, 1),
(67, '2024-07-23 13:10:12.819443', '12', 'Stock de Arquitectura de Computadoras: Un Enfoque Cuantitativo', 1, '[{\"added\": {}}]', 11, 1),
(68, '2024-07-23 13:10:16.893082', '13', 'Stock de Probabilidad y Estadística para Ingeniería y Ciencias', 1, '[{\"added\": {}}]', 11, 1),
(69, '2024-07-23 13:10:20.296484', '14', 'Stock de Principios de Economía', 1, '[{\"added\": {}}]', 11, 1),
(70, '2024-07-23 13:10:23.949588', '15', 'Stock de Mecánica para Ingenieros: Dinámica', 1, '[{\"added\": {}}]', 11, 1),
(71, '2024-07-23 13:10:28.539444', '16', 'Stock de Mecánica para Ingenieros: Estática', 1, '[{\"added\": {}}]', 11, 1),
(72, '2024-07-23 13:10:32.151159', '17', 'Stock de Fundamentos de Termodinámica', 1, '[{\"added\": {}}]', 11, 1),
(73, '2024-07-23 13:10:35.363161', '18', 'Stock de Transferencia de Calor y Masa: Fundamentos y Aplicaciones', 1, '[{\"added\": {}}]', 11, 1),
(74, '2024-07-23 13:10:38.887111', '19', 'Stock de Circuitos Eléctricos', 1, '[{\"added\": {}}]', 11, 1),
(75, '2024-07-23 13:11:14.563405', '20', 'Stock de Señales y Sistemas', 1, '[{\"added\": {}}]', 11, 1),
(76, '2024-07-23 13:11:19.786359', '21', 'Stock de Mecánica de Materiales', 1, '[{\"added\": {}}]', 11, 1),
(77, '2024-07-23 13:11:29.843469', '22', 'Stock de Principios de Química Moderna', 1, '[{\"added\": {}}]', 11, 1),
(78, '2024-07-23 13:11:34.226897', '23', 'Stock de Química Orgánica', 1, '[{\"added\": {}}]', 11, 1),
(79, '2024-07-23 13:11:40.002245', '24', 'Stock de Química Física', 1, '[{\"added\": {}}]', 11, 1),
(80, '2024-07-23 13:11:44.676199', '25', 'Stock de Química Inorgánica', 1, '[{\"added\": {}}]', 11, 1),
(81, '2024-07-23 13:11:50.614420', '26', 'Stock de Química General: Principios y Aplicaciones Modernas', 1, '[{\"added\": {}}]', 11, 1),
(82, '2024-07-23 13:11:57.594799', '27', 'Stock de Fundamentos de Física', 1, '[{\"added\": {}}]', 11, 1),
(83, '2024-07-23 13:12:03.983847', '28', 'Stock de Física Universitaria con Física Moderna', 1, '[{\"added\": {}}]', 11, 1),
(84, '2024-07-23 13:12:08.338829', '29', 'Stock de Física Conceptual', 1, '[{\"added\": {}}]', 11, 1),
(85, '2024-07-23 13:12:13.679411', '30', 'Stock de Introducción a la Electrodinámica', 1, '[{\"added\": {}}]', 11, 1),
(86, '2024-07-23 13:12:19.013895', '31', 'Stock de Mecánica Clásica', 1, '[{\"added\": {}}]', 11, 1),
(87, '2024-07-23 13:12:24.444403', '32', 'Stock de Introducción a la Mecánica Cuántica', 1, '[{\"added\": {}}]', 11, 1),
(88, '2024-07-23 13:12:28.890190', '33', 'Stock de Ecuaciones Diferenciales y Problemas con Valores en la Frontera', 1, '[{\"added\": {}}]', 11, 1),
(89, '2024-07-23 13:12:38.246437', '34', 'Stock de Álgebra Lineal y sus Aplicaciones', 1, '[{\"added\": {}}]', 11, 1),
(90, '2024-07-23 13:12:44.731205', '35', 'Stock de Cálculo: Trascendentes Tempranas', 1, '[{\"added\": {}}]', 11, 1),
(91, '2024-07-23 13:12:50.032443', '36', 'Stock de Cálculo de Varias Variables', 1, '[{\"added\": {}}]', 11, 1),
(92, '2024-07-23 13:12:57.731199', '37', 'Stock de Fundamentos de Matemáticas', 1, '[{\"added\": {}}]', 11, 1),
(93, '2024-07-23 13:13:02.864419', '38', 'Stock de Estructuras de Datos y Algoritmos en Java', 1, '[{\"added\": {}}]', 11, 1),
(94, '2024-07-23 13:13:10.452532', '39', 'Stock de Fundamentos de Bases de Datos', 1, '[{\"added\": {}}]', 11, 1),
(95, '2024-07-23 13:13:14.909931', '40', 'Stock de Análisis de Algoritmos', 1, '[{\"added\": {}}]', 11, 1),
(96, '2024-07-23 13:13:23.661008', '41', 'Stock de Teoría de Autómatas, Lenguajes y Computación', 1, '[{\"added\": {}}]', 11, 1),
(97, '2024-07-23 13:13:28.526953', '42', 'Stock de Compiladores: Principios, Técnicas y Herramientas', 1, '[{\"added\": {}}]', 11, 1),
(98, '2024-07-23 13:13:34.162124', '43', 'Stock de Principios de Programación y Estructuras de Datos', 1, '[{\"added\": {}}]', 11, 1),
(99, '2024-07-23 13:13:38.293121', '44', 'Stock de Sistemas de Control Automático', 1, '[{\"added\": {}}]', 11, 1),
(100, '2024-07-23 13:13:42.790724', '45', 'Stock de Ingeniería de Software', 1, '[{\"added\": {}}]', 11, 1),
(101, '2024-07-23 13:13:48.342099', '46', 'Stock de Estructura y Análisis de Algoritmos', 1, '[{\"added\": {}}]', 11, 1),
(102, '2024-07-23 13:13:53.024140', '47', 'Stock de Análisis y Diseño de Sistemas', 1, '[{\"added\": {}}]', 11, 1),
(103, '2024-07-23 13:13:57.404001', '48', 'Stock de Sistemas de Información Gerencial', 1, '[{\"added\": {}}]', 11, 1),
(104, '2024-07-23 13:14:01.005018', '49', 'Stock de Administración: Una Perspectiva Global y Empresarial', 1, '[{\"added\": {}}]', 11, 1),
(105, '2024-07-23 13:14:04.954137', '50', 'Stock de Diseño y Análisis de Experimentos', 1, '[{\"added\": {}}]', 11, 1),
(106, '2024-07-23 14:07:50.215510', '2', 'Prestamo object (2)', 3, '', 12, 1),
(107, '2024-07-23 14:07:50.240024', '1', 'Prestamo object (1)', 3, '', 12, 1),
(108, '2024-07-23 17:07:47.532514', '21388643-6', 'Elias Briones', 1, '[{\"added\": {}}]', 13, 1),
(109, '2024-07-23 17:09:05.903146', '20811950-8', 'Cristobal Barrera', 1, '[{\"added\": {}}]', 13, 1),
(110, '2024-07-23 17:09:53.063536', '18528298-8', 'Carlos Campaña', 1, '[{\"added\": {}}]', 13, 1),
(111, '2024-07-23 17:10:26.244745', '16096501-0', 'Vicente Silva', 1, '[{\"added\": {}}]', 13, 1),
(112, '2024-07-23 17:12:53.793293', '13707055-3', 'Igor Vega Puebla', 1, '[{\"added\": {}}]', 13, 1),
(113, '2024-07-23 17:17:57.362515', '3', 'Prestamo object (3)', 1, '[{\"added\": {}}]', 12, 1),
(114, '2024-07-23 17:18:18.894323', '1', 'Deuda de 3000 pesos para el préstamo 3', 1, '[{\"added\": {}}]', 14, 1),
(115, '2024-07-23 17:19:58.956007', '1', 'Deuda de 3000 pesos para el préstamo 3', 3, '', 14, 1),
(116, '2024-07-23 18:00:48.990282', '3', 'Prestamo object (3)', 3, '', 12, 1),
(117, '2024-07-23 18:01:33.361826', '4', 'Prestamo object (4)', 1, '[{\"added\": {}}]', 12, 1),
(118, '2024-07-23 18:02:46.327067', '4', 'Prestamo object (4)', 3, '', 12, 1),
(119, '2024-07-23 18:05:46.355263', '5', 'Prestamo object (5)', 1, '[{\"added\": {}}]', 12, 1),
(120, '2024-07-23 18:09:35.853765', '5', 'Prestamo object (5)', 3, '', 12, 1),
(121, '2024-07-23 18:09:53.996536', '6', 'Prestamo object (6)', 1, '[{\"added\": {}}]', 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(14, 'prestamo', 'deuda'),
(7, 'prestamo', 'estado'),
(8, 'prestamo', 'libro'),
(9, 'prestamo', 'login'),
(16, 'prestamo', 'multa'),
(12, 'prestamo', 'prestamo'),
(15, 'prestamo', 'renovacion'),
(11, 'prestamo', 'stocklibro'),
(10, 'prestamo', 'tipousuario'),
(13, 'prestamo', 'usuario'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-07-23 12:46:57.112959'),
(2, 'auth', '0001_initial', '2024-07-23 12:46:58.278414'),
(3, 'admin', '0001_initial', '2024-07-23 12:46:59.064473'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-07-23 12:46:59.145479'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-07-23 12:46:59.315491'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-07-23 12:47:00.039544'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-07-23 12:47:00.130552'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-07-23 12:47:00.190556'),
(9, 'auth', '0004_alter_user_username_opts', '2024-07-23 12:47:00.215558'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-07-23 12:47:00.350567'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-07-23 12:47:00.358568'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-07-23 12:47:00.371569'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-07-23 12:47:00.409572'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-07-23 12:47:00.467576'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-07-23 12:47:00.489578'),
(16, 'auth', '0011_update_proxy_permissions', '2024-07-23 12:47:00.514580'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-07-23 12:47:00.540582'),
(18, 'prestamo', '0001_initial', '2024-07-23 12:47:01.723987'),
(19, 'prestamo', '0002_rename_renovacion_renovacione_and_more', '2024-07-23 12:47:01.791427'),
(20, 'prestamo', '0003_alter_prestamo_fechaprestamo', '2024-07-23 12:47:01.803607'),
(21, 'prestamo', '0004_rename_renovacione_renovacion_prestamo_renovaciones_and_more', '2024-07-23 12:47:02.022359'),
(22, 'sessions', '0001_initial', '2024-07-23 12:47:02.159785');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('92xbcfti69dl0zsa8ezcyysa50ix3rcw', '.eJxVjMEOwiAQRP-FsyEFXCgevfsNZGEXqRpISnsy_rtt0oMeZ96beYuA61LC2nkOE4mLUOL020VMT647oAfWe5Op1WWeotwVedAub434dT3cv4OCvWxrN2gDGTQ7RyrlAQxZ5BS9zyOZnJnQKmO2AAOcPSsYldJgOYF1nJ34fAHn3Dfq:1sWKBn:2wxUFVnjIZHEEq5rv2FxcdopGLIBin03iYt0guq4hVg', '2024-08-06 18:24:43.915284');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_deuda`
--

CREATE TABLE `prestamo_deuda` (
  `idDeuda` int(11) NOT NULL,
  `diasRetraso` int(11) NOT NULL,
  `montoDeuda` int(11) NOT NULL,
  `idEstado_id` int(11) NOT NULL,
  `idPrestamoLibro_id` int(11) NOT NULL,
  `RUTUsuario_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_estado`
--

CREATE TABLE `prestamo_estado` (
  `idestado` int(11) NOT NULL,
  `estado` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo_estado`
--

INSERT INTO `prestamo_estado` (`idestado`, `estado`) VALUES
(1, 'activo'),
(2, 'Devuelto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_libro`
--

CREATE TABLE `prestamo_libro` (
  `codigoLibro` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `anioPublicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo_libro`
--

INSERT INTO `prestamo_libro` (`codigoLibro`, `titulo`, `autor`, `anioPublicacion`) VALUES
(1, 'Introduction to Algorithms', 'Thomas H. Coren', 2009),
(2, 'Inteligencia Artificial: Un enfoque moderno', 'Stuart Russell', 2016),
(3, 'Redes de computadoras: Enfoque descendente', 'James F. Kurose', 2016),
(4, 'Conceptos de sistemas de base de datos', 'Abraham Silberschatz', 2018),
(5, 'Conceptos Se Sistema Operativos', 'Abraham Silberschatz', 2010),
(6, 'Matematicas Discretas y Sus Aplicaciones', 'Kenneth H. Rosen', 2011),
(7, 'Ingenieria De Control Moderna', 'Katsuhiko Ogata', 2009),
(8, 'Diseño Digital y Aquitectura De Computadoras', 'David Harris', 2015),
(9, 'Circuitos Microelectrónicos', 'Adel S. Sedra, Kenneth C. Smith', 2014),
(10, 'Introducción a la Teoría de la Computación', 'Michael Sipser', 2012),
(11, 'El Arte de Programar Computadoras', 'Donald E. Knuth', 1997),
(12, 'Arquitectura de Computadoras: Un Enfoque Cuantitativo', 'John L. Hennessy, David A. Patterson', 2017),
(13, 'Probabilidad y Estadística para Ingeniería y Ciencias', 'Jay L. Devore', 2011),
(14, 'Principios de Economía', 'N. Gregory Mankiw', 2017),
(15, 'Mecánica para Ingenieros: Dinámica', 'J.L. Meriam, L.G. Kraige', 2012),
(16, 'Mecánica para Ingenieros: Estática', 'J.L. Meriam, L.G. Kraige', 2012),
(17, 'Fundamentos de Termodinámica', 'Richard E. Sonntag, Claus Borgnakke', 2019),
(18, 'Transferencia de Calor y Masa: Fundamentos y Aplicaciones', 'Yunus A. Cengel, Afshin J. Ghajar', 2014),
(19, 'Circuitos Eléctricos', 'James W. Nilsson, Susan Riedel', 2019),
(20, 'Señales y Sistemas', 'Alan V. Oppenheim, Alan S. Willsky, S. Hamid Nawab', 1996),
(21, 'Mecánica de Materiales', 'Ferdinand P. Beer, E. Russell Johnston Jr., John T. DeWolf, David F. Mazurek', 2014),
(22, 'Principios de Química Moderna', 'David W. Oxtoby, H. Pat Gillis, Laurie J. Butler', 2015),
(23, 'Química Orgánica', 'Paula Yurkanis Bruice', 2016),
(24, 'Química Física', 'Peter Atkins, Julio de Paula', 2014),
(25, 'Química Inorgánica', 'Gary L. Miessler, Paul J. Fischer, Donald A. Tarr', 2014),
(26, 'Química General: Principios y Aplicaciones Modernas', 'Ralph H. Petrucci, F. Geoffrey Herring, Jeffry D. Madura, Carey Bissonnette', 2017),
(27, 'Fundamentos de Física', 'David Halliday, Robert Resnick, Jearl Walker', 2018),
(28, 'Física Universitaria con Física Moderna', 'Hugh D. Young, Roger A. Freedman', 2019),
(29, 'Física Conceptual', 'Paul G. Hewitt', 2014),
(30, 'Introducción a la Electrodinámica', 'David J. Griffiths', 2017),
(31, 'Mecánica Clásica', 'Herbert Goldstein, Charles P. Poole, John L. Safko', 2001),
(32, 'Introducción a la Mecánica Cuántica', 'David J. Griffiths, Darrell F. Schroeter', 2018),
(33, 'Ecuaciones Diferenciales y Problemas con Valores en la Frontera', 'William E. Boyce, Richard C. DiPrima', 2017),
(34, 'Álgebra Lineal y sus Aplicaciones', 'David C. Lay, Steven R. Lay, Judi J. McDonald', 2015),
(35, 'Cálculo: Trascendentes Tempranas', 'James Stewart', 2015),
(36, 'Cálculo de Varias Variables', 'James Stewart', 2015),
(37, 'Fundamentos de Matemáticas', 'Richard Johnsonbaugh', 2012),
(38, 'Estructuras de Datos y Algoritmos en Java', 'Michael T. Goodrich, Roberto Tamassia, Michael H. Goldwasser', 2014),
(39, 'Fundamentos de Bases de Datos', 'Ramez Elmasri, Shamkant B. Navathe', 2010),
(40, 'Análisis de Algoritmos', 'Anany Levitin', 2011),
(41, 'Teoría de Autómatas, Lenguajes y Computación', 'John E. Hopcroft, Rajeev Motwani, Jeffrey D. Ullman', 2006),
(42, 'Compiladores: Principios, Técnicas y Herramientas', 'Alfred V. Aho, Monica S. Lam, Ravi Sethi, Jeffrey D. Ullman', 2006),
(43, 'Principios de Programación y Estructuras de Datos', 'Charles H. Sims', 2015),
(44, 'Sistemas de Control Automático', 'Benjamin C. Kuo', 2007),
(45, 'Ingeniería de Software', 'Ian Sommerville', 2011),
(46, 'Estructura y Análisis de Algoritmos', 'Gilles Brassard, Paul Bratley', 1996),
(47, 'Análisis y Diseño de Sistemas', 'Kenneth E. Kendall, Julie E. Kendall', 2013),
(48, 'Sistemas de Información Gerencial', 'Kenneth C. Laudon, Jane P. Laudon', 2017),
(49, 'Administración: Una Perspectiva Global y Empresarial', 'Harold Koontz, Heinz Weihrich', 2012),
(50, 'Diseño y Análisis de Experimentos', 'Douglas C. Montgomery', 2017);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_login`
--

CREATE TABLE `prestamo_login` (
  `usuario` varchar(100) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_multa`
--

CREATE TABLE `prestamo_multa` (
  `idMulta` int(11) NOT NULL,
  `diasRetraso` int(11) NOT NULL,
  `montoMulta` int(11) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `pagada` tinyint(1) NOT NULL,
  `prestamo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_prestamo`
--

CREATE TABLE `prestamo_prestamo` (
  `idPrestamo` int(11) NOT NULL,
  `fechaPrestamo` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `fechaDevolucion` date DEFAULT NULL,
  `codigoLibro_id` int(11) NOT NULL,
  `idEstado_id` int(11) NOT NULL,
  `RUTUsuario_id` varchar(15) NOT NULL,
  `renovaciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo_prestamo`
--

INSERT INTO `prestamo_prestamo` (`idPrestamo`, `fechaPrestamo`, `fechaVencimiento`, `fechaDevolucion`, `codigoLibro_id`, `idEstado_id`, `RUTUsuario_id`, `renovaciones`) VALUES
(6, '2024-07-07', '2024-07-13', NULL, 2, 1, '21388643-6', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_renovacion`
--

CREATE TABLE `prestamo_renovacion` (
  `idRenovacion` int(11) NOT NULL,
  `fechaRenovacion` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `idEstado_id` int(11) NOT NULL,
  `idPrestamo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_stocklibro`
--

CREATE TABLE `prestamo_stocklibro` (
  `codigoLibro_id` int(11) NOT NULL,
  `cantidadDisponible` int(11) NOT NULL,
  `cantidadTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo_stocklibro`
--

INSERT INTO `prestamo_stocklibro` (`codigoLibro_id`, `cantidadDisponible`, `cantidadTotal`) VALUES
(1, 1, 1),
(2, 0, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1),
(8, 1, 1),
(9, 1, 1),
(10, 1, 1),
(11, 1, 1),
(12, 1, 1),
(13, 1, 1),
(14, 1, 1),
(15, 1, 1),
(16, 1, 1),
(17, 1, 1),
(18, 1, 1),
(19, 1, 1),
(20, 1, 1),
(21, 1, 1),
(22, 1, 1),
(23, 1, 1),
(24, 1, 1),
(25, 1, 1),
(26, 1, 1),
(27, 1, 1),
(28, 1, 1),
(29, 1, 1),
(30, 1, 1),
(31, 1, 1),
(32, 1, 1),
(33, 1, 1),
(34, 1, 1),
(35, 1, 1),
(36, 1, 1),
(37, 1, 1),
(38, 1, 1),
(39, 1, 1),
(40, 1, 1),
(41, 1, 1),
(42, 1, 1),
(43, 1, 1),
(44, 1, 1),
(45, 1, 1),
(46, 1, 1),
(47, 1, 1),
(48, 1, 1),
(49, 1, 1),
(50, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_tipousuario`
--

CREATE TABLE `prestamo_tipousuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `TipoUsuario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo_tipousuario`
--

INSERT INTO `prestamo_tipousuario` (`idTipoUsuario`, `TipoUsuario`) VALUES
(1, 'alumno'),
(2, 'docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_usuario`
--

CREATE TABLE `prestamo_usuario` (
  `RUT` varchar(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `contacto` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `idEstado_id` int(11) NOT NULL,
  `idTipoUsuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo_usuario`
--

INSERT INTO `prestamo_usuario` (`RUT`, `nombre`, `contacto`, `correo`, `idEstado_id`, `idTipoUsuario_id`) VALUES
('13707055-3', 'Igor Vega Puebla', '988785766', 'Igorv@inacap.cl', 1, 2),
('16096501-0', 'Vicente Silva', '954667855', 'vicentes@inacap.cl', 1, 1),
('18528298-8', 'Carlos Campaña', '912323244', 'carlosc@inacap.cl', 1, 1),
('18939296-6', 'Brandon Castro', '949028381', 'brandonc@inacap.cl', 1, 1),
('20811950-8', 'Cristobal Barrera', '922345466', 'cristobalb@inacap.cl', 1, 1),
('21388643-6', 'Elias Briones', '932456678', 'eliasb@inacap.cl', 1, 1);

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
-- Indices de la tabla `prestamo_deuda`
--
ALTER TABLE `prestamo_deuda`
  ADD PRIMARY KEY (`idDeuda`),
  ADD KEY `prestamo_deuda_idEstado_id_b621db5e_fk_prestamo_estado_idestados` (`idEstado_id`),
  ADD KEY `prestamo_deuda_idPrestamoLibro_id_a156b37e_fk_prestamo_` (`idPrestamoLibro_id`),
  ADD KEY `prestamo_deuda_RUTUsuario_id_e00548f9_fk_prestamo_usuario_RUT` (`RUTUsuario_id`);

--
-- Indices de la tabla `prestamo_estado`
--
ALTER TABLE `prestamo_estado`
  ADD PRIMARY KEY (`idestado`);

--
-- Indices de la tabla `prestamo_libro`
--
ALTER TABLE `prestamo_libro`
  ADD PRIMARY KEY (`codigoLibro`);

--
-- Indices de la tabla `prestamo_login`
--
ALTER TABLE `prestamo_login`
  ADD PRIMARY KEY (`usuario`);

--
-- Indices de la tabla `prestamo_multa`
--
ALTER TABLE `prestamo_multa`
  ADD PRIMARY KEY (`idMulta`),
  ADD KEY `prestamo_multa_prestamo_id_5d1f0e91_fk_prestamo_` (`prestamo_id`);

--
-- Indices de la tabla `prestamo_prestamo`
--
ALTER TABLE `prestamo_prestamo`
  ADD PRIMARY KEY (`idPrestamo`),
  ADD KEY `prestamo_prestamo_RUTUsuario_id_2f2748a6_fk_prestamo_usuario_RUT` (`RUTUsuario_id`),
  ADD KEY `prestamo_prestamo_codigoLibro_id_0f3817b6_fk_prestamo_` (`codigoLibro_id`),
  ADD KEY `prestamo_prestamo_idEstado_id_8b40e33c_fk_prestamo_` (`idEstado_id`);

--
-- Indices de la tabla `prestamo_renovacion`
--
ALTER TABLE `prestamo_renovacion`
  ADD PRIMARY KEY (`idRenovacion`),
  ADD KEY `prestamo_renovacion_idEstado_id_a536cee6_fk_prestamo_` (`idEstado_id`),
  ADD KEY `prestamo_renovacion_idPrestamo_id_25c91004_fk_prestamo_` (`idPrestamo_id`);

--
-- Indices de la tabla `prestamo_stocklibro`
--
ALTER TABLE `prestamo_stocklibro`
  ADD PRIMARY KEY (`codigoLibro_id`);

--
-- Indices de la tabla `prestamo_tipousuario`
--
ALTER TABLE `prestamo_tipousuario`
  ADD PRIMARY KEY (`idTipoUsuario`);

--
-- Indices de la tabla `prestamo_usuario`
--
ALTER TABLE `prestamo_usuario`
  ADD PRIMARY KEY (`RUT`),
  ADD KEY `prestamo_usuario_idEstado_id_355c3293_fk_prestamo_` (`idEstado_id`),
  ADD KEY `prestamo_usuario_idTipoUsuario_id_3d14235c_fk_prestamo_` (`idTipoUsuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `prestamo_deuda`
--
ALTER TABLE `prestamo_deuda`
  MODIFY `idDeuda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `prestamo_estado`
--
ALTER TABLE `prestamo_estado`
  MODIFY `idestado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `prestamo_libro`
--
ALTER TABLE `prestamo_libro`
  MODIFY `codigoLibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `prestamo_multa`
--
ALTER TABLE `prestamo_multa`
  MODIFY `idMulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `prestamo_prestamo`
--
ALTER TABLE `prestamo_prestamo`
  MODIFY `idPrestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `prestamo_renovacion`
--
ALTER TABLE `prestamo_renovacion`
  MODIFY `idRenovacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamo_tipousuario`
--
ALTER TABLE `prestamo_tipousuario`
  MODIFY `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

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

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `prestamo_deuda`
--
ALTER TABLE `prestamo_deuda`
  ADD CONSTRAINT `prestamo_deuda_RUTUsuario_id_e00548f9_fk_prestamo_usuario_RUT` FOREIGN KEY (`RUTUsuario_id`) REFERENCES `prestamo_usuario` (`RUT`),
  ADD CONSTRAINT `prestamo_deuda_idEstado_id_b621db5e_fk_prestamo_estado_idestados` FOREIGN KEY (`idEstado_id`) REFERENCES `prestamo_estado` (`idestado`),
  ADD CONSTRAINT `prestamo_deuda_idPrestamoLibro_id_a156b37e_fk_prestamo_` FOREIGN KEY (`idPrestamoLibro_id`) REFERENCES `prestamo_prestamo` (`idPrestamo`);

--
-- Filtros para la tabla `prestamo_multa`
--
ALTER TABLE `prestamo_multa`
  ADD CONSTRAINT `prestamo_multa_prestamo_id_5d1f0e91_fk_prestamo_` FOREIGN KEY (`prestamo_id`) REFERENCES `prestamo_prestamo` (`idPrestamo`);

--
-- Filtros para la tabla `prestamo_prestamo`
--
ALTER TABLE `prestamo_prestamo`
  ADD CONSTRAINT `prestamo_prestamo_RUTUsuario_id_2f2748a6_fk_prestamo_usuario_RUT` FOREIGN KEY (`RUTUsuario_id`) REFERENCES `prestamo_usuario` (`RUT`),
  ADD CONSTRAINT `prestamo_prestamo_codigoLibro_id_0f3817b6_fk_prestamo_` FOREIGN KEY (`codigoLibro_id`) REFERENCES `prestamo_libro` (`codigoLibro`),
  ADD CONSTRAINT `prestamo_prestamo_idEstado_id_8b40e33c_fk_prestamo_` FOREIGN KEY (`idEstado_id`) REFERENCES `prestamo_estado` (`idestado`);

--
-- Filtros para la tabla `prestamo_renovacion`
--
ALTER TABLE `prestamo_renovacion`
  ADD CONSTRAINT `prestamo_renovacion_idEstado_id_a536cee6_fk_prestamo_` FOREIGN KEY (`idEstado_id`) REFERENCES `prestamo_estado` (`idestado`),
  ADD CONSTRAINT `prestamo_renovacion_idPrestamo_id_25c91004_fk_prestamo_` FOREIGN KEY (`idPrestamo_id`) REFERENCES `prestamo_prestamo` (`idPrestamo`);

--
-- Filtros para la tabla `prestamo_stocklibro`
--
ALTER TABLE `prestamo_stocklibro`
  ADD CONSTRAINT `prestamo_stocklibro_codigoLibro_id_fecaeb12_fk_prestamo_` FOREIGN KEY (`codigoLibro_id`) REFERENCES `prestamo_libro` (`codigoLibro`);

--
-- Filtros para la tabla `prestamo_usuario`
--
ALTER TABLE `prestamo_usuario`
  ADD CONSTRAINT `prestamo_usuario_idEstado_id_355c3293_fk_prestamo_` FOREIGN KEY (`idEstado_id`) REFERENCES `prestamo_estado` (`idestado`),
  ADD CONSTRAINT `prestamo_usuario_idTipoUsuario_id_3d14235c_fk_prestamo_` FOREIGN KEY (`idTipoUsuario_id`) REFERENCES `prestamo_tipousuario` (`idTipoUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
