package Task3;

import java.sql.*;

public class Main {
    public static void main(String[] args) {
        String username = "C_210042174";
        String password = "cse4308";
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String accountQuery = "SELECT * FROM ACCOUNT";
        String transactionQuery = "SELECT * FROM TRANSACTIONS";

        try {
            // Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Create the connection object
            Connection connection = DriverManager.getConnection(url, username, password);

            // Create the statement object
            Statement accountStatement = connection.createStatement();
            Statement transactionStatement = connection.createStatement();

            // Execute the query
            ResultSet accountResultSet = accountStatement.executeQuery(accountQuery);
            ResultSet transactionResultSet = transactionStatement.executeQuery(transactionQuery);

            // Get resultSet metadata
            ResultSetMetaData accountResultSetMetaData = accountResultSet.getMetaData();
            ResultSetMetaData transactionResultSetMetaData = transactionResultSet.getMetaData();

            // Print the column numbers and names
            System.out.println("Number of Columns: " + accountResultSetMetaData.getColumnCount());
            System.out.println("Account Table Columns:");
            for (int i = 1; i <= accountResultSetMetaData.getColumnCount(); i++) {
                System.out.print(accountResultSetMetaData.getColumnName(i) + ", DataType: ");
                System.out.println(accountResultSetMetaData.getColumnTypeName(i));
            }
            System.out.println("\n");

            System.out.println("NUmber of Columns: " + transactionResultSetMetaData.getColumnCount());
            System.out.println("Transaction Table Columns:");
            for (int i = 1; i <= transactionResultSetMetaData.getColumnCount(); i++) {
                System.out.print(transactionResultSetMetaData.getColumnName(i) + ", DataType: ");
                System.out.println(transactionResultSetMetaData.getColumnTypeName(i));
            }
            System.out.println("\n");

            // Close the connection
            accountStatement.close();
            transactionStatement.close();
            connection.close();

        } catch (SQLException e) {
            System.out.println("Connection to DB failed. Exception: " + e);
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC driver not found. Exception: " + e);
        }
    }
}
