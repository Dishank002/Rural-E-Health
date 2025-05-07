<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if ("admin".equals(username) && "admin123".equals(password)) {
        session.setAttribute("adminLoggedIn", true);
        response.sendRedirect("AdminDashboard.jsp");
    } else {
%>
    <script>
        alert("Invalid username or password!");
        window.location.href = "AdminLogin.jsp";
    </script>
<%
    }
%>
