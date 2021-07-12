-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Categories` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Categories` (
  `category_id` INT NOT NULL,
  `category_name` VARCHAR(45) NULL,
  `remarks` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Movies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Movies` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Movies` (
  `movie_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `director` VARCHAR(45) NULL,
  `year_released` VARCHAR(45) NULL,
  PRIMARY KEY (`movie_id`),
  CONSTRAINT `fk_Movies_Categories1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `mydb`.`Categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MoviesRentals`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MoviesRentals` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MoviesRentals` (
  `reference_number` INT NOT NULL,
  `return_date` DATE NULL,
  `transaction_date` DATE NULL,
  `membership_number` INT NULL,
  PRIMARY KEY (`reference_number`),
  CONSTRAINT `fk_MoviesRentals_Movies1`
    FOREIGN KEY (`reference_number`)
    REFERENCES `mydb`.`Movies` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Members`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Members` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Members` (
  `membership_number` INT NOT NULL,
  `Full_names` VARCHAR(45) NULL,
  `Gender` VARCHAR(45) NULL,
  `DoB` VARCHAR(45) NULL,
  `Physical_adrs` VARCHAR(45) NULL,
  `Logical_adrs` VARCHAR(45) NULL,
  PRIMARY KEY (`membership_number`),
  CONSTRAINT `fk_Members_MoviesRentals`
    FOREIGN KEY (`membership_number`)
    REFERENCES `mydb`.`MoviesRentals` (`reference_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`table1` ;

CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Payments` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Payments` (
  `payment_id` INT NOT NULL,
  `payment_date` DATE NULL,
  `description` VARCHAR(100) NULL,
  `amount_paid` FLOAT NULL,
  `external_reference_number` INT NULL,
  PRIMARY KEY (`payment_id`),
  CONSTRAINT `fk_Payments_Members1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `mydb`.`Members` (`membership_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
