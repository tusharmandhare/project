<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import spring JSPtag lib for URL rewriting -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Electricity Bill</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=RocknRoll+One&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
}

#carouselExampleSlidesOnly {
	position: absolute;
	top: 0;
	min-height: 100vh;
}

.carousel img {
	width: 100%;
}

nav {
	z-index: 999;
	font-family: 'RocknRoll One', sans-serif;
}

.header {
	/* background:url('./images/background.png'); */
	background-size: cover;
}

.data {
	margin-top: 25vh;
}

.data h1 {
	font-size: 10vw;
	line-height: 8vw;
	text-shadow: 1px 4px 10px rgba(0, 0, 0, 0.7);
}

.data h5 {
	font-size: 2.5vw;
	text-shadow: 1px 4px 4px rgba(0, 0, 0, 0.25);
}
</style>
</head>
<body>

	<div class="container-fluid">

		<div class="row header">
			<div id="carouselExampleSlidesOnly"
				class="carousel slide m-0 p-0 col-md-12" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="./resources/images/background.png" class="d-block w-100"
							alt="">
					</div>
					<div class="carousel-item">
						<img src="./resources/images/line.jpg" class="d-block w-100"
							alt="">
					</div>
					<div class="carousel-item">
						<img src="./resources/images/ab.jpg" class="d-block w-100"
							alt="">
					</div>
				</div>
			</div>

			<div class="col-md-6 offset-md-6 text-center">
				<div class="data text-light">
					<h1>Welcome</h1>
					<h5>to Online Electricity Bill Generator</h5>
					<div class="d-fle mt-4">
						<a href="<spring:url value='/user/login'/>"><input
							type="button" class="btn btn-light btn-lg col-4" value="Login"></a>
						<a href="<spring:url value='/user/register'/>"><input
							type="button" class="btn btn-outline-light btn-lg col-4"
							value="Sign up"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	    $('.carousel').carousel({
	        interval: 3000
	        })
	</script>
</body>
</html>

<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.std {background ="${pageContext.request.contextPath}/resources/images/line.jpg"}
</style>
<style>
body, html {
	height: 100%;
	margin: 0;
}

.bg {
	background-image:
		url("${pageContext.request.contextPath}/resources/images/b.jpg");
	height: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="bg">
	<div class="container">
		<h1 style="color: white;">
			<b>Welcome to Online Electricity Bill.....!!!!!!</b>
		</h1>
		<h4 style="color: white;">
			<a href="<spring:url value='/user/login'/>">Sign in</a>
		</h4>
		<h4 style="color: white;">
			<a href="<spring:url value='/user/register'/>">Sign up</a>
		</h4>
	</div>
</body>
</html> --%>