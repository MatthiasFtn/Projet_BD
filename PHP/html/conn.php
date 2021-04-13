<?php
	$conn = new PDO('sqlite:database/Projet_Croisiere.db');
	
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	
	
	// $pdo = new PDO('sqlite:../database/Projet_Croisiere.db');
    
    $statement = $conn->query("SELECT * FROM RecapReservation");

	
	// $conn->exec($query);
	
?>