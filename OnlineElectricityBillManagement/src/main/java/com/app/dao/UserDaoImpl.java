package com.app.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.model.Role;
import com.app.model.User;

@Repository
public class UserDaoImpl implements IUserDao {

	@Autowired
	private EntityManager mgr;

	// add a method for authenticating customer by email and password
	@Override
	public User authenticateUser(String email, String password) {
		// Query for getting user for particular email and password
		String jpql = "select u from User u where u.email=:email and u.password=:password";
		return mgr.createQuery(jpql, User.class).setParameter("email", email).setParameter("password", password)
				.getSingleResult();
	}

	// add a method to register user
	@Override
	public String registerUser(User u) {
		mgr.persist(u);
		return "User Registered Sucessfully";
	}

	// add a method to get user for particular email phone
	@Override
	public User getUserDeatils(String email, String phone) {
		// Query for getting consumer for particular email phone
		String jpql = "select u from User u where u.email=:email and u.phone=:phone";
		User u = mgr.createQuery(jpql, User.class).setParameter("email", email).setParameter("phone", phone)
				.getSingleResult();
		return u;
	}

	// add a method to display all consumers
	@Override
	public List<User> consumerList() {
		// Query for collect user whose role is consumer
		String jpql = "select u from User u where u.role=:role";
		List<User> users = mgr.createQuery(jpql, User.class).setParameter("role", Role.CONSUMER).getResultList();
		return users;
	}

	// add a method to display all sub-dmins
	@Override
	public List<User> subAdminList() {
		// Query for collect user whose role is consumer
		String jpql = "select u from User u where u.role=:role";
		List<User> users = mgr.createQuery(jpql, User.class).setParameter("role", Role.SUB_ADMIN).getResultList();
		return users;
	}

	// add a method to get user details by consumer id
	@Override
	public User getUserDetails(int cid) {
		// find user by id
		return mgr.find(User.class, cid);
	}

	// add a method to delete user by primary key
	@Override
	public String deleteConsumer(User u) {
		// remove particular consumer
		mgr.remove(u);
		return "Consumer Deleted Sucessfully with Consumer Id " + u.getId();
	}

	// add a method to update particular consumer
	@Override
	public String updateConsumer(User u) {
		// update particular user
		mgr.persist(u);
		return "Consumer Updated Sucessfully with Consumer Id " + u.getId();
	}

}
