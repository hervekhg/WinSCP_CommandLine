#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

#use ccotest;
drop database if exists ccotest;
create database ccotest;
use ccotest;

CREATE TABLE Env(
        nom_env      Varchar (16) NOT NULL ,
        jira         Int ,
        instance     Varchar (2) ,
        id_auto      int (11) Auto_increment  ,
		loc          Varchar(3),
        d_enrg timestamp default current_timestamp,
        nom_master   Varchar (25) ,
        PRIMARY KEY (id_auto, d_enrg) ,
        INDEX (id_auto )
)ENGINE=InnoDB;


CREATE TABLE App(
        nom_app            Varchar (16) NOT NULL ,
        mode               Varchar (4) ,
        commentaire        Text ,
        cycle              Date ,
        cyclique           Varchar (3) ,
        type_periodicite   Varchar (11) ,
        heure_debut        Time ,
        heure_fin          Time ,
        liens_vers         Text ,
        liens_de           Text ,
        ne_pas_deplanifier Varchar (3) ,
        nom_env            Varchar (16) ,
        nom_date           Varchar (16) ,
		loc                Varchar(3),
		id_auto            int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp ,
        PRIMARY KEY (id_auto, d_enrg) 
)ENGINE=InnoDB;


CREATE TABLE Queue(
        queue   Varchar (16) NOT NULL ,
		loc     Varchar(3),
        id_auto int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp,
        PRIMARY KEY (id_auto, d_enrg) 
)ENGINE=InnoDB;


CREATE TABLE User(
        nom_user Varchar (16) NOT NULL ,
		loc      Varchar(3),
        id_auto  int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp ,
        PRIMARY KEY (id_auto, d_enrg) ,
        INDEX (id_auto )
)ENGINE=InnoDB;


CREATE TABLE Date_exploitation(
        nom_date    Varchar (16) NOT NULL ,
        type        Varchar (12) ,
        valeur      Date ,
        rattrapage Varchar (3) ,
		loc         Varchar(3),
        id_auto     int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp,
        PRIMARY KEY (id_auto, d_enrg) ,
        INDEX (id_auto )
)ENGINE=InnoDB;


CREATE TABLE Planning(
        nom_pla          Varchar (16) NOT NULL ,
        jour_semaine     Varchar (7) ,
        jour_mois        Varchar (31) ,
        semaine_mois     Varchar (5) ,
        formule          Text ,
        verifie_planning Varchar (3) ,
        verifie_formule  Varchar (3) ,
        nom_cal          Varchar (16) ,
        nom_jeton        Varchar (16) ,
        nom_period       Varchar (16) ,
		loc              Varchar(3),
		id_auto         int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp,
        PRIMARY KEY (id_auto, d_enrg) ,
        INDEX (id_auto )
)ENGINE=InnoDB;


CREATE TABLE Suivi_Ano(
        jira         Int ,
        ccx          Varchar (3) ,
		uo  		 Varchar(50),
        id           Varchar (6) ,
        plateforme   Varchar (20) ,
        severite     Varchar (20) ,
        titre        text ,
        auteur       Varchar (50) ,
        d_creation   Date ,
		cause        Text ,
		anomalie     Varchar(1),
		commentaire	 text,
		d_correction Date,
		liv_correction Varchar(15),
		developpeur  Varchar (17) ,
        testeur      Varchar (17) ,
        id_auto      int (5) Auto_increment  NOT NULL ,
        d_enrg timestamp default current_timestamp,
        PRIMARY KEY (id_auto) 
)ENGINE=InnoDB;


CREATE TABLE Inducteur_valeur(
        ccx           Varchar (3) ,
        nom           Varchar (50) ,
        nb_jobs       Int ,
        environnement Varchar (12) ,
        technologie   Varchar (20) ,
        nb_machines   Int ,
        nb_fichiers   Int ,
        nb_ressources Int ,
        date_env      date ,
        liste_env     Text ,
        total         Int ,
        id_auto       int (4) Auto_increment  NOT NULL ,
        d_enrg timestamp default current_timestamp,
        PRIMARY KEY (id_auto, d_enrg) 
)ENGINE=InnoDB;


CREATE TABLE Res(
        nom_res  Varchar (16) NOT NULL ,
        type     Varchar (10) ,
        valeur   Text ,
        courante Int ,
        piles    Int ,
        pile_x   Text ,
		loc          Varchar(3),
        id_auto  int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp ,
        PRIMARY KEY (id_auto, d_enrg) ,
        INDEX (id_auto )
)ENGINE=InnoDB;


CREATE TABLE Machine(
        nom_mac   Varchar (16) NOT NULL ,
        real_name Varchar (16) ,
        port      Int ,
		loc       Varchar(3),
        id_auto   int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp ,
        PRIMARY KEY (id_auto, d_enrg),
        INDEX (id_auto )
)ENGINE=InnoDB;


CREATE TABLE Job(
        nom_job                      Varchar (16) NOT NULL ,
        mode                         Varchar (4) ,
        commentaire                  Text ,
        cycle                        Date ,
        cyclique                     Varchar (3) ,
        type_periodicite             Varchar (11) ,
        heure_debut                  Time ,
        heure_fin                    Time ,
        liens_vers                   Text ,
        liens_de                     Text ,
        ne_pas_deplanifier           Varchar (3) ,
        script                       Text ,
        nombre_relance               Int ,
        rattrapage_type              Varchar (12) ,
        mettre_application_en_erreur Varchar (3) ,
        bloquer_la_date              Varchar (3) ,
        nom_app                      Varchar (16) ,
        nom_pla                      Varchar (16) ,
        nom_user                     Varchar (16) ,
        queue                        Varchar (16) ,
        nom_date                     Varchar (16) ,
        nom_mac                      Varchar (16) ,
		loc                          Varchar(3),
		id_auto                      int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp ,
        PRIMARY KEY (id_auto, d_enrg) , 
        INDEX (id_auto )
)ENGINE=InnoDB;


CREATE TABLE Inducteur_poids(
        ccx           Varchar (3) ,
        nom           Varchar (50) ,
        nb_jobs       Int ,
        environnement Int ,
        technologie   Int ,
        nb_machines   Int ,
        nb_fichiers   Int ,
        nb_ressources Int ,
        total         Int ,
        complexite    Text ,
        id_auto       int (4) Auto_increment  NOT NULL ,
        d_enrg timestamp default current_timestamp ,
        PRIMARY KEY (id_auto, d_enrg)
)ENGINE=InnoDB;


CREATE TABLE Calendrier(
        nom_cal      Varchar (16) NOT NULL ,
        jour_semaine Varchar (7) ,
        jour_cal     Varchar (365) ,
		loc          Varchar(3),
        id_auto      int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp,
        PRIMARY KEY (id_auto, d_enrg) ,
        INDEX (id_auto )
)ENGINE=InnoDB;


CREATE TABLE Master(
        nom_master Varchar (200) NOT NULL ,
		description varchar (50),
		loc          Varchar(3),
        id_auto    int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp,
        PRIMARY KEY (id_auto, d_enrg) ,
		INDEX (id_auto)
)ENGINE=InnoDB;


CREATE TABLE Suivi_Jira(
        jira        Int NOT NULL ,
        ccx         Varchar (3) ,
		rapporteur	Varchar(10),
		d_creation  Date,
		d_pec       Date,
		doc_prev	Varchar(50),
		fai_init    Date,
		fai_valid   Date,
		revue_prev  Date,
		liv_prev    Date,
		entrants    Date,
        revue_reel  Date,
        questions   Date,
        reponses    Date,
        cpe         Varchar (15) ,
		liv_reel    Date,
        nb_avp      Int ,
        ano         Date,
        format      Varchar (30) ,
        liv_ano     Date,
		mep         Date,
        revue_ko    Varchar (30) ,
        mode        Varchar (3) ,
		commentaire Text ,
        id_auto     int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp,
        PRIMARY KEY (jira ) ,
        INDEX (id_auto )
)ENGINE=InnoDB;


CREATE TABLE Jeton(
        nom_jeton Varchar (16) NOT NULL ,
        valeur    Text ,
		loc          Varchar(3),
        id_auto   int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp ,
        PRIMARY KEY (nom_jeton ) ,
        INDEX (id_auto )
)ENGINE=InnoDB;


CREATE TABLE Period(
        nom_period  Varchar (16) NOT NULL ,
        commentaire Text ,
        superiods   Varchar (25) ,
		loc          Varchar(3),
        id_auto     int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp,
        PRIMARY KEY (id_auto, d_enrg),
		INDEX (id_auto)
)ENGINE=InnoDB;


CREATE TABLE ContenirJob(
		nom_job Varchar (16) NOT NULL ,
		nom_res Varchar (16) NOT NULL ,
        Infos   Varchar (50) ,
		loc          Varchar(3),
        id_auto int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp,
        PRIMARY KEY (id_auto, d_enrg) ,
		INDEX (id_auto)
)ENGINE=InnoDB;


CREATE TABLE ContenirApp(
		nom_app Varchar (16) NOT NULL ,
		nom_res Varchar (16) NOT NULL ,
        Infos   Varchar (50) ,
		loc     Varchar(3),
        id_auto int (11) Auto_increment  ,
        d_enrg timestamp default current_timestamp,
        PRIMARY KEY (id_auto, d_enrg) ,
		INDEX(id_auto)
)ENGINE=InnoDB;


CREATE TABLE Perimetre(
        id        Int NOT NULL ,
        ccx    Varchar (3) ,
        uo    Varchar (50) ,
        repartion Varchar (3) ,
		indice	  int(2),
		complexite Varchar(20),
		actif		Varchar(1),
		

        Juin_2010 Varchar (4) ,
        Juil_2010 Varchar (4) ,
        Aout_2010 Varchar (4) ,
        Sept_2010 Varchar (4) ,
        Oct_2010  Varchar (4) ,
        Nov_2010  Varchar (4) ,
        Dec_2010  Varchar (4) ,


        Jan_2011  Varchar (4) ,
        Fev_2011  Varchar (4) ,
        Mar_2011  Varchar (4) ,
        Avr_2011  Varchar (4) ,
        Mai_2011  Varchar (4) ,
        Juin_2011 Varchar (4) ,
        Juil_2011 Varchar (4) ,
        Aout_2011 Varchar (4) ,
        Sept_2011 Varchar (4) ,
        Oct_2011  Varchar (4) ,
        Nov_2011  Varchar (4) ,
        Dec_2011  Varchar (4) ,

        Jan_2012  Varchar (4) ,
        Fev_2012  Varchar (4) ,
        Mar_2012  Varchar (4) ,
        Avr_2012  Varchar (4) ,
        Mai_2012  Varchar (4) ,
        Juin_2012 Varchar (4) ,
        Juil_2012 Varchar (4) ,
        Aout_2012 Varchar (4) ,
        Sept_2012 Varchar (4) ,
        Oct_2012  Varchar (4) ,
        Nov_2012  Varchar (4) ,
        Dec_2012  Varchar (4) ,

		Jan_2013  Varchar (4) ,
        Fev_2013  Varchar (4) ,
        Mar_2013  Varchar (4) ,
        Avr_2013  Varchar (4) ,
        Mai_2013  Varchar (4) ,
        Juin_2013 Varchar (4) ,
        Juil_2013 Varchar (4) ,
        Aout_2013 Varchar (4) ,
        Sept_2013 Varchar (4) ,
        Oct_2013  Varchar (4) ,
        Nov_2013  Varchar (4) ,
        Dec_2013  Varchar (4) ,

        Jan_2014  Varchar (4) ,
        Fev_2014  Varchar (4) ,
        Mar_2014  Varchar (4) ,
        Avr_2014  Varchar (4) ,
        Mai_2014  Varchar (4) ,
        Juin_2014 Varchar (4) ,
        Juil_2014 Varchar (4) ,
        Aout_2014 Varchar (4) ,
        Sept_2014 Varchar (4) ,
        Oct_2014  Varchar (4) ,
        Nov_2014  Varchar (4) ,
        Dec_2014  Varchar (4) ,


        Jan_2015  Varchar (4) ,
        Fev_2015  Varchar (4) ,
        Mar_2015  Varchar (4) ,
        Avr_2015  Varchar (4) ,
        Mai_2015  Varchar (4) ,
        Juin_2015 Varchar (4) ,
        Juil_2015 Varchar (4) ,
        Aout_2015 Varchar (4) ,
        Sept_2015 Varchar (4) ,
        Oct_2015  Varchar (4) ,
        Nov_2015  Varchar (4) ,
        Dec_2015  Varchar (4) ,


        Jan_2016  Varchar (4) ,
        Fev_2016  Varchar (4) ,
        Mar_2016  Varchar (4) ,
        Avr_2016  Varchar (4) ,
        Mai_2016  Varchar (4) ,
        Juin_2016 Varchar (4) ,
        Juil_2016 Varchar (4) ,
        Aout_2016 Varchar (4) ,
        Sept_2016 Varchar (4) ,
        Oct_2016  Varchar (4) ,
        Nov_2016  Varchar (4) ,
        Dec_2016  Varchar (4) ,

	Jan_2017  Varchar (4) ,
        Fev_2017  Varchar (4) ,
        Mar_2017  Varchar (4) ,
        Avr_2017  Varchar (4) ,
        Mai_2017  Varchar (4) ,
        Juin_2017 Varchar (4) ,
        Juil_2017 Varchar (4) ,
        Aout_2017 Varchar (4) ,
        Sept_2017 Varchar (4) ,
        Oct_2017  Varchar (4) ,
        Nov_2017  Varchar (4) ,
        Dec_2017  Varchar (4) ,

		
		Jan_2018  Varchar (4) ,
        Fev_2018  Varchar (4) ,
        Mar_2018  Varchar (4) ,
        Avr_2018  Varchar (4) ,
        Mai_2018  Varchar (4) ,
        Juin_2018 Varchar (4) ,
        Juil_2018 Varchar (4) ,
        Aout_2018 Varchar (4) ,
        Sept_2018 Varchar (4) ,
        Oct_2018  Varchar (4) ,
        Nov_2018  Varchar (4) ,
        Dec_2018  Varchar (4) ,


		id_auto   int (45) Auto_increment,
        d_enrg timestamp default current_timestamp ,
        PRIMARY KEY (id_auto,d_enrg) 
)ENGINE=InnoDB;
