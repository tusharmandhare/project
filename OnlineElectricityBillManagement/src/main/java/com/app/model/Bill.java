package com.app.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "bills")
public class Bill {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bill_id")
	private Integer id;
	private Integer userId;
	@Column(length = 20, nullable = false)
	@NotBlank(message = "Zone is required")
	private String zone;
	private int unit;
	private double currentBill;
	private double dues;
	private double fine;
	private double tax;
	private double totalBill;
	@Column(name = "expiry_date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate expiryDate;
	@Enumerated(EnumType.STRING)
	private Status status;
	@Column(length = 20, nullable = false)
	@NotBlank(message = "Year is required is required")
	private String year;
	@Column(length = 20, nullable = false)
	@NotBlank(message = "Month is required is required")
	private String month;
	
	public Bill() {
		
	}

	public Bill(Integer userId, @NotBlank(message = "Zone is required") String zone, int unit, double currentBill,
			double dues, double fine, double tax, double totalBill, LocalDate expiryDate, Status status,
			@NotBlank(message = "Year is required is required") String year,
			@NotBlank(message = "Month is required is required") String month) {
		super();
		this.userId = userId;
		this.zone = zone;
		this.unit = unit;
		this.currentBill = currentBill;
		this.dues = dues;
		this.fine = fine;
		this.tax = tax;
		this.totalBill = totalBill;
		this.expiryDate = expiryDate;
		this.status = status;
		this.year = year;
		this.month = month;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public int getUnit() {
		return unit;
	}

	public void setUnit(int unit) {
		this.unit = unit;
	}

	public double getCurrentBill() {
		return currentBill;
	}

	public void setCurrentBill(double currentBill) {
		this.currentBill = currentBill;
	}

	public double getDues() {
		return dues;
	}

	public void setDues(double dues) {
		this.dues = dues;
	}

	public double getFine() {
		return fine;
	}

	public void setFine(double fine) {
		this.fine = fine;
	}

	public double getTax() {
		return tax;
	}

	public void setTax(double tax) {
		this.tax = tax;
	}

	public double getTotalBill() {
		return totalBill;
	}

	public void setTotalBill(double totalBill) {
		this.totalBill = totalBill;
	}

	public LocalDate getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(LocalDate expiryDate) {
		this.expiryDate = expiryDate;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	@Override
	public String toString() {
		return "Bill [id=" + id + ", userId=" + userId + ", zone=" + zone + ", unit=" + unit + ", currentBill="
				+ currentBill + ", dues=" + dues + ", fine=" + fine + ", tax=" + tax + ", totalBill=" + totalBill
				+ ", expiryDate=" + expiryDate + ", status=" + status + ", year=" + year + ", month=" + month + "]";
	}

}