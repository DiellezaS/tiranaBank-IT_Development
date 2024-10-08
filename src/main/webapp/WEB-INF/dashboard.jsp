<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
</head>
<style>
    body{
        background: rgb(2,0,36);
        background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(255,221,81,1) 0%, rgba(26,8,164,1) 100%);
        color: #fff;
    }
</style>
<body>
<nav><jsp:include page="navbar.jsp"/></nav>

<div  class="text-center " >
        <h1 class="fw-bold" style="margin-top: 10%; margin-bottom: 5%;color: #f4ba20">Welcome ${user.name} ${user.lastname}!</h1>
    <h4 class="fw-bold" style="color: #243b7f">Manage your accounts and generate statements easily!</h4>

</div>


<footer><jsp:include page="footer.jsp"/>
</footer>
</body>


</html>