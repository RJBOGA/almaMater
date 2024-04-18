<!DOCTYPE html>
<jsp:include page="header.jsp" />
<jsp:include page="footer.jsp" />

<html>
<style>
body {
	margin: 0;
	padding: 0;
}

main {
	margin: 20px auto;
	width: 80%;
	padding: 20px;
	box-sizing: border-box;
}

h2 {
	color: #333;
	text-align: center;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: inline-block;
	width: 150px;
}

.form-group input[type="text"], .form-group input[type="email"],
	.form-group input[type="password"], .form-group input[type="number"],
	.form-group input[type="tel"] {
	width: 200px;
	padding: 5px;
	margin-bottom: 10px;
}

button[type="submit"] {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	margin-right: 10px;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
<head>
<title>Register</title>
<link rel="stylesheet" type="text/css"
	href="WEB-INF/view/css/styles.css">
</head>
<body>
	<h2>Create Account</h2>
	<main>
		<form action="register" method="post">

			<div class="form-group">
				<label for="studentId">Student Id:</label> <input type="number"
					id="studentId" name="studentId" required>
			</div>

			<div class="form-group">
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" required>
			</div>

			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" required>
			</div>

			<div class="form-group">
				<label for="firstName">First Name:</label> <input type="text"
					id="firstName" name="firstName" required>
			</div>

			<div class="form-group">
				<label for="lastName">Last Name:</label> <input type="text"
					id="lastName" name="lastName" required>
			</div>

			<div class="form-group">
				<label for="department">Department:</label> <input type="text"
					id="department" name="department" required>
			</div>

			<div class="form-group">
				<label for="graduationYear">Graduation Year:</label> <input
					type="number" id="graduationYear" name="graduationYear" required>
			</div>

			<div class="form-group">
				<label for="profession">Profession:</label> <input type="text"
					id="profession" name="profession" required>
			</div>

			<div class="form-group">
				<label for="contactNumber">Contact Number:</label> <input type="tel"
					id="contactNumber" name="contactNumber" required>
			</div>

			<div class="form-group">
				<label for="address">Address:</label> <input type="text"
					id="address" name="address" required>
			</div>

			<div class="form-group">
				<input type="submit" value="Create Account">
			</div>
			<p>
				Already have an account? <a href=login.jsp>Login</a>
			</p>
		</form>
	</main>

</body>
</html>
