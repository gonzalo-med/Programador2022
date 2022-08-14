-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Veterinaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Veterinaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Veterinaria` DEFAULT CHARACTER SET utf8 ;
USE `Veterinaria` ;

-- -----------------------------------------------------
-- Table `Veterinaria`.`Dueno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veterinaria`.`Dueno` (
  `DNI` VARCHAR(8) NOT NULL,
  `Nombre` VARCHAR(30) NOT NULL,
  `Apellido` VARCHAR(30) NOT NULL,
  `Telefono` VARCHAR(15) NULL,
  `Direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Veterinaria`.`Perro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veterinaria`.`Perro` (
  `Id_perro` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fecha_nac` DATE NOT NULL,
  `Sexo` VARCHAR(6) NOT NULL,
  `Dueno_DNI` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`Id_perro`),
  CONSTRAINT `fk_Perro_Dueno`
    FOREIGN KEY (`Dueno_DNI`)
    REFERENCES `Veterinaria`.`Dueno` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Veterinaria`.`Historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veterinaria`.`Historial` (
  `Id_historial` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `Monto` DECIMAL NOT NULL,
  `Perro` INT NOT NULL,
  PRIMARY KEY (`Id_historial`),
  CONSTRAINT `fk_Historial_Perro1`
    FOREIGN KEY (`Perro`)
    REFERENCES `Veterinaria`.`Perro` (`Id_perro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


/*
LINEAS EJECUTADAS PARA PODER PROBAR EL SCRIPT MANTENIENDO INTEGRIDAD REFERENCIAL DE LA BASE DE DATOS

INSERT INTO `veterinaria`.`dueno`
(`DNI`,`Nombre`,`Apellido`,`Telefono`,`Direccion`)
VALUES
(29963492,'Mauricio','Franco',1554422,'las varillas');

INSERT INTO `veterinaria`.`perro`
(`Id_perro`,`Nombre`,`Fecha_nac`,`Sexo`,`Dueno_DNI`)
VALUES
(1,'Coco','2018/06/08','M',29963492);
*/
INSERT INTO `veterinaria`.`historial`
(`Id_historial`,`fecha`,`Descripcion`,`Monto`,`Perro`)
VALUES
(10,'2022-06-05','Corte de cabello',1000,'1');
