<?php
	$conn = new PDO('sqlite:database/Projet_Croisiere.db');
	
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	
	
	$query = "SELECT nom, prenom, type_rang, prix, date_debut, date_fin FROM Reservations JOIN Clients on Reservations.id_client = Clients.id_client JOIN Rangs ON Clients.id_rang = Rangs.id_rang ORDER BY 'nom' ASC";
	
	$conn->exec($query);
	
?>