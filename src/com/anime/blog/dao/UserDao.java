package com.anime.blog.dao;
import java.sql.*;

import com.anime.blog.entities.User;

public class UserDao {
	private Connection conn;

	public UserDao(Connection conn) {
		this.conn = conn;
	}
	
	//method to save user's data to database
	public boolean saveUser(User user) {
		boolean flag = false;
		try {
			
			String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement ptm = this.conn.prepareStatement(query);
			ptm.setString(1, user.getName());
			ptm.setString(2, user.getEmail());
			ptm.setString(3, user.getPassword());
			ptm.setString(4, user.getGender());
			ptm.setString(5, user.getAbout());
			
			ptm.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	//get User using user_email and user_password
	
	public User getUserByEmailAndPassword(String emailString, String password) {
		User user = null;
		
		try {
			String query = "select * from user where email=? and password=?";
			PreparedStatement ptm = conn.prepareStatement(query);
			ptm.setString(1, emailString);
			ptm.setString(2, password);
			
			ResultSet set = ptm.executeQuery();
			
			if (set.next()) {
				
				user = new User();
				String name = set.getString("name");
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
				
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	//update the user
	
	public boolean updateUser(User user) {
		boolean f = false;
		try {
			
			String query = "update user set name=? , email=? , password=? , gender=? , about=? , profile=? where id=?";
			PreparedStatement ptm= conn.prepareStatement(query);
			ptm.setString(1, user.getName());
			ptm.setString(2, user.getEmail());
			ptm.setString(3, user.getPassword());
			ptm.setString(4, user.getGender());
			ptm.setString(5, user.getAbout());
			ptm.setString(6, user.getProfile());
			ptm.setInt(7, user.getId());
			
			ptm.executeUpdate();
			f = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
}
