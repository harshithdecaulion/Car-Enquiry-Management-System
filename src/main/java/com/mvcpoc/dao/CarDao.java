package com.mvcpoc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.SimpleMailMessage;

import com.mvcpoc.dto.QuotationDTO;
import com.mvcpoc.dto.CarDTO;

public class CarDao {
	JdbcTemplate template;

	@Autowired
	private JavaMailSender mailSender;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public int addCar(CarDTO p) {
		String sql = "insert into car(name,city,emailId,userId) values('" + p.getName() + "','" + p.getCity() + "','"
				+ p.getEmailId() + "','" + p.getUserId() + "')";
		return template.update(sql);
	}

	public int update(CarDTO p, int id) {
		String sql = "update car set name='" + p.getName() + "' where id='" + id + "'";
		return template.update(sql);
	}

	public int delete(int id) {
		String sql = "UPDATE car SET is_deleted = 1 WHERE id = " + id;
		return template.update(sql);
	}

	public CarDTO getCarById(int id) {
		String sql = "select * from car where id=?";
		return template.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<CarDTO>(CarDTO.class));
	}
	
	public List<CarDTO> getCarByName(String name) {
	    String sql = "SELECT * FROM car WHERE name = ?";
	    Object[] params = {name};

	    return template.query(sql, params, new RowMapper<CarDTO>() {
	        public CarDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
	            CarDTO car = new CarDTO();
	            car.setId(rs.getInt("id"));
	            car.setName(rs.getString("name"));
	            car.setCity(rs.getString("city"));
	            car.setEmailId(rs.getString("emailId"));
	            return car;
	        }
	    });
	}


	
	public List<CarDTO> getEnquiriesByUserId(int userId) {
		String sql = "SELECT * FROM car WHERE userId = ? AND is_deleted =false";
		return template.query(sql, new Object[] { userId }, new RowMapper<CarDTO>() { // annonymous inner class
			@Override
			public CarDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				CarDTO car = new CarDTO();
				car.setId(rs.getInt("id"));
				car.setName(rs.getString("name"));
				car.setEmailId(rs.getString("emailId"));
				return car;
			}
		});
	}

	public List<CarDTO> getCars() {
		return template.query("select * from car", new RowMapper<CarDTO>() {
			public CarDTO mapRow(ResultSet rs, int row) throws SQLException {
				CarDTO c = new CarDTO();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setCity(rs.getString("city"));
				c.setEmailId(rs.getString("emailId"));
				return c;
			}
		});
	}

	public List<Map<String, Object>> getQuotationsByUserId(int userId) {

		String sql = "SELECT car.id, quotation.qid, car.name, quotation.bill " + "FROM car "
				+ "JOIN quotation ON car.id = quotation.id " + "WHERE car.userId = ? AND car.is_deleted = 0";

		return template.queryForList(sql, userId);
	}

	public void sendQuotationEmail(int id) {
		QuotationDTO quotation = getQuotationByCarId(id);
		if (quotation != null) {
			String recipientEmail = getCarEmailByCarId(id);
			String subject = "Quotation";
			String body = "Dear Customer,\n\nHere is your quotation: " + quotation.getBill();

			sendEmail(recipientEmail, subject, body);
		}
	}

	public QuotationDTO getQuotationByCarId(int id) {
		String sql = "SELECT * FROM quotation WHERE id = ?";
		List<QuotationDTO> quotations = template.query(sql, new Object[] { id }, new RowMapper<QuotationDTO>() {
			@Override
			public QuotationDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				QuotationDTO quotation = new QuotationDTO();
				quotation.setId(rs.getInt("id"));
				quotation.setBill(rs.getDouble("bill"));
				return quotation;
			}
		});

		if (quotations.isEmpty()) {
			return null; 
		} else {
			return quotations.get(0); 
		}
	}

	public String getCarEmailByCarId(int carId) {
		String sql = "SELECT emailId FROM car WHERE id = ?";
		return template.queryForObject(sql, new Object[] { carId }, String.class);
	}

	public void sendEmail(String recipientEmail, String subject, String body) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(recipientEmail);
		message.setSubject(subject);
		message.setText(body);

		mailSender.send(message);
	}

	// customer view orders
	public List<Map<String, Object>> getConfirmedOrderQuotationsByUser(int userId) {
		String sql = "SELECT o.id, o.orderId, o.status, o.createdDate, q.bill " + "FROM `orders` o "
				+ "JOIN quotation q ON o.id = q.id " + "JOIN car c ON o.id = c.id "
				+ "JOIN user u ON c.userId = u.userId " + "WHERE o.status IN ('confirm', 'cancel') AND u.userId = ?";

		return template.queryForList(sql, userId);
	}
}
