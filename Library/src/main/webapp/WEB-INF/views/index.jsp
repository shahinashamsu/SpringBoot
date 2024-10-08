<%@ page import="java.util.List" %>
<%@ page import="com.example.Library.model.Book" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
  <style>
      body {
          font-family: 'Helvetica Neue', Arial, sans-serif;
          background-color: #f4f4f4; /* Light background for contrast */
          text-align: center;
          margin-top: 50px;
          color: #333; /* Default text color */
      }

      h2 {
          color: #4A4A4A; /* Darker shade for headings */
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
          background-color: #007BFF; /* Bootstrap primary color */
          color: white;
          padding: 12px 25px;
          margin: 10px;
          border: none;
          cursor: pointer;
          font-size: 16px;
          border-radius: 5px;
          transition: background-color 0.3s, transform 0.2s; /* Smooth transitions */
      }

      .button:hover {
          background-color: #0056b3; /* Darker blue on hover */
          transform: translateY(-2px); /* Lift effect on hover */
      }

      .button:disabled {
          background-color: #ccc; /* Light grey for disabled button */
          cursor: not-allowed; /* Indicate it's not clickable */
          color: #666; /* Darker grey text */
      }

      .book-box {
          border: 1px solid #ddd; /* Softer border */
          border-radius: 5px;
          padding: 15px;
          margin: 10px;
          display: inline-block;
          width: 220px; /* Slightly wider for better layout */
          background-color: white; /* White background for book box */
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
          transition: box-shadow 0.3s; /* Smooth shadow transition */
      }

      .book-box:hover {
          box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15); /* Shadow on hover */
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
          background-color: #28a745; /* Bootstrap success color */
          color: white;
          padding: 10px 20px;
          border: none;
          cursor: pointer;
          font-size: 14px;
          border-radius: 5px;
          transition: background-color 0.3s; /* Smooth transition */
      }

      .add-book-button:hover {
          background-color: #218838; /* Darker green on hover */
      }
  </style>

</head>
<body>
     <!-- Display welcome message with username -->
     <h2>Welcome, <%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>!</h2>

     <!-- Display any message -->
     <%
         String message = (String) request.getAttribute("message");
         if (message != null) {
     %>
         <div style="color: green;"><%= message %></div>
     <%
         }
     %>

     <!-- Add Book Button -->
     <button class="add-book-button" onclick="location.href='/addbooks'">Add Book</button>

     <!-- Logout button -->
     <form action="/logout" method="post" style="display: inline;">
         <button class="logout-button" type="submit">Logout</button>
     </form>

     <div class="button-container">
         <%
             List<Book> books = (List<Book>) request.getAttribute("books");
             if (books != null && !books.isEmpty()) {
                 for (Book book : books) {
         %>
                     <div class="book-box" style="position: relative; padding: 15px; border: 1px solid #ccc; border-radius: 5px; margin: 10px; display: inline-block; width: 220px;">
                         <strong><%= book.getBookName() %></strong><br>
                         <span>Author: <%= book.getAuthorName() %></span><br>
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
                         <!-- Close button that directly links to the delete action -->
                         <a href="/delete?bookId=<%= book.getId() %>" class="close-button" style="color: red; text-decoration: none; font-weight: bold; position: absolute; top: 5px; right: 5px;">X</a>
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

 </body>
</html>

