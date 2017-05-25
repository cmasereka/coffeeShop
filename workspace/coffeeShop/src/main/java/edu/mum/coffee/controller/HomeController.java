package edu.mum.coffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.domain.ProductType;
import edu.mum.coffee.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	ProductService productService;
	
	@GetMapping({"/", "/index", "/home"})
	public String homePage() {
		return "home";
	}
	
	@GetMapping({"/products"})
	public String visitorsPage(Model model) {
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		return "products";
	}
	
	@GetMapping({"/secure"})
	public String securePage(Model model) {
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		return "secure";
	}
	
	@GetMapping({"/visitor"})
	public String visitorPage(Model model) {
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		return "visitor";
	}
	
	public void addProducts(){
		Product p1 = new Product("Mangoes", "Raw and Ripe Mangoes", 60.4, ProductType.BREAKFAST);
		Product p2 = new Product("Bugger", "Good and nutritious", 30.4, ProductType.LUNCH);
		
		productService.save(p1);
		productService.save(p2);
	}
}
