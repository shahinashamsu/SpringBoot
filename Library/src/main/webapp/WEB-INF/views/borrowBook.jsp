<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow Book</title>
</head>
<body>
    <h2>Borrow Book</h2>
    <p>${message}</p>
    <p>${error}</p>

    <!-- Corrected Form -->
    <form action="/api/library/books/borrow" method="post">
        <label for="id">Book ID:</label>
        <input type="text" id="id" name="id" required><br>

        <label for="borrowedBy">Borrower Name:</label>
        <input type="text" id="borrowedBy" name="borrowedBy" required><br>

        <button type="submit">Borrow Book</button>
    </form>
</body>
</html>
