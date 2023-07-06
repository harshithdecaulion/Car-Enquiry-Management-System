<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>
<title>Send Quotation</title>
<style>
/* Styles for the form */
body {
	background-image:
		url("https://images.pexels.com/photos/7130555/pexels-photo-7130555.jpeg?auto=compress&cs=tinysrgb&w=600");
	background-size: cover;
	background-repeat: no-repeat;
}

margin
:
 
0
;

            
padding
:
 
0
;

            
font-family
:
 
Arial
,
sans-serif
;

            
background-color
:
 
#f2f2f2
;

        
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
	margin-top: 20px;
}

td {
	padding: 10px;
	text-align: left;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="number"] {
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

input[type="submit"] {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<div class="navbar">
		<a href="http://localhost:8080/ProdEnquriyManagementSystem/sendQuotation">Go Back</a>
	</div>
	<div class="container">
		<h1>Send Quotation</h1>
		<form method="POST" action="/ProdEnquriyManagementSystem/sendQuote">
			<table>
				<tr>
					<td></td>
					<td><input type="hidden" name="id" value="${car.id}" /></td>
				</tr>
				<tr>
					<td><label for="bill">Quotation Amount:</label></td>
					<td><input type="number" id="bill" name="bill" required  max="99999999" /></td>

				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Submit" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
