package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.DoctorDAO;
import com.DAO.ReceptionistDAO;
import com.DB.DBConnect;
import com.entities.Doctor;
import com.entities.Receptionist;

/**
 * Servlet implementation class UpdateReceptionistServlet
 */
@WebServlet("/UpdateReceptionistServlet")
public class UpdateReceptionistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReceptionistServlet() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		int id = Integer.parseInt(request.getParameter("id"));
		
		Receptionist r = new Receptionist();
		r.setId(id);
		r.setName(name);
		r.setEmail(email);
		r.setPassword(password);
		r.setPhone(phone);
		r.setGender(gender);
	
		
		ReceptionistDAO dao = new ReceptionistDAO(DBConnect.getConnection());
		HttpSession session = request.getSession();
		boolean f = dao.UpdateReceptionist(r);
		if (f) {
		    response.sendRedirect("manageReceptionist.jsp");
		} else {
		    response.sendRedirect("EditReceptionist.jsp?id=" + id);
		}
		
		
	}

}
