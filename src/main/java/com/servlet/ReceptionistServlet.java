package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.DAO.ReceptionistDAO;
import com.DB.DBConnect;
import com.entities.Receptionist;

/**
 * Servlet implementation class ReceptionistServlet
 */
@WebServlet("/ReceptionistServlet")
public class ReceptionistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReceptionistServlet() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String submittedBy = request.getParameter("submittedBy");

		
		Receptionist rp = new Receptionist();
		rp.setName(name);
		rp.setEmail(email);
		rp.setGender(gender);
		rp.setPassword(password);
		rp.setPhone(phone);
		
		ReceptionistDAO dao = new ReceptionistDAO(DBConnect.getConnection());
		boolean f = dao.ReceptionistRegister(rp);
		
		if (f) {
			HttpSession session = request.getSession();
			session.setAttribute("reg-msg", "Registration Successful....");

			if ("admin".equals(submittedBy)) {
				response.sendRedirect("manageReceptionist.jsp"); // or AddReceptionist.jsp if more appropriate
			} else {
				response.sendRedirect("ReceptionistLogin.jsp");
			}
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("error-msg", "Something went wrong....");

			if ("admin".equals(submittedBy)) {
				response.sendRedirect("manageReceptionist.jsp");
			} else {
				response.sendRedirect("ReceptionistLogin.jsp");
			}
		}

		
	}

}




















