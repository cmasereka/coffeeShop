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
			</a> <a class="plain-a" href="/all_orders">
				<span class="link">Orders</span>
			</a>

		</div>
		<div class="right">
			<div>
				<span class="theading">Add New Person</span>
			</div>

			<div>
				<form action="/addPerson" method="post">
					<div>
						<span>First Name</span>
						<input type="text" class="text-input" name="firstName">
					</div>
					<div>
						<span>Last Name</span>
						<input type="text" class="text-input" name="lastName">
					</div>
					<div>
						<span>Email</span>
						<input type="text" class="text-input" name="email">
					</div>
					<div>
						<span>Phone</span>
						<input type="text" class="text-input" name="phone">
					</div>
					<div>
						<span>Enabled</span>
						<select class="select-input" name="enabled">
						  <option value="Select Option">Select Option</option>
						  <option value="true">true</option>
						  <option value="false">false</option>
						</select>
					</div>
					<div>
						<input type="submit" class="button-green" value="Save">
						<input type="reset" class="button-red" value="Reset">
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</div>

	<div class="footer">Copyright @2017 by Cleave Masereka</div>


</body>
</html>