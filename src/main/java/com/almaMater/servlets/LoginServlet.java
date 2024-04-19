package com.almaMater.servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import com.almaMater.entities.User;

import com.almaMater.dao.UserDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int studentId = Integer.parseInt(request.getParameter("username"));
		String password = request.getParameter("password");

		UserDao userDao = new UserDao();
		User user = userDao.getUserByUsernameAndPassword(studentId, password);

		if (user != null) {
			int maxAge = 60 * 60 * 24 * 7; // 7 days
			Cookie cookie = new Cookie("studentId", String.valueOf(user.getStudentId()));
			cookie.setMaxAge(maxAge);
			response.addCookie(cookie);
			response.sendRedirect("user-home.jsp");
		} else {
			response.sendRedirect("login.jsp?login=failed");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int studentId = retrieveStudentIdFromCookie(request);

		if (studentId == -1) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("user-home.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	private int retrieveStudentIdFromCookie(HttpServletRequest request) {
        int studentId = -1;
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("studentId")) {
                    try {
                        studentId = Integer.parseInt(cookie.getValue());
                        break;
                    } catch (NumberFormatException e) {
                    	System.err.println( "Error parsing studentId cookie value "+ e);
                    }
                }
            }
        }
        return studentId;
    }
}
