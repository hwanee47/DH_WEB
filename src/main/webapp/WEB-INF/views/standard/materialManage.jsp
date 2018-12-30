<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/stepper.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/select/1.2.7/css/select.dataTables.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" rel="stylesheet">

<script src='https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js'></script>	
<script src='https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js'></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>

</head> 
<body>
	<form  method="post" class="form_search" style="display:none"></form>
	<div class="page-title-box">
		<h4 class="page-title">기준관리 > 소재관리</h4>
	</div>
	<div class="jumbotron container-main">
		<div class="row table_title">
			<div class="col-9">
				<h5 class="display-7">거래처별 소재 목록</h1>
			</div>
			<div class="col-3 justify-content-end">
				<a href="#" class="btn btn-default btn-sm btn-bold btn-upper float-right btn_search">조 회</a>
				<a href="#" class="btn btn-default btn-sm btn-bold btn-upper float-right btn_add">추 가</a>
			</div>
		</div>
  		<hr class="my-1">
		<div class="table-responsive">
		  <table border="0" class="table cust-table" style="width:100%"> 
			<thead>
				<tr style="">
				  <th style="width:5%;">#</th>
				  <th style="width:15%;">거래처명</th>  
				  <th style="width:10%;">기종</th> 
				  <th style="width:15%;">품번</th> 
				  <th style="width:15%;">품명</th>     
				  <th style="width:15%">재질</th> 
				  <th style="width:15%;">열처리경도</th>
				  <th style="width:20%;">비고</th>
				  <th style="width:5%;" class="text-center"><i class="fas fa-cogs"></i></th>  
				  
				</tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="vendList" items="${vendList}">
			  		<tr>
	    				<th>${vendList.VEND_CD}</th>
		                <td>${vendList.VEND_NAME}</td>
		                <td>${vendList.VEND_REP}</td>
		                <td>${vendList.VEND_NUM}</td>
		                <td>${vendList.VEND_ADDR}</td>
		                <td>${vendList.VEND_TEL}</td>
		                <td>${vendList.VEND_FAX}</td>
		                <td class="text-center"><button class="btn btn-outline-danger del-icon btn_delete"><i class="fas fa-trash-alt"></i></button></td>
	            	</tr>
			  	</c:forEach>
			  
			</tbody>
		  </table>
		</div>
	</div>
		
		
		
	<!-- Modal -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header bg-light">
	        <h5 class="modal-title" id="exampleModalLabel">소재 추가 </h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<form class="mb-3" id="msform">
			  <ul class="row justify-content-center" id="progressbar">
			    <li class="active">거래처 선택</li>
			    <li>소재정보 입력</li>
			  </ul>
			  <fieldset>
			    <h3 class="fs-title">어떤 거래처의 소재인가요?</h3>
			    <hr class="my-1 mb-2">
		 		<table id="datatable" class="display responsive nowrap" cellspacing="0" width="100%">
			    	<thead>
				    	<tr>
						   <th>거래처코드</th>
			                <th>거래처 명</th>
			                <th class="none">대표자</th>
			                <th class="none">사업자 번호</th>
			                <th class="none">주소</th>
			                <th class="none">전화번호</th>
			                <th class="none">팩스번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vendList" items="${vendList}">
					  		<tr>
			    				<th>${vendList.VEND_CD}</th>
				                <td>${vendList.VEND_NAME}</td>
				                <td>${vendList.VEND_REP}</td>
				                <td>${vendList.VEND_NUM}</td>
				                <td>${vendList.VEND_ADDR}</td>
				                <td>${vendList.VEND_TEL}</td>
				                <td>${vendList.VEND_FAX}</td>
			            	</tr>
					  	</c:forEach>
					</tbody>
			    </table>
				<input type="button" name="next" class="next action-button" value="Next" />
			  </fieldset>
			  <fieldset>
			    <h2 class="fs-title">Social Profiles</h2>
			    <h3 class="fs-subtitle">Your presence on the social network</h3>
			    <input type="text" name="twitter" placeholder="Twitter" />
			    <input type="text" name="facebook" placeholder="Facebook" />
			    <input type="text" name="gplus" placeholder="Google Plus" />
			    <input type="button" name="previous" class="previous action-button" value="이전" />
			    <input type="submit" name="submit" class="submit action-button" value="저장" />
			  </fieldset>
			</form>
	      
	       <!--  <form class="needs-validation"  method="post" novalidate>
			  <div class="form-row">
			    <div class="col-md-11 mb-3">
			      <label for="validationCustom01">거래처 명</label>
			      <div class="row">
				      <div class="col-3">
				      	<input type="text" class="form-control" id="validationCustom01" name="vendName" disabled required>
				      </div>
				      <div class="col-8" style="margin-left:-5%;">
				      	<input type="text" class="form-control" id="validationCustom01" name="vendName" disabled required>
				      </div>
				      <div class="col" style="margin-left:-5%;">
				      	<button type="button" class="btn btn-outline-info form-control btn_popup_vend" data-toggle="modal" data-target="#vendModal"><i class="fas fa-search"></i></button>
				      </div>
			      </div>
			      <div class="invalid-feedback">
			      	거래처를 선택해주세요.
			      </div>
			    </div>
			    <div class="col-md-8 mb-3">
			      <label for="validationCustom02">기종</label>
			      <input type="text" class="form-control" id="validationCustom02" name="vendRep" placeholder="대표자를 입력하세요." required>
			      <div class="invalid-feedback">
			      	대표자를 입력하세요.
			      </div>
			    </div>
			    <div class="col-md-8 mb-3">
			      <label for="validationCustom02">품번</label>
			      <input type="text" class="form-control" id="validationCustom02" name="vendNum">
			    </div>
			    <div class="col-md-8 mb-3">
			      <label for="validationCustom02">품명</label>
			      <input type="text" class="form-control" id="validationCustom02" name="vendNum">
			    </div>
			    <div class="col-md-8 mb-3">
			      <label for="validationCustom02">재질</label>
			      <input type="text" class="form-control" id="validationCustom02" name="vendAddr">
			    </div>
			    <div class="col-md-8 mb-3">
			      <label for="validationCustom02">열처리경도</label>
			      <input type="text" class="form-control" id="validationCustom02" name="vendTel">
			    </div>
			    <div class="col-md-8 mb-3">
			      <label for="validationCustom02">비고</label>
			      <input type="text" class="form-control" id="validationCustom02" name="vendFax">
			    </div>
			 	<button class="btn btn-primary sr-only" type="submit">Submit form</button>
			 </div>
			</form> -->
	      </div>
	    </div>
	  </div>
	</div>	
	
<script>
	


	$(document).ready(function() {
		
		
		var table = $('#datatable').dataTable({
				
				select: true,
				paging: false,
				info: false,
				language: {
					search: "",
					searchPlaceholder: "거래처 입력"
				},
				responsive: true
				
		});
		
		
	} );

	(function() {
		var validationFlag;
		'use strict';
		window.addEventListener('load', function() {
		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  var forms = document.getElementsByClassName('needs-validation');
		  // Loop over them and prevent submission
		  var validation = Array.prototype.filter.call(forms, function(form) {
		    form.addEventListener('submit', function(event) {
		      validationFlag = true;
		      if (form.checkValidity() == false) {
		    	validationFlag = form.checkValidity();
		        event.preventDefault();
		        event.stopPropagation();
		       
		      }
		      form.classList.add('was-validated');
		      
		    }, false);
		  });
		  
		}, false);
	  
		
		$(".btn_add").click(function(){
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/standard/searchVendList.do',
				dataType : 'json',
				error : function(xhr, status){
					console.log("ajax error");
					
				},
				success : function(data, status){
					if(data.result.status)
					{
						fn_CreateTable(data.list);
					}
					
				}
			});
			
			//$(".form_search").attr('action','${pageContext.request.contextPath}/standard/searchVendList.do?program=standard/materialManage').submit();
			
			//$('#addModal').modal('show'); 
		});
		
		
		/*거래처조회버튼 클릭*/
		$(".btn_popup_vend").click(function(){
			alert("VEND POPUP!");
		});
		
		
		/*조회버튼 클릭*/
		$(".btn_search").click(function(){
			$(".form_search").attr('action','${pageContext.request.contextPath}/standard/searchVendList.do').submit();	
		});
		
		
		/*저장버튼 클릭*/
// 		$(".btn_save").click(function(){
// 			$(".needs-validation button").click();
			
// 			if(validationFlag)
// 			{
// 				$(".needs-validation").attr('action','${pageContext.request.contextPath}/standard/addVend.do').submit();
// 			}
// 		});
		
		
		/*삭제버튼 클릭*/
		$(".btn_delete").click(function(){
			
			if(confirm("삭제하시겠습니까?") == false) return;
			
			var trObj = $(this).parents("tr");
			var vendCd = trObj.children().eq(0).text();
			
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/standard/deleteVend.do?vendCd='+vendCd,
				dataType : 'json',
				error : function(xhr, status){
					console.log("ajax error");
					
				},
				success : function(data, status){
					
					if(data.result.status)
					{
						trObj.remove();
					}
					
				}
			});
			
		});
	})();
</script>
</body>
</html>
