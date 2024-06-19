<%@page import="com.entity.User"%>
<%@page import="com.entity.Book_Dlts"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOimp"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book</title>

<%@include file="all_component/allcss.jsp"%>
<style type="text/css">

.carousel-caption h5{
font-size:50px;
margin-top:250px;
color:white;
text-transform:uppercase;
letter-spacing:2px;
animation-delay:1s;
}
.carousel-caption p{
width:100%;
margin-bottom:200px;
font-size:25px;
line-height:1.9;
}

.crd-ho:hover {
	background-color: #fcf7f7;
	box-shadow: 5px 10px 5px 10px white;
}
</style>

</head>
<body style="background-color:#fcf7f7; ">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u=(User)session.getAttribute("userobj");
	%>
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	
  <ol class="carousel-indicators">
  
   
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  
  </ol>
  <div class="carousel-inner">
  
    <div class="carousel-item active">
    
      <img class="d-block w-100" src="img/2ndbk.jpg" alt="First slide">
      
      
       <div class="carousel-caption d-none d-md-block">
    <h5 class="animated bounceInRight" style="animation-delay:1s;">Welcome To Book Store</h5>
    <p class="animated bounceInLeft d-none d-md-block" style="animation-delay:2s">Find Book with affordable price and Free Delivary</p>
 
 
  </div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/img.jpg" alt="Second slide">
      
        <div class="carousel-caption " style="top: 250px; transform: translateY(-50%);">
   <h5 class="animated bounceInRight" style="animation-delay:1s">Welcome To Book Store</h5>
        <p class="animated bounceInRight d-none d-md-block" style="animation-delay:2s">Find Book with affordable price and Free Delivery</p>
 
  </div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100 " src="img/books.jpg" alt="Third slide">
      
      
      <div class="carousel-caption " style="top: 250px; transform: translateY(-50%);">
    <h5 class="animated bounceInRight" style="animation-delay:1s">Welcome To Book Store</h5>
    <p class="animated bounceInLeft d-none d-md-block" style="animation-delay:2s">Find Book with affordable price and Free Delivary</p>
 
 
  </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  
  
  
  <script>
  $(document).ready(function () {
    // Activate the carousel
    $('#carouselExampleIndicators').carousel();

    // Set interval for automatic sliding (1 second in this case)
    setInterval(function () {
      $('#carouselExampleIndicators').carousel('next');
    }, 2000);
  });
</script>
</div>

	<!--recent book-->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">


			<%
			BookDAOimp dao2 = new BookDAOimp(DBConnect.getConn());
			List<Book_Dlts> list2 = dao2.getRecentBook();
			for (Book_Dlts b : list2) {
			%>

			<div class="col-md-3.5 ml-3">
				<div class="card crd-ho" style="width: 14rem;">
					<div class="card-body text-center">
						<img src="book/<%=b.getPhotoName()%>" alt=""
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						
						<p>
							Categories:<%=b.getBookCategory()%></p>
							<h5>
							<i class="fa fa-inr" aria-hidden="true"></i><%=b.getPrice()%></h5>
						<%
						if (b.getBookCategory().equals("Old")) {
						%>
						<div class="row">
							
							<a href="view.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5"
								style="border-radius: 20px;">View Details</a> 
						</div>
						<%
						} else {
						%>
						<div class="row">
						<%
						if(u==null){%>
						
						
						<a href="Login.jsp" class="btn btn-danger btn-sm ml-1"
								style="border-radius: 20px;"><i
								class="fa-sharp fa-solid fa-cart-plus"></i>Add Cart</a>
								
								
								
							
						<% }else{%>
						
						
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-1"
									style="border-radius: 20px;"><i
									class="fa-sharp fa-solid fa-cart-plus"></i>Add Cart</a>
									
					<% 	}
						%>
							
							
							 <a href="view.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-1" style="border-radius: 20px;">View
								Details</a> 
						</div>

						<%
						}
						%>


					</div>
				</div>


			</div>

			<%
			}
			%>

		</div>

		<div class="text-center mt-4">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!--end -->
	<hr>
	<!--old-->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">


			<%
			BookDAOimp dao = new BookDAOimp(DBConnect.getConn());
			List<Book_Dlts> list = dao.getNewBook();
			for (Book_Dlts b : list) {
			%>


			<div class="col-md-3.5 ml-3">
				<div class="card crd-ho" style="width: 14rem;">
					<div class="card-body text-center">
						<img src="book/<%=b.getPhotoName()%>" alt=""
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>

							Categories:<%=b.getBookCategory()%></p>
						<h5>
							<i class="fa fa-inr" aria-hidden="true"></i><%=b.getPrice()%></h5>
						<div class="row">
							<a  href="" class="btn btn-danger btn-sm ml-1"
								style="border-radius: 20px;"><i class="fas fa-cart-plus"></i>Add
								Cart</a> <a href="view.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1"
								style="border-radius: 20px;">View Details</a>
						</div>
					</div>
				</div>


			</div>


			<%
			}
			%>

		</div>


		<div class="text-center mt-4">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<hr>
	<!--end-->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			BookDAOimp dao3 = new BookDAOimp(DBConnect.getConn());
			List<Book_Dlts> list3 = dao3.getOldBook();
			for (Book_Dlts b : list3) {
			%>

			<div class="col-md-3.5 ml-3">
				<div class="card crd-ho" style="width: 14rem;">
					<div class="card-body text-center">
						<img src="book/<%=b.getPhotoName()%>" alt=""
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						
						<p>
							Categories:<%=b.getBookCategory()%></p>
							<h5>
							<i class="fa fa-inr" aria-hidden="true"></i><%=b.getPrice()%></h5>
						
						<div class="row">
							
							
							 <a href="view.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-5" style="border-radius: 20px;">View
								Details</a> 
						</div>
			</div>
			</div>
			</div>


			
			
			<%
			}
			%>
			</div>
		


		<div class="text-center mt-4">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>

