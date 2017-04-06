package com.kseb.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "logincredentials")
public class LoginCredentials implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column
	private String username;
	
	@Column
	private String password;
	
	@Column
	private String loginType;
	
	@Column
	private String meterId;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	CustomerData customerData;

	public LoginCredentials() {

	}

	public LoginCredentials(Integer id, String username, String password, String loginType, String meterId,
			CustomerData customerData) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.loginType = loginType;
		this.meterId = meterId;
		this.customerData = customerData;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public String getMeterId() {
		return meterId;
	}

	public void setMeterId(String meterId) {
		this.meterId = meterId;
	}

	public CustomerData getCustomerData() {
		return customerData;
	}

	public void setCustomerData(CustomerData customerData) {
		this.customerData = customerData;
	}

	@Override
	public String toString() {
		return "LoginCredentials [id=" + id + ", username=" + username + ", password=" + password + ", loginType="
				+ loginType + ", meterId=" + meterId + ", customerData=" + customerData + "]";
	}

}
