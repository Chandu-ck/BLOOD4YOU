package com.blooddonationapp.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
            // Check if the mobile number already exists
            String checkMobileQuery = "SELECT COUNT(*) FROM Users WHERE MobileNumber = ?";
            PreparedStatement checkMobileStmt = conn.prepareStatement(checkMobileQuery);
            checkMobileStmt.setString(1, mobile);
            ResultSet mobileRs = checkMobileStmt.executeQuery();

            // Check if the email address already exists
            String checkEmailQuery = "SELECT COUNT(*) FROM Users WHERE Email = ?";
            PreparedStatement checkEmailStmt = conn.prepareStatement(checkEmailQuery);
            checkEmailStmt.setString(1, email);
            ResultSet emailRs = checkEmailStmt.executeQuery();

            boolean mobileExists = false;
            boolean emailExists = false;

            if (mobileRs.next() && mobileRs.getInt(1) > 0) {
                mobileExists = true;
            }

            if (emailRs.next() && emailRs.getInt(1) > 0) {
                emailExists = true;
            }

            // If either mobile or email exists, show error messages
            if (mobileExists) {
                request.setAttribute("errorMessage", "This mobile number is already registered.");
                request.getRequestDispatcher("registerfailed.jsp").forward(request, response);
            } else if (emailExists) {
                request.setAttribute("errorMessage", "This email address is already registered.");
                request.getRequestDispatcher("registerfailed.jsp").forward(request, response);
            } else {
                // If no duplicates, proceed with registration
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
                    // Set the userName attribute to pass it to the JSP
                    request.setAttribute("userName", name);
                    // Forward to the registration success page
                    request.getRequestDispatcher("registersuccessful.jsp").forward(request, response);
                } else {
                    // In case of failure, forward to failed registration page
                    request.setAttribute("errorMessage", "Registration failed. Please try again later.");
                    request.getRequestDispatcher("registerfailed.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // In case of an exception, forward to failed registration page with error message
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("registerfailed.jsp").forward(request, response);
        }
    }
}
