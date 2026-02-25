package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Logger;

public class DBConnection {
    private final static String DB_NAME = "noters_java_mastery_db";
    private final static String DB_URL = "jdbc:mysql://localhost:3306/" + DB_NAME;
    private final static String DB_USERNAME = "root";
    private final static String DB_PASSWORD = "";
    private static final Logger logger = Logger.getLogger(DBConnection.class.getName());
    private static Connection connection = null;
    public static Connection connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager
                    .getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            logger.info("Database "+DB_NAME +" connected ");
            return connection;
        } catch (Exception e) {
            throw new RuntimeException("Database "+DB_NAME+" connection error : " + e.getMessage());
        }
    }
    public static void close(){
        try {
            connection.close();
            logger.info("Database "+DB_NAME +" connection closed ");
        }catch (Exception e){
            throw new RuntimeException("Database "+DB_NAME+" connection close error : " + e.getMessage());
        }
    }
}
