<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script type = "text/javascript">
$(function(){
	$('#accept').click(function(){
		$.ajax({
			type : "POST",
			url : "/insertAdmin",
			data : $('#adminFrm').serialize(),
			
			success : function(data){
				alert($('#memName').val()+'님에게 권한위임 완료!');
				alert("성공: ");
				window.close();
			},
			error : function(xhr, status, error){
				alert("실패"+xhr, status, error);
				window.close();
			}
		});
			
	});
	
	$('#cancel').click(function(){
		window.close();
	});
	
	$('#memName').change(function(){
		var values = $('#memName').val().split(':');
		$('#memRank').val(values[1] == 'R1' ? '사원' : values[1] == 'R2' ? '대리' :'과장');
	});
});
</script>
</head>
<body>
<form name = "adminFrm" id = "adminFrm">
<table border="1" cellspacing="0">
	<tr>
		<td>대리결재자: </td>
		<td>
			<select name = "memName" id = "memName">
				<option name = "default" id = "default" value = "default">선택</option>
					<c:forEach items = "${member }" var ="list">
						<option name = "grantAuthor" id = "grantAuthor" value = "${list.memName }:${list.memRank}">${list.memName }:${list.memRank}</option>
					</c:forEach>
			</select>
		</td>
	</tr>
	
	<tr>
		<td>직급: </td>
		<td>
			<input type = "text" name = "memRank" id = "memRank" value = "" readonly = "readonly">
			<input type = "hidden" name = "adminRank" id = "adminRank" value = "${sessionScope.getMember.memRank }">
		</td>
	</tr>
	
	<tr>
		<td>대리자: </td>
		<td>
			<input type = "text" name = "adminName" id = "adminName" value = "${sessionScope.getMember.memName }" readonly="readonly">			
		</td>
	</tr>
	<tr>
		<td><input type = "button" name = "cancel" id = "cancel" value = "취소">
		<input type = "button" name = "accept" id = "accept" value = "승인"></td>
	</tr>
</table>
</form>
</body>
</html>