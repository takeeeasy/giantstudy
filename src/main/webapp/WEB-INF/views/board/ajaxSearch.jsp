<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table border="1" id="ajaxView">

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
<!-------------------- 게시판 항목 Map Listㅡ forEach로 뿌리기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

	<c:forEach items="${boardList }" var="list">
   	<tr onclick="location.href='viewContent?seq=${list.seq }&status=${list.aprvStatus}'"
		style="cursor: pointer;">
		<td>${list.seq }</td>
		<td>${list.memName }</td>
		<td width="200">${list.boardSubject }</td>
		<td>${list.regDate }</td>
		<td>${list.aprvDate }</td>
		<td>${list.aprvName }</td>
		<td>${list.aprvStatus }</td>
	</tr>
   </c:forEach>	


   
<!------------------- 게시판 항목 Map Listㅡ forEach로 뿌리기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
</table>