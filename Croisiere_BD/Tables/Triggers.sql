pragma foreign_keys=true;

.mode columns
.width 10 10 10 10 10 10
.headers on

DROP TABLE IF EXISTS RecapReservation;
DROP TRIGGER IF EXISTS trigger_create_reservation;



CREATE TABLE RecapReservation(
    Id INTEGER not null, 
    nom VARCHAR(20), 
    prenom VARCHAR(20), 
    age INT,
    sexe VARCHAR(5), 
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


    CONSTRAINT pk_recapReservation primary key (Id)

    CONSTRAINT fk_recapReservation
	FOREIGN KEY (id_client) REFERENCES Clients(id_client)
    FOREIGN KEY (id_reservation) REFERENCES Reservations(id_reservation) 
    FOREIGN KEY (id_rang) REFERENCES Rangs(id_rang)
    FOREIGN KEY (id_facture) REFERENCES Factures(id_facture)
);


-- INSERT INTO RecapReservation VALUES(1,'Simpson','Bart','Interieur',190,'2022-03-13','2022-05-23',10,10,1);
-- SELECT * FROM RecapReservation;

CREATE TRIGGER trigger_create_reservation
    BEFORE INSERT ON RecapReservation
    -- FOR EACH ROW 
BEGIN
    INSERT INTO Clients(nom, prenom, age, sexe, id_rang) VALUES(new.nom,new.prenom,new.age,new.sexe,new.id_rang);
    INSERT INTO Reservations(date_debut, date_fin,h_reservation,id_client) VALUES( new.date_debut, new.date_fin, strftime('%H:%M:%S',new.date_debut), new.id_client);
    INSERT INTO Factures(date_facture,h_facture,id_client) VALUES(new.date_facture, strftime('%H:%M:%S','now', 'localtime'), new.id_client);
    
END;

SELECT 'Trigger 1';
SELECT '';
INSERT INTO RecapReservation VALUES(1,'Simspon','Bart',18,'homme','Suite','550',DATE(),TIME('now'),'2022-03-13','2022-05-23',11,11,4,11);


SELECT * FROM Clients;
SELECT * FROM Reservations;
SELECT * FROM Factures;

SELECT 'RecapReservation';
SELECT '';
SELECT * FROM RecapReservation;
