<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Transaction</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: rgb(2,0,36);
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(255,221,81,1) 0%, rgba(26,8,164,1) 100%);
            color: #fff;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-header {
            color: #243b7f;
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-container {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        .form-container .btn{
            background: #243b7f;
            border: none;
            width: 160px;
            height: 60px;
            font-size: larger;
            border-radius: 30px;
            color: white;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container form-container">
    <h2 class="text-center form-header">Create Transaction</h2>

    <c:if test="${not empty transactionError}">
        <div class="alert alert-danger" role="alert">
                ${transactionError}
        </div>
    </c:if>

    <form:form modelAttribute="newTransaction" action="/createTransaction" method="post" class="form gap-3 d-flex flex-column">

        <c:if test="${!empty errors}">
            <div class="alert alert-danger" role="alert">
                <ul>
                    <c:forEach items="${errors.allErrors}" var="error">
                        <li><c:out value="${error.defaultMessage}" /></li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        <div class="row mb-3">
            <div class="col">
                <form:errors path="creditAccount" class="errors text-danger"/>
                <form:label path="creditAccount" class="form-label">Credit Account:</form:label>
                <form:input path="creditAccount" type="text" class="form-control"/>
            </div>
            <div class="col">
                <form:errors path="debitAccount" class="errors text-danger"/>
                <form:label path="debitAccount" class="form-label">Debit Account:</form:label>
                <form:select path="debitAccount" class="form-select">
                    <c:forEach items="${accounts}" var="account">
                        <option value="${account.id}">${account.accountNumber}</option>
                    </c:forEach>
                </form:select>
            </div>
        </div>

        <div class="mb-3">
            <form:errors path="amount" class="errors text-danger"/>
            <form:label path="amount" class="form-label">Amount:</form:label>
            <form:input path="amount" type="text" class="form-control"/>
        </div>

        <div class="mb-3">
            <form:errors path="description" class="errors text-danger"/>
            <form:label path="description" class="form-label">Description:</form:label>
            <form:input path="description" type="text" class="form-control"/>
        </div>


        <div class="text-center mt-4">
            <button type="submit" class="btn">Create</button>
        </div>

    </form:form>
</div>
<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
