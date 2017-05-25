<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Coffee Shop | Admin</title>
<link href="css/style.css" rel="stylesheet" media="screen"/>
</head>
<body>

	<div class="top-header">
		<div class="header">
			<a class="back" href="<c:url value="#" />"> Home</a>
			<h1 class="logo">Coffee Shop | Admin Panel</h1>
			<a class="logout" href="<c:url value="/logout" />"> Logout </a>
		</div>
	</div>
	<div class="content">
		<div class="left">
			<a class="plain-a" href="/secure">
				<span class="link">Products</span>
			</a> <a class="plain-a" href="/getAllPersons">
				<span class="link">Persons</span>
				<span class="link">Orders</span>
			</a>

		</div>
		<div class="right">
			<div>
				<span class="theading">All Persons</span>
				<a href="/addPerson"><button class="button">Add a new Person</button></a>
			</div>

			<div>
				<table class="table">
					<thead>
						<tr>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Enabled</th>
							<th>Address</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="person" items="${persons}">
							<tr>
								<td><c:out value="${person.firstName}" /></td>
								<td><c:out value="${person.lastName}" /></td>
								<td><c:out value="${person.email}" /></td>
								<td><c:out value="${person.phone}" /></td>
								<td><c:out value="${person.enable}" /></td>
								<td>Address --- here</td>
								<td>
									<a href="/editPerson/${person.id}"><button>Edit</button></a>
									<%-- <a href="/deletePerson/${person.id}"><button>Delete</button></a> --%>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="footer">Copyright @2017 by Cleave Masereka</div>


</body>
</html>