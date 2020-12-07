CREATE TABLE RAPATRIMENT
   (
    NUMRAPATRIMENT int4 NOT NULL  ,
    NUMSINISTRE int4 NOT NULL  ,
    COMPAGNIE varchar(20) NULL  ,
    COUT int4 NULL  ,
    VILLE_DEPART varchar(32) NULL  ,
    VILLE_ARRIVE varchar(32) NULL  ,
    HEURE_DEPART time NULL  ,
    HEURE_ARRIVE time NULL  
,   CONSTRAINT PK_RAPATRIMENT PRIMARY KEY (NUMRAPATRIMENT)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RAPATRIMENT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RAPATRIMENT_SINISTRE
     ON RAPATRIMENT (NUMSINISTRE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : MARQUE
-- -----------------------------------------------------------------------------

CREATE TABLE MARQUE
   (
    NUMINSEE int4 NOT NULL  ,
    RAISONSOCIAL varchar(32) NULL  
,   CONSTRAINT PK_MARQUE PRIMARY KEY (NUMINSEE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : GARAGE
-- -----------------------------------------------------------------------------

CREATE TABLE GARAGE
   (
    NUMGARAGE int4 NOT NULL  ,
    NOMGARAGE varchar(32) NULL  ,
    ADRESSEGARAGE varchar(32) NULL  ,
    TELEPHONEGARAGE varchar(32) NULL  ,
    FORFAIT int4 NULL  ,
    AVANCE int4 NULL  
,   CONSTRAINT PK_GARAGE PRIMARY KEY (NUMGARAGE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : COMPAGIE_TRANSPORT
-- -----------------------------------------------------------------------------
~

CREATE TABLE COMPAGIE_TRANSPORT
   (
    NUMINSEE int4 NOT NULL  ,
    RAISONSOCIAL varchar(50) NULL  
,   CONSTRAINT PK_COMPAGIE_TRANSPORT PRIMARY KEY (NUMINSEE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : VEHICULE
-- -----------------------------------------------------------------------------
~

CREATE TABLE VEHICULE
   (
    IMMATRICULATION varchar(25) NOT NULL  ,
    NUMADHERENT int4 NOT NULL  ,
    IDTYPECONTRAT int4 NOT NULL  ,
    NUMINSEE int4 NOT NULL  ,
    TYPE varchar(20) NULL  ,
    MODELE varchar(20) NULL  ,
    DATEMISEENCIRCULATION varchar(25) NULL  
,   CONSTRAINT PK_VEHICULE PRIMARY KEY (IMMATRICULATION)
   );~


-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE VEHICULE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_VEHICULE_ADHERENT
     ON VEHICULE (NUMADHERENT)~

    ;

CREATE  INDEX I_FK_VEHICULE_TYPECONTRAT
     ON VEHICULE (IDTYPECONTRAT)
    ;

CREATE  INDEX I_FK_VEHICULE_MARQUE
     ON VEHICULE (NUMINSEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : TECHNICIENASSISTANCE
-- -----------------------------------------------------------------------------

CREATE TABLE TECHNICIENASSISTANCE
   (
    IDTA int4 NOT NULL  ,
    NOMTA varchar(32) NULL  ,
    PRENOMTA varchar(32) NULL  
,   CONSTRAINT PK_TECHNICIENASSISTANCE PRIMARY KEY (IDTA)
   );

-- -----------------------------------------------------------------------------
--       TABLE : HOTEL
-- -----------------------------------------------------------------------------

CREATE TABLE HOTEL
   (
    NUMHOTEL int4 NOT NULL  ,
    NOMHOTEL varchar(32) NULL  ,
    ADRESSEHOTEL varchar(32) NULL  ,
    TELEPHONEHOTEL varchar(16) NULL  ,
    PRIXH int4 NULL  
,   CONSTRAINT PK_HOTEL PRIMARY KEY (NUMHOTEL)
   );

-- -----------------------------------------------------------------------------
--       TABLE : ADHERENT
-- -----------------------------------------------------------------------------

CREATE TABLE ADHERENT
   (
    NUMADHERENT int4 NOT NULL  ,
    NOMADHERENT varchar(32) NULL  ,
    PRENOMADHERENT varchar(32) NULL  ,
    ADRESSEADHERENT varchar(32) NULL  ,
    CODEPOSTALADHERENT varchar(32) NULL  ,
    VILLEADHERENT varchar(32) NULL  ,
    TELEPHONEADHERENT varchar(32) NULL  
,   CONSTRAINT PK_ADHERENT PRIMARY KEY (NUMADHERENT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : TYPECONTRAT
-- -----------------------------------------------------------------------------

CREATE TABLE TYPECONTRAT
   (
    IDTYPECONTRAT int4 NOT NULL  ,
    NOMTYPECONTRAT varchar(16) NULL  
,   CONSTRAINT PK_TYPECONTRAT PRIMARY KEY (IDTYPECONTRAT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : SINISTRE
-- -----------------------------------------------------------------------------

CREATE TABLE SINISTRE
   (
    NUMSINISTRE int4 NOT NULL  ,
    IDTA int4 NOT NULL  ,
    IMMATRICULATION char(9) NOT NULL  ,
    NUMGARAGE int4 NOT NULL  ,
    DATESINISTRE date NULL  ,
    HEURESINISTRE time NULL  ,
    CAUSESINISTRE varchar(100) NULL  ,
    DIAGNOSTICSINISTRE varchar(100) NULL  ,
    LIEUSINISTRE varchar(100) NULL  ,
    NBPERSONNE int4 NULL  
,   CONSTRAINT PK_SINISTRE PRIMARY KEY (NUMSINISTRE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE SINISTRE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_SINISTRE_TECHNICIENASSIST
     ON SINISTRE (IDTA)
    ;

CREATE  INDEX I_FK_SINISTRE_VEHICULE
     ON SINISTRE (IMMATRICULATION)
    ;

CREATE  INDEX I_FK_SINISTRE_GARAGE
     ON SINISTRE (NUMGARAGE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : RAPATRIER
-- -----------------------------------------------------------------------------

CREATE TABLE RAPATRIER
   (
    NUMRAPATRIMENT int4 NOT NULL  ,
    NUMINSEE int4 NOT NULL  
,   CONSTRAINT PK_RAPATRIER PRIMARY KEY (NUMRAPATRIMENT, NUMINSEE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RAPATRIER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RAPATRIER_RAPATRIMENT
     ON RAPATRIER (NUMRAPATRIMENT)
    ;

CREATE  INDEX I_FK_RAPATRIER_COMPAGIE_TRANSP
     ON RAPATRIER (NUMINSEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : AVOIR
-- -----------------------------------------------------------------------------

CREATE TABLE AVOIR
   (
    NUMGARAGE_1 int4 NOT NULL  ,
    NUMGARAGE int4 NOT NULL  ,
    NUMINSEE int4 NOT NULL  
,   CONSTRAINT PK_AVOIR PRIMARY KEY (NUMGARAGE_1)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE AVOIR
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_AVOIR_GARAGE
     ON AVOIR (NUMGARAGE)
    ;

CREATE  INDEX I_FK_AVOIR_MARQUE
     ON AVOIR (NUMINSEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : HÉBERGER
-- -----------------------------------------------------------------------------

CREATE TABLE HÉBERGER
   (
    NUMSINISTRE int4 NOT NULL  ,
    NUMHOTEL int4 NOT NULL  ,
    NBNUITS int4 NULL  
,   CONSTRAINT PK_HÉBERGER PRIMARY KEY (NUMSINISTRE, NUMHOTEL)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE HÉBERGER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_HÉBERGER_SINISTRE
     ON HÉBERGER (NUMSINISTRE)
    ;

CREATE  INDEX I_FK_HÉBERGER_HOTEL
     ON HÉBERGER (NUMHOTEL)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE RAPATRIMENT ADD 
     CONSTRAINT FK_RAPATRIMENT_SINISTRE
          FOREIGN KEY (NUMSINISTRE)
               REFERENCES SINISTRE (NUMSINISTRE);

ALTER TABLE VEHICULE ADD 
     CONSTRAINT FK_VEHICULE_ADHERENT
          FOREIGN KEY (NUMADHERENT)
               REFERENCES ADHERENT (NUMADHERENT);

ALTER TABLE VEHICULE ADD 
     CONSTRAINT FK_VEHICULE_TYPECONTRAT
          FOREIGN KEY (IDTYPECONTRAT)
               REFERENCES TYPECONTRAT (IDTYPECONTRAT);

ALTER TABLE VEHICULE ADD 
     CONSTRAINT FK_VEHICULE_MARQUE
          FOREIGN KEY (NUMINSEE)
               REFERENCES MARQUE (NUMINSEE);

ALTER TABLE SINISTRE ADD 
     CONSTRAINT FK_SINISTRE_TECHNICIENASSISTANCE
          FOREIGN KEY (IDTA)
               REFERENCES TECHNICIENASSISTANCE (IDTA);

ALTER TABLE SINISTRE ADD 
     CONSTRAINT FK_SINISTRE_VEHICULE
          FOREIGN KEY (IMMATRICULATION)
               REFERENCES VEHICULE (IMMATRICULATION);

ALTER TABLE SINISTRE ADD 
     CONSTRAINT FK_SINISTRE_GARAGE
          FOREIGN KEY (NUMGARAGE)
               REFERENCES GARAGE (NUMGARAGE);

ALTER TABLE RAPATRIER ADD 
     CONSTRAINT FK_RAPATRIER_RAPATRIMENT
          FOREIGN KEY (NUMRAPATRIMENT)
               REFERENCES RAPATRIMENT (NUMRAPATRIMENT);

ALTER TABLE RAPATRIER ADD 
     CONSTRAINT FK_RAPATRIER_COMPAGIE_TRANSPORT
          FOREIGN KEY (NUMINSEE)
               REFERENCES COMPAGIE_TRANSPORT (NUMINSEE);

ALTER TABLE AVOIR ADD 
     CONSTRAINT FK_AVOIR_GARAGE
          FOREIGN KEY (NUMGARAGE)
               REFERENCES GARAGE (NUMGARAGE);

ALTER TABLE AVOIR ADD 
     CONSTRAINT FK_AVOIR_GARAGE1
          FOREIGN KEY (NUMGARAGE_1)
               REFERENCES GARAGE (NUMGARAGE);

ALTER TABLE AVOIR ADD 
     CONSTRAINT FK_AVOIR_MARQUE
          FOREIGN KEY (NUMINSEE)
               REFERENCES MARQUE (NUMINSEE);

ALTER TABLE HÉBERGER ADD 
     CONSTRAINT FK_HÉBERGER_SINISTRE
          FOREIGN KEY (NUMSINISTRE)
               REFERENCES SINISTRE (NUMSINISTRE);

ALTER TABLE HÉBERGER ADD 
     CONSTRAINT FK_HÉBERGER_HOTEL
          FOREIGN KEY (NUMHOTEL)
               REFERENCES HOTEL (NUMHOTEL);
