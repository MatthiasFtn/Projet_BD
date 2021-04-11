<?php

	require_once 'conn.php';
	
	
	if(ISSET($_POST['save'])){
		$date_debut = $_POST['date_debut'];
		$date_fin = $_POST['date_fin'];
		$h_reservation = $_POST['h_reservation'];
		
		$query = "INSERT INTO Reservations (id_reservation,date_debut, date_fin, h_reservation) VALUES (:id_reservation, :date_debut, :date_fin, :h_reservation)";
		
		$stmt = $conn->prepare($query);
	
		$stmt->bindParam(':id_reservation', $conn->lastInsertID());
		$stmt->bindParam(':date_debut', $date_debut);
		$stmt->bindParam(':date_fin', $date_fin);
		$stmt->bindParam(':h_reservation', $h_reservation);
	
		$stmt->execute();
		
		print_r($conn->lastInsertID());
		header('location: index.php');
		
		$conn = null;
	}
?>