<%-- 
    Document   : Customer
    Created on : Jun 18, 2024, 10:43:15 PM
    Author     : acer
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Customer</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                color: #333;
            }
            header, footer {
                background-color: #333;
                color: #fff;
                padding: 10px 0;
                text-align: center;
            }
            h1 {
                text-align: center;
                font-size: 40px;
                font-weight: bold;
                margin-top: 20px;
            }
            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                background-color: #fff;
            }
            table th, table td {
                padding: 10px;
                text-align: center;
                border: 1px solid #ccc;
            }
            table th {
                background-color: #333;
                color: #fff;
            }
            table tr:nth-child(even) {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <header>
            <jsp:include page="header.jsp"/>
        </header>
        <h1 style="text-align: center; font-size: 40px"><strong>List of Customer</strong></h1>
        <table border="1" style="width:50%">
            <tr>
                <th>Customer ID</th>
            </tr>
            
            <c:forEach var="customer" items="${listCustomer}">
                <tr>
                    <td>${customer.custId}</td>
                </tr>
            </c:forEach>
        </table>
        <footer>
            <jsp:include page="footer.jsp"/>
        </footer>
    </body>
</html>
