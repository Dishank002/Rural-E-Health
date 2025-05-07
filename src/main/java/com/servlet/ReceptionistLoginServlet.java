package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.DAO.ReceptionistDAO;
import com.DB.DBConnect;
import com.entities.Receptionist;

/**
 * Servlet implementation class ReceptionistLoginServlet
 */
@WebServlet("/ReceptionistLoginServlet")
public class ReceptionistLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceptionistLoginServlet() {
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
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		ReceptionistDAO dao = new ReceptionistDAO(DBConnect.getConnection());
		Receptionist receptionist = dao.getLogin(email, password);
		
		if(receptionist!=null) {
			response.sendRedirect("ReceptionistDashboard.jsp");
		}else {
			response.sendRedirect("ReceptionistLogin.jsp");
		}
	}

}



























