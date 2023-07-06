<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
 
<title>Your Enquires</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
body {
	padding: 20px;
	background-image:
		url("https://images.pexels.com/photos/7130555/pexels-photo-7130555.jpeg?auto=compress&cs=tinysrgb&w=600");
	background-size: cover;
	background-repeat: no-repeat;
}

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

h1 {
	margin-bottom: 30px;
}

.table-container {
	overflow-x: auto;
}
form {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
}

select, input[type="text"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}
table {
	width: 100%;
	white-space: nowrap;
}

th, td {
	padding: 10px;
	text-align: center;
}

a {
	margin-right: 10px;
}

.message-container {
  position: relative;
  width: 100%;
  height: 50px;
  overflow: hidden;
}

.message {
  position: absolute;
  top: 0;
  left: 0;
  animation: moveMessage 12s linear infinite;
}

@keyframes moveMessage {
  0% { left: -100%; }
  100% { left: 100%; }
}

</style>
</head>
<body>
	<div class="navbar">
		<a href="login">Logout</a>
	</div>
<div class="message-container">
  <div class="message">Please do place the order after
		getting quotation in the given email ID, Thank you</div>
</div>

	<br>
	<div class="container">
		<h1 class="text-center">Your Enquires</h1>


		<div class="table-container">
			<table class="table table-striped">
				<thead class="thead-dark">
					<tr>
						<th>Enquiry ID</th>
						<th>Car Name</th>
						<th>Email</th>
						<th>Edit Order</th>
						<th>Delete Order</th>
						<th>Place Order</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="enquiry" items="${enquiries}">
						<tr>
							<td>${enquiry.id}</td>
							<td>${enquiry.name}</td>
							<td>${enquiry.emailId}</td>
							<td><a href="editcar/${enquiry.id}" class="btn btn-info">Edit</a></td>
							<td><a href="delete/${enquiry.id}" class="btn btn-warning">Delete</a></td>
							 <td><a href="carPlaceOrder/${enquiry.id}"
								class="btn btn-primary">Place Order</a></td>
						 

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="text-right">
			<a href="viewform" class="btn btn-outline-secondary">Add a new
				Enquiry</a> <a href="carQuotations/${userId}"
				class="btn btn-outline-secondary">View Quotations</a> <a
				href="customerOrders" class="btn btn-outline-secondary">View
				Orders</a>

		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>







































