<%@page import="com.entities.Doctor"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.DoctorDAO"%>
<%@page import="java.awt.print.PrinterGraphics"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body
	style="height: 90vh; background-image: linear-gradient(to right top, #a42ef2, #8748f7, #6858f9, #4463f8, #006cf4); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">

	<!-- Navbar Start -->
	<nav class="navbar navbar-expand-lg navbar-main">
		<div class="container-fluid">
			<a class="navbar-brand" href="AdminDashboard.jsp">REHealth</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
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

	<!-- Login form -->
	<div class="form-box"
		style="background-image: linear-gradient(to right top, #bd6bf4, #a07afb, #8387fd, #6790fa, #4f97f4) !important;">
		<%
		int id = Integer.parseInt(request.getParameter("id"));
		DoctorDAO dao = new DoctorDAO(DBConnect.getConnection());
		Doctor d = dao.getDoctorById(id);
		%>
		<form action="UpdateDoctorServlet" method="post">
			<h2 style="text-align: center;">Edit Doctor Details</h2>

			<div class="mb-3">
				<label for="doctorName" class="form-label">Name</label> <input
					type="text" class="form-control" id="doctorName" name="name"
					value="<%=d.getName()%>" required>
			</div>
			<div class="mb-3">
				<label for="doctorName" class="form-label">Username or Email</label>
				<input type="text" value="<%=d.getEmail()%>" class="form-control"
					id="doctorName" name="username" required>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Password</label> <input
					type="password" class="form-control" id="password" name="password"
					value="<%=d.getPassword()%>" required>
			</div>

			<div class="mb-3">
				<label for="specialization" class="form-label">Specialization
					or Qualification</label> <input type="text" class="form-control"
					id="specialization" value="<%=d.getSpecialization()%>"
					name="specialization" required>
			</div>
			<div class="mb-3">
				<label for="phone" class="form-label">Phone</label> <input
					type="text" class="form-control" value="<%=d.getPhone()%>"
					id="phone" name="phone" required pattern="\d+" 
           title="Phone number must be numeric only">
			</div>
			<div>
				<label class="form-label">Gender&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender"
						id="male" value="Male"
						<%="Male".equalsIgnoreCase(d.getGender()) ? "checked" : ""%>>
					<label class="form-check-label" for="male">Male</label>
				</div>

				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender"
						id="female" value="Female"
						<%="Female".equalsIgnoreCase(d.getGender()) ? "checked" : ""%>>
					<label class="form-check-label" for="female">Female</label>
				</div>

			</div>




			<input type="hidden" name="id" value="<%=d.getId()%>">

			<div class="d-flex justify-content-center">
				<button type="submit" class="btn btn-primary">Update</button>
			</div>
		</form>

	</div>

	<!-- Login form ended -->

</body>
</html>