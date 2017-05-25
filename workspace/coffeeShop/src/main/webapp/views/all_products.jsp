<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Coffee Shop | Products</title>
<link href="css/style.css" rel="stylesheet" media="screen" />
</head>
<body>
	<div class="top-header">
		<div class="header">
			<a class="back" href="<c:url value="/secure" />"> Back</a>
			<h1 class="logo">Coffee Shop | Admin Panel</h1>
			<a class="logout" href="<c:url value="/logout" />"> Logout </a>
		</div>
	</div>


	<div class="content">
		<div class="left">
			<a class="plain-a" href="/all_products">
				<span class="link">Products</span>
			</a> <a class="plain-a" href="/getAllPersons">
				<span class="link">Persons</span>
			</a> <a class="plain-a" href="/all_orders">
				<span class="link">Orders</span>
			</a>

		</div>
		<div class="right">
			<div>
				<span class="theading">Products List for All</span>
				<button class="button">Add Product</button>
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