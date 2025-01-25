<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
    <link rel="stylesheet" href="registersuccessful2.css">
</head>
<body>
	<header>
        <img src="blood 2.jpg" alt="BLOOD 4 YOU Logo" class="logo">
        <h1>Register for BLOOD 4 YOU</h1>
    </header>
    
    <main>
    	<h1>Thank You for Registering!</h1> <br>
        <p>Your registration was successful. Welcome to BLOOD 4 YOU!</p> <br>
        <!-- Display the user's name dynamically -->
        <h2>Welcome, <%= request.getAttribute("userName") %>!</h2>
        <a href="login.html" class="button">Go to Login</a>
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
