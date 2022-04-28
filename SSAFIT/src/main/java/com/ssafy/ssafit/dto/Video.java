package com.ssafy.ssafit.dto;

public class Video {
	private int no;
	private String title;
	private String part;
	private String url;
	private int viewCnt;
	
	public Video() {}
	
	public Video(int no, String title, String part, String url, int viewCnt) {
		super();
		this.no = no;
		this.title = title;
		this.part = part;
		this.url = url;
		this.viewCnt = viewCnt;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	
}
