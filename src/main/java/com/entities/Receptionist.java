package com.entities;

public class Receptionist {
	private int id;
	private String phone;
	private String name;
	private String email;
	private String password;
	private String gender;
	
	public Receptionist() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Receptionist(int id, String phone, String name, String email, String password, String gender) {
		super();
		this.id = id;
		this.phone = phone;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
	}

	public Receptionist(String phone, String name, String email, String password, String gender) {
		super();
		this.phone = phone;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	

}
