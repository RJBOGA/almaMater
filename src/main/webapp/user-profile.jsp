<%@ page import="com.almaMater.entities.User"%>
<%@ page import="com.almaMater.dao.UserDao"%>
<%@ page import="com.almaMater.dao.JobDao"%>
<%@ page import="com.almaMater.dao.JobDaoImpl"%>
<%@ page import="com.almaMater.entities.Jobs"%>
<%@ page import="javax.servlet.http.Cookie"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.util.List"%>
<jsp:include page="header.jsp" />
<jsp:include page="footer.jsp" />


<%
int userId = -1;
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("studentId")) {
	userId = Integer.parseInt(cookie.getValue());
	break;
		}
	}
}

// Retrieve user details from the database based on the user ID
UserDao userDao = new UserDao();
User user = null;
if (userId != -1) {
	user = userDao.getUserByStudentId(userId);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>My Account</title>
<style>
main {
	margin: 20px auto;
	width: 80%;
	padding: 2rem;
	box-sizing: border-box;
}

input[type=edit], input[type=submit], input[type=save], input[type=back]
	{
	background-color: #cf202e;
}

h1 {
	color: #333;
	text-align: center;
}

.user-profile-details {
	margin-bottom: 20px;
}

.user-profile-details p {
	margin-bottom: 10px;
	font-size: 16px;
}

button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	margin-right: 10px;
	display: block;
	margin: 0 auto;
}

button:hover {
	background-color: #0056b3;
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
</style>
<script>
function deleteJob(studentId, jobId) {
    if (confirm("Are you sure you want to delete this job?")) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "deleteJob", true); // URL mapped to the DeleteJobServlet
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Reload the page after successful deletion
                window.location.reload();
            }
        };
        xhr.send("studentId=" + studentId + "&jobId=" + jobId);
    }
}
</script>


</head>
<body>
	<header>
		<div>
			<a href="user-home.jsp">Home</a>
		</div>
		<div>
			<a href="logout.jsp">Logout</a>
		</div>
	</header>
	<main>
		<h3>
			User Profile +<%=userId%></h3>

		<div>
			<%
			if (user != null) {
			%>
			<p>
				Student ID:
				<%=user.getStudentId()%>
			</p>
			<p>
				Email:
				<%=user.getEmail()%>
			</p>
			<p>
				First Name:
				<%=user.getFirstName()%>
			</p>
			<p>
				Last Name:
				<%=user.getLastName()%>
			</p>
			<p>
				Department:
				<%=user.getDepartment()%>
			</p>
			<p>
				Graduation Year:
				<%=user.getGraduationYear()%>
			</p>
			<p>
				Profession:
				<%=user.getProfession()%>
			</p>
			<p>
				Contact Number:
				<%=user.getContactNumber()%>
			</p>
			<p>
				Address:
				<%=user.getAddress()%>
			</p>
			<%
			} else {
			%>
			<p>User not found or invalid user ID.</p>
			<%
			}
			%>
		</div>

		<button onclick="window.location.href='user-profile-edit.jsp'">Edit</button>


		<div class="section">
			<h2>Jobs Posted by Me</h2>
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
						<th></th>

					</tr>
				</thead>
				<tbody>
					<%
					JobDao jobsDao = new JobDaoImpl();
					List<Jobs> jobsList = jobsDao.getJobsOfUser(userId);
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
						<td><button
								onclick="deleteJob(<%=userId%>, <%=j.getJobId()%>)">Delete</button></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</main>

</body>
</html>
