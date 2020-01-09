-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2019 a las 10:34:48
-- Versión del servidor: 10.1.33-MariaDB
-- Versión de PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ohccdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE `ciudadano` (
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `ci` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `dir_particular` text COLLATE utf8_spanish_ci NOT NULL,
  `telef` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_tipo_ciudadano` int(11) UNSIGNED DEFAULT NULL,
  `latitud_vivienda` double DEFAULT NULL,
  `longitud_vivienda` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ciudadano`
--

INSERT INTO `ciudadano` (`id_usuario`, `ci`, `dir_particular`, `telef`, `email`, `id_tipo_ciudadano`, `latitud_vivienda`, `longitud_vivienda`) VALUES
(56, '95012241069', 'Edif 31 apto D', '32542589', 'ciudadano1@nauta.cu', 1, NULL, NULL),
(72, '54625384848', 'bzjdjdjdhg, sjdhw ,hsjw ,hdj', '325491358', 'asd@as.com', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directivo`
--

CREATE TABLE `directivo` (
  `id_directivo` int(11) UNSIGNED NOT NULL,
  `cargo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `directivo`
--

INSERT INTO `directivo` (`id_directivo`, `cargo`) VALUES
(70, 'Director');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialista`
--

CREATE TABLE `especialista` (
  `id_especialista` int(11) UNSIGNED NOT NULL,
  `categoria` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `especialista`
--

INSERT INTO `especialista` (`id_especialista`, `categoria`) VALUES
(1, 'Root'),
(67, 'F'),
(71, 'Ñ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) UNSIGNED NOT NULL,
  `estado` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'pendiente, en progreso, terminado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `estado`) VALUES
(1, 'Pendiente'),
(2, 'En progreso'),
(3, 'Finalizado'),
(4, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regulacion_tcp`
--

CREATE TABLE `regulacion_tcp` (
  `id_solicitud` int(11) UNSIGNED NOT NULL,
  `ci_tcp` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dir_local` text COLLATE utf8_spanish_ci NOT NULL,
  `actividad_tcp` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `espacio_de_la_vivienda_a_usar` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `titulo_propiedad` blob NOT NULL,
  `tipo_local` int(11) UNSIGNED NOT NULL,
  `carta_de_la_entidad` blob,
  `contrato_con_la_entidad` blob,
  `carta_de_los_propietarios` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(1) NOT NULL,
  `rol` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `rol`) VALUES
(1, 'Directivo'),
(2, 'Especialista'),
(3, 'Usuario'),
(4, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `id_solicitud` int(11) UNSIGNED NOT NULL,
  `evaluacion` int(2) DEFAULT NULL,
  `respuesta` text COLLATE utf8_spanish_ci,
  `fecha_creada` date NOT NULL,
  `fecha_iniciada` date DEFAULT NULL,
  `fecha_respuesta` date DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `id_especialista` int(11) UNSIGNED NOT NULL,
  `id_tipo_solicitud` int(11) UNSIGNED NOT NULL,
  `id_estado` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `solicitud`
--

INSERT INTO `solicitud` (`id_solicitud`, `evaluacion`, `respuesta`, `fecha_creada`, `fecha_iniciada`, `fecha_respuesta`, `descripcion`, `id_usuario`, `id_especialista`, `id_tipo_solicitud`, `id_estado`) VALUES
(8, 1, NULL, '2019-05-15', NULL, NULL, 'jskjdfskjdfksdf', 56, 67, 1, 4),
(9, -1, NULL, '2019-05-15', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 2, 2),
(10, 2, 'proident, sunt in culpa qui officia deserunt mollit anim id est laborum.a', '2019-05-15', '2019-05-20', '2019-05-20', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 3, 3),
(11, 5, 'proident, sunt in culpa qui officia deserunt mollit anim id est laborum.a', '2019-05-15', '2019-05-21', '2019-05-23', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 4, 2),
(12, 4, 'proident, sunt in culpa qui officia deserunt mollit anim id est laborum.a', '2019-05-15', '2019-05-21', '2019-05-23', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 5, 1),
(13, 5, '', '2019-05-25', '2019-05-21', '2019-05-23', 'Lrrrorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 6, 3),
(14, 2, 'RLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.a', '2019-05-23', '2019-05-21', '2019-05-21', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 1, 3),
(15, 4, 'RLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.a', '2019-05-23', '2019-05-22', '2019-05-23', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 2, 3),
(16, 5, 'RLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.a', '2019-05-23', '2019-05-11', '2019-05-13', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 3, 4),
(17, 1, 'RLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.a', '2019-05-15', '2019-05-15', '2019-05-16', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.dsX', 56, 1, 4, 3),
(18, 5, 'RLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.a', '2019-05-15', '2019-05-20', '2019-05-22', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.a', 56, 1, 5, 3),
(19, 1, 'proident, sunt in culpa qui officia deserunt mollit anim id est laborum.a', '2019-05-16', '2019-05-20', '2019-05-23', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 5, 3),
(20, 3, 'proident, sunt in culpa qui officia deserunt mollit anim id est laborum.a', '2019-05-23', '2019-05-20', '2019-05-23', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 1, 2),
(21, 3, 'proident, sunt in culpa qui officia deserunt mollit anim id est laborum.a', '2019-05-23', '2019-05-20', '2019-05-23', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 2, 4),
(22, 3, 'jklfgfgfgfgfgfgfgf gfgfgfgfg fg fgfgf gf fg gfgf gfgfgf gf fg fgf fg fgf gfgf', '2019-05-23', '2019-05-20', '2019-05-20', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 6, 3),
(23, -1, NULL, '2019-05-23', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 6, 3),
(24, -1, NULL, '2019-05-23', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 3, 1),
(25, -1, NULL, '2019-05-23', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 5, 1),
(26, -1, NULL, '2019-05-23', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56, 1, 1, 4),
(27, -1, NULL, '2019-06-03', NULL, NULL, 'hfjgqqqqqqqq', 56, 1, 1, 1),
(28, -1, NULL, '2019-06-02', NULL, NULL, 'hdhfhkhddkgdkgdkh', 56, 1, 1, 1),
(29, -1, NULL, '2019-06-03', NULL, NULL, 'hola quiero probar la bd', 72, 1, 1, 2),
(30, 3, 'hhjfjh', '2019-06-03', NULL, NULL, 'fvvggh', 72, 1, 2, 3),
(31, -1, 'ssfsds', '2019-06-03', NULL, NULL, 'holaaa', 72, 1, 3, 1),
(32, -1, 'dfdsfs', '2019-06-03', NULL, NULL, 'ybdksjsnd', 72, 1, 4, 1),
(33, -1, 'dfsdffd', '2019-06-03', NULL, NULL, 'hola', 72, 1, 5, 1),
(34, -1, 'gfhfyf', '2019-06-03', NULL, NULL, 'esto no sirve', 72, 1, 6, 1),
(35, -1, NULL, '2019-06-03', NULL, NULL, 'jdkdhSj', 72, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ciudadano`
--

CREATE TABLE `tipo_ciudadano` (
  `id_tipo_ciudadano` int(11) UNSIGNED NOT NULL,
  `tipo` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_ciudadano`
--

INSERT INTO `tipo_ciudadano` (`id_tipo_ciudadano`, `tipo`) VALUES
(1, 'Persona Natural'),
(2, 'TCP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_local`
--

CREATE TABLE `tipo_local` (
  `id_tipo_local` int(11) UNSIGNED NOT NULL,
  `tipo_local` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_local`
--

INSERT INTO `tipo_local` (`id_tipo_local`, `tipo_local`) VALUES
(1, 'Particular'),
(2, 'Estatal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_solicitud`
--

CREATE TABLE `tipo_solicitud` (
  `id_tipo_solicitud` int(11) UNSIGNED NOT NULL,
  `tipo_solicitud` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_solicitud`
--

INSERT INTO `tipo_solicitud` (`id_tipo_solicitud`, `tipo_solicitud`) VALUES
(1, 'Consulta'),
(2, 'Asesoria Tecnica'),
(3, 'Consulta para Acción Constructiva'),
(4, 'Regulacion TCP'),
(5, 'Queja'),
(6, 'Sugerencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `apellido_1` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `apellido_2` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `id_rol` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido_1`, `apellido_2`, `nombre_usuario`, `password`, `id_rol`) VALUES
(1, 'Root', '', '', 'Root', '214CD32D19DC0082A0F17781656C5AE3', 4),
(56, 'Ania', 'Fernández', 'León', 'Ania', '214CD32D19DC0082A0F17781656C5AE3', 3),
(67, 'Milenaa', 'Galindo', 'Portuondo', 'Mili', '214CD32D19DC0082A0F17781656C5AE3', 2),
(70, 'Orlando', 'Peña', 'Fernández', 'Orly', '214CD32D19DC0082A0F17781656C5AE3', 1),
(71, 'Kdks', 'Djsjs', 'Bdndn', 'mili', 'DBF76CFB609877E945257A3DB2ECA343', 2),
(72, 'Pepe', 'Pepe', 'Pepe', 'pepe', 'D79324F2CB805055B1A8B6865CB87F6F', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_tipo_ciudadano` (`id_tipo_ciudadano`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `directivo`
--
ALTER TABLE `directivo`
  ADD PRIMARY KEY (`id_directivo`) USING BTREE,
  ADD KEY `id_directivo` (`id_directivo`);

--
-- Indices de la tabla `especialista`
--
ALTER TABLE `especialista`
  ADD PRIMARY KEY (`id_especialista`),
  ADD KEY `id_especialista` (`id_especialista`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `regulacion_tcp`
--
ALTER TABLE `regulacion_tcp`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_solicitud` (`id_solicitud`),
  ADD KEY `tipo_local` (`tipo_local`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_especialista` (`id_especialista`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_solicitud` (`id_solicitud`),
  ADD KEY `id_tipo_solicitud` (`id_tipo_solicitud`);

--
-- Indices de la tabla `tipo_ciudadano`
--
ALTER TABLE `tipo_ciudadano`
  ADD PRIMARY KEY (`id_tipo_ciudadano`),
  ADD KEY `id_tipo_ciudadano` (`id_tipo_ciudadano`);

--
-- Indices de la tabla `tipo_local`
--
ALTER TABLE `tipo_local`
  ADD PRIMARY KEY (`id_tipo_local`),
  ADD KEY `id_tipo_local` (`id_tipo_local`);

--
-- Indices de la tabla `tipo_solicitud`
--
ALTER TABLE `tipo_solicitud`
  ADD PRIMARY KEY (`id_tipo_solicitud`) USING BTREE,
  ADD KEY `id_solicitud` (`id_tipo_solicitud`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario_rol` (`id_rol`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `especialista`
--
ALTER TABLE `especialista`
  MODIFY `id_especialista` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `id_solicitud` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `tipo_ciudadano`
--
ALTER TABLE `tipo_ciudadano`
  MODIFY `id_tipo_ciudadano` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_local`
--
ALTER TABLE `tipo_local`
  MODIFY `id_tipo_local` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_solicitud`
--
ALTER TABLE `tipo_solicitud`
  MODIFY `id_tipo_solicitud` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD CONSTRAINT `ciudadano_ibfk_1` FOREIGN KEY (`id_tipo_ciudadano`) REFERENCES `tipo_ciudadano` (`id_tipo_ciudadano`),
  ADD CONSTRAINT `ciudadano_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `directivo`
--
ALTER TABLE `directivo`
  ADD CONSTRAINT `directivo_ibfk_1` FOREIGN KEY (`id_directivo`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `especialista`
--
ALTER TABLE `especialista`
  ADD CONSTRAINT `especialista_ibfk_1` FOREIGN KEY (`id_especialista`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `regulacion_tcp`
--
ALTER TABLE `regulacion_tcp`
  ADD CONSTRAINT `regulacion_tcp_ibfk_1` FOREIGN KEY (`tipo_local`) REFERENCES `tipo_local` (`id_tipo_local`),
  ADD CONSTRAINT `regulacion_tcp_ibfk_2` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud` (`id_solicitud`);

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `ciudadano` (`id_usuario`),
  ADD CONSTRAINT `solicitud_ibfk_3` FOREIGN KEY (`id_especialista`) REFERENCES `especialista` (`id_especialista`),
  ADD CONSTRAINT `solicitud_ibfk_4` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `solicitud_ibfk_5` FOREIGN KEY (`id_tipo_solicitud`) REFERENCES `tipo_solicitud` (`id_tipo_solicitud`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
