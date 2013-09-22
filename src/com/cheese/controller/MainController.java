package com.cheese.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cheese.bean.Gallery;
import com.cheese.bean.Photo;
import com.cheese.dao.GalleryDAO;
import com.cheese.dao.PhotoDAO;

@Controller
public class MainController {
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView main() {
		
		System.out.println("main!!");
		
		GalleryDAO galleryDAO = new GalleryDAO();
		List<Gallery> galleryList = galleryDAO.selectAllGallery();
		
		for(Gallery item : galleryList) {
			System.out.println("x : " + item.getMapx());
			System.out.println("y : " + item.getMapy());
		}
		
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("message", "hello, spring!");
		mav.addObject("galleryList", galleryList);
		return mav;
	}
	

	@RequestMapping(value = "/showMinGallery.do", method = RequestMethod.POST)
	public void getPhotoList(HttpServletRequest request, HttpServletResponse response) throws IOException{
	
		System.out.println("\n\nshowMinGallery!!");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String gallery = request.getParameter("gallery");
		System.out.println(gallery);
		
		PhotoDAO photoDAO = new PhotoDAO();
		List<Photo> photoList = photoDAO.selectGalleryPhoto(Integer.parseInt(gallery));
		
		System.out.println(photoList.size());
		
		for(Photo item : photoList) {
			System.out.println("getPath : " + item.getPath());
		}

		JSONObject obj = new JSONObject();
		
		// JSON JSONArray형식으로 전송한다.
		JSONArray jsonArray;
		try {
			jsonArray = new JSONArray(photoList.toArray());
			obj.put("photoList", jsonArray);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PrintWriter writer = response.getWriter();
		writer.write(obj.toString());
		
	}

}