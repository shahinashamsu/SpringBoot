<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Message Page</title>
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif; /* Fun font for a cute effect */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('/images/bglibrary.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }

        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.85); /* Semi-transparent white for background */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3); /* Deeper shadow for a 'floating' look */
            animation: popUp 1.2s ease-in-out;
        }

        /* Bounce animation to make the message 'pop' */
        @keyframes popUp {
            0% {
                transform: scale(0.8);
                opacity: 0;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #6b4f3a; /* Soft brown for the message text */
        }

        .link {
            display: inline-block;
            text-decoration: none;
            color: white;
            background-color: #8b6f4a; /* Brown button */
            padding: 12px 25px;
            border-radius: 8px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .link:hover {
            background-color: #d48a55; /* Cute peach color on hover */
            transform: translateY(-5px) rotate(-3deg); /* Fun lift and tilt effect */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Shadow on hover */
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>${message}</h2>

        <!-- Link to navigate back to the index page -->
        <a href="/index" class="link">Back to Home</a>
    </div>
</body>
</html>
