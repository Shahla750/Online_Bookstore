<%@page import="com.entity.cart"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.cartDAOimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Your Cart</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color:#fcf7f7; ">
	<%@include file="all_component/navbar.jsp"%>
	
	
	<c:if test="${empty userobj }">
	<c:redirect url="Login.jsp"></c:redirect>
	
	</c:if>
	
	
	<c:if test="${not empty sucmsg }">
	<div class="alert alert-success " role="alert">${sucmsg}</div>
	<c:remove var="sucmsg" scope="session"/>
	
	
	
	</c:if>
	
	<c:if test="${not empty failmsg }">
	            
	
	<div class="alert alert-danger " role="alert" style="text-align: center;">${failmsg}</div>
	
	<c:remove var="sucmsg" scope="session"/>
	
	
	
	</c:if>
	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");

								cartDAOimp dao = new cartDAOimp(DBConnect.getConn());
								List<cart> cart = dao.getBookbyUser(u.getId());

								int totalPrice = 0;

								for (cart c : cart) {
									totalPrice = Integer.parseInt(c.getTotalPrice());
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a class="btn btn-sm btn-danger"
										href="Remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"><i class="fas fa-trash-can"></i>Remove</a></td>
								</tr>
								<%
								}
								%>
								
								
								

								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice %></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Order Details</h3>
						<form action="order" method="post">
						
							<input type="hidden" name="id" value="${userobj.id }">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" value="<%=u.getName() %>"
										 name="oname" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" value="<%=u.getEmail() %>" readonly="readonly"
										 name="oemail" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="number" class="form-control" value="<%=u.getPhno() %>"
										 name="onumber" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" 
										placeholder="" value="${userobj.address }"
										name="oaddress" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" value="${userobj.landmark }"
										name="olandmark" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" value="${userobj.city }" name="ocity" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" value="${userobj.state }" name="ostate" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">PinCode</label> <input type="text"
										class="form-control" value="${userobj.pincode }"
										name="ozipcode" required>
								</div>
							</div>

							<div class="form-group">
								<label>Payment mode</label> <select class="form-control" name="opayment">
									<option value="No_Selection" selected>---Select---</option>
									<option value="COD" >Cash on delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>