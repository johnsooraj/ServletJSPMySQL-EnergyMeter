<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<link rel="stylesheet" href="css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<link rel="icon" type="image/gif/png"
	href="dist/img/Letter-E-icon.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrator | Home</title>
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

.toolbar {
	background-color: gray;
	width: 100%;
	height: auto;
}

.contentArea {
	background-color: black;
	width: 100%;
	height: 100%;
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
					<li role="presentation"><a onclick="addcustomer()">Add A
							Customer</a></li>
					<li role="presentation"><a onclick="addTransformer()">Add
							New Transformer</a></li>
					<li role="presentation"><a onclick="viewConsumers()">view
							consumers</a></li>
					<li role="presentation"><a onclick="viewTrasformars()">view
							transformers</a></li>
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
							src="dist/img/user4-128x128.jpg" alt="User profile picture">
						<h3 class="profile-username text-center">
							<%-- <c:out value="${sessionScope.userdata.primaryDetails.firstName}"></c:out> --%>
						</h3>
						<p class="text-muted text-center">Electricity Administrator</p>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><b>An admin can add new
									consumers</b>
							<li class="list-group-item"><b>An admin can add new
									Transformer in a area</b>
							<li class="list-group-item"><b>An admin can add view all
									consumers and Transformer</b>
						</ul>
						<a href="#" class="btn btn-primary btn-block"><b>Refresh</b></a>
					</div>
				</div>
			</div>
		</section>
	</div>
	<form id="homesubmit" action="BillController" method="post">
		<input type="hidden" name="hidden" value="adminhome">
	</form>
	<form id="addcustomer" action="BillController" method="post">
		<input type="hidden" name="hidden" value="addcustomer">
	</form>
	<form id="addTransformer" action="BillController" method="post">
		<input type="hidden" name="hidden" value="addTransformer">
	</form>
	<form id="viewconsumers" action="BillController" method="post">
		<input type="hidden" name="hidden" value="viewconsumers">
	</form>
	<form id="viewtransformars" action="BillController" method="post">
		<input type="hidden" name="hidden" value="viewtransformars">
	</form>
	<form id="logout" action="BillController" method="post">
		<input type="hidden" name="hidden" value="logout">
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
	function addcustomer() {
		document.getElementById("addcustomer").submit();
	}
	function addTransformer() {
		document.getElementById("addTransformer").submit();
	}
	function viewConsumers() {
		document.getElementById("viewconsumers").submit();
	}
	function viewTrasformars() {
		document.getElementById("viewtransformars").submit();
	}
	function logout() {
		document.getElementById("logout").submit();
	}
</script>
</html>