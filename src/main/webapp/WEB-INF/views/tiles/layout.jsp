<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/datatableCustom.css"/> --%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">


<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>


<style type="text/css">
	
	
</style>
</head>
<body >

	<tiles:insertAttribute name="header"/>
	
	<div class="content-page container-fluid" >
		<div class="row">
			<div class="mt-3" style="overflow: auto; width:100%;">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stepper.js"></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js'></script>
</body>
</html>