import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Database {
    private final String username;
    private final String password;
    public List<Transaction> transactions = new ArrayList<>();
    public List<Account> accounts = new ArrayList<>();

    public Database(String username, String password) {
        this.username = username;
        this.password = password;
    }
    public String getUsername() { return this.username; }
    public String getPassword() { return this.password; }

    public void getTransactions() {
        String query = "SELECT * FROM TRANSACTIONS";

        try {
            // Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Create the connection object
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            Connection connection = DriverManager.getConnection(url, username, password);

            // Create the statement object
            Statement statement = connection.createStatement();
            System.out.println("Connection to DB Established!");

            // Execute the query
            ResultSet resultSet = statement.executeQuery(query);

            // Process the result
            while (resultSet.next()) {
                Transaction transaction = new Transaction(resultSet.getInt("T_ID"), resultSet.getDate("DTM"), resultSet.getInt("A_ID"), resultSet.getDouble("AMOUNT"), resultSet.getString("TYPE"));
                transactions.add(transaction);
            }
            // Close the connection
            resultSet.close();
            statement.close();
            connection.close();

        } catch (SQLException e) {
            System.out.println("Connection to DB failed. Exception: " + e);
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC driver not found. Exception: " + e);
        }
    }

    public void getAccounts() {
        String query = "SELECT * FROM ACCOUNT";

        try {
            // Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Create the connection object
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            Connection connection = DriverManager.getConnection(url, username, password);

            // Create the statement object
            Statement statement = connection.createStatement();
            System.out.println("Connection to DB Established!");

            // Execute the query
            ResultSet resultSet = statement.executeQuery(query);

            // Process the result
            while (resultSet.next()) {
                Account account = new Account(resultSet.getInt("A_ID"));
                accounts.add(account);
            }
            // Close the connection
            resultSet.close();
            statement.close();
            connection.close();

        } catch (SQLException e) {
            System.out.println("Connection to DB failed. Exception: " + e);
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC driver not found. Exception: " + e);
        }
    }

}
