<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Add Books</title>

<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">


	<%@include file="navbar.jsp"%>

<c:if test="${empty userobj }">
	<c:redirect url="../Login.jsp"/>
	</c:if>

	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							
							<h5>Add Books</h5>
						</div>
						<c:if test="${not empty sucmsg}">
							<p class="text-center text-success">${sucmsg}</p>
							<c:remove var="sucmsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedmsg}">
							<p class="text-center text-danger">${failedmsg}</p>
							<c:remove var="failedmsg" scope="session" />
						</c:if>

						<form action="../add_book" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label>Book Name</label> <input type="text" required="required"
									class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="bname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="author">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="price">
							</div>
							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									class="form-control" id="inputState" name="btype">
									<option selected>----Select----</option>
									<option value="new">New Book</option>
									
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									class="form-control" id="inputState" name="bstatus">
									<option selected>----Select----</option>
									<option value="active">Active</option>
									<option value="inactive">Inactive</option>
									
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Upload Photo</label> <input
									type="file" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="bimg">
							
					</div>
					
					<div class="text-center">
						<button type="submit" class="btn btn-primary ">Add</button>
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