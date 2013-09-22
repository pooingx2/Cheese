package com.cheese.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cheese.bean.User;
import com.cheese.dao.UserDAO;

@Controller
public class SessionController {
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response){

		String uid = request.getParameter("uid");
//		String accessToken = request.getParameter("accessToken");
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		User user = new User();
		user.setUid(uid);
		user.setName(name);
		user.setEmail(email);
		user.setType("user");
		user.setMoney(1000);
		UserDAO userDAO = new UserDAO();
		userDAO.insertUser(user);
		
		HttpSession session = request.getSession();
		session.setAttribute("user",user);

		System.out.println("Login : "+ uid );
		
//		RedirectView rv = new RedirectView("main");
//		rv.setExposeModelAttributes(false);
//		ModelAndView mav = new ModelAndView(rv);

		ModelAndView mav = new ModelAndView("main");
		mav.addObject("user", user);
		return mav;
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.POST)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		ModelAndView mav = new ModelAndView("main");
		System.out.println("logout");
		request.getSession().invalidate();
		return mav;
	}
}