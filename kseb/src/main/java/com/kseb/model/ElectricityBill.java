package com.kseb.model;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//this table update only after each 5 minute
//values (previous and current) fetch from CUSTOMER USEAGE table
//bill amount = ( previous reading - current reading ) * fixed charge;

@Entity
@Table(name = "electricitybill")
public class ElectricityBill implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column
	private String consumerId;

	@Column
	private Double billAmount;

	@Column
	private Boolean billPaymentStatus;
	
	@Column
	private Boolean billGenerationStatus;

	@Column
	private Double readingAtLastBill;

	@Column
	private LocalDateTime dateTime;

	public ElectricityBill() {

	}

	public ElectricityBill(Integer id, String consumerId, Double billAmount, Boolean billPaymentStatus,
			Boolean billGenerationStatus, Double readingAtLastBill, LocalDateTime dateTime) {
		super();
		this.id = id;
		this.consumerId = consumerId;
		this.billAmount = billAmount;
		this.billPaymentStatus = billPaymentStatus;
		this.billGenerationStatus = billGenerationStatus;
		this.readingAtLastBill = readingAtLastBill;
		this.dateTime = dateTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getConsumerId() {
		return consumerId;
	}

	public void setConsumerId(String consumerId) {
		this.consumerId = consumerId;
	}

	public Double getBillAmount() {
		return billAmount;
	}

	public void setBillAmount(Double billAmount) {
		this.billAmount = billAmount;
	}

	public Boolean getBillPaymentStatus() {
		return billPaymentStatus;
	}

	public void setBillPaymentStatus(Boolean billPaymentStatus) {
		this.billPaymentStatus = billPaymentStatus;
	}

	public Boolean getBillGenerationStatus() {
		return billGenerationStatus;
	}

	public void setBillGenerationStatus(Boolean billGenerationStatus) {
		this.billGenerationStatus = billGenerationStatus;
	}

	public Double getReadingAtLastBill() {
		return readingAtLastBill;
	}

	public void setReadingAtLastBill(Double readingAtLastBill) {
		this.readingAtLastBill = readingAtLastBill;
	}

	public LocalDateTime getDateTime() {
		return dateTime;
	}

	public void setDateTime(LocalDateTime dateTime) {
		this.dateTime = dateTime;
	}

	@Override
	public String toString() {
		return "ElectricityBill [id=" + id + ", consumerId=" + consumerId + ", billAmount=" + billAmount
				+ ", billPaymentStatus=" + billPaymentStatus + ", billGenerationStatus=" + billGenerationStatus
				+ ", readingAtLastBill=" + readingAtLastBill + ", dateTime=" + dateTime + "]";
	}

}
