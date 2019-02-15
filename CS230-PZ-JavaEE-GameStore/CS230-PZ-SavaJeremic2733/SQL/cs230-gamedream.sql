-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2018 at 04:29 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs230-gamedream`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartId` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartId`, `user_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cartItemsId` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `flag_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cartItemsId`, `game_id`, `cart_id`, `flag_id`) VALUES
(17, 2, 1, 0),
(18, 4, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `companyId` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyId`, `name`) VALUES
(1, 'CD Projekt Red'),
(2, 'Bethesda Game Studios'),
(3, 'Ubisoft'),
(4, 'Electronic Arts'),
(5, 'Activision'),
(6, 'Blizard'),
(7, 'Valve'),
(8, 'Capcom'),
(9, 'Blizzard Entertainment'),
(10, 'Nintendo'),
(11, 'Rockstar North'),
(12, 'Konami'),
(13, 'BioWare'),
(14, 'LucasArts'),
(15, 'Naughty Dog'),
(16, 'New World Computing, Inc.'),
(17, 'Telltale Games'),
(18, 'Nival Interactive'),
(19, 'Shining Rock Software'),
(20, 'id Software'),
(21, 'DynamicPixels');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `gameId` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `size` varchar(30) DEFAULT NULL,
  `price` int(30) NOT NULL,
  `genreId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `languageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`gameId`, `name`, `description`, `cover`, `release_date`, `size`, `price`, `genreId`, `companyId`, `languageId`) VALUES
(1, 'The Witcher 3: Wild Hunt - Game of the Year Edition', 'Become a professional monster slayer and embark on an adventure of epic proportions! Upon its release, The Witcher 3: Wild Hunt ', 'https://steamcdn-a.akamaihd.net/steam/apps/292030/header.jpg?t=1528464393', '2017-08-30', '40.0 GB', 44, 4, 1, 1),
(2, 'The Elder Scrolls V: Skyrim Special Edition', 'Winner of more than 200 Game of the Year Awards, Skyrim Special Edition brings the epic fantasy to life in stunning detail. The ', 'http://cdn.akamai.steamstatic.com/steam/apps/489830/header.jpg?t=1481040018', '2016-10-28', '12.0 GB', 27, 4, 2, 1),
(3, 'Heroes of Might and Magic® VII', 'The realms of Might and Magic are expanding. New lands have been discovered and you must rise to the challenge of conquering the', 'https://steamcdn-a.akamaihd.net/steam/apps/321960/header.jpg?t=1527102679', '1996-05-06', '353.6 MB', 4, 9, 3, 1),
(4, 'Divinity: Original Sin 2', 'The eagerly anticipated sequel to the award-winning RPG. Gather your party. Master deep, tactical combat. Join up to 3 other players - but know that only one of you will have the chance to become a God.', 'https://steamcdn-a.akamaihd.net/steam/apps/435150/header.jpg?t=1526471534', '2017-09-17', '356 MB', 4, 9, 3, 1),
(5, 'Heroes of Might and Magic® III Complete', 'Murder, treachery, resurrection, savage battles and ultimately-freedom!\r\nWhen Erathia''s King Gryphonheart is murdered by traitors he is resurrected as an undead warlord who leads a ruthless invasion of his former Kingdom.', 'https://steamcdn-a.akamaihd.net/steam/apps/297000/header.jpg?t=1508407197', '1999-06-01', '0.9 GB', 6, 9, 3, 1),
(6, 'Heroes of Might and Magic® VI: Complete', 'Heroes VI is a fast-paced epic story where Angels plot to end -- once and for all -- an unfinished war with their ancient rivals, the Faceless.', 'https://steamcdn-a.akamaihd.net/steam/apps/48220/header.jpg?t=1452181921', '2013-10-14', '0.9 GB', 5, 9, 3, 1),
(7, 'Heroes of Might and Magic® V Bundle', 'Heroes of Might and Magic® 5 is a turn-based strategy game in which you can build cities and besiege them, train troops and slaughter them, and explore new lands – and crush them under your iron heel.', 'https://steamcdn-a.akamaihd.net/steam/apps/15170/header.jpg?t=1526892878', '2006-05-19', '4.2 GB', 10, 9, 3, 1),
(8, 'The Walking Dead: Season 1', 'The Walking Dead is a five-part game series set in the same universe as Robert Kirkman’s award-winning comic book series. Play as Lee Everett, a convicted criminal, who has been given a second chance at life in a world devastated by the undead.', 'https://steamcdn-a.akamaihd.net/steam/apps/207610/header.jpg?t=1456281215', '2012-04-24', '3.4 GB', 22, 2, 17, 1),
(9, 'Banished', 'Banished is a city building game where you control a group of exiled people who are restarting their lives in the wilderness. They have only the clothes on their backs and a cart filled with supplies from their homeland. The townspeople work, build, get o', 'https://steamcdn-a.akamaihd.net/steam/apps/242920/header.jpg?t=1447358097', '2014-02-18', '173.5 MB', 18, 6, 4, 1),
(10, 'Ultimate DOOM', 'In the future, humans have left Earth and settled throughout the galaxy. On Mars, the Union Aerospace Corporation has established a radioactive waste facility and allowed the military to conduct teleportation experiments on the nearby moons of Deimos and ', 'https://steamcdn-a.akamaihd.net/steam/apps/2280/header.jpg?t=1447351097', '1995-04-30', '50MB', 5, 5, 13, 1),
(11, 'Cuphead', 'Cuphead is a classic run and gun action game heavily focused on boss battles. Inspired by cartoons of the 1930s', 'https://steamcdn-a.akamaihd.net/steam/apps/268910/header.jpg?t=1524764269', '2017-09-07', '575 MB', 9, 9, 5, 1),
(12, 'Rocket League®', 'Soccer meets driving once again in the long-awaited, physics-based multiplayer-focused sequel to Supersonic Acrobatic Rocket-Powered Battle-Cars! Choose a variety of high-flying vehicles equipped with huge rocket boosters to score amazing aerial goals and', 'https://steamcdn-a.akamaihd.net/steam/apps/252950/header.jpg?t=1527636858', '2015-07-07', '5 GB', 20, 8, 11, 1),
(13, 'Witcher 2: Assassins Of Kings, The - Enhanced Edition', 'The second installment in the RPG saga about the Witcher, Geralt of Rivia. A new, modern game engine, responsible both for beautiful visuals and sophisticated game mechanics puts players in the most lively and believable world ever created in an RPG game.', 'https://steamcdn-a.akamaihd.net/steam/apps/20920/header.jpg?t=1509077093', '2012-04-17', '15.2 GB', 18, 4, 1, 1),
(14, 'The Witcher: Enhanced Edition', 'Your name is Geralt of Rivia and you are a witcher, that means you kill monsters for a living. You were given special training to be the best at what you do and your body has been enhanced with potent elixirs to help you do it.', 'https://steamcdn-a.akamaihd.net/steam/apps/20900/header.jpg?t=1449498563', '2007-10-26', '8.5 GB', 8, 4, 1, 1),
(15, 'GWENT: The Witcher Card Game', 'Join in The Witcher universe’s favorite card game! In GWENT, you clash with your friends in fast-paced duels that combine bluffing, on-the-fly decision making and careful deck construction.', 'https://images-2.gog.com/e8e4fa69db4d06ff58b7ef8bda2ea72e966f419baf2e248807520cda6244b7d8_196.jpg', '2018-06-14', '4.5', 0, 9, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genreId` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genreId`, `name`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Indie'),
(4, 'RPG'),
(5, 'Shooters'),
(6, 'Simulation'),
(7, 'Sports'),
(8, 'Racing'),
(9, 'Strategy'),
(10, 'Fantasy'),
(11, 'Turn-based'),
(12, 'Point-and-click'),
(13, 'Horror'),
(14, 'Historical'),
(15, 'Real-Time'),
(16, 'Sci-fi');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `languageId` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`languageId`, `name`) VALUES
(1, 'English'),
(2, 'German'),
(3, 'Spanish'),
(4, 'Italian'),
(5, 'Bulgarian'),
(6, 'Turkish'),
(7, 'Chinese'),
(8, 'Japanese'),
(9, 'Deutsch'),
(10, 'French');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `username`, `password`, `email`, `name`, `surname`, `avatar`) VALUES
(1, 'sava96', 'sava96', 'sava@gmail.com', 'Sava', 'Jeremic', 'avatar'),
(2, 'admin', 'admin', 'admin@admin.com', 'admin', 'admin', 'admin'),
(3, 'test', 'test', 'test@test.com', 'test', 'test', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartId`),
  ADD UNIQUE KEY `cart_id` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cartItemsId`),
  ADD KEY `game_id` (`game_id`,`cart_id`),
  ADD KEY `flag_id` (`flag_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`companyId`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`gameId`),
  ADD KEY `genreId` (`genreId`,`companyId`,`languageId`),
  ADD KEY `companyId` (`companyId`),
  ADD KEY `languageId` (`languageId`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genreId`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`languageId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cartItemsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `companyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `gameId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genreId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `languageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`userId`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`gameId`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cartId`);

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`genreId`) REFERENCES `genre` (`genreId`),
  ADD CONSTRAINT `game_ibfk_2` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`),
  ADD CONSTRAINT `game_ibfk_3` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
