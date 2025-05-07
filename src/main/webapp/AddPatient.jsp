<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Patient</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/styles.css">
</head>
<body
	style="background: linear-gradient(to right top, #a42ef2, #006cf4); background-size: cover;">

	<nav class="navbar navbar-expand-lg navbar-main">
		<div class="container-fluid">
			<a class="navbar-brand" href="ReceptionistDashboard.jsp">REHealth</a>
				<div
				class="position-absolute top-50 start-50 translate-middle text-black fw-bold"
				style="font-size: 30px;">Welcome Receptionist</div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-3"><a class="nav-link active"
						href="ReceptionistDashboard.jsp">Home</a></li>
					<li class="nav-item mx-3"><a class="nav-link"
						href="Logout.jsp">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="form-box"
		style="background: linear-gradient(to right top, #bd6bf4, #4f97f4);">
		<form action="AddPatientServlet" method="post">
			<h2 style="text-align: center;">Patient Registration</h2>

			<div class="mb-3">
				<label class="form-label">Name</label> <input type="text"
					class="form-control" name="name" required>
			</div>
			<div class="mb-3">
				<label class="form-label">Phone</label> <input type="text"
					class="form-control" name="phone" required pattern="\d+" 
           title="Phone number must be numeric only">
			</div>
			<div class="mb-3">
				<label class="form-label">Gender</label><br>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender"
						value="Male"> Male
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender"
						value="Female"> Female
				</div>
			</div>
			<div class="mb-3">
				<label class="form-label">Age</label> <input type="text"
					class="form-control" name="age" required pattern="\d+" 
           title="Age must be numeric only">
			</div>
			<div class="mb-3">
				<label class="form-label">Blood Group</label> <select
					class="form-select" name="bloodgroup" required>
					<option value="">-- Select Blood Group --</option>
					<option value="A+">A+</option>
					<option value="A-">A-</option>
					<option value="B+">B+</option>
					<option value="B-">B-</option>
					<option value="O+">O+</option>
					<option value="O-">O-</option>
					<option value="AB+">AB+</option>
					<option value="AB-">AB-</option>
				</select>
			</div>

			<div class="mb-3">
				<label class="form-label">Symptoms</label> <input type="text"
					class="form-control" name="symptoms" required>
			</div>
			<div class="mb-3">
				<label class="form-label">Assign Doctor</label> <select
					class="form-select" name="assigneddoctor" required>
					<option value="">-- Select Doctor --</option>
					<%
        
        Connection conn = DBConnect.getConnection();
        if (conn == null) {
            out.println("DB connection failed.");
        } else {
            out.println("DB connected.<br>");
        }
       

        try {
            String sql = "SELECT id, name FROM doctors";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
        %>
                <option value="<%=id%>"><%=name%></option>
        <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        %>

				</select>
			</div>
			<div class="mb-3">
				<label class="form-label">Doctor Comment</label> <input type="text"
					class="form-control" name="doctorcomment" disabled style="cursor: not-allowed;">
			</div>



			<div class="d-flex justify-content-center">
				<button type="submit" class="btn btn-primary">Register</button>
			</div>
		</form>
	</div>

</body>
</html>
