package com.anime.blog.entities;

import java.sql.Timestamp;

public class Post {
	private int pId;
	private String pTitle;
	private String pContent;
	private String pPic;
	private Timestamp pDate;
	private int catId;
	private int userId;
	
	public Post() {
	}
	
	
	public Post(int pId, String pTitle, String pContent, String pPic, Timestamp pDate, int catId, int userId) {
		this.pId = pId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pPic = pPic;
		this.catId = catId;
		this.userId = userId;
		this.pDate = pDate;
	}
	

	public Post(String pTitle, String pContent, String pPic, int catId, int userId) {
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pPic = pPic;
		this.catId = catId;
		this.userId = userId;
	}


	public int getpId() {
		return pId;
	}


	public void setpId(int pId) {
		this.pId = pId;
	}


	public String getpTitle() {
		return pTitle;
	}


	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}


	public String getpContent() {
		return pContent;
	}


	public void setpContent(String pContent) {
		this.pContent = pContent;
	}


	public String getpPic() {
		return pPic;
	}


	public void setpPic(String pPic) {
		this.pPic = pPic;
	}


	public int getCatId() {
		return catId;
	}


	public void setCatId(int catId) {
		this.catId = catId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	public Timestamp getpDate() {
		return pDate;
	}


	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	
}
