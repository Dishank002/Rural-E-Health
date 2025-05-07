<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Doctor</title>
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
    <a class="navbar-brand" href="#">REHealth</a>
    
    <!-- <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item mx-3">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item mx-3">
          <a class="nav-link" href="About.jsp">About</a>
        </li>
        <li class="nav-item mx-3">
          <a class="nav-link" href="Services.jsp">Services</a>
        </li>
        <li class="nav-item mx-3">
          <a class="nav-link" href="FAQs.jsp">FAQs</a>
        </li>
        <li class="nav-item mx-3">
          <a class="nav-link" href="Support.jsp">Support/Help</a>
        </li>
      </ul>
    </div> -->
  </div>
</nav>
	<!-- Navbar End -->

	<!-- Login form -->
	<div class="form-box"
		style="background-image: linear-gradient(to right top, #bd6bf4, #a07afb, #8387fd, #6790fa, #4f97f4) !important;">
		<form action="AddDoctorServlet" method="post">
			<h2 style="text-align: center;">Doctor Registration</h2>
			
			<div class="mb-3">
				<label for="doctorName" class="form-label">Name</label> <input
					type="text" class="form-control" id="doctorName" name="name"
					required>
			</div>
			<div class="mb-3">
				<label for="doctorName" class="form-label">Username or Email</label>
				<input type="text" class="form-control" id="doctorName"
					name="username" required>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Password</label>
				<input type="password" class="form-control"
					id="exampleInputPassword1" name="password">
			</div>
			<div class="mb-3">
				<label for="specialization" class="form-label">Specialization
					or Qualification</label> <input type="text" class="form-control"
					id="specialization" name="specialization" required>
			</div>
			<div class="mb-3">
				<label for="phone" class="form-label">Phone</label> <input
					type="text" class="form-control" id="phone" name="phone" required pattern="\d+" 
           title="Phone number must be numeric only">
			</div>
			<div>
				<label class="form-label">Gender&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender"
						id="male" value="Male"> <label class="form-check-label"
						for="male">Male</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender"
						id="female" value="Female"> <label
						class="form-check-label" for="female">Female</label>
				</div>
			</div>


			<div class="d-flex justify-content-center">
				<button type="submit" class="btn btn-primary">Register</button>
			</div>
		</form>

	</div>

	<!-- Login form ended -->

</body>
</html>