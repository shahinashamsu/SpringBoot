<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Library.model.Book" %> <!-- Change this to your actual package -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Books</title>
     <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                margin-top: 20px;
            }
            table {
                margin: 0 auto;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid black;
                padding: 10px;
            }
            th {
                background-color: #f2f2f2;
            }
            .button-container {
                margin-top: 20px;
            }
            .button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                margin: 10px;
                border: none;
                cursor: pointer;
                font-size: 14px;
                border-radius: 5px;
            }
            .button:hover {
                background-color: #45a049;
            }
        </style>
</head>
<body>
    <h2>Available Books</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Book Name</th>
            <th>Author Name</th>
        </tr>

        <!-- Loop through the list of books using scriptlets -->
        <%
            List<Book> books = (List<Book>) request.getAttribute("books"); // Retrieve the books list from request
            if (books != null) {
                for (Book book : books) {
        %>
            <tr>
                <td><%= book.getId() %></td>
                <td><%= book.getBookName() %></td>
                <td><%= book.getAuthorName() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="3">No available books</td>
            </tr>
        <%
            }
        %>
    </table>
     <div class="button-container">
            <button class="button" onclick="location.href='/'">Back to Home</button>
       </div>
</body>
</html>
