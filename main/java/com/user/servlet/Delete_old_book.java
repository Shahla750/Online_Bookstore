package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOimp;
import com.DB.DBConnect;

@WebServlet("/delete_old_book")
public class Delete_old_book extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String em=req.getParameter("em");
			
			int id=Integer.parseInt(req.getParameter("id"));
			BookDAOimp dao=new BookDAOimp(DBConnect.getConn());
			boolean f=dao.deleteOldBooks(em, "Old", id);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("sucmsg", "Old book Delete Successfully");
				resp.sendRedirect("Old_book.jsp");
			}else {
				session.setAttribute("sucmsg", "Something Wrong on server");
				resp.sendRedirect("Old_book.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	

}
