/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.sell;

import java.io.IOException;
import static java.lang.Integer.parseInt;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SellServlet")
public class SellServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
private SellDAO sellDAO;

@Override
    public void init() {
        sellDAO = new SellDAO();
    }

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }

@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertSell(request, response);
                    break;
                case "/update":
                    updateSell(request, response);
                    break;
                case "/delete":
                    deleteSell(request, response);
                    break;
                case "/list":
                    listSell(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                default:
                    listSell(request, response);
                    break;
            }
        } catch (SQLException | ParseException ex) {
            throw new ServletException(ex);
        }
    }

    private void listSell(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException {
        List<Sell> listSell = sellDAO.selectAllSellsExceptDate();
        request.setAttribute("listSell", listSell);
        request.getRequestDispatcher("sell-list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("sell-form.jsp").forward(request, response);
    }

    private void insertSell(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ParseException {
        String sellId = request.getParameter("sellId");
        String custId = request.getParameter("custId");
        int bookId = parseInt(request.getParameter("bookId"));
        int quantity = parseInt(request.getParameter("quantity"));
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
        double amount = sellDAO.calculateAmount(bookId, quantity);
        
        Sell newSell = new Sell(sellId, custId, bookId, quantity, date, amount);
        sellDAO.insertSell(newSell);
        response.sendRedirect("SellServlet?action=list");
    }
    
    private void updateSell(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ParseException {
        String sellId = request.getParameter("sellId");
        String custId = request.getParameter("custId");
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
        
        List<Sell> existingSells = sellDAO.selectSellById(sellId);
        
        if(!existingSells.isEmpty()) {
            Sell existingSell = existingSells.get(0);
            
            existingSell.setCustId(custId);
            existingSell.setBookId(bookId);
            existingSell.setQuantity(quantity);
            existingSell.setDate(date);
            
            double amount = sellDAO.calculateAmount(bookId, quantity);
            existingSell.setAmount(amount);
            
            sellDAO.updateSell(existingSell);
            
            response.sendRedirect("SellServlet?action=/list");
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Sell record not found");
        }
    }


    private void deleteSell(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        String sellId = request.getParameter("sellId");
        sellDAO.deleteSell(sellId);
        response.sendRedirect("SellServlet?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, ServletException, IOException {
        String sellId = request.getParameter("sellId");
        List<Sell> existingSell = sellDAO.selectSellById(sellId);
        request.setAttribute("sell", existingSell);
        request.getRequestDispatcher("sell-form.jsp").forward(request, response);
    }
    
}
