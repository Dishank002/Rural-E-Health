package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.DAO.DoctorDAO;
import com.DB.DBConnect;
import com.entities.Doctor;

@WebServlet("/LoadDoctorsServlet")
public class LoadDoctorsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoadDoctorsServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Create a connection to the database
        DoctorDAO doctorDAO = new DoctorDAO(DBConnect.getConnection());
        
        // Fetch the list of doctors
        List<Doctor> doctorList = doctorDAO.getAllDoctors();

        // Set the doctor list as a request attribute
        request.setAttribute("doctors", doctorList);
        
        // Forward the request to the JSP
        request.getRequestDispatcher("AddPatient.jsp").forward(request, response);
    }
}
