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

import com.anime.blog.dao.UserDao;
import com.anime.blog.entities.Message;
import com.anime.blog.entities.User;
import com.anime.blog.helper.ConnectionProvider;
import com.anime.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
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
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String userEmail = request.getParameter("user_email");
		String userName = request.getParameter("user_name");
		String userPassword = request.getParameter("user_password");
		String userAbout = request.getParameter("user_about");
		Part part = request.getPart("image");
		
		String imageName = part.getSubmittedFileName();
		
		//fetching data from session
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		
		user.setName(userName);
		user.setEmail(userEmail);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		
		String oldProfile = user.getProfile();
		user.setProfile(imageName);
		
		//update data in the database
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		boolean ans = dao.updateUser(user);
		
		if(ans) {
			
			String path = request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			//for old file
			String pathOld = request.getRealPath("/")+"pics"+File.separator+oldProfile;
			
			if(!oldProfile.equals("default.png"))
			Helper.deleteFile(pathOld);
			
				if(Helper.saveFile(part.getInputStream(), path)) {
					out.println("Profile Pic uploaded...");
					Message msg = new Message("Profile details updated...", "success", "alert-success");
					session.setAttribute("msg", msg);
				}
				else {
					
					Message msg = new Message("Something went wrong...", "error", "alert-danger");
					session.setAttribute("msg", msg);
				}
			
		}
		else {
			out.println("Error updating in database");
			out.println("Profile pic not uploaded");
			Message msg = new Message("Something went wrong...", "error", "alert-danger");
			session.setAttribute("msg", msg);
		}
		response.sendRedirect("profile.jsp");
	}

}
