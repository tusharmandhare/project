package com.app.model;

import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "payment_details")
public class Payment {
	@Id
	@Column(name = "payment_no")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(length=16, name = "card_number")
	@Length(min = 16, max = 16, message = "Invalid Card Number")
	private String cardNumber;
	@Column(length = 20)
	@Length(min = 3, max = 15, message = "Invalid Name")
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@FutureOrPresent
	@Column(name = "exp_date")
	private LocalDate expDate;
	@Column(nullable = false)
	@NotBlank(message = "cvv is required")
	private String cvv;
	private double fine;
	private double totalBill;
	@Enumerated(EnumType.STRING)
	private CardType cardType;
	@Column(name = "payment_date")
	private Date paymentDate;
	private int userId;
	private int billId;
	
	public Payment() {
		
	}

	public Payment(String cardNumber,
			String name,LocalDate expDate, String cvv, double fine, double totalBill, CardType cardType, Date paymentDate, int userId, int billId) {
		super();
		this.cardNumber = cardNumber;
		this.name = name;
		this.expDate = expDate;
		this.cvv = cvv;
		this.fine = fine;
		this.totalBill = totalBill;
		this.cardType = cardType;
		this.paymentDate = paymentDate;
		this.userId = userId;
		this.billId = billId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDate getExpDate() {
		return expDate;
	}

	public void setExpDate(LocalDate expDate) {
		this.expDate = expDate;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public double getFine() {
		return fine;
	}

	public void setFine(double fine) {
		this.fine = fine;
	}

	public double getTotalBill() {
		return totalBill;
	}

	public void setTotalBill(double totalBill) {
		this.totalBill = totalBill;
	}

	public CardType getCardType() {
		return cardType;
	}

	public void setCardType(CardType cardType) {
		this.cardType = cardType;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getBillId() {
		return billId;
	}

	public void setBillId(int billId) {
		this.billId = billId;
	}

	@Override
	public String toString() {
		return "Payment [id=" + id + ", cardNumber=" + cardNumber + ", name=" + name + ", expDate=" + expDate + ", cvv="
				+ cvv + ", fine=" + fine + ", totalBill=" + totalBill + ", cardType=" + cardType + ", paymentDate="
				+ paymentDate + ", userId=" + userId + ", billId=" + billId + "]";
	}

}