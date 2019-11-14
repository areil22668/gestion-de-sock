
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `zeepapco_stock`
--

-- --------------------------------------------------------

--
-- Structure de la table `achats`
--

CREATE TABLE `achats` (
  `id_achat` int(11) NOT NULL,
  `id_frs_achat` int(11) NOT NULL,
  `id_art_achat` int(11) NOT NULL,
  `qte_achat` double NOT NULL,
  `pu_achat` double NOT NULL,
  `visible_achat` int(11) NOT NULL DEFAULT 1,
  `create_achat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id_art` int(11) NOT NULL,
  `article_art` varchar(255) DEFAULT NULL,
  `ref_art` varchar(255) NOT NULL,
  `desi_art` text NOT NULL,
  `qte_min_art` double DEFAULT NULL,
  `pv_art` double DEFAULT NULL,
  `unite_art` varchar(255) NOT NULL DEFAULT 'Unite',
  `id_famill_art` int(11) NOT NULL,
  `visible_art` int(11) NOT NULL DEFAULT 1,
  `create_art` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id_art`, `article_art`, `ref_art`, `desi_art`, `qte_min_art`, `pv_art`, `unite_art`, `id_famill_art`, `visible_art`, `create_art`) VALUES
(1, 'Article 1', 'Ref 1', 'Desin 1', 99, 12, 'm', 1, 1, '2019-01-03 14:55:39'),
(2, 'Article 2', 'Ref 2', 'Desin 2', 100, 17, 'Kg', 1, 1, '2019-01-03 14:56:11');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id_clt` int(11) NOT NULL,
  `nom_clt` varchar(255) NOT NULL,
  `adress_clt` varchar(255) DEFAULT NULL,
  `tel_clt` varchar(255) NOT NULL,
  `visible_clt` int(11) NOT NULL DEFAULT 1,
  `create_clt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id_cmd` int(11) NOT NULL,
  `date_cmd` datetime NOT NULL,
  `etat_cmd` varchar(255) NOT NULL,
  `id_clt_cmd` int(11) NOT NULL,
  `visible_cmd` int(11) NOT NULL DEFAULT 1,
  `created_cmd` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `depots`
--

CREATE TABLE `depots` (
  `id_depot` int(11) NOT NULL,
  `depot` varchar(255) NOT NULL,
  `visible_depot` int(11) NOT NULL DEFAULT 1,
  `create_depot` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `depots`
--

INSERT INTO `depots` (`id_depot`, `depot`, `visible_depot`, `create_depot`) VALUES
(1, 'Depot 1', 1, '2019-01-03 14:54:19'),
(2, 'Dépot 2', 1, '2019-01-04 13:47:52');

-- --------------------------------------------------------

--
-- Structure de la table `famills`
--

CREATE TABLE `famills` (
  `id_famill` int(11) NOT NULL,
  `famill` varchar(255) NOT NULL,
  `visible_famill` int(11) NOT NULL DEFAULT 1,
  `create_famill` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `famills`
--

INSERT INTO `famills` (`id_famill`, `famill`, `visible_famill`, `create_famill`) VALUES
(1, 'Gamme 1', 1, '2019-01-03 14:54:41');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id_frs` int(11) NOT NULL,
  `nom_frs` varchar(255) NOT NULL,
  `adress_frs` varchar(255) NOT NULL,
  `tel_frs` varchar(255) NOT NULL,
  `visible_frs` int(11) NOT NULL DEFAULT 1,
  `created_frs` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `info`
--

CREATE TABLE `info` (
  `id_info` int(11) NOT NULL,
  `ste_info` varchar(255) NOT NULL,
  `adress_info` text DEFAULT NULL,
  `tel_info` varchar(255) DEFAULT NULL,
  `fax_info` varchar(255) DEFAULT NULL,
  `logo_info` text DEFAULT NULL,
  `i_1_info` text DEFAULT NULL,
  `i_2_info` text DEFAULT NULL,
  `i_3_info` text DEFAULT NULL,
  `i_4_info` text DEFAULT NULL,
  `create_info` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `id_ligne` int(11) NOT NULL,
  `id_frs_ligne` int(11) NOT NULL,
  `id_depot_ligne` int(11) NOT NULL,
  `pay_ligne` varchar(255) NOT NULL,
  `numeros_ligne` varchar(225) NOT NULL,
  `id_type_ligne` int(11) NOT NULL,
  `date_ligne` date DEFAULT NULL,
  `visible_ligne` int(11) NOT NULL DEFAULT 1,
  `created_ligne` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `list_commande`
--

CREATE TABLE `list_commande` (
  `id_list` int(11) NOT NULL,
  `id_art_list` int(11) NOT NULL,
  `qte_list` double NOT NULL,
  `remise_list` double NOT NULL,
  `tva_list` double NOT NULL,
  `ht_list` double NOT NULL,
  `ttc_list` double NOT NULL,
  `id_ligne_list` int(11) NOT NULL,
  `visible_list` int(11) NOT NULL DEFAULT 1,
  `create_list` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `magasins`
--

CREATE TABLE `magasins` (
  `id_mag` int(11) NOT NULL,
  `qte_mag` double DEFAULT 0,
  `id_art_mag` int(11) NOT NULL,
  `visible_mag` int(11) NOT NULL DEFAULT 1,
  `created_mag` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mouvement`
--

CREATE TABLE `mouvement` (
  `id_mouve` int(11) NOT NULL,
  `qte_mouve` double NOT NULL,
  `prix_mouve` double NOT NULL,
  `date_mouve` datetime NOT NULL,
  `id_art_mouve` int(11) NOT NULL,
  `type_mouve` int(11) NOT NULL,
  `id_user_mouve` int(11) NOT NULL,
  `visible_mouve` int(11) NOT NULL DEFAULT 1,
  `created_mouve` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reglements`
--

CREATE TABLE `reglements` (
  `id_reg` int(11) NOT NULL,
  `prix_reg` double NOT NULL,
  `type_reg` varchar(255) NOT NULL,
  `id_achat_reg` int(11) NOT NULL,
  `create_reg` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `stocks_depot`
--

CREATE TABLE `stocks_depot` (
  `id_stock` int(11) NOT NULL,
  `qte_stock` double NOT NULL DEFAULT 0,
  `id_depot_stock` int(11) NOT NULL,
  `id_art_stock` int(11) NOT NULL,
  `visible_stock` int(11) NOT NULL DEFAULT 1,
  `create_stock` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `stocks_depot`
--

INSERT INTO `stocks_depot` (`id_stock`, `qte_stock`, `id_depot_stock`, `id_art_stock`, `visible_stock`, `create_stock`) VALUES
(1, 80, 1, 1, 1, '2019-01-03 14:57:30'),
(2, 10, 1, 2, 1, '2019-01-04 13:28:37'),
(3, 20, 2, 1, 1, '2019-01-04 13:48:13');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_session`
--

CREATE TABLE `tbl_session` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `transfaires`
--

CREATE TABLE `transfaires` (
  `id_trans` int(11) NOT NULL,
  `id_art_trans` int(11) NOT NULL,
  `qte_trans` double NOT NULL,
  `id_depot_in` int(11) NOT NULL,
  `id_depot_out` int(11) NOT NULL,
  `visible_tans` int(11) NOT NULL DEFAULT 1,
  `create_trans` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `transfaires`
--

INSERT INTO `transfaires` (`id_trans`, `id_art_trans`, `qte_trans`, `id_depot_in`, `id_depot_out`, `visible_tans`, `create_trans`) VALUES
(1, 1, 10, 2, 1, 1, '2019-01-04 13:48:13'),
(2, 1, 10, 2, 1, 1, '2019-01-04 13:48:24');

-- --------------------------------------------------------

--
-- Structure de la table `type_commande`
--

CREATE TABLE `type_commande` (
  `id_type` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `cvisible_type` int(11) NOT NULL DEFAULT 1,
  `create_type` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type_mouvement`
--

CREATE TABLE `type_mouvement` (
  `id_t_mouve` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `visible_t_mouve` int(11) NOT NULL DEFAULT 1,
  `create_t_mouve` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `unites`
--

CREATE TABLE `unites` (
  `id_unite` int(11) NOT NULL,
  `unite` varchar(255) NOT NULL,
  `visible_unite` int(11) NOT NULL DEFAULT 1,
  `create_unite` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `unites`
--

INSERT INTO `unites` (`id_unite`, `unite`, `visible_unite`, `create_unite`) VALUES
(1, 'Kg', 1, '2019-01-03 14:54:47'),
(2, 'm', 1, '2019-01-03 14:54:54');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'admin', 'anass.dox@gmail.com', '123456', '2019-01-03 14:38:47'),
(2, 'root', 'anass.dox@gmail.com', '123456', '2019-01-03 14:45:13');

-- --------------------------------------------------------

--
-- Structure de la table `ventes`
--

CREATE TABLE `ventes` (
  `id_vente` int(11) NOT NULL,
  `qte_vente` int(11) NOT NULL,
  `prix_vente` int(11) NOT NULL,
  `date_vente` int(11) NOT NULL,
  `id_user_vente` int(11) NOT NULL,
  `id_cmd_vente` int(11) NOT NULL,
  `visible_vente` int(11) NOT NULL DEFAULT 1,
  `create_vente` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `achats`
--
ALTER TABLE `achats`
  ADD PRIMARY KEY (`id_achat`);

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_art`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_clt`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id_cmd`);

--
-- Index pour la table `depots`
--
ALTER TABLE `depots`
  ADD PRIMARY KEY (`id_depot`);

--
-- Index pour la table `famills`
--
ALTER TABLE `famills`
  ADD PRIMARY KEY (`id_famill`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id_frs`);

--
-- Index pour la table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id_info`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`id_ligne`);

--
-- Index pour la table `list_commande`
--
ALTER TABLE `list_commande`
  ADD PRIMARY KEY (`id_list`);

--
-- Index pour la table `magasins`
--
ALTER TABLE `magasins`
  ADD PRIMARY KEY (`id_mag`);

--
-- Index pour la table `mouvement`
--
ALTER TABLE `mouvement`
  ADD PRIMARY KEY (`id_mouve`);

--
-- Index pour la table `reglements`
--
ALTER TABLE `reglements`
  ADD PRIMARY KEY (`id_reg`);

--
-- Index pour la table `stocks_depot`
--
ALTER TABLE `stocks_depot`
  ADD PRIMARY KEY (`id_stock`);

--
-- Index pour la table `tbl_session`
--
ALTER TABLE `tbl_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Index pour la table `transfaires`
--
ALTER TABLE `transfaires`
  ADD PRIMARY KEY (`id_trans`);

--
-- Index pour la table `type_commande`
--
ALTER TABLE `type_commande`
  ADD PRIMARY KEY (`id_type`);

--
-- Index pour la table `type_mouvement`
--
ALTER TABLE `type_mouvement`
  ADD PRIMARY KEY (`id_t_mouve`);

--
-- Index pour la table `unites`
--
ALTER TABLE `unites`
  ADD PRIMARY KEY (`id_unite`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ventes`
--
ALTER TABLE `ventes`
  ADD PRIMARY KEY (`id_vente`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `achats`
--
ALTER TABLE `achats`
  MODIFY `id_achat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id_art` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_clt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id_cmd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `depots`
--
ALTER TABLE `depots`
  MODIFY `id_depot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `famills`
--
ALTER TABLE `famills`
  MODIFY `id_famill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `id_frs` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `info`
--
ALTER TABLE `info`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  MODIFY `id_ligne` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `list_commande`
--
ALTER TABLE `list_commande`
  MODIFY `id_list` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `magasins`
--
ALTER TABLE `magasins`
  MODIFY `id_mag` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mouvement`
--
ALTER TABLE `mouvement`
  MODIFY `id_mouve` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reglements`
--
ALTER TABLE `reglements`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `stocks_depot`
--
ALTER TABLE `stocks_depot`
  MODIFY `id_stock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `transfaires`
--
ALTER TABLE `transfaires`
  MODIFY `id_trans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `type_commande`
--
ALTER TABLE `type_commande`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type_mouvement`
--
ALTER TABLE `type_mouvement`
  MODIFY `id_t_mouve` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `unites`
--
ALTER TABLE `unites`
  MODIFY `id_unite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `ventes`
--
ALTER TABLE `ventes`
  MODIFY `id_vente` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
