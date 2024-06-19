package com.book;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/bookstore";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_BOOK_SQL = "INSERT INTO book (title, author, publisher, publicationDate, price, quantity, photo) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_BOOK_BY_ID = "SELECT bookId, title, author, publisher, publicationDate, price, quantity, photo FROM book WHERE bookId = ?";
    private static final String SELECT_ALL_BOOK = "SELECT * FROM book";
    private static final String DELETE_BOOK_SQL = "DELETE FROM book WHERE bookId = ?";
    private static final String UPDATE_BOOK_SQL = "UPDATE book SET title = ?, author = ?, publisher = ?, publicationDate = ?, price = ?, quantity = ?, photo = ? WHERE bookId = ?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertBook(BookDtls book) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOK_SQL)) {
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getAuthor());
            preparedStatement.setString(3, book.getPublisher());
            preparedStatement.setDate(4, Date.valueOf(book.getPublicationDate()));
            preparedStatement.setString(5, book.getPrice());
            preparedStatement.setString(6, book.getQuantity());
            preparedStatement.setString(7, book.getPhoto());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public BookDtls selectBook(int bookId) {
        BookDtls book = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_ID)) {
            preparedStatement.setInt(1, bookId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String title = rs.getString("title");
                String author = rs.getString("author");
                String publisher = rs.getString("publisher");
                String publicationDate = rs.getString("publicationDate");
                String price = rs.getString("price");
                String quantity = rs.getString("quantity");
                String photo = rs.getString("photo");
                book = new BookDtls(bookId, title, author, publisher, publicationDate, price, quantity, photo);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return book;
    }

    public List<BookDtls> selectAllBooks() {
        List<BookDtls> books = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOK)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int bookId = rs.getInt("bookId");
                String title = rs.getString("title");
                String author = rs.getString("author");
                String publisher = rs.getString("publisher");
                String publicationDate = rs.getString("publicationDate");
                String price = rs.getString("price");
                String quantity = rs.getString("quantity");
                String photo = rs.getString("photo");
                books.add(new BookDtls(bookId, title, author, publisher, publicationDate, price, quantity, photo));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return books;
    }

    public boolean deleteBook(int bookId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_BOOK_SQL)) {
            statement.setInt(1, bookId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateBook(BookDtls book) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_BOOK_SQL)) {
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setString(3, book.getPublisher());
            statement.setDate(4, Date.valueOf(book.getPublicationDate()));
            statement.setString(5, book.getPrice());
            statement.setString(6, book.getQuantity());
            statement.setString(7, book.getPhoto());
            statement.setInt(8, book.getBookId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.print("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    
    public List<BookDtls> searchBooksByTitle(String title) {
        List<BookDtls> books = new ArrayList<>();
        String searchQuery = "SELECT * FROM book WHERE title LIKE ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(searchQuery)) {
            preparedStatement.setString(1, "%" + title + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int bookId = rs.getInt("bookId");
                String bookTitle = rs.getString("title");
                String author = rs.getString("author");
                String publisher = rs.getString("publisher");
                String publicationDate = rs.getString("publicationDate");
                String price = rs.getString("price");
                String quantity = rs.getString("quantity");
                String photo = rs.getString("photo");
                books.add(new BookDtls(bookId, bookTitle, author, publisher, publicationDate, price, quantity, photo));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return books;
    }


}
