package com.cheese.mapper;

import java.util.List;

import com.cheese.bean.Gallery;

public interface GalleryMapper {
	void insertGallery(Gallery gallery);
	List<Gallery> selectAllGallery();
	Gallery selectOneGallery(int gid);
}