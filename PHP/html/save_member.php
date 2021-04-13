<?php

	require_once 'conn.php';
	
	if(ISSET($_POST['save_client'])){


		$nom = $_POST['nom'];
		$prenom = $_POST['prenom'];
		$age = $_POST['age'];
		$sexe = $_POST['sexe'];
		$date_debut = $_POST['date_debut'];
		$date_fin = $_POST['date_fin'];
		$type_rang = $_POST['id_rang'];

		
		
		$conn->exec($query);

		$statement = $conn->query("INSERT INTO recapReservation (nom,prenom,age,sexe,type_rang,date_debut,date_fin) VALUES (:nom,:prenom,:age,:sexe,:type_rang, :date_debut,:date_fin)");
		// // rangs

		// $id_rang = $_POST['id_rang'];

		// $query3 = "UPDATE Clients SET id_rang = $id_rang WHERE id_rang = null";

		// $stmt = $conn->prepare($query3);
		// $stmt->execute();

		// // clients

		// $nom = $_POST['nom'];
		// $prenom = $_POST['prenom'];
		// $age = $_POST['age'];
		// $sexe = $_POST['sexe'];
	
		// $query = "INSERT INTO Clients(nom, prenom, age, sexe, id_rang) VALUES (:nom, :prenom, :age, :sexe, :id_rang)";
		
		// $stmt = $conn->prepare($query);
		


		// $stmt->bindParam(':nom', $nom);
		// $stmt->bindParam(':prenom', $prenom);
		// $stmt->bindParam(':age', $age);
		// $stmt->bindParam(':sexe', $sexe);
		// $stmt->bindParam(':id_rang', $id_rang);
	
	
		// $stmt->execute();

		// $id = $conn->lastInsertId();



		// // reservations

		// $date_debut = $_POST['date_debut'];
		// $date_fin = $_POST['date_fin'];
		
	
		// $time = date('H:i:s');
		
		// $query2 = "INSERT INTO Reservations (date_debut, date_fin, id_client, h_reservation) VALUES (:date_debut, :date_fin, :id_client, :h_reservation)";
	
		// $stmt = $conn->prepare($query2);
	
		// $stmt->bindParam(':date_debut', $date_debut);
		// $stmt->bindParam(':date_fin', $date_fin);
		// $stmt->bindParam(':id_client', $id);
		// $stmt->bindParam(':h_reservation', $time);

		// $stmt->execute();


		// $date = date('Y-m-d');

		// $query4 = "INSERT INTO Factures(date_facture, h_facture, id_client) VALUES (:date_facture, :h_facture, :id_client)";
		
		// $stmt = $conn->prepare($query4);
		
		// $stmt->bindParam(':date_facture', $date);
		// $stmt->bindParam(':h_facture', $time);
	
		// $stmt->bindParam(':id_client', $id);
	
		$statement->execute();

		header('location: index.php');
		
		$conn = null;
		

	}


?>