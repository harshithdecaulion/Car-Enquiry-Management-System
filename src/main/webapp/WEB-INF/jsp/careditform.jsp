<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!DOCTYPE html>
<html>
<head>
<title>Edit your order</title>
<style>
/* Styles for the form */
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


.container {
	max-width: 400px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
}

label {
	display: block;
	margin-bottom: 5px;
}

select, input[type="submit"] {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: #fff;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>


	<div class="container">
		<h1>Edit the car Model</h1>
		<form method="POST" action="/ProdEnquriyManagementSystem/editsave/${id}">
			<table>
				<tr>
					<td></td>
					<td><form:hidden path="id" /></td>
				</tr>
				<tr>
					<td>Name:</td>
					<td><select id="name" name="name">
							<option value="Lamborghini">Lamborghini</option>
							<option value="Pagani">Pagani</option>
							<option value="Mustang">Mustang</option>
							<option value="Ferrari">Ferrari</option>
							<option value="Rolls Royce">Rolls Royce</option>
					</select></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" value="Edit Save" /></td>
				</tr>
			</table>
	</div>


</body>
</html>

