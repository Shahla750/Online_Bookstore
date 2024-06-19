<%@page import="com.entity.Book_order"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderimp"%>
<%@page import="com.DAO.BookDAOimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order </title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">

<c:if test="${empty userobj }">
	<c:redirect url="Login.jsp"></c:redirect>
	
	</c:if>
	
<%@include file="all_component/navbar.jsp"%>

<div class="container ">


<h5 class="text-center text-danger p-2">Your Order</h5>
<table class="table mt-3">
  <thead class="bg-success text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author </th>
      <th scope="col">Price </th>
      <th scope="col">Payment Type </th>
    </tr>
  </thead>
  <tbody class="bg-white text-black">
  <%
 	User u =(User)session.getAttribute("userobj");
    BookOrderimp dao =new BookOrderimp(DBConnect.getConn());
    List<Book_order> blist=dao.getBook(u.getEmail());
    for(Book_order b:blist)
    {%>
    
    <tr>
      <th scope="row"><%=b.getId() %></th>
      <td><%=b.getName() %></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
       
      
    </tr>
    	
    <% }
    
  
  %>
    
    
   
      
  </tbody>
</table>

</div>





</body>
</html>