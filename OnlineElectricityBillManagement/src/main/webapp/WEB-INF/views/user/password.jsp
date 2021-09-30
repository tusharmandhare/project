<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- import spring JSPtag lib for URL rewriting -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Forgot Password</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=RocknRoll+One&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<nav class="navbar navbar-expand-lg" style="background-color:  #003399;" >
		<i class="fa fa-lightbulb-o"></i>
        <a class="navbar-brand text-light" href="#">Welcome to Online Electricity Bill Generator</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link text-light" href="#"> <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-light" href="#"></a>
            </li>
          </ul>
          <form class="form-inline my-2 my-lg-0">
            <ul class="navbar-nav">
                <li class="text-light mr-4 pt-2"><a class="navbar-brand text-light" href="<spring:url value='/'/>"> Home </a></li>
                <li class="text-light mr-4 pt-2"><a class="navbar-brand text-light" href="<spring:url value='/user/login'/>"> Log In </a></li>
            </ul>
          </form>
        </div>
      </nav>

<body class="bg-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-4 d-flex align-items-center ">
						<img src="./../resources/images/login.gif" width="80%"
							style="margin-left: 10%;" alt="">
					</div>
					<div class="col-lg-8">
						<div class="p-5">
							<div class="text-center pt-5">
								<h1 class=" text-gray-900 mb-4">Set Password</h1>
								<h5 align="center" style="color: red;">${requestScope.message}</h5>
								<hr>
							</div>

							<form method="POST" class="user">
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										name="email" placeholder="Email Address">
								</div>
								<div class="form-group">
									<input type="number" class="form-control form-control-user"
										name="phone" placeholder="Mobile Number">
								</div>
								<div class="form-group row">
									<div class="col-sm-12 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											name="password" placeholder="New Password">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											name="confirmPassword" placeholder="Confirm Password">
									</div>
								</div>
								<input type="submit" value="Submit"
									class="btn btn-primary btn-user btn-block">
							</form>
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
	<div class="container">
		<form method="post">
		<h5 align="center" style="color: red;">${requestScope.message}</h5>
			<table border="1" class="table">
				<tr class="t">
					<th class="thead-dark">Enter User Email</th>
					<td><input type="text" name="email" /></td>
				</tr>
				<tr class="t">
					<th class="thead-dark">Enter User Phone Number</th>
					<td><input type="number" name="phone" /></td>
				</tr>
				<tr>
					<th class="thead-dark">Enter New Password</th>
					<th><input type="password" name="password" /></th>
				</tr>
				<tr>
					<th align="center" colspan = "2" class="thead-dark"><input type="submit" value="Submit" /></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html> --%>