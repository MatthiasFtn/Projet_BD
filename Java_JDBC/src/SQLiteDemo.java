package src;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLiteDemo{

    public static void main(String[] args) {
        String jdbString = "jdbc:sqlite:C:\\Users\\matth\\OneDrive\\Documents\\FAC\\2021\\BD\\PROJET\\Projet_Croisiere\\SQLite\\sqlite-tools-win32-x86-3350200\\Projet_Croisiere.db";  

        try{
            
            Connection connection = DriverManager.getConnection(jdbString);
            String sql = "SELECT * FROM Compagnies";
            
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(sql);

            while(result.next()){
                String name = result.getString("nom_compagnie");

                System.out.println("Nom de la compagnie : " + name);
                
            }

        }catch(SQLException e){
            System.out.println("Error connecting to SQLite database");
            e.printStackTrace();
        }

    }
}