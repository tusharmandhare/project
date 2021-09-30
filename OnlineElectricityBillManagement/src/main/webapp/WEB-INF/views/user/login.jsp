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

<title>login</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=RocknRoll+One&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>

<body class="bg-primary">
<nav class="navbar navbar-expand-lg" style="background-color:  #003399;" >
		<i class="fa fa-lightbulb-o"></i>
        <a class="navbar-brand text-light mr-4 pt-2" href="#">Welcome to Online Electricity Bill Generator</a>
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
                <li class="text-light mr-4 pt-2"><a class="navbar-brand text-light" href="<spring:url value='/user/register'/>"> Sign Up </a></li>
            </ul>
          </form>
        </div>
      </nav>

	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 ">
						<img src="./../resources/images/login.gif" width="100%" alt="">
					</div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center pt-5">
								<h1 class=" text-gray-900 mb-4">Log In</h1>
								<h5 align="center"
									style="${requestScope.message eq 'Invalid Login ,Please Retry' ? 'color:red' : 'color:green' }">${requestScope.message}</h5>
								<hr>
							</div>
							<form method="POST">
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										name="email" placeholder="Email Address">
								</div>
								<div class="form-group row">
									<div class="col-sm-12 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											name="password" placeholder="Password">
									</div>
								</div>
								<input type="submit" value="Login"
									class="btn btn-primary btn-user btn-block">
								<div class="form-group row">
									<div class="col-sm-12 mb-3 mb-sm-0">
										<a href="<spring:url value='/user/password'/>">Forgot
											Password ?</a>
									</div>
								</div>
								<div class="form-group row"></div>
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
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<body>
	<div class="container">
		<h5 align="center" style="color: blue;">${requestScope.message}</h5>
		<spring:url var="url" value="/user/authenticate"/>
		<form method="post">
			<table border="1" class="table">
				<tr class="t">
					<th class="thead-dark">Enter User Email</th>
					<td><input type="text" name="email" /></td>
				</tr>
				<tr>
					<th class="thead-dark">Enter Password</th>
					<th><input type="password" name="password" /></th>
				</tr>
				<tr>
					<th align="center" class="thead-dark"><input type="submit" value="Login" /></th>
					<th><a href="<spring:url value='/user/password'/>">Forgot Password</a></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html> --%>