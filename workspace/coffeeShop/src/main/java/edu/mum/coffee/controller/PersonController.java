package edu.mum.coffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.mum.coffee.domain.Person;
import edu.mum.coffee.service.PersonService;

@Controller
public class PersonController {
	
	@Autowired 
	PersonService personService;
	
	@GetMapping(value="/getAllPersons")
	public String getAllPersons(Model model){
		List<Person> persons = personService.findAllPersons();
		model.addAttribute("persons", persons);
		return "allPersons";
	}
	
	@GetMapping(value="/addPerson")
	public String addPerson(Model model){
		Person person = new Person();
		model.addAttribute("person", person);
		return "addPerson";
	}
	
	@PostMapping(value="/addPerson")
	public String addPerson(@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName, @RequestParam("email") String email, @RequestParam("phone") String phone, @RequestParam("enabled") String enabled, Model model){
		
		Person p = new Person();
		p.setFirstName(firstName);
		p.setLastName(lastName);
		p.setEmail(email);
		p.setEnable(Boolean.parseBoolean(enabled));
		p.setPhone(phone);
		
		personService.savePerson(p);
		List<Person> persons = personService.findAllPersons();
		model.addAttribute("persons", persons);
		return "redirect:/getAllPersons";
	}
	
	@RequestMapping(value="/updatePerson", method=RequestMethod.PUT)
	public String updatePerson(@RequestBody Person person){
		personService.update(person);
		return "persons";
	}
	

	@GetMapping(value="/editPerson/{id}")
	public String editPerson(@PathVariable String id, Model model){
		Person person = personService.findById(Long.parseLong(id));
		model.addAttribute("person", person);
		return "editPerson";
	}
	
	@PostMapping(value="/editPerson")
	public String updatePerson(@RequestParam("id") String id,@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName, @RequestParam("email") String email, @RequestParam("phone") String phone, @RequestParam("enable") String enable, Model model){
		
		List<Person> persons = personService.findAllPersons();
		for(Person person : persons){
			if(person.getId()==Integer.parseInt(id)){
				person.setFirstName(firstName);
				person.setLastName(lastName);
				person.setEmail(email);
				person.setPhone(phone);
				person.setEnable(Boolean.parseBoolean(enable));
				personService.update(person);
			}
		}
		model.addAttribute("persons", persons);
		return "redirect:/getAllPersons";
	}


}
