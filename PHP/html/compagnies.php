<?php
    // Define PDO - Tell aboit database file
    $pdo = new PDO('sqlite:Projet_Croisiere.db');

    // Write SQL 
    $statement = $pdo->query("SELECT * FROM Compagnies");

?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/main.css">
    <title>¨Projet Base de Données</title>

    <script language="javascript" type="text/javascript" src="jquery.js"></script>
</head>

<body>

        <h1>Compagnies</h1>
        <table algin="center" border="1px" style="width:300px; line-heigth:30%">
            <tr>
                <th>ID</th>
                <th>Nom Compagnie</th>
                <th>ID Batiment</th>
            </tr>

            <?php
                while($rows = $statement->fetch(PDO::FETCH_ASSOC)){
            ?>
                    <tr>
                        <td><?php echo $rows['id_compagnie'] ?></td>
                        <td><?php echo $rows['nom_compagnie'] ?></td>
                        <td><?php echo $rows['id_batiment'] ?></td>

                    </tr>
            <?php
                }
            ?>
            
        </table>
</body>

</html>

