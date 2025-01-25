<%@ page import="java.util.List" %>
<%@ page import="com.blooddonationapp.models.Donor" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Blood Donors</title>
    <link rel="stylesheet" href="donorsearch2.css">
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
                String searchedBloodGroup = (String) request.getAttribute("searchBloodGroup");
                
                // URL-encode the blood group to ensure it's properly formatted for a URL
                String encodedBloodGroup = URLEncoder.encode(searchedBloodGroup != null ? searchedBloodGroup : "Blood Group", "UTF-8");
                
                if (availableBlood != null && !availableBlood.isEmpty()) {
                    for (Donor donor : availableBlood) {
            %>
                <li class="donor-item">
                    <b>Name:</b> <%= donor.getName() %><br>
                    <b>Phone:</b> <%= donor.getMobileNumber() %><br>
                    <b>Email:</b> <%= donor.getEmail() %><br>
                    <b>Location:</b> <%= donor.getLocation() %><br>
                    <b>Blood Group:</b> <%= donor.getBloodGroup() %><br>
                    
                    <!-- WhatsApp Contact Link with Default India Country Code (+91) -->
                    <a href="https://wa.me/+91<%= donor.getMobileNumber() %>?text=Hi%20<%= donor.getName() %>%2C%20I%27m%20a%20member%20of%20Blood%204%20You%20and%20I%27m%20currently%20seeking%20<%= encodedBloodGroup %>%20blood.%20I%20saw%20that%20you%27re%20from%20<%= donor.getLocation() %>%20and%20would%20love%20to%20get%20in%20touch.%20Please%20contact%20me%20if%20you%27re%20able%20to%20help.%20Thank%20you." class="social-icon" target="_blank">Contact via WhatsApp</a>
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
            <p>&copy; 2025 BLOOD 4 YOU. Designed By<a href="https://busagani.netlify.app/"class="social-icon" aria-label="Profile">Chandu.</a> </p>
            <div class="social-links">
                <a href="mailto:your-email@gmail.com" class="social-icon" aria-label="Send an email">Gmail</a>
                <a href="https://chat.whatsapp.com/EKckhyum8UF3NaEF3d6XWM" class="social-icon" aria-label="Join WhatsApp Group">WhatsApp</a>
            </div>
        </div>
    </footer>
</body>
</html>
