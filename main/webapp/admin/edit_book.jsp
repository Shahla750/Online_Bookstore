<%@page import="com.entity.Book_Dlts"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Edit Books</title>

<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">


	<%@include file="navbar.jsp"%>



	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">

							<h5>Edit Books</h5>
						</div>
						

						<%
						int id=Integer.parseInt(request.getParameter("id"));
						BookDAOimp dao=new BookDAOimp(DBConnect.getConn());
						Book_Dlts b=dao.getBookById(id);
						%>


						<form action="../editbook" method="post">
						
						
						<input type="hidden" name="id" value="<%=b.getBookId() %>">
							<div class="form-group">
								<label>Book Name</label> <input type="text" required="required"
									class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="bname"
									value="<%=b.getBookname()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="author"
									value="<%=b.getAuthor()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="price"
									value="<%=b.getPrice()%>">
							</div>
		
					<div class="form-group">
						<label for="inputState">Book Status</label>
						 <select
							class="form-control" id="inputState" name="bstatus">
							<%
							if ("Active".equals(b.getStatus())) {
							%>

							<option value="active">Active</option>
							<option value="inactive">Inactive</option>
							<%
							} else {
							%>
							<option value="active">Active</option>
							<option value="inactive">Inactive</option>
							<%
							}
							%>



						</select>


					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary ">Update</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>