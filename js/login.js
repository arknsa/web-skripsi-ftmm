document.addEventListener('DOMContentLoaded', function() {
    // Get references to the form and its elements
    const loginForm = document.querySelector('form');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const forgotPasswordLink = document.querySelector('.forgot-password a');
    const registerLink = document.querySelector('.register a');

    // Add event listener for form submission
    loginForm.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent form from submitting normally

        // Get the values of the email and password inputs
        const email = emailInput.value.trim();
        const password = passwordInput.value.trim();

        // Perform basic validation
        if (validateEmail(email) && validatePassword(password)) {
            // Simulate form submission (e.g., send data to the server)
            console.log('Form submitted successfully:', { email, password });

            // Clear form inputs after successful submission
            emailInput.value = '';
            passwordInput.value = '';

            // Provide feedback to the user (optional)
            alert('Login successful!');
        } else {
            // Show error message (optional)
            alert('Please enter a valid email and password.');
        }
    });

    // Function to validate email
    function validateEmail(email) {
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailPattern.test(email);
    }

    // Function to validate password (minimum 8 characters)
    function validatePassword(password) {
        return password.length >= 8;
    }

    // Add event listener for forgot password link
    forgotPasswordLink.addEventListener('click', function(event) {
        event.preventDefault();
        // Handle forgot password logic (e.g., redirect to forgot password page)
        alert('Forgot password functionality is not implemented yet.');
    });

    // Add event listener for register link
    registerLink.addEventListener('click', function(event) {
        event.preventDefault();
        // Handle register logic (e.g., redirect to registration page)
        alert('Registration functionality is not implemented yet.');
    });
});
