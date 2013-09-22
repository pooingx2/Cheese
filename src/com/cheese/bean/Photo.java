package com.cheese.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Photo implements Serializable{

	private int pid;
	private String path;
	private int gallery;
	
	public Photo(){
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getGallery() {
		return gallery;
	}

	public void setGallery(int gallery) {
		this.gallery = gallery;
	}
}
