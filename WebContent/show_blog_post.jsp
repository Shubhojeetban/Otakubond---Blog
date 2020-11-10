<%@page import="com.anime.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.anime.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.anime.blog.entities.User"%>
<%@page import="com.anime.blog.helper.ConnectionProvider"%>
<%@page import="com.anime.blog.dao.PostDao"%>
<%@page import="com.anime.blog.entities.Post"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page errorPage="error_page.jsp"%>
 <%
 int postId = Integer.parseInt(request.getParameter("post_id"));
 PostDao dao = new PostDao(ConnectionProvider.getConnection());
 Post post = dao.getPostByPid(postId);
 User user = (User) session.getAttribute("currentUser");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= post.getpTitle() %> | Otakubond</title>

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
.post-title {
   font-size: 30px;
}
.post-user{

}
.post-date{
font-style : italic;
}
body{
 background : url(img/bg.jpg);
 background-size : cover;
 background-attachment : fixed;
 
}
</style>

<!-- Comment plugin Facebook -->

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v8.0" nonce="0jGXL8xT"></script>
 <!-- end of the plugin -->
</head>
<body>

  <nav
		class="navbar navbar-expand-lg navbar-dark primary-background text-white fixed-top">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-anchor"></span> Otakubond</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="profile.jsp"> <span
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
	
	
	<!-- main content of the body -->
	
	
	<div class="container mt-4 pt-4">
	  
	  
	  <div class="row my-4">
	    
	    <div class="col md-8 offset-md-2">
	    
	      <div class="card">
	        
	        <div class="card-header primary-background text-white">
	        
	          <h4 class="post-title"><%= post.getpTitle() %></h4>
	        
	        </div>
	        <img src="blog_pic/<%= post.getpPic() %>" class="img-fluid" alt="content_pic" style="max-width: 100%; height : 26em;">
	        
	        <div class="card-body">
	         
	         <div class="row">
	           <div class="col-md-8">
	           
	           <%
	             PostDao d1 = new PostDao(ConnectionProvider.getConnection());
	             int uD= post.getUserId();
	             User u = d1.getUserByUserId(uD);
	           
	           %>
	             <p class="post-user"><span class="fa fa-edit"></span> By <a href="#!"> <%= u.getName() %></a></p>
	           </div>
	           
	           <div class="col-md-4">
	             <p class="post-date"><span class="fa fa-calendar"></span> <%= DateFormat.getDateInstance().format(post.getpDate()) %></p>
	           </div>
	         </div>
	         
	         <div class="container pr-5 pl-0">
	           <h5 class="post-content"><%= post.getpContent() %></h5>
	         </div>
	        </div>
	        
	        <%
	          LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
	          int count = ld.countLikeOnPost(postId);
	         %>
	        
	        <div class="card-footer">
	         <a href="#" onclick="doLike(<%= post.getpId() %>, <%= user.getId() %>)" class="btn btn-outline-primary"><i class="fa fa-thumbs-o-up"><span class="like-counter"> <%= count %></span></i></a>
			 <a href="#" class="btn btn-outline-primary"><i class="fa fa-commenting-o"><span> 20</span></i></a>
	        </div>
	        <div class="card-footer">
	        <div class="fb-comments" data-href="http://localhost:8080/OtakuBond/show_blog_post.jsp?post_id=<%= postId %>" data-numposts="6" data-width=""></div>
	      </div>
	      
	      </div>
	      
	      
	    
	    </div>
	  
	  </div>
	
	
	</div>
 
 
 
 
 
 
 
    <!-- end of the main content of the body -->
 
 
 
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
									PostDao da = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = da.getAllCategories();

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
</body>
</html>