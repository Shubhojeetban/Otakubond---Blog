package com.anime.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anime.blog.dao.UserDao;
import com.anime.blog.entities.User;
import com.anime.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String checkString = request.getParameter("check");
		
		if(checkString == null) {
			out.println("checkbox not checked");
		}
		else {
			//rest of the fetching
			String nameString = request.getParameter("user_name");
			String emailString = request.getParameter("user_email");
			String passString = request.getParameter("user_password");
			String genderString = request.getParameter("gender");
			String aboutString = request.getParameter("about");
			
			//create User Object to save the data
			User user = new User(nameString, emailString, passString, genderString, aboutString);
			
			
			//creating the object of Userdao
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			if(userDao.saveUser(user)) {
				out.println("done");
			}
			else {
				out.println("Error");
			}
		}
	}

}
