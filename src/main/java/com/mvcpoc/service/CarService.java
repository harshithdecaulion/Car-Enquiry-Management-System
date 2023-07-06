package com.mvcpoc.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import com.mvcpoc.dto.CarDTO;
import com.mvcpoc.dto.OrderDTO;

public interface CarService {

	String showEnquiryForm(Model m);

	String addCar(CarDTO car, BindingResult result, HttpSession session);

	String viewEnquiriesForCustomer(Model model, HttpSession session);

	String enquiryEdit(int id, Model m);

	String saveEdit(CarDTO emp, int id);

	String deleteEnquiry(int id);

	String placingOrder(int id, Model model);

	String confirmOrder(OrderDTO order);

	String viewQuotations(int userId, Model model);

	String viewCustomerOrders(Model model, HttpSession session);

}