package com.mvcpoc.service;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvcpoc.dao.CarDao;
import com.mvcpoc.dao.EnquiryManagerDao;
import com.mvcpoc.dao.OrderDao;
import com.mvcpoc.dao.QuotationDao;
import com.mvcpoc.dto.CarDTO;
import com.mvcpoc.dto.OrderDTO;
import com.mvcpoc.dto.QuotationDTO;

@Service
public class EnquiryManagerServiceImpl implements EnquiryManagerService {

	@Autowired
	EnquiryManagerDao enquiryManagerDao;

	@Autowired
	OrderDao orderDao;

	@Autowired
	CarDao carDao;

	@Autowired
	QuotationDao quotationDao;

	@Override
	public String viewQuotations(Model m) {
		List<CarDTO> list = enquiryManagerDao.getCars();
		m.addAttribute("list", list);
		return "sendQuotation";
	}

	@Override
	public String viewOrders(Model m) {
		List<OrderDTO> list = enquiryManagerDao.getAllOrders();
		m.addAttribute("list", list);
		return "orders";
	}

	@Override
	public String viewOrdersDesc(Model m) {
		List<OrderDTO> list = enquiryManagerDao.getAllOrdersDesc();
		m.addAttribute("list", list);
		return "ordersDesc";
	}

	@Override
	public String viewConfirmedOrders(Model model) {
		List<OrderDTO> list = enquiryManagerDao.getAllOrders();
		List<OrderDTO> confirmedOrders = list.stream().filter(order -> order.getStatus().equalsIgnoreCase("confirm"))
				.collect(Collectors.toList());
		model.addAttribute("list", confirmedOrders);
		return "confirmedOrders";
	}

	@Override
	public String viewCancelledOrders(Model model) {
		List<OrderDTO> list = enquiryManagerDao.getAllOrders();
		List<OrderDTO> cancelledOrders = list.stream().filter(order -> order.getStatus().equalsIgnoreCase("cancel"))
				.collect(Collectors.toList());
		model.addAttribute("list", cancelledOrders);
		return "cancelledOrders";
	}

	@Override
	public String sendingQuotation(int id, Model model) {
		CarDTO myCar = carDao.getCarById(id);
		QuotationDTO quo = new QuotationDTO();
		model.addAttribute("car", myCar);
		model.addAttribute("command", quo);
		return "sendQuoteToCust";
	}

	@Override
	public String sendQuote(QuotationDTO quo) {

		quotationDao.insertIntoQuotation(quo);
		int carId = quo.getId();
		CarDTO car = carDao.getCarById(carId);
		QuotationDTO quotation = carDao.getQuotationByCarId(carId);
		if (car != null && quotation != null) {
			String recipientEmail = carDao.getCarEmailByCarId(carId);
			String subject = "Quotation";
			String body = "Dear Customer,\n\nHere is your quotation: " + quotation.getBill();

			carDao.sendEmail(recipientEmail, subject, body);
		}

		return "redirect:/sendQuotation";

	}

	@Override
	public String showConfirmedOrderWithQuotations(Model model) {
		try {
			List<Map<String, Object>> confirmedOrderQuotations = enquiryManagerDao.getConfirmedOrderQuotations();
			model.addAttribute("confirmedOrderQuotations", confirmedOrderQuotations);
			return "successfulOrders";
		} catch (Exception e) {
			model.addAttribute("errorMessage", "An error occurred ");
			return "error";
		}
	}

	@Override
	public String viewTotalRevenue(Model model) {
		Double totalRevenue = enquiryManagerDao.getTotalRevenue();
		model.addAttribute("totalRevenue", totalRevenue);
		return "revenueGeneration";
	}

	@Override
	public String generateRevenueByCarModel(String carName, Model model) {
		if (!enquiryManagerDao.doesSearchedCarExist(carName)) {
			model.addAttribute("errorMessage", "Car name not found: " + carName);
			return "error";
		}

		try {
			Double totalRevenue = enquiryManagerDao.generateRevenueByCarName(carName);
			model.addAttribute("carName", carName);
			model.addAttribute("totalRevenue", totalRevenue);
			return "revenuePage";
		} catch (Exception e) {
			model.addAttribute("errorMessage", "An error occurred: " + e.getMessage());
			return "error";
		}
	}

	@Override
	public String showAnnualRevenueByCar(String carName, Model model) {
		if (!enquiryManagerDao.doesSearchedCarExist(carName)) {
			model.addAttribute("errorMessage", "Car name not found: " + carName);
			return "error";
		}
		try {
			List<Map<String, Object>> annualRevenueListByCar = enquiryManagerDao.getAnnualRevenueByCar(carName);
			model.addAttribute("annualRevenueListByCar", annualRevenueListByCar);
			model.addAttribute("carName", carName);
			return "annualRevenueByCar";
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Invalid car name: " + carName);
			return "error";
		}
	}

	@Override
	public String showMonthlyBillAmountByCarName(Model model, String carName) {
		if (!enquiryManagerDao.doesSearchedCarExist(carName)) {
			model.addAttribute("errorMessage", "Car name not found: " + carName);
			return "error";
		}
		try {
			List<Map<String, Object>> monthlyBillAmountByCarName = enquiryManagerDao
					.getTotalBillAmountMonthlyByCarName(carName);
			model.addAttribute("monthlyBillAmountByCarName", monthlyBillAmountByCarName);
			model.addAttribute("carName", carName);
			return "monthlyRevenueByCar";
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Invalid car name: " + carName);
			return "error";
		}
	}

	@Override
	public String showTotalBillAmountQuarterlyByCar(String carName, Model model) {
		if (!enquiryManagerDao.doesSearchedCarExist(carName)) {
			model.addAttribute("errorMessage", "Car name not found: " + carName);
			return "error";
		}
		try {
			List<Map<String, Object>> totalBillAmountQuarterlyByCar = enquiryManagerDao
					.getTotalBillAmountQuarterlyByCarName(carName);
			model.addAttribute("totalBillAmountQuarterlyByCar", totalBillAmountQuarterlyByCar);
			model.addAttribute("carName", carName);
			return "quarterlyRevenueByCar";
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Invalid car name: " + carName);
			return "error";
		}
	}

	@Override
	public String showMonthlyBillAmount(Model model) {
		List<Map<String, Object>> monthlyBillAmount = enquiryManagerDao.getTotalBillAmountMonthly();
		model.addAttribute("monthlyBillAmount", monthlyBillAmount);
		return "monthlyRevenue";
	}

	@Override
	public String showTotalBillAmountQuarterly(Model model) {
		List<Map<String, Object>> totalBillAmountQuarterly = enquiryManagerDao.getTotalBillAmountQuarterly();
		model.addAttribute("totalBillAmountQuarterly", totalBillAmountQuarterly);
		return "quarterlyRevenue";
	}

	@Override
	public String showTotalBillAmountYearly(Model model) {
		List<Map<String, Object>> totalBillAmountYearly = enquiryManagerDao.getTotalBillAmountYearly();
		model.addAttribute("totalBillAmountYearly", totalBillAmountYearly);
		return "annualRevenue";
	}

	@Override
	public String search(@RequestParam(value = "searchOption", required = false) String searchOption,
			@RequestParam(value = "searchCriteria", required = false) String searchCriteria, Model model)   {
		try {
			if (searchOption != null && searchCriteria != null) {
				if (searchOption.equals("id")) {
					try {
						int id = Integer.parseInt(searchCriteria);
						CarDTO car = carDao.getCarById(id);
						model.addAttribute("car", car);
						return "carSearchPage";
					} catch (NumberFormatException e) {
						model.addAttribute("error", "Invalid ID format");
						return "error";
					}
					
				} else if (searchOption.equals("name")) {
					List<CarDTO> cars = carDao.getCarByName(searchCriteria);
					model.addAttribute("cars", cars);
					return "carSearchByName";
				}
				
			}
			model.addAttribute("error", "Invalid search option");
			return "error";
		} catch (Exception e) {
			return "error";
		}
	
	}

	@Override
	public String getConfirmedOrderQuotationsDatesAscending(Model model)   {
		List<Map<String, Object>> orderQuotations = enquiryManagerDao.getConfirmedOrderQuotations();

		List<Map<String, Object>> sortedList = orderQuotations.stream()
				.sorted(Comparator.comparing(m -> m.get("createdDate").toString())).collect(Collectors.toList());

		model.addAttribute("list", sortedList);
		return "successfullordersDatesAsc";
	}

	@Override
	public String getConfirmedOrderQuotationsDatesDescending(Model model) {
		List<Map<String, Object>> orderQuotations = enquiryManagerDao.getConfirmedOrderQuotations();

		List<Map<String, Object>> sortedList = orderQuotations.stream()
				.sorted(Comparator.comparing(m -> m.get("createdDate").toString(), Comparator.reverseOrder()))
				.collect(Collectors.toList());

		model.addAttribute("list", sortedList);
		return "successfullordersDatesDesc";
	}

}
