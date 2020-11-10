package com.anime.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	private Connection conn;

	public LikeDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean insertLike(int pid, int uid) {
		boolean f = false;
		try {
			String query = "insert into likes(pid, uid) values(?,?)";
			PreparedStatement ptm = this.conn.prepareStatement(query);
			ptm.setInt(1, pid);
			ptm.setInt(2, uid);

			ptm.executeUpdate();
			f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	public int countLikeOnPost(int pid) {
		int count = 0;
		try {
			
			String query = "select count(*) from likes where pid=?";
			PreparedStatement ptm = this.conn.prepareStatement(query);
			ptm.setInt(1, pid);
			
			ResultSet set = ptm.executeQuery();
			
			if(set.next()) {
				count = set.getInt("count(*)");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return count;
	}
	
	
	public boolean isLikedByUser(int pid, int uid) {
		boolean flag = false;
		
		try {
			String query= "select * from likes where pid=? and uid=?";
			PreparedStatement ptm = conn.prepareStatement(query);
			
			ptm.setInt(1, pid);
			ptm.setInt(2, uid);
			
			ResultSet set = ptm.executeQuery();
			
			if(set.next()) {
				flag = true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return flag;
	}

    public boolean dislikePost(int pid, int uid) {
    	boolean f = false;
    	try {
			String query = "delete from likes where pid=? and uid?";
			PreparedStatement ptm= conn.prepareStatement(query);
			ptm.setInt(1, pid);
			ptm.setInt(2, uid);
			
			ptm.executeUpdate();
			
			f= true;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
    	return f;
    }
}
