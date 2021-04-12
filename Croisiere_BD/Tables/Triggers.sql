pragma foreign_keys=true;

.mode columns
.width 10 10 10 10 10 10
.headers on


-- DROP TRIGGER create_reservation;


-- CREATE TRIGGER create_reservation
--     AFTER INSERT ON Reservations
-- BEGIN

--     UPDATE Clients SET id_rang = $id_rang WHERE id_rang = null

--     INSERT INTO Client
--     SET nom = new.nom,
--         prenom = new.prenom,
--         age = new.age,
--         sexe = new.sexe,
--         id_rang = new.id_rang;
        
--     INSERT INTO Factures
--     SET date_facture = new.date_facture,
--         h_facture = new.h_facture,
--         id_client = new.id_client;
-- END;