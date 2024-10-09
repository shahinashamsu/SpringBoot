<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
            background: url('/images/bg2.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            position: relative;
        }

        h2 {
            color: #fff;
        }

        .login-container {
            display: inline-block;
            text-align: left;
            background-color: rgba(255, 255, 255, 0.95); /* Lighter background for form */
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.25); /* Stronger shadow */
            max-width: 400px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #333; /* Darker label color for contrast */
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 5px 0 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f5f5f5;
            color: #333;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #00a5a5; /* Teal border on focus */
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #00a5a5; /* Teal button background */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #007575; /* Darker teal on hover */
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <h2>Login</h2>
    <div class="login-container">
        <form action="/login" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>

            <!-- Display error message if present -->
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
                <div class="error-message"><%= error %></div>
            <%
                }
            %>
        </form>
    </div>
</body>
</html>
