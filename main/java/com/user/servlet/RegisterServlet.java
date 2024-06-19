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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String passward = req.getParameter("passward");
			String check = req.getParameter("check");

			// System.out.println(name+""+email+""+phno+""+passward+""+check);

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassward(passward);

			HttpSession session = req.getSession();
			if (check != null) {
				UserDAOImp dao = new UserDAOImp(DBConnect.getConn());
				boolean f = dao.userRegister(us);
				if (f) {
					// System.out.println("Register Successfully...");
					session.setAttribute("sucmsg", "Registration Successfully...");
					resp.sendRedirect("Register.jsp");

				} else {
					// System.out.println("Something Wrong......");
					session.setAttribute("failedmsg", "Something Wrong......");
					resp.sendRedirect("Register.jsp");

				}
			} else {
				// System.out.println("Please check Agree Term & Condition");
				session.setAttribute("failedmsg", "Please check Agree Term & Condition");
				resp.sendRedirect("Register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
