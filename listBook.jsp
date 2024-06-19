<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>List Books</title>
    <style>
        h2 {
            text-align: center;
        }

        table {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: #ffffff;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .actions a {
            margin-right: 10px;
            color: #007bff;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            border: 1px solid #007bff;
            transition: background-color 0.3s, color 0.3s;
        }

        .actions a:hover {
            background-color: #007bff;
            color: #ffffff;
        }

        .add-new-book {
            display: inline-block;
            padding: 10px 20px;
            margin: 20px auto;
            border-radius: 4px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            font-size: 16px;
            text-align: center;
            transition: background-color 0.3s;
        }

        .add-new-book:hover {
            background-color: #45a049;
        }

        @media (max-width: 600px) {
            table {
                width: 100%;
            }

            .add-new-book {
                width: 90%;
                text-align: center;
            }
        }
    </style>
</head>

<body>
    <header>
    <jsp:include page="header.jsp" />
    </header>
    <h2>List of Books</h2>
    &nbsp;&nbsp;<a href="book?action=new">Add New Book</a>
    <table border="1" cellpadding="5" cellspacing="5">
        <thead>
            <tr>
                <th>#</th>
                <th>Photo</th>
                <th>Title</th>
                <th>Author</th>
                <th>Publisher</th>
                <th>Publication Date</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="book" items="${listBook}">
                <tr>
                    <td>${book.bookId}</td>
                    <td><img src="${book.photo}" alt="Book Photo" max-width="100%" height="100"/></td>
                    <td>${book.title}</td>
                    <td>${book.author}</td>
                    <td>${book.publisher}</td>
                    <td>${book.publicationDate}</td>
                    <td>${book.price}</td>
                    <td>${book.quantity}</td>
                    <td>
                        <a href="book?action=edit&bookId=${book.bookId}">Edit</a>
                        <a href="book?action=delete&bookId=${book.bookId}" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <footer>
    <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>
