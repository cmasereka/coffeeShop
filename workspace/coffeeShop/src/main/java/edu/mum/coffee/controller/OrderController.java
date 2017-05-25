package edu.mum.coffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.mum.coffee.domain.Order;
import edu.mum.coffee.service.OrderService;

@RestController
public class OrderController {
	
	@Autowired 
	OrderService orderService;
	
	@PostMapping(value="/addOrder")
	public String addOrder(@ModelAttribute Order order){
		orderService.save(order);
		return "order-created";
	}
	
	@GetMapping(value="/getAllOrders")
	public String getAllOrders(Model model){
		List<Order> orders = orderService.findAll();
		model.addAttribute("orders", orders);
		return "orders";
	}
	
	@RequestMapping(value="/updateOrder", method=RequestMethod.PUT)
	public String updateOrder(@RequestBody Order order){
		orderService.update(order);
		return "orders";
	}

}
