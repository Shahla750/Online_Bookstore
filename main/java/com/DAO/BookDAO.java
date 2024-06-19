package com.DAO;

import java.util.List;

import com.entity.Book_Dlts;

public interface BookDAO {
	
	public boolean addbooks(Book_Dlts b);
	
	public  List<Book_Dlts> getAllbooks();
	
	public Book_Dlts getBookById(int id);
	
	public boolean updateEditBook(Book_Dlts b);
	
	public boolean deleteBooks(int id);
	
	public List<Book_Dlts> getNewBook();
	public List<Book_Dlts> getRecentBook();
	public List<Book_Dlts> getOldBook();
	
	
	public List<Book_Dlts> getallRecentBook();
	public List<Book_Dlts> getallNewBook();
	public List<Book_Dlts> getallOldBook();
	public List<Book_Dlts> getBookbyOld(String email,String cate);
	
	public boolean deleteOldBooks(String email,String cat,int id);
	
	
	
	
	
	
	
	public List<Book_Dlts> getbookbySearch(String ch);
	
}
