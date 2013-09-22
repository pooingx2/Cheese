package com.cheese.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cheese.bean.Gallery;
import com.cheese.bean.Photo;
import com.cheese.dao.GalleryDAO;
import com.cheese.dao.PhotoDAO;

@Controller
public class GalleryController {
	
	@RequestMapping(value = "/gallery.do", method = RequestMethod.GET)
	public ModelAndView getGallery(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		System.out.println("\n\nGet gallery!!");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String gid = request.getParameter("gid");
		System.out.println(gid);
		
		GalleryDAO galleryDAO = new GalleryDAO();
		Gallery gallery = galleryDAO.selectOneGallery(Integer.parseInt(gid));
		
		PhotoDAO photoDAO = new PhotoDAO();
		List<Photo> photoList = photoDAO.selectGalleryPhoto(Integer.parseInt(gid));
		
		System.out.println(gallery.getTitle());
		System.out.println(gallery.getContent());
		
		for(Photo item : photoList) {
			System.out.println("getPath : " + item.getPath());
		}
		
		ModelAndView mav = new ModelAndView("gallery");
		mav.addObject("gallery", gallery);
		mav.addObject("photoList", photoList);
		return mav;
	}
}