    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
    <title>Confirmed Orders</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
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
<div class="container">
    <h1>Confirmed Orders In Descending Order</h1>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Status</th>
            <th>Created Date</th>
            <th>Bill</th>
        </tr>
        <c:forEach var="order" items="${list}">
            <tr>
                <td>${order.id}</td>
                <td>${order.status}</td>
                <td>${order.createdDate}</td>
                <td>${order.bill}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
