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
	<form  method="post" class="form_searchCondition" style="display:none">
		<input type="text" class="form-control" name="vendCd" id="input_VendCd">
	</form>
	<div class="page-title-box">
		<h4 class="page-title">재고관리 > 출고명세서 출력</h4>
	</div>
	<div class="jumbotron container-main">
		<form class="mb-3" id="msform">
			  <ul class="row justify-content-center" id="progressbar">
			    <li class="active">거래처 선택</li>
			    <li>소재 선택</li>
			    <li>출력 정보 입력</li>
			  </ul>
			  <fieldset class="fieldset_vend">
			    <h3 class="fs-title">어떤 거래처의 소재인가요?</h3>
			    <hr class="my-1 mb-2">
		 		<table id="datatable" class="display responsive nowrap" cellspacing="0" width="100%">
			    	<thead>
				    	<tr>
						    <th class="all">거래처코드</th>
			                <th class="all">거래처 명</th>
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
			  <fieldset class="fieldset_material">
			  	<h3 class="fs-title">출력할 소재를 선택해주세요.</h3>
			    <hr class="my-1 mb-2">
				
			    <input type="button" name="previous" class="previous action-button" value="이전" />
			    <input type="button" name="next" class="submit action-button btn_next" value="다음" />
			  </fieldset>
			  <fieldset class="fieldset_inputPrintInfo">
			  	<h3 class="fs-title">나머지 정보를 입력해주세요.</h3>
			    <hr class="my-1 mb-2">
				
			    <input type="button" name="previous" class="previous action-button" value="이전" />
			    <input type="button" name="submit" class="submit action-button btn_print" value="출력" />
			  </fieldset>
			</form>
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
		
		
		/*거래처 선택 창에서 다음버튼 클릭*/
		$(".fieldset_vend .btn_next").click(function(){
			var table = $('#datatable').DataTable();
			var selectedRow = table.rows( { selected: true } ).count();
			
			if(selectedRow == 0)
			{
				alert("거래처를 선택해주세요");
				return false;
			}
			
			//input_VendCd에 선택한 거래처 코드 셋팅.
			$("#input_VendCd").val(table.rows('.selected').data()[0].VEND_CD);
			
			//선택한 거래처의 소재 조회
			fn_SearchMaterialList();
			
			
			
			stepperNext(this);
		});

		
		/*
			fn_SearchMaterialList - 선택된 거래처에 해당되는 소재를 조회하는 함수
			@param :  
			@return : 
		*/
		function fn_SearchMaterialList(){
			//검색조건
			var sendData = $(".form_searchCondition").serialize();	
				
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/standard/searchMaterialList.do',
				data : sendData,
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
		}
		
		
		/*소재 선택 창에서 다음버튼 클릭*/
		$(".fieldset_material .btn_next").click(function(){
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
