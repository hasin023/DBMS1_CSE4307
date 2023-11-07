package Task1;

import java.util.ArrayList;
import java.util.List;

// Manager class to manage the different types of Accounts
public class DatabaseManager {
    // A database object for the specific user DBAccount
    private final Database database;

    // Lists to store the different types of accounts
    public List<Account> CIPAccounts = new ArrayList<>();
    public List<Account> VIPAccounts = new ArrayList<>();
    public List<Account> OrdinaryAccounts = new ArrayList<>();

    public DatabaseManager(Database database) {
        this.database = database;

        // Get the accounts and transactions from the tables
        // and store them in the lists of the database
        database.getAccounts();
        database.getTransactions();

        // Update the balance of the accounts using the transactions
        database.updateBalance();
    }


    // Get the CIP accounts
    private int getCIPAccounts() {
        // Total transaction amount for each account
        double totalTransaction = 0;

        // Loop through all the accounts and transactions
        for (Account account : database.accounts) {
            for (Transaction transaction : database.transactions) {
                // If the transaction is for that account
                if (transaction.getA_ID() == account.getA_ID()) {
                    // If the balance is greater than 1000000 for CIP account
                    if (account.getBalance() > 1000000) {
                        // Add the transaction amount to the total transaction
                        totalTransaction += transaction.getT_AMOUNT();

                        // If the total transaction is greater than 5000000
                        if (totalTransaction > 5000000) {
                            // Add the account to the CIP account list
                            CIPAccounts.add(account);
                        }
                    }
                }
            }
        }
        // Return the size of the CIP account list
        return CIPAccounts.size();
    }


    // For the VIP and Ordinary accounts, The same logic is used as the CIP accounts
    private int getVIPAccounts() {
        double totalTransaction = 0;

        for (Account account : database.accounts) {
            for (Transaction transaction : database.transactions) {
                if (transaction.getA_ID() == account.getA_ID()) {
                    // If the balance is greater than 500000 and less than 900000 for VIP account
                    if (account.getBalance() > 500000 && account.getBalance() < 900000) {
                        totalTransaction += transaction.getT_AMOUNT();

                        // If the total transaction is greater than 2500000 and less than 4500000
                        if (totalTransaction > 2500000 && totalTransaction< 4500000) {
                            // Add the account to the VIP account list
                            VIPAccounts.add(account);
                        }
                    }
                }
            }
        }
        // Return the size of the VIP account list
        return VIPAccounts.size();
    }

    private int getOrdinaryAccounts() {
        double totalTransaction = 0;

        for (Account account : database.accounts) {
            for (Transaction transaction : database.transactions) {
                if (transaction.getA_ID() == account.getA_ID()) {
                    // If the balance is less than 100000 for Ordinary account
                    if (account.getBalance() < 100000) {
                        totalTransaction += transaction.getT_AMOUNT();

                        // If the total transaction is less than 1000000
                        if (totalTransaction < 1000000) {
                            // Add the account to the Ordinary account list
                            OrdinaryAccounts.add(account);
                        }
                    }
                }
            }
        }
        // Return the size of the Ordinary account list
        return OrdinaryAccounts.size();
    }

    // Print all the account counts from the lists
    public void printInfo() {
        System.out.println("Total Accounts: " + database.accounts.size());
        System.out.println("CIP Accounts: " + getCIPAccounts());
        System.out.println("VIP Accounts: " + getVIPAccounts());
        System.out.println("Ordinary Accounts: " + getOrdinaryAccounts());
        System.out.println("Uncategorized Accounts: " + (database.accounts.size() - (getCIPAccounts() + getVIPAccounts() + getOrdinaryAccounts())));
    }

}

