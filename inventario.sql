-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-04-2021 a las 08:25:18
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ims`
--
CREATE DATABASE IF NOT EXISTS `ims` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ims`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currentstocks`
--

CREATE TABLE `currentstocks` (
  `productcode` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `currentstocks`
--

INSERT INTO `currentstocks` (`productcode`, `quantity`) VALUES
('prod1', 3),
('prod2', 4),
('prod3', 2),
('prod4', 2),
('prod5', 2),
('prod6', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `cid` int(11) NOT NULL,
  `customercode` varchar(100) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`cid`, `customercode`, `fullname`, `location`, `phone`) VALUES
(5, 'cus1', 'Ricardo', 'Mexico', '2846456'),
(6, 'cus2', 'Ivan', 'E.U', '7487439'),
(7, 'cus3', 'Alejandra', 'Mexico', '84378952');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `productcode` varchar(100) NOT NULL,
  `productname` varchar(50) NOT NULL,
  `costprice` double NOT NULL,
  `sellingprice` double NOT NULL,
  `brand` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`pid`, `productcode`, `productname`, `costprice`, `sellingprice`, `brand`) VALUES
(80, 'prod2', 'Playstation 5', 12000, 14000, 'Sony'),
(81, 'prod3', 'Xbox One Series X', 12000, 14000, 'Microsoft'),
(79, 'prod1', 'Playstation 4', 5000, 8000, 'Sony'),
(82, 'prod4', 'Nintendo Switch', 6000, 9000, 'Nintendo'),
(83, 'prod5', 'Gamer Laptop', 14000, 18000, 'Asus'),
(84, 'prod6', 'Laptop Pavilion', 5000, 8000, 'HP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchaseinfo`
--

CREATE TABLE `purchaseinfo` (
  `purchaseid` int(11) NOT NULL,
  `suppliercode` varchar(200) NOT NULL,
  `productcode` varchar(200) NOT NULL,
  `date` varchar(200) NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalcost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `purchaseinfo`
--

INSERT INTO `purchaseinfo` (`purchaseid`, `suppliercode`, `productcode`, `date`, `quantity`, `totalcost`) VALUES
(31, 'sup8', 'prod3', 'Thu Apr 22 13:42:50 CDT 2021', 4, 48000),
(33, 'sup7', 'prod2', 'Thu Apr 22 13:42:50 CDT 2021', 3, 36000),
(35, 'sup6', 'prod4', 'Thu Apr 29 00:00:00 CDT 2021', 2, 12000),
(37, 'sup7', 'prod1', 'Wed Apr 14 22:35:13 CDT 2021', 3, 15000),
(38, 'sup9', 'prod5', 'Wed Apr 21 22:40:06 CDT 2021', 3, 42000),
(39, 'sup7', 'prod2', 'Wed Apr 21 00:00:00 CDT 2021', 1, 12000),
(40, 'sup10', 'prod6', 'Wed Apr 14 20:34:08 CDT 2021', 2, 10000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salesreport`
--

CREATE TABLE `salesreport` (
  `salesid` int(11) NOT NULL,
  `date` varchar(40) NOT NULL,
  `productcode` varchar(100) NOT NULL,
  `customercode` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `revenue` double NOT NULL,
  `soldby` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `salesreport`
--

INSERT INTO `salesreport` (`salesid`, `date`, `productcode`, `customercode`, `quantity`, `revenue`, `soldby`) VALUES
(6, 'Wed Apr 07 11:53:09 CDT 2021', 'prod1', 'cus1', 2, 20000, 'dan'),
(7, 'Thu Apr 15 13:49:03 CDT 2021', 'prod3', 'cus1', 2, 28000, 'dan'),
(8, 'Thu Apr 22 00:00:00 CDT 2021', 'prod5', 'cus2', 1, 18000, 'dan'),
(9, 'Wed Apr 14 00:00:00 CDT 2021', 'prod6', 'cus3', 1, 8000, 'dan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `sid` int(11) NOT NULL,
  `suppliercode` varchar(100) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`sid`, `suppliercode`, `fullname`, `location`, `phone`) VALUES
(144, 'sup7', 'Sony', 'Japon', '37465867'),
(143, 'sup6', 'nintendo', 'japon', '556374'),
(145, 'sup8', 'microsoft', 'USA', '4978957698'),
(146, 'sup9', 'Asus', 'Taiwan', '978427'),
(147, 'sup10', 'HP', 'USA', '58940896');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `category` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `fullname`, `location`, `phone`, `username`, `password`, `category`) VALUES
(54, 'Dan', 'Mexico', '5527572092', 'dan', '9180b4da3f0c7e80975fad685f7f134e', 'ADMINISTRATOR'),
(57, 'danlez', 'mex', '98239832', 'user6', 'affec3b64cf90492377a8114c86fc093', 'NORMAL USER');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cid`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`);

--
-- Indices de la tabla `purchaseinfo`
--
ALTER TABLE `purchaseinfo`
  ADD PRIMARY KEY (`purchaseid`);

--
-- Indices de la tabla `salesreport`
--
ALTER TABLE `salesreport`
  ADD PRIMARY KEY (`salesid`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`sid`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `purchaseinfo`
--
ALTER TABLE `purchaseinfo`
  MODIFY `purchaseid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `salesreport`
--
ALTER TABLE `salesreport`
  MODIFY `salesid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
