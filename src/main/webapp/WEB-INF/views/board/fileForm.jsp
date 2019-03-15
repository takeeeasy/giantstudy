<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "/resources/js/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$('#fBtn').on('click', function(){
		$('#fileFrm').attr("action", "fileUploadProc").attr("method", "post").submit();
	})
})
</script>
</head>
<body>
<h1>File Upload</h1>
<form name = "fileFrm" id = "fileFrm" enctype="multipart/form-data">
<table>
	<thead>
		<tr>
			<th>File Name</th>
			<th>Browse</th>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td><input type = "file" name = "fileName" id = "fileName" ></td>
			<td><input type = "button" name = "fBtn" id = "fBtn" value = "submit"></td>
		</tr>	
	</tbody>
</table>
</form>
</body>
</html>