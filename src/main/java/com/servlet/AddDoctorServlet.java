package com.servlet;
import com.DAO.DoctorDAO;
import com.DB.DBConnect;
import com.entities.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.entities.Doctor;

/**
 * Servlet implementation class AddDoctorServlet
 */
@WebServlet("/AddDoctorServlet")
public class AddDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddDoctorServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String specialization = request.getParameter("specialization");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		
		Doctor dr = new Doctor();
		dr.setName(name);
		dr.setEmail(username);
		dr.setPassword(password);
		dr.setSpecialization(specialization);
		dr.setGender(gender);
		dr.setPhone(phone);
		
		DoctorDAO dao = new DoctorDAO(DBConnect.getConnection());
		boolean f = dao.DoctorRegister(dr);
		
		if(true) {
			HttpSession session = request.getSession();
			session.setAttribute("reg-msg", "Registration Successful....");
			response.sendRedirect("ManageDoctor.jsp");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("error-msg", "Something went wrong....");
			response.sendRedirect("AddDoctor.jsp");
		}
	}

}




















