package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOimp;
import com.DB.DBConnect;
import com.entity.Book_Dlts;
@WebServlet("/addoldbook")
@MultipartConfig

public class AddOldbook extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		try {
			
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String bookCategory="Old";
			String status="Active";
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
			String useremail=req.getParameter("user");
			Book_Dlts b=new Book_Dlts(bookName,author,price,bookCategory,status,fileName,useremail);
			
			
			BookDAOimp dao=new BookDAOimp(DBConnect.getConn());
			

			
			boolean f=dao.addbooks(b);
			
		HttpSession session=req.getSession();
			
			if(f) {
				
				String path =getServletContext().getRealPath("")+"book";
				 
				File file=new File(path);
				
				part.write(path +File.separator+fileName);
				
				
				
				session.setAttribute("sucmsg", "Book add Sccessfully");
				resp.sendRedirect("sell.jsp");
			}else {
				session.setAttribute("failedmsg", "Something Wrong on Server");
		
		
		
				resp.sendRedirect("sell.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
