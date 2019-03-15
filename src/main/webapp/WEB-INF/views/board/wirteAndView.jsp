<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
<form action="insert" method="post" >
<c:if test="${empty viewContent}">
	이름:<input type="text" name="memName"><br>
	아이디:<input type="text" name="memId"><br>
	제목:<input type="text" name="boardSubject"><br>
	내용
	<br><textarea cols="40" rows="8" name="boardContent"></textarea><br>
	<input type="submit" value="등록">
</c:if>
</form>




<form action="/modify">
<c:forEach items="${viewContent}" var="list">
	이름:<input type="text" name="memName" value="${list.memName }"><br>
	아이디:<input type="text" name="memId" value="${list.memId }"><br>
	제목:<input type="text" name="boardSubject" value="${ list.boardSubject}"><br>
	내용
	<br><textarea cols="40" rows="8" name="boardContent">${list.boardContent }</textarea><br>
	<input type="hidden" name="seq" value="${list.seq}">
	<input type="submit" value="수정">
</c:forEach>
</form>

<input type="button" value="취소" onclick="location.href='/list'">



</body>
</html>