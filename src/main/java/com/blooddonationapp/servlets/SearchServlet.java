package com.blooddonationapp.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.blooddonationapp.models.DatabaseConnection;
import com.blooddonationapp.models.Donor;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String location = request.getParameter("location");
        String bloodGroup = request.getParameter("bloodgroup");

        List<Donor> availableBlood = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT Name, MobileNumber, Email, Location, BloodGroup FROM Users WHERE BloodGroup = ? AND Location = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, bloodGroup);
            stmt.setString(2, location);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String name = rs.getString("Name");
                String mobileNumber = rs.getString("MobileNumber");
                String email = rs.getString("Email");
                String donorLocation = rs.getString("Location");
                String donorBloodGroup = rs.getString("BloodGroup");

                availableBlood.add(new Donor(name, mobileNumber, email, donorLocation, donorBloodGroup));
            }

            // Set the available blood donors and search parameters as request attributes
            request.setAttribute("availableBlood", availableBlood);
            request.setAttribute("searchLocation", location);
            request.setAttribute("searchBloodGroup", bloodGroup);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Forward to search.jsp to display results
        RequestDispatcher dispatcher = request.getRequestDispatcher("/search.jsp");
        dispatcher.forward(request, response);
    }
}