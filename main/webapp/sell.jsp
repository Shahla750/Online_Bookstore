<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>


<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">

<%@include file="all_component/navbar.jsp"%>


<div class="container">
<div class="row">
			<div class="col-md-4 offset-md-4">
			
			<div class="card">
						<div class="card-body ">
						<h5 class="text-center text-dark p-1">Sell Old Book</h5>
						<c:if test="${not empty sucmsg}">
							<p class="text-center text-success">${sucmsg}</p>
							<c:remove var="sucmsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedmsg}">
							<p class="text-center text-danger">${failedmsg}</p>
							<c:remove var="failedmsg" scope="session" />
						</c:if>
						
						<form action="addoldbook" method="post" enctype="multipart/form-data">
						
						
						<input type="hidden" value ="${userobj.email }" name="user">
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
								<label for="exampleInputEmail1">Upload Photo</label> <input
									type="file" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="bimg">
							
					</div>
					
					<div class="text-center">
						<button type="submit" class="btn btn-primary ">SELL</button>
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