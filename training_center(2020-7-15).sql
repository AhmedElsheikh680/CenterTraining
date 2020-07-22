-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema training_center
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema training_center
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `training_center` DEFAULT CHARACTER SET utf8 ;
USE `training_center` ;

-- -----------------------------------------------------
-- Table `training_center`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `training_center`.`cities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `training_center`.`zones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `training_center`.`zones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_zones_cities1_idx` (`city_id` ASC),
  CONSTRAINT `fk_zones_cities1`
    FOREIGN KEY (`city_id`)
    REFERENCES `training_center`.`cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `training_center`.`universities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `training_center`.`universities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `training_center`.`faculities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `training_center`.`faculities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `university_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_faculities_universities1_idx` (`university_id` ASC),
  CONSTRAINT `fk_faculities_universities1`
    FOREIGN KEY (`university_id`)
    REFERENCES `training_center`.`universities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `training_center`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `training_center`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `zone_id` INT NOT NULL,
  `faculity_id` INT NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `gender` INT NOT NULL,
  `birthdate` DATE NULL,
  `street` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_students_zones_idx` (`zone_id` ASC),
  INDEX `fk_students_faculities1_idx` (`faculity_id` ASC),
  CONSTRAINT `fk_students_zones`
    FOREIGN KEY (`zone_id`)
    REFERENCES `training_center`.`zones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_faculities1`
    FOREIGN KEY (`faculity_id`)
    REFERENCES `training_center`.`faculities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `training_center`.`subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `training_center`.`subjects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `training_center`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `training_center`.`courses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `subject_id` INT NOT NULL,
  `hours` INT NOT NULL,
  `start_at` DATE NULL,
  `end_at` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_courses_subjects1_idx` (`subject_id` ASC),
  CONSTRAINT `fk_courses_subjects1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `training_center`.`subjects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `training_center`.`courses_students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `training_center`.`courses_students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_courses_students_students1_idx` (`student_id` ASC),
  INDEX `fk_courses_students_courses1_idx` (`course_id` ASC),
  CONSTRAINT `fk_courses_students_students1`
    FOREIGN KEY (`student_id`)
    REFERENCES `training_center`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_students_courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `training_center`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `training_center`.`telephones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `training_center`.`telephones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_telephones_students1_idx` (`student_id` ASC),
  CONSTRAINT `fk_telephones_students1`
    FOREIGN KEY (`student_id`)
    REFERENCES `training_center`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `training_center`.`course_days`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `training_center`.`course_days` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `course_id` INT NOT NULL,
  `day` VARCHAR(45) NULL,
  `from` VARCHAR(45) NULL,
  `to` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_course_days_courses1_idx` (`course_id` ASC),
  CONSTRAINT `fk_course_days_courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `training_center`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
