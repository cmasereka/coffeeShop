<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Coffee Shop</title>
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
	.logo {
		display: inline-block;
		color: green;
	}
	
	.content {
		width: 50%;
		margin: 110px auto;
		overflow: auto;
	}
	
	.left {
		display: inline-block;
		width: 20%;
		float: left;
		padding: 20px;
		border: solid green 1.5px;
		border-radius: 5px;
		background-color: rgba(208, 204, 204, 0.48);
	}
	.link {
		background: #bbb7b7;
		padding: 10px;
		border-radius: 4px;
		margin: 2px;
		text-align: center;
		display: block;
    	font-size: 25px;
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
	
	.welcome{
		    text-align: center;
	}
</style>
</head>
<body>

	<div class="top-header">
		<div class="header">
			<h1 class="logo">Coffee Shop | Admin Panel</h1>
		</div>
	</div>

	<div class="content">
		<h1 class="welcome">Welcome to our Coffee Shop</h1>
		<div class="left-welcome">
			<a class="plain-a" href="<c:url value="/secure" />">
				<span class="link">Admin Login</span>
			</a> <a class="plain-a" href="<c:url value="/visitor" />">
				<span class="link">User Login</span>
			</a> 
			<a class="plain-a" href="<c:url value="/products" />">
				<span class="link">List of Products</span>
			</a>
		</div>
	</div>
	<div class="footer">Copyright @2017 by Cleave Masereka</div>
</body>
</html>