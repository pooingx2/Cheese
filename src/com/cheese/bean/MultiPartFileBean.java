package com.cheese.bean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MultiPartFileBean  {

	private List<MultipartFile> files;

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
}
