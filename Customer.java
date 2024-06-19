
package com.customer;

public class Customer {
    private String custId;
    
    public Customer(String custId) {
        this.custId = custId;
    }
    
    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

}
