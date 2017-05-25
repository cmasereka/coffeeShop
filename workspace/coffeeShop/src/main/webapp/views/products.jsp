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
<style>
	body {
	margin: 0px !important;
}

.top-header {
	background: lightgrey;
	width: 100%;
	position: fixed;
	top: 0px;
}

.header {
	text-align: center;
	width: 80%;
	margin: auto;
}

.back {
	float: left;
	margin: 30px 0px;
}

.logo {
	display: inline-block;
	color: green;
}

.logout {
	float: right;
	margin: 30px 0px;
}

.content {
	width: 80%;
	margin: 110px auto;
	overflow: auto;
}

.right {
	display: inline-block;
	width: 95%;
	float: right;
	padding: 20px;
	border: solid gray 1.2px;
	border-radius: 5px;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #4CAF50;
	color: white;
}

tr:hover {
	background-color: #f5f5f5
}

.theading {
	font-size: 25px;
}

.button {
	display: inline-block;
	padding: 10px 15px;
	font-size: 20px;
	cursor: pointer;
	text-align: center;
	color: #fff;
	background-color: #4CAF50;
	border: none;
	border-radius: 5px;
	box-shadow: 0 5px #999;
	float: right;
	margin: 0px 0px 15px;
}

.button:hover {
	background-color: #3e8e41
}

.button:active {
	background-color: #3e8e41;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}

.link {
	background: #bbb7b7;
	padding: 10px;
	border-radius: 4px;
	margin: 2px;
}

.plain-a {
	text-decoration: none;
}

.footer {
	background: #4CAF50;
	width: 100%;
	position: fixed;
	bottom: 0px;
	text-align: -webkit-center;
}
</style>
</head>
<body>

	<div class="top-header">
		<div class="header">
			<a class="back" href="<c:url value="/home" />">Back Home</a>
			<h1 class="logo">Coffee Shop | Visitor Panel</h1>
		</div>
	</div>
	<div class="content">
		<div class="right">
			<div>
				<span class="theading">List of All Products</span>
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


