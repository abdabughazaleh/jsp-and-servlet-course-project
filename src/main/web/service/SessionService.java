package service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import model.dto.UserDTO;

public class SessionService {
    private final HttpServletRequest request;
    private final HttpSession session;

    public SessionService(HttpServletRequest request) {
        this.request = request;
        this.session = request.getSession();
    }

    public boolean validateUserAccess() {
        if (session.getAttribute("user_data") == null){
            return false;
        }
        return true;
    }

    public UserDTO getCurrentUser(){
        Object userData = this.session.getAttribute("user_data");
        if (userData!=null)
            return (UserDTO) userData;
        throw new RuntimeException("Cannot get user data... login then try again!");
    }

}
