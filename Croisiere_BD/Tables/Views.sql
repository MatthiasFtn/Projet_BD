pragma foreign_keys=true;

.mode columns
.width 20 20 20 20 20 20
.headers on

DROP VIEW IF EXISTS vWBestBatimentsByCompagnies;


/*Batiments mieux côtés*/

CREATE VIEW vWBestBatimentsByCompagnies
as
SELECT nom_compagnie, nom_batiment, AVG(note)
FROM Compagnies JOIN Batiments ON Compagnies.id_batiment = Batiments.id_batiment
ORDER BY note DESC;

SELECT * FROM vWBestBatimentsByCompagnies;