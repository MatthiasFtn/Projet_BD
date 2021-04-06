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



CREATE TABLE Batiments(
	id_batiment INTEGER not null,
	nom_batiment VARCHAR(30) not null,
	superficie INT not null,
	nb_chambre INT not null,
	note INT CHECK ( note BETWEEN 0 AND 5),

	
	id_compagnie INTEGER,
	id_chambre INTEGER,

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
	type_rang VARCHAR(20) not null CHECK (type_rang = 'interieur' OR type_rang ='vue mer' OR type_rang = 'vue balcon' OR type_rang = 'suite'),
	prix INT not null CHECK (prix > 0)

);


CREATE TABLE Chambres(
	id_chambre INTEGER PRIMARY KEY not null,
	capacite INT not null CHECK (capacite BETWEEN 2 AND 5),
	
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
	id_reservation INTEGER not null,
	date_debut DATE not null,
	date_fin DATE not null CHECK (date_fin > date_debut),
	h_reservation TIME not null,

	id_chambre INTEGER, 
	id_client INTEGER,


	CONSTRAINT pk_reservation primary key (id_reservation,id_chambre, id_client)

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




INSERT INTO Batiments VALUES
	(1 , "Bat 1 ", 1000, 10000000, 4, 1, null),
	(2 , "Bat 2" , 2000, 20818, 5 , 4, null),
	(3 , "Bat 3" , 2130, 65160, 5 , 1, null),
	(4 , "Bat 4" , 165160, 5655, 2 , 2, null);

INSERT INTO Compagnies(id_compagnie, nom_compagnie, id_batiment)VALUES
	(1 , "Comp 1 " , 1),
	(2 , "Comp 2" , 2),
	(2 , "Comp 2" , 3),
	(2 , "Comp 2" , 4);



INSERT INTO Reservations(id_reservation, date_debut, date_fin, h_reservation, id_chambre, id_client) VALUES
	(1,"2021-03-12","2021-04-12", "14:25:20", null, null),
	(2,"2021-02-12","2021-04-12", "14:25:20", null, null),
	(3,"2021-01-12","2021-04-12", "14:25:20", null, null),
	(4,"2021-02-12","2021-04-12", "14:25:20", null, null),
	(5,"2021-03-12","2021-04-12", "14:25:20", null, null),
	(6,"2021-03-14","2021-05-21", "16:25:20", null, null),
	(7,"2021-09-12","2021-11-20", "04:25:20", null, null),
	(8,"2020-12-31","2021-01-30", "15:25:20", null, null),
	(9,"2021-05-18","2021-08-01", "20:25:20", null, null),
	(10,"2021-03-12","2021-04-12", "14:25:20", null, null),
	(11,"2021-02-12","2021-04-12", "14:25:20", null, null),
	(12,"2021-07-12","2021-09-12", "14:25:20", null, null),
	(13,"2021-02-12","2021-04-12", "14:25:20", null, null),
	(14,"2021-03-12","2021-04-12", "14:25:20", null, null),
	(15,"2021-03-14","2021-05-21", "16:25:20", null, null),
	(16,"2021-01-12","2021-07-20", "04:25:20", null, null),
	(17,"2020-12-31","2021-01-30", "15:25:20", null, null),
	(18,"2021-06-18","2021-08-01", "20:25:20", null, null),
	(19,"2021-03-12","2021-04-12", "14:25:20", null, null),
	(20,"2021-02-12","2021-04-12", "14:25:20", null, null),
	(21,"2021-01-12","2021-04-12", "14:25:20", null, null),
	(22,"2021-02-12","2021-04-12", "14:25:20", null, null),
	(23,"2021-03-12","2021-04-12", "14:25:20", null, null),
	(24,"2021-03-14","2021-05-21", "16:25:20", null, null),
	(25,"2021-07-12","2021-09-20", "04:25:20", null, null),
	(26,"2020-12-31","2021-01-30", "15:25:20", null, null),
	(27,"2021-05-18","2021-08-01", "20:25:20", null, null),
	(28,"2021-03-12","2021-04-12", "14:25:20", null, null),
	(29,"2021-02-12","2021-04-12", "14:25:20", null, null),
	(30,"2021-09-12","2021-10-12", "14:25:20", null, null);





-- SELECT * FROM Compagnies;


-- SELECT * FROM Batiments;


-- SELECT * FROM Reservations;


/* ////////// VOIR SI VRAIMENT UTILE //////////

CREATE TABLE Groupes(


);


CREATE TABLE Restaurants(


);
*/

