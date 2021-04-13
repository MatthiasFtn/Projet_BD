pragma foreign_keys=true;

.mode columns
.width 10 10 10 10 10 10
.headers on

DROP VIEW IF EXISTS vWBestBatimentsByCompagnies;
DROP VIEW IF EXISTS vWNombreDeReservation;
DROP VIEW IF EXISTS vWFactureClient;
DROP VIEW IF EXISTS vWListReservationClient;

/*Batiments mieux côtés*/

.print " "
.print " "
.print " "
.print " /**********************************************************************************************/"
.print " /*                                          VIEW                                              */"
.print " /**********************************************************************************************/"
.print " "
.print " "
.print " "


CREATE VIEW vWBestBatimentsByCompagnies
as
WITH Moyenne as (
    SELECT AVG(note) as Evalutaion, nom_batiment as Batiment, nom_compagnie as Compagnie 
    FROM Notes JOIN Batiments ON Batiments.id_batiment = Notes.id_batiment
                JOIN Compagnies ON Batiments.id_batiment = Compagnies.id_batiment
    
    GROUP BY nom_compagnie,nom_batiment
    
    HAVING note
    ORDER BY AVG(note) DESC

)
SELECT * FROM Moyenne;

.print " View vWBestBatimentsByCompagnies "
.print " "
SELECT * FROM vWBestBatimentsByCompagnies;
.print " "



/*Nombre de periode avec le plus de réservation*/

/* 
-- Hiver Decembre - Mars    // Période 4
-- Printemps Mars - Juin    // Période 1
-- Eté Juin - Septembre     // Période 2
-- Automne Septembre - Décembre     // Période 3
*/

CREATE VIEW vWNombreDeReservation
as
WITH Hiver as (
SELECT COUNT(id_reservation) AS Hiver
    FROM Reservations
    WHERE strftime('%m', date_debut) = '12' OR strftime('%m', date_debut) ='01' OR strftime('%m', date_debut) = '02'

),
Printemps as (
    SELECT COUNT(id_reservation) AS Printemps
    FROM Reservations
    WHERE strftime('%m', date_debut) = '03' OR strftime('%m', date_debut) = '04' OR strftime('%m', date_debut) = '05'


),
Ete as (
    SELECT COUNT(id_reservation) AS Ete
    FROM Reservations
    WHERE strftime('%m', date_debut) = '06' OR strftime('%m', date_debut) = '07' OR strftime('%m', date_debut) = '08'

),
Automne as (
    SELECT COUNT(id_reservation) AS Automne
    FROM Reservations
    WHERE strftime('%m', date_debut) = '09' OR strftime('%m', date_debut) = '10' OR strftime('%m', date_debut) = '11'

)
SELECT * FROM Hiver, Printemps, Ete, Automne;
.print " View vWNombreDeReservation "
.print " "
SELECT * FROM vWNombreDeReservation;
.print " "



/* Facture du client selectionné */

CREATE VIEW vWFactureClient
as
SELECT id_facture as N°Facture, Clients.nom as Client, Clients.prenom as Prenom, Rangs.type_rang as Cabines ,Rangs.prix as Prix,date_facture as Date_Facturation, h_facture as Heure
FROM Factures NATURAL JOIN Clients NATURAL JOIN Rangs;
.print " View vWFactureClient "
.print " "
SELECT * FROM vWFactureClient;
.print " "




/* Liste des reservations par client */

CREATE VIEW vWListReservationClient
as
SELECT Clients.nom as nom,Clients.prenom as prenom, nom_batiment, Rangs.type_rang as type_rang ,Rangs.prix as prix, date_debut, date_fin
FROM Reservations NATURAL JOIN Clients NATURAL JOIN Rangs NATURAL JOIN Batiments
WHERE Reservations.id_client = Clients.id_client;

.print " View vWListReservationClient "
.print " "
SELECT * FROM vWListReservationClient;
.print " "

