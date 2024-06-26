package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImp;
import com.DB.DBConnect;
import com.entity.User;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			
			UserDAOImp dao=new UserDAOImp(DBConnect.getConn());
			HttpSession session=req.getSession();
			
			
			String email=req.getParameter("email");
			String passward=req.getParameter("passward");
			
			
			
			if("admin@gmail.com".equals(email) && "admin".equals(passward)) {
				
				User us=new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/Home.jsp");
				
			}else {
				
				User us=dao.login(email, passward);
				if(us!=null){
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
					
				}else {
					session.setAttribute("failedmsg", "invalid Email & Passward");
					resp.sendRedirect("Login.jsp");
				}
				
				
				
				
				resp.sendRedirect("index.jsp");
			}
			
		} catch (Exception e) {
			
		}
	
	}
}
