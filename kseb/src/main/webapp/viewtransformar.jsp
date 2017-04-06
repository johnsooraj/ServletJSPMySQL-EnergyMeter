<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<link rel="stylesheet" href="css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head><link rel="icon" type="image/gif/png"
	href="dist/img/Letter-E-icon.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrator | View Transformer</title>
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
	<input type="hidden" value="hello" id="hello">
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
					<li role="presentation"><a onclick="addcustomer()">Add A
							Customer</a></li>
					<li role="presentation"><a onclick="addTransformer()">Add
							New Transformer</a></li>
					<li role="presentation"><a onclick="viewConsumers()">view
							consumers</a></li>
					<li role="presentation" class="active"><a
						onclick="viewTrasformars()">view transformers</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" onclick="logout()"><span
							class="fa fa-fw fa-unlock"></span> Log out</a></li>
				</ul>
			</div>
		</nav>
		<section class="content-header">
			<h1>Transformer List</h1>
		</section>
		<section>
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Transformers</h3>

						<div class="box-tools pull-right">
							<div class="has-feedback">
								<input type="text" class="form-control input-sm"
									placeholder="Search Section"> <span
									class="glyphicon glyphicon-search form-control-feedback"></span>
							</div>
						</div>
					</div>
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
						<c:set var="count" value="1" scope="page" />
						<div class="table-responsive mailbox-messages">
							<table class="table table-hover table-striped">
								<tbody>
									<tr>
										<td></td>
										<td><b>Number</b></td>
										<td><b>trasformerSection</b></td>
										<td><b>transformerNumber</b></td>
									</tr>
									<c:forEach var="transdata" items="${sessionScope.transData}">
										<tr>
											<td><input type="checkbox"></td>
											<td><span class="pull-right-container"> <small
													class="label bg-yellow"><c:out value="${count}"></c:out></small>
											</span></td>
											<td class="mailbox-name"><a href="#">${transdata.trasformerSection}</a></td>
											<td class="mailbox-subject"><b>${transdata.transformerNumber}
											</b></td>
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
							</div>
						</div>
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