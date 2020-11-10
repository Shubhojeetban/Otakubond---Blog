<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register | Otakubond</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 83% 100%, 23% 93%, 0 100%, 0 0
}
</style>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>

<!-- nav bar -->
	<%@include file="normal_navbar.jsp"%>
	<script type="text/javascript">
	$(document).ready(function(){
	    $(".profile1").remove();
	})
	</script>

	<main class="primary-background p-5">
		<div class="container">
			<div class="row">

				<div class="col-md-6 offset-md-3">
					<div class="card mt-2">

						<div class="card-header text-center primary-background text-white">
							<span class="fa fa-user-plus fa-3x"></span>
							<p>Register here</p>
						</div>

						<div class="card-body">
							<form id="reg-form" action="RegisterServlet" method="POST">
								<div class="form-group">
									<label for="user_name">User Name</label> <input type="text" required
										class="form-control" id="user_name" name="user_name"
										aria-describedby="emailHelp" placeholder="Enter username">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="exampleInputEmail1" name="user_email" required
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control" name="user_password" required
										id="exampleInputPassword1" placeholder="Password">
								</div>

								<div class="form-check">
								 <label for="Gender">Select Gender</label>
								 <br>
								 <input type="radio" id="gender" name="gender" value="male"> Male
								 <input type="radio" id="gender" name="gender" value="female"> Female
								</div>
								<br>
								
								<div class="form-group">
								 <textarea name="about" id="about" class="form-control" rows="5" placeholder="Tell us something about yourself"></textarea>
								</div>

								<div class="form-check">
									<input name="check" type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Agree terms and conditions</label>
								</div>
								<br>
								<div class="container text-center" id="loader" style="display: none">
								  <span class="fa fa-refresh fa-4x fa-spin"></span>
								  <h4>Please wait...</h4>
								</div>
								
							
								<button type="submit" id="submit-btn" class="btn btn-success text-white">Submit</button>
							</form>
						</div>

						<div class="card-footer"></div>

					</div>

				</div>

			</div>

		</div>
	</main>

	<!-- JavaScript -->
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	 $(document).ready(function(){
		 console.log("loaded...")
		 $('#reg-form').on('submit', function(event){
			 event.preventDefault();
			 let form = new FormData(this);
			 
			 $('#submit-btn').hide();
			 $('#loader').show();
			 
			 //send this to servlet
			 $.ajax({
				 url:"RegisterServlet",
				 type:'POST',
				 data:form,
				 success: function(data, textStatus, jqXHR){
					 console.log(data)
					 
					 if(data.trim() === 'done'){
					 $('#loader').hide();
					 $('#submit-btn').show();
					 swal("You are registered!", "Welcome to Otakubond", "success")
					 .then((value) => {
						 window.location="login_page.jsp"
					 });
					 }
					 else if(data.trim() === 'checkbox not checked'){
						 $('#loader').hide();
						 $('#submit-btn').show();
						 swal("Please check the terms and conditions");
					 }
					 else{
						 $('#loader').hide();
						 $('#submit-btn').show();
						 swal("Something went wrong!", "Please, try again...", "error");
					 }
				 },
				 error: function(jqXHR, textStatus, errorThrown){
					 console.log(jqXHR)
					 
					 $('#loader').hide();
					 $('#submit-btn').show();
					 swal("Something went wrong!", "Please, try again...", "error");
				 },
				 processData: false,
				 contentType: false
			 });
		 });
	 });
	</script>
</body>
</html>