package com.app.controller;

import java.time.LocalDate;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.model.Bill;
import com.app.model.Status;
import com.app.model.User;
import com.app.service.IBillService;
import com.app.service.IPaymentService;
import com.app.service.IUserService;

@Controller
@RequestMapping("/sub_admin")
public class SubAdminController {

	@Autowired
	private IUserService userService;

	@Autowired
	private IBillService billService;

	@Autowired
	private IPaymentService paymentService;

	public SubAdminController() {
		System.out.println("in ctor of " + getClass().getName());
	}

	// add a req handling Method to show Home Page
	@GetMapping("/home")
	public String showHomePage(Model modelMap) {
		System.out.println("in show home page");
		modelMap.addAttribute("count", userService.consumerList().size());
		// Forward the admin to home page
		return "/sub_admin/home";
	}

	// add a req handling Method to show profile
	@GetMapping("/profile")
	public String showAdminProfile() {
		System.out.println("in show admin profile ");
		// Forward the admin to admin profile
		return "/sub_admin/profile";
	}

	// add a req handling Method to show Consumer 
	@GetMapping("/consumer")
	public String showConsumers(@RequestParam String cid, Model modelMap) {
		System.out.println("in show consumer");
		try {
			int id = Integer.parseInt(cid);
			User u = userService.getConsumer(id);
			if (u != null) {
				modelMap.addAttribute("consumer_details", u);
				// Forward the admin to consumer details
				return "/sub_admin/view_consumer";
			} else {
				modelMap.addAttribute("message", "Invalid Consumer Id ,Please retry");
				// Forward the admin to generate_bill form : highlighted with errors
				return "/sub_admin/search_consumer";
			}
		}catch(RuntimeException e){
			System.out.println("err in controller " + e);
			modelMap.addAttribute("message", "Invalid Consumer Id ,Please retry");
			// Forward the user to login form : highlighted with errors
			return "/sub_admin/search_consumer";
		}	
			
	}

	// add a req handling Method to show Update Consumer as well as Admin form
	@GetMapping("/update")
	public String showUpdateConsumerForm(@RequestParam int cid, Model modelMap, User u) {
		System.out.println("in consumer updation");
		modelMap.addAttribute("consumer", userService.getConsumer(cid));
		// Forward the admin to update form
		return "/sub_admin/update";
	}

	// add a req handling Method to process Update Consumer as well as Admin form
	@PostMapping("/update")
	public String processUpdateConsumerForm(@Valid User u, @RequestParam int cid, BindingResult res,
			RedirectAttributes flashMap, Model modelMap) {
		System.out.println("in process update consumer form" + u);
		System.out.println("Binding Result : " + res);
		if (res.hasErrors()) {
			System.out.println("error in process register");
			modelMap.addAttribute("mesage", "User Updation Failed" + "<br>" + "Please try again...!!");
			// Forward the admin to search form : highlighted with errors
			return "/sub_admin/update";
		}
		userService.updateConsumer(cid, u);
		flashMap.addFlashAttribute("message", "Sub-Admin profile updated Sucessfully" );
		// after insert : redirect admin to consumers list : highlighted Success Message
		return "redirect:/sub_admin/profile";
	}

	// add a req handling method to show search option
	@GetMapping("/search")
	public String showSarchForm() {
		System.out.println("in show search form");
		// Forward the admin to search form
		return "/sub_admin/search";
	}

	// add a req handling method to show search option
	@GetMapping("/search_bill_report")
	public String showSarchFormForBillReport() {
		System.out.println("in show search form for search consumer");
		// Forward the admin to search form
		return "/sub_admin/search_bill_report";
	}

	// add a req handling method to show search option
	@GetMapping("/search_payment_report")
	public String showSarchFormForPaymentReport() {
		System.out.println("in show search form for search consumer");
		// Forward the admin to search form
		return "/sub_admin/search_payment_report";
	}
	
	@GetMapping("/search_consumer")
	public String showSarchFormViewConsumer() {
		System.out.println("in show search form for search consumer");
		// Forward the admin to search form
		return "/sub_admin/search_consumer";
	}

	// add a req handling Method to show bill generation form
	@GetMapping("/generate_bill")
	public String showBillForm(@RequestParam String cid, Bill b, Model modelMap) {
		System.out.println("in show generate_bill form");
		try {
			int id = Integer.parseInt(cid);
			User c = userService.getConsumer(id);
			if (c != null) {
				modelMap.addAttribute("cosumer_detail", c);
				// Forward the admin to generate_bill form
				return "/sub_admin/generate_bill";
			} else {
				modelMap.addAttribute("message", "Invalid Consumer Id ,Please retry!!!!");
				// Forward the admin to generate_bill form : highlighted with errors
				return "/sub_admin/search";
			}
		} catch (RuntimeException e) {
			System.out.println("err in controller " + e);
			modelMap.addAttribute("message", "Invalid Consumer Id ,Please retry!!!!");
			// Forward the admin to search form : highlighted with errors
			return "/sub_admin/search";
		}
	}

	// add a req handling Method to process bill generation form
	@PostMapping("/generate_bill")
	public String processBillForm(@Valid Bill b, BindingResult res, RedirectAttributes flashMap, Model modelMap) {
		System.out.println("in process generate_bill  form " + b);
		System.out.println("Binding Result : " + res);
		if (res.hasErrors()) {
			System.out.println("error in process register");
			modelMap.addAttribute("message", "Bill Generation Failed" + "<br>" + "Please try again...!!");
			// Forward the admin to generate_bill form : highlighted with errors
			return "/sub_admin/generate_bill";
		}
		if (billService.billExists(b.getMonth(), b.getYear(), b.getUserId())) {
			System.out.println("error in process register");
			modelMap.addAttribute("message", "Already Bill Generated for entered month and Year");
			// Forward admin to generate_bill : highlighted with Success
			return "/sub_admin/generate_bill";
		}
		b.setExpiryDate(LocalDate.now().plusDays(15));
		Bill lastBill = billService.getLastBill(b.getUserId());
		if (lastBill != null) {
			b.setDues(lastBill.getTotalBill());
			b.setFine(50);
			billService.updateLastBill(lastBill);
		}
		if (lastBill == null) {
			b.setDues(0);
			b.setFine(0);
		}
		if (b.getUnit() < 100)
			b.setCurrentBill(0);
		else if (b.getUnit() < 250)
			b.setCurrentBill((b.getUnit() - 100) * 8);
		else
			b.setCurrentBill((b.getUnit() - 100) * 13);
		b.setTax(b.getCurrentBill() * 0.10);
		b.setTotalBill(b.getCurrentBill() + b.getDues() + b.getFine() + b.getTax());
		b.setStatus(Status.NOT_PAID);
		System.out.println(b);
		modelMap.addAttribute("message", billService.generateBill(b));
		// after insert : redirect admin to bill_report : highlighted With Success
		return "/sub_admin/generate_bill";
	}

	// add a req handling method to show or display bill report for all Consumers :
	// Bill : status : NOT_PAID
	@GetMapping("/bill_report")
	public String showBillReport(@RequestParam String cid, Model modelMap) {
		System.out.println("in show bill report");
		try {
			int id = Integer.parseInt(cid);
			User c = userService.getConsumer(id);
			if (c == null) {
				modelMap.addAttribute("message", "Invalid Consumer Id ,Please retry");
				// Forward the admin to search form : with highlighted errors
				return "/sub_admin/search_bill_report";
			} else {
				modelMap.addAttribute("bill_report", billService.billReport(id));
				// forword admin to bill_report With all Payment details : Status : NOT_PAID
				return "/sub_admin/bill_report";
			}
		}catch(RuntimeException e){
			System.out.println("err in controller " + e);
			modelMap.addAttribute("message", "Invalid Consumer Id ,Please retry");
			// Forward the user to login form : highlighted with errors
			return "/sub_admin/search_bill_report";
		}	
			
	}

	// add a req handling method to show or display Payment report
	@GetMapping("/payment_report")
	public String showPaymentReport(@RequestParam String cid, Model modelMap) {
		System.out.println("in show bill report");
		try {
			int id = Integer.parseInt(cid);
			User c = userService.getConsumer(id);
			if (c == null) {
				modelMap.addAttribute("message", "Invalid Consumer Id ,Please retry");
				// Forward the admin to search form : with highlighted errors
				return "/sub_admin/search_payment_report";
			} else {
				modelMap.addAttribute("payment_report", paymentService.paymentReport(id));
				// forword admin to payment_report : With all Payment details
				return "/sub_admin/payment_report";
			}
		}catch(RuntimeException e){
			System.out.println("err in controller " + e);
			modelMap.addAttribute("message", "Invalid Consumer Id ,Please retry");
			// Forward the user to login form : highlighted with errors
			return "/sub_admin/search_payment_report";
		}
	}
	
}
