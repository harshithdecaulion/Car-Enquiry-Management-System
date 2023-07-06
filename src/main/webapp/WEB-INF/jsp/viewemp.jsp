    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

	<h1>Enquiry List</h1>
	<table border="2" width="70%" cellpadding="2">
	<tr><th>Id</th><th>Model of the car</th><th>City</th><th>Email</th><th>Edit</th><th>Delete</th></tr>
    <c:forEach var="car" items="${list}"> 
    <tr>
    <td>${car.id}</td>
    <td>${car.name}</td>
    <td>${car.city}</td>
    <td>${car.emailId}</td>
    <td><a href="editemp/${car.id}">Edit order</a></td>
    <td><a href="deleteemp/${car.id}">Delete Order</a></td>
    <td><a href="carPlaceOrder/${car.id}">Place Order</a></td>
    
    </tr>
    </c:forEach>
    </table>
    <br/>
    <a href="empform">Add a new Enquiry</a>
        <a href="carQuotations">view Quotations</a>