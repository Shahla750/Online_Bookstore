<%@page import="com.entity.User"%>
<%@page import="com.entity.Book_Dlts"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
	box-shadow: 5px 10px 5px 10px white;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>

</head>
<body>
<%
	User u=(User)session.getAttribute("userobj");
	%>
			<c:if test="${not empty addCart}">
				<div id="toast">${addCart}</div>

				<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addCart" scope="session"/>
			</c:if>
			
			
<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDAOimp dao2 = new BookDAOimp(DBConnect.getConn());
			List<Book_Dlts> list2 = dao2.getallRecentBook();
			for (Book_Dlts b : list2) {
			%>

			<div class="col-md-3.5 ml-3">
				<div class="card crd-ho mt-2" style="width: 14rem;">
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

							<a href="view.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5" style="border-radius: 20px;">View
								Details</a>
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
								
								
								 <a
								href="view.jsp?bid=<%=b.getBookId()%>"
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
	</div>

</body>
</html>