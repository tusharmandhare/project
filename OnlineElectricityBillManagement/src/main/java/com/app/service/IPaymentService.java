package com.app.service;

import java.util.List;

import com.app.model.Payment;

public interface IPaymentService {
	//add a method to save payment info
	String payBill(Payment p);
	//add a method to get result list for particular user id
	List<Payment> paymentReport(Integer uid);
}
