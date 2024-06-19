package com.DAO;

import java.util.List;

import com.entity.Book_Dlts;
import com.entity.cart;

public interface cartDAO {
	public boolean addCart(cart c);
	 
	public List<cart> getBookbyUser(int userId);
	public boolean deleteBook(int bid, int uid, int cid);
	
	public boolean deleteCartAfterOrder(int uid);

}
