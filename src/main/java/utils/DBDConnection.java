package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBDConnection {
	   private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=GarageDB;encrypt=false;trustServerCertificate=true";
	   private static final String USER = "SA";
	   private static final String PASSWORD = "Password123";

	   public DBDConnection() {
	   }

	   public static Connection getConnection() throws SQLException {
	      try {
	         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	         return DriverManager.getConnection(URL, USER, PASSWORD);
	      } catch (ClassNotFoundException var1) {
	         throw new SQLException("Driver SQL Server introuvable", var1);
	      }

	   }
}
