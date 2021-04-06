pragma foreign_keys=true;

.mode columns
.width 10 10 10 10 10 10
.headers on

DROP VIEW IF EXISTS vWBestBatimentsByCompagnies;
DROP VIEW IF EXISTS vWNombreDeReservation;

/*Batiments mieux côtés*/

CREATE VIEW vWBestBatimentsByCompagnies
as
SELECT nom_compagnie, nom_batiment, note as Evalutaion
FROM Batiments JOIN Compagnies ON Batiments.id_batiment = Compagnies.id_batiment
ORDER BY note DESC;


SELECT * FROM vWBestBatimentsByCompagnies;


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


SELECT * FROM vWNombreDeReservation;
