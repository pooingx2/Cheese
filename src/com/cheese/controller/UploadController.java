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

import com.cheese.bean.Gallery;
import com.cheese.bean.MultiPartFileBean;
import com.cheese.bean.Photo;
import com.cheese.bean.User;
import com.cheese.dao.GalleryDAO;
import com.cheese.dao.PhotoDAO;

@Controller
public class UploadController {
	
	public final static String galleryPath = "D:\\Java\\workspace\\Cheese\\WebContent\\gallery";
	//public final static String galleryPath = "D:\\Study\\SSM\\workspace\\Cheese\\WebContent\\gallery";

	@RequestMapping(value = "/upload.do", method = RequestMethod.GET)
	public String getGallery(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("Get Upload");
//		User user = (User)request.getSession().getAttribute("user");
		
		return "upload";
	}


	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	public String upload( HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("uploadForm") MultiPartFileBean multipleFile,
					Model model) throws IOException{
		
		System.out.println("Post Upload");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		User user = (User)request.getSession().getAttribute("user");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String x = request.getParameter("markerX");
		String y = request.getParameter("markerY");
		
		GalleryDAO galleryDAO = new GalleryDAO();
		PhotoDAO photoDAO = new PhotoDAO();
		
		Gallery gallery = new Gallery();
		gallery.setGid(0);
		gallery.setTitle(title);
		gallery.setContent(content);
		gallery.setCount(0);
		gallery.setMapx(Double.parseDouble(x));
		gallery.setMapy(Double.parseDouble(y));
		gallery.setMaster(user.getUid());

		galleryDAO.insertGallery(gallery);
		
		List<MultipartFile> files = multipleFile.getFiles();
		List<String> fileNames = new ArrayList<String>();
		
		File dir = new File(galleryPath+"\\"+gallery.getGid());

		if(!dir.exists()) 
			dir.mkdir();
		
		if(null != files && files.size() > 0) {
			for (MultipartFile multipartFile : files) {

				String fileName = multipartFile.getOriginalFilename();

				fileNames.add(fileName);
				//Handle file content - multipartFile.getInputStream()
				System.out.println(fileName);
				
				Photo photo = new Photo();
				photo.setPid(0);
				photo.setPath("/Cheese/gallery/"+gallery.getGid()+"/"+fileName);
				photo.setGallery(gallery.getGid());
				
				photoDAO.insertPhoto(photo);
				
				try {
					File file = new File(galleryPath+"\\"+gallery.getGid()+"\\"+fileName);
					//File file = new File("D:\\Study\\SSM\\workspace\\Cheese\\WebContent\\gallery\\"+fileName);
					System.out.println(file.getAbsolutePath());
					BufferedOutputStream buf = new BufferedOutputStream(new FileOutputStream(file));
					buf.write(multipartFile.getBytes());
					System.out.println("save the file");
					buf.close();
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