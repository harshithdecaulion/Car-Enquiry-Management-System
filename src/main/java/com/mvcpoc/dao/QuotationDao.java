package com.mvcpoc.dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.mvcpoc.dto.QuotationDTO;

//import com.mvcpoc.beans.Order;
//import com.mvcpoc.beans.Quotation;

public class QuotationDao {
	private JdbcTemplate template;

	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int insertIntoQuotation(QuotationDTO quo) {
		String sql = "INSERT INTO quotation (id, bill) VALUES ('" + quo.getId() + "','" + quo.getBill()+ "')";
		return template.update(sql);
	}
	
	public double getBillByQuotationId(int id) {
		String sql="SELECT bill FROM quotation where id=?";
		return template.queryForObject(sql, new Object[] { id},Double.class);
	}

	public QuotationDTO getQuotationByOrderId(int id) {
	    String sql = "SELECT * FROM quotation WHERE id = ?";
	    return template.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<>(QuotationDTO.class));
	}

}
