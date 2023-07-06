package com.mvcpoc.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.mvcpoc.dto.QuotationDTO;

//import com.mvcpoc.beans.Order;
//import com.mvcpoc.beans.Quotation;

public interface EnquiryManagerService {

	String viewQuotations(Model m);

	String viewOrders(Model m);

	String viewConfirmedOrders(Model m);

	String sendingQuotation(int id, Model model);

	String sendQuote(QuotationDTO quo);

	String showConfirmedOrderWithQuotations(Model model);

	String showMonthlyBillAmount(Model model);

	String showTotalBillAmountQuarterly(Model model);

	String showTotalBillAmountYearly(Model model);

	String search(String searchOption, String searchCriteria, Model model);

	String viewOrdersDesc(Model m);

	String viewTotalRevenue(Model model);

	String generateRevenueByCarModel(String carName, Model model);

	String showTotalBillAmountQuarterlyByCar(String carName, Model model);

	String showAnnualRevenueByCar(String carName, Model model);

	String showMonthlyBillAmountByCarName(Model model, String carName);

	String getConfirmedOrderQuotationsDatesAscending(Model model);

	String getConfirmedOrderQuotationsDatesDescending(Model model);

	String viewCancelledOrders(Model model);
}