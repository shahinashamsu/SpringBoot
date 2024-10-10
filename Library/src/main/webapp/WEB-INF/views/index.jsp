<%@ page import="java.util.List" %>
<%@ page import="com.example.Library.model.Book" %>
<%@ page import="com.example.Library.model.Category" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background: url('/images/bglibrary.jpg') no-repeat center center fixed; /* Background image */
            background-size: cover; /* Cover the entire page */
            text-align: center;
            margin-top: 50px;
            color: #f8f8f8; /* Light text color for better contrast */
        }

        h2 {
            color: #f8f8f8; /* Light color for the heading */
            margin-bottom: 20px;
            font-weight: 300; /* Light weight for a modern look */
        }

        .button-container {
            margin-top: 20px;
            display: flex; /* Flexbox for better alignment */
            flex-wrap: wrap; /* Allow wrapping of buttons */
            justify-content: center; /* Center align */
        }

        .button {
            background-color: #4B3D3D; /* Dark brown for buttons */
            color: #f8f8f8; /* Light text color for buttons */
            padding: 12px 25px;
            margin: 10px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s; /* Smooth transitions */
        }

        .button:hover {
            background-color: #7a5c5c; /* Lighter brown on hover */
            transform: translateY(-2px); /* Lift effect on hover */
        }

        .button:disabled {
            background-color: #ccc; /* Light grey for disabled button */
            cursor: not-allowed; /* Indicate it's not clickable */
            color: #666; /* Darker grey text */
        }

        .book-box {
            position: relative; /* Relative positioning to allow absolute delete button positioning */
            border: 1px solid #f8f8f8; /* Light border for better visibility */
            border-radius: 5px;
            padding: 15px;
            margin: 10px;
            display: inline-block;
            width: 220px; /* Slightly wider for better layout */
            background-color: rgba(255, 255, 255, 0.8); /* White background with slight transparency */
            color: #333; /* Dark text color for book box */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            transition: box-shadow 0.3s; /* Smooth shadow transition */
        }

        .book-box:hover {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15); /* Shadow on hover */
        }

        .close-button {
            position: absolute;
            top: 5px;
            right: 5px;
            color: red;
            text-decoration: none;
            font-weight: bold;
            cursor: pointer; /* Indicate it's clickable */
        }

        .logout-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #f44336; /* Bootstrap danger color */
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            border-radius: 5px;
            transition: background-color 0.3s; /* Smooth transition */
        }

        .logout-button:hover {
            background-color: #d32f2f; /* Darker red on hover */
        }

        .add-book-button {
            position: absolute;
            top: 20px;
            right: 130px;
            background-color:  #f5deb3; /* Light beige */
            color:  #4A4A4A;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            border-radius: 5px;
            transition: background-color 0.3s; /* Smooth transition */
        }

        .add-book-button:hover {
            background-color: #e3c58a; /* Slightly darker beige on hover */
        }

        .back-button {
            margin-top: 30px;
            background-color: #6b4f3a; /* Dark brown */
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s; /* Smooth transitions */
        }

        .back-button:hover {
            background-color: #8b6f4a; /* Lighter brown on hover */
            transform: translateY(-2px); /* Lift effect */
        }

        .pagination {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #f8f8f8; /* Light color for pagination text */
        }

        .pagination a {
            background-color: rgba(75, 61, 61, 0.7); /* Dark brown with transparency for links */
            color: #f8f8f8;
            padding: 8px 15px;
            margin: 0 5px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .pagination a:hover {
            background-color: rgba(122, 92, 92, 0.9); /* Lighter brown on hover */
            transform: translateY(-2px);
        }

        .pagination span {
            margin: 0 10px;
            color: #f8f8f8;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Welcome, <%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>!</h2>

    <!-- Search Form -->
    <form action="/index" method="get" style="margin-bottom: 20px;">
        <input type="text" name="search" value="${search != null ? search : ''}" placeholder="Search by book name">
        <button type="submit">Search</button>
    </form>

    <!-- Category Dropdown for Sorting -->
    <form action="/index" method="get" style="margin-bottom: 20px;">
        <label for="categoryId">Category:</label>
        <select name="categoryId" style="margin-left: 10px;">
            <option value="">-- Select Category --</option>
            <%
                List<Category> categories = (List<Category>) request.getAttribute("categories");
                Integer selectedCategoryId = (Integer) request.getAttribute("categoryId"); // Get the selected categoryId
                if (categories != null) {
                    for (Category category : categories) {
            %>
                <option value="<%= category.getId() %>" <%= selectedCategoryId != null && selectedCategoryId.equals(category.getId()) ? "selected" : "" %>><%= category.getType() %></option>
            <%
                    }
                }
            %>
        </select>
        <button type="submit" name="sort" value="true">Sort</button>
    </form>

    <!-- Display any success or error message -->
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <div style="color: white;"><%= message %></div>
    <%
        }
    %>

      <!-- Add Book Button -->
      <form action="api/library/addbooks" method="get" style="display: inline;">
          <button class="add-book-button" type="submit">Add Book</button>
      </form>


    <!-- Logout button -->
    <form action="/logout" method="post" style="display: inline;">
        <button class="logout-button" type="submit">Logout</button>
    </form>



    <!-- Book List -->
    <div class="button-container">
        <%
            List<Book> books = (List<Book>) request.getAttribute("books");
            if (books != null && !books.isEmpty()) {
                for (Book book : books) {
        %>
                    <div class="book-box">
                        <strong><%= book.getBookName() %></strong><br>
                        <span>Author: <%= book.getAuthorName() %></span><br>
                        <span>Category: <%= book.getCategory().getType() %></span><br> <!-- Display category -->
                        <%
                            boolean isBorrowed = book.isBorrowed();
                            if (isBorrowed) {
                        %>
                            <button class="button" disabled style="background-color: grey;">Borrowed</button>
                        <%
                            } else {
                        %>
                            <!-- Borrower Name Input Box -->
                            <form action="/borrow" method="post" style="display: inline; margin-top: 5px;">
                                <input type="hidden" name="bookId" value="<%= book.getId() %>">
                                <input type="text" name="borrowerName" placeholder="Enter your name" required style="margin-bottom: 5px; width: 95%;">
                                <button class="button" type="submit">Borrow Book</button>
                            </form>
                        <%
                            }
                        %>
                        <!-- Delete button that links to the delete action -->
                        <a href="/delete?bookId=<%= book.getId() %>" class="close-button">X</a>
                    </div>
        <%
                }
            } else {
        %>
                <div>No books available.</div>
        <%
            }
        %>
    </div>

      <!-- Display a Back to Index button if sorting by category or searching for books -->
        <%
            String searchQuery = request.getParameter("search");
            Integer categoryId = (Integer) request.getAttribute("categoryId");
            if (searchQuery != null && !searchQuery.trim().isEmpty() || categoryId != null) {
        %>
            <div>
                <a href="/index" class="back-button">Back to Home</a>
            </div>
        <%
            }
        %>

    <!-- Pagination controls -->
    <div class="pagination">
        <%
            int currentPage = (Integer) request.getAttribute("currentPage");
            int totalPages = (Integer) request.getAttribute("totalPages");
            int pageSize = (Integer) request.getAttribute("pageSize");
        %>

        <!-- Previous Page Link -->
        <% if (currentPage > 0) { %>
            <a href="/index?pageNo=<%= currentPage - 1 %>&pageSize=<%= pageSize %>">Previous</a>
        <% } %>

        <!-- Display the Current Page and Total Pages -->
        <span>Page <%= currentPage + 1 %> of <%= totalPages %></span>

        <!-- Next Page Link -->
        <% if (currentPage < totalPages - 1) { %>
            <a href="/index?pageNo=<%= currentPage + 1 %>&pageSize=<%= pageSize %>">Next</a>
        <% } %>
    </div>
</body>


</html>
