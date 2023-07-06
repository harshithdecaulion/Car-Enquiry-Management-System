package com.mvcpoc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.mvcpoc.dto.CarDTO;
import com.mvcpoc.dto.OrderDTO;



public class EnquiryManagerDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public List<CarDTO> getCars() {
		return template.query("select * from car ORDER BY id DESC", new RowMapper<CarDTO>() {
			public CarDTO mapRow(ResultSet rs, int row) throws SQLException {
				CarDTO c = new CarDTO();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setEmailId(rs.getString("emailId"));
				c.setCity(rs.getString("city"));
				return c;
			}
		});
	}

	public List<OrderDTO> getAllOrders() {
		return template.query("select * from orders ORDER BY orderId DESC", new RowMapper<OrderDTO>() {
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
	

	public List<Map<String, Object>> getAllOrdersWithCarName() {
		String sql = "SELECT o.orderId, o.id, o.status, o.createdDate, c.name " + "FROM orders o "
				+ "JOIN car c ON o.carId = c.id";
		return template.queryForList(sql);
	}

	public List<OrderDTO> getAllOrdersDesc() {
		return template.query("SELECT * FROM orders ORDER BY STR_TO_DATE(createdDate, '%Y-%m-%d') DESC",
				new RowMapper<OrderDTO>() {
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

	// all the confirmed orders
	public List<Map<String, Object>> getConfirmedOrderQuotations() {
		String sql = "SELECT o.id, o.orderId, o.status, o.createdDate, q.bill " + "FROM `orders` o "
				+ "JOIN quotation q ON o.id = q.id " + "WHERE o.status = 'confirm'";

		return template.queryForList(sql);
	}


	
	
	// monthly
	public List<Map<String, Object>> getTotalBillAmountMonthly() {
		String sql = "SELECT MONTH(STR_TO_DATE(o.createdDate, '%Y-%m-%d')) AS month, "
				+ "YEAR(STR_TO_DATE(o.createdDate, '%Y-%m-%d')) AS year, " + "SUM(q.bill) AS totalBillAmount "
				+ "FROM orders o " + "JOIN quotation q ON o.id = q.id " + "WHERE o.status = 'confirm' "
				+ "GROUP BY MONTH(STR_TO_DATE(o.createdDate, '%Y-%m-%d')), YEAR(STR_TO_DATE(o.createdDate, '%Y-%m-%d'))";

		return template.queryForList(sql);
	}

	// quaterly
	public List<Map<String, Object>> getTotalBillAmountQuarterly() {
		String sql = "SELECT YEAR(STR_TO_DATE(o.createdDate, '%Y-%m-%d')) AS year, "
				+ "QUARTER(STR_TO_DATE(o.createdDate, '%Y-%m-%d')) AS quarter, " + "SUM(q.bill) AS totalBillAmount "
				+ "FROM orders o " + "JOIN quotation q ON o.id = q.id " + "WHERE o.status = 'confirm' "
				+ "GROUP BY YEAR(STR_TO_DATE(o.createdDate, '%Y-%m-%d')), "
				+ "QUARTER(STR_TO_DATE(o.createdDate, '%Y-%m-%d'))";

		return template.queryForList(sql);
	}

	// annually
	public List<Map<String, Object>> getTotalBillAmountYearly() {
		String sql = "SELECT YEAR(STR_TO_DATE(o.createdDate, '%Y-%m-%d')) AS Year, SUM(q.bill) AS TotalBillAmount "
				+ "FROM orders o " + "JOIN quotation q ON o.id = q.id " + "WHERE o.status = 'confirm' "
				+ "GROUP BY YEAR(STR_TO_DATE(o.createdDate, '%Y-%m-%d'))";

		return template.queryForList(sql);
	}

	// .........................................//
	public List<Map<String, Object>> getTotalBillAmountQuarterlyByCarName(String carName) {
		String sql = "SELECT YEAR(STR_TO_DATE(o.createdDate, '%Y-%m-%d')) AS year, "
				+ "QUARTER(STR_TO_DATE(o.createdDate, '%Y-%m-%d')) AS quarter, " + "SUM(q.bill) AS totalRevenue "
				+ "FROM orders o " + "JOIN quotation q ON o.id = q.id " + "JOIN car c ON o.id = c.id "
				+ "WHERE o.status = 'confirm' AND c.name = ? "
				+ "GROUP BY YEAR(STR_TO_DATE(o.createdDate, '%Y-%m-%d')), "
				+ "QUARTER(STR_TO_DATE(o.createdDate, '%Y-%m-%d'))";

		return template.queryForList(sql, carName);
	}

	public List<Map<String, Object>> getAnnualRevenueByCar(String carName) {
		String sql = "SELECT YEAR(STR_TO_DATE(o.createdDate, '%Y-%m-%d')) AS Year, SUM(q.bill) AS Revenue "
				+ "FROM orders o " + "JOIN quotation q ON o.id = q.id " + "JOIN car c ON o.id = c.id "
				+ "WHERE o.status = 'confirm' AND c.name = ? "
				+ "GROUP BY YEAR(STR_TO_DATE(o.createdDate, '%Y-%m-%d'))";

		return template.queryForList(sql, carName);
	}

	public List<Map<String, Object>> getTotalBillAmountMonthlyByCarName(String carName) {
		String sql = "SELECT MONTH(STR_TO_DATE(o.createdDate, '%Y-%m-%d')) AS month, "
				+ "YEAR(STR_TO_DATE(o.createdDate, '%Y-%m-%d')) AS year, " + "SUM(q.bill) AS totalBillAmount "
				+ "FROM orders o " + "JOIN quotation q ON o.id = q.id " + "JOIN car c ON o.id = c.id "
				+ "WHERE o.status = 'confirm' AND c.name = ? "
				+ "GROUP BY MONTH(STR_TO_DATE(o.createdDate, '%Y-%m-%d')), YEAR(STR_TO_DATE(o.createdDate, '%Y-%m-%d'))";

		return template.queryForList(sql, carName);
	}

	public List<CarDTO> getCarsLatest() {
		String sql = "SELECT * FROM car ORDER BY id ASC"; // Assuming 'id' represents the order of creation

		return template.query(sql, new RowMapper<CarDTO>() {
			public CarDTO mapRow(ResultSet rs, int row) throws SQLException {
				CarDTO c = new CarDTO();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setEmailId(rs.getString("mail"));
				c.setCity(rs.getString("city"));
				return c;
			}
		});
	}

	public Double getTotalRevenue() {
		String sql = "SELECT SUM(q.bill) AS TotalRevenue " + "FROM orders o " + "JOIN quotation q ON o.id = q.id "
				+ "WHERE o.status = 'confirm'";

		return template.queryForObject(sql, Double.class);
	}

	public Double generateRevenueByCarName(String carName) {
		String sql = "SELECT SUM(q.bill) AS TotalRevenue " + "FROM orders o " + "JOIN quotation q ON o.id = q.id "
				+ "JOIN car c ON o.id = c.id " + "WHERE o.status = 'confirm' AND c.name = ?";

		return template.queryForObject(sql, new Object[] { carName }, Double.class);
	}
	
	public List<Map<String, Object>> getConfirmedOrderQuotationsAscendingOrderDates() {
	    String sql = "SELECT o.id, o.orderId, o.status, o.createdDate, q.bill "
	            + "FROM `orders` o "
	            + "JOIN quotation q ON o.id = q.id "
	            + "WHERE o.status = 'confirm' "
	            + "ORDER BY STR_TO_DATE(o.createdDate, '%Y-%m-%d') ASC";

	    return template.queryForList(sql);
	}

	public List<Map<String, Object>> getConfirmedOrderQuotationsDescendingOrderDates() {
	    String sql = "SELECT o.id, o.orderId, o.status, o.createdDate, q.bill "
	            + "FROM `orders` o "
	            + "JOIN quotation q ON o.id = q.id "
	            + "WHERE o.status = 'confirm' "
	            + "ORDER BY STR_TO_DATE(o.createdDate, '%Y-%m-%d') DESC";

	    return template.queryForList(sql);
	}

	public boolean doesSearchedCarExist(String carName) {
	    String query = "SELECT COUNT(*) FROM car WHERE name = ?";
	    int count = template.queryForObject(query, Integer.class, carName);
	    return count > 0;
	}


	
}
