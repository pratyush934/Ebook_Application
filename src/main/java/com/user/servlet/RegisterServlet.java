package com.user.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DAO.userDAOImpl;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			
			//System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session = req.getSession();
			if(check != null) {
				userDAOImpl dao = new userDAOImpl(DBConnect.getConn()); 
				boolean f2 = dao.checkUser(email);
				if(f2) {
					boolean f = dao.userRegister(us);
					
					
					if(f) {
						//System.out.println("User Register Success");
						session.setAttribute("succMsg", "Registration Successfull");
						resp.sendRedirect("register.jsp");
					} else {
						session.setAttribute("failedMsg", "Something Wrong on Server");
						resp.sendRedirect("register.jsp");
						//System.out.println("User Register Fail");
					}
				} else {
					session.setAttribute("failedMsg", "User with Email Already Exist");
					resp.sendRedirect("register.jsp");
				}
			} else {
				session.setAttribute("failedMsg", "Please check Agree and Condition");
				resp.sendRedirect("register.jsp");
				//System.out.println("Please Check Agree and Terms Condition");
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
