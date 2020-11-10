package com.anime.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


import com.anime.blog.entities.Category;
import com.anime.blog.entities.Post;
import com.anime.blog.entities.User;

public class PostDao {
	Connection conn;

	public PostDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();
		try {

			String query = "select * from categories";
			Statement statement = this.conn.createStatement();

			ResultSet set = statement.executeQuery(query);

			while (set.next()) {
				int id = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");

				Category category = new Category(id, name, description);
				list.add(category);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	public boolean savePost(Post post) {
		boolean flag = false;

		try {
			String query = "insert into post(pTitle, pContent, pPic, catId, userId) values(?,?,?,?,?)";
			PreparedStatement ptm = conn.prepareStatement(query);
			ptm.setString(1, post.getpTitle());
			ptm.setString(2, post.getpContent());
			ptm.setString(3, post.getpPic());
			ptm.setInt(4, post.getCatId());
			ptm.setInt(5, post.getUserId());

			ptm.executeUpdate();
			flag = true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}

	// get all the post
	public List<Post> getAllPosts() {
		List<Post> list = new ArrayList<>();

		try {
			
			String query = "select * from post";
			Statement statement = conn.createStatement();
			ResultSet set = statement.executeQuery(query);
			
			while(set.next()) {
				int pId = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");
				
				Post post = new Post(pId, pTitle, pContent, pPic, pDate, catId, userId);
				
				list.add(post);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	public List<Post> getPostByCatId(int catId) {
		List<Post> list = new ArrayList<>();

		try {
			
			String query = "select * from post where catId=?";
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setInt(1, catId);
			ResultSet set = statement.executeQuery();
			
			while(set.next()) {
				int pId = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				
				Post post = new Post(pId, pTitle, pContent, pPic, pDate, catId, userId);
				
				list.add(post);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	public Post getPostByPid(int postId) {
		Post post = null;
		try {
			String query = "select * from post where pid=?";
			PreparedStatement ptm = this.conn.prepareStatement(query);
			ptm.setInt(1, postId);
			
			ResultSet set = ptm.executeQuery();
			
			if(set.next()) {
				int pId = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				int catId = set.getInt("catId");
				
				post = new Post(pId, pTitle, pContent, pPic, pDate, catId, userId);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return post;
	}
	
	public User getUserByUserId(int userId) {
		User user = null;
		
		try {
			String query="select * from user where id=?";
			PreparedStatement ptm = conn.prepareStatement(query);
			ptm.setInt(1, userId);
			
			ResultSet set = ptm.executeQuery();
			
			if(set.next()) {
				String name = set.getString("name");
			    String email = set.getString("email");
				String password = set.getString("password");
				String gender = set.getString("gender");
				String about = set.getString("about");
				String profile = set.getString("profile");
				
				user = new User(name, email, password, gender, about, profile);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return user;
	}
	
}
