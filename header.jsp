<%-- 
    Document   : header.jsp
    Created on : 10 Jun 2024, 11:48:55 AM
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Header</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <style>
            /* Custom styling for the navigation bar */
            .navbar .navbar-brand img {
                height: 50px;
            }
            .navbar-nav .nav-link {
                color: white;
                padding: 14px 20px;
                transition: background-color 0.3s, color 0.3s;
            }
            .navbar-nav .nav-link:hover {
                background-color: #ddd;
                color: #333;
            }
            .dropdown-menu a {
                color: black;
                transition: background-color 0.3s, color 0.3s;
            }
            .dropdown-menu a:hover {
                background-color: #ddd;
                color: #333;
            }
            .navbar-toggler-icon {
                color: white;
            }
            /* Form styles */
            .form-inline {
                display: flex;
                align-items: center;
            }

            #title {
                margin-right: 10px;
                padding: 10px;
                font-size: 16px;
            }

            .btn-search {
                color: #ffffff; 
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }

            .btn-search:hover {
                background-color: yellow; 
            }

            .form-control {
                border: 1px solid #ced4da;
                border-radius: 5px;
            }

            .form-control:focus {
                border-color: #80bdff;
                outline: 0;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg" style="background-color: #3366ff;">
            <a class="navbar-brand" href="/home">
                <img src="logo book store.png" alt="Logo">
            </a>
           <form class="form-inline my-2 my-lg-0 ml-3" action="book?action=search" method="post">
    <label for="title" class="mr-2"></label>
    <input class="form-control mr-sm-2" type="text" id="title" name="title" placeholder="Insert Book Title" aria-label="Search" required>
    <button class="btn btn-search" type="submit">
        <i class="fas fa-search"></i> Search
    </button>
</form>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"><i class="bi bi-list" style="color: white;"></i></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="adminDashboard.jsp"><i class="bi bi-house"></i> Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="staffDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="bi bi-people"></i> Staff
                        </a>
                        <div class="dropdown-menu" aria-labelledby="staffDropdown">
                            <a class="dropdown-item" href="staffRegister.jsp">Register Staff</a>
                            <a class="dropdown-item" href="http://localhost:8080/Sell/staff">Staff List</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="book.jsp"><i class="bi bi-book"></i> Manage Book</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="staffDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="bi bi-people"></i> Manage Sell
                        </a>
                        <div class="dropdown-menu" aria-labelledby="staffDropdown">
                            <a class="dropdown-item" href="BookSells.jsp">Sell Book</a>
                            <a class="dropdown-item" href="viewReportSells.jsp">Sell Report</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="CustomerServlet?action=list"><i class="bi bi-person"></i> Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LoginPage.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Bootstrap JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
