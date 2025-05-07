package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.catalina.ha.backend.Sender;

import com.DAO.PatientDAO;
import com.DB.DBConnect;
import com.entities.Patient;

/**
 * Servlet implementation class AddPatientServlet
 */
@WebServlet("/AddPatientServlet")
public class AddPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPatientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Fetch form data
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String bloodgroup = request.getParameter("bloodgroup");
		String symptoms = request.getParameter("symptoms");
		String assigneddoctor = request.getParameter("assigneddoctor");
		String doctorcomment = request.getParameter("doctorcomment");


		Patient patient = new Patient(name, phone, age, gender, bloodgroup, symptoms, assigneddoctor, doctorcomment);

        PatientDAO dao = new PatientDAO(DBConnect.getConnection());
        boolean f = dao.addPatient(patient);
        
        if(f) {
        	response.sendRedirect("ReceptionistDashboard.jsp");
        }else {
        	System.out.println("AddPatient.jsp");
        }
    }
}