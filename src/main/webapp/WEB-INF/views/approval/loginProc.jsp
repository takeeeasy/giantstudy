<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src = "/resources/js/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	var memId = '${not empty getMember.memId ? getMember.memId : '0'}';
	var memPass = '${getMember.memPass}';
	var paramId = '${param.memId}';
	var paramPass = '${param.memPass}';
	
	if (paramId != ''){
		
		if (memId == '${param.memId}'){
			if (memPass == paramPass){
				document.location= "/applist";
				return;
			}
			else{
				alert('비밀번호가 틀렸습니다.')
				sessionStorage.clear();
				document.location = "/login";
			}
		}
	
		else {
			
			alert('등록되지 않은 사용자 입니다.');
			sessionStorage.clear();
			document.location = "/login";
		}	
	}
	else{
		alert('허가되지 않은 접근입니다.');
		sessionStorage.clear();
		document.location = "/login";
	}

});
		
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script>

</script>
</head>
<body>
	
	<h2>서버 준비중..</h2>
</body>
</html>