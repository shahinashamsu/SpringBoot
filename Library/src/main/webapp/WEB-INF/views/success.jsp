<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Message Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
        }
        .link:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>${message}</h2>

    <!-- Link to navigate back to the index page -->
    <a href="/index" class="link">Back to Home</a>
</body>
</html>

