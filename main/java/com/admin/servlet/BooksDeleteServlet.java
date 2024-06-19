package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAO;
import com.DAO.BookDAOimp;
import com.DB.DBConnect;

@WebServlet("/delete")
public class BooksDeleteServlet  extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			BookDAOimp dao=new BookDAOimp(DBConnect.getConn());
			boolean f=dao.deleteBooks(id);
			
			
			
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("sucmsg", "Book Delete Successfully");
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
