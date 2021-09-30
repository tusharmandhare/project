package com.app.controller;

import java.time.LocalDate;
import java.util.Date;

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

import com.app.model.Bill;
import com.app.model.CardType;
import com.app.model.Payment;
import com.app.model.User;
import com.app.service.IBillService;
import com.app.service.INotificationService;
import com.app.service.IPaymentService;
import com.app.service.IUserService;

@Controller
@RequestMapping("/consumer")
public class ConsumerController {

	@Autowired
	private IUserService userService;

	@Autowired
	private IBillService billService;
	
	@Autowired
	private IPaymentService paymentService;
	
	@Autowired
	private INotificationService notificationService;

	public ConsumerController() {
		System.out.println("in ctor of " + getClass().getName());
	}
	
	//add a req handling Method to show Home Page
	@GetMapping("/home")
	public String showHomePage() {
		System.out.println("in show home page");
		// Forward the consumer to home page 
		return "/consumer/home";
	}
	
	//add a req handling Method to show profile
	@GetMapping("/profile")
	public String showAdminProfile() {
		System.out.println("in show consumer profile ");
		// Forward the consumer to consumer profile
		return "/consumer/profile";
	}
	
	//add a req handling Method to show Update form 
	@GetMapping("/update")
	public String showUpdateConsumerForm(@RequestParam int cid, Model modelMap, User u) {
		System.out.println("in consumer updation");
		modelMap.addAttribute("consumer", userService.getConsumer(cid));
		// Forward the admin to update form
		return "/consumer/update";
	}
	
	//add a req handling Method to process Update form
	@PostMapping("/update")
	public String processUpdateConsumerForm(@Valid User u, BindingResult res, @RequestParam int cid, 
			RedirectAttributes flashMap, Model modelMap, HttpSession session) {
		System.out.println("in process update consumer form");
		System.out.println("Binding Result : " + res);
		if (res.hasErrors()) {
			System.out.println("error in process register");
			modelMap.addAttribute("mesage", "User Updation Failed" + "<br>" + "Please try again...!!");
			// Forward the consumer to search form : highlighted with errors
			return "/consumer/update";
		}
		if(u.getFirstName()==null | u.getLastName()==null | u.getEmail()==null | u.getPhone()== null) {
			System.out.println("error in process register");
			modelMap.addAttribute("mesage", "User Updation Failed" + "<br>" + "Please try again...!!");
			// Forward the consumer to search form : highlighted with errors
			return "/consumer/update";
		}
		flashMap.addFlashAttribute("message", userService.updateConsumer(cid, u));
		// after update : update Session user_details also
		session.setAttribute("user_details", userService.getConsumer(cid));
		// after update : redirect consumer to profile : highlighted with Success Message
		return "redirect:/consumer/profile";
	}
	
	//add a req handling Method to display all Bill 
	@GetMapping("/bill_history")
	public String showBill(Model modelMap, HttpSession session) {
		System.out.println("in show bill history");
		User c = (User) session.getAttribute("user_details");
		System.out.println(c.getId());
		modelMap.addAttribute("view_bill", billService.getAllBill(c.getId()));
		// Forward the consumer to bill_history 
		return "/consumer/bill_history";
	}
	
	@GetMapping("/current_bill")
	public String showCurrentBill(Model modelMap, HttpSession session) {
		System.out.println("in show current bill");
		User c = (User) session.getAttribute("user_details");
		System.out.println(c.getId());
		Bill b = billService.getLastBill(c.getId());
		/*
		 * if(b==null) { modelMap.addAttribute("message", "No Pending Bill");
		 * modelMap.addAttribute("view_bill", billService.getAllBill(c.getId())); return
		 * "/consumer/bill_history"; }
		 */
		if(b==null)
			modelMap.addAttribute("message", "No Pending Bill");
		modelMap.addAttribute("view_bill", b);
		// Forward the consumer to bill_history : Status : NOT_PAID
		return "/consumer/current_bill";
	}
	
	//add a req handling Method to show Pay form
	@GetMapping("/pay_bill")
	public String showPayForm(@RequestParam int bid, HttpSession session, Payment p, Model modelMap) {
		System.out.println("in show pay Form");
		Bill b = billService.getBillById(bid);
		if (b.getExpiryDate().isBefore(LocalDate.now())) {
			b.setFine(b.getFine()+20);
			b.setTotalBill(b.getTotalBill()+b.getFine());
			session.setAttribute("bill_details", b);
			modelMap.addAttribute("card_type", CardType.values());
			// Forward the consumer to pay form :  Along Addition of Fine Due to late
			return "/consumer/pay_bill";
		}
		session.setAttribute("bill_details", b);
		modelMap.addAttribute("card_type", CardType.values());
		// Forward the consumer to pay form
		return "/consumer/pay_bill";
	}
	
	//add a req handling Method to process Pay form
	@PostMapping("/pay_bill")
	public String processBillForm(@Valid Payment p, BindingResult res, HttpSession session,  RedirectAttributes flashMap, Model modelMap) {
		System.out.println("in process bill form"+ p);
		System.out.println("Binding Results : " + res);
		if (res.hasErrors()) {
			System.out.println("error in process register");
			modelMap.addAttribute("mesage", "Payment Transaction Failed Please Try Again...!!");
			modelMap.addAttribute("card_type", CardType.values());
			// Forward the consumer to pay view bill : Status : PAID
			return "/consumer/pay_bill";
		}
		Bill b = (Bill) session.getAttribute("bill_details");
		p.setPaymentDate(new Date(System.currentTimeMillis()));
		p.setBillId(b.getId());
		p.setUserId(b.getUserId());
		System.out.println(p);
		flashMap.addFlashAttribute("message", paymentService.payBill(p));	
		billService.updateBill(b);
		try {
			User user = (User) session.getAttribute("user_details");
			String message = "Dear "+user.getFirstName()+", "+"\nThank you for paying bill of Rs."+ b.getTotalBill()+" month : "+ b.getMonth()+" year : "+b.getYear();
			notificationService.sendNotification(user, message);
		}catch(MailException e) {
			System.out.println(e);
		}
		// after update : redirect consumer to view_bill : highlighted with Success Message
		return "redirect:/consumer/bill_history";
	}
	
	//add a req handling Method to show all bills : status : PAID
	@GetMapping("/payment_history")
	public String showBillHistory(Model modelMap, HttpSession session) {
		System.out.println("in show bill history");
		User u = (User) session.getAttribute("user_details");
		modelMap.addAttribute("bill_history", paymentService.paymentReport(u.getId()));
		// Forward the consumer to view_bill : Status : PAID 
		return "/consumer/payment_history";
	}

}
