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

<title>Home Page</title>

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<script src="https://use.fontawesome.com/db006bf474.js"></script>
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

<!-- Custom styles for this template-->
<link href="./../resources/css/sb-admin-2.min.css" rel="stylesheet">
<style>
.gif {
	border-radius: 20px;
	cursor: pointer;
}

.shadowme {
	box-shadow: 5px 5px 5px black;
}

tbody {
	color: black;
}

.pointer {
	cursor: pointer;
}

.navbar-nav {
	width: 600px;
}

.data {
	margin-top: 0vh;
}

.data h1 {
	font-size: 8vw;
	text-shadow: 1px 4px 10px rgba(0, 0, 0, 0.7);
}

.data h5 {
	font-size: 4vw;
	text-shadow: 1px 4px 10px rgba(0, 0, 0, 0.7);
}
#movevable_content{
float: center; 
width: 2000px; 
height: 600px; 
overflow: auto;
}
#movevable_content::-webkit-scrollbar {
  display: none;
</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<li
				class="sidebar-brand d-flex align-items-center justify-content-center bg-white">
				<span class="sidebar-brand-text mx-3"> <img
					src="./../resources/images/bulb.gif" height="70px" width="224.5px"
					alt="">
			</span> <!--  <i class="fas fa-laugh-wink"></i> -->
			</li>

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" > <i
					class="fas fa-fw fa-tachometer-alt"></i> <span
					style="font-size: 1.5em;">Dashboard</span></a></li>
			<li>
				<hr class="sidebar-divider">
			</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<spring:url value='/admin/home'/>" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-home"></i> <span
					style="font-size: 1.2em;">Home</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<spring:url value='/admin/profile'/>" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-fw fa-user"></i> <span
					style="font-size: 1.2em;">Profile</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="<spring:url value='/admin/register'/>" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-user"></i> <span
					style="font-size: 1.2em;">Add User</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="<spring:url value='/admin/search_consumer'/>" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-fw fa-users"></i>
					<span style="font-size: 1.2em;">View Consumer</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<spring:url value='/admin/sub_admins'/>" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-fw fa-users"></i>
					<span style="font-size: 1.2em;">View Sub Admins</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<spring:url value='/admin/search'/>" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-fw fa-tasks"></i>
					<span style="font-size: 1.2em;">Generate Bills</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<spring:url value='/admin/search_bill_report'/>"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-tasks"></i> <span style="font-size: 1.2em;">Bill
						Report</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<spring:url value='/admin/search_payment_report'/>"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-tasks"></i> <span style="font-size: 1.2em;">Payment
						Report</span>
			</a></li>

		</ul>
		<div id="content-wrapper" class="d-flex flex-column">

			<div id="content">

				<nav
					class="navbar navbar-expand navbar-light bg-black topbar mb-4 static-top shadow"
					style="background-color: black;">

					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"> </i>
					</button>

					<ul class="navbar-nav ml-auto col-12">

						<li
							class="nav-item dropdown no-arrow h2 text-light mx-1 d-flex align-items-center pointer col-md-10">
							<i class="fas fa-fw fa-lightbulb-o mr-2 "></i> <b> Online
								Electricity Bill Generator </b>
						</li>

						<!-- <div class="topbar-divider d-none d-sm-block"></div> -->

						<li class="nav-item dropdown no-arrow align-self-md-center">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"><img class="img-profile rounded-circle"
								src="./../resources/images/gif11.gif"> <span
								class="mr-2 d-none d-lg-inline text-light-600 large"><b>&nbsp;&nbsp;&nbsp;${sessionScope.user_details.firstName}&nbsp;&nbsp;&nbsp;${sessionScope.user_details.lastName}</b></span>
						</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item"
									href="<spring:url value='/user/logout'/>" data-toggle="modal"
									data-target="#logoutModal">Logout</a>
							</div>
						</li>

					</ul>

				</nav>
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Admin Panel</h1>
						<h1 class="h5 mb-0 text-gray-600">
							<b>For Support: </b> <i
								class="fas fa-phone-square ml-4 fa-sm fa-fw mr-2 "></i>+91
							8484904280 <i class="fa fa-envelope mr-2 ml-4" aria-hidden="true">
								onlinebilelectricity@gmail.com</i>

						</h1>
					</div><br>

					<!-- Content Row -->
					<div class="row">

						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-large font-weight-bold text-success text-uppercase mb-1">Total
												Consumers</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${requestScope.count}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-check fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div><br><br><br>
					<section class="header-extradiv">
						<div class="container">
							<div class="row">
								<div class="extra-div col-lg-3 col-md-4 col-12">
									<a href="#" style="color: steelblue;"><i
										class="fa-3x fa fa-user" aria-hidden="true"></i></a>
									<h2>
										VIEW <br> PROFILE
									</h2>
									<a href="<spring:url value='/admin/profile'/>"><input
										type="button" value="Go" class="btn btn-outline-primary"></a>
								</div>
								<div class="extra-div col-lg-3 col-md-4 col-12">
									<a href="#" style="color: crimson;"><i
										class="fa-3x fa fa-desktop" aria-hidden="true"></i></a>
									<h2>
										VIEW <br> CONSUMER
									</h2>
									<a href="<spring:url value='/admin/search_consumer'/>"><input
										type="button" value="Go" class="btn btn-outline-primary"></a>
								</div>
								<div class="extra-div col-lg-3 col-md-4 col-12" >
									<a href="#" style="color: yellowgreen;"><i
										class="fa-3x fa fa-magic" aria-hidden="true"></i></a>
									<h2>
										GENERATE <br> BILL
									</h2>
									<a href="<spring:url value='/admin/search'/>"><input
										type="button" value="Go" class="btn btn-outline-primary"></a>
								</div>
								<div class="extra-div col-lg-3 col-md-4 col-12">
									<a href="#" style="color: gray;"><i
										class="fa-3x far fa-credit-card" aria-hidden="true"></i></a>
									<h2>PAYMENT <br> REPORT</h2>
									<a href="<spring:url value='/admin/search_payment_report'/>"><input
										type="button" value="Go" class="btn btn-outline-primary"></a>
								</div>
							</div>

						</div>
					</section>
					<br> <br>
				</div>
			</div>
		</div>

	</div>

	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary"
						href="<spring:url value='/user/logout'/>">Logout</a>
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
		<h2><b>Welcome Admin Home Page.....!!!!!!</b></h2>
		<h4>
			<a href="<spring:url value='/admin/profile'/>">Admin Profile</a>
		</h4>
		<h4>
			<a href="<spring:url value='/user/logout'/>">Log Out</a>
		</h4>
	</div>
</body>
</html> --%>