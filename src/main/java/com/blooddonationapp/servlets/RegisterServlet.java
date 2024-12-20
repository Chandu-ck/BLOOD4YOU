package com.blooddonationapp.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.blooddonationapp.models.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String location = request.getParameter("location");
        String bloodGroup = request.getParameter("bloodgroup");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO Users (Name, MobileNumber, Email, Password, Location, BloodGroup) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, mobile);
            stmt.setString(3, email);
            stmt.setString(4, password);
            stmt.setString(5, location);
            stmt.setString(6, bloodGroup);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("login.html");
            } else {
                response.getWriter().write("Registration failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
