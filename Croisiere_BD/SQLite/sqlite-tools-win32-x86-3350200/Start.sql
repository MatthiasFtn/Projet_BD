.open Projet_Croisiere.db
.read ../../Tables/Tables.sql

.mode csv
.import ../../CSV/Reservations.csv Reservations


.read ../../Tables/Views.sql