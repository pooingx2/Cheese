package com.papaya.controller;

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

import com.papaya.model.FileUploadForm;

@Controller
public class MainController {
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("message", "hello, spring!");
		return mav;
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public void gdxg() {

		System.out.println("Get Login");

	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public void test(HttpServletRequest request, HttpServletResponse response) throws Throwable{
	
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		System.out.println("Get Login2");
		System.out.println(id);
		System.out.println(name);
	}
	
	@RequestMapping(value = "/gallery.do", method = RequestMethod.GET)
	public String getGallery() {

		System.out.println("Get gallery");
		return "gallery";
	}

	
	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	public String upload(
			@ModelAttribute("uploadForm") FileUploadForm uploadForm,
					Model model) {
		System.out.println("Post");
		
		List<MultipartFile> files = uploadForm.getFiles();
		List<String> fileNames = new ArrayList<String>();
		
		if(files == null) System.out.println("null");
		
		if(null != files && files.size() > 0) {
			for (MultipartFile multipartFile : files) {
				
				String fileName = multipartFile.getOriginalFilename();
	
				fileNames.add(fileName);
				//Handle file content - multipartFile.getInputStream()
				System.out.println(fileName);
				try {
					File file = new File("D:\\Study\\SSM\\workspace\\Cheese\\WebContent\\gallery\\"+fileName);
//					File file = new File("D:\\"+fileName);
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