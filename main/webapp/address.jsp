<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Address</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>


	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-2">

				<div class="card">
					<div class="card-body  ">
						<h5 class="text-center text-warning p-2">Edit Address</h5>

						<form action="" method="post">
							<div class="form-row p-1">
								<div class="form-group col-md-6 ">
									<label for="inputPassward4">Address</label><input type="text"
										class="form-control" id="inputPassward4">


								
								</div>
								<div class="form-group col-md-6 ">
									<label for="inputPassward4">Landmark</label><input type="text"
										class="form-control" id="inputPassward4">


								
								</div>
						</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputPassward4">City</label><input type="text"
										class="form-control" id="inputPassward4">

								</div>
								<div class="form-group col-md-4 ">
									<label for="inputPassward4">State</label><input type="text"
										class="form-control" id="inputPassward4">

								</div>
								<div class="form-group col-md-4">
									<label for="inputPassward4">Pin</label><input type="text"
										class="form-control" id="inputPassward4">

								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary">Add Address</button>
								</div>
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