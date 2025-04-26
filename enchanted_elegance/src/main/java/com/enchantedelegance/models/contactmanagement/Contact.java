package com.enchantedelegance.models.contactmanagement;

public class Contact {
    private int id;
    private String name;
    private String email;
    private String mobile; 
    private String subject;
    private String message;
    private String status;

    public Contact(int id, String name, String email, String mobile, String subject, String message, String status) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.subject = subject;
        this.message = message;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() { return email;}

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}