.open Projet_Croisiere.db
.read ../../Tables/Tables.sql

.mode csv
.import ../../CSV/Batiments.csv Batiments
.import ../../CSV/Compagnies.csv Compagnies
.import ../../CSV/Reservations.csv Reservations
.import ../../CSV/Notes.csv Notes
.import ../../CSV/Factures.csv Factures
.import ../../CSV/Clients.csv Clients
.import ../../CSV/Rangs.csv Rangs
.import ../../CSV/Activites.csv Activites

.read ../../Tables/Insertion.sql
.read ../../Tables/Views.sql
.read ../../Tables/Triggers.sql