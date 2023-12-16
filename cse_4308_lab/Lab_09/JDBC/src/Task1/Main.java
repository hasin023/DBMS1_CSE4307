package Task1;

public class Main {
    public static void main(String[] args) {
        // Create a database object with username and password
        Database database = new Database("C_210042174", "cse4308");
        // Create a database manager object with database object
        DatabaseManager databaseManager = new DatabaseManager(database);
        // Call the printInfo method to get all the account counts
        databaseManager.printInfo();
    }
}
