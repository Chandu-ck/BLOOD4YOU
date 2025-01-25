package com.blooddonationapp.models;

public class Donor {
    private String name;
    private String mobileNumber;
    private String email;
    private String location;
    private String bloodGroup; // Added field for blood group

    // Constructor with bloodGroup field
    public Donor(String name, String mobileNumber, String email, String location, String bloodGroup) {
        this.name = name;
        this.mobileNumber = mobileNumber;
        this.email = email;
        this.location = location;
        this.bloodGroup = bloodGroup; // Set blood group
    }

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    @Override
    public String toString() {
        return "Donor [name=" + name + ", mobileNumber=" + mobileNumber + ", email=" + email + ", location=" + location + ", bloodGroup=" + bloodGroup + "]";
    }
}
