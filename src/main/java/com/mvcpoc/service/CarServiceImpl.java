package com.mvcpoc.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

//import com.mvcpoc.beans.Car;
//import com.mvcpoc.beans.Order;
import com.mvcpoc.dao.CarDao;
import com.mvcpoc.dao.OrderDao;
import com.mvcpoc.dao.QuotationDao;
import com.mvcpoc.dto.CarDTO;
import com.mvcpoc.dto.OrderDTO;
import com.mvcpoc.dto.QuotationDTO;

@Service
public class CarServiceImpl implements CarService {

	@Autowired
	CarDao carDao;

	@Autowired
	OrderDao orderDao;

	@Autowired
	QuotationDao quotationDao;

	@Override
	public String showEnquiryForm(Model m) {
		m.addAttribute("command", new CarDTO());
		return "viewform";
	}

	@Override
	public String addCar(CarDTO car, BindingResult result, HttpSession session) {
		int userId = (int) session.getAttribute("userId");
		car.setUserId(userId);
		carDao.addCar(car);
		return "redirect:/viewEnqCust";
	}

	@Override
	public String viewEnquiriesForCustomer(Model model, HttpSession session) {
		int userId = (int) session.getAttribute("userId");
		List<CarDTO> enquiries = carDao.getEnquiriesByUserId(userId);
		model.addAttribute("enquiries", enquiries);
		return "viewEnqCust";
	}

	@Override
	public String enquiryEdit(int id, Model m) {
		CarDTO emp = carDao.getCarById(id);
		System.out.println(emp);
		m.addAttribute("command", emp);
		m.addAttribute("id", id);
		return "careditform";
	}

	@Override
	public String saveEdit(CarDTO emp, int id) {
		carDao.update(emp, id);
		return "redirect:/viewEnqCust";
	}

	@Override
	public String deleteEnquiry(int id) {
		carDao.delete(id);
		return "redirect:/viewEnqCust";
	}

	@Override
	public String placingOrder(int id, Model model) {
		CarDTO myCar = carDao.getCarById(id);
		OrderDTO order = new OrderDTO();
		model.addAttribute("car", myCar);
		model.addAttribute("command", order);
		return "placeOrder";
	}

	@Override
	public String confirmOrder(OrderDTO order) {
	    QuotationDTO quotation = null;
	    try {
	        quotation = quotationDao.getQuotationByOrderId(order.getId());
	    } catch (EmptyResultDataAccessException ex) {
	        return "errorPageForEmptyQuoteOrder";
	    }

	    if (quotation != null && quotation.getBill() != 0) {
	        try {
	            orderDao.insert(order);
	        } catch (DataIntegrityViolationException ex) {
	            return "errorPageForDuplicateOrder";
	        }
	    }
	    return "redirect:/viewEnqCust";
	}
	
	

	@Override
	public String viewQuotations(int userId, Model model) {
		List<Map<String, Object>> quotations = carDao.getQuotationsByUserId(userId);
		model.addAttribute("quotations", quotations);
		return "carQuotations";
	}

	@Override
	public String viewCustomerOrders(Model model, HttpSession session) {
		int userId = (int) session.getAttribute("userId");
		List<Map<String, Object>> confirmedOrders = carDao.getConfirmedOrderQuotationsByUser(userId);
		model.addAttribute("confirmedOrders", confirmedOrders);
		return "customerOrders";
	}

}
