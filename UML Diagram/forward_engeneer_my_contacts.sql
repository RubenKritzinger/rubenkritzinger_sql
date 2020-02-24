-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema gregs_list
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gregs_list
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gregs_list` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `gregs_list` ;

-- -----------------------------------------------------
-- Table `gregs_list`.`black_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`black_book` (
  `date_name` VARCHAR(20) NULL DEFAULT NULL,
  `rating` VARCHAR(20) NULL DEFAULT NULL)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `gregs_list`.`clown_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`clown_info` (
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `last_seen` VARCHAR(50) NULL DEFAULT NULL,
  `appearance` VARCHAR(50) NULL DEFAULT NULL,
  `activities` VARCHAR(50) NULL DEFAULT NULL)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `gregs_list`.`zip_code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`zip_code` (
  `zip_code` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(50) NULL DEFAULT NULL,
  `state` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`zip_code`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`status` (
  `status_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`profession`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`profession` (
  `prof_id` INT NOT NULL AUTO_INCREMENT,
  `profession` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`prof_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`my_contacts_id`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`my_contacts_id` (
  `contact_id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(30) NULL DEFAULT NULL,
  `first_name` VARCHAR(20) NULL DEFAULT NULL,
  `phone` VARCHAR(11) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `gender` CHAR(1) NULL DEFAULT NULL,
  `birthday` DATE NULL DEFAULT NULL,
  `prof_id` INT NOT NULL,
  `zip_code` INT NOT NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`contact_id`),
  INDEX `prof_id` (`prof_id` ASC) VISIBLE,
  INDEX `zip_code` (`zip_code` ASC) VISIBLE,
  INDEX `status_id` (`status_id` ASC) VISIBLE,
  CONSTRAINT `my_contacts_id_ibfk_1`
    FOREIGN KEY (`prof_id`)
    REFERENCES `gregs_list`.`profession` (`prof_id`),
  CONSTRAINT `my_contacts_id_ibfk_2`
    FOREIGN KEY (`zip_code`)
    REFERENCES `gregs_list`.`zip_code` (`zip_code`),
  CONSTRAINT `my_contacts_id_ibfk_3`
    FOREIGN KEY (`status_id`)
    REFERENCES `gregs_list`.`status` (`status_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`seeking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`seeking` (
  `seeking_id` INT NOT NULL AUTO_INCREMENT,
  `seeking` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`seeking_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`contact_seeking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`contact_seeking` (
  `contact_id` INT NOT NULL,
  `seeking_id` INT NOT NULL,
  PRIMARY KEY (`contact_id`, `seeking_id`),
  INDEX `seeking_id` (`seeking_id` ASC) VISIBLE,
  CONSTRAINT `contact_seeking_ibfk_1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `gregs_list`.`my_contacts_id` (`contact_id`),
  CONSTRAINT `contact_seeking_ibfk_2`
    FOREIGN KEY (`seeking_id`)
    REFERENCES `gregs_list`.`seeking` (`seeking_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`job_current`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`job_current` (
  `contact_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(30) NOT NULL,
  `salary` INT NOT NULL,
  `start_date` DATE NOT NULL,
  PRIMARY KEY (`contact_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`job_listings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`job_listings` (
  `job_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `salary` INT NOT NULL,
  `zip` INT NOT NULL,
  `description` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`job_desired`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`job_desired` (
  `contact_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(30) NOT NULL,
  `salary_low` INT NOT NULL,
  `salary_high` INT NOT NULL,
  `available` VARCHAR(20) NOT NULL,
  `years_exp` INT NOT NULL,
  `job_id` INT NULL,
  `job_desiredcol` INT NOT NULL,
  PRIMARY KEY (`contact_id`, `job_desiredcol`),
  INDEX `fk_job_id_idx` (`job_id` ASC) VISIBLE,
  CONSTRAINT `job_desired_ibfk_1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `gregs_list`.`job_current` (`contact_id`),
  CONSTRAINT `fk_job_id`
    FOREIGN KEY (`job_id`)
    REFERENCES `gregs_list`.`job_listings` (`job_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`my_contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`my_contacts` (
  `contact_id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(30) NULL DEFAULT NULL,
  `first_name` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `phone` INT NOT NULL,
  `contact` INT NOT NULL,
  `gender` CHAR(1) NULL DEFAULT NULL,
  `birthday` DATE NULL DEFAULT NULL,
  `prof_id` INT NULL DEFAULT NULL,
  `zip_code` INT NULL DEFAULT NULL,
  `status_id` INT NULL DEFAULT NULL,
  `` VARCHAR(45) NULL,
  PRIMARY KEY (`contact_id`),
  INDEX `my_contacts_fk_1` (`zip_code` ASC) VISIBLE,
  INDEX `my_contacts_fk_2` (`status_id` ASC) VISIBLE,
  INDEX `my_contacts_fk_3` (`prof_id` ASC) VISIBLE,
  CONSTRAINT `my_contacts_fk_1`
    FOREIGN KEY (`zip_code`)
    REFERENCES `gregs_list`.`zip_code` (`zip_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `my_contacts_fk_2`
    FOREIGN KEY (`status_id`)
    REFERENCES `gregs_list`.`status` (`status_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `my_contacts_fk_3`
    FOREIGN KEY (`prof_id`)
    REFERENCES `gregs_list`.`profession` (`prof_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `my_contacts_fk_4`
    FOREIGN KEY (`contact_id`)
    REFERENCES `gregs_list`.`contact_seeking` (`contact_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `my_contacts_fk_5`
    FOREIGN KEY (`contact_id`)
    REFERENCES `gregs_list`.`job_desired` (`contact_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `gregs_list`.`interests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`interests` (
  `int_id` INT NOT NULL AUTO_INCREMENT,
  `interests` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`int_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`contact_interest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`contact_interest` (
  `contact_id` INT NOT NULL,
  `int_id` INT NOT NULL,
  PRIMARY KEY (`contact_id`, `int_id`),
  INDEX `int_id` (`int_id` ASC) VISIBLE,
  CONSTRAINT `contact_interest_ibfk_1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `gregs_list`.`my_contacts` (`contact_id`),
  CONSTRAINT `contact_interest_ibfk_2`
    FOREIGN KEY (`int_id`)
    REFERENCES `gregs_list`.`interests` (`int_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`cookie_sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`cookie_sales` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(20) NOT NULL,
  `sales` DECIMAL(4,2) NOT NULL,
  `sale_date` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`doughnut_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`doughnut_list` (
  `doughnut_name` VARCHAR(10) NULL DEFAULT NULL,
  `doughnut_type` VARCHAR(6) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`doughnut_ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`doughnut_ratings` (
  `location` VARCHAR(50) NULL DEFAULT NULL,
  `time` TIME NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  `type` VARCHAR(50) NULL DEFAULT NULL,
  `rating` TINYINT NULL DEFAULT NULL,
  `comments` VARCHAR(50) NULL DEFAULT NULL)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `gregs_list`.`drink_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`drink_info` (
  `drink_name` VARCHAR(16) NULL DEFAULT NULL,
  `cost` DECIMAL(4,2) NULL DEFAULT NULL,
  `carbs` DECIMAL(4,2) NULL DEFAULT NULL,
  `color` VARCHAR(20) NULL DEFAULT NULL,
  `ice` CHAR(1) NULL DEFAULT NULL,
  `calories` INT NULL DEFAULT NULL)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `gregs_list`.`fish_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`fish_info` (
  `common` VARCHAR(50) NOT NULL,
  `species` VARCHAR(50) NOT NULL,
  `location` VARCHAR(50) NOT NULL,
  `weight` VARCHAR(15) NOT NULL)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gregs_list`.`fish_records`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`fish_records` (
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `common` VARCHAR(50) NOT NULL,
  `location` VARCHAR(50) NOT NULL,
  `state` VARCHAR(2) NOT NULL,
  `weight` VARCHAR(15) NOT NULL,
  `date` DATE NOT NULL)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gregs_list`.`hooptie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`hooptie` (
  `car_id` DATE NOT NULL,
  `color` VARCHAR(20) NULL DEFAULT NULL,
  `year` VARCHAR(4) NULL DEFAULT NULL,
  `make` VARCHAR(20) NULL DEFAULT NULL,
  `model` VARCHAR(20) NULL DEFAULT NULL,
  `price` FLOAT(10,3) NULL DEFAULT NULL)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `gregs_list`.`interest_separate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`interest_separate` (
  `interest` VARCHAR(100) NULL DEFAULT NULL,
  `interest1` VARCHAR(100) NULL DEFAULT NULL,
  `interest2` VARCHAR(100) NULL DEFAULT NULL,
  `interest3` VARCHAR(100) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`movie_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`movie_table` (
  `movie_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `rating` VARCHAR(5) NOT NULL,
  `category` VARCHAR(10) NOT NULL,
  `purchased` DATE NOT NULL,
  PRIMARY KEY (`movie_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 94
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gregs_list`.`movie_table_demo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`movie_table_demo` (
  `movie_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `rating` CHAR(1) NOT NULL,
  `drama` CHAR(1) NOT NULL,
  `comedy` CHAR(1) NOT NULL,
  `action` CHAR(1) NOT NULL,
  `gore` CHAR(1) NOT NULL,
  `scifi` CHAR(1) NOT NULL,
  `for_kids` CHAR(1) NOT NULL,
  `cartoon` CHAR(1) NOT NULL,
  `category` VARCHAR(10) NULL DEFAULT 'nons',
  `published` DATE NOT NULL,
  PRIMARY KEY (`movie_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`my_name`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`my_name` (
  `personid` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30) NULL DEFAULT NULL,
  `last_name` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`personid`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gregs_list`.`project_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`project_list` (
  `proj_id` INT NOT NULL AUTO_INCREMENT,
  `startdate` DATE NOT NULL,
  `estimatedcost` DECIMAL(10,2) NOT NULL,
  `improvements` VARCHAR(50) NULL DEFAULT NULL,
  `contractor` VARCHAR(10) NULL DEFAULT NULL,
  `contactnumber` INT NOT NULL,
  PRIMARY KEY (`proj_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `gregs_list`.`projekts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gregs_list`.`projekts` (
  `number` INT NOT NULL DEFAULT '0',
  `descriptionofproj` VARCHAR(50) NULL DEFAULT NULL,
  `contractoronjob` VARCHAR(10) NULL DEFAULT NULL)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
