package model.dto;

import java.time.LocalDate;

public record UserRegisterDTO(String email,
                              String password,
                              String name,
                              String mobile,
                              LocalDate createdAt) {

}
