<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Home | Bookshop Responsive Bootstrap4 Template</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Favicons -->
	<link rel="shortcut icon" href="/template/web//images/favicon.ico">
	<link rel="apple-touch-icon" href="/template/web//images/icon.png">

	<!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet"> 

	<!-- Stylesheets -->
	<link rel="stylesheet" href="/template/web/css/bootstrap.min.css">
	<link rel="stylesheet" href="/template/web/css/plugins.css">
	<link rel="stylesheet" href="/template/web/style.css">

	<!-- Cusom css -->
   <link rel="stylesheet" href="/template/web/css/custom.css">

	<!-- Modernizer js -->
	<script src="/template/web/js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="/template/web/js/vendor/jquery-3.2.1.min.js"></script>
	<script src="/template/web/js/bootstrap.min.js"></script>
	    <link rel="stylesheet" href="<c:url value ='/template/sweetalert/sweetalert2.min.css' />">

</head>
<body>

	<div class="wrapper" id="wrapper">
		<%@ include file = "/common/web/header.jsp" %>
		<dec:body></dec:body>
		<%@ include file ="/common/web/footer.jsp" %>	
	</div>

	<script src="<c:url value ='/template/admin/paging/jquery.twbsPagination.js'/>" type="text/javascript"></script>
	<script src="/template/web/js/popper.min.js"></script>

	<script src="/template/web/js/plugins.js"></script>
	<script src="/template/web/js/active.js"></script>
	<script src="<c:url value ='/template/sweetalert/sweetalert2.min.js' />"></script>
</body>
</html>