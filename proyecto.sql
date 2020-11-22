-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2020 a las 05:06:31
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_car` int(11) NOT NULL,
  `user` varchar(150) NOT NULL,
  `nombre_car` varchar(100) NOT NULL,
  `precio_car` int(11) NOT NULL,
  `piezas_car` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_prod` int(11) NOT NULL,
  `nombre_prod` varchar(100) NOT NULL,
  `precio_prod` int(11) NOT NULL,
  `desc_prod` varchar(250) NOT NULL,
  `categoria` int(11) NOT NULL,
  `url_prod` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_prod`, `nombre_prod`, `precio_prod`, `desc_prod`, `categoria`, `url_prod`) VALUES
(2, 'ALIENWARE AURORA', 61032, 'Windows 10 Home de 64 bitS\r\nMemoria HyperX™ FURY DDR4 y 8 GB\r\nGeForce GTX® 1650 con memoria GDDR5 de 4 GB', 0, '../../assets/img/productos/alien/alien1.png'),
(4, 'ALIENWARE AURORA', 61032, 'Windows 10 Home de 64 bitS\r\nMemoria HyperX™ FURY DDR4 y 8 GB\r\nGeForce GTX® 1650 con memoria GDDR5 de 4 GB', 0, '../../assets/img/productos/acces/10.png'),
(7, 'ALIENWARE AURORA', 61032, 'Windows 10 Home de 64 bitS\r\nMemoria HyperX™ FURY DDR4 y 8 GB\r\nGeForce GTX® 1650 con memoria GDDR5 de 4 GB', 6, '../../assets/img/productos/asus/2.png'),
(9, 'BLACK GAMING CPU', 61032, 'Windows 10 Home de 64 bitS\r\nMemoria HyperX™ FURY DDR4 y 8 GB\r\nGeForce GTX® 1650 con memoria GDDR5 de 4 GB', 8, '../../assets/img/productos/hardware/2.png'),
(10, 'BLUE GAMING CPU', 3800, 'Cristal templado, tres coolers incluidos', 2, '../../assets/img/productos/gabinetes/2.png'),
(11, 'Prueba', 5678, 'Un producto de prueba', 2, '../../assets/img/productos/acces/10.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `user` varchar(150) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `fecha_nac` date NOT NULL,
  `correo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registros`
--

INSERT INTO `registros` (`user`, `nombre`, `apellidos`, `fecha_nac`, `correo`) VALUES
('Uno', 'Ignacio', 'Reyes', '2020-11-26', 'ignacio.luz99@gmail.com'),
('jsp2', 'Jesus Emmanuel', 'Garcia', '2020-11-04', 'jesusmartinez0257@gmail.com'),
('Uno', 'Ignacio', 'Luz', '2020-12-10', 'joscruz581@gmail.com'),
('123', 'Ignacio', 'Luz', '2020-11-06', 'joscruz581@gmail.com'),
('sss', 'sss', 'sss', '2020-11-19', 'ssss'),
('papu', 'Jose', 'Perez', '2020-11-12', 'unoinventado@email.com'),
('camacho', 'Edgar', 'Camacho', '2020-11-06', 'email.com'),
('josesin', 'Jose', 'perez', '2020-11-04', 'asdasd'),
('pp', 'pp', 'pp', '2020-11-06', 'pp'),
('popo', 'Jose', 'perez', '2020-11-06', 'email.com'),
('beto', 'Beto', 'betillo', '2020-11-06', 'betin'),
('ddd', 'ddd', 'ddd', '2020-11-04', 'ddd'),
('nach', 'Ignacio', 'Reyes', '2020-11-04', 'ignacio.luz99@gmail.com'),
('test', 'Ignacio', 'Reyes', '2019-11-07', 'ignacio.luz99@gmail.com'),
('papu', 'Ignacio', 'Luz', '2020-11-04', 'joscruz581@gmail.com'),
('ignacio', 'Ignacio', 'Reyes', '2020-11-12', 'ignacio.luz99@gmail.com'),
('ignacio2', 'Ignacio', 'Reyes', '2020-11-12', 'ignacio.luz99@gmail.com'),
('popoo', 'Ignacio', 'Luz', '2020-11-05', 'joscruz581@gmail.com'),
('popoos', 'Ignacio', 'Luz', '2020-11-05', 'ignacioluz58@gmail.com'),
('firu', 'Ignacio', 'Luz', '2020-11-20', 'joscruz581@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `user` varchar(150) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `tipo_user` char(1) NOT NULL,
  `nombre` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`user`, `pass`, `tipo_user`, `nombre`) VALUES
('123', 'asd', 'U', 'Jose'),
('admin', '123', 'A', 'admin'),
('admin2', '123', 'A', 'admin'),
('camacho', '123', 'U', 'Edgar'),
('josesin', '9090', 'U', 'Jose'),
('popo', '0909', 'U', 'Jose'),
('beto', '123', 'U', 'Beto'),
('ddd', 'ddd', 'U', 'ddd'),
('pepe', '123', 'U', 'admin'),
('nach', '123', 'U', 'Ignacio'),
('test', '123', 'U', 'Ignacio'),
('ignacio', '1111', 'U', 'Ignacio'),
('ignacio2', '2222', 'U', 'Ignacio'),
('asd', 'asd', 'A', 'asdsad'),
('asdasd', 'asd', 'A', 'asd'),
('popoo', '123', 'U', 'Ignacio'),
('popoos', 'asd', 'U', 'Ignacio'),
('firu', '123', 'U', 'Ignacio'),
('firu4', '123', 'A', 'Pepe'),
('pepe', '123', 'A', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_car`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_prod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_car` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
