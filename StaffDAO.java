/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.staff;

/**
 *
 * @author User
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.staff.Staff;

public class StaffDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/bookstore";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_STAFF_SQL = "INSERT INTO staff(name, password, email, phoneNo, address ) VALUES (?, ?, ?, ?, ?);";
    private static final String SELECT_STAFF_BY_ID = "select staffId, name, password, email, phoneNo, address from staff where staffId=?";
    private static final String SELECT_ALL_STAFF = "select * from staff";
    private static final String DELETE_STAFF_SQL = "delete from staff where staffId=?;";
    private static final String UPDATE_STAFF_SQL = "update  staff set name = ?, password = ?, email = ?, phoneNo = ?, address = ? where staffId= ?;";

    public StaffDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertStaff(Staff staff) throws SQLException {
        System.out.println("INSERT_STAFF_SQL");
        try ( Connection connection = getConnection();  PreparedStatement preparedStatement
                = connection.prepareStatement(INSERT_STAFF_SQL)) {
            preparedStatement.setString(1, staff.getName());
            preparedStatement.setString(2, staff.getPassword());
            preparedStatement.setString(3, staff.getEmail());
            preparedStatement.setInt(4, staff.getPhoneNo());
            preparedStatement.setString(5, staff.getAddress());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Staff selectStaff(int staffId) {
        Staff staff = null;

        try ( Connection connection = getConnection();  
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STAFF_BY_ID);) {
            preparedStatement.setInt(1, staffId);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String password = rs.getString("password");
                String email = rs.getString("email");
                int phoneNo = rs.getInt("phoneNo");
                String address = rs.getString("address");
                staff = new Staff(staffId, name, password, email, phoneNo, address);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return staff;
    }

    public List < Staff > selectAllStaff() {
        List < Staff> staff = new ArrayList < >();
        try ( Connection connection = getConnection();  
           PreparedStatement preparedStatement
                = connection.prepareStatement(SELECT_ALL_STAFF);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int staffId = rs.getInt("staffId");
                String name = rs.getString("name");
                String password = rs.getString("password");
                String email = rs.getString("email");
                int phoneNo = rs.getInt("phoneNo");
                String address = rs.getString("address");
                staff.add(new Staff(staffId, name, password, email, phoneNo, address));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return staff;
    }

    public boolean deleteStaff(int staffId) throws SQLException {
        boolean rowDeleted;
        try ( Connection connection = getConnection();  PreparedStatement statement
                = connection.prepareStatement(DELETE_STAFF_SQL);) {
            statement.setInt(1, staffId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateStaff(Staff staff) throws SQLException {
        boolean rowUpdated;
        try ( Connection connection = getConnection();  PreparedStatement statement
                = connection.prepareStatement(UPDATE_STAFF_SQL);) {
            statement.setString(1, staff.getName());
            statement.setString(2, staff.getPassword());
            statement.setString(3, staff.getEmail());
            statement.setInt(4, staff.getPhoneNo());
            statement.setString(5, staff.getAddress());
            statement.setInt(6, staff.getStaffId());

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
                    System.out.print("cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
