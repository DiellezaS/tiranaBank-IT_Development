<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <title>Account Detail</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: rgb(2,0,36);
      background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(255,221,81,1) 0%, rgba(26,8,164,1) 100%);
      color: #fff;
    }
    table {
      width: 80%;

      margin-top: 20px;
      border-collapse: collapse;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    </style>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<table class=" table table-striped">

  <h3 class="text-center" style="margin: 40px">Details for Account Number: ${account.accountNumber}</h3>
  <thead>
  <tr>

    <th scope="col">Transaction Date</th>
    <th scope="col">Transaction Description</th>
    <th scope="col">Transaction Debit</th>
    <th scope="col">Transaction Credit</th>
    <th scope="col">Transaction Amount</th>
    <th scope="col">Balance</th>
    <th scope="col">Currency</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${transactionsDebit}" var="transaction">
    <tr>

      <td>${transaction.transactionDate}</td>
      <td>${transaction.description}</td>
      <td>${transaction.debitAccount.accountNumber}</td>
      <td>${transaction.creditAccount}</td>
      <td>${transaction.amount}</td>
      <td>${account.balance}</td>
      <td>${account.currency}</td>
    </tr>
  </c:forEach>

  <c:forEach items="${transactionsCredit}" var="transaction">
    <tr>
      <td>${transaction.transactionDate}</td>
      <td>${transaction.description}</td>
      <td>${transaction.debitAccount.accountNumber}</td>
      <td>${transaction.creditAccount}</td>
      <td>${transaction.amount}</td>
      <td>${account.balance}</td>
      <td>${account.currency}</td>
    </tr>
  </c:forEach>

  </tbody>
</table>

<footer ><jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>