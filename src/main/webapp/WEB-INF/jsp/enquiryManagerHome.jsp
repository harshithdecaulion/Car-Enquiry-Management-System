<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function preventBack() {
		window.history.forward();
	}
	setTimeout("preventBack()", 10);
	window.onunload = function() {
		null
	};
</script>
<style>
body {
	background-image: url("https://images.pexels.com/photos/7130555/pexels-photo-7130555.jpeg?auto=compress&cs=tinysrgb&w=600");
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

.container {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: center;
	align-items: center;
	margin-top: 50px;
}

.card {
	background-color: #f2f2f2;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	width: 300px;
	text-align: center;
}

.card a {
	color: #333;
	text-decoration: none;
	font-size: 20px;
}
</style>
</head>
<body>
<div class="navbar">
	<a href="http://localhost:8080/ProdEnquriyManagementSystem/login">Logout</a>
	<center><h1>Welcome Admin</h1></center>
</div>
<div class="container">
	<div class="card">
		<a href="orders">Orders and Order Actions</a>
	</div>
	<div class="card">
		<a href="sendQuotation">Send quotation</a>
	</div>
</div>
</body>
</html>

