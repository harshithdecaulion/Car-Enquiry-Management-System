<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
body {
	background-image:
		url("https://images.pexels.com/photos/7130555/pexels-photo-7130555.jpeg?auto=compress&cs=tinysrgb&w=600");
	background-size: cover;
	background-repeat: no-repeat;
}

.container {
	max-width: 400px;
	margin-top: 100px;
}

.navbar {
	background-color: transparent;
	overflow: hidden;
}

.navbar a {
	float: left;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.navbar a:hover {
	background-color: #111;
	color: white;
}

.card {
	background-color: #f8f9fa;
}

.error-message {
	color: red;
	margin-bottom: 10px;
}

.success-message {
	color: green;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="navbar" text>
		<a href="http://localhost:8080/ProdEnquriyManagementSystem/">Home</a>

	</div>

	<div class="container">
		<div class="card">
			<div class="card-body">
				<h3 class="card-title text-center">Login with Username and
					Password</h3>
				<c:if test="${not empty error}">
					<div class="error-message">${error}</div>
				</c:if>

				<form action="login" method="post">
					<div class="form-group">
						<label for="email">Email Id:</label> <input type="text" id="email"
							name="email" class="form-control"
							pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" required>
					</div>

					<div class="form-group">
						<label for="password">Password:</label> <input type="password"
							id="password" name="password" class="form-control" required>
					</div>

					<div class="form-group text-center">
						<input type="submit" value="Login" class="btn btn-info">
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
























