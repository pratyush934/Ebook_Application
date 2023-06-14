<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/allCSS.jsp"%>
<style type="text/css">
a {
	text-decoration: none; color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #fcf7f7">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">

		<h3 class="text-center">Hello, ${userobj.name}</h3>

		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h3>Sell Old Books</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-regular fa-pen-to-square fa-3x"></i>
							</div>
							<h3>Edit Old Books</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-sharp fa-solid fa-shield-halved fa-3x"></i>
							</div>
							<h3>Edit Profile</h3>
						</div>
					</div>
				</a>
			</div>
			
			
			<div class="col-md-6 mt-3 p-4">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h3>My Order</h3>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3 p-4">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-handshake-angle fa-3x"></i>
							</div>
							<h3>Help Center</h3>
							<p>24 x 7</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<br>
	<br>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>