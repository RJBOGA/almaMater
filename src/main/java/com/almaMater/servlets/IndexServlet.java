/*indexServlet.java*/
package com.almaMater.servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.almaMater.dao.UserDao;
import com.almaMater.entities.User;

import java.io.*;

@WebServlet("/ucmo-alumas")
public class IndexServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final int defaultStudentId = -1; 

		Cookie[] cookies = request.getCookies();
		int studentId = defaultStudentId; 

		if (cookies != null) {
		    for (Cookie cookie : cookies) {
		        if (cookie.getName().equals("studentId")) {
		            try {
		                studentId = Integer.parseInt(cookie.getValue());
		                break; 
		            } catch (NumberFormatException e) {
		                System.err.println("Error parsing studentId cookie value: " + e.getMessage());
		            }
		        }
		    }
		}

		if (studentId == defaultStudentId) {
		    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		    dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("user-home.jsp");
		    dispatcher.forward(request, response);
		}
	}

}
