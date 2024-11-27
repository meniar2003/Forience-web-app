-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 28 avr. 2024 à 21:33
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`) VALUES
(18, 'Mobile', 'This is mobile cat&eacute;gorie'),
(19, 'Langue', 'Parler et communiquer'),
(20, 'Windows', 'M&eacute;triser les logiciels');

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_id` int(11) UNSIGNED DEFAULT NULL,
  `author_id` int(11) UNSIGNED NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `status` enum('accepted','pending','rejected') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `thumbnail`, `date_time`, `category_id`, `author_id`, `is_featured`, `status`) VALUES
(49, 'Formation AndroidStudio', '1. Ma&icirc;trise des fondamentaux d&#039;Android Studio : cr&eacute;ation de projets, utilisation de l&#039;IDE, gestion des ressources.\r\n2. Compr&eacute;hension du d&eacute;veloppement d&#039;applications Android : activit&eacute;s, fragments, vues, gestion des &eacute;v&eacute;nements.\r\n3. Capacit&eacute; &agrave; int&eacute;grer des fonctionnalit&eacute;s avanc&eacute;es : navigation, base de donn&eacute;es, services, API externes, et d&eacute;ploiement sur le Google Play Store.', '17143152961.jpg', '2024-04-28 14:03:17', 18, 31, 0, 'accepted'),
(50, 'FORMATION JAVA', '1. Ma&icirc;trise des concepts de base de Java : syntaxe, structures de contr&ocirc;le, types de donn&eacute;es.\r\n2. Compr&eacute;hension de la programmation orient&eacute;e objet (POO) et son application en Java.\r\n3. Capacit&eacute; &agrave; d&eacute;velopper des applications Java, &agrave; travailler avec des structures de donn&eacute;es, des exceptions, des interfaces graphiques, et &agrave; utiliser des frameworks populaires comme Spring ou Android pour le d&eacute;veloppement web ou mobile.', '17143151992.jpg', '2024-04-28 14:06:04', 20, 31, 0, 'accepted'),
(51, 'Formation Langage C', '1. Ma&icirc;trise des bases du langage C : syntaxe, variables, op&eacute;rateurs, boucles, fonctions.\r\n2. Compr&eacute;hension des concepts avanc&eacute;s : pointeurs, allocation dynamique de m&eacute;moire, structures et unions.\r\n3. Capacit&eacute; &agrave; d&eacute;velopper des programmes C pour r&eacute;soudre des probl&egrave;mes complexes, &agrave; travailler avec des fichiers, et &agrave; &eacute;crire des programmes efficaces et optimis&eacute;s.', '17143154394.jpg', '2024-04-28 14:43:59', 20, 33, 0, 'accepted'),
(52, 'Formation en Fran&ccedil;ais', '1. Ma&icirc;trise des r&egrave;gles grammaticales fondamentales du fran&ccedil;ais : conjugaison, accords, syntaxe.\r\n2. Compr&eacute;hension des structures de phrases et du vocabulaire courant.\r\n3. Capacit&eacute; &agrave; communiquer efficacement &agrave; l&#039;&eacute;crit et &agrave; l&#039;oral, &agrave; comprendre des textes vari&eacute;s et &agrave; s&#039;exprimer de mani&egrave;re claire et coh&eacute;rente.', '17143155605.jpeg', '2024-04-28 14:46:00', 19, 34, 0, 'accepted'),
(53, 'Formation d&#039;Anglais', '1. Ma&icirc;trise des bases de la grammaire anglaise : temps verbaux, structure des phrases, usage des pronoms.\r\n2. Compr&eacute;hension du vocabulaire courant et des expressions idiomatiques.\r\n3. Capacit&eacute; &agrave; communiquer efficacement &agrave; l&#039;&eacute;crit et &agrave; l&#039;oral, &agrave; comprendre des textes vari&eacute;s et &agrave; converser dans des situations courantes et professionnelles.', '17143157457.png', '2024-04-28 14:49:05', 18, 35, 0, 'accepted'),
(54, 'Formation Python', '1. Acquisition des bases de Python : syntaxe, variables, structures de contr&ocirc;le.\r\n2. Compr&eacute;hension des concepts avanc&eacute;s : fonctions, listes, dictionnaires, compr&eacute;hensions de liste.\r\n3. Capacit&eacute; &agrave; d&eacute;velopper des applications Python, &agrave; manipuler des fichiers, &agrave; utiliser des biblioth&egrave;ques populaires comme NumPy et pandas pour l&#039;analyse de donn&eacute;es, et &agrave; cr&eacute;er des scripts pour l&#039;automatisation des t&acirc;ches.', '17143159248.png', '2024-04-28 14:52:04', 20, 36, 0, 'accepted'),
(55, 'Marketing', '1. Compr&eacute;hension des principes fondamentaux du marketing : segmentation, ciblage, positionnement.\r\n2. Ma&icirc;trise des strat&eacute;gies de marketing digital : SEO, SEM, marketing des m&eacute;dias sociaux.\r\n3. Capacit&eacute; &agrave; &eacute;laborer des plans marketing, &agrave; analyser les donn&eacute;es et &agrave; mettre en &oelig;uvre des campagnes efficaces pour atteindre les objectifs commerciaux.', '171431609210.jpeg', '2024-04-28 14:54:52', 18, 37, 0, 'accepted'),
(56, 'Formation d&#039;Anglais', '1. Acquisition des comp&eacute;tences linguistiques de base : grammaire, vocabulaire, prononciation.\r\n2. D&eacute;veloppement de la compr&eacute;hension de l&#039;anglais parl&eacute; et &eacute;crit &agrave; travers des exercices pratiques.\r\n3. Renforcement des comp&eacute;tences de communication &agrave; l&#039;oral et &agrave; l&#039;&eacute;crit, avec un accent particulier sur la fluidit&eacute; et la pr&eacute;cision.', '17143165517.png', '2024-04-28 15:02:31', 19, 38, 0, 'accepted'),
(57, 'Formation d&#039;Allmend', '1. Acquisition des bases de la langue allemande : grammaire, vocabulaire, prononciation.\r\n2. D&eacute;veloppement de la compr&eacute;hension de l&#039;allemand parl&eacute; et &eacute;crit &agrave; travers des exercices pratiques.\r\n3. Renforcement des comp&eacute;tences de communication &agrave; l&#039;oral et &agrave; l&#039;&eacute;crit, avec un accent particulier sur la conversation et la compr&eacute;hension.', '171431691911.jpeg', '2024-04-28 15:08:09', 18, 31, 1, 'accepted'),
(58, 'Informatique bureautique', '1. Ma&icirc;triser les outils informatiques essentiels : traitement de texte, tableur, pr&eacute;sentation.\r\n2. Acqu&eacute;rir des comp&eacute;tences pour augmenter la productivit&eacute; et l&#039;efficacit&eacute; au travail.\r\n3. Apprendre &agrave; g&eacute;rer les fichiers, assurer la s&eacute;curit&eacute; informatique et communiquer professionnellement via les outils bureautiques.', '171432754312.jpeg', '2024-04-28 18:05:43', 20, 32, 0, 'accepted');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `password`, `avatar`, `is_admin`) VALUES
(31, 'menyar', 'damergi', 'menyar', 'menyardamergi867@gmail.com', '$2y$10$S2hkZwZNg88pUbW/Nd0p4OVEI1QYTOuCkBFmzO092l8TMv7Wd.zMK', '1714312620img.jpg', 1),
(32, 'oumaima', 'oumaima', 'oumaima', 'oumaima@gmail.com', '$2y$10$jK9TNT0QOI15ujjBO23axeQSXIlgm4tVICzaAbwDFH59gMKs883jm', '1714314558img1.jpg', 0),
(33, 'amen', 'amen', 'Amen', 'amen@gmail.com', '$2y$10$6XaGy4ANcL0Fx3DTjtbb6ujZWhkKBp0rewy819hguP4zbpnmyM6.u', '1714314686img2.jpg', 0),
(34, 'ahmed', 'ahmed', 'Ahmed', 'ahmed@gmail.com', '$2y$10$cujiKuNibTejn9mrTyfssenHYW.Q6YzW1Ny1/6PEHa9zyaktGuMbK', '1714314765img4.jpg', 0),
(35, 'nesma', 'nesma', 'Nesma', 'nesma@gmail.com', '$2y$10$ZcuUXrlqLrdjCUY9q5rQ1eokhKomrZ9X1fKXWJDzVbNN2tVz6NOMq', '1714314821img3.jpg', 0),
(36, 'saida', 'saida', 'Saida', 'saida@gmail.com', '$2y$10$9R0OP0vziO9xegyecLwmUe/AgELrHPl7TkUNpMAzkb9qxtqNAbmXi', '1714314877img5.jpg', 0),
(37, 'zizou', 'zizou', 'Zizou', 'zizou@gmail.com', '$2y$10$2tS5Bzq/dSBT7WInuObDd.5kfxjLQRpV.v1MO5E1sE.8Ih3GMGRpe', '1714314935img6.jpg', 0),
(38, 'rahma', 'rahma', 'rahma', 'rahma@gmail.com', '$2y$10$WJQSoT41N3jUEW6J7jP5f.H8ana0vzINKfNU4U5tGKU1oge/YYnzW', '1714316428img7.jpg', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_blog_category` (`category_id`),
  ADD KEY `FK_blog_author` (`author_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK_blog_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_blog_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
