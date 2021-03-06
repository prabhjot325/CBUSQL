-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Freelance
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Freelance` ;

-- -----------------------------------------------------
-- Schema Freelance
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Freelance` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `Freelance` ;

-- -----------------------------------------------------
-- Table `Freelance`.`user_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Freelance`.`user_type` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Freelance`.`user_type` (
  `user_type_id` INT NOT NULL,
  `user_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_type_id`))
ENGINE = InnoDB;

SHOW WARNINGS;


-- -----------------------------------------------------
-- Table `Freelance`.`freelance_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Freelance`.`freelance_account` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Freelance`.`freelance_account` (
  `freelance_id` INT NOT NULL,
  `user_type_id` INT NOT NULL,
  `first_name` VARCHAR(50) NULL,
  `last_name` VARCHAR(50) NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `gender` VARCHAR(05) NULL,
  `contact_number` INT NULL,
  PRIMARY KEY (`freelance_Id`),
  CONSTRAINT `user_type_id`
    FOREIGN KEY (`user_type_id`)
    REFERENCES `Freelance`.`user_type` (`user_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `user_type_id_idx` ON `Freelance`.`freelance_account` (`user_type_id` ASC) VISIBLE;

SHOW WARNINGS;

DROP TABLE IF EXISTS `Freelance`.`freelance_services` ;
SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Freelance`.`service` (
  `service_id` INT NOT NULL,
  `category` VARCHAR(45) NULL,
  `service_name` VARCHAR(45) NULL,
  `service_description` VARCHAR(45) NULL,
  `createdby` VARCHAR(45) NULL,
  `created_date` VARCHAR(45) NULL,
  `updatedby` VARCHAR(45) NULL,
  `updated_date` VARCHAR(45) NULL,
  PRIMARY KEY (`service_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Freelance`.`freelance_services`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Freelance`.`freelance_services` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Freelance`.`freelance_services` (
  `freelance_service_id` INT NOT NULL,
  `freelance_Id` INT NULL,
  `salary_per_hour` VARCHAR(4) NULL,
  `background_verified` boolean NULL,
  `is_available`boolean NULL,
  `service_location` VARCHAR(45) NULL,
  `job_title` VARCHAR(45) NULL,
  `service_description` VARCHAR(500) NULL,
  `price` VARCHAR(45) NULL,
  `rating` DECIMAL(10) NULL,
  `discount` DECIMAL(10) NULL,
  PRIMARY KEY (`freelance_service_id`),
  CONSTRAINT `freelance_Id`
    FOREIGN KEY (`freelance_service_id`)
    REFERENCES `Freelance`.`freelance_account` (`freelance_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `freelance_Id_idx` ON `Freelance`.`freelance_services` (`freelance_Id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Freelance`.`worker_skill_set`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Freelance`.`worker_skill_set` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Freelance`.`worker_skill_set` (
  `worker_skill_set_id` INT NOT NULL,
  `skill_id` INT NOT NULL,
  `skill_level` INT NULL,
  PRIMARY KEY (`worker_skill_set_id`, `skill_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Freelance`.`education_background`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Freelance`.`education_background` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Freelance`.`education` (
  `education_id` INT NOT NULL,
  `freelance_Id` INT NULL,
  `university` VARCHAR(45) NULL,
  `degree_name` VARCHAR(45) NULL,
  `major_subject` VARCHAR(45) NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `cgpa` DECIMAL(20) NULL,
  PRIMARY KEY (`education_id`),
  CONSTRAINT `freelance_education`
    FOREIGN KEY (`freelance_Id`)
    REFERENCES `Freelance`.`freelance_account` (`freelance_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `freelance_Id_idx` ON `Freelance`.`education` (`freelance_Id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Freelance`.`experience`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Freelance`.`experience` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Freelance`.`experience` (
  `experience_id` INT NOT NULL,
  `freelance_Id` INT NULL,
  `current_job_title` VARCHAR(45) NULL,
  `total_experience` DECIMAL(25) NULL,
  `feedback_rating` DECIMAL NULL,
  `recent_start_date` DATE NULL,
  `recent_end_date` DATE NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`experience_id`),
  CONSTRAINT `freelance_experience`
    FOREIGN KEY (`freelance_Id`)
    REFERENCES `Freelance`.`freelance_account` (`freelance_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `freelance_Id_idx` ON `Freelance`.`experience` (`freelance_Id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Freelance`.`requirement_post_skill_set`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Freelance`.`requirement_post_skill_set` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Freelance`.`requirement_post_skill_set` (
  `skill_id` INT NOT NULL,
  `requirement_post_id` INT NOT NULL,
  `experience_level` VARCHAR(45) NULL,
  PRIMARY KEY (`skill_id`, `requirement_post_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Freelance`.`requirement_post_activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Freelance`.`requirement_post_activity` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Freelance`.`requirement_post_activity` (
  `requirement_post_activity_id` INT NOT NULL,
  `requirement _post_id` INT NOT NULL,
  `requirement_post_date` INT NULL,
  PRIMARY KEY (`requirement_post_activity_id`, `requirement _post_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Freelance`.`requirement_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Freelance`.`requirement_post` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Freelance`.`requirement_post` (
  `requirement_post_id` INT NOT NULL,
  `company_id` INT NULL,
  `job_description` VARCHAR(45) NULL,
  `job_location` VARCHAR(45) NULL,
  `skill_required` VARCHAR(45) NULL,
  `experience_required` VARCHAR(45) NULL,
  PRIMARY KEY (`requirement_post_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Freelance`.`company_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Freelance`.`company_profile` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Freelance`.`company_profile` (
  `company_id` INT NOT NULL,
  `company_name` VARCHAR(45) NULL,
  `company_description` VARCHAR(45) NULL,
  `sector_detail` VARCHAR(45) NULL,
  `company_website` VARCHAR(45) NULL,
  PRIMARY KEY (`company_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Freelance`.`job_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Freelance`.`job_status` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Freelance`.`job_status` (
  `job_id` INT NOT NULL,
  `freelance_service_id` INT NULL,
  `company_id` INT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `time_period` INT NULL,
  `in_progress` VARCHAR(45) NULL,
  `payment_done` VARCHAR(45) NULL,
  PRIMARY KEY (`job_id`),
  CONSTRAINT `company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `Freelance`.`company_profile` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `freelance_service_id`
    FOREIGN KEY (`freelance_service_id`)
    REFERENCES `Freelance`.`freelance_services` (`freelance_service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `company_id_idx` ON `Freelance`.`job_status` (`company_id` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `service_id_idx` ON `Freelance`.`job_status` (`freelance_service_id` ASC) VISIBLE;

SHOW WARNINGS;
USE `Freelance` ;





-- -----------------------------------------------------
-- Table `Freelance`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Freelance`.`reviews` (
  `review_id` INT NOT NULL,
  `job_id` INT NULL,
  `rating` DECIMAL(2,1) NULL,
  `comments` NVARCHAR(500) NULL,
  `posted_date` DATETIME NULL,
  `updated_date` DATETIME NULL,
  `is_deleted` TINYINT NULL,
  `like` INT NULL,
  `dislike` INT NULL,
  PRIMARY KEY (`review_id`),
  INDEX `job_id_idx` (`job_id` ASC) VISIBLE,
  CONSTRAINT `job_id`
    FOREIGN KEY (`job_id`)
    REFERENCES `Freelance`.`job_status` (`job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- View `Freelance`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Freelance`.`view1`;
SHOW WARNINGS;
DROP VIEW IF EXISTS `Freelance`.`view1` ;
SHOW WARNINGS;
USE `Freelance`;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Constraints
-- -----------------------------------------------------

alter TABLE freelance.freelance_account 
ADD CONSTRAINT email_constraint CHECK(email like '%_@__%.__%');

use freelance;
alter TABLE freelance.freelance_account 
ADD CONSTRAINT password_constraint check(password like '%[0-9]%' and password like '%[A-Z]%' and password like '%[!@#$%a^&*()-_+=.,;:"`~]%' and length(password) >= 8);

use freelance;
alter TABLE freelance.freelance_account 
ADD CONSTRAINT dobirth_constraint check(year(current_date()-dob)>=18);

use freelance;
alter TABLE freelance.freelance_services
ADD CONSTRAINT salary_constraint check (salary_per_hour>=13);

use freelance;
alter TABLE freelance.reviews 
ADD CONSTRAINT rating_constraint check(rating>=1 and rating<=5);
