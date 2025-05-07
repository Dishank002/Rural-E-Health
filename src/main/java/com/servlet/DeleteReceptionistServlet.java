package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.DoctorDAO;
import com.DAO.ReceptionistDAO;
import com.DB.DBConnect;

/**
 * Servlet implementation class DeleteReceptionistServlet
 */
@WebServlet("/DeleteReceptionistServlet")
public class DeleteReceptionistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReceptionistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		ReceptionistDAO dao  = new ReceptionistDAO(DBConnect.getConnection());
		boolean f = dao.DeleteReceptionist(id);
		
		if(f) {
			response.sendRedirect("manageReceptionist.jsp");
		}else {
			response.sendRedirect("manageReceptionist.jsp");
		}
	}



}
