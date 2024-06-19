<%@page import="com.entity.Book_order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderimp"%>
<%@page import="com.DAO.BookDAOimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Orders</title>

<%@include file="allCss.jsp"%>
</head>
<body>
<c:if test="${empty userobj }">
		<c:redirect url="../Login.jsp" />
	</c:if>
	<%@include file="navbar.jsp"%>

	<h3 class="text-center">Hello Admin</h3>
	<table class="table">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Ph No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment type</th>
			</tr>
		</thead>
		<tbody>
		
		<%
		BookOrderimp dao=new BookOrderimp(DBConnect.getConn());
		List<Book_order>blist=dao.getallorder();
		for(Book_order b:blist)
		{%>
		
		<tr>
				<th scope="row"><%=b.getOrderId() %></th>
				<td><%=b.getName() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFulladd() %></td>
				<td><%=b.getPhno() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				
				<td><%=b.getPaymentType() %></td>
			</tr>
		
		
			 
		<%}
		
		%>
			
			
			
		</tbody>
	</table>
	<div style="margin-top:130px;">

</body>
</html>