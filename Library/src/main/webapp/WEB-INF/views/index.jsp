<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        h2 {
            color: #333;
        }
        .button-container {
            margin-top: 20px;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 15px 30px;
            margin: 10px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Welcome to Library System</h2>

    <div class="button-container">
        <!-- Updated href to Spring Boot mapped URL -->
        <button class="button" onclick="location.href='/addbooks'">Add Book</button>
        <button class="button" onclick="location.href='/borrowbooks'">Borrow Book</button>
        <button class="button" onclick="location.href='/api/library/all/books'">Show All Books</button>
        <button class="button" onclick="location.href='/api/library/books/available'">Available Books to Borrow</button>
    </div>
</body>
</html>
