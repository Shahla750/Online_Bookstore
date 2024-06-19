<%@page import="com.entity.Book_Dlts"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Book</title>

<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>

<%
int bid=Integer.parseInt(request.getParameter("bid"));
BookDAOimp dao= new BookDAOimp(DBConnect.getConn());
Book_Dlts b=dao.getBookById(bid);
%>

	<div class="container p-3">
		<div class="row ">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src=" book/<%=b.getPhotoName() %>" style="height: 180px; weight: 180px"><br>
				<h4 class="mt-3">Book Name:<span class="text-info"><%=b.getBookname() %></span>
				</h4>
				<h4>Author Name:<span class="text-info"><%=b.getAuthor() %></span></h4>
				<h4>Category:<span class="text-info"><%=b.getBookCategory() %></span></h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
		
				<h2><%=b.getBookname() %></h2>
				
				
				
				
				<%
				if("Old".equals(b.getBookCategory())){%>
				
				
				<h5 class="text-info">Contact To Seller</h5>
				<h5 class="text-info">Email:<%=b.getEmail() %></h5>
					
				<% }
				
				
				%>
				<div class="row">
				
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivary</p>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>


				</div>
				<%
				if("Old".equals(b.getBookCategory())){%>
				
					<div class="text-center p-3">
					<h5><i class="fa fa-inr" aria-hidden="true"><%=b.getPrice() %></i></h5>
				<a href="index.jsp" class=" btn btn-success">Continue Shopping</a>
				</div>
				
				<% }else{%>
				
				
				<div class="text-center p-3">
					<h5><i class="fa fa-inr" aria-hidden="true"><%=b.getPrice() %></i></h5>
				<a href="cart.jsp" class=" btn btn-success"><i class="fas fa-cart-plus"></i>Add Cart</a>
				<a href="cart.jsp" class=" btn btn-warning">Buy Now</a>
				</div>
				
				<% }%>
				
				
			</div>
		</div>
	</div>

</body>
</html>