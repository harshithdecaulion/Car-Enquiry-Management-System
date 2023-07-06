
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
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
/* Styles for the container */
.container {
	max-width: 800px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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

/* Styles for the table */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ccc;
}

tr:hover {
	background-color: #f5f5f5;
}
</style>
</head>
<body>
	<div class="navbar">
		<a
			href="http://localhost:8080/ProdEnquriyManagementSystem/enquiryManagerHome">Go
			Back</a>
	</div>
	<div class="container">
		<%-- <form action="/ProdEnquriyManagementSystem/search" method="GET">

			<label for="searchOption">Search Option:</label> <br> <select
				name="searchOption" id="searchOption">

				<option value="id" selected>Search by Id</option>

				<option value="name">Search By  Name</option>

			</select> <br> <br> <label for="searchCriteria">Search
				Criteria:</label> <br> <input type="text" name="searchCriteria"
				id="searchCriteria"> <br> <br>

			<button type="submit">Search</button>

		</form> --%>
		<h1>Search Results</h1>
		<table>
        <tr>
            <th>Id</th>
            <th>Model of the car</th>
            <th>City</th>
            <th>Email</th>
            <th>Send Quotation</th>
        </tr>
        <c:if test="${car != null}">
            <tr>
                <td>${car.id}</td>
                <td>${car.name}</td>
                <td>${car.city}</td>
                <td>${car.emailId}</td>
                <td><a href="sendQuoteToCustomer/${car.id}">Send Quotation</a></td>
            </tr>
        </c:if>
    </table>
	</div>
</body>
</html>

   <%--  <table>
        <tr>
            <th>Id</th>
            <th>Model of the car</th>
            <th>City</th>
            <th>Email</th>
            <th>Send Quotation</th>
        </tr>
        <c:if test="${car != null}">
            <tr>
                <td>${car.id}</td>
                <td>${car.name}</td>
                <td>${car.city}</td>
                <td>${car.emailId}</td>
                <td><a href="sendQuoteToCustomer/${car.id}">Send Quotation</a></td>
            </tr>
        </c:if>
    </table> --%>

