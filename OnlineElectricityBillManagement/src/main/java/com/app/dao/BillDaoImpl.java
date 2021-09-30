package com.app.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.model.Bill;
import com.app.model.Status;

@Repository
public class BillDaoImpl implements IBillDao {

	@Autowired
	private EntityManager mgr;

	// add a method to generate bill
	@Override
	public String generateBill(Bill b) {
		// save the data in database
		mgr.persist(b);
		return "Bill Generated Sucessfully for Consumer Id " + b.getUserId();
	}

	// add a method to get all bills for particular consumer id
	@Override
	public List<Bill> getAllBill(int cid) {
		// jpql query to list bills for particular consumer Id and haning status as
		// not_paid
		String jpql = "select b from Bill b where b.userId=:cid order by b.id desc";
		// Query called on Bill class and result list stored in list
		List<Bill> list = mgr.createQuery(jpql, Bill.class).setParameter("cid", cid).getResultList();
		return list;
	}

	// add a method to get particular bill by Bill id
	@Override
	public Bill getBillByMonthAndYear(String month, String year, int cid) {
		// if bills table not found any result it will give NoResultFoundException so we
		// used try catch block
		try {
			// jpql query to get bill for particular consumer Id, month and year
			String jpql = "select b from Bill b where b.month=:month and b.year=:year and b.userId=:cid";
			// Query called on Bill class and single result stored
			// and if no result found throw an exception as NoResultFoundException
			Bill b = mgr.createQuery(jpql, Bill.class).setParameter("month", month).setParameter("year", year)
					.setParameter("cid", cid).getSingleResult();
			return b;
		} catch (Exception e) {
			// if NoResultFoundException occurs will return null
			return null;
		}

	}

	// add a method to get bill for particular consumer id
	@Override
	public Bill getBillById(int bid) {
		// find result by Primary Key
		return mgr.find(Bill.class, bid);
	}

	// add a method to collect all bills who are not paid
	@Override
	public List<Bill> billReport(int cid) {
		// jpql query to list bills for whose status is NOT_PAID
		String jpql = "select b from Bill b where b.userId=:cid order by b.id desc";
		// Query called on Bill class and result list stored in list
		List<Bill> list = mgr.createQuery(jpql, Bill.class).setParameter("cid", cid).getResultList();
		return list;
	}

	//add a method to get last bill who is not paid
	@Override
	public Bill getLastBill(int cid) {
		try {
			// jpql query to get bill for particular consumer Id and status is not paid
			String jpql = "select b from Bill b where b.userId=:cid and b.status=:status";
			// Query called on Bill class and single result stored
			// and if no result found throw an exception as NoResultFoundException
			Bill b = mgr.createQuery(jpql, Bill.class).setParameter("status", Status.NOT_PAID)
					.setParameter("cid", cid).getSingleResult();
			return b;
		} catch (Exception e) {
			// if NoResultFoundException occurs will return null
			return null;
		}
	}

}
