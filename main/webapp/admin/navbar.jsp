<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: #28a745"></div>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i>Bookly
			</h3>
		</div>
		
		<div class="col-md-3 p-20" style="margin-left:500px;">
			<c:if test="${not empty userobj }">
				<a class=" btn btn-outline-info text-info"><i
					class="fa-solid fa-user"></i>${userobj.name}</a>
				<a data-toggle="modal" data-target="#exampleModal"
					class=" btn btn-outline-success "><i
					class="fa-solid fa-right-to-bracket"></i>Logout</a>


			</c:if>

			<c:if test="${empty userobj }">
				<a href="../Login.jsp" class=" btn btn-outline-primary "><i
					class="fa-solid fa-right-to-bracket"></i>Login</a>
				<a href="../Register.jsp" class=" btn btn-outline-success"><i
					class="fa-sharp fa-solid fa-user-plus"></i>Register</a>
			</c:if>
		</div>


	</div>
</div>




<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
        <div class="text-center">
        <h4>Do You Want To Logout</h4>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../Logout" type="button" class="btn btn-success text-white">Logout</a>
        </div>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>

<!-- end  -->



<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
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
			<li class="nav-item active"><a class="nav-link" href="Home.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>



		</ul>

	</div>
</nav>
