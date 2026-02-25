package service;

import db.DBOperations;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import model.dao.UserDao;
import model.dto.LoginDTO;
import model.dto.UserDTO;
import model.dto.UserRegisterDTO;

import java.util.UUID;

public class UserService {
    public UserDTO login(HttpServletRequest req, LoginDTO dto) {
        UserDao dao = new UserDao();
        UserDTO userDTO = dao.login(dto);
        HttpSession session = req.getSession();
        if (userDTO != null) {
            session.setAttribute("user_data", userDTO);
            return userDTO;
        } else {
            session.removeAttribute("user_data");
            return null;
        }
    }

    public void register(HttpServletRequest req , UserRegisterDTO dto) {
        UserDao dao = new UserDao();
        String userCode = UUID.randomUUID().toString();
        String query = "insert into users(name, password, email , mobile_no , created_at , user_code)" +
                " values ('"+dto.name()+"','"+dto.password()+"','"+dto.email()+"','"+dto.mobile()+"' , '"+dto.createdAt()+"' , '"+userCode+"')";
        dao.insert(query);
    }
}
