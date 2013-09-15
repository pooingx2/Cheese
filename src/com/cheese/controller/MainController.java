package com.cheese.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cheese.bean.MultiPartFileBean;
import com.cheese.bean.User;
import com.cheese.dao.UserDAO;

@Controller
public class MainController {

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("message", "hello, spring!");
		return mav;
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public void login(HttpServletRequest request, HttpServletResponse response) throws Throwable{

		String uid = request.getParameter("uid");
		String accessToken = request.getParameter("accessToken");
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		User user = new User();
		user.setUid(uid);
		user.setName(name);
		user.setEmail(email);
		user.setType("user");
		user.setMoney(1000);
		UserDAO userDao = new UserDAO();
		userDao.insertUser(user);

		System.out.println("Login : "+ uid );
	}


	@RequestMapping(value = "/upload.do", method = RequestMethod.GET)
	public String getGallery() {

		System.out.println("Get Upload");
		return "upload";
	}


	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	public String upload( HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("uploadForm") MultiPartFileBean multipleFile,
					Model model) throws IOException{
		
		System.out.println("Post Upload");

		List<MultipartFile> files = multipleFile.getFiles();
		List<String> fileNames = new ArrayList<String>();
		String x = request.getParameter("markerX");
		String y = request.getParameter("markerY");
		
		System.out.println(x);
		System.out.println(y);

		if(files == null) System.out.println("null");

		System.out.println(files);
		System.out.println(files.size());
		
		if(null != files && files.size() > 0) {
			for (MultipartFile multipartFile : files) {

				String fileName = multipartFile.getOriginalFilename();

				fileNames.add(fileName);
				//Handle file content - multipartFile.getInputStream()
				System.out.println(fileName);
				
				try {
					File file = new File("D:\\Study\\SSM\\workspace\\Cheese\\WebContent\\gallery\\"+fileName);
					System.out.println(file.getAbsolutePath());
					BufferedOutputStream buf = new BufferedOutputStream(new FileOutputStream(file));
					buf.write(multipartFile.getBytes());
					System.out.println("save the file");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}

		model.addAttribute("files", fileNames);
		return "uploadResult";
	}



}