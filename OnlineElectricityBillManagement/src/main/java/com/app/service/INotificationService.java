package com.app.service;

import com.app.model.User;

public interface INotificationService {
	
	public void sendNotification(User user, String message);
}
