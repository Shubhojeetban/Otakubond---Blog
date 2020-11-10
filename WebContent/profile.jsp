
<%@page import="com.anime.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.anime.blog.helper.ConnectionProvider"%>
<%@page import="com.anime.blog.dao.PostDao"%>
<%@page import="com.anime.blog.entities.User"%>
<%@page import="com.anime.blog.entities.Message"%>
<%@page errorPage="error_page.jsp"%>
<%
	User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile | OtakuBond</title>

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
		);
}
</style>

</head>
<body>




	<!-- nav bar -->

	<nav
		class="navbar navbar-expand-lg navbar-dark primary-background text-white fixed-top">
		<a class="navbar-brand mt-0 pd-0 mr-0" href="index.jsp"> 
 <img alt="logo_otakubond" src="img/logo/logo1.png" class="img-fluid">
 </a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"> <span
						class="fa fa-cubes"></span> Anime Blog <span class="sr-only">(current)</span></a>
				</li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-gamepad"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Thriller</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Romantic</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"> <span
						class="fa fa-address-book"></span> Contact
				</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"> <span
						class="fa fa-plus-square"></span> Do Post
				</a></li>
				
				<!-- My own TinyMCE -->
				<li class="nav-item"><a class="nav-link" href="content-post.jsp"> <span
						class="fa fa-plus-square"></span> Create Post
				</a></li>


			</ul>
			<ul class="navbar-nav mr-2">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"> <span
						class="fa fa-user-circle"></span> <%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet">
						<span class="fa fa-sign-out"></span> Logout
				</a></li>
			</ul>
		</div>
	</nav>

	<!-- nav bar close -->
	<div class="container-fluid pt-1 m-5">
		<%
			Message msg = (Message) session.getAttribute("msg");
		if (msg != null) {
		%>
		<div class="alert <%=msg.getCssClass()%> mb-5" role="alert">
			<%=msg.getContent()%>
		</div>
		<%
			session.removeAttribute("msg");
		}
		%>
	</div>


	<!-- main body of the blog -->

	<main>
		<div class="container">

			<div class="row mt-4 pt-4">

				<!-- first column i.e the category section -->
				<div class="col-md-3">
					<div class="list-group">
						<a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">All Post </a> 
						
						<!-- Categories -->
						<%
						  PostDao dao1 = new PostDao(ConnectionProvider.getConnection());
						  ArrayList<Category> list1= dao1.getAllCategories();
						  
						  for(Category cc : list1){
							  %>
							  <a href="#" onclick="getPosts(<%=cc.getCid() %>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
							  
							  <%
						  }
						%>
						
					     
					</div>
				</div>

				<!-- Second column i.e. the post section -->
				<div class="col-md-9">
				
				  <!-- posts -->
				  
				  <div class="container text-center" id="loader">
				    
				    <i class="fa fa-refresh fa-4x fa-spin"></i> 
				     <h3 class="mt-2">Loading...</h3>
				  </div>
				  
				  
				  <!-- Posts -->
				  <div class="container-fluid" id="post-container">
				    
				    
				  </div>
				
				</div>

			</div>

		</div>
	</main>

	<!-- end of the body of the blog -->


	<!-- Profile modal -->

	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">Otakubond</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img alt="profile_pic" src="pics/<%=user.getProfile()%>"
							class="img-fluid" style="border-radius: 50%; max-width: 150px;">
						<h5 class="modal-title mt-3" id="exampleModalLabel">
							<%=user.getName()%></h5>

						<!-- Details -->
						<div id="profile-details">
							<table class="table mt-3">

								<tbody>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>

									</tr>

									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on :</th>
										<td><%=user.getDateTime().toLocaleString()%></td>

									</tr>
								</tbody>
							</table>
						</div>

						<!-- Profile edit -->


						<div id="profile-edit" style="display: none">
							<h6 class="mt-2">
								<span style="color: blue">Please Edit carefully</span>
							</h6>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table mb-0">

									<tr>
										<td>Name</td>
										<td><input name="user_name" class="form-control"
											type="text" value="<%=user.getName()%>"></td>
									</tr>

									<tr>
										<td>Email</td>
										<td><input name="user_email" class="form-control"
											type="text" value="<%=user.getEmail()%>"></td>
									</tr>

									<tr>
										<td>Password</td>
										<td><input name="user_password" class="form-control"
											type="password" value="<%=user.getPassword()%>"></td>
									</tr>

									<tr>
										<td>Status</td>
										<td><textarea rows="3" class="form-control"
												name="user_about"><%=user.getAbout()%>
						          </textarea></td>
									</tr>
									<tr>
										<td>New Avatar</td>
										<td><input type="file" name="image" class="form-control">
										</td>
									</tr>

								</table>
								<div class="conatiner">
									<button type="submit"
										class="btn btn-outline-success float-right mr-3">Save
										changes</button>

								</div>
							</form>
						</div>


					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-success">Edit Profile</button>
				</div>
			</div>
		</div>
	</div>


	<!-- End of Profile Modal -->


	<!-- add post modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Please
						Provide Blog details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="AddPostServlet" method="post">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select the category---</option>

								<%
									PostDao dao = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = dao.getAllCategories();

								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%= c.getName()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter post title"
								class="form-control">
						</div>

						<div class="form-group">
							<textarea name="pContent" rows="10"
								placeholder="Enter the content" class="form-control"></textarea>
						</div>

						<div class="form-group">
							<label>Title Image</label> <br> <input type="file"
								name="pic">
						</div>

						<div class="container text-center">
							<button class="btn btn-success text-white">Post</button>
						</div>

					</form>


				</div>

			</div>
		</div>
	</div>


	<!-- end post modal -->



	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			let editStatus = false;

			$('#edit-profile-button').click(function() {
				if (editStatus == false) {
					$("#profile-details").hide();
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$("#profile-details").show();
					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit Profile");
				}
			})

		})
	</script>

	<!-- now post js -->
	<script type="text/javascript">
		$(document)
				.ready(
						function(e) {
							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												//this code is call when form is submitted
												event.preventDefault(); //this stops the form to synchronous behaivior i.e. submiting
												console
														.log("you have click on submit");
												let form = new FormData(this);

												$
														.ajax({
															url : "AddPostServlet",
															type : 'POST',
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																//success
																console
																		.log(data);
																if (data.trim() === 'done') {
																	swal(
																			"Post Successfully!",
																			"Your blog have posted!",
																			"success");
																} else {
																	swal(
																			"Sorry post failed!",
																			"Something went wrong else part!",
																			"error");
																}

															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																//error
																swal(
																		"Sorry post failed!",
																		"Something went wrong!",
																		"error");
															},

															processData : false, //If this is not written the pics will not be send
															contentType : false
														})
											})
						})
	</script>
	
	<!-- loading post using ajax -->
	<script type="text/javascript">
	function getPosts(catId, temp){
		//temp is the refernce of the current category
		
		
		$('#loader').show();
		$('#post-container').hide();
		$('.c-link').removeClass('active')
		
		$.ajax({
			  url: "load_post.jsp",
			  data: {cid: catId},
			  success : function(data, textStatus, jqXHR){
				  $('#loader').hide();                   //for showing the loader
				  $('#post-container').show();
				  $('#post-container').html(data);       //to load the page
				  $(temp).addClass('active')
			  }
		  })
	  }
	
	  $(document).ready(function(e){
		  let allPostRef = $('.c-link')[0];
		  getPosts(0, allPostRef);
		  
	  })
	</script>

</body>
</html>