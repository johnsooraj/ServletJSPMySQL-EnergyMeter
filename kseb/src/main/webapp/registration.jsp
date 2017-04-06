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
<title>Administrator | Registration</title>
<link rel="stylesheet" href="plugins/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="plugins/AdminLTE.min.css">
<link rel="stylesheet" href="plugins/_all-skins.min.css">
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
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

					<li role="presentation"><a onclick="homeSubmit()">Home</a></li>
					<li role="presentation" class="active"><a
						onclick="addcustomer()">Add A Customer</a></li>
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
		<section class="content-header"></section>
		<section class="content">
			<form action="BillController" method="post">
				<input type="hidden" value="registercustomer" name="hidden">
				<div class="container">
					<h1 class="well">Registration Form</h1>
					<div class="col-lg-12 well">
						<div class="forslide">
							<div class="col-md-12">
								<div class="form-group">
									<label>Transformer Section</label> <select required="required"
										id="sectionname" onchange="picktrannumber()"
										class="form-control select2" name="sectionname"
										style="width: 100%;">
										<option selected="selected"></option>
										<c:forEach var="trannumber"
											items="${sessionScope.transformardata}">
											<option><c:out value="${trannumber}"></c:out></option>
										</c:forEach>
									</select>
									<p id="demo"></p>
								</div>
								<div class="form-group">
									<label>Transformer Number</label> <select required="required"
										id="trannumber" class="form-control select2" name="trannumber"
										style="width: 100%;">
									</select>

								</div>
							</div>
							<div class="col-sm-6 form-group">
								<button type="button" onclick="plusDivs(1)"
									class="btn btn-lg btn-info">next</button>
							</div>
						</div>
						<div class="forslide">
							<div class="row">
								<div class="col-sm-12">
									<div class="row">
										<div class="col-sm-12 form-group">
											<label>Full name</label> <input required="required"
												id="fullname" name="fullname" type="text"
												placeholder="Enter First Name Here.." class="form-control"
												onkeypress="validate()">
											<p id="recivemessage" class="text-green"></p>
										</div>

									</div>
									<div class="row">
										<div class="col-sm-9 form-group">
											<label>House Name</label> <input required="required"
												name="housename" type="text"
												placeholder="Enter Home Name Here.." class="form-control">
										</div>
										<div class="col-sm-3 form-group">
											<label>House Number</label> <input required="required"
												name="housenumber" type="text"
												placeholder="Enter House Number.." class="form-control">
										</div>
									</div>
									<div class="row">
										<div class="col-sm-4 form-group">
											<label>PostOffice</label> <input required="required"
												type="text" name="postoffice"
												placeholder="Enter City Name Here.." class="form-control">
										</div>
										<div class="col-sm-4 form-group">
											<label>LandMark</label> <input required="required"
												type="text" name="landmark"
												placeholder="Enter State Name Here.." class="form-control">
										</div>
										<div class="col-sm-4 form-group">
											<label>Zip</label> <input required="required" type="text"
												name="pincode" placeholder="Enter Zip Code Here.."
												class="form-control">
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6 form-group">
											<label>Phone Number</label> <input required="required"
												type="text" name="mobphone"
												placeholder="Enter Phone Number Here.." class="form-control">
										</div>
										<div class="col-sm-6 form-group">
											<label>Land Number</label> <input required="required"
												type="text" name="landnumber"
												placeholder="Enter Phone Number Here.." class="form-control">
										</div>
									</div>
									<div class="col-sm-6 form-group">
										<label>Email Address</label> <input required="required"
											type="text" name="email"
											placeholder="Enter Email Address Here.." class="form-control">
										<div id="mycolomn"></div>
									</div>
								</div>
								<div class="col-sm-6 form-group">
									<button type="button" onclick="plusDivs(-1)"
										class="btn btn-lg btn-info">previous</button>
								</div>
								<div class="col-sm-6 form-group">
									<button type="button" onclick="plusDivs(1)"
										class="btn btn-lg btn-info pull-right">next</button>
								</div>
							</div>
						</div>

						<div class="forslide">
							<div class="col-sm-9 form-group">
								<label>Serial Id of Meter</label> <input required="required"
									type="text" name="serialnumber"
									placeholder="Enter Serial number of new METER.."
									class="form-control">
								<div id="mycolomn"></div>
							</div>
							<div class="col-sm-9 form-group">
								<label>Customer User name</label> <input required="required"
									type="text" name="username" placeholder="new username"
									class="form-control">
								<div id="mycolomn"></div>
							</div>
							<div class="col-sm-9 form-group">
								<label>New Password</label> <input required="required"
									type="text" name="password" placeholder="Enter a  password.."
									class="form-control">
								<div id="mycolomn"></div>
							</div>
							<div class="col-sm-9 form-group">
								<label>User Type</label> <select required="required"
									class="form-control select2" name="usertype"
									style="width: 100%;">
									<option selected="selected">consumer</option>
								</select>

							</div>
							<div class="col-sm-9 form-group">
								<button type="button" onclick="plusDivs(-1)"
									class="btn btn-lg btn-info">previous</button>
							</div>
							<div class="col-sm-9 form-group">
								<button type="submit" class="btn btn-lg btn-info">Submit</button>
							</div>
						</div>

					</div>
				</div>
			</form>
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
	var slideIndex = 1;
	showDivs(slideIndex);
	function plusDivs(n) {
		showDivs(slideIndex += n);
	}
	function showDivs(n) {
		var i;
		var x = document.getElementsByClassName("forslide");
		if (n > x.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = x.length
		}
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		x[slideIndex - 1].style.display = "block";
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
	function addTransformer() {
		document.getElementById("addTransformer").submit();
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

	function validate() {

		var name = document.getElementById('fullname').value;
		if (name == null || name == "") {

		} else {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("recivemessage").innerHTML = this.responseText;
				}
			};
			xhttp.open("GET", "BillController?fullname=" + name
					+ "&hidden=fullnamevalidation", true);
			xhttp.send();
		}
	}

	function picktrannumber() {
		var name = document.getElementById('sectionname').value;
		if (name == null || name == "") {
			alert('select value is empty');
		} else {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {

					var sessionObject = this.responseText;
					var jsonObj = JSON.parse(sessionObject);

					var select = document.getElementById("trannumber");

					var length = select.options.length;

					for (i = 0; i < length; i++) {
						select.options[i] = null;
					}

					var trannumber = document.getElementById("trannumber");

					var i = 0;

					var text = "";
					for (i = 0; i < jsonObj.length; i++) {
						var option = document.createElement("option");
						option.text = jsonObj[i]["transformerNumber"];
						trannumber.add(option);
					}
				}
			};
			xhttp.open("GET", "BillController?fullname=" + name
					+ "&hidden=transectionname", true);
			xhttp.send();
		}
	}
</script>


</html>