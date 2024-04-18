<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ucmo</title>
<style>
header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #333;
	color: #fff;
	padding: 10px 20px;
}

header a {
	color: #fff;
	text-decoration: none;
	margin-right: auto;
}

header a:hover {
	text-decoration: underline;
}

header .logo {
	height: 50px;
	margin-right: 10px;
}
</style>
</head>
<body>
	<header>
		<div></div>
		<a href="index.jsp"> <img class="logo"
			src="https://marvel-b1-cdn.bc0a.com/f00000000155119/www.ucmo.edu/_resources/img/logo-300-px-c.png"
			alt="University of Central Missouri Logo" />
		</a>
		<div class="user-options"></div>
		<div class="button-container">
			<a href="comingsoon-service.jsp">About</a>
			<a> Request a LOR </a>
			<a>Volunteer</a>
			<a>Giving Back</a>
			<a>Guest Lecture</a>
			<a>More</a>
			<a>UCMO.EDU</a>
			<a>Other Services</a>
		</div>

	</header>
</body>
</html>
