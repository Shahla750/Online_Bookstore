<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting Page</title>


<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
a{
text-decoration:nnone;
color:black;
}
a:hover{
text-decoration:none;
}
</style>
</head>
<body style="background-color: #f7f7f7;">

<c:if test="${empty userobj }" >
<c:redirect url="Login.jsp"/>
</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		
<c:if test="${ not empty userobj }" >
<h3 class="text-center">Hello,${userobj.name}</h3>
</c:if>
		<div class="row">
			<div class="col-md-4">
				<a href="sell.jsp">

					<div class="card">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fa fa-book fa-3x" ></i>

							</div>
							<h4>Sell old Book</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="Old_book.jsp">

					<div class="card">
						<div class="card-body text-center">
							<div class="text-info">
								<i class="fa fa-book-open fa-3x" ></i>

							</div>
							<h4> Old Books</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="edit_profile.jsp">

					<div class="card center">
						<div class="card-body text-center">
							<div class="text-secondary">
								<i class="fas fa-user-pen fa-3x" ></i>

							</div>
							<h4>Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-2">
				<a href="order.jsp">

					<div class="card">
						<div class="card-body text-center ">
							<div class="text-danger">
								<i class="fa fa-box-open fa-3x" ></i>

							</div>
							<h4>My Order</h4>
							<p>Track Your Order</p>
						</div>
					</div>
					
				</a>
			</div>
			
		</div>
	</div>

</body>
</html>