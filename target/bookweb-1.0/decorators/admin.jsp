<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <link rel="stylesheet" href="<c:url value ='/template/admin/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value ='/template/admin/css/fontawesome-all.min.css' />">
    <link rel="stylesheet" href="<c:url value ='/template/admin/css/bootadmin.min.css' />">
    <link rel="stylesheet" href="https://bootadmin.net/css/datatables.min.css">
    <link rel="stylesheet" href="https://bootadmin.net/css/fullcalendar.min.css">
    <link rel="stylesheet" href="<c:url value ='/template/sweetalert/sweetalert2.min.css' />">
     <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <title>Datatables | BootAdmin</title>
</head>
<body class="bg-light">
	<%@include file = "/common/admin/header.jsp" %>
	<div class="d-flex">
	<%@include file = "/common/admin/menu.jsp" %>
	<dec:body ></dec:body>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
    <script src="<c:url value ='/template/admin/paging/jquery.twbsPagination.js'/>" type="text/javascript"></script>
    <script src="https://bootadmin.net/js/datatables.min.js"></script>
	<script src="https://bootadmin.net/js/moment.min.js"></script>
	<script src="https://bootadmin.net/js/fullcalendar.min.js"></script>
	<script src="<c:url value ='/template/sweetalert/sweetalert2.min.js' />"></script>
    
</body>
</html>