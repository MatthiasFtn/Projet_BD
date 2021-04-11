<?php
	$conn = new PDO('sqlite:database/Projet_Croisiere.db');
	
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	
	$query = "SELECT nom, prenom, date_debut, date_fin, h_reservation FROM 'Reservations' JOIN Clients ON Reservations.id_reservation = Clients.id_reservation ORDER BY 'nom' ASC";
	
	$conn->exec($query);
	
?>