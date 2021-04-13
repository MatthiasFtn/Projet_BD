<?php
	$conn = new PDO('sqlite:database/Projet_Croisiere.db');
	
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	
	
	$query = "SELECT * FROM RecapReservation";
	
	$conn->exec($query);
	
	
?>