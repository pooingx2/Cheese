package com.cheese.mapper;

import java.util.List;

import com.cheese.bean.Photo;

public interface PhotoMapper {
	void insertPhoto(Photo photo);
	List<Photo> selectAllPhoto();
	List<Photo> selectGalleryPhoto(int gallery);
}