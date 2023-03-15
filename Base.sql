-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 15 2023 г., 06:13
-- Версия сервера: 8.0.24
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `base`
--
CREATE DATABASE IF NOT EXISTS `base` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `base`;

-- --------------------------------------------------------

--
-- Структура таблицы `cargo`
--

CREATE TABLE `cargo` (
  `ID` int NOT NULL,
  `Specifications` varchar(1000) NOT NULL,
  `ID_OrderDocument` int NOT NULL,
  `ID_Client` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Очистить таблицу перед добавлением данных `cargo`
--

TRUNCATE TABLE `cargo`;
-- --------------------------------------------------------

--
-- Структура таблицы `cargorequest`
--

CREATE TABLE `cargorequest` (
  `ID` int NOT NULL,
  `FULL_NAME` varchar(1000) NOT NULL,
  `Telephone` varchar(17) NOT NULL,
  `Comment` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `region` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DataCreation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Очистить таблицу перед добавлением данных `cargorequest`
--

TRUNCATE TABLE `cargorequest`;
--
-- Дамп данных таблицы `cargorequest`
--

INSERT INTO `cargorequest` (`ID`, `FULL_NAME`, `Telephone`, `Comment`, `region`, `DataCreation`) VALUES
(1, 'Богдан', '+79990836672', '', 'area', '2015-03-23'),
(2, '123', '123', '123', 'russia', '2023-03-15');

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `ID` int NOT NULL,
  `Specifications` varchar(1000) NOT NULL,
  `ID_Driver` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Очистить таблицу перед добавлением данных `cars`
--

TRUNCATE TABLE `cars`;
-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `ID` int NOT NULL,
  `FULL_NAME` varchar(355) NOT NULL,
  `Passport_serie` int NOT NULL,
  `Passport_Number` int NOT NULL,
  `Telephone` int NOT NULL,
  `ID_Cargo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Очистить таблицу перед добавлением данных `clients`
--

TRUNCATE TABLE `clients`;
-- --------------------------------------------------------

--
-- Структура таблицы `consultation`
--

CREATE TABLE `consultation` (
  `ID` int NOT NULL,
  `userEmail` varchar(70) NOT NULL,
  `staffID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Очистить таблицу перед добавлением данных `consultation`
--

TRUNCATE TABLE `consultation`;
--
-- Дамп данных таблицы `consultation`
--

INSERT INTO `consultation` (`ID`, `userEmail`, `staffID`) VALUES
(1, '', NULL),
(2, '123@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `documentorder`
--

CREATE TABLE `documentorder` (
  `ID` int NOT NULL,
  `DataCreation` date NOT NULL,
  `Comment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Очистить таблицу перед добавлением данных `documentorder`
--

TRUNCATE TABLE `documentorder`;
-- --------------------------------------------------------

--
-- Структура таблицы `drivers`
--

CREATE TABLE `drivers` (
  `ID` int NOT NULL,
  `FULL_NAME` varchar(355) NOT NULL,
  `Telephone` int NOT NULL,
  `Passport_Serie` int NOT NULL,
  `Passport_Number` int NOT NULL,
  `Labor_Book` varchar(500) NOT NULL,
  `ID_Cargo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Очистить таблицу перед добавлением данных `drivers`
--

TRUNCATE TABLE `drivers`;
-- --------------------------------------------------------

--
-- Структура таблицы `staff`
--

CREATE TABLE `staff` (
  `ID` int NOT NULL,
  `FULL_NAME` varchar(355) NOT NULL,
  `Passport_serie` int NOT NULL,
  `Passport_Number` int NOT NULL,
  `Telephone` int NOT NULL,
  `Labor_Book` varchar(500) NOT NULL,
  `ID_Client` int NOT NULL,
  `ID_OrderDocument` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Очистить таблицу перед добавлением данных `staff`
--

TRUNCATE TABLE `staff`;
--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_OrderDocument` (`ID_OrderDocument`),
  ADD KEY `ID_Client` (`ID_Client`);

--
-- Индексы таблицы `cargorequest`
--
ALTER TABLE `cargorequest`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Driver` (`ID_Driver`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `staffID` (`staffID`);

--
-- Индексы таблицы `documentorder`
--
ALTER TABLE `documentorder`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Cargo` (`ID_Cargo`);

--
-- Индексы таблицы `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Client` (`ID_Client`),
  ADD KEY `ID_OrderDocument` (`ID_OrderDocument`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cargo`
--
ALTER TABLE `cargo`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cargorequest`
--
ALTER TABLE `cargorequest`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `consultation`
--
ALTER TABLE `consultation`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `documentorder`
--
ALTER TABLE `documentorder`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `drivers`
--
ALTER TABLE `drivers`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `staff`
--
ALTER TABLE `staff`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`ID_OrderDocument`) REFERENCES `documentorder` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cargo_ibfk_2` FOREIGN KEY (`ID_Client`) REFERENCES `clients` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`ID_Driver`) REFERENCES `drivers` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `staff` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`ID_Cargo`) REFERENCES `cargo` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`ID_Client`) REFERENCES `clients` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`ID_OrderDocument`) REFERENCES `documentorder` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
