package com.anime.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anime.blog.dao.LikeDao;
import com.anime.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String opration = request.getParameter("operation");
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		//out.println("data from servlet");
		//out.println(opration);
		//out.println(uid);
		//out.println(pid);
		LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
		
		if(opration.equals("like")) {
			boolean f = ldao.insertLike(pid, uid);
			out.println(f);
		}
	}

}
