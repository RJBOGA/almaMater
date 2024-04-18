package com.almaMater.servlets;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import com.almaMater.dao.JobDaoImpl;

@WebServlet("/deleteJob")
public class DeleteJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int jobId = Integer.parseInt(request.getParameter("jobId"));

        JobDaoImpl jobDao = new JobDaoImpl();
        boolean deleted = jobDao.deleteJob(studentId, jobId);

        // Send response back to the client
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.print(deleted ? "Job deleted successfully" : "Failed to delete job");
        out.flush();
    }
}


