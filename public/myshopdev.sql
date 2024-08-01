-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 01 août 2024 à 09:47
-- Version du serveur : 5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `myshopdev`
--

-- --------------------------------------------------------

--
-- Structure de la table `add_product_history`
--

CREATE TABLE `add_product_history` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qte` int(11) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `add_product_history`
--

INSERT INTO `add_product_history` (`id`, `product_id`, `qte`, `created_at`) VALUES
(1, 1, 1, '2024-08-01 08:09:32'),
(2, 3, 1, '2024-08-01 08:12:02'),
(3, 4, 6, '2024-08-01 08:12:54'),
(4, 5, 3, '2024-08-01 08:13:22'),
(5, 6, 7, '2024-08-01 08:13:44'),
(6, 7, 3, '2024-08-01 08:15:16'),
(7, 8, 4, '2024-08-01 08:15:37'),
(8, 9, 2, '2024-08-01 08:16:01'),
(9, 10, 19, '2024-08-01 08:16:36'),
(10, 11, 27, '2024-08-01 08:16:56'),
(11, 12, 7, '2024-08-01 08:17:31'),
(12, 13, 5, '2024-08-01 08:18:21'),
(13, 14, 2, '2024-08-01 08:18:44'),
(14, 15, 15, '2024-08-01 08:19:04'),
(15, 16, 3, '2024-08-01 08:19:29'),
(16, 17, 6, '2024-08-01 08:20:07'),
(17, 18, 9, '2024-08-01 08:20:28'),
(18, 19, 5, '2024-08-01 08:20:47'),
(19, 20, 8, '2024-08-01 08:21:10'),
(20, 21, 4, '2024-08-01 08:21:43'),
(21, 22, 2, '2024-08-01 08:23:14'),
(22, 23, 5, '2024-08-01 08:23:42'),
(23, 24, 2, '2024-08-01 08:24:06'),
(24, 25, 12, '2024-08-01 08:24:27'),
(25, 26, 2, '2024-08-01 08:24:47'),
(26, 27, 2, '2024-08-01 08:25:15'),
(27, 28, 3, '2024-08-01 08:25:35'),
(28, 29, 10, '2024-08-01 08:25:56'),
(29, 30, 4, '2024-08-01 08:26:16'),
(30, 31, 10, '2024-08-01 08:26:34'),
(31, 32, 12, '2024-08-01 08:27:00'),
(32, 33, 5, '2024-08-01 08:27:34'),
(33, 34, 2, '2024-08-01 08:27:54'),
(34, 35, 6, '2024-08-01 08:28:14'),
(35, 36, 7, '2024-08-01 08:28:37'),
(36, 37, 2, '2024-08-01 08:29:15'),
(37, 38, 2, '2024-08-01 08:30:46'),
(38, 39, 7, '2024-08-01 08:31:09'),
(39, 40, 3, '2024-08-01 08:31:57'),
(40, 41, 5, '2024-08-01 08:32:24'),
(41, 42, 3, '2024-08-01 08:33:06'),
(42, 43, 3, '2024-08-01 08:33:36'),
(43, 44, 4, '2024-08-01 08:33:56'),
(44, 45, 2, '2024-08-01 08:34:17'),
(45, 46, 4, '2024-08-01 08:34:42'),
(46, 47, 12, '2024-08-01 08:35:08'),
(47, 48, 2, '2024-08-01 08:35:56'),
(48, 49, 2, '2024-08-01 08:36:23'),
(49, 50, 4, '2024-08-01 08:36:47'),
(50, 51, 2, '2024-08-01 08:37:13'),
(51, 52, 2, '2024-08-01 08:37:41');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240801080025', '2024-08-01 08:00:49', 864),
('DoctrineMigrations\\Version20240801081113', '2024-08-01 08:11:20', 27),
('DoctrineMigrations\\Version20240801090959', '2024-08-01 09:10:04', 121);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_products`
--

CREATE TABLE `order_products` (
  `id` int(11) NOT NULL,
  `_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL,
  `size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_size` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `highlighted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `size`, `user_size`, `image`, `stock`, `highlighted`) VALUES
(1, 'Blackbelt', NULL, 29.9, 'XS', NULL, '1-66ab53d56afb6.jpg', 1, 1),
(3, 'Blackbelt', NULL, 29.9, 'S', NULL, '1-66ab435294ae7.jpg', 1, NULL),
(4, 'Blackbelt', NULL, 29.9, 'M', NULL, '1-66ab4385cea09.jpg', 6, NULL),
(5, 'Blackbelt', NULL, 29.9, 'L', NULL, '1-66ab43a210651.jpg', 3, NULL),
(6, 'Blackbelt', NULL, 29.9, 'XL', NULL, '1-66ab43b8cb719.jpg', 7, NULL),
(7, 'BlueBelt', NULL, 29.9, 'XS', NULL, '2-66ab4414073cc.jpg', 3, NULL),
(8, 'BlueBelt', NULL, 29.9, 'S', NULL, '2-66ab4429ec78c.jpg', 4, NULL),
(9, 'BlueBelt', NULL, 29.9, 'M', NULL, '2-66ab4440ef438.jpg', 2, NULL),
(10, 'BlueBelt', NULL, 29.9, 'L', NULL, '2-66ab4464a20e8.jpg', 19, NULL),
(11, 'BlueBelt', NULL, 29.9, 'XL', NULL, '2-66ab447897519.jpg', 27, NULL),
(12, 'Street', NULL, 34.5, 'XS', NULL, '3-66ab44b997ec7.jpg', 7, NULL),
(13, 'Street', NULL, 34.5, 'S', NULL, '3-66ab44cda14a4.jpg', 5, NULL),
(14, 'Street', NULL, 34.5, 'M', NULL, '3-66ab5170ef306.jpg', 2, 1),
(15, 'Street', NULL, 34.5, 'L', NULL, '3-66ab44f8ebbe7.jpg', 15, NULL),
(16, 'Street', NULL, 34.5, 'XL', NULL, '3-66ab45113c47f.jpg', 3, NULL),
(17, 'Pokeball', NULL, 45, 'XS', NULL, '4-66ab45374f3d4.jpg', 6, NULL),
(18, 'Pokeball', NULL, 45, 'S', NULL, '4-66ab45afc4566.jpg', 9, NULL),
(19, 'Pokeball', NULL, 45, 'M', NULL, '4-66ab45be0e135.jpg', 5, NULL),
(20, 'Pokeball', NULL, 45, 'L', NULL, '4-66ab45ccbb99b.jpg', 8, NULL),
(21, 'Pokeball', NULL, 45, 'XL', NULL, '4-66ab459742cd4.jpg', 4, NULL),
(22, 'PinkLady', NULL, 29.9, 'XS', NULL, '5-66ab45f25a0a5.jpg', 2, NULL),
(23, 'PinkLady', NULL, 29.9, 'S', NULL, '5-66ab460ed66e7.jpg', 5, NULL),
(24, 'PinkLady', NULL, 29.9, 'M', NULL, '5-66ab462609f81.jpg', 2, NULL),
(25, 'PinkLady', NULL, 29.9, 'L', NULL, '5-66ab463b52e8e.jpg', 12, NULL),
(26, 'PinkLady', NULL, 29.9, 'XL', NULL, '5-66ab53f845112.jpg', 2, 1),
(27, 'Snow', NULL, 32, 'XS', NULL, '6-66ab466ba301c.jpg', 2, NULL),
(28, 'Snow', NULL, 32, 'S', NULL, '6-66ab467f5a0d0.jpg', 3, NULL),
(29, 'Snow', NULL, 32, 'M', NULL, '6-66ab4694302ae.jpg', 10, NULL),
(30, 'Snow', NULL, 32, 'M', NULL, '6-66ab46a8441d6.jpg', 4, NULL),
(31, 'Snow', NULL, 32, 'L', NULL, '6-66ab46ba7f16b.jpg', 10, NULL),
(32, 'Snow', NULL, 32, 'XL', NULL, '6-66ab46d474941.jpg', 12, NULL),
(33, 'Greyback', NULL, 28.5, 'XS', NULL, '7-66ab46f608fed.jpg', 5, NULL),
(34, 'Greyback', NULL, 28.5, 'S', NULL, '7-66ab470a0ffe4.jpg', 2, NULL),
(35, 'Greyback', NULL, 28.5, 'M', NULL, '7-66ab471e51d39.jpg', 6, NULL),
(36, 'Greyback', NULL, 28.5, 'L', NULL, '7-66ab473523960.jpg', 7, NULL),
(37, 'Greyback', NULL, 28.5, 'XL', NULL, '7-66ab475b56f78.jpg', 2, NULL),
(38, 'BlueCloud', NULL, 45, 'XS', NULL, '8-66ab47b6df350.jpg', 2, NULL),
(39, 'BlueCloud', NULL, 45, 'S', NULL, '8-66ab47e4945e0.jpg', 7, NULL),
(40, 'BlueCloud', NULL, 45, 'M', NULL, '8-66ab47fd185af.jpg', 3, NULL),
(41, 'BlueCloud', NULL, 45, 'L', NULL, '8-66ab482ba5fbc.jpg', 5, NULL),
(42, 'BlueCloud', NULL, 45, 'XL', NULL, '8-66ab4842950f0.jpg', 3, NULL),
(43, 'BornInUsa', NULL, 59.9, 'XS', NULL, '9-66ab48600d1da.jpg', 3, NULL),
(44, 'BornInUsa', NULL, 59.9, 'S', NULL, '9-66ab4a7c56d99.jpg', 4, NULL),
(45, 'BornInUsa', NULL, 59.9, 'M', NULL, '9-66ab488958dba.jpg', 2, NULL),
(46, 'BornInUsa', NULL, 59.9, 'L', NULL, '9-66ab48cf8cb48.jpg', 4, NULL),
(47, 'BornInUsa', NULL, 59.9, 'XL', NULL, '9-66ab48bc178c7.jpg', 12, NULL),
(48, 'GreenSchool', NULL, 42.2, 'XS', NULL, '10-66ab48ecd97f2.jpg', 2, NULL),
(49, 'GreenSchool', NULL, 42.2, 'S', NULL, '10-66ab4907d4558.jpg', 2, NULL),
(50, 'GreenSchool', NULL, 42.2, 'M', NULL, '10-66ab491f3f6b5.jpg', 4, NULL),
(51, 'GreenSchool', NULL, 42.2, 'L', NULL, '10-66ab49390a767.jpg', 2, NULL),
(52, 'GreenSchool', NULL, 42.2, 'XL', NULL, '10-66ab495582a20.jpg', 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `product_sub_category`
--

CREATE TABLE `product_sub_category` (
  `product_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `delivery_adress`, `last_name`) VALUES
(1, 'hh@gmail.com', '[\"ROLE_ADMIN\", \"ROLE_EDITOR\", \"ROLE_USER\"]', '$2y$13$woOl8ROJjSz7Y8n20eLJJuGPRtZR6/VtlDPzkx2ytpQX8iyeZX1eu', '29 Rue du test', 'Hans');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `add_product_history`
--
ALTER TABLE `add_product_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_EDEB7BDE4584665A` (`product_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_64C19C15E237E06` (`name`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5242B8EBA35F2858` (`_order_id`),
  ADD KEY `IDX_5242B8EB4584665A` (`product_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  ADD PRIMARY KEY (`product_id`,`sub_category_id`),
  ADD KEY `IDX_3147D5F34584665A` (`product_id`),
  ADD KEY `IDX_3147D5F3F7BFE87C` (`sub_category_id`);

--
-- Index pour la table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BCE3F79812469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `add_product_history`
--
ALTER TABLE `add_product_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `add_product_history`
--
ALTER TABLE `add_product_history`
  ADD CONSTRAINT `FK_EDEB7BDE4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `FK_5242B8EB4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_5242B8EBA35F2858` FOREIGN KEY (`_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  ADD CONSTRAINT `FK_3147D5F34584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3147D5F3F7BFE87C` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `FK_BCE3F79812469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
