<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color:#28a745"></div>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i>Bookly
			</h3>
		</div>
		<div class="col-md-6 ">
			<form class="form-inline my-2 my-lg-0" action="Search.jsp">
				<input class="form-control mr-sm-1 " type="search" name="ch"
					aria-label="Search"  placeholder="Search here">
					
				<button class="btn btn-outline-success my-2 my-sm-1  fas fa-search"  id="search"type="submit"></button>
			</form>
		</div>
		<c:if test="${not empty userobj}">
		<div class="col-md-3  ml-0.5">
		
		<a href="cart.jsp"  class="cart-link"><i class="fas fa-shopping-cart fa-2x "></i></a>
			
				<a href="" class="btn btn-success"><i
					class="fa-solid fa-user"></i>${userobj.name }</a>
				<a href="Logout" class="btn btn-info text-white"><i
					class="fa-solid fa-right-to-bracket"></i> Logout</a>
					</div>
			</c:if>
			<c:if test="${empty userobj}">
			<div class="col-md-3  ml-0.5 mt-1">
				<a href="Login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a>
				<a href="Register.jsp" class="btn btn-info text-white"><i
					
					class="fa-solid fa-user-plus"></i> Register</a>
					</div>
			</c:if>
			
		

	</div>
</div>




<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<a class="navbar-brand" href="#"><i
		class="fa-solid fa-house-chimney"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active "><a class="nav-link" href="all_recent_book.jsp"><i
					class="fa-solid fa-book-open"></i>Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link" href="all_new_book.jsp"><i
					class="fa-solid fa-book-open"></i>New Book</a></li>
			<li class="nav-item active"><a class="nav-link" href="all_old_book.jsp"><i
					class="fa-solid fa-book-open"></i>Old Book</a></li>


		</ul>
		<form class="form-inline my-2 my-lg-0">

			<a href="Setting.jsp"
				class="btn btn-outline-secondary my-2 my-sm-0 ml-1" type="submit"><i
				class="fa-solid fa-gears"></i>Setting</a> <a href="helpService.jsp"
				class="btn btn-outline-secondary my-2 my-sm-0 ml-1"  type="submit"><i
				class="fa-solid fa-square-phone"></i>Contact Us</a>
		</form>
	</div>
</nav>
