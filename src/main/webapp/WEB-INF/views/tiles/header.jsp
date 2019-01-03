<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/menu.css" rel="stylesheet">
</head>
<body>
<form name="selectOne" action="#LINK">
   <input name="link" type="hidden" />
</form>
<div id="wrapper">
	<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white">
      <a class="navbar-brand" href="#">
      	<img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="" height="20"> DAEHAN
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarText">
      	<ul class="navbar-nav side-nav">	
	      	<li class="side-nav-title side-nav-item">STANDARD</li>
	        <li  data-toggle="collapse" data-target="#products1" class="nav-item collapsed active">
	          <a href="#"><i class="fas fa-list-alt"></i> 기준관리 <span class="arrow"></span></a>
	        </li>
	        <ul class="sub-menu collapse" id="products1">
	            <li><a href="#" onclick="fn_main_headPageMove('standard/vendManage')">거래처관리</a></li>
	            <li><a href="#" onclick="fn_main_headPageMove('standard/materialManage')">소재관리</a></li>
	        </ul>
	        
	        <li class="side-nav-title side-nav-item">STOCK</li>
	        <li  data-toggle="collapse" data-target="#products2" class="nav-item collapsed active">
	          <a href="#"><i class="fas fa-list-alt"></i> 재고관리 <span class="arrow"></span></a>
	        </li>
	        <ul class="sub-menu collapse" id="products2">
	            <li><a href="#" onclick="fn_main_headPageMove('inventory/forwardingStatement')">출고명세서 출력</a></li>
	            <li><a href="#">입고관리</a></li>
	            <li><a href="#">출고관리</a></li>
	        </ul>
	        
	        <li class="side-nav-title side-nav-item">SYSTEM</li>
	        <li>
	          <a href="#"><i class="far fa-file-alt"></i> Document </a>
	        </li>
	        
	        <ul class="nav nav-sidebar nav-bottom">
		        <li><a href="https://github.com/hwanee47/DH_WEB/issues" class="link" target="_blank"><i class="fab fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
		    </ul>
		   
        </ul>
      	<ul class="navbar-nav top-nav justify-content-end">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">ACCESS<span class="carset"></span></a>
			<ul class="dropdown-menu">
				<li><a href="login.jsp">LOG ON</a></li>
				<li><a href="join.jsp">JOIN</a></li>
			</ul>
          </li>
        </ul>
        
      </div>
      
    </nav>
    
</div>
<script>
	$(function(){
		var sBtn = $("ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
		sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
		 sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
		 $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
		 
		})
		
	})
 
	function fn_main_headPageMove(url){
	    document.selectOne.link.value=url;
	    document.selectOne.action = "<c:url value='/com/pageLink.do'/>";
	    document.selectOne.submit();
	}
</script>

</body>    
</html>