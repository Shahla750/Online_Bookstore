package com.DAO;

import java.util.List;

import com.entity.Book_order;

public interface BookOrderDAO {

	
	//public boolean saveOrder(Book_order b);
	 public boolean saveOrder(List<Book_order> blist);
	 public List<Book_order> getBook(String email);
	 public List<Book_order> getallorder();
}
