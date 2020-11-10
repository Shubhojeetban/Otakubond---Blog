<!DOCTYPE html>
<%@page import="com.anime.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.anime.blog.helper.ConnectionProvider"%>
<%@page import="com.anime.blog.dao.PostDao"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Create Post | Otakubond</title>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
     
     <!-- nav bar -->
	<%@include file="normal_navbar.jsp"%>
     
	<div class="container pt-2">
		<form action="AddPostServlet" method="post" id="add-post-form" enctype="multipart/form-data">
			<select class="form-control pt-2" name="cid">
				<option selected disabled>---Select the category---</option>

				<%
					PostDao dao = new PostDao(ConnectionProvider.getConnection());
				ArrayList<Category> list = dao.getAllCategories();

				for (Category c : list) {
				%>
				<option value="<%=c.getCid()%>"><%=c.getName()%></option>
				<%
					}
				%>
			</select>
			<div class="form-group pt-2">
				<input name="pTitle" type="text" placeholder="Enter post title"
					class="form-control">
			</div>
			<div class="form-group">
				 <div>
   					<textarea name="pContent" id="tiny" placeholder="Enter the content" class="form-control" id="mycontent"></textarea>
 				</div>
				
                </div>
				<div class="form-group pt-1">
					<label>Title Image</label> <br> <input type="file" name="pic">
				</div>

				<div class="container text-center pt-1">
					<button class="btn btn-success text-white btn-lg btn-block" id="submit" type="submit">Create Post</button>
					</div>
		</form>
	</div>



    <script src="js/myjs.js" type="text/javascript"></script>
	  <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
	  <script src="/path/to/tinymce.min.js"></script>
	 <script>
   tinymce.init({
     selector: 'textarea#tiny'
   });
   
// Prevent Bootstrap dialog from blocking focusin
   $(document).on('focusin', function(e) {
     if ($(e.target).closest(".tox-tinymce-aux, .moxman-window, .tam-assetmanager-root").length) {
       e.stopImmediatePropagation();
     }
   });
   

 </script>
 
 <script type="text/javascript">
 $(document).ready(function(){
     
 })
 </script>

	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		
</body>
</html>