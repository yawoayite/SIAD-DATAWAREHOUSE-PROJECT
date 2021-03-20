--1) MCD
--2) MLD et Script de creation
USE MASTER;
GO
DROP DATABASE BD_TP_SIAD;
GO
CREATE DATABASE BD_TP_SIAD;
GO
USE BD_TP_SIAD;
GO
-- FAIT
CREATE TABLE patient(
	id_patient UNIQUEIDENTIFIER DEFAULT NEWID(),
    nom_patient varchar (200),
    prenom_patient varchar (200),
    sexe_patient char (8),
    age_patient int,
    localite_patient varchar (200),
    CONSTRAINT pk_patient PRIMARY KEY NONCLUSTERED (id_patient)
);
-- FAIT
CREATE TABLE consultation(
	id_consultation UNIQUEIDENTIFIER DEFAULT NEWID(),
    date_consultation date,
    diagnostic varchar (200),
    montant_consultation int,
    numero_bon_consultation int,
	date_bon_c date,
	duree_validite_bon_c int,
    id_patient UNIQUEIDENTIFIER,
    id_praticien UNIQUEIDENTIFIER,
    CONSTRAINT pk_consultation PRIMARY KEY NONCLUSTERED (id_consultation)
);

--fait
CREATE TABLE analyse(
	id_analyse UNIQUEIDENTIFIER DEFAULT NEWID(),
    designation_analyse varchar (200),
	resultat varchar(200),
    test varchar(200),
	date_analyse date,
    id_laboratoire UNIQUEIDENTIFIER,
    id_type_analyse int,
    id_consultation UNIQUEIDENTIFIER,
    id_pathologie int,
    CONSTRAINT pk_analyse PRIMARY KEY NONCLUSTERED (id_analyse)
);
-- FAIT
CREATE TABLE laboratoire(
    id_laboratoire UNIQUEIDENTIFIER DEFAULT NEWID(),
    nom_labo varchar (200),
    adresse_labo varchar (200),
    type_labo varchar (200),
    CONSTRAINT pk_laboratoire PRIMARY KEY NONCLUSTERED (id_laboratoire)
);
-- FAIT
CREATE TABLE type_analyse(
	id_type_analyse int IDENTITY,
    libelle_type_analyse varchar (200),
    CONSTRAINT pk_type_analyse PRIMARY KEY NONCLUSTERED (id_type_analyse)
);
-- FAIT
CREATE TABLE pathologie(
	id_pathologie int IDENTITY,
    libelle_pathologie varchar (200),
    CONSTRAINT pk_pathologie PRIMARY KEY NONCLUSTERED (id_pathologie)
);
--fait
CREATE TABLE reveler(
	id_consultation UNIQUEIDENTIFIER,
    id_pathologie INT,
	apparution_pathologie varchar (200),
	description_pathologie varchar (200),
    CONSTRAINT pk_reveler PRIMARY KEY NONCLUSTERED (id_consultation,id_pathologie)
);
-- FAIT
CREATE TABLE praticien(
	id_praticien UNIQUEIDENTIFIER DEFAULT NEWID(),
    nom_praticien varchar (200),
    prenom_praticien varchar (200),
    id_specialite INT,
	id_grade INT,
    CONSTRAINT pk_praticien PRIMARY KEY NONCLUSTERED (id_praticien)
);
-- FAIT
CREATE TABLE grade(
    id_grade int IDENTITY,
    libelle_grade varchar (200),
    CONSTRAINT pk_grade PRIMARY KEY NONCLUSTERED (id_grade)
);
-- FAIT
CREATE TABLE specialite_medicale(
    id_specialite int IDENTITY,
    libelle_specialite varchar (200),
    CONSTRAINT pk_specialite PRIMARY KEY NONCLUSTERED (id_specialite)
);

CREATE TABLE centre_sanitaire(
    id_centre int IDENTITY,
    nom_centre varchar (200),
    adresse_centre varchar (200),
    CONSTRAINT pk_centre_sanitaire PRIMARY KEY NONCLUSTERED (id_centre)
);

ALTER TABLE consultation ADD id_centre INT;

--praticien
ALTER TABLE praticien ADD CONSTRAINT fk_praticien_specialite FOREIGN KEY (id_specialite) REFERENCES specialite_medicale(id_specialite);
ALTER TABLE praticien  ADD CONSTRAINT fk_praticien_grade FOREIGN KEY (id_grade) REFERENCES grade(id_grade);

--analyse

ALTER TABLE anaLyse ADD CONSTRAINT fk_analyse_laboratoire FOREIGN KEY (id_laboratoire) REFERENCES laboratoire(id_laboratoire);
ALTER TABLE anaLyse ADD CONSTRAINT fk_analyse_type_analyse FOREIGN KEY (id_type_analyse) REFERENCES type_analyse(id_type_analyse);
ALTER TABLE anaLyse ADD CONSTRAINT fk_analyse_consultation FOREIGN KEY (id_consultation) REFERENCES consultation(id_consultation);
ALTER TABLE anaLyse ADD CONSTRAINT fk_analyse_pathologie FOREIGN KEY (id_pathologie) REFERENCES pathologie(id_pathologie);

--reveler
ALTER TABLE reveler ADD CONSTRAINT fk_reveler_consultation FOREIGN KEY (id_consultation) REFERENCES consultation(id_consultation);
ALTER TABLE reveler ADD CONSTRAINT fk_reveler_pathologie FOREIGN KEY (id_pathologie) REFERENCES pathologie(id_pathologie);

--consultation
ALTER TABLE consultation ADD  CONSTRAINT fk_consultation_patient FOREIGN KEY (id_patient) REFERENCES patient(id_patient);
ALTER TABLE consultation ADD  CONSTRAINT fk_consultation_praticien FOREIGN KEY (id_praticien) REFERENCES praticien(id_praticien);

--3) Script d'inssertion

--MISE A JOUR

ALTER TABLE pathologie ADD criticite_pathologie varchar(100);

ALTER TABLE consultation ADD  CONSTRAINT fk_consultation_centre FOREIGN KEY (id_centre) REFERENCES centre_sanitaire(id_centre);
