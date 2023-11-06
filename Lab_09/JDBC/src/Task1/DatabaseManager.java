package Task1;

import java.util.ArrayList;
import java.util.List;

public class DatabaseManager {
    private final Database database;
    public List<Account> CIPAccounts = new ArrayList<>();
    public List<Account> VIPAccounts = new ArrayList<>();
    public List<Account> OrdinaryAccounts = new ArrayList<>();

    public DatabaseManager(Database database) {
        this.database = database;

        database.getAccounts();
        database.getTransactions();

        for (Transaction transaction : database.transactions) {
            for (Account account : database.accounts) {
                if (transaction.getA_ID() == account.getA_ID()) {
                    if (transaction.getT_TYPE().equals("0")) {
                        account.setBalance(account.getBalance() + transaction.getT_AMOUNT());
                    } else {
                        account.setBalance(account.getBalance() - transaction.getT_AMOUNT());
                    }
                }
            }
        }
    }

    private int getCIPAccounts() {
        double totalTransaction = 0;

        for (Account account : database.accounts) {
            for (Transaction transaction : database.transactions) {
                if (transaction.getA_ID() == account.getA_ID()) {
                    if (account.getBalance() > 1000000) {
                        totalTransaction += transaction.getT_AMOUNT();

                        if (totalTransaction > 5000000) {
                            CIPAccounts.add(account);
                        }
                    }
                }
            }
        }

        return CIPAccounts.size();
    }

    private int getVIPAccounts() {
        double totalTransaction = 0;

        for (Account account : database.accounts) {
            for (Transaction transaction : database.transactions) {
                if (transaction.getA_ID() == account.getA_ID()) {
                    if (account.getBalance() > 500000 && account.getBalance() < 900000) {
                        totalTransaction += transaction.getT_AMOUNT();

                        if (totalTransaction > 2500000 && totalTransaction< 4500000) {
                            VIPAccounts.add(account);
                        }
                    }
                }
            }
        }

        return VIPAccounts.size();
    }

    private int getOrdinaryAccounts() {
        double totalTransaction = 0;

        for (Account account : database.accounts) {
            for (Transaction transaction : database.transactions) {
                if (transaction.getA_ID() == account.getA_ID()) {
                    if (account.getBalance() < 100000) {
                        totalTransaction += transaction.getT_AMOUNT();

                        if (totalTransaction < 1000000) {
                            OrdinaryAccounts.add(account);
                        }
                    }
                }
            }
        }

        return OrdinaryAccounts.size();
    }

    public void printInfo() {
        System.out.println("Total Accounts: " + database.accounts.size());
        System.out.println("CIP Accounts: " + getCIPAccounts());
        System.out.println("VIP Accounts: " + getVIPAccounts());
        System.out.println("Ordinary Accounts: " + getOrdinaryAccounts());
        System.out.println("Uncategorized Accounts: " + (database.accounts.size() - (getCIPAccounts() + getVIPAccounts() + getOrdinaryAccounts())));
    }

}

