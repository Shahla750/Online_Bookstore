<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:home</title>

<%@include file="allCss.jsp"%>


<style  type="text/css">
a{
text-decoration:none;
color:black;
}
a:hover{
text-decoration:none;
color:black;
}
</style>
</head>
<body >
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../Login.jsp"/>
	</c:if>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-4">
				<a href="add_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-3x text-info"></i><br>
							<h4>Add Books</h4>
							------------
						</div>
					</div>
				</a>
			</div>



			<div class="col-md-4">
			<a href="all_book.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-book-open fa-3x text-secondary"></i><br>
						<h4>All Books</h4>
						------------
					</div>
				</div>
				</a>
			</div>



			<div class="col-md-4">
			<a href="order.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-box-open fa-3x text-success"></i><br>
						<h4>Order</h4>
						------------
					</div>
				</div>
				</a>
			</div>

			
		</div>
	</div>
</body>
</html>