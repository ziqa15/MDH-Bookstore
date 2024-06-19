/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.staff;

/**
 *
 * @author User
 */
public class Staff {
    protected int staffId;
    protected String name;
    protected String password;
    protected String email;
    protected int phoneNo;
    protected String address;
    
    public Staff(){}
    
    public Staff(String name, String password, String email, int phoneNo, String address){
        super();
        this.name = name;
        this.password = password;
        this.email = email;
        this.phoneNo = phoneNo;
        this.address = address;
    }
    
    public Staff(int staffId, String name, String password, String email, int phoneNo, String address){
        super();
        this.staffId = staffId;
        this.name = name;
        this.password = password;
        this.email = email;
        this.phoneNo = phoneNo;
        this.address = address;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(int phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}