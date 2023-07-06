package com.mvcpoc.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//import com.mvcpoc.beans.Car;
//import com.mvcpoc.beans.Order;
//import com.mvcpoc.beans.User;
import com.mvcpoc.dao.CarDao;
import com.mvcpoc.dao.OrderDao;
import com.mvcpoc.dao.QuotationDao;
import com.mvcpoc.dao.UserDao;
import com.mvcpoc.dto.CarDTO;
import com.mvcpoc.dto.OrderDTO;
import com.mvcpoc.service.CarService;

@Controller
public class CarController {
	@Autowired
	CarDao dao;

	@Autowired
	OrderDao odao;

	@Autowired
	UserDao udao;

	@Autowired
	QuotationDao qdao;

	@Autowired
	CarService carService;

	private JdbcTemplate template;

	@RequestMapping("/viewform")
	public String showEnquiryForm(Model m) {
		return carService.showEnquiryForm(m);
	}



	@RequestMapping(value = "/addCar", method = RequestMethod.POST)
	public String addCar(@ModelAttribute("car") CarDTO car, BindingResult result, HttpSession session) {
		return carService.addCar(car, result, session);
	}

	@RequestMapping(value = "/viewEnqCust", method = RequestMethod.GET)
	public String viewEnquiriesForCustomer(Model model, HttpSession session) {
		return carService.viewEnquiriesForCustomer(model, session);
	}

	@RequestMapping(value = "/editcar/{id}")
	public String enquiryEdit(@PathVariable int id, Model m) {
		return carService.enquiryEdit(id, m);
	}

	@RequestMapping(value = "/editsave/{id}", method = RequestMethod.POST)
	public String saveEdit(@ModelAttribute("emp") CarDTO emp, @PathVariable int id) {
		return carService.saveEdit(emp, id);
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String deleteEnquiry(@PathVariable int id) {
		return carService.deleteEnquiry(id);
	}

	// retrieve a single row
	@RequestMapping("/carPlaceOrder/{id}")
	public String placingOrder(@PathVariable("id") int id, Model model) {
		return carService.placingOrder(id, model);
	}

	@PostMapping("/confirmOrder")
	public String confirmOrder(@ModelAttribute("ord") OrderDTO order) {
		return carService.confirmOrder(order);
	}

	@RequestMapping(value = "/carQuotations/{userId}", method = RequestMethod.GET)
	public String viewQuotations(@PathVariable("userId") int userId, Model model) {
		return carService.viewQuotations(userId, model);
	}

	// customer view orders

	@RequestMapping("/customerOrders")
	public String viewCustomerOrders(Model model, HttpSession session) {
		return carService.viewCustomerOrders(model, session);
	}

}
