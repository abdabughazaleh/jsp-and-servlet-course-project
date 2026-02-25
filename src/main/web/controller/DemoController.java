package controller;

import db.DBConnection;
import db.DBOperations;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/demo")
public class DemoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ResultSet rs = DBOperations.executeQuery("SELECT * FROM users ");
            while (rs.next()){
                System.out.println("username : " + rs.getString("email"));
            }
            DBConnection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
