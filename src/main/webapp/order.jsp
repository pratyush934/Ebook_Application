<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<%@include file="all_component/allCSS.jsp"%>
</head>
<body style="background-color: #fcf7f7">


	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-1">
		<h3 class="text-center text-primary">Your Order</h3>
		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">OrderId</th>
					<th scope="col">Name</th>
					<th scope="col">BookName</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u = (User) session.getAttribute("userobj");
				BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
				List<Book_Order> blist = dao.getBook(u.getEmail());
				for (Book_Order b : blist) {
				%>

				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUsername()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
				</tr>

				<%
				}
				%>



			</tbody>
		</table>
	</div>
</body>
</html>