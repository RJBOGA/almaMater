<%@ page import="com.almaMater.entities.User"%>
<%@ page import="com.almaMater.dao.UserDao"%>
<%@ page import="javax.servlet.http.Cookie"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.util.List"%>
<jsp:include page="header.jsp" />
<jsp:include page="footer.jsp" />



<%
// Retrieve user ID from cookie or session
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

// Update user information
if (request.getMethod().equalsIgnoreCase("post")) {
	String email = request.getParameter("email");
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String department = request.getParameter("department");
	int graduationYear = Integer.parseInt(request.getParameter("graduationYear"));
	String profession = request.getParameter("profession");
	String contactNumber = request.getParameter("contactNumber");
	String address = request.getParameter("address");

	// Update user object
	user.setEmail(email);
	user.setFirstName(firstName);
	user.setLastName(lastName);
	user.setDepartment(department);
	user.setGraduationYear(graduationYear);
	user.setProfession(profession);
	user.setContactNumber(contactNumber);
	user.setAddress(address);
	boolean success = userDao.updateUser(user);
	if (success) {

		response.sendRedirect("user-profile.jsp");
	} else {
		response.sendRedirect("error.jsp");
	}
}

if (request.getParameter("delete") != null) {
	boolean deleted = userDao.deleteUserById(userId);
	if (deleted) {
		// User deleted successfully, redirect to login page or show a message
		response.sendRedirect("logout.jsp");
	} else {
		// Failed to delete user, you can redirect or show an error message here
		response.sendRedirect("error.jsp");
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<title>My Account</title>
<style>
body {
	margin: 0;
	padding: 0;
}

input[type=edit], input[type=submit], input[type=save], input[type=back]
	{
	background-color: #cf202e;
}

main {
	margin: 20px auto;
	width: 80%;
	padding: 20px;
	box-sizing: border-box;
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
}

.user-profile-details input[type="text"] {
	width: 200px;
	padding: 5px;
	margin-bottom: 10px;
}

.user-profile-details label {
	display: inline-block;
	width: 150px;
}

button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	margin-right: 10px;
}

button:hover {
	background-color: #0056b3;
}
</style>
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
			User Profile +
			<%=userId%></h3>

		<div class="user-profile-details">
			<%
			if (user != null) {
			%>
			<form method="post" action="">
				<div>
					<label for="studentId">Student ID:</label> <input type="text"
						id="studentId" name="studentId" value="<%=user.getStudentId()%>"
						readonly="readonly" style="border: none;">
				</div>

				<div>
					<label for="email">Email:</label> <input type="text" id="email"
						name="email" value="<%=user.getEmail()%>">
				</div>
				<div>
					<label for="firstName">First Name:</label> <input type="text"
						id="firstName" name="firstName" value="<%=user.getFirstName()%>">
				</div>
				<div>
					<label for="lastName">Last Name:</label> <input type="text"
						id="lastName" name="lastName" value="<%=user.getLastName()%>">
				</div>
				<div>
					<label for="department">Department:</label> <input type="text"
						id="department" name="department"
						value="<%=user.getDepartment()%>">
				</div>
				<div>
					<label for="graduationYear">Graduation Year:</label> <input
						type="text" id="graduationYear" name="graduationYear"
						value="<%=user.getGraduationYear()%>">
				</div>
				<div>
					<label for="profession">Profession:</label> <input type="text"
						id="profession" name="profession"
						value="<%=user.getProfession()%>">
				</div>
				<div>
					<label for="contactNumber">Contact Number:</label> <input
						type="text" id="contactNumber" name="contactNumber"
						value="<%=user.getContactNumber()%>">
				</div>
				<div>
					<label for="address">Address:</label> <input type="text"
						id="address" name="address" value="<%=user.getAddress()%>">
				</div>
				<input type="submit" value="Save"> <a
					href="user-profile.jsp"><input type="submit" value="Back"></a>

			</form>
			<%
			} else {
			%>
			<p>User not found or invalid user ID.</p>
			<%
			}
			%>
		</div>

	</main>

</body>
</html>
