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
<title>Home Controller</title>
<link rel="stylesheet" href="plugins/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="plugins/AdminLTE.min.css">
<link rel="stylesheet" href="plugins/_all-skins.min.css">
<script src="dist/sweetalert-dev.js"></script>
<link rel="stylesheet" href="dist/css/sweetalert.css">
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

					<li role="presentation"><a onclick="homeSubmit()">Home</a></li>
					<li role="presentation"><a onclick="viewcurrentbill()">View
							Current Bill</a></li>
					<li role="presentation"><a onclick="previousbills()">Previous
							Bills</a></li>
					<li role="presentation" class="active"><a
						onclick="homeControl()">Home Control</a></li>


				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" onclick="logout()"><span
							class="fa fa-fw fa-unlock"></span> Log out</a></li>
				</ul>
			</div>
		</nav>
		<section class="content-header">
			<h1>Current Bill</h1>
		</section>
		<section class="content-header">
			<h1>
				Invoice <small>#007612</small>
			</h1>
		</section>
		<section id="printBill" class="content">
			<div class="row">
				<div class="col-md-6">
					<!-- Block buttons -->
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Switch On</h3>
						</div>
						<div class="box-body">
							<button type="button" onclick="bulbControll(this.value);"
								value="01on" class="btn btn-success btn-block">Bulb 1
								On</button>
							<button type="button" onclick="bulbControll(this.value);"
								value="02on" class="btn btn-success btn-block">Bulb 2
								On</button>
							<button type="button" onclick="bulbControll(this.value);"
								value="03on" class="btn btn-success btn-block">Bulb 3
								On</button>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<!-- Block buttons -->
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Switch OFf</h3>
						</div>
						<div class="box-body">
							<button type="button" onclick="bulbControll(this.value);"
								value="1cut" class="btn btn-danger btn-block">Bulb 1
								Off</button>
							<button type="button" onclick="bulbControll(this.value);"
								value="2cut" class="btn btn-danger btn-block">Bulb 2
								Off</button>
							<button type="button" onclick="bulbControll(this.value);"
								value="3cut" class="btn btn-danger btn-block">Bulb 3
								Off</button>
						</div>
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
	<form id="printbill" action="BillController" method="post">
		<input type="hidden" name="hidden" value="printbill">
	</form>
	<form id="paybill" action="BillController" method="post">
		<input type="hidden" name="hidden" value="paybill">
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
	function bulbControll(status) {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				//alert(this.responseText);
			}
		};
		xhttp.open("GET", "BillController?hidden=bulbControl&status=" + status,
				true);
		xhttp.send();
	}

	function printDiv(divName) {
		var printContents = document.getElementById(divName).innerHTML;
		var originalContents = document.body.innerHTML;

		document.body.innerHTML = printContents;

		window.print();

		document.body.innerHTML = originalContents;
	}
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
	function printBill() {
		document.getElementById("printbill").submit();
	}
	function logout() {
		document.getElementById("logout").submit();
	}
	function homeControl() {
		document.getElementById("homeControl").submit();
	}
</script>
</html>