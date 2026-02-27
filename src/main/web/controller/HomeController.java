package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.NoteDao;
import model.dto.NoteDTO;
import service.SessionService;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        NoteDao dao = new NoteDao();
        SessionService sessionService = new SessionService(req);
        if (sessionService.validateUserAccess()) {
            List<NoteDTO> notes = dao.getUserNotesByUserId(sessionService.getCurrentUser().getId(), 4);
            req.setAttribute("notes" , notes);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/home.jsp");
        dispatcher.forward(req, resp);
    }
}
