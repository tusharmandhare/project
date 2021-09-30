<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import spring JSPtag lib for URL rewriting -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- import, for the form binding technique, spring supplied form tag lib -->
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SignUp</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
#movevable_content {
	float: center;
	width: 2000px;
	height: 690px;
	overflow: auto;
}

#movevable_content::-webkit-scrollbar {
	display: none;
}
</style>
</head>

<body class="bg-primary">

	<nav class="navbar navbar-expand-lg" style="background-color: #003399;">
		<i class="fa fa-lightbulb-o"></i> <a class="navbar-brand text-light"
			href="#">Welcome to Online Electricity Bill Generator</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link text-light"
					href="#"> <span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link text-light" href="#"></a>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<ul class="navbar-nav">
					<li class="text-light mr-4 pt-2"><a
						class="navbar-brand text-light" href="<spring:url value='/'/>">
							Home </a></li>
					<li class="text-light mr-4 pt-2"><a
						class="navbar-brand text-light"
						href="<spring:url value='/user/login'/>"> Log In </a></li>
				</ul>
			</form>
		</div>
	</nav>

	<div class="container" id="movevable_content">

		<div class="row justify-content-center">

			<div class="col-xl-8 mb-4">

				<!-- Project Card Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h4 align="center" class="m-0 font-weight-bold text-primary">Register</h4>
						<h5 align="center" style="color: red;">${requestScope.message}</h5>
					</div>
					<div class="card-body row">
						<form:form method="post" modelAttribute="user" class="user col-12">
							<div class="form-group">
								<label for=""> <i class="fas fa-user"></i> First Name*
								</label>
								<form:input path="firstName" type="text"
									class="form-control form-control-user"
									placeholder="Enter First Name (min= 3 Characters)" />
								<form:errors path="firstName" style="color: red;" />
							</div>
							<div class="form-group">
								<label for=""> <i class="fas fa-user"></i> Last Name*
								</label>
								<form:input path="lastName" type="text"
									class="form-control form-control-user"
									placeholder="Enter Last Name (min= 3 Characters)" />
								<form:errors path="lastName" style="color: red;" />
							</div>
							<div class="form-group">
								<label for=""> <i class="fas fa-envelope"></i> Email*
								</label>
								<form:input path="email" type="email"
									class="form-control form-control-user"
									placeholder="Enter Email Address" />
								<form:errors path="email" style="color: red;" />
							</div>
							<div class="form-group">
								<label for=""><i class="fas fa-phone-square"></i> Mobile
									Number*</label>
								<form:input type="number" path="phone"
									class="form-control form-control-user"
									placeholder="Enter Mobile Number" />
								<form:errors path="phone" style="color: red;" />
							</div>
							<div class="form-group">
								<label><i class="fas fa-home"></i> Address*</label>
								<form:input path="address" type="text"
									class="form-control form-control-user"
									placeholder="Enter Address" />
								<form:errors path="address" style="color: red;" />
							</div>
							<div class="form-group">
								<label> <i class="fas fa-group"></i> Zone*
								</label>
								<form:input path="zone" type="text"
									class="form-control form-control-user" placeholder="Enter Zone" />
								<form:errors path="zone" style="color: red;" />
							</div>
							<div class="form-group">
								<label> <i class="fas fa-globe"></i> City*
								</label>
								<form:input path="city" type="text"
									class="form-control form-control-user" placeholder="Enter city" />
								<form:errors path="city" style="color: red;" />
							</div>
							<div class="form-group">
								<label> <i class="fas fa-building"></i> State*
								</label>
								<form:input path="state" type="text"
									class="form-control form-control-user"
									placeholder="Enter State" />
								<form:errors path="state" style="color: red;" />
							</div>
							<div class="form-group row">
								<div class="col-sm-12 mb-3 mb-sm-0">
									<label> <i class="fas fa-key"></i> Password*
									</label>
									<form:input path="password" type="password"
										class="form-control form-control-user"
										placeholder="Enter Password" />
									<form:errors path="password" style="color: red;" />
								</div>
							</div>
							<input type="submit" value="Submit"
								class="btn btn-primary btn-user btn-block">
						</form:form>
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
</head>
<body>
<div class="container">
		<h5 align="center" style="color: red;">${requestScope.message}</h5>
		<!-- step 2 of data binding -->
		<h4 align="center" style="color: Black;">Enter User Details</h4>
		<form:form method="post" modelAttribute="user">
			<table  class="table">
				<tr>
					<th class="thead-dark">Enter First Name</th>
					<td><form:input path="firstName" /></td>
					<td><form:errors path="firstName" /></td>
				</tr>
				<tr>
					<th class="thead-dark">Enter Last Name</th>
					<td><form:input path="lastName" /></td>
					<td><form:errors path="lastName" /></td>
				</tr>
				<tr>
					<th class="thead-dark">Enter Email</th>
					<td><form:input path="email" /></td>
					<td><form:errors path="email" /></td>
				</tr>
				<tr>
					<th class="thead-dark">Enter Password</th>
					<td><form:input path="password" /></td>
					<td><form:errors path="password" /></td>
				</tr>
				<tr>
					<th class="thead-dark">Enter Phone</th>
					<td><form:input type="number" path="phone" /></td>
					<td><form:errors path="phone" /></td>
				</tr>
				<tr>
					<th class="thead-dark">Enter Address</th>
					<td><form:input path="address" /></td>
					<td><form:errors path="address" /></td>
				</tr>
				<tr>
					<th class="thead-dark">Enter Zone</th>
					<td><form:input path="zone" /></td>
					<td><form:errors path="zone" /></td>
				</tr>
				<tr>
					<th class="thead-dark">Enter City</th>
					<td><form:input path="city" /></td>
					<td><form:errors path="city" /></td>
				</tr>
				<tr>
					<th class="thead-dark">Enter State</th>
					<td><form:input path="state" /></td>
					<td><form:errors path="state" /></td>
				</tr>
				<tr>
					<th class="thead-dark">Choose Role</th>
					<td><form:radiobuttons path="role" items="${requestScope.role}"/>
					<td><form:errors path="role" /></td>
				</tr>
				<tr>
					<th align="center" colspan = "2" class="thead-dark"><input type="submit" value="Enter Details" /></th>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>  --%>