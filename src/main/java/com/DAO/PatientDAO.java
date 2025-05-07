package com.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entities.Doctor;
import com.entities.Patient;

public class PatientDAO {

	private Connection conn;

	public PatientDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addPatient(Patient patient) {

		boolean f = false;

		try {

			String sql = "insert into patients(name,phone,gender,age,blood_group,symptoms,assigned_doctor,doctor_comment) values(?,?,?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, patient.getName());
			ps.setString(2, patient.getPhone());
			ps.setString(3, patient.getGender());
			ps.setString(4, patient.getAge());
			ps.setString(5, patient.getBloodgroup());
			ps.setString(6, patient.getSymptoms());
			ps.setString(7, patient.getAssigneddoctor());
			ps.setString(8, patient.getDoctorcomment());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<Patient> getAllPatients() {
		List<Patient> list = new ArrayList<Patient>();
		Patient p = null;
		try {

			String sql = "select * from patients";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new Patient();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setPhone(rs.getString(3));
				p.setGender(rs.getString(4));
				p.setAge(rs.getString(5));
				p.setBloodgroup(rs.getString(6));
				p.setSymptoms(rs.getString(7));
				p.setAssigneddoctor(rs.getString(8));
				p.setDoctorcomment(rs.getString(9));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Patient getPatientById(int id) {
		Patient p = null;

		try {
			String qu = "SELECT * FROM patients where id=?";
			PreparedStatement ps = conn.prepareStatement(qu);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new Patient();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setPhone(rs.getString(3));
				p.setGender(rs.getString(4));
				p.setAge(rs.getString(5));
				p.setBloodgroup(rs.getString(6));
				p.setSymptoms(rs.getString(7));
				p.setAssigneddoctor(rs.getString(8));
				p.setDoctorcomment(rs.getString(9));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	public boolean UpdatePatient(Patient patient) {

		boolean f = false;

		try {

			String sql = "update patients set name=?,phone=?,gender=?,age=?,blood_group=?,symptoms=?,assigned_doctor=?,doctor_comment=? where id=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, patient.getName());
			ps.setString(2, patient.getPhone());
			ps.setString(3, patient.getGender());
			ps.setString(4, patient.getAge());
			ps.setString(5, patient.getBloodgroup());
			ps.setString(6, patient.getSymptoms());
			ps.setString(7, patient.getAssigneddoctor());
			ps.setString(8, patient.getDoctorcomment());
			ps.setInt(9, patient.getId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}
	
	
	public boolean DeletePatient(int id) {
		boolean f = false;
		
		try {
			
			String sql = "delete from patients where id=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			
			if(i==1)
			{
				f = true; 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean updateDoctorComment(int id, String comment) {
	    boolean f = false;
	    try {
	        String sql = "UPDATE patients SET doctor_comment = ? WHERE id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, comment);
	        ps.setInt(2, id);
	        f = ps.executeUpdate() == 1;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f;
	}

	
	public List<Patient> getPatientsByDoctorId(int doctorId) {
	    List<Patient> list = new ArrayList<>();
	    try {
	        String sql = "SELECT * FROM patients WHERE assigneddoctor = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, doctorId);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Patient p = new Patient();
	            p = new Patient();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setPhone(rs.getString(3));
				p.setGender(rs.getString(4));
				p.setAge(rs.getString(5));
				p.setBloodgroup(rs.getString(6));
				p.setSymptoms(rs.getString(7));
				p.setAssigneddoctor(rs.getString(8));
				p.setDoctorcomment(rs.getString(9));
	            list.add(p);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}


}