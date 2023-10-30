-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema rentalstore
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rentalstore
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rentalstore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `rentalstore` ;

-- -----------------------------------------------------
-- Table `rentalstore`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentalstore`.`actors` (
  `index` BIGINT NULL DEFAULT NULL,
  `actor_id` SMALLINT NOT NULL,
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `full_name` TEXT NULL DEFAULT NULL,
  `actor_last_update` DATETIME NULL DEFAULT NULL,
  INDEX `ix_actors_index` (`index` ASC) VISIBLE,
  INDEX `idx_actor_id` (`actor_id` ASC) VISIBLE,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rentalstore`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentalstore`.`categories` (
  `index` BIGINT NULL DEFAULT NULL,
  `category_id` SMALLINT NOT NULL,
  `category_name` TEXT NULL DEFAULT NULL,
  `category_last_update` TEXT NULL DEFAULT NULL,
  INDEX `ix_categories_index` (`index` ASC) VISIBLE,
  INDEX `idx_category_id` (`category_id` ASC) VISIBLE,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rentalstore`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentalstore`.`languages` (
  `index` BIGINT NULL DEFAULT NULL,
  `language_id` SMALLINT NOT NULL,
  `language_name` TEXT NULL DEFAULT NULL,
  `language_last_update` DATETIME NULL DEFAULT NULL,
  INDEX `ix_languages_index` (`index` ASC) VISIBLE,
  INDEX `idx_language_id` (`language_id` ASC) VISIBLE,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rentalstore`.`films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentalstore`.`films` (
  `index` BIGINT NULL DEFAULT NULL,
  `film_id` SMALLINT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` TEXT NULL DEFAULT NULL,
  `language_id` SMALLINT NULL DEFAULT NULL,
  `rental_duration` SMALLINT NULL DEFAULT NULL,
  `rental_rate` FLOAT NULL DEFAULT NULL,
  `length` SMALLINT NULL DEFAULT NULL,
  `replacement_cost` FLOAT NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  `film_last_update` DATETIME NULL DEFAULT NULL,
  `category_id` SMALLINT NULL DEFAULT NULL,
  INDEX `ix_films_index` (`index` ASC) VISIBLE,
  INDEX `idx_film_id` (`film_id` ASC) VISIBLE,
  INDEX `category_id` (`category_id` ASC) VISIBLE,
  INDEX `language_id` (`language_id` ASC) VISIBLE,
  PRIMARY KEY (`film_id`),
  CONSTRAINT `films_ibfk_1`
    FOREIGN KEY (`category_id`)
    REFERENCES `rentalstore`.`categories` (`category_id`),
  CONSTRAINT `films_ibfk_2`
    FOREIGN KEY (`language_id`)
    REFERENCES `rentalstore`.`languages` (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rentalstore`.`actorsfilms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentalstore`.`actorsfilms` (
  `index` BIGINT NULL DEFAULT NULL,
  `actor_id` SMALLINT NULL DEFAULT NULL,
  `film_id` SMALLINT NULL DEFAULT NULL,
  INDEX `ix_actorsfilms_index` (`index` ASC) VISIBLE,
  INDEX `actor_id` (`actor_id` ASC) VISIBLE,
  INDEX `film_id` (`film_id` ASC) VISIBLE,
  CONSTRAINT `actorsfilms_ibfk_1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `rentalstore`.`actors` (`actor_id`),
  CONSTRAINT `actorsfilms_ibfk_2`
    FOREIGN KEY (`film_id`)
    REFERENCES `rentalstore`.`films` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rentalstore`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentalstore`.`inventory` (
  `index` BIGINT NULL DEFAULT NULL,
  `inventory_id` SMALLINT NOT NULL,
  `film_id` SMALLINT NULL DEFAULT NULL,
  `store_id` SMALLINT NULL DEFAULT NULL,
  `inventory_last_update` DATETIME NULL DEFAULT NULL,
  INDEX `ix_inventory_index` (`index` ASC) VISIBLE,
  INDEX `idx_inventory_id` (`inventory_id` ASC) VISIBLE,
  INDEX `film_id` (`film_id` ASC) VISIBLE,
  PRIMARY KEY (`inventory_id`),
  CONSTRAINT `inventory_ibfk_1`
    FOREIGN KEY (`film_id`)
    REFERENCES `rentalstore`.`films` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rentalstore`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentalstore`.`rental` (
  `index` BIGINT NULL DEFAULT NULL,
  `rental_id` SMALLINT NOT NULL,
  `rental_date` DATETIME NULL DEFAULT NULL,
  `inventory_id` SMALLINT NULL DEFAULT NULL,
  `customer_id` SMALLINT NULL DEFAULT NULL,
  `return_date` DATETIME NULL DEFAULT NULL,
  `staff_id` SMALLINT NULL DEFAULT NULL,
  `rental_last_update` DATETIME NULL DEFAULT NULL,
  INDEX `ix_rental_index` (`index` ASC) VISIBLE,
  INDEX `idx_rental_id` (`rental_id` ASC) VISIBLE,
  INDEX `inventory_id` (`inventory_id` ASC) VISIBLE,
  PRIMARY KEY (`rental_id`),
  CONSTRAINT `rental_ibfk_1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `rentalstore`.`inventory` (`inventory_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
