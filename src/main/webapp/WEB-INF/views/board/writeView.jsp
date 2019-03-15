<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>
	$(function(){
		// 등록button click시 #writeFrm 데이터를  submit
		$('#regBtn').click(function(){
			alert('등록들옴');
			$('#writeFrm').attr("action", "insert").attr("method", "post").submit();
		});
		// 수정button click시 #writeFrm 데이터를 submit
		$('#uptBtn').click(function(){
			$('#writeFrm').attr("action", "/modify").attr("method", "post").submit();
		});
	});

</script>
<title>Insert title here</title>
</head>
<body>
<!-- write&view Form -->
<form name = "writeFrm" id = "writeFrm">
	이름 : <input type = "text" name = "memName" id = "memName" value = "${dataMap.memName }"><br>
	아이디 : <input type = "text" name = "memId" id = "memId" value = "${dataMap.memId }"><br>
	제목 : <input type = "text" name = "boardSubject" id = boardSubject value = "${dataMap.boardSubject }"><br>
	내용 : <br>
	<textarea rows="5" cols="15" name = "boardContent" id = "boardContent">${dataMap.boardContent }</textarea>
	<input type = "hidden" id = "seq" name = "seq" value = "${dataMap.seq }">
</form>

<!-- regBtn/uptBtn dataMap empty 여부에 따라 표시 조건문 -->
<div>
	<c:choose>
		<c:when test="${empty dataMap }">
			<input type = "button" name = "regBtn" id = "regBtn" value = "등록" >
		</c:when>
		<c:otherwise>
			<input type = "button" name = "uptBtn" id = "uptBtn" value = "수정" >
		</c:otherwise>
	</c:choose>
	
	<input type="button" name = "canBtn" id = "canBtn" value="취소" onclick="location.href='/list'">
</div>

</body>
</html>