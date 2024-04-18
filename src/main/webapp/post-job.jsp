<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<style>
form {
	width: 50%;
	margin: 0 auto;
	padding: 20px;
	box-sizing: border-box;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="number"], input[type="email"] {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}
</style>
<head>
<meta charset="UTF-8">
<title>Hire a fellow</title>
</head>
<jsp:include page="header.jsp" />
<header>
	<div>
		<a href="user-home.jsp">Home</a>
	</div>
	<div>
		<a href="user-profile.jsp">My Account</a>
	</div>
	<div>
		<a href="logout.jsp">Logout</a>
	</div>
</header>
<body>
	<h1>Create a Job</h1>
	<main>
		<form action="post-a-job" method="post">
			<div class="form-group">
				<label for="profile">Job Title:</label> <input type="text"
					id="profile" name="profile" required>
			</div>
			<div class="form-group">
				<label for="desc">Job Description:</label> <input type="text"
					id="desc" name="desc" required>
			</div>
			<div class="form-group">
				<label for="exp">Experience:</label> <input type="number" id="exp"
					name="exp" required>
			</div>
			<div class="form-group">
				<label for="techs">Required Technical Skills:</label> <input
					type="text" id="techs" name="techs" required>
			</div>
			<div class="form-group">
				<label for="contact">Email:</label> <input type="email" id="contact"
					name="contact" required>
			</div>
			<div class="form-group">
				<input type="submit" value="Post Job">
			</div>

		</form>
	</main>
</body>
<jsp:include page="footer.jsp" />
</html>