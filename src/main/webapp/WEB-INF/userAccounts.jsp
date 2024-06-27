<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>All Accounts</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: rgb(2,0,36);
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(255,221,81,1) 0%, rgba(26,8,164,1) 100%);
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        table {
            width: 80%;
            margin-top: 20px;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
        }
        th {
            background-color: #343a40;
        }
        td {
            background-color: #454d55;
            color: #fff;
        }
        a {
            color: #ffc107;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<div class="container">
    <h2>All Accounts</h2>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Account Number</th>
            <th scope="col">Account Details</th>
            <th scope="col">Account Transactions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${accounts}" var="account">
            <tr>
                <td><c:out value="${account.accountNumber}"/></td>
                <td><a href="/account/${account.id}/details">View Details</a></td>
                <td><a href="/accountTransactions/${account.id}">View Transactions</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


</div>
<footer ><jsp:include page="footer.jsp"/></footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
