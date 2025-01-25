<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Failed</title>
    <link rel="stylesheet" href="registerfailed.css"> <!-- Link to the failed registration styling -->
</head>
<body>
    <header>
        <img src="blood 2.jpg" alt="BLOOD 4 YOU Logo" class="logo">
        <h1>Register for BLOOD 4 YOU</h1>
    </header>
    
    <main>
        <h1>Registration Failed</h1>
        <p>Sorry, there was an issue with your registration. Please try again later.</p> 
        <!-- Display the error message dynamically -->
        <h2>Error: <%= request.getAttribute("errorMessage") %></h2>
        <a href="register.html" class="button">Try Again</a>
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
