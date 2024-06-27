<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Account</title>
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
      margin-top: 5px;
    }
      .form-container .btn{
        background: #243b7f;
        border: none;
        width: 160px;
        height: 60px;
        font-size: larger;
        border-radius: 30px;

      }

  </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
  <h2 class="text-center form-header">Create Account</h2>

  <div class="form-container">
    <form:form modelAttribute="newAccount" action="/createAccount" method="post" class="form gap-3 d-flex flex-column">
      <div class="mb-3">
        <form:errors path="account_type" class="errors text-danger"/>
        <label for="accountType" class="form-label">Select Account Type</label>
        <form:select path="account_type" id="accountType" class="form-select">
          <form:options items="${accountTypes}" />
        </form:select>
      </div>

      <div class="mb-3">
        <form:errors path="currency" class="errors text-danger"/>
        <label for="currency" class="form-label">Currency</label>
        <form:select path="currency" id="currency" class="form-select">
          <form:options items="${currencies}" />
        </form:select>
      </div>

      <div class="mb-3">
        <form:errors path="balance" class="errors text-danger"/>
        <label for="balance" class="form-label">Balance:</label>
        <form:input path="balance" id="balance" type="number" class="form-control"/>
      </div>

      <div class="text-center mt-4">
        <button type="submit" class="btn btn-primary ">Create</button>
      </div>
    </form:form>

  </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
