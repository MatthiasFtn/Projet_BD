# Projet_BD

## Execution du Projet SQL (tables déjà initialiser donc passer à la partie HTML/PHP)

* Pour les Tables : 
* Se rendre dans le fichier **Croisiere_BD\SQLite\sqlite-tools-win32-x86-3350200**
* Exectuer sqlite3.exe
* Entrer les commandes suivante :
"**.open Projet_Croisiere.db**"  &&  "**.read ../../Tables/Tables.sql**"


## Execution du Projet SQL (HTML/PHP)
* Lancer la tables des batiments:
	* Se rendre dans le folder "PHP", ouvrir un terminal dans à partir de ce fodler, et entrer la commande **php -S localhost:1234** pour créer un serveur local.
* Ouvrir le **main.html** tout simplement :)


## Execution du Projet JAVA

* Se rendre dans le fichier **Java_JDBC\src**
* Exectuer le programme  
	

Erreur rencontrée :
	**java.sql.SQLException: No suitable driver found for jdbc:sqlite:C:\Users\matth\OneDrive\Documents\FAC\2021\BD\PROJET\Projet_Croisiere\SQLite\sqlite-tools-win32-x86-3350200\Projet_Croisiere.db
        at java.sql/java.sql.DriverManager.getConnection(DriverManager.java:702)
        at java.sql/java.sql.DriverManager.getConnection(DriverManager.java:251)
        at src.SQLiteDemo.main(SQLiteDemo.java:16)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:64)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:564)
        at jdk.compiler/com.sun.tools.javac.launcher.Main.execute(Main.java:415)
        at jdk.compiler/com.sun.tools.javac.launcher.Main.run(Main.java:192)
        at jdk.compiler/com.sun.tools.javac.launcher.Main.main(Main.java:132)**
