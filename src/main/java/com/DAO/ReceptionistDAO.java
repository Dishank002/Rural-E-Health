package com.DAO;
import com.entities.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReceptionistDAO {

	private Connection conn;

	public ReceptionistDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean ReceptionistRegister(Receptionist rp) {
		boolean f = false;
		
		try {
			
			String qu =  "insert into receptionist(name,email,password,gender,phone) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(qu);
			ps.setString(1, rp.getName());
			ps.setString(2, rp.getEmail());
			ps.setString(3, rp.getPassword());
			ps.setString(4, rp.getGender());
			ps.setString(5, rp.getPhone());
			
			ps.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public Receptionist getLogin(String em, String ps) {
		Receptionist rp = null;
		try {
			String qu = "select * from receptionist where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(qu);
			pst.setString(1, em);
			pst.setString(2, ps);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				rp = new Receptionist(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rp;
	}
	
	public List<Receptionist> getAllReceptionist() {
	    List<Receptionist> receptionistlist = new ArrayList<>();
	    Receptionist r = null;

	    try {
	        String qu = "SELECT * FROM receptionist";
	        PreparedStatement ps = conn.prepareStatement(qu);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            r = new Receptionist();
	            r.setId(rs.getInt(1)); // id
	            r.setName(rs.getString(2)); // name
	            r.setEmail(rs.getString(3)); // email
	            r.setPassword(rs.getString(4));
	            r.setPhone(rs.getString(5));
	            r.setGender(rs.getString(6));
	            
	            
	            receptionistlist.add(r);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return receptionistlist;
	}
	
	public Receptionist getReceptionistById(int id) {
	    Receptionist r = null;

	    try {
	        String qu = "SELECT * FROM receptionist where id=?";
	        PreparedStatement ps = conn.prepareStatement(qu);
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            r = new Receptionist();
	            r.setId(rs.getInt(1)); // id
	            r.setName(rs.getString(2)); // name
	            r.setEmail(rs.getString(3)); // email
	            r.setPassword(rs.getString(4)); // password
	            r.setPhone(rs.getString(5));
	            r.setGender(rs.getString(6));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return r;
	}

	public boolean UpdateReceptionist(Receptionist r) {
		boolean f = false;
		try {
			
			String qu = "update receptionist set name=?,email=?,password=?,phone=?,gender=? where id=?";
			PreparedStatement ps = conn.prepareStatement(qu);
			ps.setString(1, r.getName());
			ps.setString(2, r.getEmail());
			ps.setString(3, r.getPassword());
			ps.setString(4, r.getPhone());
			ps.setString(5, r.getGender());
			ps.setInt(6, r.getId());
			
			ps.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	public boolean DeleteReceptionist(int id) {
		boolean f = false;
		
		try {
			
			String qu = "delete from receptionist where id=?";
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
	
}
