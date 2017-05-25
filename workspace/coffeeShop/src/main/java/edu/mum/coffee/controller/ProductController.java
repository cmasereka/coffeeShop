package edu.mum.coffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.domain.ProductType;
import edu.mum.coffee.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired 
	ProductService productService;
	
	@GetMapping(value="/addProduct")
	public String addProduct(Model model){
		Product product = new Product();
		model.addAttribute("product", product);
		return "addProduct";
	}

	@PostMapping(value="/addProduct")
	public String addProduct(@RequestParam("productName") String productName, @RequestParam("description") String description, @RequestParam("price") String price, @RequestParam("productType") String p, Model model){
		ProductType pt = p.equals("BREAKFAST")? ProductType.BREAKFAST : p.equals("LUNCH") ? ProductType.LUNCH :ProductType.DINNER;
		Product product = new Product(productName, description, Double.parseDouble(price), pt);
		productService.save(product);
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		return "secure";
	}
	
	@GetMapping(value="/all_products")
	public String getAllProducts(Model model){
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		model.addAttribute("test", "Test Text");
		return "all_products";
	}
	
	@DeleteMapping(value="/deleteProduct")
	public String deleteProduct(@RequestBody Product product){
		productService.delete(product);
		return "products";
	}
	
	@RequestMapping(value="/updateProduct", method=RequestMethod.PUT)
	public String updateProduct(@RequestBody Product product){
		productService.delete(product);
		return "products";
	}
	
	@GetMapping(value="/editProduct/{id}")
	public String editProduct(@PathVariable String id, Model model){
		Product product = productService.getProduct(Integer.parseInt(id));
		model.addAttribute("product", product);
		return "editProduct";
	}
	
	@PostMapping(value="/editProduct")
	public String updateProduct(@RequestParam("id") String id,@RequestParam("productName") String productName, @RequestParam("description") String description, @RequestParam("price") String price, @RequestParam("productType") String p, Model model){
		ProductType pt = p.equals("BREAKFAST")? ProductType.BREAKFAST : p.equals("LUNCH") ? ProductType.LUNCH :ProductType.DINNER;
		
		List<Product> products = productService.getAllProducts();
		for(Product product : products){
			if(product.getId()==Integer.parseInt(id)){
				product.setProductName(productName);
				product.setDescription(description);
				product.setPrice(Double.parseDouble(price));
				product.setProductType(pt);
				productService.update(product);
			}
		}
		model.addAttribute("products", products);
		return "redirect:/secure";
	}
	
	@GetMapping(value="/deleteProduct/{id}")
	public String deleteProduct(@PathVariable String id, Model model){
		Product product = productService.getProduct(Integer.parseInt(id));
		model.addAttribute("product", product);
		return "deleteProduct";
	}
	
	@PostMapping(value="/deleteProduct")
	public String deleteProductDetails(@RequestParam("id") String id, Model model){
		List<Product> products = productService.getAllProducts();
		for(Product product : products){
			if(product.getId()==Integer.parseInt(id)){
				productService.delete(product);
				products.remove(product);
			}
		}
		model.addAttribute("products", products);
		return "redirect:/secure";
	}

}
