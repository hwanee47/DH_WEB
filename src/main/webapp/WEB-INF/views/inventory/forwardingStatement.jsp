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
<link href="https://cdn.datatables.net/select/1.2.7/css/select.bootstrap4.min.css" rel="stylesheet">

<script src='https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js'></script>	
<script src='https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js'></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>

<style type="text/css">
	@media (min-width: 992px){
		#div_selectVend{
			width: 40%;
		}
	}
</style>

</head> 
<body>
	<form  method="post" class="form_searchCondition" style="display:none">
		<input type="text" class="form-control" name="vendCd" id="input_VendCd">
	</form>
	<div class="page-title-box">
		<h4 class="page-title">재고관리 > 출고명세서 출력</h4>
	</div>
	<div class="jumbotron container-main">
		<form class="mb-3" id="msform" method="POST" target="report">
			  <ul class="row justify-content-center" id="progressbar">
			    <li class="active">소재 선택</li>
			    <li>출력 정보 입력</li>
			    <li>출력 미리보기</li>
			  </ul>
			  <fieldset class="fieldset1">
			    <h3 class="fs-title">어떤 거래처의 소재인가요?</h3>
			    <hr class="my-1 mb-2">
			    <div class="row">
				    <div class="col-sm-6">
			 		<table id="datatable_vend" class="display responsive nowrap" cellspacing="0" width="100%">
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
				    </div>
				    <div class="col-sm-6">
				    <table id="datatable_material" class="display responsive nowrap" cellspacing="0" width="100%">
				    	<thead>
					    	<tr>
							    <th class="all">순번</th>
							    <th class="all">기종</th>
				                <th class="all">품명</th>
				                <th>품번</th>
							</tr>
						</thead>
				    </table>
				    </div>
			    </div>
			    <input type="text" class="form-control" name="vendCd" id="input_VendCd" hidden>
				<input type="button" name="next" class="next action-button btn_next" value="다음" />
			  </fieldset>
			  <fieldset class="fieldset2">
			  	<h3 class="fs-title">나머지 정보를 입력해주세요.</h3>
			    <hr class="my-1 mb-2">
			    <div class="mb-5" id="div_selectVend">
			    	<div style="color: #5867dd; font-weight: bold; text-align: left;">1. 출고 거래처 선택</div>
			    	<div class=>
				    	<table id="datatable_vend2" class="display responsive nowrap" cellspacing="0" width="100%">
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
				    </div>
			    </div>
			    
				<div class="table-responsive mb-5">
					<div style="color: #5867dd; font-weight: bold; text-align: left;">2. 출고 리스트 정보</div>
					<table id="datatable_inputInfo" class="display responsive nowrap" cellspacing="0" width="100%">
				    	<thead>
					    	<tr>
							    <th class="all">순번</th>
							    <th class="all">기종</th>
				                <th class="all">품명</th>
				                <th class="all">품번</th>
				                <th>수량</th>
				                <th>납기일</th>
							</tr>
						</thead>
				    </table>
			    </div>
			    
			    <div class="form-group">
					<div style="color: #5867dd; font-weight: bold; text-align: left;">3. 비고</div>
					<div class="form-group green-border-focus">
					  <textarea class="form-control" id="textarea_remark" rows="3" placeholder="내용을 입력하세요"></textarea>
					</div>
				</div>
			    <input type="button" name="previous" class="previous action-button" value="이전" />
			    <input type="button" name="next" class="submit action-button btn_next" value="출력미리보기" />
			  </fieldset>
			  <fieldset class="fieldset3">
			  	<h3 class="fs-title">최종적으로 내용을 확인해주세요.</h3>
			    <hr class="my-1 mb-2">
				<div class="embed-responsive embed-responsive-16by9">
				  <iframe class="embed-responsive-item" id="iframe_report" name="report" allowfullscreen></iframe>
				</div>
			    <input type="button" name="previous" class="previous action-button" value="이전" />
			  </fieldset>
			</form>
	</div>
		

<script src="${pageContext.request.contextPath}/resources/js/stepper.js"></script>	
<script>
	$(document).ready(function() {
		
		/*거래처 datatable 초기 셋팅*/
		datatableVend = $('#datatable_vend').DataTable({
				ajax: "${pageContext.request.contextPath}/standard/searchVendList.do",
				type: "GET",
				columnDefs: [{
					targets: 0,
					className: "text-center",
					width: "10%"
				}],
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
					searchPlaceholder: "Search"
				},
				responsive: true
				
		});
		
		datatableVend2 = $('#datatable_vend2').DataTable({
				ajax: "${pageContext.request.contextPath}/standard/searchVendList.do",
				type: "GET",
				columnDefs: [{
					targets: 0,
					className: "text-center",
					width: "10%"
				}],
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
					searchPlaceholder: "Search"
				},
				autoWidth: false,
				responsive: true
				
		});
		
		/*소재 datatable 초기 셋팅*/
		datatableMaterial = $('#datatable_material').DataTable({
			columnDefs: [{
				searchable: false,
				orderable: false,
				targets: 0,
				className: "text-center",
				width: "10%"
			}],
			order: [[ 1, 'asc']],
			columns: [
				{"data": null},
				{"data": "MODEL"},
				{"data": "ITEM_NAME"},
				{"data": "ITEM_NUMBER"},
			],
			select: {
				style: "multi"
			},
			paging: false,
			info: false,
			language: {
				search: "",
				searchPlaceholder: "Search"
			},
			responsive: true,
			fnRowCallback : function(nRow, aData, iDisplayIndex){      
				var index = iDisplayIndex +1;
				$('td:eq(0)',nRow).html(index);
				return nRow;
      		}
			
		});
		
		
		/*나머지정보입력 datatable 초기 셋팅*/
		datatableInputInfo = $('#datatable_inputInfo').DataTable({
			columnDefs: [
				{
					searchable: false,
					orderable: false,
					targets: 0,
					className: "text-center",
					width: "5%"
				},
				{
					targets: 4,
					width: "10%"
				}
			],
			order: [[ 1, 'asc']],
			columns: [
				{
					"name": "SEQ",
					"data": null
				},
				{
					"name": "MODEL",
					"data": "MODEL"
				},
				{
					"name": "ITEM_NAME",
					"data": "ITEM_NAME"
				},
				{
					"name": "ITEM_NUMBER",
					"data": "ITEM_NUMBER"
				},
				{
					"name": "QTY",
					"data": null,
					render: function (data, type, row) {
                        return '<input type="text" class="form-control text-right" placeholder="수량입력">';
                    }
				},
				{
					"name": "DT",
					"data": null,
					render: function (data, type, row) {
                        return '<input type="text" class="form-control" placeholder="납기일을 입력하세요">';
                    }
				}
			],
			searching: false,
			paging: false,
			info: false,
			autoWidth: false,
			responsive: true,
			fnRowCallback : function(nRow, aData, iDisplayIndex){      
				var index = iDisplayIndex +1;
				$('td:eq(0)',nRow).html(index);
				return nRow;
      		}
			
		});
		
		
		/*거래처 테이블 row 클릭*/
		$(document).on("click", "#datatable_vend tbody tr", function() {
			
			if($(this).hasClass( "selected" )) {
				datatableMaterial.clear().draw();
				//input_VendCd에 선택한 거래처 코드 셋팅.
				$("#input_VendCd").val(datatableVend.rows('.selected').data()[0].VEND_CD);
				
				fn_SearchMaterialList();
			}else{
				datatableMaterial.clear().draw();
			}
		});
		
		/*거래처 선택 창에서 다음버튼 클릭*/
		$(".fieldset1 .btn_next").click(function(){
			
			var selectedRow = datatableMaterial.rows( { selected: true } ).count();
			
			if(selectedRow == 0)
			{
				alert("출력할 소재를 선택해주세요");
				return false;
			}
			
			
			//datatable_inputInfo에 선택한 소재 추가
			var selectedData = datatableMaterial.rows({ selected: true }).data();
			datatableInputInfo.clear().draw();
			datatableInputInfo.rows.add(selectedData).draw();
			
			stepperNext(this);
		});

		
		$(".fieldset2 .btn_next").click(function(){
			stepperNext(this);
			
			var sendData = $("#msform").serialize();
			
			var heads = [];
			var columns = datatableInputInfo.settings().init().columns;
			datatableInputInfo.columns().every(function (index) {
				heads.push(columns[index].name);
			});
			
			var rows = [];
			$("#datatable_inputInfo tbody tr").each(function () {
				cur = {};
				$(this).find("td").each(function(i, v) {
				 cur[heads[i]] = $(this).text().trim();
				 
				 $(this).find("input").each(function(){
					 cur[heads[i]] = $(this).val();
				 })
				});
				rows.push(cur);
				cur = {};
			});
			
			var selectedRow = datatableVend2.rows('.selected');
			
			//iframe src setting
			$.ajax({
		        type: "POST", 
		        data : {
		        	"VEND_NAME" : datatableVend2.cell(selectedRow,1).data(),
		        	"LIST" : JSON.stringify(rows),
		        	"REMARK": $("#textarea_remark").val()
		        },
				dataType : 'json',
		        url : "${pageContext.request.contextPath}/inventory/setReportData.do",
		        success : function (data) {
		        	if(data.result.status)
					{ 	 
		        		$("#iframe_report").attr("src","${pageContext.request.contextPath}/inventory/report.do");
					}
		        }
		    });
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
				url: "${pageContext.request.contextPath}/standard/searchMaterialList.do",
				type: "GET",
				contentType: "application/json",
				data: sendData
			}).done(function(result){
				console.log(result);
				datatableMaterial.rows.add(result.data).draw();
			}).fail(function(jqXHR, textStatus, errorThrown){
				
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
