package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.DoctorDAO;
import com.DB.DBConnect;

/**
 * Servlet implementation class DeleteDoctorServlet
 */
@WebServlet("/DeleteDoctorServlet")
public class DeleteDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDoctorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		DoctorDAO dao = new DoctorDAO(DBConnect.getConnection());
		boolean f = dao.DeleteDoctor(id);
		
		if(f) {
			response.sendRedirect("ManageDoctor.jsp");
		}else {
			response.sendRedirect("ManageDoctor.jsp");
		}
	}

	
}
