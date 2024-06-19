package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Dlts;
import com.entity.cart;

public class cartDAOimp implements cartDAO {
	private Connection conn;
	public cartDAOimp (Connection conn) {
		this.conn=conn;
	}

	
	
	
	public boolean addCart(cart c) {
		boolean f=false;
		try {
			cart ct=new cart();
			ct.setBid(2);
			ct.setUid(3);
			
			
			
			
			
			String sql="insert into cart (bid,uid,book_name,author,price,total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setString(5, c.getPrice());
			ps.setString(6, c.getTotalPrice());
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return f;
	}




	public List<cart> getBookbyUser(int userId) {
		List<cart> list=new ArrayList<cart>();
		
		
		cart c=null;
		
		int  totalPrice=0;
		try {
			String sql="select * from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs=ps.executeQuery();
			
			
			
			
			while(rs.next()) {
				c=new cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getString(6));
				c.setTotalPrice(rs.getString(7));
				
				
				
				
				totalPrice=totalPrice+Integer.parseInt(rs.getString(7));
				c.setTotalPrice(Integer.toString(totalPrice));
				list.add(c);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
		return list;
	}




	public boolean deleteBook(int bid, int uid, int cid) {

		boolean f = false;

		try {
			String sql = "delete from cart where bid=? and uid=? and cid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}




	public boolean deleteCartAfterOrder(int uid) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	}
	
	
	
	
	
	

