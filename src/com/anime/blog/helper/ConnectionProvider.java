package com.anime.blog.helper;
import java.sql.*;
public class ConnectionProvider 
{
	private static Connection con;
	public static Connection getConnection() 
	{
		try {
			
			if(con == null) {
				//driver class load
				Class.forName("com.mysql.cj.jdbc.Driver");
				//create a connection..
				con = DriverManager.getConnection("jdbc:mysql://localhost/animeblog","root","shubhojeet12");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;
	}
}
