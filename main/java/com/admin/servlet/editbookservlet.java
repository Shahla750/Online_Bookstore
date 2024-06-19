package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOimp;
import com.DB.DBConnect;
import com.entity.Book_Dlts;

@WebServlet("/editbook")
public class editbookservlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			
			String status=req.getParameter("bstatus");
			
			
			Book_Dlts b=new Book_Dlts();
			b.setBookId(id);
			b.setBookname(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			
			BookDAOimp dao=new BookDAOimp(DBConnect.getConn());
			boolean f=dao.updateEditBook(b);
			
			
			
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("sucmsg", " Successfully Edit book");
				resp.sendRedirect("admin/all_book.jsp");
			}else {
				session.setAttribute("failedmsg", "Something Wrong on server");
				resp.sendRedirect("admin/all_book.jsp");
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
