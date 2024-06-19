<%@page import="com.entity.Book_Dlts"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>

</head>
<body>
<%@include file="all_component/navbar.jsp"%>
<div class="container-fluid">
		<div class="row p-3">
		
		<%
			BookDAOimp dao3 = new BookDAOimp(DBConnect.getConn());
			List<Book_Dlts> list3 = dao3.getallOldBook();
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
							
							
							 <a  href="view.jsp?bid=<%=b.getBookId() %>"
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
</div>

</body>
</html>