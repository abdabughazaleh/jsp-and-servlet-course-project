package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.NoteDao;
import model.dto.AddNoteDTO;
import model.dto.NoteDTO;
import model.dto.UpdateNoteDTO;
import model.dto.UserDTO;
import service.SessionService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/notes")
public class NotesController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SessionService service = new SessionService(req);
        if (!service.validateUserAccess()) {
            resp.sendRedirect("/login?err=access_denied");
            return;
        }
        String noteCode = req.getParameter("noteCode");
        String action = req.getParameter("action");
        NoteDao dao = new NoteDao();

        if (action != null && action.equals("delete") && noteCode != null) {
            dao.deleteByCode(noteCode, service.getCurrentUser().getId());
            resp.sendRedirect("/notes?status=note_deleted");
            return;
        }

        if (noteCode != null) {
            NoteDTO noteDTO = dao.getNoteByCode(noteCode);
            req.setAttribute("note_dto", noteDTO);
        }
        List<NoteDTO> notes = dao.getUserNotesByUserId(service.getCurrentUser().getId());
        req.setAttribute("notes", notes);


        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/notes.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SessionService service = new SessionService(req);
        if (!service.validateUserAccess()) {
            resp.sendRedirect("/login?err=access_denied");
            return;
        }
        String action = req.getParameter("action");
        String noteCode = req.getParameter("noteCode");
        String note = req.getParameter("note");
        String title = req.getParameter("title");
        UserDTO currentUser = service.getCurrentUser();
        NoteDao dao = new NoteDao();
        if (action != null && action.equals("update")) {
            if (noteCode != null) {
                UpdateNoteDTO dto = new UpdateNoteDTO(title, note, noteCode, currentUser.getId());
                dao.updateNote(dto);
                resp.sendRedirect("/notes?noteCode=" + noteCode + "&status=updated");
                return;
            }
        } else {
            resp.sendRedirect("/notes?noteCode=" + noteCode + "&status=error");
        }


        AddNoteDTO dto = new AddNoteDTO(title, note, currentUser.getId());


        NoteDTO savedNote = dao.save(dto);

        resp.sendRedirect("/notes?noteCode=" + savedNote.noteCode());
    }
}
