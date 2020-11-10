<%@page import="com.anime.blog.entities.User"%>
<%@page import="com.anime.blog.dao.LikeDao"%>
<%@page import="com.anime.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.anime.blog.helper.ConnectionProvider"%>
<%@page import="com.anime.blog.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div class="row">
<% 
  User user = (User)session.getAttribute("currentUser");
  PostDao d = new PostDao(ConnectionProvider.getConnection());
  List<Post> li = null;
  int cid = Integer.parseInt(request.getParameter("cid"));
  if(cid== 0){
      li = d.getAllPosts();
  }
  else{
	  li = d.getPostByCatId(cid);
  }
  
  if(li.size() == 0){
	  out.println("<span style=\"color: red\"\">***No posts available in this category***");
	  return;
  }
  
  for(Post p : li){
	  %>
	   
	   <div class="col-md-6">
	      <div class="card mb-2">
					<img class="card-img-top" src="blog_pic/<%=p.getpPic() %>" alt="Card image cap" style="height : 12em;">
					<div class="card-body">
						<h5 class="card-title"><%= p.getpTitle() %></h5>
						<p class="card-text"><%= p.getpContent() %></p>
					</div>
					<div class="card-footer text-center">
					  <%
	                  LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
	                  int count = ld.countLikeOnPost(p.getpId());
	                  
	                   %>
					 <a href="#" onclick="doLike(<%= p.getpId() %>, <%= user.getId() %>)"  class="btn btn-outline-primary"><i class="fa fa-thumbs-o-up"><span class="like-counter"> <%= count %></span></i></a>
					 <a href="show_blog_post.jsp?post_id=<%= p.getpId() %>" class="btn btn-outline-success">Read more</a>
					 <a href="#" class="btn btn-outline-primary"><i class="fa fa-commenting-o pr-3"><span> 20</span></i></a>
					</div>
				</div>
	   </div>
	   
	   
	  <%
	}
%>
</div>