package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Dlts;

public class BookDAOimp implements BookDAO {

	private Connection conn;

	public BookDAOimp(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addbooks(Book_Dlts b) {

		boolean f = false;

		try {

			String sql = "insert into book_dtls(bookName,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Book_Dlts> getAllbooks() {
		List<Book_Dlts> list = new ArrayList<Book_Dlts>();
		Book_Dlts b = null;
		try {

			String sql = "select *from book_dtls ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Book_Dlts();
				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Book_Dlts getBookById(int id) {

		Book_Dlts b = null;
		try {

			String sql = "select *from book_dtls where bookId=? ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Book_Dlts();
				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	
	
	
	

	public boolean updateEditBook(Book_Dlts b) {
		boolean f=false;
		
		try {
			String sql = "update  book_dtls set bookname=?,author=?,price=?,status=? where bookId=? ";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4,b.getPrice());
			ps.setInt(5,b.getBookId());
			
			
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public boolean deleteBooks(int id) {
		boolean f = false;

		try {

			String sql = "delete from book_dtls where bookId=?  ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Book_Dlts> getNewBook() {
		List<Book_Dlts> list = new ArrayList<Book_Dlts>();
		Book_Dlts b = null;
		try {
			String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new Book_Dlts();
				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Book_Dlts> getRecentBook() {
		List<Book_Dlts> list = new ArrayList<Book_Dlts>();
		Book_Dlts b = null;
		try {
			String sql = "select * from book_dtls where  status=? order by bookId DESC  ";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new Book_Dlts();
				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Book_Dlts> getOldBook() {
		List<Book_Dlts> list = new ArrayList<Book_Dlts>();
		Book_Dlts b = null;
		try {
			String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new Book_Dlts();
				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Book_Dlts> getallRecentBook() {
		List<Book_Dlts> list = new ArrayList<Book_Dlts>();
		Book_Dlts b = null;
		try {
			String sql = "select * from book_dtls where  status=? order by bookId DESC  ";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Book_Dlts();
				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Book_Dlts> getallNewBook() {
		List<Book_Dlts> list = new ArrayList<Book_Dlts>();
		Book_Dlts b = null;
		try {
			String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Book_Dlts();
				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Book_Dlts> getallOldBook() {
		List<Book_Dlts> list = new ArrayList<Book_Dlts>();
		Book_Dlts b = null;
		try {
			String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Book_Dlts();
				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Book_Dlts> getBookbyOld(String email, String cate) {
		List<Book_Dlts> list = new ArrayList<Book_Dlts>();
		Book_Dlts b = null;
		try {

			String sql = "select * from book_dtls where  bookCategory=? and email=? ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Book_Dlts();
				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteOldBooks(String email, String cat, int id) {
		boolean f = false;

		try {
			String sql = "DELETE FROM book_dtls WHERE email=? AND bookCategory=? AND bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, cat);
			ps.setInt(3, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	
	
	
	
	
	

	public List<Book_Dlts> getbookbySearch(String ch) {
		List<Book_Dlts> list = new ArrayList<Book_Dlts>();
		Book_Dlts b = null;
		try {

			String sql = "select * from book_dtls where bookname like ? or author like ? or bookCategory like ? and status='Active'";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch +"%");
			ps.setString(3, "%"+ch +"%");
			

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Book_Dlts();
				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
