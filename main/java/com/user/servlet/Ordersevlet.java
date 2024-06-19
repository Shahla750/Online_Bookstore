package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOimp;
import com.DAO.BookOrderimp;
import com.DAO.cartDAOimp;
import com.DB.DBConnect;
import com.entity.Book_order;
import com.entity.cart;
@WebServlet("/order")

public class Ordersevlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session=req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("oname");
			
			String email=req.getParameter("oemail");
			String phno=req.getParameter("onumber");
			String address=req.getParameter("oaddress");
			String landmark=req.getParameter("olandmark");
			String city=req.getParameter("ocity");
			String state=req.getParameter("ostate");
			String pincode=req.getParameter("ozipcode");
			String paymentType=req.getParameter("opayment");
			
			
			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
			//System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType);
			
			cartDAOimp dao= new cartDAOimp(DBConnect.getConn());
			List<cart> blist =dao.getBookbyUser(id);
			if(blist.isEmpty()) {
				resp.sendRedirect("cart.jsp");
				session.setAttribute("failmsg", "Please Add item");
			}else {
				BookOrderimp dao2=new BookOrderimp(DBConnect.getConn());
				Book_order o=null;
				ArrayList<Book_order> orderList=new ArrayList<Book_order>();
				Random r=new Random();
				
				for(cart c:blist) {
				o=	new Book_order(); 
					//System.out.println(c.getBookName()+" "+c.getAuthor()+" "+c.getPrice());
					o.setOrderId("Book-ORD-00" + r.nextInt(1000));
					o.setName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice());
					o.setPaymentType(paymentType);
					orderList.add(o);
					
				}
				
				if("No_Selection".equals(paymentType)) {
					session.setAttribute("failmsg", "Choose Payment Method");
					resp.sendRedirect("cart.jsp");
				}else {
					boolean f =dao2.saveOrder(orderList);
					if(f) {
						resp.sendRedirect("Order_success.jsp");
					}else {
						//System.out.println("Order failed");
						session.setAttribute("failmsg", "Your Order Failed");
						resp.sendRedirect("cart.jsp");
					}
					
				}
			}
			
		} catch (Exception e) {   
			e.printStackTrace();
		}
	}

}
