package com.mvcpoc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;


import com.mvcpoc.dto.OrderDTO;


public class OrderDao {

	private JdbcTemplate template;

	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int insert(OrderDTO ord) {
		String sql = "INSERT INTO orders (id, status, createdDate) VALUES ('" + ord.getId() + "','" + ord.getStatus()
				+ "','" + ord.getCreatedDate() + "')";
		return template.update(sql);
	}



	public List<OrderDTO> getConfirmedOrders() {
	     return template.query("SELECT orderId, id, status, createdDate FROM orders WHERE status = 'confirm'", new RowMapper<OrderDTO>(){
	    	 public OrderDTO mapRow(ResultSet rs, int row) throws SQLException {
					OrderDTO o = new OrderDTO();
					o.setOrderId(rs.getInt("orderId"));
					o.setId(rs.getInt("id"));
					o.setStatus(rs.getString("status"));
					o.setCreatedDate(rs.getString("createdDate"));
					return o;
				}
			});
		}



	








}