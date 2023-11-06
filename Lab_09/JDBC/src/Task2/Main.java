package Task2;

import java.sql.*;

public class Main {
    public static void main(String[] args) {

        String username = "C_210042174";
        String password = "cse4308";
        String url = "jdbc:oracle:thin:@localhost:1521:xe";

        try {
            // Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Create the connection object
            Connection connection = DriverManager.getConnection(url, username, password);

            // Create the statement object
            PreparedStatement preparedStatement1 = connection.prepareStatement ("INSERT INTO TRANSACTIONS VALUES (? ,? ,? ,?, ?)") ;
            preparedStatement1.setInt (1 , 10001); ;
            preparedStatement1.setDate (2 , new Date(2022, 2, 12)); ;
            preparedStatement1.setInt (3 , 2); ;
            preparedStatement1.setDouble (4 , 5000.0); ;
            preparedStatement1.setString (5 , "1") ;
            preparedStatement1.executeUpdate () ;
            //CHECK => select * from TRANSACTIONS where T_ID=10001;

            PreparedStatement preparedStatement2 = connection.prepareStatement ("INSERT INTO TRANSACTIONS VALUES (? ,? ,? ,?, ?)") ;
            preparedStatement2.setInt (1 , 10005); ;
            preparedStatement2.setDate (2 , new Date(2022, 10, 15)); ;
            preparedStatement2.setInt (3 , 4); ;
            preparedStatement2.setDouble (4 , 10000.0); ;
            preparedStatement2.setString (5 , "0") ;
            preparedStatement2.executeUpdate () ;
            //CHECK => select * from TRANSACTIONS where T_ID=10005;


            System.out.println("Data inserted successfully!");

            // Close the connection
            preparedStatement1.close();
            preparedStatement2.close();
            connection.close();

        } catch (SQLException e) {
            System.out.println("Connection to DB failed. Exception: " + e);
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC driver not found. Exception: " + e);
        }

    }
}
