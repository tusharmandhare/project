package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageController {
	public HomePageController() {
		System.out.println("in ctor of "+getClass().getName());
	}
	//add a req handling method to provide a home page(index)
	@RequestMapping("/")
	public String provideHomePage() {
		System.out.println("in provide home page ");
		return "/index";
		}
}
