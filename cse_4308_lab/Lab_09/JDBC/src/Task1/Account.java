package Task1;

// Account class for each Record in the ACCOUNT Table
public class Account {
    // Account ID for each account
    private final int A_ID;
    // Balance for each account
    private double balance;

    // Constructor for Account class
    public Account(int A_ID) {
        this.A_ID = A_ID;
    }

    // Getter for Account ID
    public int getA_ID() {
        return A_ID;
    }

    // Getter and Setter for Balance
    public double getBalance() {
        return balance;
    }

    // Setter for Balance
    public void setBalance(double balance) {
        this.balance = balance;
    }
}

