<%@ page import="java.util.List" %>
<%@ page import="com.blooddonationapp.models.Donor" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Blood Donors</title>
    <link rel="stylesheet" href="donors.css">
</head>
<body>
    <header>
       <img src="blood 2.jpg" alt="BLOOD 4 YOU Logo" class="logo">
        <h1>Search for Blood Donors</h1>
    </header>

    <main>
        <form action="search" method="GET" class="search-form">
            <!-- Retaining location and blood group inputs after search -->
            <input type="text" name="location" placeholder="Location" value="<%= request.getAttribute("searchLocation") != null ? request.getAttribute("searchLocation") : "" %>" required><br><br>
            <input type="text" name="bloodgroup" placeholder="Blood Group" value="<%= request.getAttribute("searchBloodGroup") != null ? request.getAttribute("searchBloodGroup") : "" %>" required><br><br>
            <button type="submit" class="button">Search</button>
        </form>

        <h2>Available Donors:</h2>
        <ul class="donor-list">
            <% 
                // Get the available blood donors from the request attributes
                List<Donor> availableBlood = (List<Donor>) request.getAttribute("availableBlood");
                if (availableBlood != null && !availableBlood.isEmpty()) {
                    for (Donor donor : availableBlood) {
            %>
                <li class="donor-item">
                    <b>Name:</b> <%= donor.getName() %><br>
                    <b>Phone:</b> <%= donor.getMobileNumber() %><br>
                    <b>Email:</b> <%= donor.getEmail() %><br>
                    <b>Location:</b> <%= donor.getLocation() %><br>
                    <b>Blood Group:</b> <%= donor.getBloodGroup() %><br>
                </li>
                <hr>
            <% 
                    }
                } else {
            %>
                <li>No available donors found.</li>
            <% 
                }
            %>
        </ul>
    </main>

    <footer>
        <div class="footer-content">
            <p>&copy; 2024 Blood Donation App. All rights reserved.</p>
            <div class="social-links">
                <a href="mailto:your-email@gmail.com" class="social-icon">Gmail</a>
                <a href="https://wa.me/your-whatsapp-number" class="social-icon">WhatsApp</a>
            </div>
        </div>
    </footer>
</body>
</html>
