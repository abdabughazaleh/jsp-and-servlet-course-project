package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dto.LoginDTO;
import model.dto.UserDTO;
import model.dto.UserRegisterDTO;
import service.UserService;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/register.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String name = req.getParameter("fullname");
        String mobile = req.getParameter("mobile");

        UserRegisterDTO registerDTO = new UserRegisterDTO(email, password, name, mobile , LocalDate.now());
        UserService service = new UserService();
        service.register(req, registerDTO);
        UserDTO userDTO = service.login(req ,new LoginDTO(email , password));
        if (userDTO != null) {
            resp.sendRedirect("/home");
            return;
        } else {
            resp.sendRedirect("/login?err=register_error");
            return;
        }
    }
}