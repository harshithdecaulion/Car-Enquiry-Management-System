

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



</style>
</head>
<body>
	<div class="navbar">
		<a href="login">Logout</a>
	</div>


	<br>
	<div class="container">
		<h1 class="text-center">Your orders</h1>


		<div class="table-container">
			<table class="table table-striped">
				<thead class="thead-dark">
					 <tr>
            <th>Order ID</th>
            <th>Status</th>
            <th>Created Date</th>
            <th>Bill</th>
        </tr>
				</thead>
				<tbody>
					<c:forEach items="${confirmedOrders}" var="order">
            <tr>
                <td>${order.orderId}</td>
                <td>${order.status}</td>
                <td>${order.createdDate}</td>
                <td>${order.bill}</td>
            </tr>
        </c:forEach>
				</tbody>
			</table>
		</div>

		
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>







































