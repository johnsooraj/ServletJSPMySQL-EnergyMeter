package com.kseb.model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "cutomertransformar")
public class CustomerTransformarDetails implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	@Column
	private String transformarSection;
	@Column
	private String transformarNumber;

	public CustomerTransformarDetails() {

	}

	public CustomerTransformarDetails(Integer id, String transformarSection, String transformarNumber) {
		super();
		this.id = id;
		this.transformarSection = transformarSection;
		this.transformarNumber = transformarNumber;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTransformarSection() {
		return transformarSection;
	}

	public void setTransformarSection(String transformarSection) {
		this.transformarSection = transformarSection;
	}

	public String getTransformarNumber() {
		return transformarNumber;
	}

	public void setTransformarNumber(String transformarNumber) {
		this.transformarNumber = transformarNumber;
	}

	@Override
	public String toString() {
		return "CustomerTransformarDetails [id=" + id + ", transformarSection=" + transformarSection
				+ ", transformarNumber=" + transformarNumber + "]";
	}

}
