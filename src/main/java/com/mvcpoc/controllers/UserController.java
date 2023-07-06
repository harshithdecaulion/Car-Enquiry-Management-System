package com.mvcpoc.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//import com.mvcpoc.beans.User;
import com.mvcpoc.dao.UserDao;
import com.mvcpoc.dto.UserDTO;
import com.mvcpoc.service.UserService;

@Controller
public class UserController {



	@Autowired
	UserService userService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}

	@RequestMapping(value = "/customerHome")
	public String customerHome() {
		return "customerHome";
	}

	@RequestMapping(value = "/enquiryManagerHome")
	public String emHome() {
		return "enquiryManagerHome";
	}

	@RequestMapping("/openRegister")
	public String openRegisterForm(Model m) {
		return userService.openRegisterForm(m);
	}

	@RequestMapping("/register")
	public String registerUser(@ModelAttribute("u") UserDTO u, Model model) {

		return userService.registerUser(u, model);
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin() {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") UserDTO user, BindingResult result, ModelMap model, HttpSession session) {
		return userService.processLogin(user, model, session);
	}

}
