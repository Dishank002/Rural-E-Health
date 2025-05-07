<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body style="height: 90vh; background-image: linear-gradient(to right top, #a42ef2, #8748f7, #6858f9, #4463f8, #006cf4); background-repeat: no-repeat;background-attachment: fixed; background-size: cover;">

<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg navbar-main">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">REHealth</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
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
    </div>
  </div>
</nav>
<!-- Navbar End -->

<!-- Login form -->
<div class="form-box" style="background-image: linear-gradient(to right top, #bd6bf4, #a07afb, #8387fd, #6790fa, #4f97f4) !important; margin-top:50px; padding: 30px; width:60rem;">
  <div style="display: flex; align-items: center; justify-content: space-between; gap: 20px;">
    
    <!-- Left Side: Form -->
    <form style="flex: 1;" action="AdminValidation.jsp" method="post">
      <div class="mb-3">
        <h3 style="text-align: center;"><i class="fa-solid fa-user"></i> Welcome Admin</h3><br>
        <label for="exampleInputEmail1" class="form-label">Username or Email</label>
        <input type="text" class="form-control" name="username" id="exampleInputEmail1" aria-describedby="emailHelp">
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input type="password" class="form-control" name="password" id="exampleInputPassword1">
      </div>
      <div class="d-flex justify-content-center">
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </form>

    <!-- Right Side: Image -->
    <div style="flex: 1; text-align: center;">
      <img src="Images/DoctorImage.png" alt="Image" style="max-width: 100%; height: auto;">
    </div>
    
  </div>
</div>


<!-- Login form ended -->
</body>
</html>