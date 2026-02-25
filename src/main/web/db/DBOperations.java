package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Logger;

public class DBOperations {
    private static final Logger logger = Logger.getLogger(DBOperations.class.getName());

    public static ResultSet executeQuery(String query){
        try {
            ResultSet result = DBConnection
                    .connect()
                    .prepareStatement(query).executeQuery();
            logger.info("query (" + query + ") executed!");
            return result;
        }catch (Exception e){
            throw new RuntimeException("PreparedStatement error : " + e.getMessage());
        }
    }

    public static void executeUpdate(String query){
        try {
            DBConnection
                    .connect()
                    .prepareStatement(query).executeUpdate();
            logger.info("insert using :  (" + query + ") ");
        }catch (Exception e){
            throw new RuntimeException("PreparedStatement error : " + e.getMessage());
        }
    }

}
