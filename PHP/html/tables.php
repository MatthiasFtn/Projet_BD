<?php
// Display all sqlite tables
    $pdo = new PDO('sqlite:Projet_Croisiere.db');

    
    $statement = $pdo->queryAll("SELECT * FROM Projet_Croisiere");
?>