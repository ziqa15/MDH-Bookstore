<%@page import="java.util.Base64"%>
<%@ page import="java.util.List" %>
<%@ page import="com.book.BookDtls" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Book</title>
    <style>
            h2 {
                text-align: center;
                margin-top: 20px;
            }
            .search-results {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin: 20px auto;
                width: 80%;
            }

            .book-entry {
                width: 80%;
                margin: 10px 0;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: white;
                text-align: center;
            }

            .book-entry p {
                margin: 5px 0;
                font-family: Arial, sans-serif;
                color: #333;
            }

            @media (max-width: 600px) {
                .search-results {
                    width: 95%;
                }

                .book-entry {
                    width: 100%;
                }
            }
        </style>
</head>

<body>
    <header>
    <jsp:include page="header.jsp" />
    </header>
    <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <h2>Search Results:</h2>
        <div class="search-results">
            <c:forEach var="book" items="${books}">
                <div class="book-entry">
                    <p><strong>Id:</strong> ${book.bookId}</p>
                    <p><strong>Photo:</strong></p>
                    <img src="${book.photo}" alt="Book Photo" max-width="100%" height="200"/>
                    <p><strong>Title:</strong> ${book.title}</p>
                    <p><strong>Author:</strong> ${book.author}</p>
                    <p><strong>Publisher:</strong> ${book.publisher}</p>
                    <p><strong>Publication Date:</strong> ${book.publicationDate}</p>
                    <p><strong>Price:</strong> ${book.price}</p>
                    <p><strong>Quantity:</strong> ${book.quantity}</p>
                </div>
            </c:forEach>
        </div><br><br>
    <footer>
    <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>
