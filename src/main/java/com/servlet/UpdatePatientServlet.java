package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.PatientDAO;
import com.DB.DBConnect;
import com.entities.Patient;

/**
 * Servlet implementation class UpdatePatientServlet
 */
@WebServlet("/UpdatePatientServlet")
public class UpdatePatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePatientServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String bloodgroup = request.getParameter("bloodgroup");
		String symptoms = request.getParameter("symptoms");
		String assigneddoctor = request.getParameter("assigneddoctor");
		String doctorcomment = request.getParameter("doctorcomment");
		int id = Integer.parseInt(request.getParameter("id"));
		
		Patient patient = new Patient(id,name,phone,gender,age,bloodgroup,symptoms,assigneddoctor,doctorcomment);
		
		PatientDAO dao = new PatientDAO(DBConnect.getConnection());
		
		boolean f = dao.UpdatePatient(patient);
		
		if(f) 
		{
			System.out.println("Successful");
			response.sendRedirect("ReceptionistDashboard.jsp");
		}else
		{
			System.out.println("Something went wrong");
			response.sendRedirect("EditPatient.jsp");
		}
		
		
	}

}
