<%@page import="com.anime.blog.entities.User"%>
<%@page import="com.anime.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home | Otakubond</title>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>

	<!-- nav bar -->
	<%@include file="normal_navbar.jsp"%>
	
	<%
	 User user = (User) session.getAttribute("currentUser");
	if(user == null){
	%>
	<script type="text/javascript">
	$(document).ready(function(){
	    $(".profile1").addClass("invisible");
	})
	</script>
	<%
	} else{
	%>
	<script type="text/javascript">
	$(document).ready(function(){
	    $(".login").remove();
	    $(".profile1").addClass("visible");
	    
	})
	</script>
	<%
	}
	%>
	
	<!-- banner -->
	<div class="container-fluid p-0 m-0">

		<div class="jumbotron primary-background text-white">
			<div class="container">
				<h3 class="display-3">Welcome to Otakubond</h3>

				<p>Hub for the otakus...</p>
				<p>Anime is an art form, specifically animation, that includes
					all genres found in cinema, but it can be mistakenly classified as
					a genre. In Japanese, the term anime is used as a blanket term to
					refer to all forms of animation from around the world. In English,
					anime is more restrictively used to denote a "Japanese-style
					animated film or television entertainment" or as "a style of
					animation created in Japan".</p>

				<button type="button" class="btn btn-outline-success btn-lg">
					<span class="fa fa-paper-plane"></span> Lets! Start
				</button>
				<a href="login_page.jsp" type="button"
					class="btn btn-outline-success btn-lg"><span
					class="fa fa-user-circle-o fa-spin"></span> Login</a>
			</div>
		</div>

	</div>

	<!-- cards -->
	<div class="container">

		<div class="row mb-2">

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="img/anime/tokyoghoul.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Tokyo Ghoul</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-success text-white">Read more</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="img/anime/naruto.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Naruto</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-success text-white">Read more</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="img/anime/noragami.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Noragami</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-success text-white">Read more</a>
					</div>
				</div>
			</div>

		</div>

		<div class="row mb-2">

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="..." alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Tokyo Ghoul</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-success text-white">Read more</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="..." alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Tokyo Ghoul</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-success text-white">Read more</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="..." alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Tokyo Ghoul</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-success text-white">Read more</a>
					</div>
				</div>
			</div>

		</div>


	</div>

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
	
</body>
</html>