<!-- Create an index.jsp file... -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

<title>Insert title here</title>
</head>
<body>

	<!-- ...with a table... -->
	
	<div class="container">
		<h1>Burger Tracker</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Burger Name</th>
					<th>Restaurant Name</th>
					<th>Rating (out of 5)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="burger" items="${burgers}">
				<tr>
					<td><c:out value="${burger.name}"/></td>
					<td><c:out value="${burger.restaurantName}"/></td>
					<td><c:out value="${burger.rating}"/></td>
				</tr>				
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- ...and form -->
	
	<div class="container">
		<h2>Add a Burger: </h2>

<!-- ...add model Attribute... -->

		<form:form class="form" action="/" method="post" modelAttribute="burger">
			<div class="form-group">
			
			<!-- ...include path attribute. -->
			
				<form:label path="name">Burger Name</form:label>
				
				<!-- ...add error tags... -->
				
				<form:errors class="text-danger" path="name"/>
				<form:input class="form-control" type="text" path="name"/>
			</div>
			<div class="form-group">
				<form:label path="restaurantName">Restaurant Name</form:label>
				<form:errors class="text-danger" path="restaurantName"/>
				<form:input class="form-control" type="text" path="restaurantName"/>
			</div>
			<div class="form-group">
				<form:label path="rating">Rating</form:label>
				<form:errors class="text-danger" path="rating"/>
				<form:input class="form-control" type="number" path="rating"/>
			</div>
			<div class="form-group">
				<form:label path="notes">Notes</form:label>
				<form:errors class="text-danger" path="notes"/>
				<form:textarea class="form-control" rows="4" cols="50" path="notes"/>
			</div>
			<input class="btn btn-primary" type="submit" value="Submit"/>
		</form:form>
	</div>
</body>
</html>