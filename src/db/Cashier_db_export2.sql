-- MySQL Script generated by MySQL Workbench
-- Tue Apr  6 16:41:22 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema csah
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema csah
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `csah` DEFAULT CHARACTER SET utf8 ;
USE `csah` ;

-- -----------------------------------------------------
-- Table `csah`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `csah`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `csah`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `csah`.`city` (
  `city_id` INT NOT NULL AUTO_INCREMENT,
  `city_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`city_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `csah`.`Shops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `csah`.`Shops` (
  `shop_id` INT NOT NULL AUTO_INCREMENT,
  `city_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`shop_id`),
  INDEX `city_id_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `city_id`
    FOREIGN KEY (`city_id`)
    REFERENCES `csah`.`city` (`city_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `csah`.`Cashier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `csah`.`Cashier` (
  `cashier_id` INT NOT NULL AUTO_INCREMENT,
  `ref_user_id` INT NOT NULL,
  `ref_city_id` INT NULL,
  `descr` VARCHAR(255) NULL,
  PRIMARY KEY (`cashier_id`),
  INDEX `user_id_idx` (`ref_user_id` ASC) VISIBLE,
  INDEX `city_id_idx` (`ref_city_id` ASC) VISIBLE,
  CONSTRAINT `ref_user_id`
    FOREIGN KEY (`ref_user_id`)
    REFERENCES `csah`.`user` (`id_user`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ref_city_id`
    FOREIGN KEY (`ref_city_id`)
    REFERENCES `csah`.`city` (`city_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `csah`.`workhistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `csah`.`workhistory` (
  `history_id` INT NOT NULL AUTO_INCREMENT,
  `ref_shop_id` INT NOT NULL,
  `ref_user_id` INT NOT NULL,
  PRIMARY KEY (`history_id`),
  INDEX `user_id_idx` (`ref_user_id` ASC) VISIBLE,
  INDEX `shop_id_idx` (`ref_shop_id` ASC) VISIBLE,
  CONSTRAINT `ref_user_id`
    FOREIGN KEY (`ref_user_id`)
    REFERENCES `csah`.`user` (`id_user`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ref_shop_id`
    FOREIGN KEY (`ref_shop_id`)
    REFERENCES `csah`.`Shops` (`shop_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
