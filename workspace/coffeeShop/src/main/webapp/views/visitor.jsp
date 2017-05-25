<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Coffee Shop | Ueer</title>
<link href="css/style.css" rel="stylesheet" media="screen"/>
</head>
<body>

	<div class="top-header">
		<div class="header">
			<a class="back" href="<c:url value="#" />"> Logged in as:</a>
			<h1 class="logo">Coffee Shop | Visitor Panel</h1>
			<a class="logout" href="<c:url value="/logout" />"> Logout </a>
		</div>
	</div>
	<div class="content">
		<div class="left">
			<a class="plain-a" href="/visitor">
				<span class="link">Products</span>
			</a> <a class="plain-a" href="/getAllPersons">
				<span class="link">Update Profile</span>
			</a> <a class="plain-a" href="/all_orders">
				<span class="link">Place Orders</span>
			</a>

		</div>
		<div class="right">
			<div>
				<span class="theading">Products List for All</span>
			</div>

			<div>
				<table class="table">
					<thead>
						<tr>
							<th>Product Name</th>
							<th>Description</th>
							<th>Price</th>
							<th>Product Type</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${products}">
							<tr>
								<td><c:out value="${product.productName}" /></td>
								<td><c:out value="${product.description}" /></td>
								<td><c:out value="${product.price}" /></td>
								<td><c:out value="${product.productType}" /></td>
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