package model.dto;

public record AddNoteDTO(String title,
                         String note,
                         Integer userId) {
}
