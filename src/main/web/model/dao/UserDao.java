package model.dao;

import db.DBConnection;
import db.DBOperations;
import model.dto.LoginDTO;
import model.dto.UserDTO;

import java.sql.ResultSet;
import java.util.logging.Logger;

public class UserDao {
    private static final Logger logger = Logger.getLogger(UserDao.class.getName());
    public UserDTO login(LoginDTO dto){
        try {
            ResultSet rs = DBOperations
                    .executeQuery("SELECT * FROM users WHERE " +
                            "email ='"+dto.getEmail()+"' and password ='"+dto.getPassword()+"'");
            if (rs.next()){
                int userId = rs.getInt("user_id");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String mobileNO = rs.getString("mobile_no");
                String name = rs.getString("name");
                String userCode = rs.getString("user_code");
                String createdAt = rs.getString("created_at");
                UserDTO userDTO = new UserDTO(userId ,
                        email ,
                        mobileNO ,
                        password ,
                        name ,
                        createdAt ,
                        userCode);
                logger.info("user info : " + userDTO);
               return userDTO;
            }else{
                return null;
            }
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }finally {
            DBConnection.close();
        }
    }

    public void insert(String query){
        try {
           DBOperations
                    .executeUpdate(query);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBConnection.close();
        }
    }
}
