package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.app.model.User;

@Service
public class NotificationServiceImpl implements INotificationService{
	
	@Autowired
	private JavaMailSender javaMailSender;

	public NotificationServiceImpl(JavaMailSender javaMailSender) {
		super();
		this.javaMailSender = javaMailSender;
	}

	@Override
	public void sendNotification(User user, String message) {
		 SimpleMailMessage mail = new SimpleMailMessage();
		 	mail.setTo(user.getEmail());
	        mail.setFrom("onlinebilelectricity@gmail.com");
	        mail.setSubject("Regarding Electricity");
	        mail.setText(message);

	        javaMailSender.send(mail);
		
	}
	
	
}
