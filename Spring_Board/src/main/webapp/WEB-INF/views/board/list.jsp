<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false"%>

<jsp:include page="../inc/header.jsp"></jsp:include>
<!-- Main content -->
<script>
if ("${insert}" == "success") {alert("글쓰기에 성공했습니다.");} 
if ("${update}" == "success") {alert("글수정에 성공했습니다.");}
if ("${delete}" == "success") {alert("글삭제에 성공했습니다.");} 
if ("${insert}" == "fail") {alert("글쓰기에 실패했습니다. 관리자에게 문의해주세요.");} 
if ("${update}" == "fail") {alert("글수정에 실패했습니다. 비밀번호를 확인해주세요.");}
if ("${delete}" == "fail") {alert("글삭제에 실패했습니다. 비밀번호를 확인해주세요.");} 
</script>
<section class="container"  style="margin-top:10%">
	<table class="table table-striped table-hover">
	
		<thead>
			<tr>
				<th scope="col">NO</th>
				<th scope="col">NAME</th>
				<th scope="col">TITLE</th>
				<th scope="col">DATE</th>
				<th scope="col">HIT</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="boardVO"  varStatus="status" >
		<tr><td>${boardVO.bno}</td><td>${boardVO.bname}</td><td><a href="<%=request.getContextPath()%>/board/board_detail?bno=${boardVO.bno}">${boardVO.btitle}</a></td><td>${boardVO.bdate}</td><td>${boardVO.bhit}</td></tr>
		</c:forEach>	
		
			<tr  class="text-right">
				<td  colspan="5">
					<a href='<%=request.getContextPath()%>/board/board_write' class="btn btn-default"> 글쓰기</a>
				</td>
			</tr>	
		</tbody>			
	</table>
</section>
<hr/>
<div class="container">
<h3>SEARCH</h3>
<input type="text" id="search" class="form-control">
<div class="search_result">
<table class="table table-striped table-hover" id="result">
<thead>
<tr><th scope="col">NO</th> <th scope="col">NAME</th> <th scope="col">TITLE</th> <th scope="col">DATE</th> <th scope="col">HIT</th></tr>
</thead>
<tbody>

</tbody>
</table>
</div>
<script>
$(function(){
	$("#search").on("keyup", function(){
		$("#result tbody").empty();
		if ($("#search").val() == ""){
			$("#search").focus();
		} else {
			$.ajax({
				url:"${pageContext.request.contextPath}/boardajax/searchData", 
				type:"get", 
				dataType:"json", 
				data:{"search":$("#search").val()}, 
					success:function(data){
						$.each(data, function(index, item){
							var tr = $("<tr>");
							var td1 = $("<td>").html(item.bno);
							var td2 = $("<td>").html(item.bname);
							var td3 = $("<td>").html("<a href='<%=request.getContextPath()%>/board/board_detail?bno="+item.bno+"'>"+item.btitle+"</a>");
							
							var td4 = $("<td>").html(item.bdate);
							var td5 = $("<td>").html(item.bhit);
							tr.append(td1).append(td2).append(td3).append(td4).append(td5);
							$("#result tbody").append(tr);
						});
					},error:function(xhr, textStatus, errorThrown){ 
						}});
					}
	});
});
</script>
</div>




<jsp:include page="../inc/footer.jsp"></jsp:include>
