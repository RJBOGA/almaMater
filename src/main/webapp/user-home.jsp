<%@ page import="com.almaMater.dao.UserDao"%>
<%@ page import="com.almaMater.entities.User"%>
<%@ page import="com.almaMater.dao.JobDao"%>
<%@ page import="com.almaMater.dao.JobDaoImpl"%>
<%@ page import="com.almaMater.entities.Jobs"%>
<%@ page import="java.util.List"%>
<jsp:include page="header.jsp" />
<jsp:include page="footer.jsp" />

<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
<style>
main {
	padding: 2rem;
}

.section {
	margin-bottom: 2rem;
}

.section h2 {
	border-bottom: 2px solid #cf202e;
	padding-bottom: 1rem;
}

.section p {
	margin-top: 1rem;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 1rem;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
	color: #333;
}

header a {
	color: #fff;
	text-decoration: none;
	margin-right: auto;
}

header a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<header style="background-color: #cf202e;">
		<div>
			<a href="user-profile.jsp">My Account</a>
		</div>
		<div>
			<a href="logout.jsp">Logout</a>
		</div>
	</header>
	<main>
		<h1>Welcome to University of Central Missouri alums</h1>
		<div class="section">
			<h2>Find a Mentor or Fellow Student</h2>
			<p>Connect with alumni and current students to share experiences,
				gain insights, and build valuable relationships.</p>
			<!-- Alumni Table -->
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Profession</th>
					</tr>
				</thead>
				<tbody>
					<%
					UserDao userDao = new UserDao();
					List<User> alumniList = userDao.getAllAlumni();
					for (User alumni : alumniList) {
					%>
					<tr>
						<td><%=alumni.getFirstName() + ", " + alumni.getLastName()%></td>
						<td><%=alumni.getEmail()%></td>
						<td><%=alumni.getProfession()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>

		<div class="section">
			<h2>Find a Job</h2>
			<p>Explore job opportunities posted by alumni and partner
				organizations to advance your career.</p>
			<!-- Jobs Table -->
			<table>
				<thead>
					<tr>
						<th>Job Id</th>
						<th>Title</th>
						<th>Description</th>
						<th>Experience</th>
						<th>Technical skills</th>
						<th>Contact</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>
					<%
					JobDao jobDao = new JobDaoImpl();
					List<Jobs> jobsList = jobDao.getAllJobs();
					for (Jobs j : jobsList) {
					%>
					<tr>
						<td><%=j.getJobId()%></td>
						<td><%=j.getProfile()%></td>
						<td><%=j.getDesc()%></td>
						<td><%=j.getExp()%></td>
						<td><%=j.getTechs()%></td>
						<td><%=j.getContact()%></td>
						<td><%=j.getDatePosted()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>

		<div class="section">
			<div>
				<p>
					<a href="post-job.jsp">Are you hiring?</a> Please help one of your
					alumni get a job.
				</p>
			</div>
		</div>
	</main>

</body>
</html>
