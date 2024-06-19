/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.staff;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/staffServlet")
public class staffServlet extends HttpServlet {

    private StaffDAO staffDAO;

    public void init() {
        staffDAO = new StaffDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/newstaff":
                    showNewForm(request, response);
                    break;
                case "/insertstaff":
                    insertStaff(request, response);
                    break;
                case "/deletestaff":
                    deleteStaff(request, response);
                    break;
                case "/editstaff":
                    showEditForm(request, response);
                    break;
                case "/updatestaff":
                    updateStaff(request, response);
                    break;
                default:
                    listStaff(request, response);
                    break;
            }
        
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List < Staff > listStaff = staffDAO.selectAllStaff();
        request.setAttribute("listStaff", listStaff);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffRegister.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int staffId = Integer.parseInt(request.getParameter("staffId"));
        Staff existingStaff = staffDAO.selectStaff(staffId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffRegister.jsp");
        request.setAttribute("staff", existingStaff);
        dispatcher.forward(request, response);
    }
    
    private void insertStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        int phoneNo = Integer.parseInt(request.getParameter("phoneNo"));
        String address = request.getParameter("address");
        Staff newStaff = new Staff(name,password,email, phoneNo ,address);
        staffDAO.insertStaff(newStaff);
        response.sendRedirect("listStaff");
    }
     private void updateStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException{
        int staffId = Integer.parseInt(request.getParameter("staffId"));
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        int phoneNo = Integer.parseInt(request.getParameter("phoneNo"));
        String address = request.getParameter("address");
        
        Staff staff = new Staff(staffId, name,password,email, phoneNo ,address);
        staffDAO.updateStaff(staff);
        response.sendRedirect("listStaff");
     }
     
    private void deleteStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int staffId = Integer.parseInt(request.getParameter("staffId")); 
         staffDAO.deleteStaff(staffId);
         response.sendRedirect("listStaff");
    }
}

