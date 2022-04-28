-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ssafit
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ssafit` ;

-- -----------------------------------------------------
-- Schema ssafit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ssafit` DEFAULT CHARACTER SET utf8 ;
USE `ssafit` ;

-- -----------------------------------------------------
-- Table `ssafit`.`video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ssafit`.`video` ;

CREATE TABLE IF NOT EXISTS `ssafit`.`video` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `part` VARCHAR(45) NOT NULL,
  `channel_name` VARCHAR(45) NOT NULL,
  `url` VARCHAR(100) NOT NULL,
  `view_cnt` INT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ssafit`.`review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ssafit`.`review` ;

CREATE TABLE IF NOT EXISTS `ssafit`.`review` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `video_no` INT NOT NULL,
  `user_id` VARCHAR(45) NULL,
  `title` VARCHAR(45) NULL,
  `content` VARCHAR(2000) NULL,
  `date` TIMESTAMP NULL,
  PRIMARY KEY (`no`, `video_no`),
  INDEX `review_video_no_fk_idx` (`video_no` ASC) VISIBLE,
  CONSTRAINT `review_video_no_fk`
    FOREIGN KEY (`video_no`)
    REFERENCES `ssafit`.`video` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ssafit`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ssafit`.`user` ;

CREATE TABLE IF NOT EXISTS `ssafit`.`user` (
  `id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `introduce` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ssafit`.`jjim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ssafit`.`jjim` ;

CREATE TABLE IF NOT EXISTS `ssafit`.`jjim` (
  `user_id` VARCHAR(45) NOT NULL,
  `video_no` INT NOT NULL,
  PRIMARY KEY (`user_id`, `video_no`),
  INDEX `jjim_video_no_fk_idx` (`video_no` ASC) VISIBLE,
  CONSTRAINT `jjim_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `ssafit`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `jjim_video_no_fk`
    FOREIGN KEY (`video_no`)
    REFERENCES `ssafit`.`video` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ssafit`.`follow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ssafit`.`follow` ;

CREATE TABLE IF NOT EXISTS `ssafit`.`follow` (
  `from` VARCHAR(45) NOT NULL,
  `to` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`from`, `to`),
  INDEX `follow_to_fk_idx` (`to` ASC) VISIBLE,
  CONSTRAINT `follow_from_fk`
    FOREIGN KEY (`from`)
    REFERENCES `ssafit`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `follow_to_fk`
    FOREIGN KEY (`to`)
    REFERENCES `ssafit`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
