
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NavBar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .navbar-custom {
            background-color: #f8b400;
            padding: 26px 40px;
            border-radius: 5px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;

        }
        .navbar-custom a {
            color: #333;
            text-decoration: none;
            justify-content: end;
            margin: 0 20px;
            font-size: 20px;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .navbar-custom a:hover {
            color: blue;
        }
        img{
            width: 40px;
        }
    </style>
</head>
<body>

<nav class="navbar-custom d-flex justify-content-around ">
<a href="/dashboard"><img src="https://scontent.ftia5-1.fna.fbcdn.net/v/t39.30808-6/305885052_460907672729399_1374084546977413708_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=0xfCLUL09_cQ7kNvgGxYhrZ&_nc_ht=scontent.ftia5-1.fna&oh=00_AYB7wqgLP2I4WJFSz6S-IU-ooCYBexfWrKmNph8Jgo9PNQ&oe=667FF5E9"></a>
    <a href="/createAccountView">Create Account</a>
    <a href="/createTransactionView">Create Transaction</a>
    <a href="/userAccounts">Your Accounts</a>
    <a href="/logout">Logout</a>
</nav>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>