package com.cheese.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Gallery implements Serializable{

	private int gid;
	private String title;
	private String content;
	private double mapx;
	private double mapy;
	private String master;

	
	public Gallery(){
	}


	public int getGid() {
		return gid;
	}


	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public double getMapx() {
		return mapx;
	}


	public void setMapx(double mapx) {
		this.mapx = mapx;
	}


	public double getMapy() {
		return mapy;
	}


	public void setMapy(double mapy) {
		this.mapy = mapy;
	}


	public String getMaster() {
		return master;
	}


	public void setMaster(String master) {
		this.master = master;
	}

	
}
