package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.PatientDAO;
import com.DB.DBConnect;

/**
 * Servlet implementation class UpdateDoctorCommentServlet
 */
@WebServlet("/updateComment")
public class UpdateDoctorCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDoctorCommentServlet() {
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
		int patientId = Integer.parseInt(request.getParameter("id"));
        String comment = request.getParameter("comment");

        PatientDAO dao = new PatientDAO(DBConnect.getConnection());
        boolean success = dao.updateDoctorComment(patientId, comment);

        response.getWriter().print(success ? "success" : "error");
	}

}
