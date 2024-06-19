<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Receipt</title>
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
        .print-button {
            background-color: black;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            display: block;
            margin: 20px auto;
            font-size: 16px;
            border-radius: 5px;
        }
        p {
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">Receipt</h2>
    <%
        String dbURL = "jdbc:mysql://localhost:3306/bookstore";
        String dbUser = "root";
        String dbPass = "";
        String date = request.getParameter("date");
        String custId = request.getParameter("custId");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "SELECT s.sellId, s.date, s.custId, b.title, s.quantity, s.amount " +
                         "FROM sell s JOIN book b ON s.bookId = b.bookId " +
                         "WHERE s.custId = ? AND s.date = ? " +
                         "ORDER BY s.sellId";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, custId);
            stmt.setString(2, date);

            ResultSet rs = stmt.executeQuery();

            double totalAmount = 0;
            int totalQuantity = 0;
    %>
    <p>Date: <%= date %></p>
    <p>Customer ID: <%= custId %></p>
    <table>
        <tr>
            <th>Sell ID</th>
            <th>Book Title</th>
            <th>Quantity</th>
            <th>Amount</th>
        </tr>
        <%
            while (rs.next()) {
                String sellId = rs.getString("sellId");
                String title = rs.getString("title");
                int quantity = rs.getInt("quantity");
                double amount = rs.getDouble("amount");

                totalQuantity += quantity;
                totalAmount += amount;
        %>
        <tr>
            <td><%= sellId %></td>
            <td><%= title %></td>
            <td><%= quantity %></td>
            <td><%= String.format("%.2f", amount) %></td>
        </tr>
        <%
            }
            rs.close();
        %>
        <tr>
            <th colspan="2">Total</th>
            <td><%= totalQuantity %></td>
            <td><%= String.format("%.2f", totalAmount) %></td>
        </tr>
    </table>
    <%
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
    
    <button type="button" class="print-button" onclick="window.print()">Print</button>
<%@ include file="footer.jsp" %>
</body>
</html>
