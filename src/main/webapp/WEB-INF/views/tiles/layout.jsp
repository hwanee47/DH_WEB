<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/stepper.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stepper.js"></script>
</head>
<body >
	
	<tiles:insertAttribute name="header"/>
	
	<div class="container-fluid">
		
		<div class="row">
			<tiles:insertAttribute name="menu" />
			<div class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-3">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>
	
	

</body>
</html>