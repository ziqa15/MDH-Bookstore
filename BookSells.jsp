<%-- 
    Document   : BookSells
    Created on : 17 Jun 2024, 8:36:46 pm
    Author     : acer
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Sells</title>
    <style>
        .form-container {
            width: 50%;
            margin: 10px auto;
            background-color: #f2f2f2;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #000;
        }
        .form-container input[type="text"], .form-container input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-container input[type="submit"] {
            width: 47%;
            background-color: #3366ff;
            color: white;
            padding: 14px 20px;
            margin: 8px 1%;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .form-container button {
            width: 47%;
            background-color: #12C693;
            color: white;
            padding: 14px 20px;
            margin: 8px 1%;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #12B486;
        }
    </style>
</head>
<body>
    <header>
    <jsp:include page="header.jsp" />
    </header><br>
    <div class="form-container">
        <h1>Sell Book</h1>
        <form action="SellServlet?action=/insert" method="post">
            <label for="sellId">Sell ID:</label>
            <input type="text" id="sellId" name="sellId" required>
            
            <label for="custId">Customer ID:</label>
            <input type="text" id="custId" name="custId" required>

            <label for="bookId">Book ID:</label>
            <input type="number" id="bookId" name="bookId" required>

            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required>

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" 
            value="${sell.date != null ? sell.date.toString().substring(0, 10) : ''}" 
            required><br>

            <input type="submit" value="Submit">
            <button type="button" 
            onclick="location.href='SellServlet?action=/list'">View</button>
        </form>
    </div>
<footer>
<jsp:include page="footer.jsp" />
</footer>
</body>
</html>