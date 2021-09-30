package com.app.controller;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.model.Role;
import com.app.model.User;
import com.app.service.INotificationService;
import com.app.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService userService;
	
	@Autowired
	private INotificationService notificationService;

	public UserController() {
		System.out.println("in ctor of " + getClass().getName());
	}

	@PostConstruct
	public void anyInit() {
		System.out.println("in ctor of " + getClass().getName());
	}
	
	//add a req handling Method to show user login form
	@GetMapping("/login")
	public String showLoginForm() {
		System.out.println("in show login form ");
		// Forward the user to login form
		return "/user/login";
	}

	//add a req handling Method to process user login form
	@PostMapping("/login")
	public String processLoginform(@RequestParam String email, @RequestParam String password, Model modelMap,
			HttpSession hs) {
		System.out.println("in process login form " + email + " " + password);
		try {
			//authenticate user : exists or not
			User u = userService.authenticateUser(email, password);
			//if exists add to http session
			hs.setAttribute("user_details", u);
			if (u.getRole().equals(Role.ADMIN)) {
				// after authentication and role check : redirect user to Consumer panel
				return "redirect:/admin/home";
			}
			if (u.getRole().equals(Role.SUB_ADMIN)) {
				// after authentication and role check : redirect user to Consumer panel
				return "redirect:/sub_admin/home";
			}
			if (u.getRole().equals(Role.CONSUMER)) {
				// after authentication and role check : redirect user to Consumer panel
				return "redirect:/consumer/home";
			}
		} catch (RuntimeException e) {
			System.out.println("err in controller " + e);
			modelMap.addAttribute("message", "Invalid Login ,Please Retry");
			// Forward the user to login form : highlighted with errors
			return "/user/login";
		}
		// Forward the user to login form
		return "/user/login";
	}

	//add a req handling Method to logout user
	@GetMapping("/logout")
	public String userLogout(HttpSession session, Model modelMap, HttpServletRequest request,
			HttpServletResponse resp) {
		System.out.println("in user logout ");
		User u = (User) session.getAttribute("user_details");
		modelMap.addAttribute("details", u.getFirstName() + " " + u.getLastName());
		//Invalidate session
		session.invalidate();
		//home Screen will be appeared afte 5 sec
		resp.setHeader("refresh", "5;url=" + request.getContextPath());
		// Forward the user to logout page
		return "/user/logout";
	}
	
	//add a req handling Method to show user registration form specific for Consumer
	@GetMapping("/register")
	public String showRegisterForm(User u) {
		System.out.println("in Register Form ");
		// Forward the user to register form
		return "/user/register";
	}
	
	//add a req handling Method to process user registration form 
	@PostMapping("/register")
	public String processRegisterForm(@Valid User u, BindingResult res, RedirectAttributes flashMap, Model modelMap) {
		//All Sign up users are Consumer
		u.setRole(Role.CONSUMER);
		System.out.println("in process register form" + u);
		System.out.println("Binding Result : " + res);
		if (res.hasErrors()) {
			System.out.println("error in process register");
			modelMap.addAttribute("mesage", "User Registration Failed" + "<br>" + "Please try again...!!");
			// Forward the user to register form : highlighted with errors
			return "/user/register";
		}
		flashMap.addFlashAttribute("message", userService.registerUser(u));
		try {
			String message = "Dear "+u.getFirstName()+", "+"\nYou are sucessfully registered for our Electricity board"+"\nConsumer Id : "+u.getId();
			notificationService.sendNotification(u, message);
		}catch(MailException e) {
			System.out.println(e.getMessage());
		}
		// after insert : redirect admin to consumers list : highlighted Success Message
		return "redirect:/user/login";
	}
	
	//add a req handling Method to show Reset Password form
	@GetMapping("/password")
	public String showResetPasswordForm() {
		System.out.println("in show Reset Password form");
		// Forward the user to password form 
		return "/user/password";
	}

	//add a req handling Method to process Reset Password form
	@PostMapping("/password")
	public String processResetPasswordForm(@RequestParam String email, @RequestParam String phone,
			@RequestParam String password, @RequestParam String confirmPassword, RedirectAttributes flashMap, Model modelMap) {
		System.out.println("in process Reset Form " + email + " " + phone + " " + password);
		try {
			//Check New PAssword And Confirm Passwords are equal
			if(password.equals(confirmPassword)) { 
				flashMap.addFlashAttribute("message", userService.updateUserDeatils(email, phone, password));
				// after update : redirect user to login : highlighted Success Message
				return "redirect:/user/login";
			}
			else {
				modelMap.addAttribute("message", "Password Updation Failed..." + "<br>" + "New Passwod and Confirm Password must be same");
				// Forward the user to password form : highlighted with errors
				return "/user/password";
			}
		} catch (RuntimeException e) {
			System.out.println("err in controller " + e);
			modelMap.addAttribute("message", "Password Updation Failed...!!!" + "<br>" + "Please Enter Correct Credentials...!!!");
			// Forward the user to password form : highlighted with errors
			return "/user/password";
		}
	
	}
	

}
