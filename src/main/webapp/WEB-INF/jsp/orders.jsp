
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<title>Orders List</title>
<style>
body {
	background-image:
		url("https://images.pexels.com/photos/7130555/pexels-photo-7130555.jpeg?auto=compress&cs=tinysrgb&w=600");
	background-size: cover;
	background-repeat: no-repeat;
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
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

.container {
	max-width: 800px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ccc;
}

tr:hover {
	background-color: #f5f5f5;
}

.dropdown {
	margin-bottom: 10px;
	position: relative;
}

.dropdown-select {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: #fff;
	width: 100%;
	cursor: pointer;
}

.dropdown-menu {
	display: none;
	padding: 5px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
	position: absolute;
	top: 100%;
	left: 0;
	width: 100%;
	z-index: 1;
}

.dropdown-menu a {
	display: block;
	padding: 5px;
	text-decoration: none;
	color: #007bff;
}

.dropdown-menu a:hover {
	background-color: #f5f5f5;
}
</style>

</head>
<body>
	<div class="navbar">
		<a href="http://localhost:8080/ProdEnquriyManagementSystem/login">Logout</a>
		<a href="enquiryManagerHome">Go Back</a>
	</div>
	<div class="container">
		<h1>Orders List</h1>
		<div class="dropdown">
			<select class="dropdown-select" onchange="handleDropdownChange(this)">
				<option value="#" selected disabled>Filters</option>
				<option value="successfulOrders">All successful orders</option>
				<option value="revenueGeneration">Revenue Generation With
					Filters</option>

				<option value="ordersDesc">Orders Created
					(Latest[Descending based on created date])</option>
				<option value="cancelledOrders">View the cancelled Orders</option>

			</select>
			<div class="dropdown-menu">
				<a href="successfulOrders">Orders (Enquiry manager) all
					successful orders</a> <a href="revenueGeneration">Monthly revenue</a> <a
					href="ordersDesc">Orders Created (Latest[Descending based on
					created date])</a> <a href="cancelledOrders">View the cancelled
					Orders</a>
			</div>
		</div>
		<table border="2" cellpadding="2">
			<tr>
				<th>Order Id</th>
				<th>ID</th>
				<th>Status</th>
				<th>Created Date</th>
			</tr>
			<c:forEach var="order" items="${list}">
				<tr>
					<td>${order.orderId}</td>
					<td>${order.id}</td>
					<td>${order.status}</td>
					<td>${order.createdDate}</td>
				</tr>
			</c:forEach>
		</table>


	</div>

	<script>
		// Function to handle the dropdown change event
		function handleDropdownChange(select) {
			const selectedOption = select.value;
			if (selectedOption !== '#') {
				window.location.href = selectedOption;
			}
		}
	</script>
</body>
</html>
