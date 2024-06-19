<%-- 
    Document   : staffList
    Created on : 15 Jun 2024, 1:59:11 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MDH Bookstore</title>

    </head>
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
        .delete-button {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        .edit-button {
            background-color:#4CAF50;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>
    <body>
        <header>
            <jsp:include page="header.jsp" />
        </header>
        <br>
        <div class="row">
            <div class="container">
                <h3 class="text-center">List of Staff</h3>
                <hr>
                <div class="container text-left">
                    <a href="staffServlet?action=insertstaff" class="btn btn-success">Add New Staff</a>
                </div>
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Phone Number</th>
                            <th>Address</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="staff" items="${listStaff}">
                            <tr>
                                <td>
                                    <c:out value="${staff.staffId}" />
                                </td>
                                <td>
                                    <c:out value="${staff.name}" />
                                </td>
                                <td>
                                    <c:out value="${staff.password}" />
                                </td>
                                <td>
                                    <c:out value="${staff.email}" />
                                </td>
                                <td>
                                    <c:out value="${staff.phoneNo}" />
                                </td>
                                <td>
                                    <c:out value="${staff.address}" />
                                </td>
                                <td><a href="edit?staffId=<c:out value='${staff.staffId}' />" class="edit-button">Edit</a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="delete?staffId=<c:out value='${staff.staffId}' />" class="delete-button">Delete</a>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div> 
        </div>

    </body>
    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</html>
