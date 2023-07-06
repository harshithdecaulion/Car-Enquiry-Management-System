package com.mvcpoc.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.mvcpoc.beans.Car;
//import com.mvcpoc.beans.Order;
//import com.mvcpoc.beans.Quotation;
import com.mvcpoc.dao.CarDao;
import com.mvcpoc.dao.EnquiryManagerDao;
import com.mvcpoc.dao.OrderDao;
import com.mvcpoc.dao.QuotationDao;
import com.mvcpoc.dto.QuotationDTO;
import com.mvcpoc.service.EnquiryManagerService;

@Controller
public class EnquiryManagerController {

	@Autowired
	EnquiryManagerService enquiryManagerService;

	@RequestMapping("/sendQuotation")
	public String viewQuotations(Model m) {
		return enquiryManagerService.viewQuotations(m);
	}
//	@GetMapping("/sendQuotation")
//	public String viewQuotations(Model model, @RequestParam(required = false) String search, @RequestParam(required = false) String order) {
//	    enquiryManagerService.viewQuotations(model, search, order);
//	    return "sendQuotation";
//	}

	@RequestMapping("/orders")
	public String viewOrders(Model m) {
		return enquiryManagerService.viewOrders(m);
	}

	@RequestMapping("/ordersDesc")
	public String viewOrdersDesc(Model model) {
		return enquiryManagerService.viewOrdersDesc(model);

	}

	@RequestMapping("/confirmedOrders")
	public String viewConfirmedOrders(Model m) {
		return enquiryManagerService.viewConfirmedOrders(m);
	}

	@RequestMapping("/sendQuoteToCustomer/{id}")
	public String sendingQuotation(@PathVariable("id") int id, Model model) {
		return enquiryManagerService.sendingQuotation(id, model);
	}

	@PostMapping("/sendQuote")
	public String sendQuote(@ModelAttribute("quo") QuotationDTO quo) {
		return enquiryManagerService.sendQuote(quo);
	}

	@GetMapping("/successfulOrders")
	public String showConfirmedOrderWithQuotations(Model model) {
		return enquiryManagerService.showConfirmedOrderWithQuotations(model);
	}

	@GetMapping("/monthlyRevenue")
	public String showMonthlyBillAmount(Model model) {
		return enquiryManagerService.showMonthlyBillAmount(model);
	}

	@GetMapping("/monthlyRevenueByCar")
	public String showMonthlyBillAmountByCarName(Model model, @RequestParam("carName") String carName) {
//	    List<Map<String, Object>> monthlyBillAmountByCarName = enquiryManagerDao.getTotalBillAmountMonthlyByCarName(carName);
//	    model.addAttribute("monthlyBillAmountByCarName", monthlyBillAmountByCarName);
//	    return "monthlyRevenue";
		return enquiryManagerService.showMonthlyBillAmountByCarName(model, carName);
	}

	@GetMapping("/revenueGeneration")
	public String viewTotalRevenue(Model model) {
//        Double totalRevenue = enquiryManagerService.getTotalRevenue();
//        model.addAttribute("totalRevenue", totalRevenue);
//        return "revenuePage";
		return enquiryManagerService.viewTotalRevenue(model);
	}

	@GetMapping("/revenueBasedOnName")
	public String generateRevenueByCarModel(@RequestParam("carName") String carName, Model model) {
//	        Double totalRevenue = enquiryManagerService.generateRevenueByCarModel(carName);
//	        model.addAttribute("carName", carName);
//	        model.addAttribute("totalRevenue", totalRevenue);
//	        return "revenuePage";
		return enquiryManagerService.generateRevenueByCarModel(carName, model);
	}

	@GetMapping("/quarterlyRevenue")
	public String showTotalBillAmountQuarterly(Model model) {
		return enquiryManagerService.showTotalBillAmountQuarterly(model);
	}

	@GetMapping("/quarterlyRevenueByCar")
	public String showTotalBillAmountQuarterlyByCar(@RequestParam("carName") String carName, Model model) {
		return enquiryManagerService.showTotalBillAmountQuarterlyByCar(carName, model);
	}

	@GetMapping("/annualRevenueByCar")
	public String showAnnualRevenueByCar(@RequestParam("carName") String carName, Model model) {
		return enquiryManagerService.showAnnualRevenueByCar(carName, model);
	}

	@GetMapping("/annualRevenue")
	public String showTotalBillAmountYearly(Model model) {
		return enquiryManagerService.showTotalBillAmountYearly(model);
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@RequestParam(value = "searchOption", required = false) String searchOption,
			@RequestParam(value = "searchCriteria", required = false) String searchCriteria, Model model) {
		return enquiryManagerService.search(searchOption, searchCriteria, model);

	}

	@GetMapping("/successfullordersDatesAsc")
	public String getConfirmedOrderQuotationsDatesAscending(Model model) {
		return enquiryManagerService.getConfirmedOrderQuotationsDatesAscending(model);
	}

	@GetMapping("/successfullordersDatesDesc")
	public String getConfirmedOrderQuotationsDatesDescending(Model model) {
		return enquiryManagerService.getConfirmedOrderQuotationsDatesDescending(model);
	}
	
	@GetMapping("/cancelledOrders")
	public String viewCancelledOrders(Model model) {
		return enquiryManagerService.viewCancelledOrders(model);
	}
}
