<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Boolean isAdmin = (Boolean) session.getAttribute("adminLoggedIn");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Welcome Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body style="height: 90vh;  background-image: linear-gradient(to right top, #a42ef2, #8748f7, #6858f9, #4463f8, #006cf4); background-repeat: no-repeat;background-attachment: fixed; background-size: cover;">
<style>
  .card-img-top {
    height: 200px;
    width: 100%;
    object-fit: cover;
  }
</style>


<!-- Navbar Start -->
	<nav class="navbar navbar-expand-lg navbar-main">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">REHealth</a>
				<div
				class="position-absolute top-50 start-50 translate-middle text-black fw-bold"
				style="font-size: 30px;">Welcome Admin</div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item mx-3"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item mx-3"><a class="nav-link"
						href="Logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!-- Navbar End -->

<!-- Admin Dashboard -->
	<div class="container-fluid mt-4">
 <div class="row justify-content-center mb-4">
  <!-- Box 1 -->
  <div class="col-md-3">
    <div class="card text-center" style="width: 20rem;">
      <img src="Images/team-doctors.jpg" class="card-img-top" alt="Doctor Image">
      <div class="card-body">
        <h5 class="card-title">Manage Doctor</h5>
        <a href="ManageDoctor.jsp" class="btn btn-primary">View >></a>
      </div>
    </div>
  </div>

  <!-- Box 2 -->
  <div class="col-md-3">
    <div class="card text-center" style="width: 20rem;">
      <img src="Images/woman-reception.jpg" class="card-img-top" alt="Receptionist Image">
      <div class="card-body">
        <h5 class="card-title">Manage Receptionist</h5>
        <a href="manageReceptionist.jsp" class="btn btn-primary">View >></a>
      </div>
    </div>
  </div>

  <!-- Box 3 -->
  <div class="col-md-3">
    <div class="card text-center" style="width: 20rem;">
      <img src="Images/cartoonPatient.avif" class="card-img-top" alt="Patient Image">
      <div class="card-body">
        <h5 class="card-title">View All Patients</h5>
        <a href="ViewPatients.jsp" class="btn btn-primary">View >></a>
      </div>
    </div>
  </div>
</div>

  <!-- DataTable Section -->
  <!-- <div class="card mb-4">
    <div class="card-header">
      <i class="fas fa-table me-1"></i>
      DataTable Example
    </div>
    <div class="card-body">
      <table id="datatablesSimple" class="table table-bordered">
        <thead>
          <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Office</th>
            <th>Age</th>
            <th>Start date</th>
            <th>Salary</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Tiger Nixon</td>
            <td>System Architect</td>
            <td>Edinburgh</td>
            <td>61</td>
            <td>2011/04/25</td>
            <td>$320,800</td>
          </tr>
          <tr>
            <td>Garrett Winters</td>
            <td>Accountant</td>
            <td>Tokyo</td>
            <td>63</td>
            <td>2011/07/25</td>
            <td>$170,750</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div> -->
</div>

</body>
</html>
