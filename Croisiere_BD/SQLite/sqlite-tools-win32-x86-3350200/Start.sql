.open Projet_Croisiere.db
.read ../../Tables/Tables.sql

.mode csv
.import ../../CSV/Batiments.csv Batiments
.import ../../CSV/Compagnies.csv Compagnies
.import ../../CSV/Reservations.csv Reservations


.read ../../Tables/Views.sql