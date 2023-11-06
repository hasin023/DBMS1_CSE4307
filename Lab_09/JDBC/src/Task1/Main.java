package Task1;

public class Main {
    public static void main(String[] args) {
        Database database = new Database("C_210042174", "cse4308");
        DatabaseManager databaseManager = new DatabaseManager(database);
        databaseManager.printInfo();
    }
}
