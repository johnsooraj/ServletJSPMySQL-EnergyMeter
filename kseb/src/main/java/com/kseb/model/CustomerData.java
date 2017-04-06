package com.kseb.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "customerdata")
public class CustomerData implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column
	private String fullName;

	@Column
	private String houseName;

	@Column
	private long houseNumber;

	@Column
	private String postOffice;

	@Column
	private String landmark;

	@Column
	private long pincode;

	@Column
	private String email;

	@Column
	private String phone;

	@Column
	private String landPhone;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	LoginCredentials credentials;

	@ManyToOne(cascade = CascadeType.ALL)
	CustomerTransformarDetails transformarDetails;

	public CustomerData() {

	}

	public CustomerData(Integer id, String fullName, String houseName, long houseNumber, String postOffice,
			String landmark, long pincode, String email, String phone, String landPhone, LoginCredentials credentials,
			CustomerTransformarDetails transformarDetails) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.houseName = houseName;
		this.houseNumber = houseNumber;
		this.postOffice = postOffice;
		this.landmark = landmark;
		this.pincode = pincode;
		this.email = email;
		this.phone = phone;
		this.landPhone = landPhone;
		this.credentials = credentials;
		this.transformarDetails = transformarDetails;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getHouseName() {
		return houseName;
	}

	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}

	public long getHouseNumber() {
		return houseNumber;
	}

	public void setHouseNumber(long houseNumber) {
		this.houseNumber = houseNumber;
	}

	public String getPostOffice() {
		return postOffice;
	}

	public void setPostOffice(String postOffice) {
		this.postOffice = postOffice;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public long getPincode() {
		return pincode;
	}

	public void setPincode(long pincode) {
		this.pincode = pincode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLandPhone() {
		return landPhone;
	}

	public void setLandPhone(String landPhone) {
		this.landPhone = landPhone;
	}

	public LoginCredentials getCredentials() {
		return credentials;
	}

	public void setCredentials(LoginCredentials credentials) {
		this.credentials = credentials;
	}

	public CustomerTransformarDetails getTransformarDetails() {
		return transformarDetails;
	}

	public void setTransformarDetails(CustomerTransformarDetails transformarDetails) {
		this.transformarDetails = transformarDetails;
	}

	@Override
	public String toString() {
		return "CustomerData [id=" + id + ", fullName=" + fullName + ", houseName=" + houseName + ", houseNumber="
				+ houseNumber + ", postOffice=" + postOffice + ", landmark=" + landmark + ", pincode=" + pincode
				+ ", email=" + email + ", phone=" + phone + ", landPhone=" + landPhone + "";
	}
}
