package model.dto;

import java.time.LocalDate;

public class UserDTO {
    private Integer id;
    private String email ;
    private String mobileNo ;
    private String password ;
    private String name ;
    private String createdAt ;
    private String userCode ;

    public UserDTO(Integer id, String email, String mobileNo, String password, String name, String createdAt, String userCode) {
        this.id = id;
        this.email = email;
        this.mobileNo = mobileNo;
        this.password = password;
        this.name = name;
        this.createdAt = createdAt;
        this.userCode = userCode;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", mobileNo='" + mobileNo + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", createdAt='" + createdAt + '\'' +
                ", userCode='" + userCode + '\'' +
                '}';
    }
}
