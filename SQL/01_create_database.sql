CREATE DATABASE IF NOT EXISTS mbo4_exam_database;
USE mbo4_exam_database;

CREATE TABLE bron_intra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_overloop VARCHAR(20),
    huidigjaar_input INT,
    maand INT,
    toerekenen VARCHAR(10),
    profit_center INT,
    segment INT,
    rekening INT,
    bedrag DECIMAL(14,2),
    productjaar INT
);

CREATE TABLE regel_segment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    segment_rule VARCHAR(50) NOT NULL,
    segment_omschrijving VARCHAR(255),
    middel VARCHAR(50),
    grondslag VARCHAR(50),
    grondslag_omschrijving VARCHAR(255)
);

CREATE TABLE regel_vordering (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_overloop_rule VARCHAR(20),
    profit_center_rule VARCHAR(20),
    rekening_rule VARCHAR(50),
    vordering VARCHAR(20)
);

CREATE TABLE regel_resultaat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    geldig_van DATE,
    geldig_tot DATE,
    type_overloop_rule VARCHAR(20),
    rekening_status_rule VARCHAR(50),
    vordering_rule VARCHAR(20),
    middel_rule VARCHAR(50),
    grondslag_rule VARCHAR(50),
    resultaatrek VARCHAR(20),
    component VARCHAR(20),
    plus_rekening_1 VARCHAR(20),
    plus_rekening_2 VARCHAR(20)
);

CREATE TABLE regel_huidigjaar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    geldig_van DATE,
    geldig_tot DATE,
    segment_rule VARCHAR(100),
    productjaar_rule VARCHAR(50),
    maand_rule VARCHAR(50),
    huidigjaar_result INT
);

CREATE TABLE regel_financieel_feit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    geldig_van DATE,
    geldig_tot DATE,
    type_overloop_rule VARCHAR(20),
    toerekening_rule VARCHAR(20),
    beljr_gewijzigd_rule VARCHAR(20),
    financieel_feit VARCHAR(50)
);

CREATE TABLE eindresultaat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bron_id INT,
    type_overloop VARCHAR(20),
    huidigjaar INT,
    maand INT,
    toerekenen VARCHAR(10),
    profit_center INT,
    segment INT,
    rekening INT,
    bedrag DECIMAL(14,2),
    productjaar INT,
    vordering VARCHAR(20),
    middel VARCHAR(50),
    grondslag VARCHAR(50),
    resultaatrek VARCHAR(20),
    component VARCHAR(20),
    plus_rekening_1 VARCHAR(20),
    plus_rekening_2 VARCHAR(20),
    financieel_feit VARCHAR(50),
    CONSTRAINT fk_eindresultaat_bron
        FOREIGN KEY (bron_id) REFERENCES bron_intra(id)
);