package com.mvcpoc.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import com.mvcpoc.dao.UserDao;
import com.mvcpoc.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Override
	public String registerUser(UserDTO u, Model model) {
		userDao.registerUser(u);
	    model.addAttribute("successMessage", "Registered successfully!");
		return "redirect:/";
	}

	@Override
	public String openRegisterForm(Model m) {
		m.addAttribute("command", new UserDTO());
		return "register";
	}

	@Override
		 public String processLogin(UserDTO user, ModelMap model, HttpSession session) {
		        try {
		            String email = user.getEmail();
		            String password = user.getPassword();
		            UserDTO loggedInCustomer = userDao.getUserByEmailAndPassword(user);
		            if (loggedInCustomer != null) {
		                session.setAttribute("userId", loggedInCustomer.getUserId());
		                if (loggedInCustomer.getRole().equals("user")) {
		                    return "redirect:/viewEnqCust";
		                } else if (loggedInCustomer.getRole().equals("admin")) {
		                    return "redirect:/enquiryManagerHome";
		                }
		            } else {
		                model.addAttribute("error", "Invalid email or password");
		                return "redirect:/login";
		            }
		        } catch (Exception e) {
		            // Handle the exception
		            model.addAttribute("error", "An error occurred during login");
		            return "redirect:/login";
		        }
		        return null;
		    }	
	}
	


