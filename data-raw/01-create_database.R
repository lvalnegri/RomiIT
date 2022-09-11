###############################################
# Create databases and tables in MySQL server #
###############################################

library(Rfuns)

dbn <- 'it_omi'
dd_create_db(dbn)

## TABLE <COMUNI> ---------------------
x <- "
    `CMN` CHAR(6) NOT NULL,
    `catasto` CHAR(4) NOT NULL,
    `nazionale` CHAR(4) NOT NULL,
    `CMNd` CHAR(50) NOT NULL,
    `PRVs` CHAR(2) NOT NULL,
    `RGNd` CHAR(1) NOT NULL,
    `RPTd` CHAR(10) NOT NULL,
    `termine` SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`),
    UNIQUE KEY `catasto` (`catasto`),
    KEY `PRVs` (`PRVs`)
"
dd_create_dbtable('comuni', dbn, x)

## TABLE <ZONE> ---------------------
x <- "
    `catasto` CHAR(4) NOT NULL,
    `OMI` CHAR(8) NOT NULL,
    `OMIk` CHAR(10) NOT NULL,
    `OMId` VARCHAR(140) NOT NULL,
    `fascia` CHAR(1) NOT NULL,
    `zona` CHAR(4) NOT NULL,
    `cod_prev` TINYINT UNSIGNED NOT NULL,
    `stato_prev` CHAR(1) NOT NULL,
    `microzona` TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (`OMI`),
    UNIQUE KEY `OMIk` (`OMIk`),
    KEY `catasto` (`catasto`),
    KEY `fascia` (`fascia`),
    KEY `zona` (`zona`),
    KEY `cod_prev` (`cod_prev`),
    KEY `stato_prev` (`stato_prev`),
    KEY `microzona` (`microzona`)
"
dd_create_dbtable('zone', dbn, x)

## TABLE <USO_PREVALENTE> ---------------
x <- "
    `codice` TINYINT UNSIGNED NOT NULL,
    `descrizione` CHAR(30) NOT NULL,
    `gruppo` CHAR(20) NULL DEFAULT NULL,
    `ordine` TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (`codice`),
    UNIQUE KEY `ordine` (`ordine`)
"
dd_create_dbtable('uso_prevalente', dbn, x)

## TABLE <TIPI_QUOTE> ---------------
x <- "
    `` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `` CHAR(12) NOT NULL,
    `` CHAR(7) NULL DEFAULT NULL,
    `` VARCHAR(50) NOT NULL,
    `` DECIMAL(10,8) NOT NULL,
    `` TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (``, ``),
    UNIQUE KEY `nome_key` (``),
    KEY `nome_key` (``)
"
dd_create_dbtable('', dbn, x)

## TABLE <TIPI_TRANS> ---------------
x <- "
    `` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `` CHAR(12) NOT NULL,
    `` CHAR(7) NULL DEFAULT NULL,
    `` VARCHAR(50) NOT NULL,
    `` DECIMAL(10,8) NOT NULL,
    `` TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (``, ``),
    UNIQUE KEY `nome_key` (``),
    KEY `nome_key` (``)
"
dd_create_dbtable('', dbn, x)

## TABLE <QUOTAZIONI> ---------------
x <- "
    `` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `` CHAR(12) NOT NULL,
    `` CHAR(7) NULL DEFAULT NULL,
    `` VARCHAR(50) NOT NULL,
    `` DECIMAL(10,8) NOT NULL,
    `` TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (``, ``),
    UNIQUE KEY `nome_key` (``),
    KEY `nome_key` (``)
"
dd_create_dbtable('', dbn, x)

## TABLE <TRANSAZIONI> --------------
x <- "
    `` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `` CHAR(12) NOT NULL,
    `` CHAR(7) NULL DEFAULT NULL,
    `` VARCHAR(50) NOT NULL,
    `` DECIMAL(10,8) NOT NULL,
    `` TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (``, ``),
    UNIQUE KEY `nome_key` (``),
    KEY `nome_key` (``)
"
dd_create_dbtable('', dbn, x)

## END --------------------------------
rm(list = ls())
gc()
