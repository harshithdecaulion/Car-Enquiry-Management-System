<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
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
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ccc;
}

tr:hover {
	background-color: #f5f5f5;
}

.highlight {
	background-color: #f5f5f5;
}
</style>
</head>
<body>
	<div class="navbar">
		<a href="orders">Go Back</a>
	</div>
	<div class="container">
	
      <h1>Quarterly Revenue for ${carName}</h1>
        <table>
            <tr>
                <th>Year</th>
                <th>Quarter</th>
                <th>Revenue</th>
            </tr>
            <c:forEach items="${totalBillAmountQuarterlyByCar}" var="billAmountQuarterly">
                <tr>
                    <td>${billAmountQuarterly.year}</td>
                    <td>${billAmountQuarterly.quarter}</td>
                    <td>${billAmountQuarterly.totalRevenue}</td>
                </tr>
            </c:forEach>
        </table>
  <hr>
    <p>Enter Car Name to get Revenue Generated By particular Model</p>
<form action="/ProdEnquriyManagementSystem/quarterlyRevenueByCar" method="get">
        <label for="carName">Car Name:</label>
        <input type="text" id="carName" name="carName">
        <button type="submit">Generate Revenue</button>
    </form>
	</div>
</body>
</html>
