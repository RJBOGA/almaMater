<!DOCTYPE html>

<html>
<head>
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<style>
body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	background-color: #fff;
}

header, main, footer {
	width: 100%;
	max-width: 400px;
	text-align: center;
}

main {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
	margin-bottom: 20px;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.form-group {
	margin-bottom: 1rem;
}

label {
	margin-bottom: 0.5rem;
}

input[type="number"], input[type="text"], input[type="password"], input[type="email"],
	input[type="submit"] {
	width: 100%;
	padding: 0.5rem;
	border-radius: 4px;
	border: 1px solid #ccc;
}

input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<jsp:include page="footer.jsp" />
<body>
	<header>
		<img
			src="https://marvel-b1-cdn.bc0a.com/f00000000155119/www.ucmo.edu/_resources/img/logo-300-px-c.png"
			alt="University of Central Missouri Logo" />
	</header>

	<main>
		<!-- Login form -->
		<form action="login" method="post">
			<div class="form-group">
				<label for="username">User Name(Student ID):</label> <input
					type="text" id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" required>
			</div>
			<div class="form-group">
				<input type="submit" value="Login">
			</div>
		</form>
	</main>

</body>
</html>
