
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>
<title>Quotations</title>
<style>
/* Styles for the quotations */
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

.quotation {
	padding: 10px;
	margin-bottom: 20px;
	border-radius: 5px;
}

.quotation:nth-child(odd) {
	background-color: #f9f9f9;
}

.quotation:nth-child(even) {
	background-color: #ececec;
}

.quotation p {
	margin: 0;
	padding: 5px 0;
}
</style>
</head>
<body>
	
	<center>
		<h1>Quotations</h1>
	</center>
	<div class="container">
		<c:forEach var="quotations" items="${quotations}">
			<div class="quotation">
				<p>Quotation ID: ${quotations.qid}</p>
				<p>Car ID: ${quotations.id}</p>
				<p>Car Name: ${quotations.name}</p>
				<p>Bill Amount: ${quotations.bill}</p>
				
			</div>
		</c:forEach>
	</div>
</body>
</html>
