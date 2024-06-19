package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOimp;
import com.DAO.cartDAOimp;
import com.DB.DBConnect;
import com.entity.Book_Dlts;
import com.entity.cart;

@WebServlet("/cart")
@MultipartConfig
public class cartServlet  extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			BookDAOimp daOimp=new BookDAOimp(DBConnect.getConn());
			Book_Dlts b=daOimp.getBookById(bid);
			
			cart c=new cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBookName(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(b.getPrice());
			c.setTotalPrice(b.getPrice());

			
			
			cartDAOimp dao2=new cartDAOimp(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("addCart", "Book Added to Cart");
				//session.setAttribute("cartobj", c);
				//System.out.println("add cart");
				resp.sendRedirect("all_recent_book.jsp");
				
			}else {
				session.setAttribute("failCart", "Something went wrong...");
				//resp.sendRedirect("all_new_book.jsp");
				//System.out.println("something wrong");
				resp.sendRedirect("all_recent_book.jsp");
			}
			 
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}