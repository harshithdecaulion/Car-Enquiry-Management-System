<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
body {
	background-image:
		url("https://images.pexels.com/photos/7130555/pexels-photo-7130555.jpeg?auto=compress&cs=tinysrgb&w=600");
	background-size: cover;
	background-repeat: no-repeat;
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
</style>
</head>
<body>
	<div class="navbar">
		<a href="http://localhost:8080/ProdEnquriyManagementSystem/">Home</a>
	</div>

	<div
		class="container d-flex justify-content-center align-items-center vh-75">
		<div class="card">
			<div class="card-body">
				<form action="register" method="post">
					<h2 class="text-center mb-4">Register</h2>
					<p class="text-center text-muted">Create your account. It's
						free and only takes a minute.</p>

					<%-- <c:if test="${not empty successMessage}">
						<div class="alert alert-success" role="alert">
							${successMessage}</div>
					</c:if> --%>

					<div class="mb-3">
						<label for="userName" class="form-label">Name:</label> <input
							type="text" id="userName" name="userName" class="form-control"
							required>
					</div>

					<div class="mb-3">
						<label for="email" class="form-label">Email:</label> <input
							type="text" id="email" name="email"
							pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
							class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="password" class="form-label">Password:</label> <input
							type="password" id="password" name="password"
							pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
							title="Please enter at least 8 alphanumeric characters."
							class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="confirm-password" class="form-label">Confirm
							Password:</label> <input type="password" id="confirm-password"
							name="confirm-password"
							title="Please enter at least 8 alphanumeric characters."
							class="form-control" required>
					</div>

					<div class="form-group">
						<button type="submit" class="btn btn-success btn-lg btn-block">Register
							Now</button>
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

























































































