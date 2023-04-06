package com.codingdojo.burgertracker1.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.burgertracker1.models.Burger;
import com.codingdojo.burgertracker1.services.BurgerService;

@Controller
public class BurgersController {
	@Autowired BurgerService burgerService;
	
//	Create route in controller to render index.jsp
	
	@GetMapping("/")
	
//	Add @ModelAttribute annotation and associated syntax to render route, to bind an empty Burger object to JSP form to capture user input
	
	public String index(
			Model model,
			@ModelAttribute("burger") Burger burger) {
		
//		...retrieve all records from database...
		
		List<Burger> burgers = burgerService.allBurgers();
		
//		...and render them on the page...
		
		model.addAttribute("burgers", burgers);
		return "index.jsp";
	}
	
//	Add POST route to process form and add new burger to database...
	
	@PostMapping("/")
	public String create(
			
//			...using @ModelAttribute annotation to receive filled Burger object
			
//			...handle validations
			
		@Valid @ModelAttribute("burger") Burger burger,
		BindingResult result) {
		if (result.hasErrors()) {
			return "index.jsp";
		} else {
			burgerService.createBurger(burger);
			
//			POST route redirects to render route after creating new burger
			
			return "redirect:/";
		}
	}
	
}
