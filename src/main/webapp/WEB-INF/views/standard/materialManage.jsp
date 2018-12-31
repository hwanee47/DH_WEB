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
				<a href="#" class="btn btn-default btn-sm btn-bold btn-upper float-right btn_add" data-toggle="modal" data-target="#addModal">추 가</a>
			</div>
		</div>
  		<hr class="my-1">
		<div class="table-responsive">
		  <table border="0" class="table cust-table" style="width:100%"> 
			<thead>
				<tr style="">
				  <th hidden>거래처코드</th>  
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
			    </table>
			    <input type="text" class="form-control" name="vendCd" id="input_VendCd" hidden>
				<input type="button" name="next" class="next action-button btn_next" value="다음" />
			  </fieldset>
			  <fieldset>
			  	<h3 class="fs-title">소재정보를 입력해주세요.</h3>
			    <hr class="my-1 mb-2">
				<div class="form-group">
					<div style="line-height: 1.5; text-align: left;">기종</div>
					<input type="text" class="form-control" name="model">
				</div>
				<div class="form-group">
					<div style="line-height: 1.5; text-align: left;">품번</div>
					<input type="text" class="form-control" name="itemNumber">
				</div>
				<div class="form-group">
					<div style="line-height: 1.5; text-align: left;">품명</div>
					<input type="text" class="form-control" name="itemName">
				</div>
				<div class="form-group">
					<div style="line-height: 1.5; text-align: left;">재질</div>
					<input type="text" class="form-control" name="qualityMaterial">
				</div>
				<div class="form-group">
					<div style="line-height: 1.5; text-align: left;">열처리경도</div>
					<input type="text" class="form-control" name="heatTreatmentHardness">
				</div>
				<div class="form-group">
					<div style="line-height: 1.5; text-align: left;">비고</div>
					<input type="text" class="form-control" name="remarks">
				</div>
			    <input type="button" name="previous" class="previous action-button" value="이전" />
			    <input type="button" name="submit" class="submit action-button btn_save" value="저장" />
			  </fieldset>
			</form>
	      
	      </div>
	    </div>
	  </div>
	</div>	

<script src="${pageContext.request.contextPath}/resources/js/stepper.js"></script>	
<script>
	$(document).ready(function() {
		
		var table = $('#datatable').dataTable({
				ajax: "${pageContext.request.contextPath}/standard/searchVendList.do",
				type: "GET",
				columns: [
					{"data": "VEND_CD"},
					{"data": "VEND_NAME"},
					{"data": "VEND_REP"},
					{"data": "VEND_NUM"},
					{"data": "VEND_ADDR"},
					{"data": "VEND_TEL"},
					{"data": "VEND_FAX"},
				],
				select: true,
				paging: false,
				info: false,
				language: {
					search: "",
					searchPlaceholder: "거래처 입력"
				},
				responsive: true
				
		});
		
		
		/*MODAL 다음버튼 클릭*/
		$(".btn_next").click(function(){
			var table = $('#datatable').DataTable();
			var selectedRow = table.rows( { selected: true } ).count();
			
			if(selectedRow == 0)
			{
				alert("거래처를 선택해주세요");
				return false;
			}
			
			//input_VendCd에 선택한 거래처 코드 셋팅.
			console.log(table.rows('.selected').data()[0].VEND_CD);
			$("#input_VendCd").val(table.rows('.selected').data()[0].VEND_CD);
			
			stepperNext(this);
		});
		
		
		/*저장버튼클릭*/
		$(".btn_save").click(function(){
			
			var sendData = $("#msform").serialize();
			//console.log("보낼데이터 :: "+sendData);
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/standard/addMaterial.do',
				data : sendData,
				dataType : 'json',
				error : function(xhr, status){
					console.log("ajax error");
					
				},
				success : function(data, status){
 					if(data.result.status)
					{ 					
 						console.log("success add data :: "+ data);
 						
 						fn_CreateTable(data.data);
 						
 						$('#addModal').modal('toggle');
 					}
					
				}
			});
		});
		
		
		/*조회버튼 클릭*/
		$(".btn_search").click(function(){
			
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/standard/searchMaterialList.do',
				dataType : 'json',
				error : function(xhr, status){
					console.log("ajax error");
					
				},
				success : function(data, status){
					if(data.result.status)
					{
						//console.log(data);
						fn_CreateTable(data.data);
					}
					
				}
			});
		});
		
		
		function fn_CreateTable(data)
		{
		    // ajax로 추가했던 테이블 제거
		    $(".new-tbody").remove();
			
			$newTbody = $("<tbody class='new-tbody'></tbody>");
			
			$(".cust-table").append($newTbody);
			
			for(var i=0; i<data.length; i++)
			{
				var rowData = data[i];
				var str = '<tr>'
					+'<td hidden>'+rowData.VEND_CD+'</td>'
					+'<td>'+rowData.VEND_NAME+'</td>'
					+'<td>'+rowData.MODEL+'</td>'
					+'<td>'+rowData.ITEM_NUMBER+'</td>'
					+'<td>'+rowData.ITEM_NAME+'</td>'
					+'<td>'+rowData.QUALITY_MATERIAL+'</td>'
					+'<td>'+rowData.HEAT_TREATMENT_HARDNESS+'</td>'
					+'<td>'+rowData.REMARKS+'</td>'
					+'<td class="text-center"><button class="btn btn-outline-danger del-icon btn_delete"><i class="fas fa-trash-alt"></i></button></td>"'
					+'</tr>';
					
				$newTbody.append(str);
			}
			
		}
		
		
		/*동적으로 생성된 태그는 다음과 같이 이벤트를 주어야함.*/
		$(document).on("click", ".btn_delete", function() {
			if(confirm("삭제하시겠습니까?") == false) return;
			
			var trObj = $(this).parents("tr");
			var vendCd = trObj.children().eq(0).text();
			var model = trObj.children().eq(2).text();
			
			var deleteCondition = "vendCd="+vendCd+"&model="+model+""; 
			
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/standard/deleteMaterial.do?'+deleteCondition,
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
	} );

	
	
</script>

</body>
</html>
