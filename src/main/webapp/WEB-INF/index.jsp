<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login And Register</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: rgb(2,0,36);
      background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(255,221,81,1) 0%, rgba(26,8,164,1) 100%);
      color: #fff;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .container {
      max-width:40%;

      position: center;
      margin-top:10%;
      padding: 80px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgb(73, 73, 73);
      background-color: rgb(13, 43, 91);
    }
    .btn-custom {
      background-color: #f4ba20;
      color: #333;
      border: none;
      transition: background-color 0.3s ease;
    }
    .btn-custom:hover {
      background-color: #e0a800;
      color: #333;
    }
    .form-floating {
      width: 100%;
    }
    .btn-submit {
      background-color: blue;
      border: none;
      color: white;
      padding: 10px 20px;
      cursor: pointer;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }
    .btn-submit:hover {
      background-color: blue;
    }

    .form-header {
      color: #fff;
      font-weight: bold;
      margin-bottom: 28px;
    }
    .form-container {
      background-color: rgba(255, 255, 255, 0.25);
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    }
  </style>
</head>
<body>
<div class="container">
  <div class="text-center">
    <h2 class="form-header">Welcome to Our Statement of Account Application</h2>
    <p>Manage your accounts and generate statements easily!</p>
  </div>
  <div class="d-flex justify-content-evenly">
    <button class="btn btn-lg btn-custom" type="button" data-bs-toggle="collapse" data-bs-target="#collapseRegister" aria-expanded="false" aria-controls="collapseRegister">
      Register
    </button>
    <button class="btn btn-lg btn-custom" type="button" data-bs-toggle="collapse" data-bs-target="#collapseLogin" aria-expanded="false" aria-controls="collapseLogin">
      Login
    </button>
  </div>

  <div class=" mt-4 rounded form-container collapse" id="collapseRegister">
    <h3 class="mb-4 text-center">Register</h3>
    <form:form modelAttribute="newCustomer" action="/register" method="post" class="gap-3">
      <div class="form-floating">
        <form:input path="name" id="name" type="text" class="form-control" placeholder="Name"/>
        <form:label path="name" for="name">Firstname</form:label>
        <form:errors path="name" class="errors text-danger"/>
      </div>
      <div class="form-floating">
        <form:input path="lastname" id="lastname" type="text" class="form-control" placeholder="Lastname"/>
        <form:label path="lastname" for="lastname">Lastname</form:label>
        <form:errors path="lastname" class="errors text-danger"/>
      </div>
      <div class="form-floating">
        <form:input path="age" id="lastname" type="age" class="form-control" placeholder="Age"/>
        <form:label path="age" for="age">Age</form:label>
        <form:errors path="age" class="errors text-danger"/>
      </div>
      <div class="form-floating">
        <form:input path="personalNumberId" id="personalNr" type="text" class="form-control" placeholder="Personal Number"/>
        <form:label path="personalNumberId" for="personalNr">Personal Number</form:label>
        <form:errors path="personalNumberId" class="errors text-danger"/>
      </div>
      <div class="form-floating">
        <form:input path="email" id="email" type="text" class="form-control" placeholder="Email"/>
        <form:label path="email" for="email">Email</form:label>
        <form:errors path="email" class="errors text-danger"/>
      </div>
      <div class="form-floating">
        <form:input path="password" id="password" type="password" class="form-control" placeholder="Password"/>
        <form:label path="password" for="password">Password</form:label>
        <form:errors path="password" class="errors text-danger"/>
      </div>
      <div class="form-floating">
        <form:input path="passConfirm" id="confirm" type="password" class="form-control" placeholder="Confirm Password"/>
        <form:label path="passConfirm" for="confirm">Confirm Password</form:label>
        <form:errors path="passConfirm" class="errors text-danger"/>
      </div>
      <div class="text-center mt-3">
        <button class="btn btn-lg btn-submit" type="submit">Submit</button>
      </div>
    </form:form>
  </div>

  <div class=" mt-4 rounded form-container collapse" id="collapseLogin">
    <h3 class="mb-4 text-center">Login</h3>
    <form:form modelAttribute="newLogin" action="/login" method="post" class="gap-3">
      <div class="form-floating">
        <form:input path="personalNumberId" id="personal_nr" type="text" class="form-control" placeholder="Personal Number"/>
        <form:label path="personalNumberId" for="personal_nr">Personal Number</form:label>
        <form:errors path="personalNumberId" class="errors text-danger"/>
      </div>
      <div class="form-floating">
        <form:input path="password" id="login-pass" type="password" class="form-control" placeholder="Password"/>
        <form:label path="password" for="login-pass">Password</form:label>
        <form:errors path="password" class="errors text-danger"/>
      </div>
      <div class="text-center mt-3">
        <button class="btn btn-lg btn-submit" type="submit">Submit</button>
      </div>
    </form:form>
  </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
