pragma foreign_keys=true;

.open Projet_Croisiere.db
.mode columns
.width 20 20 20 20 20 20
.headers on

DROP TABLE IF EXISTS Batiments;
DROP TABLE IF EXISTS Compagnies;
DROP TABLE IF EXISTS Rangs;
DROP TABLE IF EXISTS Chambres;
DROP TABLE IF EXISTS Clients ;
DROP TABLE IF EXISTS Reservations;
DROP TABLE IF EXISTS Factures;
DROP TABLE IF EXISTS Activites;



CREATE TABLE Batiments(
	id_batiment INTEGER not null,
	nom_batiment VARCHAR(30) not null,
	superficie INT not null,
	nb_chambre INT not null,
	note INT CHECK ( note BETWEEN 0 AND 5),

	id_chambre INT,
	id_compagnie INTEGER,

	CONSTRAINT pk_batiment primary key (id_batiment, id_compagnie)


	CONSTRAINT fk_batiment
	FOREIGN KEY (id_chambre) REFERENCES Chambres(id_chambre)
	FOREIGN KEY (id_compagnie) REFERENCES Compagnies(id_compagnie) 
	
);


CREATE TABLE Compagnies(
	id_compagnie INTEGER not null,
	nom_compagnie VARCHAR(30) not null,

	id_batiment INTEGER,


	CONSTRAINT pk_compagnie primary key (id_compagnie, id_batiment)

	CONSTRAINT fk_compagnie
	FOREIGN KEY (id_batiment) REFERENCES Batiments(id_batiment)
);




CREATE TABLE Rangs(
	id_rang INTEGER PRIMARY KEY not null,
	type_rang VARCHAR(20) not null CHECK ( type_rang = 'premium classe' OR type_rang ='premiere classe' OR type_rang = 'seconde classe')

);


CREATE TABLE Chambres(
	id_chambre INTEGER PRIMARY KEY not null,
	capacite INT not null,
	
	id_rang INT,

	CONSTRAINT fk_chambre
	FOREIGN KEY (id_rang) REFERENCES Rangs(id_rang)
	
);


CREATE TABLE Clients (
	id_client INTEGER PRIMARY KEY not null,
	nom VARCHAR(30) not null,
	prenom VARCHAR(30) not null, 
	age INT not null, 
	sexe VARCHAR(5) not null CHECK (sexe = 'homme' or sexe = 'femme'),

	id_reservation INT,

	CONSTRAINT fk_client
	FOREIGN KEY (id_reservation) REFERENCES Reservations(id_reservation)
	
);

CREATE TABLE Reservations(
	id_reservation INTEGER PRIMARY KEY not null,
	date_debut DATE not null,
	date_fin DATE not null CHECK (date_fin > date_debut),
	h_reservation TIME not null,

	id_chambre INT, 
	id_client INT,


	CONSTRAINT fk_reservation
	FOREIGN KEY (id_chambre) REFERENCES Chambres(id_chambre),
	FOREIGN KEY (id_client) REFERENCES Clients(id_client)

);



CREATE TABLE Factures(
	id_facture INTEGER PRIMARY KEY not null,
	prix INT not null CHECK (prix > 0),
	date_facture DATE not null,
	h_facture TIME not null,

	id_client INT,

	CONSTRAINT fk_facture
	FOREIGN KEY (id_client) REFERENCES Clients(id_client)

);



CREATE TABLE Activites(
	id_activite INTEGER PRIMARY KEY not null,
	nom_activite VARCHAR(30) not null,
	jour_activite DATE, 
	h_debut_activite TIME not null,
	h_fin_activite TIME not null CHECK (h_fin_activite > h_debut_activite)


);




INSERT INTO Batiments VALUES (1 , "Bat 1 " , 1000, 10000000, 5 ,null, 1);
INSERT INTO Batiments VALUES (2 , "Bat 2" , 2000, 20818, 1 ,null, 2);
INSERT INTO Batiments VALUES (3 , "Bat 3" , 2130, 65160, 3.5 ,null, 3);
INSERT INTO Batiments VALUES (4 , "Bat 4" ,165160, 5655, 2 ,null, 4);

INSERT INTO Compagnies VALUES (1 , "Comp 1 " , 1);
INSERT INTO Compagnies VALUES (1 , "Comp 1" , 2);


INSERT INTO Compagnies VALUES (2 , "Comp 2" , 3);
INSERT INTO Compagnies VALUES (2 , "Comp 2" , 4);




-- SELECT * FROM Compagnies;
-- SELECT * FROM Batiments;



/* ////////// VOIR SI VRAIMENT UTILE //////////

CREATE TABLE Groupes(


);


CREATE TABLE Restaurants(


);
*/

