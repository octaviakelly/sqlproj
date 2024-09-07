-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema rv_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rv_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rv_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `rv_schema` ;

-- -----------------------------------------------------
-- Table `rv_schema`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rv_schema`.`address` (
  `idaddress` INT NOT NULL,
  `apptNum` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idaddress`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rv_schema`.`carer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rv_schema`.`carer` (
  `idcarer` INT NOT NULL,
  `carerName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcarer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rv_schema`.`resident`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rv_schema`.`resident` (
  `idresident` INT NOT NULL,
  `resFName` VARCHAR(45) NULL DEFAULT NULL,
  `resLName` VARCHAR(45) NULL DEFAULT NULL,
  `idaddress` VARCHAR(45) NULL DEFAULT NULL,
  `address_idaddress` INT NOT NULL,
  PRIMARY KEY (`idresident`),
  INDEX `fk_resident_address_idx` (`address_idaddress` ASC) VISIBLE,
  CONSTRAINT `fk_resident_address`
    FOREIGN KEY (`address_idaddress`)
    REFERENCES `rv_schema`.`address` (`idaddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rv_schema`.`task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rv_schema`.`task` (
  `idtask` INT NOT NULL,
  `task` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idtask`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rv_schema`.`tasktime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rv_schema`.`tasktime` (
  `idtasktime` INT NOT NULL,
  `tasktime` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idtasktime`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rv_schema`.`taskdate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rv_schema`.`taskdate` (
  `idtaskdate` INT NOT NULL,
  `taskdate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idtaskdate`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rv_schema`.`tasksession`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rv_schema`.`tasksession` (
  `idtasksession` INT NOT NULL,
  `iddate` INT NULL DEFAULT NULL,
  `idtime` INT NULL DEFAULT NULL,
  `idcarertask` INT NULL DEFAULT NULL,
  `tasktime_idtasktime` INT NOT NULL,
  `taskdate_idtaskdate` INT NOT NULL,
  PRIMARY KEY (`idtasksession`),
  INDEX `fk_tasksession_tasktime1_idx` (`tasktime_idtasktime` ASC) VISIBLE,
  INDEX `fk_tasksession_taskdate1_idx` (`taskdate_idtaskdate` ASC) VISIBLE,
  CONSTRAINT `fk_tasksession_tasktime1`
    FOREIGN KEY (`tasktime_idtasktime`)
    REFERENCES `rv_schema`.`tasktime` (`idtasktime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasksession_taskdate1`
    FOREIGN KEY (`taskdate_idtaskdate`)
    REFERENCES `rv_schema`.`taskdate` (`idtaskdate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rv_schema`.`carertask`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rv_schema`.`carertask` (
  `idcarerTask` INT NOT NULL,
  `idresident` INT NULL DEFAULT NULL,
  `idcarer` INT NULL DEFAULT NULL,
  `idtask` INT NULL DEFAULT NULL,
  `idtasksession` INT NULL DEFAULT NULL,
  `resident_idresident` INT NOT NULL,
  `carer_idcarer` INT NOT NULL,
  `task_idtask` INT NOT NULL,
  `tasksession_idtasksession` INT NOT NULL,
  PRIMARY KEY (`idcarerTask`),
  INDEX `fk_carertask_resident1_idx` (`resident_idresident` ASC) VISIBLE,
  INDEX `fk_carertask_carer1_idx` (`carer_idcarer` ASC) VISIBLE,
  INDEX `fk_carertask_task1_idx` (`task_idtask` ASC) VISIBLE,
  INDEX `fk_carertask_tasksession1_idx` (`tasksession_idtasksession` ASC) VISIBLE,
  CONSTRAINT `fk_carertask_resident1`
    FOREIGN KEY (`resident_idresident`)
    REFERENCES `rv_schema`.`resident` (`idresident`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carertask_carer1`
    FOREIGN KEY (`carer_idcarer`)
    REFERENCES `rv_schema`.`carer` (`idcarer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carertask_task1`
    FOREIGN KEY (`task_idtask`)
    REFERENCES `rv_schema`.`task` (`idtask`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carertask_tasksession1`
    FOREIGN KEY (`tasksession_idtasksession`)
    REFERENCES `rv_schema`.`tasksession` (`idtasksession`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
