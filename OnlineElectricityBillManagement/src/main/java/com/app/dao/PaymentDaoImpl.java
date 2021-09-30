package com.app.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.model.Payment;

@Repository
public class PaymentDaoImpl implements IPaymentDao {
	
	@Autowired
	private EntityManager mgr;
	
	//add a method to save payment info
	@Override
	public String payBill(Payment p) {
		mgr.persist(p);
		return "Payment Done Sucessfully";
	}
	
	//add a method to get result list for particular user idD
	@Override
	public List<Payment> paymentReport(int uid) {
		//Query for getting result list for particular user id
		String jpql = "select p from Payment p where p.userId=:uid order by p.id desc";
		List<Payment> history = mgr.createQuery(jpql, Payment.class).setParameter("uid", uid).getResultList();
		return history;
	}
	
}
