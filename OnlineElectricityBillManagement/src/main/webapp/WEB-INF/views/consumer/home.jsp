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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
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

#bgimage {
	position: absolute;
	top: 0;
	min-height: 100vh;
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
}
</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<li
				class="sidebar-brand d-flex align-items-center justify-content-center bg-white" >	  
              	<div class="sidebar-brand-text mx-3"> <img src="./../resources/images/bulb.gif" height="70px" width="224.5px" alt=""> </div>
   
			</li>

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" > <i
					class="fas fa-fw fa-tachometer-alt"></i> <span style="font-size: 1.5em;">Dashboard</span></a></li>
			<li>
			<hr class="sidebar-divider">
			</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<spring:url value='/consumer/home'/>" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-home"></i> <span
					style="font-size: 1.2em;">Home</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<spring:url value='/consumer/profile'/>" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-fw fa-user"></i> <span
					style="font-size: 1.2em;">Profile</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<spring:url value='/consumer/current_bill'/>"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-magic"></i> <span style="font-size: 1.2em;">Current
						Bill</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<spring:url value='/consumer/bill_history'/>"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-tasks"></i> <span style="font-size: 1.2em;">Bill
						History</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<spring:url value='/consumer/payment_history'/>"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-credit-card"></i> <span
					style="font-size: 1.2em;">Payment History</span>
			</a></li>


		</ul>
		<div id="content-wrapper" class="d-flex flex-column">

			<div id="content">

				<nav
					class="navbar navbar-expand navbar-light bg-whit topbar mb-4 static-top shadow"
					style="background-color: black;">

					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"> </i>
					</button>

					<ul class="navbar-nav ml-auto col-12">

						<li
							class="nav-item dropdown no-arrow h2 text-light mx-1 d-flex align-items-center pointer col-md-10">
							<i class="fas fa-fw fa-lightbulb-o mr-2 "></i><b>
								Online Electricity Bill Generator </b>
						</li>

						<!-- <div class="topbar-divider d-none d-sm-block"></div> -->

						<li class="nav-item dropdown no-arrow align-self-md-right"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <img
								class="img-profile rounded-circle"
								src="./../resources/images/gif11.gif"><span
								class="mr-2 d-none d-lg-inline text-light-600 large"><b>&nbsp;&nbsp;&nbsp;${sessionScope.user_details.firstName}&nbsp;&nbsp;&nbsp;${sessionScope.user_details.lastName}</b></span>

						</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item"
									href="<spring:url value='/user/logout'/>" data-toggle="modal"
									data-target="#logoutModal">Logout</a>
							</div></li>

					</ul>

				</nav>
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Consumer Panel</h1>
						<h1 class="h5 mb-0 text-gray-600">
							<b>For Support: </b> <i
								class="fas fa-phone-square ml-4 fa-sm fa-fw mr-2 "></i>+91
							8484904280 <i class="fa fa-envelope mr-2 ml-4" aria-hidden="true">
								onlinebilelectricity@gmail.com</i>

						</h1>
					</div>


						<div class="col-xl-8 mb-4">

						<!-- Project Card Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
							<h5 align="center" style="color: green;">${requestScope.message}</h5>
								<h5 class="m-0 font-weight-bold text-info">Has To Read</h5>
							</div><br>
							<h5 class="col-md-12"><b>1. Main Reason behind this facility to save your time, provide payment security, easy to track bill status and consumer can pay bill any time (24X7). </b></h5>
							<h5 class="col-md-12"><b>2. Consumer has to pay the bill before last payment date. If not paid before due date and paid before next month bill generation then extra fine of Rs.20 will be added.</b></h5>
							<h5 class="col-md-12"><b>3. If consumer not paid last month bill till generation of next month bill then last month bill forwarded along with late fine of Rs.50 in current month bill.</b></h5>
							<h5 class="col-md-12"><b>4. If there is any issue regarding bill, payment or else,  you may call or send mail to our support.</b></h5>
							<div class="card-body row">	
							</div>
						</div>

					</div>
					
					<!-- Content Row -->

					<section class="header-extradiv">
						<div class="container">
							<div class="row">
								<div class="extra-div col-lg-3 col-md-4 col-12">
									<a href="#" style="color: steelblue;"><i
										class="fa-3x fa fa-user" aria-hidden="true"></i></a>
									<h2>
										VIEW <br> PROFILE
									</h2>
									<a href="<spring:url value='/consumer/profile'/>"><input
										type="button" value="Go" class="btn btn-outline-info"></a>
								</div>
								<div class="extra-div col-lg-3 col-md-4 col-12">
									<a href="#" style="color: crimson;"><i
										class="fa-3x fa fa-desktop" aria-hidden="true"></i></a>
									<h2>
										CURRENT <br> BILL
									</h2>
									<a href="<spring:url value='/consumer/current_bill'/>"><input
										type="button" value="Go" class="btn btn-outline-info"></a>
								</div>
								<div class="extra-div col-lg-3 col-md-4 col-12" >
									<a href="#" style="color: yellowgreen;"><i
										class="fa-3x fa fa-magic" aria-hidden="true"></i></a>
									<h2>
										BILL <br> HISTORY
									</h2>
									<a href="<spring:url value='/consumer/bill_history'/>"><input
										type="button" value="Go" class="btn btn-outline-info"></a>
								</div>
								<div class="extra-div col-lg-3 col-md-4 col-12">
									<a href="#" style="color: gray;"><i
										class="fa-3x far fa-credit-card" aria-hidden="true"></i></a>
									<h2>PAYMENT HISTORY</h2>
									<a href="<spring:url value='/consumer/payment_history'/>"><input
										type="button" value="Go" class="btn btn-outline-info"></a>
								</div>
							</div>

						</div>
					</section>

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
	<script>
		$('.carousel').carousel({
			interval : 2000
		})
	</script>

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