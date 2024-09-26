<html>
<body>
    <h2>Add Book</h2>
    <p>${message}</p>
    <form action="/api/library/books" method="post">
        <label for="bookName">Book Name:</label>
        <input type="text" id="bookName" name="bookName"><br>
        <label for="authorName">Author Name:</label>
        <input type="text" id="authorName" name="authorName"><br>
        <button type="submit">Add Book</button>
    </form>
</body>
</html>
