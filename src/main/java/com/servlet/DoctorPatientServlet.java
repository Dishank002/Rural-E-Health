package com.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.DAO.PatientDAO;
import com.DB.DBConnect;
import com.entities.Patient;

/**
 * Servlet implementation class DoctorPatientServlet
 */
@WebServlet("/doctor/patients")
public class DoctorPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorPatientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer doctorId = (Integer) session.getAttribute("doctorId");

        if (doctorId != null) {
            PatientDAO dao = new PatientDAO(DBConnect.getConnection());
            List<Patient> patientList = dao.getPatientsByDoctorId(doctorId);
            request.setAttribute("patients", patientList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("DoctorDashboard.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("../Login.jsp");
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
