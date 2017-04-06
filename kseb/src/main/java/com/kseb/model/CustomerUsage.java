package com.kseb.model;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//This table receive all request from ELECTRONIC system , request contain two parameter one is METER ID and CURRENT READING
//consumer id will collect from login credentials table, and compare both if those are equal the table will insert.
//so whenever the request came that will update this table.

@Entity
@Table(name = "customerusage")
public class CustomerUsage implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column
	private Double currentReading;

	@Column
	private Double totalReading;

	@Column
	private String cousumerId;
	
	private LocalDateTime dateTime;

	public CustomerUsage() {

	}

	public CustomerUsage(Integer id, Double currentReading, Double totalReading, String cousumerId,
			LocalDateTime dateTime) {
		super();
		this.id = id;
		this.currentReading = currentReading;
		this.totalReading = totalReading;
		this.cousumerId = cousumerId;
		this.dateTime = dateTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getCurrentReading() {
		return currentReading;
	}

	public void setCurrentReading(Double currentReading) {
		this.currentReading = currentReading;
	}

	public Double getTotalReading() {
		return totalReading;
	}

	public void setTotalReading(Double totalReading) {
		this.totalReading = totalReading;
	}

	public String getCousumerId() {
		return cousumerId;
	}

	public void setCousumerId(String cousumerId) {
		this.cousumerId = cousumerId;
	}

	public LocalDateTime getDateTime() {
		return dateTime;
	}

	public void setDateTime(LocalDateTime dateTime) {
		this.dateTime = dateTime;
	}

	@Override
	public String toString() {
		return "CustomerUsage [id=" + id + ", currentReading=" + currentReading + ", totalReading=" + totalReading
				+ ", cousumerId=" + cousumerId + ", dateTime=" + dateTime + "]";
	}

}
