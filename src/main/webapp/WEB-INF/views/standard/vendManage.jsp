<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
</head> 
<body>
	<form  method="post" class="form_search" style="display:none"></form>
	<div class="page-title-box">
		<h4 class="page-title">기준관리 > 거래처관리</h4>
	</div>
	<div class="jumbotron container-main">
		<div class="row table_title">
			<div class="col-9">
				<h5 class="display-7">거래처 목록</h1>
			</div>
			<div class="col-3 justify-content-end">
				<a href="#" class="btn btn-default btn-sm btn-bold btn-upper float-right btn_search">조 회</a>
				<a href="#" class="btn btn-default btn-sm btn-bold btn-upper float-right btn_add" data-toggle="modal" data-target="#addModal">추 가</a>
			</div>
		</div>
  		<hr class="my-1">
		<div class="table-responsive">
		  <table border="0" class="table cust-table" style="width:100%"> 
			<thead>
				<tr>
				  <th style="width:5%;">#</th>
				  <th style="width:15%;">거래처명</th>  
				  <th style="width:10%;">대표자</th> 
				  <th style="width:15%;">사업자번호</th> 
				  <th style="width:30%;">주소</th>     
				  <th style="width:15%">전화번호</th> 
				  <th style="width:15%;">팩스번호</th>
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
	        <h5 class="modal-title" id="exampleModalLabel">거래처 추가 </h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form class="needs-validation"  method="post" novalidate>
			  <div class="form-row">
			    <div class="col-md-8 mb-3">
			      <label for="validationCustom01">거래처 명</label>
			      <input type="text" class="form-control" id="validationCustom01" name="vendName" placeholder="거래처명을 입력하세요." required>
			      <div class="invalid-feedback">
			      	거래처명을 입력하세요.
			      </div>
			    </div>
			    <div class="col-md-8 mb-3">
			      <label for="validationCustom02">대표자</label>
			      <input type="text" class="form-control" id="validationCustom02" name="vendRep" placeholder="대표자를 입력하세요." required>
			      <div class="invalid-feedback">
			      	대표자를 입력하세요.
			      </div>
			    </div>
			    <div class="col-md-8 mb-3">
			      <label for="validationCustom02">사업자 번호</label>
			      <input type="text" class="form-control" id="validationCustom02" name="vendNum">
			    </div>
			    <div class="col-md-8 mb-3">
			      <label for="validationCustom02">주소</label>
			      <input type="text" class="form-control" id="validationCustom02" name="vendAddr">
			    </div>
			    <div class="col-md-8 mb-3">
			      <label for="validationCustom02">전화번호</label>
			      <input type="text" class="form-control" id="validationCustom02" name="vendTel">
			    </div>
			    <div class="col-md-8 mb-3">
			      <label for="validationCustom02">팩스번호</label>
			      <input type="text" class="form-control" id="validationCustom02" name="vendFax">
			    </div>
			 	<button class="btn btn-primary sr-only" type="submit">Submit form</button>
			 </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default btn-sm btn-bold btn-upper btn_save">저장</button>
	        <button type="button" class="btn btn-default btn-sm btn-bold btn-upper" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>	
	
<script>
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
	  
		
		/*조회버튼 클릭*/
		$(".btn_search").click(function(){
			$(".form_search").attr('action','${pageContext.request.contextPath}/standard/searchVendList.do?program=standard/vendManage').submit();	
		});
		
		
		/*저장버튼 클릭*/
		$(".btn_save").click(function(){
			$(".needs-validation button").click();
			
			if(validationFlag)
			{
				$(".needs-validation").attr('action','${pageContext.request.contextPath}/standard/addVend.do').submit();
			}
		});
		
		
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
