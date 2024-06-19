<%@page import="com.entity.Book_Dlts"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimp"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Books</title>

<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${not empty sucmsg}">
		<p class="text-center text-success">${sucmsg}</p>
		<c:remove var="sucmsg" scope="session" />
	</c:if>

	<div class="container p-5">
		<table class="table">
			<thead class="bg-dark text-white">
				<tr>
					<th scope="col">Book</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>


				<%
				User u = (User)session.getAttribute("userobj");
				String email = u.getEmail();
				BookDAOimp dao = new BookDAOimp(DBConnect.getConn());
				List<Book_Dlts> list = dao.getBookbyOld(email,"Old");
				for (Book_Dlts b: list) {
				%>
				<tr>

					<td><%=b.getBookname()%></td>
					<td><%=b.getAuthor()%></td>

					<td><%=b.getPrice()%></td>

					<td><%=b.getBookCategory()%></td>

					<td><a
						href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>


				<%
				}
				%>





			</tbody>
		</table>
	</div>
</body>
</html>