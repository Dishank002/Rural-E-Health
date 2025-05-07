<%@page import="com.entities.Patient"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.PatientDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css">
</head>
<body
	style="height: 90vh; background-image: linear-gradient(to right top, #a42ef2, #8748f7, #6858f9, #4463f8, #006cf4); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">

	<!-- Navbar Start -->
	<nav class="navbar navbar-expand-lg navbar-main position-relative">
		<div class="container-fluid">
			<a class="navbar-brand" href="ReceptionistDashboard.jsp">REHealth</a>

			<!-- Centered Text -->
			<div
				class="position-absolute top-50 start-50 translate-middle text-black fw-bold"
				style="font-size: 30px;">Welcome Receptionist</div>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item mx-3"><a class="nav-link active"
						aria-current="page" href="ReceptionistDashboard.jsp">Home</a></li>
					<li class="nav-item mx-3"><a class="nav-link"
						href="Logout.jsp">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Navbar End -->

	<!-- Login as -->

	<!-- <div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
  <div class="card d-flex flex-row" style="width: 60rem; height: 20rem; margin-top: -50px;">
    
    Left: Login Section
    <div class="card-body text-center d-flex flex-column justify-content-center" style="width: 50%;">
      <h5 class="card-title">Welcome Receptionist</h5>
      <a href="AddPatient.jsp" class="btn btn-primary">Add Patient</a>
    </div>
    
    Right: Image
    <div style="width: 50%; height: 100%;">
      <img src="Images/LoginImage.jpeg" alt="Image" class="img-fluid h-100 w-100" style="object-fit: cover;">
    </div>

  </div>
</div> -->
	<div class="d-flex justify-content-center align-items-center"
		style="min-height: 100vh;">
		<div class="card" style="width: 80rem; padding: 20px;">

			<h5
				class="card-title d-flex justify-content-center align-items-center">Patient
				Details</h5>
			<div class="container p-3">
				<div class="card" style="width: 100%">
					<div class="card-body">
						<div
							class="d-flex justify-content-between align-items-center mb-3 px-2">
							<b>All Patients</b>
							<div class="ms-auto">
								<a href="ViewDoctors.jsp" class="btn btn-success mb-3">View
									All Doctors >></a> <a href="AddPatient.jsp"
									class="btn btn-success mb-3">+ Add Patient</a>
							</div>
						</div>

						<table class="table text-center">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Phone</th>
									<th>Gender</th>
									<th>Age</th>
									<th>Blood Group</th>
									<th>Symptoms</th>
									<th>Assigned Doctor ID</th>
									<th>Doctor's Comment</th>
									<th>Update</th>
								</tr>
							</thead>
							<tbody>

								<%
								PatientDAO dao = new PatientDAO(DBConnect.getConnection());
								List<Patient> list = dao.getAllPatients();
								for (Patient p : list) {
								%>

								<tr>
									<td scope="row"><%=p.getId()%></td>
									<td><%=p.getName()%></td>
									<td><%=p.getPhone()%></td>
									<td><%=p.getGender()%></td>
									<td><%=p.getAge()%></td>
									<td><%=p.getBloodgroup()%></td>
									<td><%=p.getSymptoms()%></td>
									<td><%=p.getAssigneddoctor()%></td>
									<%-- <td><%= p.getDoctorcomment() %></td> --%>
									<td><input type="text"
										class="form-control form-control-sm"
										value="<%=p.getDoctorcomment()%>"></td>

									<td>
										<a href="EditPatient.jsp?id=<%= p.getId() %>" class="btn btn-sm btn-primary">Edit</a>
										<a href="DeletePatientServlet?id=<%= p.getId() %>" class="btn btn-sm btn-danger ms-1">Delete</a>
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




	<!-- Login as ended -->

</body>
</html>