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
<title>Previous Bills</title>
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

					<li role="presentation"><a onclick="homeSubmit()">Home</a></li>
					<li role="presentation"><a onclick="viewcurrentbill()">View
							Current Bill</a></li>
					<li role="presentation" class="active"><a
						onclick="previousbills()">Previous Bills</a></li>
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
			<h1>Previous Bill</h1>
		</section>
		<section>
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header with-border">
						<div class="box-tools pull-right"></div>
						<!-- /.box-tools -->
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<div class="mailbox-controls">
							<!-- Check all button -->
							<button type="button"
								class="btn btn-default btn-sm checkbox-toggle">
								<i class="fa fa-square-o"></i>
							</button>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-trash-o"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-reply"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-share"></i>
								</button>
							</div>
							<!-- /.btn-group -->
							<button type="button" class="btn btn-default btn-sm">
								<i class="fa fa-refresh"></i>
							</button>
							<div class="pull-right">
								1-50/200
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-chevron-left"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-chevron-right"></i>
									</button>
								</div>
								<!-- /.btn-group -->
							</div>
							<!-- /.pull-right -->
						</div>
						<div class="table-responsive mailbox-messages">
							<table class="table table-hover table-striped">
								<tbody>
									<c:set var="count" value="1" scope="page" />
									<c:forEach var="billdata" items="${sessionScope.previousbill}">
										<tr>
											<td><input type="checkbox"></td>
											<td><span class="pull-right-container"> <small
													class="label bg-yellow"><c:out value="${count}"></c:out></small>
											</span></td>
											<td class="mailbox-subject"><b><c:out
														value="${billdata.billAmount+34.3}"></c:out> </b></td>
											<td class="mailbox-name"><a href="#"> <c:choose>
														<c:when test="${billdata.billPaymentStatus == true}">
       										 bill payed
											</c:when>
														<c:otherwise>
        									bill not payed
       										 <br />
														</c:otherwise>
													</c:choose>
											</a></td>
											<td class="mailbox-name"><a href="#"><c:out
														value="${billdata.dateTime}"></c:out></a></td>
										</tr>
										<c:set var="count" value="${count + 1}" scope="page" />
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table -->
						</div>
						<!-- /.mail-box-messages -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer no-padding">
						<div class="mailbox-controls">
							<!-- Check all button -->
							<button type="button"
								class="btn btn-default btn-sm checkbox-toggle">
								<i class="fa fa-square-o"></i>
							</button>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-trash-o"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-reply"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-share"></i>
								</button>
							</div>
							<!-- /.btn-group -->
							<button type="button" class="btn btn-default btn-sm">
								<i class="fa fa-refresh"></i>
							</button>
							<div class="pull-right">
								1-50/200
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-chevron-left"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-chevron-right"></i>
									</button>
								</div>
								<!-- /.btn-group -->
							</div>
							<!-- /.pull-right -->
						</div>
					</div>
				</div>
				<!-- /. box -->
			</div>
			<!-- /.col -->
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