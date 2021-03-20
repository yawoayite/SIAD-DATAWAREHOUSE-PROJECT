-- 1) MCD
--  SQLINES DEMO *** e creation
CREATE DATABASE BD_CONSULTATION;

USE BD_CONSULTATION;
-- FAIT
CREATE TABLE patient(
	id_patient int AUTO_INCREMENT,
    nom_patient varchar (200),
    prenom_patient varchar (200),
    sexe_patient char (8),
    age_patient int,
    localite_patient varchar (200),
    CONSTRAINT pk_patient PRIMARY KEY (id_patient)
);
-- FAIT
CREATE TABLE consultation(
	id_consultation int AUTO_INCREMENT,
    id_centre int,
    date_consultation date,
    diagnostic varchar (200),
    montant_consultation int,
    numero_bon_consultation int,
	date_bon_c date,
	duree_validite_bon_c int,
    id_patient int,
    id_praticien int,
    CONSTRAINT pk_consultation PRIMARY KEY (id_consultation)
);

-- fait
CREATE TABLE analyses(
	id_analyses int AUTO_INCREMENT,
    designation_analyses varchar (200),
	resultat varchar(200),
    test varchar(200),
	date_analyses date,
    id_laboratoire int,
    id_type_analyses int,
    id_consultation int,
    id_pathologie int,
    CONSTRAINT pk_analyses PRIMARY KEY (id_analyses)
);
-- FAIT
CREATE TABLE laboratoire(
    id_laboratoire int AUTO_INCREMENT,
    nom_labo varchar (200),
    adresse_labo varchar (200),
    type_labo varchar (200),
    CONSTRAINT pk_laboratoire PRIMARY KEY (id_laboratoire)
);
-- FAIT
CREATE TABLE type_analyses(
	id_type_analyses int AUTO_INCREMENT,
    libelle_type_analyses varchar (200),
    CONSTRAINT pk_type_analyses PRIMARY KEY (id_type_analyses)
);
-- FAIT
CREATE TABLE pathologie(
	id_pathologie int AUTO_INCREMENT,
    libelle_pathologie varchar (200),
    criticite_pathologie varchar(100),
    CONSTRAINT pk_pathologie PRIMARY KEY (id_pathologie)
);
-- fait
CREATE TABLE reveler(
	id_consultation int,
    id_pathologie int,
	apparution_pathologie varchar (200),
	description_pathologie varchar (200),
    CONSTRAINT pk_reveler PRIMARY KEY (id_consultation,id_pathologie)
);
-- FAIT
CREATE TABLE praticien(
	id_praticien int AUTO_INCREMENT,
    nom_praticien varchar (200),
    prenom_praticien varchar (200),
    id_specialite int,
	id_grade int,
    CONSTRAINT pk_praticien PRIMARY KEY (id_praticien)
);
-- FAIT
CREATE TABLE grade(
    id_grade int AUTO_INCREMENT,
    libelle_grade varchar (200),
    CONSTRAINT pk_grade PRIMARY KEY (id_grade)
);
-- FAIT
CREATE TABLE specialite_medicale(
    id_specialite int AUTO_INCREMENT,
    libelle_specialite varchar (200),
    CONSTRAINT pk_specialite PRIMARY KEY (id_specialite)
);

-- praticien
ALTER TABLE praticien ADD CONSTRAINT fk_praticien_specialite FOREIGN KEY (id_specialite) REFERENCES specialite_medicale(id_specialite);
ALTER TABLE praticien  ADD CONSTRAINT fk_praticien_grade FOREIGN KEY (id_grade) REFERENCES grade(id_grade);

-- analyses

ALTER TABLE anaLyses ADD CONSTRAINT fk_analyses_laboratoire FOREIGN KEY (id_laboratoire) REFERENCES laboratoire(id_laboratoire);
ALTER TABLE anaLyses ADD CONSTRAINT fk_analyses_type_analyses FOREIGN KEY (id_type_analyses) REFERENCES type_analyses(id_type_analyses);
ALTER TABLE anaLyses ADD CONSTRAINT fk_analyses_consultation FOREIGN KEY (id_consultation) REFERENCES consultation(id_consultation);
ALTER TABLE anaLyses ADD CONSTRAINT fk_analyses_pathologie FOREIGN KEY (id_pathologie) REFERENCES pathologie(id_pathologie);

-- reveler
ALTER TABLE reveler ADD CONSTRAINT fk_reveler_consultation FOREIGN KEY (id_consultation) REFERENCES consultation(id_consultation);
ALTER TABLE reveler ADD CONSTRAINT fk_reveler_pathologie FOREIGN KEY (id_pathologie) REFERENCES pathologie(id_pathologie);

-- consultation
ALTER TABLE consultation ADD  CONSTRAINT fk_consultation_patient FOREIGN KEY (id_patient) REFERENCES patient(id_patient);
ALTER TABLE consultation ADD  CONSTRAINT fk_consultation_praticien FOREIGN KEY (id_praticien) REFERENCES praticien(id_praticien);

--  SQLINES DEMO *** tion

-- MISE A JOUR
CREATE TABLE centre_sanitaire(
    id_centre int AUTO_INCREMENT,
    nom_centre varchar (200),
    adresse_centre varchar (200),
    CONSTRAINT pk_centre_sanitaire PRIMARY KEY (id_centre)
);

ALTER TABLE consultation ADD  CONSTRAINT fk_consultation_centre FOREIGN KEY (id_centre) REFERENCES centre_sanitaire(id_centre);
