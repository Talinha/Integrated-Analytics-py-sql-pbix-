-- MySQL Script generated by MySQL Workbench
-- Fri Nov 10 20:19:25 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema shopnow
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shopnow
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shopnow` DEFAULT CHARACTER SET utf8 ;
USE `shopnow` ;

-- -----------------------------------------------------
-- Table `shopnow`.`DIM_FORNECEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopnow`.`DIM_FORNECEDOR` (
  `ID_FORNECEDOR` INT NOT NULL AUTO_INCREMENT,
  `FORNECEDOR` VARCHAR(45) NULL,
  `ID_SHOPNOW` INT,
  PRIMARY KEY (`ID_FORNECEDOR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopnow`.`DIM_PEDIDO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopnow`.`DIM_PEDIDO` (
  `ID_PEDIDO` INT NOT NULL AUTO_INCREMENT,
  `DATA_PEDIDO` DATE NOT NULL,
  `ANO` INT NOT NULL,
  `MES` INT NOT NULL,
  `DIA` INT NOT NULL,
  `DIA_SEMANA` VARCHAR(45) NOT NULL,
  `ID_SHOPNOW` INT,
  PRIMARY KEY (`ID_PEDIDO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopnow`.`DIM_PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopnow`.`DIM_PRODUTO` (
  `ID_PRODUTO` INT NOT NULL AUTO_INCREMENT,
  `CATEGORIA_PRODUTO` VARCHAR(45) NOT NULL,
  `PRODUTO` VARCHAR(100) NOT NULL,
  `ID_SHOPNOW` INT,
  PRIMARY KEY (`ID_PRODUTO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopnow`.`DIM_SELLER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopnow`.`DIM_SELLER` (
  `ID_SELLER` INT NOT NULL AUTO_INCREMENT,
  `SELLER` VARCHAR(45) NOT NULL,
  `ID_SHOPNOW` INT,
  PRIMARY KEY (`ID_SELLER`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopnow`.`DIM_CANAL_VENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopnow`.`DIM_CANAL_VENDA` (
  `ID_CANAL_VENDA` INT NOT NULL AUTO_INCREMENT,
  `CANAL_VENDA` VARCHAR(45) NOT NULL,
  `ID_SHOPNOW` INT,
  PRIMARY KEY (`ID_CANAL_VENDA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopnow`.`DIM_AVALIACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopnow`.`DIM_AVALIACAO` (
  `ID_AVALIACAO` INT NOT NULL AUTO_INCREMENT,
  `AVALIACAO` VARCHAR(45) NULL,
  `ID_SHOPNOW` INT,
  PRIMARY KEY (`ID_AVALIACAO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopnow`.`DIM_MEIO_PAGAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopnow`.`DIM_MEIO_PAGAMENTO` (
  `ID_MEIO_PAGAMENTO` INT NOT NULL AUTO_INCREMENT,
  `MEIO_PAGAMENTO` VARCHAR(45) NOT NULL,
  `ID_SHOPNOW` INT,
  PRIMARY KEY (`ID_MEIO_PAGAMENTO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopnow`.`DIM_ENTREGA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopnow`.`DIM_ENTREGA` (
  `ID_ENTREGA` INT NOT NULL AUTO_INCREMENT,
  `DATA_ENTREGA` DATE NULL,
  `ANO` INT NULL,
  `MES` INT NULL,
  `DIA` INT NULL,
  `DIA_SEMANA` VARCHAR(45) NULL,
  `TIPO_ENTREGA` VARCHAR(45) NULL,
  `ID_SHOPNOW` INT,
  PRIMARY KEY (`ID_ENTREGA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopnow`.`DIM_CANCELAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopnow`.`DIM_CANCELAMENTO` (
  `ID_CANCELAMENTO` INT NOT NULL AUTO_INCREMENT,
  `CANCELAMENTO` VARCHAR(45) NULL,
  `MOTIVO_CANCELAMENTO` VARCHAR(45) NULL,
  `ID_SHOPNOW` INT,
  PRIMARY KEY (`ID_CANCELAMENTO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopnow`.`DIM_TIPO_CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopnow`.`DIM_TIPO_CLIENTE` (
  `ID_TIPO_CLIENTE` INT NOT NULL AUTO_INCREMENT,
  `TIPO_CLIENTE` VARCHAR(45) NOT NULL,
  `ID_SHOPNOW` INT,
  PRIMARY KEY (`ID_TIPO_CLIENTE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopnow`.`DIM_CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopnow`.`DIM_CLIENTE` (
  `ID_CLIENTE` INT NOT NULL AUTO_INCREMENT,
  `PAIS` VARCHAR(45) NOT NULL,
  `ESTADO` VARCHAR(45) NOT NULL,
  `CIDADE` VARCHAR(45) NOT NULL,
  `CEP` CHAR(8) NOT NULL,
  `LATITUDE` VARCHAR(45) NOT NULL,
  `LONGITUDE` VARCHAR(45) NOT NULL,
  `REGISTRO_CLIENTE` INT NOT NULL,
  `ID_SHOPNOW` INT,
  PRIMARY KEY (`ID_CLIENTE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopnow`.`FATO_VENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopnow`.`FATO_VENDA` (
  `VALOR_VENDA` REAL NOT NULL,
  `COMISSAO` REAL NOT NULL,
  `QTD_PRODUTO` INT NOT NULL,
  `ID_FORNECEDOR` INT NOT NULL,
  `ID_PEDIDO` INT NOT NULL,
  `ID_PRODUTO` INT NOT NULL,
  `ID_SELLER` INT NOT NULL,
  `ID_CANAL_VENDA` INT NOT NULL,
  `ID_AVALIACAO` INT NOT NULL,
  `ID_MEIO_PAGAMENTO` INT NOT NULL,
  `ID_ENTREGA` INT NOT NULL,
  `ID_CANCELAMENTO` INT NOT NULL,
  `ID_TIPO_CLIENTE` INT NOT NULL,
  `ID_CLIENTE` INT NOT NULL,
  `ID_SHOPNOW` INT,
   PRIMARY KEY (`ID_FORNECEDOR`, `ID_PEDIDO`, `ID_PRODUTO`, `ID_SELLER`, `ID_CANAL_VENDA`, `ID_AVALIACAO`, `ID_MEIO_PAGAMENTO`, `ID_ENTREGA`, `ID_CANCELAMENTO`, `ID_TIPO_CLIENTE`, `ID_CLIENTE`),
  INDEX `fk_FATO_VENDA_DIM_FORNECEDOR_idx` (`ID_FORNECEDOR` ASC) VISIBLE,
  INDEX `fk_FATO_VENDA_DIM_PEDIDO1_idx` (`ID_PEDIDO` ASC) VISIBLE,
  INDEX `fk_FATO_VENDA_DIM_PRODUTO1_idx` (`ID_PRODUTO` ASC) VISIBLE,
  INDEX `fk_FATO_VENDA_DIM_SELLER1_idx` (`ID_SELLER` ASC) VISIBLE,
  INDEX `fk_FATO_VENDA_DIM_CANAL_VENDA1_idx` (`ID_CANAL_VENDA` ASC) VISIBLE,
  INDEX `fk_FATO_VENDA_DIM_AVALIACAO1_idx` (`ID_AVALIACAO` ASC) VISIBLE,
  INDEX `fk_FATO_VENDA_DIM_MEIO_PAGAMENTO1_idx` (`ID_MEIO_PAGAMENTO` ASC) VISIBLE,
  INDEX `fk_FATO_VENDA_DIM_ENTREGA1_idx` (`ID_ENTREGA` ASC) VISIBLE,
  INDEX `fk_FATO_VENDA_DIM_CANCELAMENTO1_idx` (`ID_CANCELAMENTO` ASC) VISIBLE,
  INDEX `fk_FATO_VENDA_DIM_TIPO_CLIENTE1_idx` (`ID_TIPO_CLIENTE` ASC) VISIBLE,
  INDEX `fk_FATO_VENDA_DIM_CLIENTE1_idx` (`ID_CLIENTE` ASC) VISIBLE,
    CONSTRAINT `fk_FATO_VENDA_DIM_FORNECEDOR`
    FOREIGN KEY (`ID_FORNECEDOR`)
    REFERENCES `shopnow`.`DIM_FORNECEDOR` (`ID_FORNECEDOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_VENDA_DIM_PEDIDO1`
    FOREIGN KEY (`ID_PEDIDO`)
    REFERENCES `shopnow`.`DIM_PEDIDO` (`ID_PEDIDO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_VENDA_DIM_PRODUTO1`
    FOREIGN KEY (`ID_PRODUTO`)
    REFERENCES `shopnow`.`DIM_PRODUTO` (`ID_PRODUTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_VENDA_DIM_SELLER1`
    FOREIGN KEY (`ID_SELLER`)
    REFERENCES `shopnow`.`DIM_SELLER` (`ID_SELLER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_VENDA_DIM_CANAL_VENDA1`
    FOREIGN KEY (`ID_CANAL_VENDA`)
    REFERENCES `shopnow`.`DIM_CANAL_VENDA` (`ID_CANAL_VENDA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_VENDA_DIM_AVALIACAO1`
    FOREIGN KEY (`ID_AVALIACAO`)
    REFERENCES `shopnow`.`DIM_AVALIACAO` (`ID_AVALIACAO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_VENDA_DIM_MEIO_PAGAMENTO1`
    FOREIGN KEY (`ID_MEIO_PAGAMENTO`)
    REFERENCES `shopnow`.`DIM_MEIO_PAGAMENTO` (`ID_MEIO_PAGAMENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_VENDA_DIM_ENTREGA1`
    FOREIGN KEY (`ID_ENTREGA`)
    REFERENCES `shopnow`.`DIM_ENTREGA` (`ID_ENTREGA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_VENDA_DIM_CANCELAMENTO1`
    FOREIGN KEY (`ID_CANCELAMENTO`)
    REFERENCES `shopnow`.`DIM_CANCELAMENTO` (`ID_CANCELAMENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_VENDA_DIM_TIPO_CLIENTE1`
    FOREIGN KEY (`ID_TIPO_CLIENTE`)
    REFERENCES `shopnow`.`DIM_TIPO_CLIENTE` (`ID_TIPO_CLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_VENDA_DIM_CLIENTE1`
    FOREIGN KEY (`ID_CLIENTE`)
    REFERENCES `shopnow`.`DIM_CLIENTE` (`ID_CLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE `DIM_AVALIACAO` ADD INDEX `A_id_index` (`ID_SHOPNOW`);
ALTER TABLE `DIM_CANAL_VENDA` ADD INDEX `X_id_index` (`ID_SHOPNOW`);
ALTER TABLE `DIM_CANCELAMENTO` ADD INDEX `XX_id_index` (`ID_SHOPNOW`);
ALTER TABLE `DIM_CLIENTE` ADD INDEX `FD_id_index` (`ID_SHOPNOW`);
ALTER TABLE `DIM_ENTREGA` ADD INDEX `FDFG_id_index` (`ID_SHOPNOW`);
ALTER TABLE `DIM_FORNECEDOR` ADD INDEX `GVD_id_index` (`ID_SHOPNOW`);
ALTER TABLE `DIM_MEIO_PAGAMENTO` ADD INDEX `FDFA_id_index` (`ID_SHOPNOW`);
ALTER TABLE `DIM_PEDIDO` ADD INDEX `FDFSD_id_index` (`ID_SHOPNOW`);
ALTER TABLE `DIM_PRODUTO` ADD INDEX `VHGJ_id_index` (`ID_SHOPNOW`);
ALTER TABLE `DIM_SELLER` ADD INDEX `ADFG_id_index` (`ID_SHOPNOW`);
ALTER TABLE `DIM_TIPO_CLIENTE` ADD INDEX `GDFG_id_index` (`ID_SHOPNOW`);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
