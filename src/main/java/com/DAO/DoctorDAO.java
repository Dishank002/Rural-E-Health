package com.DAO;
import java.sql.Statement;  // ✅ correct
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entities.*;

public class DoctorDAO {
	private Connection conn;

	public DoctorDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean DoctorRegister(Doctor dr) {
		boolean f = false;
		try {
			
			String qu = "insert into doctors(name,email,password,Specialization,gender,phone) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(qu);
			ps.setString(1, dr.getName());
			ps.setString(2, dr.getEmail());
			ps.setString(3, dr.getPassword());
			ps.setString(4, dr.getSpecialization());
			ps.setString(5, dr.getGender());
			ps.setString(6, dr.getPhone());
			
			ps.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	
	public Doctor getLogin(String em, String ps) {
		Doctor dr =null;
		try {
			
			String qu ="select * from doctors where email=? and password=?";
			
			PreparedStatement pst = conn.prepareStatement(qu);
			pst.setString(1, em);
			pst.setString(2, ps);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				dr = new Doctor(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6), rs.getString(7));				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dr;
	}
	
	public List<Doctor> getAllDoctors() {
	    List<Doctor> doctorList = new ArrayList<>();
	    Doctor d = null;

	    try {
	        String qu = "SELECT * FROM doctors";
	        PreparedStatement ps = conn.prepareStatement(qu);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            d = new Doctor();
	            d.setId(rs.getInt(1)); // id
	            d.setName(rs.getString(2)); // name
	            d.setEmail(rs.getString(3)); // email
	            d.setPassword(rs.getString(4));
	            d.setSpecialization(rs.getString(5));
	            d.setGender(rs.getString(6));
	            d.setPhone(rs.getString(7));
	            
	            doctorList.add(d);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return doctorList;
	}



	public Doctor getDoctorById(int id) {
	    Doctor d = null;

	    try {
	        String qu = "SELECT * FROM doctors where id=?";
	        PreparedStatement ps = conn.prepareStatement(qu);
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            d = new Doctor();
	            d.setId(rs.getInt(1)); // id
	            d.setName(rs.getString(2)); // name
	            d.setEmail(rs.getString(3)); // email
	            d.setPassword(rs.getString(4)); // password
	            d.setSpecialization(rs.getString(5));
	            d.setGender(rs.getString(6));
	            d.setPhone(rs.getString(7));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return d;
	}

	
	public boolean UpdateDoctor(Doctor dr) {
		boolean f = false;
		try {
			
			String qu = "update doctors set name=?,email=?,password=?,Specialization=?,gender=?,phone=? where id=?";
			PreparedStatement ps = conn.prepareStatement(qu);
			ps.setString(1, dr.getName());
			ps.setString(2, dr.getEmail());
			ps.setString(3, dr.getPassword());
			ps.setString(4, dr.getSpecialization());
			ps.setString(5, dr.getGender());
			ps.setString(6, dr.getPhone());
			ps.setInt(7, dr.getId());
			
			ps.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	public boolean DeleteDoctor(int id) {
		boolean f = false;
		
		try {
			
			String qu = "delete from doctors where id=?";
			PreparedStatement ps = conn.prepareStatement(qu);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			
			if(i ==1 ) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	public List<String> getAllDoctorNames() {
	    List<String> list = new ArrayList<>();
	    try {
	        String sql = "SELECT name FROM doctors";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            list.add(rs.getString("name"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}


}


























