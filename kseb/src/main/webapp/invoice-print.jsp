<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<html>
<head><link rel="icon" type="image/gif/png"
	href="dist/img/Letter-E-icon.png">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Invoice</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body onload="window.print();">
	<div class="wrapper">
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
						600 <br>Kaloor, Ernakulam, 682017 <br>Phone: 04842341923
						<br>Email: info@ksebkerala.com
					</address>
				</div>
				<!-- /.col -->
				<div class="col-sm-4 invoice-col">
					To
					<address>
						<strong><c:out
								value="${sessionScope.userdetails[0].customerData.fullName}"></c:out></strong>
						<br>
						<c:out
							value="${sessionScope.userdetails[0].customerData.houseName}"></c:out>
						,
						<c:out
							value="${sessionScope.userdetails[0].customerData.houseNumber}"></c:out>
						<br>
						<c:out
							value="${sessionScope.userdetails[0].customerData.postOffice}"></c:out>
						<br> Phone:
						<c:out value="${sessionScope.userdetails[0].customerData.phone}"></c:out>
						<br> Email:
						<c:out value="${sessionScope.userdetails[0].customerData.email}"></c:out>
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
								<c:set value="${sessionScope.billDetails[0].billAmount +25}"
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
						style="margin-top: 10px;">Please Note: Bank is associated with
						the Prime Minister's National Relief Fund(PMNRF) as a Collection
						Bank. All donations towards the PMNRF on bank Online Bill Pay are
						notified for 100% deduction from taxable income under 80G of the
						Income Tax Act, 1961. To donate, LOGIN and select BILL PAY link in
						the left panel under BANKING or CREDIT CARD.</p>
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
					<a onclick="printBill()" target="_blank" class="btn btn-default"><i
						class="fa fa-print"></i> Print</a>

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
		<!-- /.content -->
	</div>
	<!-- ./wrapper -->
</body>
</html>
