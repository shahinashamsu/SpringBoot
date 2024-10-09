<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center; /* Center align text */
            margin-top: 50px; /* Space from the top */
            background: url('/images/bglibrary.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh; /* Full height */
            display: flex; /* Use flexbox for centering */
            flex-direction: column; /* Column layout */
            justify-content: center; /* Center vertically */
            align-items: center; /* Center horizontally */
        }

        h2 {
            color: #f8f8f8; /* Light color for better contrast */
            margin-bottom: 20px; /* Space between title and form */
        }

        form {
            display: inline-block; /* Make the form inline-block */
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            border: 1px solid #8b6f4a; /* Brown border */
            border-radius: 8px; /* Rounded corners */
            padding: 25px; /* Inner spacing */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); /* Shadow for depth */
            width: 350px; /* Fixed width */
            margin-bottom: 20px; /* Space below the form */
        }

        label {
            display: block; /* Block for labels */
            margin: 10px 0 5px; /* Space around labels */
            text-align: left; /* Left align text */
            color: #4a3c36; /* Dark brown text */
            font-weight: bold; /* Bold labels */
        }

        input[type="text"] {
            width: 100%; /* Full width */
            padding: 10px; /* Inner spacing */
            border: 1px solid #ccc; /* Border */
            border-radius: 5px; /* Rounded corners */
            margin-bottom: 20px; /* Space below inputs */
            font-size: 16px; /* Font size */
            background-color: #f9f9f9; /* Light input background */
            color: #4a3c36; /* Dark text color */
        }

        button {
            background-color: #8b6f4a; /* Brown button background */
            color: white; /* Text color */
            padding: 12px 20px; /* Button padding */
            border: none; /* No border */
            cursor: pointer; /* Pointer cursor */
            font-size: 16px; /* Font size */
            border-radius: 5px; /* Rounded corners */
            width: 100%; /* Full width for the button */
            transition: background-color 0.3s ease; /* Smooth color transition */
        }

        button:hover {
            background-color: #6b4f3a; /* Darker brown on hover */
        }

        .message {
            color: #4A4A4A; /* Dark message text */
            margin-bottom: 20px; /* Space below message */
        }

        .back-home {
            background-color: #8B6F4A; /* Brown background for button */
            color: #f8f8f8; /* Light text color */
            padding: 10px 20px; /* Padding for the button */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            text-decoration: none; /* No underline */
            display: inline-block; /* Inline block for button styling */
            margin-top: 20px; /* Space above button */
            transition: background-color 0.3s; /* Smooth transition */
        }

        .back-home:hover {
            background-color: #6B4F3A; /* Darker brown on hover */
        }
    </style>
</head>
<body>
    <h2>Add Book</h2>

    <p class="message">${message}</p>

    <form action="/api/library/books" method="post">
        <label for="bookName">Book Name:</label>
        <input type="text" id="bookName" name="bookName" required><br>

        <label for="authorName">Author Name:</label>
        <input type="text" id="authorName" name="authorName" required><br>

        <button type="submit">Add Book</button>
    </form>

    <!-- Place the Back to Home button directly under the form -->
    <a href="/index" class="back-home">Back to Home</a>
</body>
</html>
