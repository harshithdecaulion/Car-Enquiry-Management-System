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
.card {
	display: inline-block;
	width: 235px;
	height: 200px;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 20px;
	margin: 10px;
	text-align: center;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card img {
	max-width: 102%;
	height: 200px;
	object-fit: cover;
	border-radius: 5px;
	margin-bottom: 10px;
}

.form-container {
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 20px;
	margin-top: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.form-container table {
	width: 25%;
}

.form-container td {
	padding: 10px;
}

.form-container input[type="submit"] {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
</style>

</head>
<body>
<div class="navbar">
        <a href="http://localhost:8080/ProdEnquriyManagementSystem/login">Logout</a>
    </div>
	<center>
		<h1>Enquire now</h1>
	</center>
	<div class="card">
		<img
			src="https://th.bing.com/th/id/OIP.0HmUrIJOfVCVxFaGIkS-bQHaE7?w=277&h=184&c=7&r=0&o=5&dpr=1.3&pid=1.7"
			alt="Car 1">
		<h3>LAMBORGHINI</h3>
	</div>
	<div class="card">
		<img
			src="https://th.bing.com/th/id/OIP.JHlTgMRXwWMwAoI5xqMLYwHaEo?w=275&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"
			alt="Car 2">
		<h3>PAGANI</h3>
	</div>
	<div class="card">
		<img
			src="https://th.bing.com/th/id/OIP.Y9CBds8gYFj1Vj72STHTdwHaFj?w=240&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"
			alt="Car 3">
		<h3>MUSTANG</h3>
	</div>
	<div class="card">
		<img
			src="https://th.bing.com/th/id/OIP.64aQD8n4PgBZn6QD3b8BnwHaEK?w=297&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"
			alt="Car 4">
		<h3>FERRARI</h3>
	</div>
	<div class="card">
		<img
			src="https://th.bing.com/th/id/OIP.cK_SzN2aCSMV8EmCjy8AMQHaE7?w=242&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"
			alt="Car 5">
		<h3>ROLLS ROYCE</h3>
	</div>
	<div class="form-container">
		<form method="post" action="addCar">
			<table>
				<tr>
					<td>Choose your car</td>
					<td><select id="name" name="name" required="required">
												<option value="#" selected disabled>Choose the desired Model</option>
							<option value="Lamborghini">Lamborghini</option>
							<option value="Pagani">Pagani</option>
							<option value="Mustang">Mustang</option>
							<option value="Ferrari">Ferrari</option>
							<option value="Rolce Royce">Rolls Royce</option>
					</select><br> <br></td>
				</tr>
				<tr>
					<td>Choose your city</td>
					<td><select id="city" name="city" required="required">
							<option value="">Choose Your City</option>
							<option value="Bangalore">Bangalore</option>
							<option value="Mumbai">Mumbai</option>
							<option value="Chennai">Chennai</option>
							<option value="Hyderabad">Hyderabad</option>
							<option value="Ahmedabad">Ahmedabad</option>
					</select></td>
				</tr>
				<tr>
					<td>Enter your email ID</td>
					<td><input type="text" name="emailId" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" required="required"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Save"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>










































