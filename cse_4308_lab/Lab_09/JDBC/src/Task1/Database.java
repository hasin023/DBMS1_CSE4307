package Task1;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// Database class for connecting to the database and getting the data
public class Database {
    // Database credentials
    private final String username;
    private final String password;

    // List of transaction objects and account objects
    public List<Transaction> transactions = new ArrayList<>();
    public List<Account> accounts = new ArrayList<>();

    // Constructor for the database class
    public Database(String username, String password) {
        this.username = username;
        this.password = password;
    }

    // Getters for the credentials
    public String getUsername() { return this.username; }
    public String getPassword() { return this.password; }


    // Getters for the transactions and accounts
    public void getTransactions() {
        // SQL query to get all the transactions
        String query = "SELECT * FROM TRANSACTIONS";

        try {
            // Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Create the connection object
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            Connection connection = DriverManager.getConnection(url, username, password);

            // Create the statement object
            Statement statement = connection.createStatement();
            System.out.println("Retrieved all transactions from Table!");

            // Execute the query
            ResultSet resultSet = statement.executeQuery(query);

            // Process the result
            while (resultSet.next()) {
                // Here, we take the data from each column of the table using columnLabels and insert them
                // to create a transaction object and push the transaction to the "transactions" list
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
        // SQL query to get all the accounts
        String query = "SELECT * FROM ACCOUNT";

        try {
            // Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Create the connection object
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            Connection connection = DriverManager.getConnection(url, username, password);

            // Create the statement object
            Statement statement = connection.createStatement();
            System.out.println("Retrieved all accounts from Table!");

            // Execute the query
            ResultSet resultSet = statement.executeQuery(query);

            // Process the result
            while (resultSet.next()) {
                // Here, we take the data from each column of the table using columnLabels and insert them
                // to create an account object and push the account to the "accounts" list
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

    // Method to update the balance of each account
    public void updateBalance () {
        // Iterate through the transactions list
        for (Transaction transaction : transactions) {
            // Iterate through the accounts list
            for (Account account : accounts) {
                // If the account ID of the transaction matches the account ID of the account
                if (transaction.getA_ID() == account.getA_ID()) {
                    // If the transaction type is 0, add the amount to the balance
                    if (transaction.getT_TYPE().equals("0")) {
                        account.setBalance(account.getBalance() + transaction.getT_AMOUNT());
                    } else {
                        // If the transaction type is 1, subtract the amount from the balance
                        account.setBalance(account.getBalance() - transaction.getT_AMOUNT());
                    }
                }
            }
        }
    }

}

