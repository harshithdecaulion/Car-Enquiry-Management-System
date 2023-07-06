package com.mvcpoc.dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.mvcpoc.dto.UserDTO;

public class UserDao {

	private static String ROLE = "user";
	private JdbcTemplate template;

	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int registerUser(UserDTO u) {
		String sql = "INSERT INTO user (userName,email,password,role) VALUES ('" + u.getUserName() + "','"
				+ u.getEmail() + "','" + u.getPassword() + "','" + ROLE + "')";
		return template.update(sql);
	}

	public UserDTO getUserByEmailAndPassword(UserDTO u) {
		String sql = "SELECT * FROM user WHERE email=? AND password=?";
		return template.queryForObject(sql, new Object[] { u.getEmail(), u.getPassword() },
				BeanPropertyRowMapper.newInstance(UserDTO.class));
	}
}
