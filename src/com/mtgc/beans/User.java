package com.mtgc.beans;

import java.util.Date;

public class User {
	
	private Long id;
	private String givenName;
	private String familyName;
	private String nickName;
	private Date registration;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getGivenName() {
		return givenName;
	}
	public void setGivenName(String givenName) {
		this.givenName = givenName;
	}
	public String getFamilyName() {
		return familyName;
	}
	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Date getRegistration() {
		return registration;
	}
	public void setRegistration(Date registration) {
		this.registration = registration;
	}
	
	public User(String givenName, String familyName, String nickName,
			Date registration) {
		super();
		this.givenName = givenName;
		this.familyName = familyName;
		this.nickName = nickName;
		this.registration = registration;
	}
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
