<%@page import="com.DB.DBConnect"%>
<%@page import="com.entities.Doctor"%>
<%@ page import="java.util.*, com.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/styles.css">
</head>
<body
	style="height: 90vh; background-image: linear-gradient(to right top, #a42ef2, #8748f7, #6858f9, #4463f8, #006cf4); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">

	<!-- Navbar Start -->
	
	<nav class="navbar navbar-expand-lg navbar-main">
		<div class="container-fluid">
			<a class="navbar-brand" href="AdminDashboard.jsp">REHealth</a>
			<div
				class="position-absolute top-50 start-50 translate-middle text-black fw-bold"
				style="font-size: 30px;">Welcome Admin</div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item mx-3"><a class="nav-link active"
						aria-current="page" href="AdminDashboard.jsp">Home</a></li>
					<li class="nav-item mx-3"><a class="nav-link"
						href="Logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
	</nav>
	
	<!-- Navbar End -->

	<!-- Doctors Section Start -->
	<div class="d-flex justify-content-center align-items-center"
		style="min-height: 100vh;">
		<div class="card" style="width: 80rem; padding: 20px;">

			<h5 class="card-title d-flex justify-content-center align-items-center">Doctors Details</h5>
			<div class="container p-3">
				<div class="card">
					<div class="card-body">
						<div class="d-flex justify-content-between align-items-center mb-3 px-2">
							<b>All Doctors</b>

							<a href="AddDoctor.jsp" class="btn btn-success mb-3">+ Add Doctor</a>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Email</th>
									<th>Password</th>
									<th>Phone</th>
									<th>Specialization</th>
									<th>Gender</th>
									<th>Update</th>
								</tr>
							</thead>
							<tbody>

								<%
								DoctorDAO dao = new DoctorDAO(DBConnect.getConnection());
								List<Doctor> DoctorList = dao.getAllDoctors();
								for (Doctor d : DoctorList) {
								%>

								<tr>
									<td scope="row"><%=d.getId()%></td>
									<td><%=d.getName()%></td>
									<td><%=d.getEmail()%></td>
									<td><%= "*".repeat(d.getPassword().length()) %></td>
									<td><%=d.getPhone()%></td>
									<td><%=d.getSpecialization()%></td>
									<td><%=d.getGender()%></td>
									<td><a href="EditDoctor.jsp?id=<%=d.getId()%>"
										class="btn btn-sm btn-primary">Edit</a> <a
										href="DeleteDoctorServlet?id=<%= d.getId() %>" class="btn btn-sm btn-danger ms-1">Delete</a>
									</td>
								</tr>

								<%
								}
								%>


							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- Doctors Section End -->

</body>
</html>
