<%@page import="com.entity.Book_Dlts"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All Books</title>

<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../Login.jsp" />
	</c:if>

	<h3 class="text-center">Hello Admin</h3>
	<c:if test="${not empty sucmsg }">
		<h5 class="text-center text-success">${sucmsg }</h5>
		<c:remove var="sucmsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedmsg }">
		<h5 class="text-center text-danger">${failedmsg }</h5>
		<c:remove var="failedmsg" scope="session" />
	</c:if>
	<table class="table">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>


			<%
			BookDAOimp dao = new BookDAOimp(DBConnect.getConn());
			List<Book_Dlts> list = dao.getAllbooks();
			for (Book_Dlts b : list) {
			%>
			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td>
				
				<a href="edit_book.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary">Edit</a>
				
				
					 <a
					href="../delete?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-danger">Delete</a></td>
			</tr>


			<%
			}
			%>




		</tbody>
	</table>
	<div style="margin-top: 130px;">
		
</body>
</html>