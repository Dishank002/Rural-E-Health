package com.entities;

public class Patient {
    private int id;
    private String name;
    private String phone;
    private String age;
    private String gender;
    private String bloodgroup;
    private String symptoms;
    private String assigneddoctor;
    private String doctorcomment;
    
    public Patient() {
        super();
    }

    public Patient(String name, String phone, String age, String gender, String bloodgroup, String symptoms, String assigneddoctor, String doctorcomment)
 {
		super();
		this.name = name;
		this.phone = phone;
		this.age = age;
		this.gender = gender;
		this.bloodgroup = bloodgroup;
		this.symptoms = symptoms;
		this.assigneddoctor = assigneddoctor;
		this.doctorcomment = doctorcomment;
	}
    
    

	public Patient(int id, String name, String phone, String gender,String age, String bloodgroup, String symptoms,
			String assigneddoctor, String doctorcomment) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.gender = gender;
		this.age = age;
		this.bloodgroup = bloodgroup;
		this.symptoms = symptoms;
		this.assigneddoctor = assigneddoctor;
		this.doctorcomment = doctorcomment;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBloodgroup() {
		return bloodgroup;
	}

	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}

	public String getSymptoms() {
		return symptoms;
	}

	public void setSymptoms(String symptoms) {
		this.symptoms = symptoms;
	}

	public String getAssigneddoctor() {
		return assigneddoctor;
	}

	public void setAssigneddoctor(String assigneddoctor) {
		this.assigneddoctor = assigneddoctor;
	}

	public String getDoctorcomment() {
		return doctorcomment;
	}

	public void setDoctorcomment(String doctorcomment) {
		this.doctorcomment = doctorcomment;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Patient [id=" + id + ", name=" + name + ", phone=" + phone + ", age=" + age + ", gender=" + gender
				+ ", bloodgroup=" + bloodgroup + ", symptoms=" + symptoms + ", assigneddoctor=" + assigneddoctor
				+ ", doctorcomment=" + doctorcomment + "]";
	}


	
	

    
}
