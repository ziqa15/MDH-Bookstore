/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sell;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SellDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/bookstore";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_SELL_SQL  = "INSERT INTO sell (sellId, custId, bookId, quantity, date, amount) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_SELL_BY_ID = "SELECT sellId, custId, bookId, quantity, date FROM sell WHERE sellId = ?";
    private static final String SELECT_ALL_SELLS_EXCEPT_DATE = "SELECT sellId, custId, bookId, quantity, amount FROM sell";
    private static final String DELETE_SELL_SQL = "DELETE FROM sell WHERE sellId = ?";
    private static final String SELECT_BOOK_PRICE = "SELECT price FROM book WHERE bookId = ?";
    private static final String UPDATE_NEW_SELL = "UPDATE sell SET custId = ?, bookId = ?, quantity = ?, date = ?, amount = ? WHERE sellId = ?";
    
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

    public void insertSell(Sell sell) throws SQLException {
        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SELL_SQL)) {
            preparedStatement.setString(1, sell.getSellId());
            preparedStatement.setString(2, sell.getCustId());
            preparedStatement.setInt(3, sell.getBookId());
            preparedStatement.setInt(4, sell.getQuantity());
            preparedStatement.setDate(5, new java.sql.Date(sell.getDate().getTime()));
            preparedStatement.setDouble(6, calculateAmount(sell.getBookId(), sell.getQuantity()));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateSell(Sell sell) throws SQLException {
        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_NEW_SELL)) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1, sell.getCustId());
            preparedStatement.setInt(2, sell.getBookId());
            preparedStatement.setInt(3, sell.getQuantity());
            preparedStatement.setDate(4, new java.sql.Date(sell.getDate().getTime()));
            preparedStatement.setDouble(5, calculateAmount(sell.getBookId(), sell.getQuantity()));
            preparedStatement.setString(6, sell.getSellId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List<Sell> selectAllSellsExceptDate() {
        List<Sell> sells = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SELLS_EXCEPT_DATE)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String sellId = rs.getString("sellId");
                String custId = rs.getString("custId");
                int bookId = rs.getInt("bookId");
                int quantity = rs.getInt("quantity");
                double amount = rs.getDouble("amount");
                sells.add(new Sell(sellId, custId, bookId, quantity, amount));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sells;
    }
    
    public boolean deleteSell(String sellId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_SELL_SQL)) {
            statement.setString(1, sellId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public double calculateAmount(int bookId, int quantity) throws SQLException {
        double price = 0.0;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_PRICE)) {
            preparedStatement.setInt(1, bookId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                price = rs.getDouble("price");
            }
        }
        return price * quantity;
    }

    public List<Sell> selectSellById(String sellId) throws SQLException {
        List<Sell> sells = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SELL_BY_ID)) {
            preparedStatement.setString(1, sellId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                sellId = rs.getString("sellId");
                String custId = rs.getString("custId");
                int bookId = rs.getInt("bookId");
                int quantity = rs.getInt("quantity");
                Date date = rs.getDate("date");
                sells.add(new Sell(sellId, custId, bookId, quantity, date));
            }
        }
        return sells;
    }
    
}
