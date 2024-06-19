<%-- 
    Document   : LoginPage
    Created on : 4 Jun 2024, 4:24:53 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
            <style>
     body{
                font-family: "Raleway", sans-serif;
            }
            body, html {
                height: 100%;
                margin: 0;
                line-height: 1.8;
                display: flex;
                justify-content: center;
                align-items: center;
                background-size: cover;
                background-position: center;
                background-color:#99ccff;
            }
            
            .container {
                width: 500px;
                padding: 20px;
                margin-top: 30px;
                background-color: rgba(255, 255, 255, 1);
                border-radius: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                animation: fadeIn 1s ease-in-out;
            }
           
            fieldset {
                border: none;
                padding: 0;
                margin: 0;
            }
           h2 {
                font-family: 'Montserrat', sans-serif;
                font-weight: 800;
                font-size: 24px;
                text-align: center;
                margin-bottom: 20px;
               
            }
            label {
                font-family: 'Montserrat', sans-serif;
                display: block;
                font-size: 16px;
                margin-bottom: 5px;
            }
            input[type="text"],
            input[type="password"] {
                font-family: 'Montserrat', sans-serif;
                width: 470px;
                border-radius: 5px;
                border: 1px solid #ccc;
                font-size: 16px;
                margin-bottom: 10px;
                padding: 10px;
                margin-right:10px;
                
            }
            button {
                font-family: 'Montserrat', sans-serif;
                background-color:#6699ff;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                
            }
            button:hover {
                background-color:#3366ff;
            }
           
            .button-add {
                display: block;
                text-align: center;
                margin-top: 10px;
                text-decoration: none;
                font-family: 'Montserrat', sans-serif;
                font-size: 16px;
                color: purple;
                text-decoration: underline;
            }
          
            img {
                width: 200px;
                height: auto;
                display: block;
                margin: 0 auto;
            }


        </style>
    </head>

    <body>
        <div class="container">
        <form id ="adminDashboard" action="adminDashboard.jsp" method="post">
        <fieldset>
            <img src="logo book store.png" alt="logo">
            <h2>Staff Login</h2>
            <label for="staffId">Staff Id</label>
            <input type="text" id="staffId" name="staffId" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Login</button>
        </fieldset>
            </form> 
</div>
    </body>
</html>
