package com.almaMater.servlets;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.almaMater.dao.JobDao;
import com.almaMater.dao.JobDaoImpl;
import com.almaMater.entities.Jobs;

@WebServlet("/post-a-job")
public class JobPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Jobs jobs;
	private JobDao jobDao = new JobDaoImpl();

	private int studentId = -1;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("studentId")) {
					studentId = Integer.parseInt(cookie.getValue());
					break;
				}
			}
		}

		jobs = new Jobs();
		jobs.setProfile(request.getParameter("profile"));
		jobs.setDesc(request.getParameter("desc"));
		jobs.setExp(Integer.parseInt(request.getParameter("exp")));
		jobs.setTechs(request.getParameter("techs"));
		jobs.setContact(request.getParameter("contact"));
		jobs.setStudentId(studentId);
		jobs.setDatePosted(LocalDate.now());
		System.out.println(jobs);

		if (jobDao.createJob(jobs) != null) {
			System.out.println("null");
			response.sendRedirect("user-profile.jsp");
		} else {
			response.sendRedirect("index.jsp");
		}

	}

}
