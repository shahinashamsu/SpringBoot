<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Library.model.Book" %> <!-- Replace with the actual package of your Book class -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Books</title>
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
    <h2>All Books</h2>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Book Name</th>
            <th>Author Name</th>
            <th>Borrowed</th>
            <th>Borrowed By</th>
        </tr>

        <!-- Retrieve the list of books from the request -->
        <%
            List<Book> books = (List<Book>) request.getAttribute("books"); // Retrieve the books list from request
            if (books != null) {
                for (Book book : books) {
        %>
            <tr>
                <td><%= book.getId() %></td>
                <td><%= book.getBookName() %></td>
                <td><%= book.getAuthorName() %></td>
                <td><%= book.isBorrowed() %></td> <!-- Assuming isBorrowed() method returns boolean -->
                <td><%= book.getBorrowedBy() != null ? book.getBorrowedBy() : "Not Borrowed" %></td> <!-- Handle null borrowedBy -->
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5">No books available.</td>
            </tr>
        <%
            }
        %>
    </table>

    <!-- Button to navigate back to the index page -->
    <div class="button-container">
        <button class="button" onclick="location.href='/'">Back to Home</button>
    </div>

</body>
</html>
