<?php
    // Define PDO - Tell aboit database file
    $pdo = new PDO('sqlite:Projet_Croisiere.db');

    // Write SQL 
    $statement = $pdo->query("SELECT * FROM Batiments");

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

        <h1>Batiments</h1>
        <table algin="center" border="1px" style="width:300px; line-heigth:30%">
            <tr>
                <th>ID</th>
                <th>Nom Batiments</th>
                <th>Superficie</th>
                <th>Nombre de chambre</th>
                <th>ID Compagnie</th>
                <th>ID Chambre</th>
            </tr>

            <?php
                while($rows = $statement->fetch(PDO::FETCH_ASSOC)){
            ?>
                    <tr>
                        <td><?php echo $rows['id_batiment'] ?></td>
                        <td><?php echo $rows['nom_batiment'] ?></td>
                        <td><?php echo $rows['superficie'] ?></td>
                        <td><?php echo $rows['nb_chambre'] ?></td>
                        <td><?php echo $rows['id_compagnie'] ?></td>
                        <td><?php echo $rows['id_chambre'] ?></td>

                    </tr>
            <?php
                }
            ?>
            
        </table>
</body>

</html>

