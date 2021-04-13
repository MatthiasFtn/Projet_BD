pragma foreign_keys=true;

.open Projet_Croisiere.db
.mode columns
.width 10 10 10 10 10 10
.headers on

DROP TABLE IF EXISTS Batiments;
DROP TABLE IF EXISTS Compagnies;
DROP TABLE IF EXISTS Rangs;
DROP TABLE IF EXISTS Chambres;
DROP TABLE IF EXISTS Clients ;
DROP TABLE IF EXISTS Reservations;
DROP TABLE IF EXISTS Factures;
DROP TABLE IF EXISTS Activites;
DROP TABLE IF EXISTS Notes;


CREATE TABLE Batiments(
	id_batiment INTEGER not null,
	nom_batiment VARCHAR(30) not null,
	superficie INT not null,
		
	id_compagnie INTEGER,

	CONSTRAINT pk_batiment primary key (id_batiment)


	CONSTRAINT fk_batiment
	FOREIGN KEY (id_compagnie) REFERENCES Compagnies(id_compagnie) 
	
);


CREATE TABLE Compagnies(
	id_compagnie INTEGER not null,
	nom_compagnie VARCHAR(30) not null,

	id_batiment INTEGER,

	CONSTRAINT pk_compagnie primary key (id_compagnie,nom_compagnie, id_batiment)

	CONSTRAINT fk_compagnie
	FOREIGN KEY (id_batiment) REFERENCES Batiments(id_batiment)
);




-- CREATE TABLE Chambres(
-- 	id_chambre INTEGER not null,
-- 	capacite INT not null CHECK (capacite BETWEEN 2 AND 5),
	
-- 	id_rang INT,

-- 	CONSTRAINT pk_chambre primary key (id_chambre, id_rang)

-- 	CONSTRAINT fk_chambre
-- 	FOREIGN KEY (id_rang) REFERENCES Rangs(id_rang)
	
-- );


CREATE TABLE Clients (
	id_client INTEGER not null,
	nom VARCHAR(30) not null,
	prenom VARCHAR(30) not null, 
	age INT not null CHECK (age >= 18), 
	sexe VARCHAR(5) not null CHECK (sexe = 'homme' or sexe = 'femme'),
	id_rang INT,
	id_batiment INT,

	CONSTRAINT pk_client primary key (id_client)

	CONSTRAINT fk_client
	FOREIGN KEY (id_rang) REFERENCES Rangs(id_rang)
	FOREIGN KEY (id_batiment) REFERENCES Batiments(id_batiment)
	
);




CREATE TABLE Rangs(
	id_rang INTEGER not null,
	type_rang VARCHAR(20) not null CHECK (type_rang = 'Interieur' OR type_rang ='Vue mer' OR type_rang = 'Vue balcon' OR type_rang = 'Suite'),
	prix INT CHECK (prix > 0),

	CONSTRAINT pk_rang primary key (id_rang)


);


CREATE TABLE Reservations(
	id_reservation INTEGER not null,
	date_debut DATE not null,
	date_fin DATE not null CHECK (date_fin > date_debut),
	h_reservation TIME not null,

	id_client INTEGER,

	CONSTRAINT pk_reservation primary key (id_reservation)

	CONSTRAINT fk_reservation
	FOREIGN KEY (id_client) REFERENCES Clients(id_client)

);



CREATE TABLE Factures(
	id_facture INTEGER  not null,
	date_facture DATE not null,
	h_facture TIME not null,

	id_client INT,

	CONSTRAINT pk_facture primary key (id_facture)

	CONSTRAINT fk_facture
	FOREIGN KEY (id_client) REFERENCES Clients(id_client)

);



CREATE TABLE Activites(
	id_activite INTEGER not null,
	nom_activite VARCHAR(30) not null,
	jour_activite VARCHAR(10) CHECK (jour_activite = 'Lundi' or jour_activite = 'Mardi' or jour_activite = 'Mercredi' or jour_activite = 'Jeudi' or jour_activite = 'Vendredi' or jour_activite = 'Samedi' or jour_activite = 'Dimanche'), 
	h_debut_activite TIME not null,
	h_fin_activite TIME not null CHECK (h_fin_activite > h_debut_activite),


	CONSTRAINT pk_activite primary key (id_activite)

);

CREATE TABLE Notes(
	id_note INTEGER not null,
	note INT CHECK ( note >=0 AND note <= 5),
	
	id_batiment INTEGER,
	
	CONSTRAINT pk_note primary key (id_note)

	CONSTRAINT fk_note
	FOREIGN KEY (id_batiment) REFERENCES Batiments(id_batiment) 
);





