package com.anime.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.anime.blog.dao.PostDao;
import com.anime.blog.entities.Post;
import com.anime.blog.entities.User;
import com.anime.blog.helper.ConnectionProvider;
import com.anime.blog.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		String pTitle = request.getParameter("pTitle");
		String pContent = request.getParameter("pContent");
		Part part = request.getPart("pic");
		
		//getting current session user
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("currentUser");
		
		Post post = new Post(pTitle, pContent, part.getSubmittedFileName(), cid, user.getId());
		
		PostDao dao = new PostDao(ConnectionProvider.getConnection());
		
		if(dao.savePost(post)) {
			out.println("done");
			String path = request.getRealPath("/")+"blog_pic"+File.separator+part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
		}
		else {
			out.println("error");
		}
		
		
		
		//out.println("your blog content is "+pTitle);
		//out.println(part.getSubmittedFileName());
	}

}
