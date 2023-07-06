<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
    <title>Order Actions</title>
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

        input[type="text"],
        select,
        input[type="date"],
        input[type="submit"] {
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
<div class="navbar">
		<a href="http://localhost:8080/ProdEnquriyManagementSystem/viewEnqCust">Go back to Enquiries</a>
	</div>
    <div class="container">
        <h1>Order Actions</h1>
        <form method="POST" action="/ProdEnquriyManagementSystem/confirmOrder">
            <table>
                <tr>
                    <td>ID:</td>
                    <td><input type="text" name="id" value="${car.id}" readonly="true" /></td>
                </tr>
                <tr>
                    <td>Status:</td>
                    <td>
                        <select name="status" required>
                            <option value="confirm">Confirm</option>
                            <option value="cancel">Cancel</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Date:</td>
                    <td><input type="date" name="createdDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required></td>
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
