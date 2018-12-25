<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	
</head> 
<body>
	<div class="page-title-box">
		<h4 class="page-title">기준관리 > 거래처관리</h4>
	</div>
	<div class="jumbotron container-main">
		<div class="row">
			<div class="col-9">
				<h5 class="display-7">거래처 목록</h1>
			</div>
			<div class="col-3 justify-content-end">
				<a href="#" class="btn btn-default btn-sm btn-bold btn-upper">조 회</a>
				<a href="#" class="btn btn-default btn-sm btn-bold btn-upper">추 가</a>
				<a href="#" class="btn btn-default btn-sm btn-bold btn-upper">삭 제</a>
			</div>
		</div>
  		<hr class="my-1">
		<div class="table-responsive">
		  <table border="0" class="table cust-table"> 
			<thead>
				<tr style="">
				  <th style="width:80px;">#</th> 
				  <th style="width:150px;" class="text-center"><li class="fa fa-gear"></li></th>  
				  <th style="width:250px;">Title</th>  
				  <th style="width:200px;">Company</th> 
				  <th style="width:100px;">Priority</th> 
				  <th style="width:120px;">Type</th>     
				  <th style="width:150px;">Assigned to</th> 
				  <th style="width:120px;">Status</th>
				  <th style="width:120px;">Status</th>
				  <th style="width:120px;">Status</th>
				  <th style="width:120px;">Status</th> 
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <th style="width:80px;">1</th>
				  <td style="width:150px;" class="text-center"><button class="btn btn-outline-danger del-icon"><span class="fa fa-trash-o"></span></button> <button class="btn btn-outline-success"><span class="fa fa-pencil"></span></button></td>
				  <td style="width:250px;">Lorem ipsum dolor sit</td>
				  <td style="width:200px;">lorem ispusm</td>
				  <td style="width:100px;">high</td>
				  <td style="width:120px;">lorem ipsum</td>
				  <td style="width:150px;">lorem ipsum</td>
				  <td style="width:120px;">lorem ipsum</td>
				</tr>
				
				<tr>
				  <th scope="row">2</th>
				  <td class="text-center"><button class="btn btn-outline-danger del-icon"><span class="fa fa-trash-o"></span></button> <button class="btn btn-outline-success"><span class="fa fa-pencil"></span></button></td>
				  <td>Lorem ipsum dolor sit</td>
				  <td>lorem ispusm</td>
				  <td>high</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				</tr>
				<tr>
				  <th scope="row">3</th>
				  <td class="text-center"><button class="btn btn-outline-danger del-icon"><span class="fa fa-trash-o"></span></button> <button class="btn btn-outline-success"><span class="fa fa-pencil"></span></button></td>
				  <td>Lorem ipsum dolor sit</td>
				  <td>lorem ispusm</td>
				  <td>high</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				</tr>
				<tr>
				  <th scope="row">4</th>
				  <td class="text-center"><button class="btn btn-outline-danger del-icon"><span class="fa fa-trash-o"></span></button> <button class="btn btn-outline-success"><span class="fa fa-pencil"></span></button></td>
				  <td>Lorem ipsum dolor sit</td>
				  <td>lorem ispusm</td>
				  <td>high</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				</tr>
				<tr>
				  <th scope="row">5</th>
				  <td class="text-center"><button class="btn btn-outline-danger del-icon"><span class="fa fa-trash-o"></span></button> <button class="btn btn-outline-success"><span class="fa fa-pencil"></span></button></td>
				  <td>Lorem ipsum dolor sit</td>
				  <td>lorem ispusm</td>
				  <td>high</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				</tr>
				<tr>
				  <th scope="row">6</th>
				  <td class="text-center"><button class="btn btn-outline-danger del-icon"><span class="fa fa-trash-o"></span></button> <button class="btn btn-outline-success"><span class="fa fa-pencil"></span></button></td>
				  <td>Lorem ipsum dolor sit</td>
				  <td>lorem ispusm</td>
				  <td>high</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				</tr>
				<tr>
				  <th scope="row">7</th>
				  <td class="text-center"><button class="btn btn-outline-danger del-icon"><span class="fa fa-trash-o"></span></button> <button class="btn btn-outline-success"><span class="fa fa-pencil"></span></button></td>
				  <td>Lorem ipsum dolor sit</td>
				  <td>lorem ispusm</td>
				  <td>high</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				</tr>
				<tr>
				  <th scope="row">8</th>
				  <td class="text-center"><button class="btn btn-outline-danger del-icon"><span class="fa fa-trash-o"></span></button> <button class="btn btn-outline-success"><span class="fa fa-pencil"></span></button></td>
				  <td>Lorem ipsum dolor sit</td>
				  <td>lorem ispusm</td>
				  <td>high</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				</tr>
				<tr>
				  <th scope="row">9</th>
				  <td class="text-center"><button class="btn btn-outline-danger del-icon"><span class="fa fa-trash-o"></span></button> <button class="btn btn-outline-success"><span class="fa fa-pencil"></span></button></td>
				  <td>Lorem ipsum dolor sit</td>
				  <td>lorem ispusm</td>
				  <td>high</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				</tr>
				<tr>
				  <th scope="row">10</th>
				  <td class="text-center"><button class="btn btn-outline-danger del-icon"><span class="fa fa-trash-o"></span></button> <button class="btn btn-outline-success"><span class="fa fa-pencil"></span></button></td>
				  <td>Lorem ipsum dolor sit</td>
				  <td>lorem ispusm</td>
				  <td>high</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				</tr>
				<tr>
				  <th scope="row">11</th>
				  <td class="text-center"><button class="btn btn-outline-danger del-icon"><span class="fa fa-trash-o"></span></button> <button class="btn btn-outline-success"><span class="fa fa-pencil"></span></button></td>
				  <td>Lorem ipsum dolor sit</td>
				  <td>lorem ispusm</td>
				  <td>high</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				</tr>
				<tr>
				  <th scope="row">12</th>
				  <td class="text-center"><button class="btn btn-outline-danger del-icon"><span class="fa fa-trash-o"></span></button> <button class="btn btn-outline-success"><span class="fa fa-pencil"></span></button></td>
				  <td>Lorem ipsum dolor sit</td>
				  <td>lorem ispusm</td>
				  <td>high</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				   <td>lorem ipsum</td>
				</tr>
			</tbody>
		  </table>
		</div>
		</div> <!-- End of cust-table-cont block -->
</body>
</html>
