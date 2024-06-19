package com.sell;
import java.util.Date;

public class Sell {
    private String sellId;
    private String custId;
    private int bookId;
    private int quantity;
    private Date date;
    private double amount;
    private String title;

    public Sell() {}
    
    public Sell(String sellId, String custId, int bookId, int quantity, Date date, double amount) {
        this.sellId = sellId;
        this.custId = custId;
        this.bookId = bookId;
        this.quantity = quantity;
        this.date = date;
        this.amount = amount;
    }

    public Sell(String sellId, String custId, int bookId, int quantity, double amount) {
        this.sellId = sellId;
        this.custId = custId;
        this.bookId = bookId;
        this.quantity = quantity;
        this.amount = amount;
    }
    
    public Sell(String custId) {
        this.custId = custId;
    }
    
    public Sell(String sellId, String custId, int bookId, int quantity, Date date) {
        this.sellId = sellId;
        this.custId = custId;
        this.bookId = bookId;
        this.quantity = quantity;
        this.date = date;
    }
    
    public String getSellId() {
        return sellId;
    }

    public void setSellId(String sellId) {
        this.sellId = sellId;
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
