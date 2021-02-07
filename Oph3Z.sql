-- --------------------------------------------------------
-- Värd:                         127.0.0.1
-- Serverversion:                10.4.17-MariaDB - mariadb.org binary distribution
-- Server-OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumpar databasstruktur för oph3znew
CREATE DATABASE IF NOT EXISTS `oph3znew` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `oph3znew`;

-- Dumpar struktur för tabell oph3znew.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.addon_account: ~7 rows (ungefär)
DELETE FROM `addon_account`;
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('caution', 'Caution', 0);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('property_black_money', 'Argent Sale Propriété', 0);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_cardealer', 'Concessionnaire', 1);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_mechanic', 'Mécano', 1);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_police', 'Police', 1);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.addon_account_data: ~7 rows (ungefär)
DELETE FROM `addon_account_data`;
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.addon_inventory: ~6 rows (ungefär)
DELETE FROM `addon_inventory`;
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('property', 'Propriété', 0);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_cardealer', 'Concesionnaire', 1);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_mechanic', 'Mécano', 1);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_police', 'Police', 1);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.addon_inventory_items: ~0 rows (ungefär)
DELETE FROM `addon_inventory_items`;
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.billing: ~0 rows (ungefär)
DELETE FROM `billing`;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.cardealer_vehicles: ~0 rows (ungefär)
DELETE FROM `cardealer_vehicles`;
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `identifier` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'f',
  `height` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.characters: ~0 rows (ungefär)
DELETE FROM `characters`;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.datastore: ~4 rows (ungefär)
DELETE FROM `datastore`;
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Propriété', 0);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_police', 'Police', 1);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.datastore_data: ~4 rows (ungefär)
DELETE FROM `datastore_data`;
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.fine_types: ~52 rows (ungefär)
DELETE FROM `fine_types`;
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Usage abusif du klaxon', 30, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(2, 'Franchir une ligne continue', 40, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(3, 'Circulation à contresens', 250, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(4, 'Demi-tour non autorisé', 250, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(5, 'Circulation hors-route', 170, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(6, 'Non-respect des distances de sécurité', 30, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(7, 'Arrêt dangereux / interdit', 150, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(8, 'Stationnement gênant / interdit', 70, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(9, 'Non respect  de la priorité à droite', 70, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(10, 'Non-respect à un véhicule prioritaire', 90, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(11, 'Non-respect d\'un stop', 105, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(12, 'Non-respect d\'un feu rouge', 130, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(13, 'Dépassement dangereux', 100, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(14, 'Véhicule non en état', 100, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(15, 'Conduite sans permis', 1500, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(16, 'Délit de fuite', 800, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(17, 'Excès de vitesse < 5 kmh', 90, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(18, 'Excès de vitesse 5-15 kmh', 120, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(19, 'Excès de vitesse 15-30 kmh', 180, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(20, 'Excès de vitesse > 30 kmh', 300, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(21, 'Entrave de la circulation', 110, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(22, 'Dégradation de la voie publique', 90, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(23, 'Trouble à l\'ordre publique', 90, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(24, 'Entrave opération de police', 130, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(25, 'Insulte envers / entre civils', 75, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(26, 'Outrage à agent de police', 110, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(27, 'Menace verbale ou intimidation envers civil', 90, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(28, 'Menace verbale ou intimidation envers policier', 150, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(29, 'Manifestation illégale', 250, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(30, 'Tentative de corruption', 1500, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(31, 'Arme blanche sortie en ville', 120, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(32, 'Arme léthale sortie en ville', 300, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(34, 'Port d\'arme illégal', 700, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(35, 'Pris en flag lockpick', 300, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(36, 'Vol de voiture', 1800, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(37, 'Vente de drogue', 1500, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(38, 'Fabriquation de drogue', 1500, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(39, 'Possession de drogue', 650, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(40, 'Prise d\'ôtage civil', 1500, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(41, 'Prise d\'ôtage agent de l\'état', 2000, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(42, 'Braquage particulier', 650, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(43, 'Braquage magasin', 650, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(44, 'Braquage de banque', 1500, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(45, 'Tir sur civil', 2000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(46, 'Tir sur agent de l\'état', 2500, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(47, 'Tentative de meurtre sur civil', 3000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(49, 'Meurtre sur civil', 10000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(50, 'Meurte sur agent de l\'état', 30000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(51, 'Meurtre involontaire', 1800, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(52, 'Escroquerie à l\'entreprise', 2000, 2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.hsn_inventory
CREATE TABLE IF NOT EXISTS `hsn_inventory` (
  `name` longtext COLLATE utf8_turkish_ci DEFAULT NULL,
  `data` longtext COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- Dumpar data för tabell oph3znew.hsn_inventory: ~1 rows (ungefär)
DELETE FROM `hsn_inventory`;
/*!40000 ALTER TABLE `hsn_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `hsn_inventory` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  `stackable` int(11) DEFAULT 1,
  `closeonuse` int(11) DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.items: ~30 rows (ungefär)
DELETE FROM `items`;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('alive_chicken', 'Poulet vivant', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('bandage', 'Bandage', 2, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('blowpipe', 'Chalumeaux', 2, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('bread', 'Ekmek', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('carokit', 'Kit carosserie', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('carotool', 'outils carosserie', 2, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('clothe', 'Vêtement', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('copper', 'Cuivre', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('cutted_wood', 'Bois coupé', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('diamond', 'Diamant', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('essence', 'Essence', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('fabric', 'Tissu', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('fish', 'Poisson', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('fixkit', 'Kit réparation', 3, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('fixtool', 'outils réparation', 2, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('gazbottle', 'bouteille de gaz', 2, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('gold', 'Or', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('iron', 'Fer', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('medikit', 'Medikit', 2, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('packaged_chicken', 'Poulet en barquette', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('packaged_plank', 'Paquet de planches', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('petrol', 'Pétrole', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('petrol_raffin', 'Pétrole Raffiné', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('slaughtered_chicken', 'Poulet abattu', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('stone', 'Pierre', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('washed_stone', 'Pierre Lavée', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('water', 'Su', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('WEAPON_PISTOL', 'pistol', 13, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('wood', 'Bois', 1, 0, 1, 1, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `stackable`, `closeonuse`) VALUES
	('wool', 'Laine', 1, 0, 1, 1, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.jobs: ~13 rows (ungefär)
DELETE FROM `jobs`;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'Ambulance', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('cardealer', 'Concessionnaire', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('fisherman', 'Pêcheur', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('fueler', 'Raffineur', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('lumberjack', 'Bûcheron', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('mechanic', 'Mécano', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('miner', 'Mineur', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('police', 'LSPD', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('reporter', 'Journaliste', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('slaughterer', 'Abatteur', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('tailor', 'Couturier', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('taxi', 'Taxi', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('unemployed', 'Unemployed', 0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.job_grades: ~31 rows (ungefär)
DELETE FROM `job_grades`;
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(2, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(3, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(4, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(5, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(6, 'ambulance', 0, 'ambulance', 'Ambulancier', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(7, 'ambulance', 1, 'doctor', 'Medecin', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(8, 'ambulance', 2, 'chief_doctor', 'Medecin-chef', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(9, 'ambulance', 3, 'boss', 'Chirurgien', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(10, 'lumberjack', 0, 'employee', 'Intérimaire', 0, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(11, 'fisherman', 0, 'employee', 'Intérimaire', 0, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(12, 'fueler', 0, 'employee', 'Intérimaire', 0, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(13, 'reporter', 0, 'employee', 'Intérimaire', 0, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(14, 'tailor', 0, 'employee', 'Intérimaire', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(15, 'miner', 0, 'employee', 'Intérimaire', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(16, 'slaughterer', 0, 'employee', 'Intérimaire', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(17, 'mechanic', 0, 'recrue', 'Recrue', 12, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(18, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(19, 'mechanic', 2, 'experimente', 'Experimente', 36, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(20, 'mechanic', 3, 'chief', 'Chef d\'équipe', 48, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(21, 'mechanic', 4, 'boss', 'Patron', 0, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(22, 'police', 0, 'recruit', 'Recrue', 20, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(23, 'police', 1, 'officer', 'Officier', 40, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(24, 'police', 2, 'sergeant', 'Sergent', 60, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(25, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(26, 'police', 4, 'boss', 'Commandant', 100, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(27, 'taxi', 0, 'recrue', 'Recrue', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(28, 'taxi', 1, 'novice', 'Novice', 24, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(29, 'taxi', 2, 'experimente', 'Experimente', 36, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(30, 'taxi', 3, 'uber', 'Uber', 48, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(31, 'taxi', 4, 'boss', 'Patron', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.licenses: ~4 rows (ungefär)
DELETE FROM `licenses`;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('dmv', 'Code de la route');
INSERT INTO `licenses` (`type`, `label`) VALUES
	('drive', 'Permis de conduire');
INSERT INTO `licenses` (`type`, `label`) VALUES
	('drive_bike', 'Permis moto');
INSERT INTO `licenses` (`type`, `label`) VALUES
	('drive_truck', 'Permis camion');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.owned_properties
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.owned_properties: ~0 rows (ungefär)
DELETE FROM `owned_properties`;
/*!40000 ALTER TABLE `owned_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_properties` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(22) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.owned_vehicles: ~0 rows (ungefär)
DELETE FROM `owned_vehicles`;
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.properties: ~72 rows (ungefär)
DELETE FROM `properties`;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{"y":564.89,"z":182.959,"x":119.384}', '{"x":117.347,"y":559.506,"z":183.304}', '{"y":557.032,"z":183.301,"x":118.037}', '{"y":567.798,"z":182.131,"x":119.249}', '[]', NULL, 1, 1, 0, '{"x":118.748,"y":566.573,"z":175.697}', 1500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{"x":372.796,"y":428.327,"z":144.685}', '{"x":373.548,"y":422.982,"z":144.907},', '{"y":420.075,"z":145.904,"x":372.161}', '{"x":372.454,"y":432.886,"z":143.443}', '[]', NULL, 1, 1, 0, '{"x":377.349,"y":429.422,"z":137.3}', 1500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{"y":-379.165,"z":37.961,"x":-936.363}', '{"y":-365.476,"z":113.274,"x":-913.097}', '{"y":-367.637,"z":113.274,"x":-918.022}', '{"y":-382.023,"z":37.961,"x":-943.626}', '[]', NULL, 1, 1, 0, '{"x":-927.554,"y":-377.744,"z":112.674}', 1700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{"y":440.8,"z":146.702,"x":346.964}', '{"y":437.456,"z":148.394,"x":341.683}', '{"y":435.626,"z":148.394,"x":339.595}', '{"x":350.535,"y":443.329,"z":145.764}', '[]', NULL, 1, 1, 0, '{"x":337.726,"y":436.985,"z":140.77}', 1500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{"y":502.696,"z":136.421,"x":-176.003}', '{"y":497.817,"z":136.653,"x":-174.349}', '{"y":495.069,"z":136.666,"x":-173.331}', '{"y":506.412,"z":135.0664,"x":-177.927}', '[]', NULL, 1, 1, 0, '{"x":-174.725,"y":493.095,"z":129.043}', 1500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{"y":596.58,"z":142.641,"x":-686.554}', '{"y":591.988,"z":144.392,"x":-681.728}', '{"y":590.608,"z":144.392,"x":-680.124}', '{"y":599.019,"z":142.059,"x":-689.492}', '[]', NULL, 1, 1, 0, '{"x":-680.46,"y":588.6,"z":136.769}', 1500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(7, 'LowEndApartment', 'Appartement de base', '{"y":-1078.735,"z":28.4031,"x":292.528}', '{"y":-1007.152,"z":-102.002,"x":265.845}', '{"y":-1002.802,"z":-100.008,"x":265.307}', '{"y":-1078.669,"z":28.401,"x":296.738}', '[]', NULL, 1, 1, 0, '{"x":265.916,"y":-999.38,"z":-100.008}', 562500);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{"y":454.955,"z":96.462,"x":-1294.433}', '{"x":-1289.917,"y":449.541,"z":96.902}', '{"y":446.322,"z":96.899,"x":-1289.642}', '{"y":455.453,"z":96.517,"x":-1298.851}', '[]', NULL, 1, 1, 0, '{"x":-1287.306,"y":455.901,"z":89.294}', 1500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{"x":-853.346,"y":696.678,"z":147.782}', '{"y":690.875,"z":151.86,"x":-859.961}', '{"y":688.361,"z":151.857,"x":-859.395}', '{"y":701.628,"z":147.773,"x":-855.007}', '[]', NULL, 1, 1, 0, '{"x":-858.543,"y":697.514,"z":144.253}', 1500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{"y":620.494,"z":141.588,"x":-752.82}', '{"y":618.62,"z":143.153,"x":-759.317}', '{"y":617.629,"z":143.153,"x":-760.789}', '{"y":621.281,"z":141.254,"x":-750.919}', '[]', NULL, 1, 1, 0, '{"x":-762.504,"y":618.992,"z":135.53}', 1500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{"y":37.025,"z":42.58,"x":-618.299}', '{"y":58.898,"z":97.2,"x":-603.301}', '{"y":58.941,"z":97.2,"x":-608.741}', '{"y":30.603,"z":42.524,"x":-620.017}', '[]', NULL, 1, 1, 0, '{"x":-622.173,"y":54.585,"z":96.599}', 1700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(12, 'MiltonDrive', 'Milton Drive', '{"x":-775.17,"y":312.01,"z":84.658}', NULL, NULL, '{"x":-775.346,"y":306.776,"z":84.7}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_01_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.661,"y":327.672,"z":210.396}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_01_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.735,"y":326.757,"z":186.313}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_01_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.386,"y":330.782,"z":195.08}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_02_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.615,"y":327.878,"z":210.396}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_02_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.297,"y":327.092,"z":186.313}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_02_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.303,"y":330.932,"z":195.085}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_03_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.885,"y":327.641,"z":210.396}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_03_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.607,"y":327.344,"z":186.313}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_03_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.525,"y":330.851,"z":195.085}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_04_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.527,"y":327.89,"z":210.396}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_04_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.642,"y":326.497,"z":186.313}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_04_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.503,"y":331.318,"z":195.085}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_05_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.289,"y":328.086,"z":210.396}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_05_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.692,"y":326.762,"z":186.313}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_05_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.094,"y":330.976,"z":195.085}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_06_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.263,"y":328.104,"z":210.396}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_06_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.655,"y":326.611,"z":186.313}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_06_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.3,"y":331.414,"z":195.085}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_07_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.956,"y":328.257,"z":210.396}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_07_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.545,"y":326.659,"z":186.313}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_07_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.087,"y":331.429,"z":195.123}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_08_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.187,"y":328.47,"z":210.396}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_08_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.658,"y":326.563,"z":186.313}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_08_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.287,"y":331.084,"z":195.086}', 1300000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(37, 'IntegrityWay', '4 Integrity Way', '{"x":-47.804,"y":-585.867,"z":36.956}', NULL, NULL, '{"x":-54.178,"y":-583.762,"z":35.798}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{"x":-31.409,"y":-594.927,"z":79.03}', '{"x":-26.098,"y":-596.909,"z":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-11.923,"y":-597.083,"z":78.43}', 1700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{"x":-17.702,"y":-588.524,"z":89.114}', '{"x":-16.21,"y":-582.569,"z":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-26.327,"y":-588.384,"z":89.123}', 1700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(40, 'DellPerroHeights', 'Dell Perro Heights', '{"x":-1447.06,"y":-538.28,"z":33.74}', NULL, NULL, '{"x":-1440.022,"y":-548.696,"z":33.74}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{"x":-1452.125,"y":-540.591,"z":73.044}', '{"x":-1455.435,"y":-535.79,"z":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1467.058,"y":-527.571,"z":72.443}', 1700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{"x":-1451.562,"y":-523.535,"z":55.928}', '{"x":-1456.02,"y":-519.209,"z":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1457.026,"y":-530.219,"z":55.937}', 1700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(43, 'MazeBankBuilding', 'Maze Bank Building', '{"x":-79.18,"y":-795.92,"z":43.35}', NULL, NULL, '{"x":-72.50,"y":-786.92,"z":43.40}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(47, 'ExecutiveRich', 'Executive Rich', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(48, 'ExecutiveCool', 'Executive Cool', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(53, 'LomBank', 'Lom Bank', '{"x":-1581.36,"y":-558.23,"z":34.07}', NULL, NULL, '{"x":-1583.60,"y":-555.12,"z":34.07}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(63, 'MazeBankWest', 'Maze Bank West', '{"x":-1379.58,"y":-499.63,"z":32.22}', NULL, NULL, '{"x":-1378.95,"y":-502.82,"z":32.22}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.rented_vehicles: ~0 rows (ungefär)
DELETE FROM `rented_vehicles`;
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.society_moneywash: ~0 rows (ungefär)
DELETE FROM `society_moneywash`;
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(40) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `last_property` varchar(255) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT '',
  `lastname` varchar(50) DEFAULT '',
  `dateofbirth` varchar(25) DEFAULT '',
  `sex` varchar(10) DEFAULT '',
  `height` varchar(5) DEFAULT '',
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `skin` longtext DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.users: ~1 rows (ungefär)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.user_licenses: ~0 rows (ungefär)
DELETE FROM `user_licenses`;
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.vehicles: ~240 rows (ungefär)
DELETE FROM `vehicles`;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Akuma', 'AKUMA', 7500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Alpha', 'alpha', 60000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Ardent', 'ardent', 1150000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Asea', 'asea', 5500, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Autarch', 'autarch', 1955000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Avarus', 'avarus', 18000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bagger', 'bagger', 13500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Baller', 'baller2', 40000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Baller Sport', 'baller3', 60000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Banshee', 'banshee', 70000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Banshee 900R', 'banshee2', 255000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bati 801', 'bati', 12000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bati 801RR', 'bati2', 19000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bestia GTS', 'bestiagts', 55000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('BF400', 'bf400', 6500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bf Injection', 'bfinjection', 16000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bifta', 'bifta', 12000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bison', 'bison', 45000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Blade', 'blade', 15000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Blazer', 'blazer', 6500, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Blazer Sport', 'blazer4', 8500, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('blazer5', 'blazer5', 1755600, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Blista', 'blista', 8000, 'compacts');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('BMX (velo)', 'bmx', 160, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bobcat XL', 'bobcatxl', 32000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Brawler', 'brawler', 45000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Brioso R/A', 'brioso', 18000, 'compacts');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Btype', 'btype', 62000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Btype Luxe', 'btype3', 85000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Buccaneer', 'buccaneer', 18000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Buffalo', 'buffalo', 12000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Buffalo S', 'buffalo2', 20000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bullet', 'bullet', 90000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Burrito', 'burrito3', 19000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Camper', 'camper', 42000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Carbonizzare', 'carbonizzare', 75000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Carbon RS', 'carbonrs', 18000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Casco', 'casco', 30000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cavalcade', 'cavalcade2', 55000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cheetah', 'cheetah', 375000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Chimera', 'chimera', 38000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Chino', 'chino', 15000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Chino Luxe', 'chino2', 19000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cognoscenti', 'cognoscenti', 55000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Comet', 'comet2', 65000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Comet 5', 'comet5', 1145000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Contender', 'contender', 70000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Coquette', 'coquette', 65000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Coquette BlackFin', 'coquette3', 55000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cyclone', 'cyclone', 1890000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Daemon', 'daemon', 11500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Daemon High', 'daemon2', 13500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Defiler', 'defiler', 9800, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Deluxo', 'deluxo', 4721500, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Dominator', 'dominator', 35000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Double T', 'double', 28000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Dubsta', 'dubsta', 45000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Dukes', 'dukes', 28000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Dune Buggy', 'dune', 8000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Elegy', 'elegy2', 38500, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Emperor', 'emperor', 8500, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Enduro', 'enduro', 5500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Entity XF', 'entityxf', 425000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Esskey', 'esskey', 4200, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Exemplar', 'exemplar', 32000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('F620', 'f620', 40000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Faction', 'faction', 20000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Faction Rider', 'faction2', 30000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Faction XL', 'faction3', 40000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Faggio', 'faggio', 1900, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Vespa', 'faggio2', 2800, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Felon', 'felon', 42000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Felon GT', 'felon2', 55000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Feltzer', 'feltzer2', 55000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Fixter (velo)', 'fixter', 225, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('FMJ', 'fmj', 185000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Fhantom', 'fq2', 17000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Fugitive', 'fugitive', 12000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Furore GT', 'furoregt', 45000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Fusilade', 'fusilade', 40000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Gargoyle', 'gargoyle', 16500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Gauntlet', 'gauntlet', 30000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Gang Burrito', 'gburrito', 45000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Burrito', 'gburrito2', 29000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Glendale', 'glendale', 6500, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Grabger', 'granger', 50000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Gresley', 'gresley', 47500, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('GT 500', 'gt500', 785000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Guardian', 'guardian', 45000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Hakuchou', 'hakuchou', 31000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Hermes', 'hermes', 535000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Hexer', 'hexer', 12000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Hotknife', 'hotknife', 125000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Huntley S', 'huntley', 40000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Hustler', 'hustler', 625000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Infernus', 'infernus', 180000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Innovation', 'innovation', 23500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Intruder', 'intruder', 7500, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Issi', 'issi2', 10000, 'compacts');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Jackal', 'jackal', 38000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Jester', 'jester', 65000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Jester(Racecar)', 'jester2', 135000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Journey', 'journey', 6500, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Kamacho', 'kamacho', 345000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Khamelion', 'khamelion', 38000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Kuruma', 'kuruma', 30000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Landstalker', 'landstalker', 35000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('RE-7B', 'le7b', 325000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Lynx', 'lynx', 40000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Mamba', 'mamba', 70000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Manana', 'manana', 12800, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Manchez', 'manchez', 5300, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Massacro', 'massacro', 65000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Massacro(Racecar)', 'massacro2', 130000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Mesa', 'mesa', 16000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Mesa Trail', 'mesa3', 40000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Minivan', 'minivan', 13000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Monroe', 'monroe', 55000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('The Liberator', 'monster', 210000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Moonbeam', 'moonbeam', 18000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Nemesis', 'nemesis', 5800, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Neon', 'neon', 1500000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Nightblade', 'nightblade', 35000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Nightshade', 'nightshade', 65000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('9F', 'ninef', 65000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('9F Cabrio', 'ninef2', 80000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Omnis', 'omnis', 35000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Oppressor', 'oppressor', 3524500, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Oracle XS', 'oracle2', 35000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Osiris', 'osiris', 160000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Panto', 'panto', 10000, 'compacts');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Paradise', 'paradise', 19000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Pariah', 'pariah', 1420000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Patriot', 'patriot', 55000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('PCJ-600', 'pcj', 6200, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Penumbra', 'penumbra', 28000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Pfister', 'pfister811', 85000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Phoenix', 'phoenix', 12500, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Picador', 'picador', 18000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Pigalle', 'pigalle', 20000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Prairie', 'prairie', 12000, 'compacts');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Premier', 'premier', 8000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Primo Custom', 'primo2', 14000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('X80 Proto', 'prototipo', 2500000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Radius', 'radi', 29000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('raiden', 'raiden', 1375000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rapid GT', 'rapidgt', 35000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Reaper', 'reaper', 150000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rebel', 'rebel2', 35000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Regina', 'regina', 5000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Retinue', 'retinue', 615000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Revolter', 'revolter', 1610000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('riata', 'riata', 380000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rocoto', 'rocoto', 45000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Ruffian', 'ruffian', 6800, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Ruiner 2', 'ruiner2', 5745600, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rumpo', 'rumpo', 15000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rumpo Trail', 'rumpo3', 19500, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sabre Turbo', 'sabregt', 20000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sabre GT', 'sabregt2', 25000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sanchez', 'sanchez', 5300, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sanctus', 'sanctus', 25000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sandking', 'sandking', 55000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Savestra', 'savestra', 990000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('SC 1', 'sc1', 1603000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Schafter', 'schafter2', 25000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Schafter V12', 'schafter3', 50000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Seminole', 'seminole', 25000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sentinel', 'sentinel', 32000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sentinel XS', 'sentinel2', 40000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sentinel3', 'sentinel3', 650000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Seven 70', 'seven70', 39500, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('ETR1', 'sheava', 220000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Slam Van', 'slamvan3', 11500, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sovereign', 'sovereign', 22000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Stinger', 'stinger', 80000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Stinger GT', 'stingergt', 75000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Streiter', 'streiter', 500000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Stretch', 'stretch', 90000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Stromberg', 'stromberg', 3185350, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sultan', 'sultan', 15000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sultan RS', 'sultanrs', 65000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Super Diamond', 'superd', 130000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Surano', 'surano', 50000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Surfer', 'surfer', 12000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('T20', 't20', 300000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Tailgater', 'tailgater', 30000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Tampa', 'tampa', 16000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Drift Tampa', 'tampa2', 80000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Thrust', 'thrust', 24000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Trophy Truck', 'trophytruck', 60000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Tropos', 'tropos', 40000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Turismo R', 'turismor', 350000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Tyrus', 'tyrus', 600000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Vacca', 'vacca', 120000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Vader', 'vader', 7200, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Verlierer', 'verlierer2', 70000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Vigero', 'vigero', 12500, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Virgo', 'virgo', 14000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Viseris', 'viseris', 875000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Visione', 'visione', 2250000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Voltic', 'voltic', 90000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Voltic 2', 'voltic2', 3830400, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Voodoo', 'voodoo', 7200, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Vortex', 'vortex', 9800, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Warrener', 'warrener', 4000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Washington', 'washington', 9000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Windsor', 'windsor', 95000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Windsor Drop', 'windsor2', 125000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('XLS', 'xls', 32000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Yosemite', 'yosemite', 485000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Youga', 'youga', 10800, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Youga Luxuary', 'youga2', 14500, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Z190', 'z190', 900000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Zentorno', 'zentorno', 1500000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Zion', 'zion', 36000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Zion Cabrio', 'zion2', 45000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Zombie', 'zombiea', 9500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Z-Type', 'ztype', 220000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.vehicle_categories: ~11 rows (ungefär)
DELETE FROM `vehicle_categories`;
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('coupes', 'Coupés');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('motorcycles', 'Motos');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('muscle', 'Muscle');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('offroad', 'Off Road');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('sedans', 'Sedans');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('sports', 'Sports');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('sportsclassics', 'Sports Classics');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('super', 'Super');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('suvs', 'SUVs');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('vans', 'Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumpar struktur för tabell oph3znew.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell oph3znew.vehicle_sold: ~0 rows (ungefär)
DELETE FROM `vehicle_sold`;
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
