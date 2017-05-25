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
<link href="/css/style.css" rel="stylesheet" media="screen"/>
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
				<span class="theading">Edit Product</span>
			</div>

			<div>
				<form action="/editProduct" method="post">
					<div>
						<span>Product Name</span>
						<input type="text" class="text-input" name="productName" value="${product.productName}">
					</div>
					<div>
						<span>Product Description</span>
						<input type="text" class="text-input" name="description" value="${product.description}">
					</div>
					<div>
						<span>Product Price</span>
						<input type="text" class="text-input" name="price" value="${product.price}">
					</div>
					<div>
						<span>Product Type</span>
						<select class="select-input" name="productType">
						  <option value="${product.productType}">${product.productType}</option>
						  <option value="BREAKFAST">BREAKFAST</option>
						  <option value="LUNCH">LUNCH</option>
						  <option value="DINNER">DINNER</option>
						</select>
					</div>
					<div>
						<input type="submit" class="button-green" value="Edit">
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="id" value="${product.id}">
				</form>
			</div>
		</div>
	</div>

	<div class="footer">Copyright @2017 by Cleave Masereka</div>


</body>
</html>