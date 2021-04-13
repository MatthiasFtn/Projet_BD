pragma foreign_keys=true;

.open Projet_Croisiere.db
.mode columns
.width 10 10 10 10 10 10
.headers on


.print " "
.print " "
.print " "
.print " /**********************************************************************************************/"
.print " /*                                          TABLES                                            */"
.print " /**********************************************************************************************/"
.print " "
.print " "
.print " "


.print " Table Batiments "
.print " "
SELECT * FROM Batiments;
.print " "

.print " Table Compagnies "
.print " "
SELECT * FROM Compagnies;
.print " "

.print " Table Reservations "
.print " "
SELECT * FROM Reservations;
.print " "

.print " Table Notes "
.print " "
SELECT * FROM Notes;
.print " ";

.print " Table Factures "
.print " "
SELECT * FROM Factures;
.print " "

.print " Table Clients "
.print " "
SELECT * FROM Clients;
.print " "

.print " Table Rangs "
.print " "
SELECT * FROM Rangs;
.print " "

.print " Table Activites "
.print " "
SELECT * FROM Activites;
.print " "
