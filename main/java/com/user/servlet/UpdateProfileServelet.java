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

@WebServlet("/updateProfile")
public class UpdateProfileServelet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String passward = req.getParameter("passward");
			

			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassward(passward);
			//System.out.println(id);
			HttpSession session = req.getSession();

			UserDAOImp dao = new UserDAOImp(DBConnect.getConn());
			boolean f = dao.checkPassword(id, passward);
			if (f) {
				boolean uup = dao.updateProfile(us);
				if (uup) {
					session.setAttribute("sucmsg", "Profile updated successfully...");
					resp.sendRedirect("edit_profile.jsp");
				} else {
					session.setAttribute("failedmsg", "Something went wrong...");
					resp.sendRedirect("edit_profile.jsp");
				}
			} else {
				session.setAttribute("failedmsg", "Your Passward is Incorrect! ");
				resp.sendRedirect("edit_profile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}