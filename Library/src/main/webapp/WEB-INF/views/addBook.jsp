<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
            background-color: #f9f9f9;
        }

        h2 {
            color: #333;
        }

        form {
            display: inline-block;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin: 10px 0 5px;
            text-align: left;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 16px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            margin-top: 10px;
        }

        button:hover {
            background-color: #45a049;
        }

        .message {
            color: green;
            margin-bottom: 20px;
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
</body>
</html>

