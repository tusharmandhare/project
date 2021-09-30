package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.IUserDao;
import com.app.model.User;

@Service // to tell SC class is a spring bean containing B.
@Transactional // to tell SC , to automate tx management
public class UserServiceImpl implements IUserService {
	// dependency : DAO layer i/f
	@Autowired
	private IUserDao userDao;

	// add a method for authenticating customer by email and password
	@Override
	public User authenticateUser(String email, String password) {
		return userDao.authenticateUser(email, password);
	}

	// add a method to register user
	@Override
	public String registerUser(User u) {
		return userDao.registerUser(u);
	}

	// add a method to update password of particular user by matching email and
	// phone
	@Override
	public String updateUserDeatils(String email, String phone, String password) {
		User u = userDao.getUserDeatils(email, phone);
		u.setPassword(password);
		return "User Details Updated";
	}

	// add a method to get all consumers
	@Override
	public List<User> consumerList() {

		return userDao.consumerList();
	}

	// add a method to get all sub-admins
	@Override
	public List<User> subAdminList() {

		return userDao.subAdminList();
	}

	// add a method to delete consumer by primary key
	@Override
	public String deleteConsumer(int cid) {
		User user = userDao.getUserDetails(cid);
		if (user != null)
			return userDao.deleteConsumer(user);
		return "Consumer Details Deletian Failed";
	}

	// add a method to get consumer by primary key
	@Override
	public User getConsumer(int cid) {

		return userDao.getUserDetails(cid);
	}

	// add a method to update particular consumer
	@Override
	public String updateConsumer(int cid, User u) {
		// find particular user by id
		User user = userDao.getUserDetails(cid);
		if (u.getFirstName() != null && u.getLastName() != null && u.getEmail() != null && u.getPhone() != null) {
			user.setFirstName(u.getFirstName());
			user.setLastName(u.getLastName());
			user.setEmail(u.getEmail());
			user.setPhone(u.getPhone());
			return userDao.updateConsumer(user);
		}
		return "Updation Failed";
	}

}
