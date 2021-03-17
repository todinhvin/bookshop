package com.laptrinhweb.dto;

public class ImageDTO {
	
	private String name;
	private String base64;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBase64() {
		return base64.split(",")[1];
	}
	public void setBase64(String base64) {
		this.base64 = base64;
	}
	
	

}
