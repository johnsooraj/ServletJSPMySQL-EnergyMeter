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
<title><c:out
		value="${sessionScope.userdetails.customerData.fullName}"></c:out> |
	Current Bill</title>
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
					<li role="presentation" class="active"><a
						onclick="viewcurrentbill()">View Current Bill</a></li>
					<li role="presentation"><a onclick="previousbills()">Previous
							Bills</a></li>
					<li role="presentation"><a onclick="homeControl()">Home
							Control</a></li>


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
			<div class="pad margin no-print">
				<div class="callout callout-info"
					style="margin-bottom: 0 !important;">
					<h4>
						<i class="fa fa-info"></i> Note:
					</h4>
					if you already payed your bill please dont't pay again.<br>
				</div>
			</div>

			<!-- Main content -->
			<section class="invoice">
				<!-- title row -->
				<div class="row">
					<div class="col-xs-12">
						<h2 class="page-header">
							<i class="fa fa-globe"></i> Administrator, KSEB. <small
								class="pull-right">Date: 2/10/2014</small>
						</h2>
					</div>
					<!-- /.col -->
				</div>
				<!-- info row -->
				<div class="row invoice-info">
					<div class="col-sm-4 invoice-col">
						From
						<address>
							<strong>Administrator, Inc.</strong> <br>795 PVS Ave, Suite
							600 <br>Kaloor, Ernakulam, 682017 <br>Phone:
							04842341923 <br>Email: info@ksebkerala.com
						</address>
					</div>
					<!-- /.col -->
					<div class="col-sm-4 invoice-col">
						To
						<address>
							<strong><c:out
									value="${sessionScope.userdetails.customerData.fullName}"></c:out></strong>
							<br>
							<c:out value="${sessionScope.userdetails.customerData.houseName}"></c:out>
							,
							<c:out
								value="${sessionScope.userdetails.customerData.houseNumber}"></c:out>
							<br>
							<c:out
								value="${sessionScope.userdetails.customerData.postOffice}"></c:out>
							<br> Phone:
							<c:out value="${sessionScope.userdetails.customerData.phone}"></c:out>
							<br> Email:
							<c:out value="${sessionScope.userdetails.customerData.email}"></c:out>
						</address>
					</div>
					<!-- /.col -->
					<div class="col-sm-4 invoice-col">
						<b>Invoice #007612</b><br> <br> <b>Order ID:</b> 4F3S8J<br>
						<b>Payment Due:</b> 2/22/2014<br> <b>Account:</b> 968-34567
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

				<!-- Table row -->
				<div class="row">
					<div class="col-xs-12 table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Serial Number</th>
									<th>Category</th>
									<th>Fixed Charge</th>
									<th>Meter Rent</th>
									<th>Subtotal</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Customer Usage</td>
									<td>INR 10</td>
									<td>INR 15</td>
									<c:set value="${sessionScope.billDetails.billAmount +25}"
										var="billamount"></c:set>
									<td><c:out value="${billamount}"></c:out></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

				<div class="row">
					<!-- accepted payments column -->
					<div class="col-xs-6">
						<p class="lead">Payment Methods:</p>
						<img src="dist/img/credit/visa.png" alt="Visa"> <img
							src="dist/img/credit/mastercard.png" alt="Mastercard"> <img
							src="dist/img/credit/american-express.png" alt="American Express">
						<img src="dist/img/credit/paypal2.png" alt="Paypal">

						<p class="text-muted well well-sm no-shadow"
							style="margin-top: 10px;">Please Note: Bank is associated
							with the Prime Minister's National Relief Fund(PMNRF) as a
							Collection Bank. All donations towards the PMNRF on bank Online
							Bill Pay are notified for 100% deduction from taxable income
							under 80G of the Income Tax Act, 1961. To donate, LOGIN and
							select BILL PAY link in the left panel under BANKING or CREDIT
							CARD.</p>
					</div>
					<!-- /.col -->
					<div class="col-xs-6">
						<p class="lead">Amount Due 2/22/2014</p>

						<div class="table-responsive">
							<table class="table">
								<tr>
									<th style="width: 50%">Subtotal:</th>
									<td><c:out value="${billamount}"></c:out></td>
								</tr>
								<tr>
									<th>Tax (9.3)</th>
									<td><c:out value="${billamount}+9.3"></c:out></td>
								</tr>

								<tr>
									<th>Total:</th>
									<td>INR <c:out value="${billamount+9.3}"></c:out></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

				<!-- this row will not appear when printing -->
				<div class="row no-print">
					<div class="col-xs-12">
						<a onclick=" printDiv('printBill')" target="_blank"
							class="btn btn-default"><i class="fa fa-print"></i> Print</a>

						<button type="button" onclick="payBill()"
							class="btn btn-success pull-right">
							<i class="fa fa-credit-card"></i> Submit Payment
						</button>
						<button type="button" class="btn btn-primary pull-right"
							style="margin-right: 5px;">
							<i class="fa fa-download"></i> Generate PDF
						</button>
					</div>
				</div>
			</section>
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
	/* function payBill() {
		alert('INR ' + <c:out value="${billamount+9.3} "></c:out>
				+ ' bill payment successfull');
		document.getElementById("paybill").submit();
	} */

	function payBill() {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				window.location = "redirectUser.jsp";
			}
		};
		xhttp.open("GET", "BillController?hidden=paymyBill", true);
		xhttp.send();
	}
</script>
</html>