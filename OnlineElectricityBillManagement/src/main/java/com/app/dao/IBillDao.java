package com.app.dao;

import java.util.List;

import com.app.model.Bill;

public interface IBillDao {
	//add a method to generate bill
	String generateBill(Bill b);
	//add a method to get all bills for particular consumer id 
	List<Bill> getAllBill(int cid);
	//add a method to get particular bill by Bill id
	Bill getBillById(int bid);
	//add a method to get bill for particular month, year, and consumer id
	Bill getBillByMonthAndYear(String month, String year, int cid);
	//add a method to collect all bills who are not paid
	List<Bill> billReport(int cid);
	//add a method to get last bill who is not paid
	Bill getLastBill(int cid);
}
