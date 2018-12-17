<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/stepper.css" rel="stylesheet">
</head>
<body class="wrapper">

	<table width="100%" height="100%" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2">
				<!-- 헤더 부분: 시작 --> 
				<tiles:insertAttribute name="header" /> 
				<!-- 헤더 부분: 끝 -->
			</td>
		</tr>
		<tr>
			<td width="100" valign="top">
				<!-- 어사이드 부분: 시작 --> 
				<tiles:insertAttribute name="menu" /> 
				<!-- 어사이드 부분: 끝 -->
			</td>
			<td width="300" valign="top">
				<!-- 내용 부분: 시작 --> 
				<tiles:insertAttribute name="body" /> <br><br><br> 
				<!-- 내용 부분: 끝 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- 푸터 부분: 시작 -->
				 <tiles:insertAttribute name="footer" /> 
				 <!-- 푸터 부분: 끝 -->
			</td>
		</tr>
	</table>

<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/stepper.js"></script>
</body>
</html>