package com.app.service;

import java.util.List;

import com.app.model.User;

public interface IUserService {
	//add a method for authenticating customer by email and password
	User authenticateUser(String email, String password);
	//add a method to update password of particular user by matching email and phone 
	String updateUserDeatils(String email, String phone, String password);
	//add a method to register user
	String registerUser(User u);
	//add a method to display all consumers
	List<User> consumerList();
	//add a method to display all sub admins
	List<User> subAdminList();
	//add a method to delete consumer by primary key
	String deleteConsumer(int cid);
	//add a method to get consumer by primary key
	User getConsumer(int cid);
	//add a method to update particular consumer
	String updateConsumer(int cid, User u);
}
