<%-- 
    Document   : staffRegister
    Created on : 15 Jun 2024, 1:44:37 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<style>
    footer {
            text-align: center;
            padding: 10px;
            background-color: #3366ff;
            color: white;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
        }
</style>
<html>
    <head>
        <title>MDH Bookstore</title>
        <link rel="stylesheet" href="path/to/bootstrap.css">
    </head>
    <body>
        <header>
            <jsp:include page="header.jsp" />
        </header>
        <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:if test="${staff != null}">
                        <form action="update" method="post">
                    </c:if>
                    <c:if test="${staff == null}">
                        <form action="insert" method="post">
                    </c:if>

                    <h2>
                        <c:if test="${staff != null}">
                            Edit Staff
                        </c:if>
                        <c:if test="${staff == null}">
                            Add New Staff
                        </c:if>
                    </h2>

                    <c:if test="${staff != null}">
                        <input type="hidden" name="staffId" value="<c:out value='${staff.staffId}' />" />
                    </c:if>

                    <fieldset class="form-group">
                        <label>Name</label>
                        <input type="text" value="<c:out value='${staff.name}' />" 
                               class="form-control" name="name" required="required">           
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Password</label>
                        <div class="input-group">
                            <input id="passwordField" type="password" value="<c:out value='${staff.password}' />" 
                                   class="form-control" name="password" required="required">
                            <div class="input-group-append">
                                <button id="toggleButton" class="btn btn-outline-secondary" type="button">
                                    Show
                                </button>
                            </div>
                        </div>          
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Email</label>
                        <input type="text" value="<c:out value='${staff.email}' />" 
                               class="form-control" name="email" required="required">           
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Phone Number</label>
                        <input type="text" value="<c:out value='${staff.phoneNo}' />" 
                               class="form-control" name="phoneNo" required="required">           
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Address</label>
                        <input type="text" value="<c:out value='${staff.address}' />" 
                               class="form-control" name="address" required="required">           
                    </fieldset>

                    <button type="submit" class="btn btn-success">Save</button>
                </form>
                </div>
            </div>
        </div>

        
        
        <script>
            const passwordField = document.getElementById('passwordField');
            const toggleButton = document.getElementById('toggleButton');

            toggleButton.addEventListener('click', (event) => {
                event.preventDefault();
                if (passwordField.type === 'password') {
                    passwordField.type = 'text';
                    toggleButton.textContent = 'Hide';
                } else {
                    passwordField.type = 'password';
                    toggleButton.textContent = 'Show';
                }
            });
        </script>
    </body>
    <footer>
            <jsp:include page="footer.jsp" />
        </footer>
</html>
