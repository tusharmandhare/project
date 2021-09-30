package com.app.dao;

import java.util.List;

import com.app.model.User;

public interface IUserDao {
	//add a method for authenticating customer by email and password
	User authenticateUser(String email, String password);
	//add a method to get user for particular email phone
	User getUserDeatils(String email, String phone);
	//add a method to display all sub consumers
	List<User> consumerList();
	//add a method to display all sub admins
	List<User> subAdminList();
	//add a method to register user
	String registerUser(User u);
	//add a method to get user details by consumer id
	User getUserDetails(int cid);
	//add a method to delete user by primary key
	String deleteConsumer(User u);
	//add a method to update particular consumer
	String updateConsumer(User u);
	
}
