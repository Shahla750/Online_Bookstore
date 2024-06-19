<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card">
					<div class="card-body ">
						<h5 class="text-center text-dark p-1">Edit Profile</h5>
						
						<c:if  test="${not empty failedmsg }"  >
							<h5 class="text-center text-danger">${failedmsg }</h5>
							<c:remove var="failedmsg" scope="session"/>
							</c:if>
							
							<c:if  test="${not empty sucmsg }"  >
							<h5 class="text-center text-success">${sucmsg }</h5>
							<c:remove var="sucmsg" scope="session"/>
							</c:if>


						<form action="updateProfile" method="post">
						<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									required="required" class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="fname" value="${userobj.name }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" value="${userobj.email }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No.</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="phno" value="${userobj.phno }">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="passward">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>







	<%@ include file="all_component/footer.jsp"%>
</body>
</html>