SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `apns`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `apns` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `country_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `provider_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `service` VARCHAR(20) NULL DEFAULT 'gprs' COMMENT 'gprs, cdma' ,
  `plmn` VARCHAR(50) NULL DEFAULT NULL ,
  `apn` VARCHAR(150) NOT NULL DEFAULT '' ,
  `username` VARCHAR(100) NULL DEFAULT NULL ,
  `password` VARCHAR(100) NULL DEFAULT NULL ,
  `smsc` VARCHAR(100) NULL DEFAULT NULL ,
  `active` TINYINT(1) NOT NULL DEFAULT '1' ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  `updated` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `idx_country_id` (`country_id` ASC) ,
  INDEX `idx_provider_id` (`provider_id` ASC) ,
  INDEX `idx_service` (`service` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `apn_comments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `apn_comments` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `apn_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `comment` TEXT NULL DEFAULT NULL ,
  `works` TINYINT(1) NOT NULL DEFAULT '1' COMMENT 'Does this APN Work?' ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  `updated` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `idx_apn_id` (`apn_id` ASC) ,
  INDEX `idx_user_id` (`user_id` ASC) ,
  INDEX `apn_comments_ibfk_1` (`apn_id` ASC) ,
  CONSTRAINT `apn_comments_ibfk_1`
    FOREIGN KEY (`apn_id` )
    REFERENCES `apns` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bricks`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bricks` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `user_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `ubid` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Unique Brick ID' ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  `updated` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `idx_user_id` (`user_id` ASC) ,
  INDEX `idx_ubid` (`ubid` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `brick_connections`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `brick_connections` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `brick_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `connection` VARCHAR(20) NOT NULL DEFAULT 'gsm' COMMENT 'gsm, wifi, ethernet' ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `idx_connection` (`connection` ASC) ,
  INDEX `idx_brick_id` (`brick_id` ASC) ,
  CONSTRAINT `brick_connections_ibfk_1`
    FOREIGN KEY (`brick_id` )
    REFERENCES `bricks` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `brick_locations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `brick_locations` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `brick_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `latitude` FLOAT(10,6) NOT NULL DEFAULT '0.000000' ,
  `longitude` FLOAT(10,6) NOT NULL DEFAULT '0.000000' ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `idx_lat_lon` (`latitude` ASC, `longitude` ASC) ,
  INDEX `idx_brick_id` (`brick_id` ASC) ,
  CONSTRAINT `brick_locations_ibfk_1`
    FOREIGN KEY (`brick_id` )
    REFERENCES `bricks` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `brick_power`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `brick_power` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `brick_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `power` VARCHAR(20) NOT NULL DEFAULT 'battery' COMMENT 'ac, battery, solar' ,
  `power_level` TINYINT(4) NOT NULL DEFAULT '100' COMMENT '0 to 100' ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `idx_power` (`power` ASC) ,
  INDEX `idx_brick_id` (`brick_id` ASC) ,
  CONSTRAINT `brick_power_ibfk_1`
    FOREIGN KEY (`brick_id` )
    REFERENCES `bricks` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `countries`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `countries` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `country` VARCHAR(100) NOT NULL DEFAULT '' ,
  `country_code` SMALLINT(3) NOT NULL DEFAULT '0' ,
  `iso` VARCHAR(2) NOT NULL DEFAULT '' ,
  `updated` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `countries_providers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `countries_providers` (
  `country_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `provider_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `providers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `providers` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `provider` VARCHAR(150) NOT NULL DEFAULT '' ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  `updated` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `roles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `roles` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(32) NOT NULL ,
  `description` VARCHAR(255) NULL DEFAULT NULL ,
  `permissions` VARCHAR(255) NULL DEFAULT NULL ,
  `user_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `users` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(127) NOT NULL ,
  `first_name` VARCHAR(150) NULL DEFAULT NULL ,
  `last_name` VARCHAR(150) NULL DEFAULT NULL ,
  `username` VARCHAR(255) NOT NULL ,
  `password` VARCHAR(255) NOT NULL ,
  `logins` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `last_login` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  `updated` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `email` (`email` ASC) ,
  UNIQUE INDEX `username` (`username` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `roles_users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `roles_users` (
  `user_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `role_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`user_id`, `role_id`) ,
  INDEX `role_id_idxfk` (`role_id` ASC) ,
  CONSTRAINT `roles_users_ibfk_1`
    FOREIGN KEY (`user_id` )
    REFERENCES `users` (`id` )
    ON DELETE CASCADE,
  CONSTRAINT `roles_users_ibfk_2`
    FOREIGN KEY (`role_id` )
    REFERENCES `roles` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
