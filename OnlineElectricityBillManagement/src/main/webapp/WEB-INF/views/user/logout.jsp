 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>logout</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=RocknRoll+One&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>

<body class="bg-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 ">
						<img src="./../resources/images/logout.gif" width="100%" alt="">
					</div>
					<div class="col-lg-7">
						<div class="p-5">
						<div class="text-center pt-5">
								<h1 class=" text-gray-900 mb-4">Log Out</h1>
								<h3 align="center">Hello, ${requestScope.details}</h3>
							</div>
							<div class="form-group">
									<h4 align="center">You have logged out Sucessfully</h4>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="Container">
		<h3 align="center">Hello, ${requestScope.details}</h3>
		<h4 align="center">You have logged out n will be auto taken to home page shortly</h4>
	</div>
</body>
</html> --%>