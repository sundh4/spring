/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;

create sequence `hibernate_sequence`;
create sequence `entitySequence`;
create sequence `linkSequence`;

CREATE TABLE IF NOT EXISTS `person`
(
    `id`                   bigint(20) unsigned NOT NULL,
    `map_data`             longtext                                           DEFAULT NULL CHECK (json_valid(`map_data`)),
    `name`                 tinytext            NOT NULL,
    `email`                varchar(256)        NOT NULL,
    `password`             tinytext                                           DEFAULT NULL,
    `active`               bit(1)              NOT NULL,
    `attachment_list_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    `creator`              longtext                                           DEFAULT NULL CHECK (json_valid(`creator`)),
    `editor`               longtext                                           DEFAULT NULL CHECK (json_valid(`editor`)),
    `created_by`           varchar(100)                                       DEFAULT NULL,
    `created`              timestamp           NULL                           DEFAULT NULL,
    `updated_by`           varchar(100)                                       DEFAULT NULL,
    `updated`              timestamp           NULL                           DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_person_email` (`email`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS `role`
(
    `id`   bigint(20) unsigned NOT NULL,
    `name` varchar(100)        NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS `person_roles`
(
    person_id bigint(20) unsigned NOT NULL,
    roles_id  bigint(20) unsigned NOT NULL,
    primary key (person_id, roles_id),
    foreign key (person_id) references person (id),
    foreign key (roles_id) references role (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS `product`
(
    `id`       bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `id_shop`  bigint(20) unsigned NOT NULL,
    `slug`     tinytext            NOT NULL,
    `name`     tinytext            NOT NULL,
    `quantity` int(11)             NOT NULL,
    PRIMARY KEY (`id`),
    KEY `foreignKey_product_shopId` (`id_shop`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS `shop`
(
    `id`         bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `map_data`   longtext                 DEFAULT NULL CHECK (json_valid(`map_data`)),
    `slug`       varchar(128)        NOT NULL,
    `name`       tinytext            NOT NULL,
    `creator`    longtext                 DEFAULT NULL CHECK (json_valid(`creator`)),
    `editor`     longtext                 DEFAULT NULL CHECK (json_valid(`editor`)),
    `created_by` varchar(100)             DEFAULT NULL,
    `created`    timestamp           NULL DEFAULT NULL,
    `updated_by` varchar(100)             DEFAULT NULL,
    `updated`    timestamp           NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_shop_slug` (`slug`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13657
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS `shopsetting`
(
    `id`      bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `id_shop` bigint(20) unsigned NOT NULL,
    `value`   tinytext            NOT NULL,
    PRIMARY KEY (`id`),
    KEY `foreignKey_shopSetting_shopId` (`id_shop`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS `template`
(
    `id`         bigint(20) unsigned NOT NULL,
    `map_data`   longtext                 DEFAULT NULL CHECK (json_valid(`map_data`)),
    `created_by` varchar(100)             DEFAULT NULL,
    `created`    timestamp           NULL DEFAULT NULL,
    `updated_by` varchar(100)             DEFAULT NULL,
    `updated`    timestamp           NULL DEFAULT NULL,
    `creator`    longtext                 DEFAULT NULL CHECK (json_valid(`creator`)),
    `editor`     longtext                 DEFAULT NULL CHECK (json_valid(`editor`)),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS `tenant`
(
    `id`       bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `name`     tinytext            NOT NULL,
    `map_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4;

/*!40101 SET SQL_MODE = IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS = IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
