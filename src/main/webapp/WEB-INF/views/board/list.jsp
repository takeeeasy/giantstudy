<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<script src = "/resources/js/jquery-3.3.1.min.js"></script>
<script src = "/resources/js/jquery-1.12.4.js"></script>
<script src = "/resources/js/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<script type="text/javascript">
$(document).ready(function(){
	// 전체 체크/해제 Event---------------------------------------------------------
	$('#chkAll').change(function(){
		if($('#chkAll').prop('checked')){
			$("input[id=chkBox]").prop("checked",true);
			alert("체크!");
		}
		else{
			alert("해제!");
			$('input[id=chkBox]').prop("checked", false);
		}
	});
	// delete submit------------------------------------------------
	$('#delBtn').click(function(){
		$('#listFrm').attr("action", "delete").attr("method", "post").submit();
	});
	
	// search submit
	$('#schBtn').click(function(){
		$.ajax({
			type : "GET",
			url : "/ajaxSearch",
			data : $('#searchFrm').serialize(),
			
			success : function(data){
				alert("성공: "+data);
				$("#ajaxView").html(data);
			},
			error : function(xhr, status, error){
				alert("실패");
			}
		});
// 		$('#searchFrm').attr("action", "search").attr("submit", "post").submit();
	});
	
	// 달력==============================================================
	$('#stDate').datepicker({
		dateFormat: 'yy-mm-dd'
	});
	$('#enDate').datepicker({
		dateFormat: 'yy-mm-dd'
	});
	
});

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><a href="list">테이블명: board_study</a></h1>
<!--  검색 폼 -->
<form name = "searchFrm" id = "searchFrm">
	<div>
		<select name = "searchType" id = "searchType">
			<option value = "searchAll">전체</option>
			<option value = "memName">작성자</option>
			<option value = "subject">제목</option>
			<option value = "subCont">제목+내용</option>
		</select>
		<input type = "text" name = "searchTxt" id = "searchTxt">
		<input type = "button" name = "schBtn" id = "schBtn" value = "검색"><br>
		<input type = "text" name = "stDate" id = "stDate" autocomplete="off">
		~ 
		<input type ="text" name = "enDate" id = "enDate" autocomplete="off"><br>
	</div>
</form>

<!------------------------- BoardList 폼 -------------------------------------------------------------------------------------->
<form name = "listFrm" id = "listFrm">
<input type = "button" name = "write" id = "write" value = "등록" onclick = "location='/writeView'">
<input type = "button" name = "delBtn" id = "delBtn" value = "삭제"> 
<table border="1" id="ajaxView">
<thead>
<tr>
<td><input type = "checkbox" id = "chkAll" name="chkAll"></td>
<th>번호</th>
<th>작성자</th>
<th>아이디</th>
<th>제목</th>
<th>내용</th>
<th>등록일</th>
<th>수정일</th>
<th>조회수</th>
</tr>
</thead>

<!-------------------- 게시판 항목 Map Listㅡ forEach로 뿌리기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<tbody>
	<c:forEach items="${boardList }" var="list">
   	 <tr>
   	  <td><input  type = "checkbox" name = "chkBox" id = "chkBox" value = "${list.seq}"></td>
   	  <td>${list.seq}</td>
   	  <td>${list.memName }</td>
   	  <td>${list.memId }</td>
   	  <td><a href="detail?seq=${list.seq }">${list.boardSubject }</a></td>
   	  <td>${list.boardContent }</td>
   	  <td>${list.regDate }</td>
   	  <td>${list.uptDate }</td>
   	  <td>${list.viewCnt }</td>
   	</tr>
   </c:forEach>	
</tbody>
<tr>
<td colspan = "9">
<c:forEach var="pageNum" varStatus="status"
			begin="1" end="${maxPage}">
<a href ="list?pageNum=${status.count }" id="page">[${status.count }]</a>

</c:forEach>
</td>
</tr>
   
<!------------------- 게시판 항목 Map Listㅡ forEach로 뿌리기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
</table>
</form>
<!---------------------- BoardList 폼-------------------------------------------------------------------------->
	
</body>
</html>