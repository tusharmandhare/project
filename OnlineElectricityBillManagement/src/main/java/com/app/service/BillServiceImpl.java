package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.IBillDao;
import com.app.model.Bill;
import com.app.model.Status;

@Service //to tell SC class is a spring bean containing B.
@Transactional //to tell SC , to automate tx management
public class BillServiceImpl implements IBillService {
	//dependency : DAO layer i/f
	@Autowired
	private IBillDao billDao;
	
	//add a method to generate bill
	@Override
	public String generateBill(Bill b) {
	
		return billDao.generateBill(b);
	}
	
	//add a method to get all bills for particular consumer id 
	@Override
	public List<Bill> getAllBill(int cid) {
		
		return billDao.getAllBill(cid);
	}
	
	//add method which will gives that bill is exists for particular month year and consumer id
	@Override
	public boolean billExists(String month, String year, int cid) {
		//if find return true
		if(billDao.getBillByMonthAndYear(month, year, cid)!=null)
			return true;
		//otherwise return false
		return false;
	}
	
	//add a method to get particular bill by Bill id
	@Override
	public Bill getBillById(int bid) {
		
		return billDao.getBillById(bid);
	}
	
	//add a method to update bill
	@Override
	public Bill updateBill(Bill b) {
		//add a method to get particular bill by Bill i
		Bill bill = billDao.getBillById(b.getId());
		//set updated terms
		bill.setFine(b.getFine());
		bill.setTotalBill(b.getTotalBill()+b.getFine());
		bill.setStatus(Status.PAID);
		return b;
	}
	
	//add a method to collect all bills who are not paid
	@Override
	public List<Bill> billReport(int cid) {
		return billDao.billReport(cid);
	}

	//add a method to get last bill who is not paid
	@Override
	public Bill getLastBill(int cid) {

		return billDao.getLastBill(cid);
	}

	@Override
	public Bill updateLastBill(Bill b) {
		Bill bill = billDao.getBillById(b.getId());
		bill.setStatus(Status.FORWORD_WITH_FINE);
		return bill;
	}

	
}
