<%@page import="com.entities.Patient"%>
<%@page import="com.DAO.PatientDAO"%>
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
<title>Edit Patient</title>
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
		<form action="UpdatePatientServlet" method="post">
			<h2 style="text-align: center;">Edit Patient Details</h2>
			<%
			Patient patient = null;
			String idParam = request.getParameter("id");
			if (idParam != null && !idParam.isEmpty()) {
			    int id = Integer.parseInt(idParam);
			    PatientDAO patientDAO = new PatientDAO(DBConnect.getConnection());
			    patient = patientDAO.getPatientById(id);
			} else {
			    out.println("<p style='color:red;'>Invalid or missing patient ID.</p>");
			}
			%>
			<input type="hidden" name="id" value="<%=patient.getId()%>" />
			<div class="mb-3">
				<label class="form-label">Name</label> <input type="text"
					class="form-control" name="name" value="<%=patient.getName()%>"
					required>
			</div>

			<div class="mb-3">
				<label class="form-label">Phone</label> <input type="text"
					class="form-control" name="phone" value="<%=patient.getPhone()%>"
					required pattern="\d+" 
           title="Phone number must be numeric only">
			</div>
			<div class="mb-3">
				<label class="form-label">Gender</label><br>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender"
						value="Male"
						<%=patient.getGender().equals("Male") ? "checked" : ""%>>
					Male
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender"
						value="Female"
						<%=patient.getGender().equals("Female") ? "checked" : ""%>>
					Female
				</div>
			</div>

			<div class="mb-3">
				<label class="form-label">Age</label> <input type="text"
					class="form-control" name="age" value="<%=patient.getAge()%>"
					required pattern="\d+" 
           title="Age must be numeric only">
			</div>

			<div class="mb-3">
				<label class="form-label">Blood Group</label> <select
					class="form-select" name="bloodgroup" required>
					<option value="">-- Select Blood Group --</option>
					<%
					String[] bloodGroups = { "A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-" };
					for (String bg : bloodGroups) {
						String selected = bg.equals(patient.getBloodgroup()) ? "selected" : "";
					%>
					<option value="<%=bg%>" <%=selected%>><%=bg%></option>
					<%
					}
					%>
				</select>
			</div>

			<div class="mb-3">
				<label class="form-label">Symptoms</label> <input type="text"
					class="form-control" name="symptoms"
					value="<%=patient.getSymptoms()%>" required>
			</div>

			<div class="mb-3">
				<label class="form-label">Assign Doctor</label> <select
					class="form-select" name="assigneddoctor" required>
					<option value="">-- Select Doctor --</option>
					<%
					try {
						Connection conn = DBConnect.getConnection();
						String sql = "SELECT id, name FROM doctors";
						PreparedStatement ps = conn.prepareStatement(sql);
						ResultSet rs = ps.executeQuery();

						while (rs.next()) {
							String docId = String.valueOf(rs.getInt("id"));
							String docName = rs.getString("name");
							String selected = docId.equals(patient.getAssigneddoctor()) ? "selected" : "";
					%>
					<option value="<%=docId%>" <%=selected%>><%=docName%></option>
					<%
					}
					} catch (SQLException e) {
					e.printStackTrace();
					}
					%>
				</select>
				<div class="mb-3">
				<label class="form-label">Doctor Comment</label> <input type="text"
					class="form-control" name="doctorcomment" disabled style="cursor: not-allowed;">

			</div>
			</div>

			
			<div class="d-flex justify-content-center">
				<button type="submit" class="btn btn-primary">Update</button>
			</div>
		</form>
	</div>

</body>
</html>