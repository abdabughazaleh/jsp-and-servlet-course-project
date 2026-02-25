package controller;

import db.DBConnection;
import db.DBOperations;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.UserDao;
import model.dto.LoginDTO;
import model.dto.UserDTO;
import service.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null && action.equals("logout")) {
            req.getSession().removeAttribute("user_data");
            resp.sendRedirect("/login?err=logout");
            return;
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/login.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserService service = new UserService();
        UserDTO userDto = service.login(req, new LoginDTO(email, password));
        if (userDto != null) {
            resp.sendRedirect("/home");
            return;
        } else {
            resp.sendRedirect("/login?err=wrong");
            return;
        }

    }
}
