<!-- index.jsp -->
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="WEB-INF/view/css/styles.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="footer.jsp" />


	<main>
		<h1>Welcome to University of Central Missouri Information Systems Alumas Page</h1>
		<section class="hero">
			<h2>Connect with Your Computer Information Systems Alma Mater</h2>
			<p>Find jobs, Manage your profile, network with fellow alumni, and stay
				updated with alumni events.</p>
		</section>

		<section class="features">
			<div class="feature">
				<h3>Login</h3>
				<p>
					Already have an account? <a href=login.jsp>Login</a> to manage your
					profile and connect with others.
				</p>
			</div>
			<div class="feature">
				<h3>Create Account</h3>
				<p>
					Don't have an account yet? <a href="register.jsp">Create
						Account</a> to access exclusive features.
				</p>
			</div>
			<div class="feature">
				<h3>Network</h3>
				<p>Expand your professional network by connecting with fellow
					alumni.</p>
			</div>
		</section>
	</main>
</body>
</html>
