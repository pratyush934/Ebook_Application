<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Books</title>
<%@include file="all_component/allCSS.jsp"%>
<style type="text/css">
.back-img {
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #cce5ff;
}
</style>
</head>
<body>
<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getAllRecentBook();
			for (BookDtls b : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 100px; heigth: 150px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories :
							<%=b.getBookCategory()%></p>
						<div class="row">

							<a
								href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5"> View Details
							</a> <a href="" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign fa-2xs"></i><%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						Categories :
						<%=b.getBookCategory()%></p>
						<div class="row">
							 	<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"> <i
								class="fa-solid fa-cart-shopping"></i>Add Cart
							</a>

							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"> <i
								class="fa-solid fa-cart-shopping"></i>Add Cart
							</a>

							<%
							}
							%>
							 
								
								
								<a
								href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1"> View Details </a> <a
								href="" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign fa-2xs"></i><%=b.getPrice()%></a>
						</div>

						<%
						}
						%>

					</div>
				</div>

			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>