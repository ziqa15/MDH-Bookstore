package com.book;

import java.io.File;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/book")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class BookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookDao bookDao;

    public void init() {
        bookDao = new BookDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertBook(request, response);
                    break;
                case "delete":
                    deleteBook(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateBook(request, response);
                    break;
                case "list":
                    listBook(request, response);
                    break;
                case "search":
                    searchBook(request, response);
                    break;
                default:
                    listBook(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<BookDtls> listBook = bookDao.selectAllBooks();
        request.setAttribute("listBook", listBook);
        request.getRequestDispatcher("listBook.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("book.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        BookDtls existingBook = bookDao.selectBook(bookId);
        request.setAttribute("book", existingBook);
        request.getRequestDispatcher("editBook.jsp").forward(request, response);
    }

    private void insertBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String publicationDate = request.getParameter("publicationDate");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");

        Part filePart = request.getPart("photo");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String imagePath = getServletContext().getRealPath("/uploads/") + fileName;

        File uploadsDir = new File(getServletContext().getRealPath("/uploads/"));
        if (!uploadsDir.exists()) {
            uploadsDir.mkdir();
        }

        // Save the file
        filePart.write(imagePath);

        BookDtls newBook = new BookDtls(title, author, publisher, publicationDate, price, quantity, "uploads/" + fileName);
        bookDao.insertBook(newBook);
        response.sendRedirect("book?action=list");
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String publicationDate = request.getParameter("publicationDate");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");

        Part filePart = request.getPart("photo");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String imagePath = getServletContext().getRealPath("/uploads/") + fileName;

        File uploadsDir = new File(getServletContext().getRealPath("/uploads/"));
        if (!uploadsDir.exists()) {
            uploadsDir.mkdir();
        }

        if (filePart != null && filePart.getSize() > 0) {
            filePart.write(imagePath);
            imagePath = "uploads/" + fileName;
        } else {
            imagePath = request.getParameter("existingPhoto"); 
        }

        BookDtls book = new BookDtls(bookId, title, author, publisher, publicationDate, price, quantity, imagePath);
        bookDao.updateBook(book);
        response.sendRedirect("book?action=list");

    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        bookDao.deleteBook(bookId);
        response.sendRedirect("book?action=list");
    }

    private void searchBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String title = request.getParameter("title");
        if (title == null || title.trim().isEmpty()) {
            request.setAttribute("error", "Title cannot be null or empty.");
            request.getRequestDispatcher("search.jsp").forward(request, response);
        }
        List<BookDtls> books = bookDao.searchBooksByTitle(title);
        request.setAttribute("books", books);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

}
