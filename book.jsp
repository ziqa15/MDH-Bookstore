<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert Book</title>
    <style>
            h2 {
                text-align: center;
            }

            table {
                width: 50%;
                text-align: left;
                margin: 0 auto; /* Center the table */
            }

            td {
                padding: 10px;
                font-family: Arial, sans-serif;
                color: #333;
            }

            input[type="text"],
            input[type="date"],
            input[type="number"],
            input[type="file"] {
                width: 100%;
                padding: 8px;
                margin: 4px 0;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .buttons {
                display: flex;
                justify-content: flex-end;
                gap: 10px;
            }

            input[type="submit"],
            input[type="reset"],
            button[type="button"] {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                color: white;
                cursor: pointer;
            }

            input[type="submit"] {
                background-color: #4CAF50;
            }

            input[type="reset"] {
                background-color: #f44336;
            }

            button[type="button"] {
                background-color: #008CBA;
            }

            input[type="submit"]:hover,
            input[type="reset"]:hover,
            button[type="button"]:hover {
                opacity: 0.8;
            }

        </style>
</head>

<body>
    <header>
    <jsp:include page="header.jsp" />
    </header>
    <h2>Insert Book</h2>
    <form action="book?action=insert" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td>Title:</td>
                <td><input type="text" name="title" required></td>
            </tr>
            <tr>
                <td>Author:</td>
                <td><input type="text" name="author" required></td>
            </tr>
            <tr>
                <td>Publisher:</td>
                <td><input type="text" name="publisher" required></td>
            </tr>
            <tr>
                <td>Publication Date:</td>
                <td><input type="date" name="publicationDate" required></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="text" name="price" required></td>
            </tr>
            <tr>
                <td>Quantity:</td>
                <td><input type="text" name="quantity" required></td>
            </tr>
            <tr>
                <td>Photo:</td>
                <td><input type="file" name="photo"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Submit">
                    <button type="button" onclick="location.href='book?action=list'">View</button>
                </td>
            </tr>
        </table>
        <button type="button" onclick="location.href='search.jsp'">Search Books</button>
    </form>
    <footer>
    <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>
