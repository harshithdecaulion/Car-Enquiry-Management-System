package com.mvcpoc.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

//import com.mvcpoc.beans.User;
import com.mvcpoc.dto.UserDTO;

public interface UserService {

	String registerUser(UserDTO u, Model model);

	String openRegisterForm(Model m);

	String processLogin(UserDTO user, ModelMap model, HttpSession session);

}