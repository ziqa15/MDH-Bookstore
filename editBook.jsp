<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Book</title>
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

        input[type="submit"] {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 4px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            float: right;
        }

        input[type="submit"]:hover {
            opacity: 0.8;
        }

        img {
            display: block;
            margin-top: 10px;
        }

        @media (max-width: 600px) {
            form {
                width: 90%;
            }

            input[type="submit"] {
                width: 100%;
                margin: 5px 0;
            }
        }
    </style>
</head>

<body>
    <header>
    <jsp:include page="header.jsp" />
    </header>
    <h2>Edit Book</h2>
    <form action="book?action=update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="bookId" value="${book.bookId}">
        <table>
            <tr>
                <td>Title:</td>
                <td><input type="text" name="title" value="${book.title}" required></td>
            </tr>
            <tr>
                <td>Author:</td>
                <td><input type="text" name="author" value="${book.author}" required></td>
            </tr>
            <tr>
                <td>Publisher:</td>
                <td><input type="text" name="publisher" value="${book.publisher}" required></td>
            </tr>
            <tr>
                <td>Publication Date:</td>
                <td><input type="date" name="publicationDate" value="${book.publicationDate}" required></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="text" name="price" value="${book.price}" required></td>
            </tr>
            <tr>
                <td>Quantity:</td>
                <td><input type="text" name="quantity" value="${book.quantity}" required></td>
            </tr>
            <tr>
                <td>Current Photo:</td>
                <td><img src="${book.photo}" alt="Book Photo" width="50" height="50"/></td>
            </tr>
            <tr>
                <td>New Photo:</td>
                <td><input type="file" name="photo"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Submit">
                </td>
            </tr>
        </table>
    </form>
    <footer>
    <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>
