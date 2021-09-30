package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.IPaymentDao;
import com.app.model.Payment;

@Service //to tell SC class is a spring bean containing B.
@Transactional //to tell SC , to automate tx management
public class PaymentServiceImpl implements IPaymentService {
	
	//dependency : DAO layer i/f
	@Autowired
	private IPaymentDao paymentDao;
	
	//add a method to save payment info
	@Override
	public String payBill(Payment p) {
		paymentDao.payBill(p);
		return "Payment Done Sucessfully";
	}
	
	//add a method to get result list for particular user id
	@Override
	public List<Payment> paymentReport(Integer uid) {
	
		return paymentDao.paymentReport(uid);
	}

}
