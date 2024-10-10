<%@ page import="java.util.List" %>
<%@ page import="com.example.Library.model.Book" %>
<%@ page import="com.example.Library.model.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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

        .form-group {
            display: flex; /* Use flexbox for alignment */
            align-items: center; /* Center vertically */
            margin-bottom: 20px; /* Space below the group */
        }

        .form-group label {
            margin-right: 10px; /* Space between label and dropdown */
            flex: 0 0 30%; /* Allow label to take up 30% of the space */
            text-align: right; /* Right-align label text */
        }

        input[type="text"] {
            width: 100%; /* Full width */
            padding: 10px; /* Inner spacing */
            border: 1px solid #ccc; /* Border */
            border-radius: 5px; /* Rounded corners */
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
            color: white; /* Change text color to white */
            font-weight: bold; /* Make text bold */
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

    <!-- Display any message, if exists -->
    <p class="message">
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
                out.print(message);
            }
        %>
    </p>

   <form action="/api/library/books" method="post">
       <div class="form-group">
           <label for="bookName">Book Name:</label>
           <input type="text" id="bookName" name="bookName" required>
       </div>

       <div class="form-group">
           <label for="authorName">Author Name:</label>
           <input type="text" id="authorName" name="authorName" required>
       </div>

       <div class="form-group">
           <label for="categoryId">Category:</label>

           <%
               // Retrieve categories from the request object
               List<Category> categories = (List<Category>) request.getAttribute("categories");
           %>

           <select id="categoryId" name="categoryId" required>
               <option value="" disabled selected>Select a category</option>
               <%
                   if (categories != null) {
                       for (Category category : categories) {
           %>
               <option value="<%= category.getId() %>"><%= category.getType() %></option>
           <%
                       }
                   }
           %>
           </select>
       </div>

       <button type="submit">Add Book</button>
   </form>

    <!-- Place the Back to Home button directly under the form -->
    <a href="/index" class="back-home">Back to Home</a>
</body>
</html>
