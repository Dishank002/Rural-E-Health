<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css">
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

<!-- Login as -->

  <div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
  <div class="card d-flex flex-row" style="width: 60rem; height: 20rem; margin-top: -50px;">
    
    <!-- Left: Login Section -->
    <div class="card-body text-center d-flex flex-column justify-content-center" style="width: 50%;">
      <h4 class="card-title">Need Support or Help</h4>
      <h5>admin@gmail.com</h5>
      <h5>+91 9359XXXXXX</h5>
    </div>
    <!-- Right: Image -->
    <div style="width: 50%; height: 100%;">
      <img src="Images/LoginImage.jpeg" alt="Image" class="img-fluid h-100 w-100" style="object-fit: cover;">
    </div>

  </div>
</div>




<!-- Login as ended -->

</body>
</html>