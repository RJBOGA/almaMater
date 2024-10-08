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

.button-container {
	display: flex; /* Arrange buttons horizontally */
	flex-wrap: wrap; /* Allow buttons to wrap if needed */
	margin: 0 auto; /* Center the button container horizontally */
}

.button-container a {
	background-color: #cf202e;
	/* Add a thin border */
	padding: 10px 20px; /* Add some padding inside the buttons */
	margin: 5px; /* Add some space between buttons */
	text-decoration: none; /* Remove underline from links */
	color: #333; /* Text color */
	font-family: sans-serif; /* Use a sans-serif font */
	cursor: pointer; /* Indicate clickable behavior on hover */
}

.button-container a:hover {
	background-color: #e0e0e0; /* Slightly darker background on hover */
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
			<a href="comingsoon-service.jsp"> Request a LOR </a> 
			<a href="comingsoon-service.jsp">Volunteer</a>
			<a href="comingsoon-service.jsp">Giving Back</a> 
			<a href="comingsoon-service.jsp">Guest Lecture</a> 
			<a href="comingsoon-service.jsp">More</a> 
			<a href="https://www.ucmo.edu/">Official Website</a> 
			<a href="comingsoon-service.jsp">Other Services</a>
		</div>

	</header>
</body>
</html>
