<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<link rel="stylesheet" href="css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<link rel="icon" type="image/gif/png" href="dist/img/Letter-E-icon.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>| Home</title>
<link rel="stylesheet" href="plugins/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="plugins/AdminLTE.min.css">
<link rel="stylesheet" href="plugins/_all-skins.min.css">
</head>
<style>
html, body {
	background-color: #e6e6e6;
}
</style>
<body>
	<div class="container">
		<h1>
			Welcome <small></small>
		</h1>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">BrainBitz</a>
				</div>
				<ul class="nav navbar-nav">

					<li role="presentation" class="active"><a
						onclick="homeSubmit()">Home</a></li>
					<li role="presentation"><a onclick="viewcurrentbill()">View
							Current Bill</a></li>
					<li role="presentation"><a onclick="previousbills()">Previous
							Bills</a></li>
					<li role="presentation"><a onclick="homeControl()">Home Control</a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" onclick="logout()"><span
							class="fa fa-fw fa-unlock"></span> Log out</a></li>
				</ul>
			</div>
		</nav>
		<section class="content-header">
			<h1>User Profile</h1>
		</section>
		<section class="content">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-circle"
							src="dist/img/facebook-avatar.jpg" alt="User profile picture">
						<h3 class="profile-username text-center">
							<strong><c:out
									value="${sessionScope.userdetails.customerData.fullName}"></c:out></strong>
						</h3>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><b>Consumer Id</b> <a
								class="pull-right"><strong><c:out
											value="${sessionScope.userdetails.meterId}"></c:out></strong></a></li>
							<li class="list-group-item"><b>Landmark</b> <a
								class="pull-right"><c:out
										value="${sessionScope.userdetails.customerData.landmark}"></c:out></a></li>
							<li class="list-group-item"><b>Mob Phone</b> <a
								class="pull-right"><c:out
										value="${sessionScope.userdetails.customerData.phone}"></c:out></a></li>
							<li class="list-group-item"><b>Current Voltage</b> <a
								class="pull-right"><c:out
										value="${sessionScope.voltageValue}"></c:out></a></li>
						</ul>
						<a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
					</div>
				</div>
			</div>
		</section>
	</div>
	<form id="homesubmit" action="BillController" method="post">
		<input type="hidden" name="hidden" value="home">
	</form>
	<form id="viewcurrentbill" action="BillController" method="post">
		<input type="hidden" name="hidden" value="viewcurrentbill">
	</form>
	<form id="previousbills" action="BillController" method="post">
		<input type="hidden" name="hidden" value="previousbills">
	</form>
	<form id="logout" action="BillController" method="post">
		<input type="hidden" name="hidden" value="logout">
	</form>
	<form id="homeControl" action="BillController" method="post">
		<input type="hidden" name="hidden" value="getpageHomeControl">
	</form>

	<script src="plugins/jquery-2.2.3.min.js"></script>
	<script src="plugins/bootstrap.min.js"></script>
	<script src="plugins/fastclick.js"></script>
	<script src="plugins/app.min.js"></script>
	<script src="plugins/demo.js"></script>
</body>
<script type="text/javascript">
	function sentRequest() {
		var xhr = new XMLHttpRequest();
		xhr.open('POST', 'MainController', true);
		xhr.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');
		xhr.onload = function() {
			// do something to response
			console.log(this.responseText);
		};
		xhr.send('hidden=profile');
	}
	function homeSubmit() {
		document.getElementById("homesubmit").submit();
	}
	function viewcurrentbill() {
		document.getElementById("viewcurrentbill").submit();
	}
	function previousbills() {
		document.getElementById("previousbills").submit();
	}
	function logout() {
		document.getElementById("logout").submit();
	}
	function homeControl() {
		document.getElementById("homeControl").submit();
	}
	
	
</script>
</html>