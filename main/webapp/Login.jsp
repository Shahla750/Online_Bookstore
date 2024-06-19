<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>


	<div class="container-fluid">
		<div class="row p-4">

			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class=" fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h3 class="text-black">Login Page</h3>
							
							
							<c:if  test="${not empty failedmsg }"  >
							<h5 class="text-center text-danger">${failedmsg }</h5>
							<c:remove var="failedmsg" scope="session"/>
							</c:if>
							
							<c:if  test="${not empty sucmsg }"  >
							<h5 class="text-center text-success">${sucmsg }</h5>
							<c:remove var="sucmsg" scope="session"/>
							</c:if>
						</div>
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="passward">
							</div>

							<div class="text-center">

								<button type="submit" class="btn btn-primary">Login</button>
								<br /> <a href="Register.jsp">Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>