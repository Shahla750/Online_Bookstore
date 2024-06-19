package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.cartDAOimp;
import com.DB.DBConnect;

@WebServlet("/Remove_book")

public class RemoveServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int cid = Integer.parseInt(req.getParameter("cid"));

		cartDAOimp dao = new cartDAOimp(DBConnect.getConn());
		boolean f = dao.deleteBook(bid, uid, cid);
		HttpSession session = req.getSession();
		if (f) {
			session.setAttribute("sucmsg", "Book Removed");
			resp.sendRedirect("cart.jsp");
		} else {
			session.setAttribute("failmsg", "Something went wrong");
			resp.sendRedirect("cart.jsp");
		}
	}
	}
	


