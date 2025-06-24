-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 22 2025 г., 18:20
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `luberetsky_college`
--

-- --------------------------------------------------------

--
-- Структура таблицы `document_templates`
--

CREATE TABLE `document_templates` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` enum('educational','production') NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `file_size` int(11) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `preview_image` varchar(500) DEFAULT NULL,
  `download_count` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `document_templates`
--

INSERT INTO `document_templates` (`id`, `title`, `description`, `category`, `file_name`, `file_path`, `file_size`, `mime_type`, `preview_image`, `download_count`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Отчет по учебной практике', 'Шаблон отчета по учебной практической подготовке для студентов. Включает все необходимые разделы: индивидуальное задание, дневник практики, текстовой отчет, заключение и список литературы.', 'educational', 'educational_practice_report.docx', '/templates/files/educational_practice_report.docx', 45632, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '/templates/previews/educational_preview.png', 0, 1, 1, NULL, '2025-06-22 15:39:34', '2025-06-22 15:39:34'),
(2, 'Отчет по производственной практике', 'Шаблон отчета по производственной практической подготовке. Содержит характеристику практиканта, описание организации, дневник прохождения практики и текстовой отчет.', 'production', 'production_practice_report.docx', '/templates/files/production_practice_report.docx', 52148, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '/templates/previews/production_preview.png', 1, 1, 1, NULL, '2025-06-22 15:39:34', '2025-06-22 15:49:04');

-- --------------------------------------------------------

--
-- Структура таблицы `instructions`
--

CREATE TABLE `instructions` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `instructions`
--

INSERT INTO `instructions` (`id`, `content`, `updated_by`, `updated_at`, `created_at`) VALUES
(1, '<div class=\"content-wrapper\" id=\"contentWrapper\">\r\n        <h1 class=\"instructions-title\">Инструкция по заполнению отчетов</h1>\r\n        <h2 class=\"section-subtitle\">УЧЕБНАЯ ПРАКТИКА</h2>\r\n        <!-- Здесь будет полный контент инструкций -->\r\n    </div>', 1, '2025-06-22 14:57:26', '2025-06-22 14:57:26');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `role_description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `role_description`, `created_at`) VALUES
(1, 'admin', 'Администратор системы', '2025-06-22 13:49:51'),
(2, 'teacher', 'Преподаватель', '2025-06-22 13:49:51'),
(3, 'student', 'Студент', '2025-06-22 13:49:51');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `group_number` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `first_name`, `last_name`, `middle_name`, `role_id`, `group_number`, `phone`, `is_active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@luberetsky-college.ru', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Администратор', 'Системы', 'Иванович', 1, NULL, '+7-495-123-45-67', 1, NULL, '2025-06-22 13:50:32', '2025-06-22 13:50:32'),
(2, 'ivanov_teacher', 'ivanov@luberetsky-college.ru', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Иван', 'Иванов', 'Петрович', 2, NULL, '+7-495-234-56-78', 1, NULL, '2025-06-22 13:50:32', '2025-06-22 13:50:32'),
(3, 'petrova_teacher', 'petrova@luberetsky-college.ru', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Мария', 'Петрова', 'Сергеевна', 2, NULL, '+7-495-345-67-89', 1, NULL, '2025-06-22 13:50:32', '2025-06-22 13:50:32'),
(4, 'sidorov_student', 'sidorov@student.luberetsky-college.ru', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Алексей', 'Сидоров', 'Владимирович', 3, 'ИС-21-1', '+7-916-123-45-67', 1, NULL, '2025-06-22 13:50:32', '2025-06-22 13:50:32'),
(5, 'kozlova_student', 'kozlova@student.luberetsky-college.ru', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Анна', 'Козлова', 'Дмитриевна', 3, 'ИС-21-1', '+7-916-234-56-78', 1, NULL, '2025-06-22 13:50:32', '2025-06-22 13:50:32'),
(6, 'volkov_student', 'volkov@student.luberetsky-college.ru', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Дмитрий', 'Волков', 'Александрович', 3, 'ПР-21-2', '+7-916-345-67-89', 1, NULL, '2025-06-22 13:50:32', '2025-06-22 13:50:32');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `document_templates`
--
ALTER TABLE `document_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_active` (`is_active`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Индексы таблицы `instructions`
--
ALTER TABLE `instructions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `idx_updated_at` (`updated_at`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_users_username` (`username`),
  ADD KEY `idx_users_email` (`email`),
  ADD KEY `idx_users_role` (`role_id`),
  ADD KEY `idx_users_active` (`is_active`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `document_templates`
--
ALTER TABLE `document_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `instructions`
--
ALTER TABLE `instructions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `document_templates`
--
ALTER TABLE `document_templates`
  ADD CONSTRAINT `templates_created_by_fk` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `templates_updated_by_fk` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `instructions`
--
ALTER TABLE `instructions`
  ADD CONSTRAINT `instructions_ibfk_1` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
