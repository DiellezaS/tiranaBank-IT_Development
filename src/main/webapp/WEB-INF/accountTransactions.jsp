<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Transactions Between Dates</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: rgb(2,0,36);
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(255,221,81,1) 0%, rgba(26,8,164,1) 100%);
            color: #fff;
        }


    </style>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div style="text-align: center; background-color: #f9f9f9; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <h2 style="color: #333; font-family: 'Arial', sans-serif;">Transactions from Account Number: ${account.accountNumber}</h2>
    <h3 style="color: #666; font-family: 'Arial', sans-serif;">Select Transaction Dates</h3>
    <form action="/accountTransactions/${account.id}/dateBetween" method="get">
        <label for="startDate" style="font-family: 'Arial', sans-serif; color: #555;">Start Date:</label><br>
        <input type="Date" id="startDate" name="startDate" required style="padding: 8px; margin-bottom: 10px; border-radius: 5px; border: 1px solid #ccc;"><br>

        <label for="endDate" style="font-family: 'Arial', sans-serif; color: #555;">End Date:</label><br>
        <input type="Date" id="endDate" name="endDate" required style="padding: 8px; margin-bottom: 10px; border-radius: 5px; border: 1px solid #ccc;"><br>

        <button type="submit" style="background-color:blue; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; font-family: 'Arial', sans-serif;">Submit</button>
    </form>
</div>


<c:if test="${not empty transactionDebit or not empty transactionCredit}">
    <div style="text-align: center; background-color: #f9f9f9; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
        <h2 style="color: #333; font-family: 'Arial', sans-serif;">Transactions Between Dates: ${startDate.date}/${startDate.month+1}/${startDate.year+1900}-${endDate.date}/${endDate.month+1}/${endDate.year+1900}</h2>

        <table class="table" style="width: 100%; margin-top: 20px; border-collapse: collapse;">
            <thead style="background-color: #f4ba20; color: white;">
            <tr>
                <th style="padding: 10px;">Transaction Date</th>
                <th style="padding: 10px;">Description</th>
                <th style="padding: 10px;">Debit Account</th>
                <th style="padding: 10px;">Credit Account</th>
                <th style="padding: 10px;">Amount</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${transactionDebit}" var="transaction">
                <tr>
                    <td style="padding: 10px;">${transaction.transactionDate}</td>
                    <td style="padding: 10px;">${transaction.description}</td>
                    <td style="padding: 10px;">${transaction.debitAccount.accountNumber}</td>
                    <td style="padding: 10px;">${transaction.creditAccount}</td>
                    <td style="padding: 10px;">${transaction.amount}</td>
                </tr>
            </c:forEach>
            <c:forEach items="${transactionCredit}" var="transaction">
                <tr>
                    <td style="padding: 10px;">${transaction.transactionDate}</td>
                    <td style="padding: 10px;">${transaction.description}</td>
                    <td style="padding: 10px;">${transaction.debitAccount.accountNumber}</td>
                    <td style="padding: 10px;">${transaction.creditAccount}</td>
                    <td style="padding: 10px;">${transaction.amount}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div style="margin-top: 20px; display: flex;justify-content: center">
            <form action="/accountTransactions/${account.id}/download/pdf" method="get">
                <input type="hidden" name="startDate" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${startDate}' />">
                <input type="hidden" name="endDate" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${endDate}' />">
                <button class="btn-lg btn" type="submit" style="background-color: #f4ba20; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; font-family: 'Arial', sans-serif;">Download PDF</button>
            </form>
            <form action="/accountTransactions/${account.id}/download/csv" method="get" style="margin-left: 10px;">
                <input type="hidden" name="startDate" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${startDate}' />">
                <input type="hidden" name="endDate" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${endDate}' />">
                <button class="btn-lg btn" type="submit" style="background-color: #f4ba20; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; font-family: 'Arial', sans-serif;">Download CSV</button>
            </form>
        </div>
    </div>
</c:if>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>