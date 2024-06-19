<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sell Form</title>
    <style>
        .form-container {
            width: 50%;
            margin: 10px auto;
            background-color: #f2f2f2;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #000;
        }
        .form-container input[type="text"], .form-container input[type="number"],
        .form-container input[type="date"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-container input[type="submit"] {
            width: 60%;
            background-color: #3366ff;
            color: white;
            padding-top: 14px;
            padding-bottom: 14px;
            margin-left: 20%;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

    </style>
</head>
<body>
    <header>
        <jsp:include page="header.jsp" />
    </header><br><br>
    <div class="form-container">
        <h2>Update Sell</h2>
        <c:forEach var="sell" items="${sell}">
        <form action="SellServlet?action=/update" method="post">
            
            <label for="amount">Sell ID:</label>
            <input type="text" id="sellId" name="sellId" value="${sell.sellId}" readonly><br><br>
            
            <label for="custId">Customer ID:</label>
            <input type="text" id="custId" name="custId" value="${sell.custId}" required><br><br>

            <label for="bookId">Book ID:</label>
            <input type="text" id="bookId" name="bookId" value="${sell.bookId}" required><br><br>

            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" value="${sell.quantity}" required oninput="calculateAmount()"><br><br>

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" value="${sell.date}" required><br><br>

            <input type="submit" value="Update">
        </form>
        </c:forEach>
    </div><br><br><br><br>
    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>