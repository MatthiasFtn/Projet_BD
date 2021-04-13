pragma foreign_keys=true;

.mode columns
.width 10 10 10 10 10 10
.headers on

DROP TABLE IF EXISTS RecapReservation;
DROP TRIGGER IF EXISTS trigger_create_reservation;
DROP TRIGGER IF EXISTS trigger_update_reservation_client;
DROP TRIGGER IF EXISTS trigger_client_inscrit_activite;
DROP TRIGGER IF EXISTS trigger_ajouter_client_activite;


CREATE TABLE RecapReservation(
    Id INTEGER not null, 
    nom VARCHAR(20), 
    prenom VARCHAR(20), 
    age INT,
    sexe VARCHAR(5), 
    nom_batiment VARCHAR(20), 
    type_rang VARCHAR(10), 
    prix INT,
    date_facture DATE,
    h_facture DATE,
    date_debut DATE, 
    date_fin DATE,

    id_client INT,
    id_reservation INT,
    id_rang INT,
    id_facture INT,
    id_batiment INT,


    CONSTRAINT pk_recapReservation primary key (Id)

    CONSTRAINT fk_recapReservation
	FOREIGN KEY (id_client) REFERENCES Clients(id_client)
    FOREIGN KEY (id_reservation) REFERENCES Reservations(id_reservation) 
    FOREIGN KEY (id_rang) REFERENCES Rangs(id_rang)
    FOREIGN KEY (id_facture) REFERENCES Factures(id_facture)
    FOREIGN KEY (id_batiment) REFERENCES Batiments(id_batiment)
);


/**********************************************************************************************/


/* 
* 
* Trigger qui permet la création des réservations d'un client avec toute les informations nécessaire, qui stock ensuite les valeurs ajoutées  dans les tables correspondants
* On affiche en dessous les tableaux affichant les anciennes et les nouvelles infos des tableaux RecapReservation, Clients, Reservations et Factures;
*/

CREATE TRIGGER trigger_create_reservation
    AFTER INSERT ON RecapReservation
BEGIN
    INSERT INTO Clients(nom, prenom, age, sexe, id_rang,id_batiment) VALUES(new.nom,new.prenom,new.age,new.sexe,new.id_rang,new.id_batiment);
    INSERT INTO Reservations(date_debut, date_fin,h_reservation,id_client) VALUES(new.date_debut, new.date_fin, strftime('%H:%M:%S',new.date_debut), new.id_client);
    INSERT INTO Factures(date_facture,h_facture,id_client) VALUES(new.date_facture, strftime('%H:%M:%S','now', 'localtime'), new.id_client);
    
END;

.print " "
.print " "
.print " "
.print " /**********************************************************************************************/"
.print " /*                                        TRIGGERS                                            */"
.print " /**********************************************************************************************/"
.print " "
.print " "
.print " "
.print " Tables Clients , Reservation et Facture avant execution du Trigger n°1"
SELECT * FROM Clients;
SELECT * FROM Reservations;
SELECT * FROM Factures;



.print " "
.print " "
.print " "
.print " Execution du Trigger n°1 ---->"
INSERT INTO RecapReservation VALUES(1,'Simspon','Bart',18,'homme','Azamara pursuit' ,'Suite','550',DATE(),TIME('now'),'2022-03-13','2022-05-23',11,11,4,11,2);
INSERT INTO RecapReservation VALUES(2,'Simspon','Lisa',18,'femme', 'Azamara pursuit','Suite','550',DATE(),TIME('now'),'2022-03-13','2022-05-23',12,12,4,12,2);
INSERT INTO RecapReservation VALUES(3,'Simspon','Marge',30,'femme','Azamara pursuit' ,'Suite','550',DATE(),TIME('now'),'2022-03-13','2022-05-23',13,13,4,13,2);
INSERT INTO RecapReservation VALUES(4,'Simspon','Homer',40,'homme', 'Azamara pursuit','Suite','550',DATE(),TIME('now'),'2022-03-13','2022-05-23',14,14,4,14,2);



.print " "
.print " "
.print " "
.print " Tables Clients , Reservation et Facture après execution du Trigger n°1"
SELECT * FROM Clients;
SELECT * FROM Reservations;
SELECT * FROM Factures;


.print " "
.print " "
.print "Tables qui stock les valeurs après l execution du Trigger n°1 : RecapReservation"
SELECT * FROM RecapReservation;




/**********************************************************************************************/

/* 
* 
* Trigger qui permet la modification des informations d'un client sélectionné en fonction de son ID, on peut modifier son nom, son prenom, son age et son genre
* On affiche en dessous les tableaux affichant les anciennes et les nouvelles recap de réservation
*/
CREATE TRIGGER trigger_update_reservation_client
    AFTER UPDATE ON RecapReservation
BEGIN
    UPDATE Clients
    SET nom = new.nom, prenom = new.prenom, age = new.age, sexe = new.sexe
    WHERE id_client = new.id_client;
END;


.print " "
.print " "
.print "Tables qui stock les valeurs avant l execution du Trigger n°2 : RecapReservation"
SELECT * FROM RecapReservation;


.print " "
.print " "
.print " "
.print " Execution du Trigger n°2 ---->"
UPDATE RecapReservation SET nom="FONTAINE", prenom="Matthias", age=21, sexe="femme" WHERE id_client = 11;

.print " "
.print " "
.print "Tables qui stock les valeurs après l execution du Trigger n°2 : RecapReservation"
SELECT * FROM RecapReservation;


/**********************************************************************************************/

/*
*
* Trigger qui permet l'ajout d'une note à un Batiment
* On affiche en dessous les tableaux affichant l'ancienne et la nouvelle moyenne
*/

CREATE TRIGGER trigger_ajouter_note
    AFTER INSERT ON Notes
BEGIN
   UPDATE Batiments
   SET note = new.note;
   WHERE id_batiment = new.id_batiment
   ORDER BY note DESC;
END;


.print " "
.print " "
.print "Table avant l execution du Trigger n°3 "
SELECT * FROM vWBestBatimentsParCompagnies;

.print " "
.print " "
.print " "
.print " Execution du Trigger n°3 ---->"
INSERT INTO Notes(note,id_batiment) VALUES(5,10);

.print " "
.print " "
.print "Tables après l execution du Trigger n°3 :"
SELECT * FROM vWBestBatimentsParCompagnies;



/**********************************************************************************************/


/*
*
* Trigger qui permet l'ajout d'un client à une activité
* On affiche en dessous les tableaux affichant les anciennes et les nouvelles infos
*/


