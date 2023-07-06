    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
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
        .dropdown {
	margin-bottom: 10px;
	position: relative;
}

.dropdown-select {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: #fff;
	width: 100%;
	cursor: pointer;
}

.dropdown-menu {
	display: none;
	padding: 5px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
	position: absolute;
	top: 100%;
	left: 0;
	width: 100%;
	z-index: 1;
}

.dropdown-menu a {
	display: block;
	padding: 5px;
	text-decoration: none;
	color: #007bff;
}

.dropdown-menu a:hover {
	background-color: #f5f5f5;
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
<body><div class="navbar">
        <a href="orders">Go Back</a>
    </div>
    <div class="container">
     <hr>
  
    
    
        <h1>Confirmed Order with Quotations</h1>
          <div class="dropdown">
			<select class="dropdown-select" onchange="handleDropdownChange(this)">
				<option value="#" selected disabled>Sort By</option>
				<option value="successfullordersDatesAsc">Sorted By Ascending</option>
				<option value="successfullordersDatesDesc">Sorted By descending</option>
			
				
			</select>
			 <div class="dropdown-menu">
				 <a href="successfullordersDatesAsc">Sorted By Ascending</a> 
				 <a href="successfullordersDatesDesc">Sorted By descending</a> 
					
			</div> 
		</div>
    <table>
    
    
        <tr>
        <th> ID</th>
            <th>Order ID</th>
            <th>Status</th>
            <th>Created Date</th>
            <th>Bill</th>
        </tr>
        <c:forEach items="${confirmedOrderQuotations}" var="orderQuotation">
            <tr>
                <td>${orderQuotation.id}</td>
                <td>${orderQuotation.orderId}</td>
                <td>${orderQuotation.status}</td>
                <td>${orderQuotation.createdDate}</td>
                <td>${orderQuotation.bill}</td>
            </tr>	
        </c:forEach>
    </table>
  
     <hr>
    

    </div>
    <script>
		// Function to handle the dropdown change event
		function handleDropdownChange(select) {
			const selectedOption = select.value;
			if (selectedOption !== '#') {
				window.location.href = selectedOption;
			}
		}
	</script>
</body>
</html>
  
