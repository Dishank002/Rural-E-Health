package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.DoctorDAO;
import com.DB.DBConnect;
import com.entities.Doctor;

/**
 * Servlet implementation class UpdateDoctorServlet
 */
@WebServlet("/UpdateDoctorServlet")
public class UpdateDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDoctorServlet() {
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
		String username = request.getParameter("username");
		String specialization = request.getParameter("specialization");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		int id = Integer.parseInt(request.getParameter("id"));
		
		Doctor dr = new Doctor();
		dr.setId(id);
		dr.setName(name);
		dr.setEmail(username);
		dr.setPassword(password);
		dr.setSpecialization(specialization);
		dr.setGender(gender);
		dr.setPhone(phone);
		
		DoctorDAO dao = new DoctorDAO(DBConnect.getConnection());
		HttpSession session = request.getSession();
		boolean f = dao.UpdateDoctor(dr);
		if (f) {
		    response.sendRedirect("ManageDoctor.jsp");
		} else {
		    response.sendRedirect("EditDoctor.jsp?id=" + id);
		}

	}

}
