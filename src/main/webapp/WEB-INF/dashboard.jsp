<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <!-- Add your CSS links or styles here -->

</head>
<body>
<div class="d-flex justify-content-between align-items-center">
        <h1 class="mb-0">Welcome ${user.name}!</h1>
<p>This is dashboard page!!</p>
    <a href="/logout">Logout</a>
    <a href="/createAccountView">Create Account</a>
    <a href="/createTransactionView">Create Transaction</a>
    <a href="/userAccounts">Your Accounts</a>
</div>
</body>
</html>