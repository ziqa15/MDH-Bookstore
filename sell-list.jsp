
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.Date"%>
<%@page import="com.sell.Sell"%>
<%@page import="com.sell.SellDAO" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sell List</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #3366ff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .delete-button, .update-button {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        .print-button {
            background-color: blue;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        .update-button {
            background-color: green;
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="header.jsp" />
    </header><br>
    <h2 style="text-align: center; font-size: 40px"><strong>Sell List</strong></h2>
    <table>
        <tr>
            <th>Sell ID</th>
            <th>Customer ID</th>
            <th>Book ID</th>
            <th>Quantity</th>
            <th>Amount</th>
            <th>Action</th>
        </tr>
        <c:forEach var="sell" items="${listSell}">
            <tr>
                <td>${sell.sellId}</td>
                <td>${sell.custId}</td>
                <td>${sell.bookId}</td>
                <td>${sell.quantity}</td>
                <td><fmt:formatNumber value="${sell.amount}"/></td>
                <td>
                    <a href="SellServlet?action=/edit&sellId=${sell.sellId}">
                        <button class="update-button">Update</button>
                    </a>
                    <a href="SellServlet?action=/delete&sellId=${sell.sellId}">
                        <button class="delete-button">Delete</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table><br><br><br>
    <br>
    <h3 style="text-align: center; font-size: 40px"><strong>Customer Receipt</strong></h3><br>
    <%
        String dbURL = "jdbc:mysql://localhost:3306/bookstore";
            String dbUser = "root";
            String dbPass = "";

            Connection conn = null;
            Statement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String dateSql = "SELECT DISTINCT date FROM sell ORDER BY date DESC";
            stmt = conn.createStatement();
            ResultSet dateRs = stmt.executeQuery(dateSql);

            while (dateRs.next()) {
                String date = dateRs.getString("date");
    %>
    
    <p style="text-align: center; font-weight: bold; background-color: #ddd; padding: 10px;"><%= date %></p>    
        <table style="margin-bottom: 70px;;">
        <tr>
            <th>Customer ID</th>
            <th>Action</th>
        </tr>
        <%
                String custSql = "SELECT DISTINCT custId FROM sell WHERE date = ? ORDER BY custId";
                PreparedStatement custStmt = conn.prepareStatement(custSql);
                custStmt.setString(1, date);
                ResultSet custRs = custStmt.executeQuery();

                while (custRs.next()) {
                    String custId = custRs.getString("custId");
        %>
        <tr>
            <td><%= custId %></td>
            <td>
                <form action="printReceipt.jsp" method="post" style="display:inline">
                    <input type="hidden" name="date" value="<%= date %>">
                    <input type="hidden" name="custId" value="<%= custId %>">
                    <input type="submit" value="Print Receipt" class="print-button">
                </form>
            </td>
        </tr>
        <%
                }
                custRs.close();
                custStmt.close();
        %>
    </table>
    <br>
    <%
            }
            dateRs.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>   
    </body><br><br><br>
    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</html>
