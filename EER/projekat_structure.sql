-- MySQL Script generated by MySQL Workbench
-- Fri 24 Nov 2017 03:00:43 PM CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema edu_is
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema edu_is
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `edu_is` DEFAULT CHARACTER SET utf8 ;
USE `edu_is` ;

-- -----------------------------------------------------
-- Table `edu_is`.`Log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edu_is`.`Log` (
  `log_id` SMALLINT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`log_id`),
  UNIQUE INDEX `log_id_UNIQUE` (`log_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `edu_is`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edu_is`.`Role` (
  `role_id` SMALLINT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE INDEX `role_id_UNIQUE` (`role_id` ASC),
  UNIQUE INDEX `role_name_UNIQUE` (`role_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `edu_is`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edu_is`.`user` (
  `ID` SMALLINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(255) NULL,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `Log_log_id` SMALLINT NOT NULL,
  `Role_role_id` SMALLINT NOT NULL,
  PRIMARY KEY (`ID`, `Log_log_id`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_user_Log1_idx` (`Log_log_id` ASC),
  INDEX `fk_user_Role1_idx` (`Role_role_id` ASC),
  CONSTRAINT `fk_user_Log1`
    FOREIGN KEY (`Log_log_id`)
    REFERENCES `edu_is`.`Log` (`log_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_Role1`
    FOREIGN KEY (`Role_role_id`)
    REFERENCES `edu_is`.`Role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = big5
COLLATE = big5_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
