package model.dto;

import java.time.LocalDate;

public record NoteDTO(Integer id ,
                      String title,
                      String note,
                      Integer userId,
                      String noteCode,
                      String createdAt,
                      String updatedAt) {
}
