pragma foreign_keys=true;

.open Projet_Croisiere.db
.mode columns
.width 10 10 10 10 10 10
.headers on


select 'Table Batiments';
SELECT * FROM Batiments;
select '';

select 'Table Compagnies';
SELECT * FROM Compagnies;
select '';

select 'Table Reservations';
SELECT * FROM Reservations;
select '';

select 'Table Notes';
SELECT * FROM Notes;
select '';

select 'Table Factures';
SELECT * FROM Factures;
select '';

select 'Table Clients';
SELECT * FROM Clients;
select '';

select 'Table Rangs';
SELECT * FROM Rangs;
select '';

select 'Table Activites';
SELECT * FROM Activites;
select '';
