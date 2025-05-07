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
			<a class="navbar-brand" href="DoctorDashboard.jsp">REHealth</a>

			<!-- Centered Text -->
			<div
				class="position-absolute top-50 start-50 translate-middle text-black fw-bold"
				style="font-size: 30px;">Welcome Doctor</div>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item mx-3"><a class="nav-link active"
						aria-current="page" href="DoctorDashboard.jsp">Home</a></li>
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

						<div class="d-flex justify-content-center mb-4">

							<button class="btn btn-success mx-2"
								onclick="showSection('unchecked')">Unchecked Patients</button>
							<button class="btn btn-success mx-2"
								onclick="showSection('checked')">Checked Patients</button>
							<button class="btn btn-success mx-2" onclick="showSection('all')">All
								Patients</button>
						</div>
						<div id="uncheckedPatientsSection" style="display: none;">
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
									</tr>
								</thead>
								<tbody>
									<%
									PatientDAO dao = new PatientDAO(DBConnect.getConnection());
									List<Patient> list = dao.getAllPatients();
									for (Patient p : list) {
										if (p.getDoctorcomment() == null || p.getDoctorcomment().trim().isEmpty()) {
									%>
									<tr>
										<td><%=p.getId()%></td>
										<td><%=p.getName()%></td>
										<td><%=p.getPhone()%></td>
										<td><%=p.getGender()%></td>
										<td><%=p.getAge()%></td>
										<td><%=p.getBloodgroup()%></td>
										<td><%=p.getSymptoms()%></td>
										<td><%=p.getAssigneddoctor()%></td>
										<td><form class="d-flex"
												onsubmit="submitComment(event, <%=p.getId()%>)">
												<input type="text" id="comment-<%=p.getId()%>"
													class="form-control form-control-sm me-2"
													value="<%=p.getDoctorcomment()%>">
												<button type="submit" class="btn btn-sm btn-success">Check</button>
											</form></td>
									</tr>
									<%
									}
									}
									%>
								</tbody>
							</table>
						</div>
						<!-- Checked Patients Table -->
						<div id="checkedPatientsSection" style="display: none;">
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
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (Patient p : list) {
										if (p.getDoctorcomment() != null && !p.getDoctorcomment().trim().isEmpty()) {
									%>
									<tr>
										<td><%=p.getId()%></td>
										<td><%=p.getName()%></td>
										<td><%=p.getPhone()%></td>
										<td><%=p.getGender()%></td>
										<td><%=p.getAge()%></td>
										<td><%=p.getBloodgroup()%></td>
										<td><%=p.getSymptoms()%></td>
										<td><%=p.getAssigneddoctor()%></td>
										<td><%=p.getDoctorcomment()%></td>
										<td><a href="#" class="btn btn-sm btn-success"
											onclick="uncheckPatient(<%=p.getId()%>)">Uncheck</a></td>
									</tr>
									<%
									}
									}
									%>
								</tbody>
							</table>
						</div>

						<div id="allPatientsSection">
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

									</tr>
								</thead>
								<tbody>

									<%
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
	</div>




	<!-- Login as ended -->
	<script>
	function showSection(section) {
	    // Store selected section in localStorage
	    localStorage.setItem('selectedSection', section);

	    // Hide all sections
	    document.getElementById('allPatientsSection').style.display = 'none';
	    document.getElementById('uncheckedPatientsSection').style.display = 'none';
	    document.getElementById('checkedPatientsSection').style.display = 'none';

	    // Show the selected section
	    if (section === 'all') {
	        document.getElementById('allPatientsSection').style.display = 'block';
	    } else if (section === 'unchecked') {
	        document.getElementById('uncheckedPatientsSection').style.display = 'block';
	    } else if (section === 'checked') {
	        document.getElementById('checkedPatientsSection').style.display = 'block';
	    }
	}
	
	function submitComment(e, id) {
        e.preventDefault();
        const comment = document.getElementById("comment-" + id).value;

        fetch("updateComment", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "id=" + id + "&comment=" + encodeURIComponent(comment)
        })
        .then(res => res.text())
        .then(data => {
            if (data.trim() === "success") {
                /* alert("Comment updated successfully."); */
                location.reload();  // Move to checked section after reload
            } else {
                alert("Error updating comment.");
            }
        });
    }
	
	function uncheckPatient(id) {
	    fetch("updateComment", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/x-www-form-urlencoded",
	        },
	        body: "id=" + id + "&comment="
	    })
	    .then(response => response.text())
	    .then(data => {
	        if (data.trim() === 'success') {
	            location.reload(); // silently reload
	        }
	    })
	    .catch(error => {
	        console.error("Uncheck error:", error);
	    });
	}

	
	window.onload = function () {
        var savedSection = localStorage.getItem('selectedSection') || 'all';
        showSection(savedSection);
    };

	</script>


</body>
</html>