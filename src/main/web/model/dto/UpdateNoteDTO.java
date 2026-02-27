package model.dto;

public record UpdateNoteDTO(String title,
                            String note,
                            String code,
                            Integer userId) {
}
