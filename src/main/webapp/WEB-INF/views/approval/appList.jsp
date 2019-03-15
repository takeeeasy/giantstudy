<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src = "/resources/js/jquery-1.12.4.js"></script>
<script src = "/resources/js/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<script>
var memRank = "${getMember.memRank}";
$(function(){
var adminName = "${getIsAdmin.adminName}";
var adminRank ="${getIsAdmin.adminRank}"; 
var adminDate = "${getIsAdmin.regDate}";
	if (adminRank == '')
	{
	}
	else
	{
		$('#info').text("대리결재위임자: "+adminName+", 권한:"+adminRank);
	}
	
	if (memRank =='R1' || memRank == 'R2')
	{
		$('#approval').remove();
	}
	
	$('#searchTxt').focus();
	
	$('#write').click(function(){
		$('#listFrm').attr("action", "insertContent").attr("method", "post").submit();
	});
	
	$('#logout').click(function(){
		alert('logout!');
		document.location= "/logout";
	});
	
	$('#searchBtn').click(function(){
		if ($('#searchTxt').val() == '' || $('#searchType').val() == 'searchDefault')
		{
			alert('검색어, 검색조건을 입력하세요');
			return;
		}
		else
		{
			document.searchFrm.action = "aprvSearch";
			document.searchFrm.method = "get";
			document.searchFrm.submit();
		}
	});
	
	$('#approval').click(function(){
		  var windowW = 400;  // 창의 가로 길이
	        var windowH = 300;  // 창의 세로 길이
	        var left = Math.ceil((window.screen.width - windowW)/2);
	        var top = Math.ceil((window.screen.height - windowH)/2);
	window.open("/popup", '대리결재',"l top="+top+", left="+left+", height="+windowH+", width="+windowW);
	});
	
	// 달력==============================================================
	$('#stDate').datepicker({
		dateFormat: 'yy-mm-dd'
	});
	$('#enDate').datepicker({
		dateFormat: 'yy-mm-dd'
	});
	
	$('#statusBox').change(function(){
		
		$.ajax({
			type : "GET",
			url : "/ajaxSelect",
			data : {"selectType" : $('#statusBox').val(),
					"memName" : "${sessionScope.getMember.memName}",
					"memRank" : "${empty getIsAdmin.adminRank ? sessionScope.getMember.memRank : getIsAdmin.adminRank}",
					"adminRank" : "${getIsAdmin.adminRank}"
					},
			dataType : "html",
			success : function(data, dataType){
				$('#ajaxContainer').html(data);
			},
			error : function(xhr, status, error){
				alert('실패');
			}
		});
	});
	
	
	
});

function Enter_Check(){
	
	if(event.keyCode == 13){
		document.searchFrm.action = "aprvSearch";
		document.searchFrm.method = "get";
		document.searchFrm.submit();
	}
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var = "memRank" value="${empty getIsAdmin.adminRank ? sessionScope.getMember.memRank : getIsAdmin.adminRank}"/>
	<div>
		<span>${sessionScope.getMember.memName }(${sessionScope.getMember.memRank eq 'R1' ? '사원' 
													: sessionScope.getMember.memRank eq 'R2' ? '대리' 
													: sessionScope.getMember.memRank eq 'R3' ? '과장' : '부장'}) 님 환영합니다.
		</span>
		
		<span id = "info" name = "info">
		</span>
	</div>
	
	<input type = "button" name = "logout" id = "logout" value = "로그아웃"><br>
	<input type = "button" name = "write" id ="write" value = "글쓰기">
	<input type = "button" name = "approval" id = "approval" value = "대리결재">
	
	<form name = "searchFrm" id = "searchFrm" >
		<select name = "searchType" id = "searchType">
			<option name = "searchDefault" id = "searchDefault" value = "searchDefault">선택</option>
			<option name = "searchName" id = "searchName" value = "searchName">작성자</option>
			<option name = "searchSubject" id = "searchSubject" value = "searchSubject">제목</option>
			<option name = "searchApprv" id = "searchApprv" value = "searchApprv">결재자</option>
		</select>
		
		<input type = "text" name = "searchTxt" id = "searchTxt" onkeydown = "Enter_Check();">
		<input type = "hidden" name = "memName" id = "memName" value = "${sessionScope.getMember.memName }">
		<input type = "hidden" name = "memRank" id = "memRank" value = "${sessionScope.getMember.memRank }">
		<input type = "hidden" name = "adminRank" id = "adminRank" value = "${getIsAdmin.adminRank }">
		
		<select name = "statusBox" id = "statusBox">
			<option name = "status1" id = "status0" value = "s0" selected>결재상태</option>
			<option name = "status1" id = "status1" value = "s1">임시저장</option>
			<option name = "status2" id = "status2" value = "s2">결재대기</option>
			<option name = "status3" id = "status3" value = "s3">반려</option>
			<option name = "status4" id = "status4" value = "s4">결재중</option>
			<option name = "status4" id = "status4" value = "s5">결재완료</option>
		</select>
		
		<br>
		
		<input type = "text" name = "stDate" id = "stDate" autocomplete="off"> ~ 
		<input type = "text" name = "enDate" id = "enDate" autocomplete="off" onkeydown = "Enter_Check();">
		
	</form>
		
		<br>
		
		<input type = "button" name = "searchBtn" id = "searchBtn" value = "검색">
	<h3>${maxSeq }</h3>
	<form name = "listFrm" id = "listFrm">
	 <input type = "hidden" name = "seq" id = "seq" value = "${maxSeq }">
	 <input type = "hidden" name = "adminRank" id = "adminRank" value = "${getIsAdmin.adminRank}">
	 <table border = "1px solid black" cellspacing="0" style="width: 600px;">
	  <thead>
	  	<tr>
	 		<th>번호</th> <th>작성자</th> <th>제목</th> <th>작성일</th> <th>결재일</th> <th>결재자</th> <th>결재상태</th>
	 	</tr>
	  </thead>
		  <tbody id = "ajaxContainer">
		   <c:forEach items = "${getList }" var = "list"> 
		 	 <tr onclick = "location.href='viewContent?seq=${list.seq }&status=${list.aprvStatus}&adminRank=${getIsAdmin.adminRank}'" style = "cursor:pointer;">
		 		<td>${list.seq }</td>
		 		<td>${list.memName }</td> 
		 		<td width = "200">${list.boardSubject }</td> 
		 		<td>${list.regDate }</td> 
		 		<td>${list.aprvDate }</td> 
		 		<td>${list.aprvName }</td> 
		 		<td>${list.aprvStatus }</td>
		 	 </tr>
			
		  </c:forEach>
		 </tbody>
	 </table>	
	</form>

</body>
</html>