package com.kseb.model;

import javax.persistence.*;

/*Data in this class is almost constant can only change by the ADMIN
 * 
 */

@Entity
@Table(name = "electricitydata")
public class ElectricityData {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column
	private String transformerNumber;

	@Column
	private String trasformerSection;

	public ElectricityData() {
	}

	public ElectricityData(Integer id, String transformerNumber, String trasformerSection) {
		super();
		this.id = id;
		this.transformerNumber = transformerNumber;
		this.trasformerSection = trasformerSection;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTransformerNumber() {
		return transformerNumber;
	}

	public void setTransformerNumber(String transformerNumber) {
		this.transformerNumber = transformerNumber;
	}

	public String getTrasformerSection() {
		return trasformerSection;
	}

	public void setTrasformerSection(String trasformerSection) {
		this.trasformerSection = trasformerSection;
	}

	@Override
	public String toString() {
		return "ElectricityData [id=" + id + ", transformerNumber=" + transformerNumber + ", trasformerSection="
				+ trasformerSection + "]";
	}

	
}
