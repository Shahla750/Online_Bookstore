<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5 >Registration</h5>
						</div>
						<c:if test="${not empty sucmsg}">
							<p class="text-center text-success">${sucmsg}</p>
							<c:remove var="sucmsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedmsg}">
							<p class="text-center text-danger">${failedmsg}</p>
							<c:remove var="failedmsg" scope="session" />
						</c:if>
						<form action="RegisterServlet" method="post">
							<div class="form-group">
								<label>Enter Full Name</label>
								<input type="text" required="required" class="form-control"
									id="exampleInputEmail" aria-describedby="emailHelp" name="fname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label>
								<input type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No.</label>
								<input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="phno">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label>
								<input type="password" class="form-control" id="exampleInputPassword1"
									name="passward">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1">
								<label class="form-check-label" for="exampleCheck1">Agree terms & Condition</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
