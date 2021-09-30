package com.app.service;

import java.util.List;

import com.app.model.Bill;

public interface IBillService {
	//add a method to generate bill
	String generateBill(Bill b);
	//add a method to get all bills for particular consumer id 
	List<Bill> getAllBill(int cid);
	//add method which will gives that bill is exists for particular month year and consumer id
	boolean billExists(String month, String year, int cid);
	//add a method to get particular bill by Bill id
	Bill getBillById(int bid);
	//add a method to update bill
	Bill updateBill(Bill b);
	//add a method to collect all bills who are not paid
	List<Bill> billReport(int cid);
	//add a method to get last bill who is not paid
	Bill getLastBill(int cid);
	//add a method to update last bill
	Bill updateLastBill(Bill b);
}
