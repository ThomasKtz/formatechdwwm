-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 02 mai 2024 à 14:24
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `formatechdwwm`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_civility` tinyint(1) NOT NULL,
  `admin_firstname` varchar(80) NOT NULL,
  `admin_lastname` varchar(80) NOT NULL,
  `admin_phone` varchar(30) NOT NULL,
  `admin_email` varchar(80) NOT NULL,
  `admin_password` varchar(250) NOT NULL,
  `admin_adress` varchar(80) NOT NULL,
  `admin_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_city` int NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_email` (`admin_email`),
  KEY `id_city` (`id_city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `centers`
--

DROP TABLE IF EXISTS `centers`;
CREATE TABLE IF NOT EXISTS `centers` (
  `center_id` int NOT NULL AUTO_INCREMENT,
  `center_name` varchar(80) NOT NULL,
  `center_capacity` smallint NOT NULL,
  `center_adress` varchar(80) NOT NULL,
  `id_city` int NOT NULL,
  `id_admin` int DEFAULT NULL,
  PRIMARY KEY (`center_id`),
  UNIQUE KEY `center_name` (`center_name`),
  KEY `id_city` (`id_city`),
  KEY `id_admin` (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(80) NOT NULL,
  `city_zipcode` varchar(80) NOT NULL,
  `id_country` int NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `id_country` (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(80) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `evaluations`
--

DROP TABLE IF EXISTS `evaluations`;
CREATE TABLE IF NOT EXISTS `evaluations` (
  `evaluation_id` int NOT NULL AUTO_INCREMENT,
  `evaluation_value` tinyint NOT NULL,
  `evaluation_comment` text NOT NULL,
  `evaluation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_student` int NOT NULL,
  `id_planning` int NOT NULL,
  PRIMARY KEY (`evaluation_id`),
  KEY `id_student` (`id_student`),
  KEY `id_planning` (`id_planning`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
CREATE TABLE IF NOT EXISTS `instructors` (
  `instructor_id` int NOT NULL AUTO_INCREMENT,
  `instructor_civility` tinyint(1) NOT NULL,
  `instructor_firstname` varchar(80) NOT NULL,
  `instructor_lastname` varchar(80) NOT NULL,
  `instructor_phone` varchar(30) NOT NULL,
  `instructor_email` varchar(80) NOT NULL,
  `instructor_password` varchar(250) NOT NULL,
  `instructor_adress` varchar(80) NOT NULL,
  `instructor_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_city` int NOT NULL,
  PRIMARY KEY (`instructor_id`),
  UNIQUE KEY `instructor_email` (`instructor_email`),
  KEY `id_city` (`id_city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message_content` text NOT NULL,
  `id_student_affectation` int NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `id_student_affectation` (`id_student_affectation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `module_id` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(80) NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_name` (`module_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `plannings`
--

DROP TABLE IF EXISTS `plannings`;
CREATE TABLE IF NOT EXISTS `plannings` (
  `planning_id` int NOT NULL AUTO_INCREMENT,
  `planning_start_date` date NOT NULL,
  `planning_end_date` date NOT NULL,
  `id_session` int NOT NULL,
  `id_instructor` int DEFAULT NULL,
  `id_module` int NOT NULL,
  PRIMARY KEY (`planning_id`),
  KEY `id_session` (`id_session`),
  KEY `id_instructor` (`id_instructor`),
  KEY `id_module` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `session_name` varchar(80) NOT NULL,
  `session_start_date` date DEFAULT NULL,
  `session_end_date` date DEFAULT NULL,
  `session_capacity` smallint NOT NULL,
  `id_center` int NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `session_name` (`session_name`),
  KEY `id_center` (`id_center`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `student_civility` tinyint(1) NOT NULL,
  `student_firstname` varchar(80) NOT NULL,
  `student_lastname` varchar(80) NOT NULL,
  `student_birth_date` date NOT NULL,
  `student_phone` varchar(30) NOT NULL,
  `student_email` varchar(80) NOT NULL,
  `student_password` varchar(250) NOT NULL,
  `student_comments` text,
  `student_adress` varchar(80) NOT NULL,
  `student_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_city` int NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_email` (`student_email`),
  KEY `id_city` (`id_city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `students_affectations`
--

DROP TABLE IF EXISTS `students_affectations`;
CREATE TABLE IF NOT EXISTS `students_affectations` (
  `student_affectation_id` int NOT NULL AUTO_INCREMENT,
  `student_affectation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_student` int NOT NULL,
  `id_session` int NOT NULL,
  PRIMARY KEY (`student_affectation_id`),
  KEY `id_student` (`id_student`),
  KEY `id_session` (`id_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `super_admins`
--

DROP TABLE IF EXISTS `super_admins`;
CREATE TABLE IF NOT EXISTS `super_admins` (
  `super_admin_id` int NOT NULL AUTO_INCREMENT,
  `super_admin_civility` tinyint(1) NOT NULL,
  `super_admin_firstname` varchar(80) NOT NULL,
  `super_admin_lastname` varchar(80) NOT NULL,
  `super_admin_phone` varchar(30) NOT NULL,
  `super_admin_email` varchar(80) NOT NULL,
  `super_admin_password` varchar(250) NOT NULL,
  `super_admin_adress` varchar(80) NOT NULL,
  `super_admin_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_city` int NOT NULL,
  PRIMARY KEY (`super_admin_id`),
  UNIQUE KEY `super_admin_email` (`super_admin_email`),
  KEY `id_city` (`id_city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `cities` (`city_id`);

--
-- Contraintes pour la table `centers`
--
ALTER TABLE `centers`
  ADD CONSTRAINT `centers_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `cities` (`city_id`),
  ADD CONSTRAINT `centers_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admins` (`admin_id`);

--
-- Contraintes pour la table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `countries` (`country_id`),
  ADD CONSTRAINT `cities_ibfk_2` FOREIGN KEY (`id_country`) REFERENCES `countries` (`country_id`);

--
-- Contraintes pour la table `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `evaluations_ibfk_2` FOREIGN KEY (`id_planning`) REFERENCES `plannings` (`planning_id`);

--
-- Contraintes pour la table `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `instructors_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `cities` (`city_id`);

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_student_affectation`) REFERENCES `students_affectations` (`student_affectation_id`);

--
-- Contraintes pour la table `plannings`
--
ALTER TABLE `plannings`
  ADD CONSTRAINT `plannings_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `sessions` (`session_id`),
  ADD CONSTRAINT `plannings_ibfk_2` FOREIGN KEY (`id_instructor`) REFERENCES `instructors` (`instructor_id`),
  ADD CONSTRAINT `plannings_ibfk_3` FOREIGN KEY (`id_module`) REFERENCES `modules` (`module_id`);

--
-- Contraintes pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`id_center`) REFERENCES `centers` (`center_id`);

--
-- Contraintes pour la table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `cities` (`city_id`);

--
-- Contraintes pour la table `students_affectations`
--
ALTER TABLE `students_affectations`
  ADD CONSTRAINT `students_affectations_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `students_affectations_ibfk_2` FOREIGN KEY (`id_session`) REFERENCES `sessions` (`session_id`);

--
-- Contraintes pour la table `super_admins`
--
ALTER TABLE `super_admins`
  ADD CONSTRAINT `super_admins_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `cities` (`city_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
