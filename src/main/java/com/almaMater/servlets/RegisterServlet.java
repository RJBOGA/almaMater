package com.almaMater.servlets;

import java.io.IOException;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.almaMater.dao.UserDao;
import com.almaMater.entities.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDao userDao;

	public void init() {
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		synchronized (session) {
			User user = (User) session.getAttribute("user");
			if (user == null) {
				user = new User();
				session.setAttribute("user", user);
			}

			user.setStudentId(Integer.parseInt(request.getParameter("studentId")));
			user.setEmail(request.getParameter("email"));
			user.setPassword(request.getParameter("password"));
			user.setFirstName(request.getParameter("firstName"));
			user.setLastName(request.getParameter("lastName"));
			user.setDepartment(request.getParameter("department"));
			user.setGraduationYear(Integer.parseInt(request.getParameter("graduationYear")));
			user.setProfession(request.getParameter("profession"));
			user.setContactNumber(request.getParameter("contactNumber"));
			user.setDateTime(LocalDateTime.now());
			user.setAddress(request.getParameter("address"));

			if (userDao.addUser(user)) {
				response.sendRedirect("success.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}
		}
	}
}
