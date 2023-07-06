<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <style>
    body {
      background-image: url("https://images.pexels.com/photos/7130555/pexels-photo-7130555.jpeg?auto=compress&cs=tinysrgb&w=600");
      background-size: cover;
      background-repeat: no-repeat;
    }
  </style>
</head>
<body>
  <div class="container d-flex flex-column justify-content-center align-items-center vh-100">
    <h1 class="text-center">Welcome to Product Enquiry Management System</h1>

    <div class="card mx-auto mt-4">
      <div class="card-body">
        <p class="card-text">New User ? Click here to register</p>
        <a href="openRegister" class="btn btn-info btn-block">Register</a>
      </div>
    </div>

    <div class="card mx-auto mt-4">
      <div class="card-body">
        <p class="card-text">Existing Users Login</p>
        <a href="login" class="btn btn-info btn-block">Login</a>
      </div>
    </div>
  </div>



  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>


</html>
