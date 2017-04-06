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
	<div class="container">
		<h1>
			Welcome <small></small>
		</h1>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" onclick="homeSubmit()">BrainBitz</a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" onclick="logout()"><span
							class="fa fa-fw fa-unlock"></span> Log out</a></li>
				</ul>
			</div>
		</nav>
		<section class="content-header">
			<h1>Transformer List</h1>
		</section>
		<section class="content">
			<div class="error-page">
				<h2 class="headline text-yellow">404</h2>

				<div class="error-content">
					<h3>
						<i class="fa fa-warning text-yellow"></i> Oops! Page not found.
					</h3>

					<p>
						We could not find the page you were looking for. Meanwhile, you
						may <a href="../../index.html">return to dashboard</a> or try
						using the search form.
					</p>

					<form class="search-form">
						<div class="input-group">
							<input type="text" name="search" class="form-control"
								placeholder="Search">

							<div class="input-group-btn">
								<button type="submit" name="submit"
									class="btn btn-warning btn-flat">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
						<!-- /.input-group -->
					</form>
				</div>
				<!-- /.error-content -->
			</div>
			<!-- /.error-page -->
		</section>
		<!-- /.content -->
	</div>

	<form id="homesubmit" action="BillController" method="post">
		<input type="hidden" name="hidden" value="indexpage">
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
	function homeSubmit() {
		document.getElementById("homesubmit").submit();
	}
	function logout() {
		document.getElementById("logout").submit();
	}
</script>
</html>