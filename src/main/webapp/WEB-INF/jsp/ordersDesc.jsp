
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Place this script in the <head> or at the end of the <body> tag -->




<!DOCTYPE html>
<html>
<head>
<title>Orders List</title>
<style>
/* Styles for the table and dropdown */
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
		<h1>Orders Created Latest (Descending Order of Created Date)</h1>
	
		<table border="2" cellpadding="2">
			<tr>
				<th>Id</th>
				<th>Order ID</th>
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

	
</body>
</html>
