-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 03 2021 г., 16:51
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `restapi`
--

-- --------------------------------------------------------

--
-- Структура таблицы `airports`
--

CREATE TABLE `airports` (
  `id` bigint UNSIGNED NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `airport` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iata` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `airports`
--

INSERT INTO `airports` (`id`, `city`, `country`, `airport`, `iata`, `created_at`, `updated_at`) VALUES
(1, 'Kazan', 'Russia', 'Kazan', 'KZN', NULL, NULL),
(2, 'Moscow', 'Russia', 'Sheremetyevo', 'SVO', NULL, NULL),
(3, 'St Petersburg', 'Russia', 'Pulkovo', 'LED', NULL, NULL),
(4, 'Sochi', 'Russia', 'Sochi', 'AER', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `flight_from` bigint UNSIGNED NOT NULL,
  `flight_back` bigint UNSIGNED DEFAULT NULL,
  `date_from` date NOT NULL,
  `date_back` date DEFAULT NULL,
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bookings`
--

INSERT INTO `bookings` (`id`, `flight_from`, `flight_back`, `date_from`, `date_back`, `code`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2020-10-01', '2020-10-10', 'TESTA', '2020-09-15 14:53:44', '2020-09-15 14:53:44'),
(3, 12, NULL, '2020-10-01', NULL, '50113', '2021-11-03 07:19:47', '2021-11-03 07:19:47'),
(4, 12, NULL, '2020-10-01', NULL, '61329', '2021-11-03 07:22:13', '2021-11-03 07:22:13'),
(5, 12, NULL, '2020-10-01', NULL, '64254', '2021-11-03 07:25:52', '2021-11-03 07:25:52'),
(6, 12, NULL, '2020-10-01', NULL, '01422', '2021-11-03 07:26:24', '2021-11-03 07:26:24'),
(7, 12, NULL, '2020-10-01', NULL, '58300', '2021-11-03 07:27:28', '2021-11-03 07:27:28'),
(8, 12, NULL, '2020-10-01', NULL, '79439', '2021-11-03 07:27:29', '2021-11-03 07:27:29'),
(9, 12, NULL, '2020-10-01', NULL, '48790', '2021-11-03 07:27:30', '2021-11-03 07:27:30'),
(10, 12, NULL, '2020-10-01', NULL, '72653', '2021-11-03 07:27:30', '2021-11-03 07:27:30'),
(11, 12, NULL, '2020-10-01', NULL, '50909', '2021-11-03 07:27:31', '2021-11-03 07:27:31'),
(12, 12, NULL, '2020-10-01', NULL, '97712', '2021-11-03 07:27:33', '2021-11-03 07:27:33'),
(13, 12, NULL, '2020-10-01', NULL, '82643', '2021-11-03 07:29:16', '2021-11-03 07:29:16'),
(14, 12, NULL, '2020-10-01', NULL, '41763', '2021-11-03 07:30:05', '2021-11-03 07:30:05'),
(15, 12, NULL, '2020-10-01', NULL, '92660', '2021-11-03 07:30:36', '2021-11-03 07:30:36'),
(16, 12, NULL, '2020-10-01', NULL, '24601', '2021-11-03 07:32:05', '2021-11-03 07:32:05'),
(17, 12, NULL, '2020-10-01', NULL, '48546', '2021-11-03 07:33:50', '2021-11-03 07:33:50'),
(18, 12, NULL, '2020-10-01', NULL, '66438', '2021-11-03 07:38:50', '2021-11-03 07:38:50'),
(19, 12, NULL, '2020-10-01', NULL, '92433', '2021-11-03 08:17:36', '2021-11-03 08:17:36');

-- --------------------------------------------------------

--
-- Структура таблицы `flights`
--

CREATE TABLE `flights` (
  `id` bigint UNSIGNED NOT NULL,
  `flight_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint UNSIGNED NOT NULL,
  `to_id` bigint UNSIGNED NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `cost` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `flights`
--

INSERT INTO `flights` (`id`, `flight_code`, `from_id`, `to_id`, `time_from`, `time_to`, `cost`, `created_at`, `updated_at`) VALUES
(1, 'FP2100', 2, 1, '08:35:00', '10:05:00', 10500, NULL, NULL),
(2, 'FP1200', 1, 2, '12:00:00', '13:35:00', 9500, NULL, NULL),
(3, 'FP2300', 2, 3, '07:05:00', '08:20:00', 4500, NULL, NULL),
(4, 'FP3200', 3, 2, '11:35:00', '12:50:00', 5500, NULL, NULL),
(5, 'FP2400', 2, 4, '10:00:00', '11:20:00', 3500, NULL, NULL),
(6, 'FP4200', 4, 2, '13:00:00', '14:20:00', 4500, NULL, NULL),
(7, 'FP3100', 3, 1, '15:00:00', '16:50:00', 7000, NULL, NULL),
(8, 'FP1300', 1, 3, '18:30:00', '20:10:00', 7500, NULL, NULL),
(9, 'FP3400', 3, 4, '18:00:00', '20:10:00', 10450, NULL, NULL),
(10, 'FP4300', 4, 3, '21:30:00', '23:10:00', 12050, NULL, NULL),
(11, 'FP1400', 1, 4, '14:30:00', '16:30:00', 15050, NULL, NULL),
(12, 'FP1400', 1, 4, '17:30:00', '19:30:00', 14050, NULL, NULL),
(13, 'FP2101', 2, 1, '12:10:00', '13:35:00', 12500, NULL, NULL),
(14, 'FP1201', 1, 2, '08:45:00', '10:05:00', 10500, NULL, NULL),
(15, 'FP2301', 2, 3, '11:45:00', '12:50:00', 5000, NULL, NULL),
(16, 'FP3201', 3, 2, '07:15:00', '08:20:00', 6000, NULL, NULL),
(17, 'FP2401', 2, 4, '13:10:00', '14:20:00', 2500, NULL, NULL),
(18, 'FP4201', 4, 2, '10:10:00', '11:20:00', 3500, NULL, NULL),
(19, 'FP3101', 3, 1, '18:40:00', '20:10:00', 7500, NULL, NULL),
(20, 'FP1301', 1, 3, '15:10:00', '16:50:00', 6500, NULL, NULL),
(21, 'FP3401', 3, 4, '21:40:00', '23:10:00', 9450, NULL, NULL),
(22, 'FP4301', 4, 3, '18:10:00', '20:10:00', 13050, NULL, NULL),
(23, 'FP1401', 1, 4, '17:40:00', '19:30:00', 13050, NULL, NULL),
(24, 'FP1401', 1, 4, '14:40:00', '16:30:00', 12050, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `passengers`
--

CREATE TABLE `passengers` (
  `id` bigint UNSIGNED NOT NULL,
  `booking_id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `document_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_from` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place_back` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `passengers`
--

INSERT INTO `passengers` (`id`, `booking_id`, `first_name`, `last_name`, `birth_date`, `document_number`, `place_from`, `place_back`, `created_at`, `updated_at`) VALUES
(1, 1, 'TestCase1_first_name', 'TestCase1_last_name', '1990-02-20', '7788223311', '7A', NULL, '2020-09-15 14:53:44', '2020-09-15 14:53:44'),
(2, 1, 'TestCase2_first_name', 'TestCase2_last_name', '1992-09-22', '9922335577', NULL, '8B', '2020-09-15 14:53:44', '2020-09-15 14:53:44'),
(4, 17, 'Ivan', 'Gorbunov', '1990-03-20', '1224567890', NULL, NULL, '2021-11-03 07:33:50', '2021-11-03 07:33:50'),
(6, 18, 'Ivan', 'Gorbunov', '1990-03-20', '1224567890', NULL, NULL, '2021-11-03 07:38:50', '2021-11-03 07:38:50'),
(7, 19, 'TestCase1_first_name', 'TestCase1_last_name', '1990-02-20', '7788223311', NULL, NULL, '2021-11-03 08:17:36', '2021-11-03 08:17:36'),
(8, 19, 'Ivan', 'Gorbunov', '1990-03-20', '1224567890', NULL, NULL, '2021-11-03 08:17:36', '2021-11-03 08:17:36');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `password`, `document_number`, `api_token`, `created_at`, `updated_at`) VALUES
(1, 'TestCase1_first_name', 'TestCase1_last_name', '89001238833', 'password', '7788223311', 'testCaseToken', '2020-09-15 14:55:35', '2020-09-15 14:55:35'),
(2, 'Ivan', 'Ivanov', '89001234567', 'paSSword', '7567999222', '63746260', '2021-10-31 06:41:04', '2021-10-31 06:41:04');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_flight_from_foreign` (`flight_from`),
  ADD KEY `bookings_flight_back_foreign` (`flight_back`);

--
-- Индексы таблицы `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flights_from_id_foreign` (`from_id`),
  ADD KEY `flights_to_id_foreign` (`to_id`);

--
-- Индексы таблицы `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `passengers_booking_id_foreign` (`booking_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `airports`
--
ALTER TABLE `airports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `flights`
--
ALTER TABLE `flights`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_flight_back_foreign` FOREIGN KEY (`flight_back`) REFERENCES `flights` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_flight_from_foreign` FOREIGN KEY (`flight_from`) REFERENCES `flights` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_from_id_foreign` FOREIGN KEY (`from_id`) REFERENCES `airports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flights_to_id_foreign` FOREIGN KEY (`to_id`) REFERENCES `airports` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
