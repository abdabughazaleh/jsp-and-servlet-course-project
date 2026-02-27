package model.dao;

import db.DBConnection;
import db.DBOperations;
import model.dto.AddNoteDTO;
import model.dto.NoteDTO;
import model.dto.UpdateNoteDTO;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.logging.Logger;

public class NoteDao {
    private static final Logger logger = Logger.getLogger(NoteDao.class.getName());

    public NoteDTO save(AddNoteDTO dto) {
        String createdAt = LocalDate.now().toString();
        String noteCode = UUID.randomUUID().toString();
        DBOperations.executeUpdate("insert into " +
                "user_notes(title, note, user_id, note_code,created_at)" +
                "values ('" + dto.title() + "','" + dto.note() + "','" + dto.userId() + "','" + noteCode + "','" + createdAt + "')");
        DBConnection.close();
        return this.getNoteByCode(noteCode);
    }

    public NoteDTO getNoteByCode(String code) {
        ResultSet rs = DBOperations.executeQuery("select * from user_notes where note_code = '" + code + "'");
        try {
            if (rs.next()) {
                int noteId = rs.getInt("note_id");
                String note = rs.getString("note");
                String title = rs.getString("title");
                int userId = rs.getInt("user_id");
                String createdAt = rs.getString("created_at");
                String updatedAt = rs.getString("updated_at");
                NoteDTO noteDTO = new NoteDTO(noteId, title, note, userId, code, createdAt, updatedAt);
                logger.info("noteDTO ==> " + noteDTO);
                return noteDTO;
            }
        } catch (Exception e) {
            logger.info("Error in getNoteByCode :" + e.getMessage());
        }

        return null;
    }

    public List<NoteDTO> getUserNotesByUserId(int userId, Integer limit) {
        String query;
        if (limit == null) {
            query = "select * from user_notes where user_id = '" + userId + "'";
        } else {
            query = "select * from user_notes where user_id = '" + userId + "' limit " + limit;
        }

        ResultSet rs = DBOperations.executeQuery(query);
        List<NoteDTO> dtoList = new ArrayList<>();
        try {
            while (rs.next()) {
                dtoList.add(new NoteDTO(rs.getInt("note_id"),
                        rs.getString("title"),
                        rs.getString("note")
                        , userId,
                        rs.getString("note_code"),
                        rs.getString("created_at"),
                        rs.getString("updated_at")));
            }
            return dtoList;
        } catch (Exception e) {
            logger.info("Error in getNoteByCode :" + e.getMessage());
        }
        return dtoList;
    }

    public void deleteByCode(String code, int userId) {
        NoteDTO noteByCode = getNoteByCode(code);
        if (noteByCode.userId() != userId) {
            throw new RuntimeException("You cannot do this action!");
        }
        DBOperations.executeUpdate("delete from user_notes where userId = '" + userId + "' and note_code='" + code + "'");
    }

    public void updateNote(UpdateNoteDTO dto) {
        NoteDTO noteByCode = getNoteByCode(dto.code());
        if (noteByCode.userId() != dto.userId()) {
            throw new RuntimeException("You cannot do this action!");
        }
        String updatedAt = LocalDateTime.now().toString();
        DBOperations.executeUpdate("update user_notes set " +
                "title='" + dto.title() + "', note ='" + dto.note() + "', updated_at = '" + updatedAt + "' " +
                "where user_id = '" + dto.userId() + "' and note_code='" + dto.code() + "'");
    }
}
