<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("UTF-8");%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
		var aprvStatus = '${param.status}';
		
		var memRank = '${param.adminRank eq '' ? sessionScope.getMember.memRank : param.adminRank}';
		var memName = '${sessionScope.getMember.memName}';
		var writer = '${content.memName}';
		alert("${param.adminRank eq ''}"+memRank);
// 		alert('aprvStatus: ' + aprvStatus);
		
		if (aprvStatus == "")
			{
			alert("in1");
				$('#returnBtn').remove();
				$('#boardSubject').focus();
			}
		if (aprvStatus == "임시저장")
		{
			if(memRank == 'R3' || memRank == 'R4'){
				alert("in2");				
				$('#returnBtn').remove();
			}
		}
		else if (aprvStatus == "결재대기")
		{
			if (memRank == 'R1' || memRank == 'R2')
			{
				alert("in3");
					$('#aprvBtn, #tempBtn').remove();		
			}
			else
			{
				if (memName == writer && '${param.adminRank}' == '')
				{
					alert("in4");
					$('#aprvBtn').remove();
				}
				else if (memRank == 'R4')
				{
					alert("in5");
					$('#aprvBtn, #tempBtn, #returnBtn').remove();
				}
				else
				{
					alert("in6");
					$('#tempBtn').remove();		
				}
			}
			
			
			$('#boardSubject,#boardContent').attr("readonly", "readonly");
			$('#checkReq1').attr('checked', 'checked');
		}
		
		else if (aprvStatus == "결재중")	// 부장, 과장 조건
		{
			if (memRank == 'R4')
			{
				alert("in7");
				$('#boardSubject,#boardContent').attr("readonly", "readonly");
				$('#tempBtn').remove();
			}
			else if (memRank == 'R3')
			{
				alert("in8");
				$('#boardSubject,#boardContent').attr("readonly", "readonly");
				$('#returnBtn, #tempBtn, #aprvBtn').remove();
			}
			else
			{
				alert("in9");
				if (memName == writer)
				{
					alert("in10");
					$('#boardSubject,#boardContent').attr("readonly", "readonly");
					$('#aprvBtn, #tempBtn, #returnBtn').remove();
				}
				$('#boardSubject,#boardContent').attr("readonly", "readonly");
				$('#aprvBtn, #tempBtn').remove();
			}
			$('#checkReq1, #checkReq2').attr('checked', 'checked');
			
		}
		
		else if (aprvStatus == "반려")
		{
			if (memName == writer)
			{
				alert("in11");
				$('#returnBtn').remove();
				
			}
			if (memName == writer && memRank == 'R3')	//내가 작성한글이고, 직급이 과장일때는 결재요청에 체크!
			{
				alert("in12");
				$('#checkReq1').attr('checked', 'checked');
			}
			if (${empty param.adminRank}){
				
				if (memRank == 'R3' || memRank =='R4')
				{
					alert("in13");
					$('#boardSubject,#boardContent').attr("readonly", "readonly");
					$('#returnBtn, #tempBtn, #aprvBtn').remove();
				}
			}
		}
		
		else if (aprvStatus == "결재완료")
		{
			alert("in14");
			$('#boardSubject, #boardContent').attr("readonly", "readonly");
			$('#checkReq1, #checkReq2, #checkReq3').attr('checked', 'checked');
			$('#aprvBtn, #tempBtn, #returnBtn').remove();
		}
		
	
	var name = "${sessionScope.getMember.memName }";
	var rank = "${param.adminRank eq '' ? sessionScope.getMember.memRank : param.adminRank}";
	
	
	$('#aprvBtn').click(function(){
		
// 		alert(name+'('+rank+')'+", "+aprvStatus);
		
		if ($('#boardSubject').val() == '' || $('#boardContent').val() == '')
			{
				alert('내용을 입력하세요.');
				return;
			}
		
		if (rank ==  'R1' || rank == 'R2')
			{
				if (aprvStatus != '임시저장' && aprvStatus != '반려'){
					alert('an1');
					$('#aprvStatus').val('s2');	
					$('#writeFrm').attr("action", "insertList").attr("method", "get").submit();	
				}
				else{
					alert('an2');
					document.getElementById("aprvStatus").value = "s2";
					document.writeFrm.action = "updateList";
					document.writeFrm.method = "get";
					document.writeFrm.submit();
				}
				
			}
		else if (rank == 'R3')
			{
				if (aprvStatus != '임시저장' && aprvStatus != '반려' && aprvStatus != '결재대기'){
					alert('an3');
					$('#aprvStatus').val('s4');
					$('#writeFrm').attr("action", "insertList").attr("method", "get").submit();
				}
				else{
					alert('an4');
				$('#aprvStatus').val('s4');
				$('#aprvDate').val('');
				$('#aprvName').val(name);
				$('#writeFrm').attr("action", "updateList").attr("method", "get").submit();
				}
				
			}
		else if (rank == 'R4')
			{
			alert('an5');
				$('#aprvStatus').val('s5');
				$('#aprvDate').val('');
				$('#aprvName').val(name);
				$('#writeFrm').attr("action", "updateList").attr("method", "get").submit();
			}
		else
			{
				alert('결재상태 에러!!');
			}
		
		
	});
	
	
	
	$('#tempBtn').click(function(){
		
// 		alert(name+'('+rank+')');
		
		if ($('#boardSubject').val() == '' || $('#boardContent').val() == '')
		{
			alert('내용을 입력하세요.');
			return;
		}
		$('#aprvStatus').val('s1');
		alert(isNewList());
		if(isNewList()){
			alert('1');
			$('#writeFrm').attr("action", "updateList").attr("method", "get").submit();	
		}
		else{
			alert('2');
			$('#writeFrm').attr("action", "insertList").attr("method", "get").submit();	
		}
		
		
	});
	
	
	
	$('#returnBtn').click(function(){
		
// 		alert(name+'('+rank+')');
		
		$('#aprvStatus').val('s3');
		
		$('#writeFrm').attr("action", "updateList").attr("method", "get").submit();
		
	});
	
	
	function authorityCheck(){
		if (memRank == 'R1' || memRank == 'R2')
		{
			
		$('#boardSubject,#boardContent').attr("readonly", "readonly");
		$('#aprvBtn, #tempBtn').remove();
			
		}
		
	}
	
});


function isNewList(){
	
// 	var isNull = ${content.boardSubject != null}; // 기본값 true
// 	var isNull2 = document.getElementById('boardSubject').value != '';
// 	var isNull3 = (isNull1 == true && isNull2 == true) ? false : true;
	var isNull = ${not empty history };
	return isNull;
}



</script>
</head>
<body>


	<form name = "writeFrm" id = "writeFrm" accept-charset="utf-8" onsubmit="document.charset='utf-8';">
		
		<table border="1" cellspacing="0">
		
	 	 <tr>
	  	  <th>결재요청</th><th>과장</th><th>부장</th>
	 	 </tr>
	 	 
	 	 <tr>
	 	  <td><input type = "checkbox" name = "checkReq1" id = "checkReq1" disabled="disabled"></td>
	  	  <td><input type = "checkbox" name = "checkReq2" id = "checkReq2" disabled="disabled"></td>
	  	  <td><input type = "checkbox" name = "checkReq3" id = "checkReq3" disabled="disabled"></td>
	 	 </tr>
	 	 
		</table>
		
	
		<table border="1" cellspacing="0">
		
		 <tr>
		  <td>번호 : </td>
		  <td> <input type = "text" name = "seq" id = "seq" readonly="readonly" value = "${param.seq}"></td>
		 </tr>
		 
		 <tr>
		 <c:set var = "memName" value = "${content.memName }"/>
		  <td>작성자 : </td>
		  <c:choose>
		  
		   <c:when test = "${not empty memName }">  
		  	<td> <input type = "text" name = "memName" id = "memName" readonly="readonly" value = "${memName }"></td>
		   </c:when>
		   
		   <c:otherwise> <%-- 글 insert --%>
		   	<td><input type = "text" name = "memName" id = "memName" readonly = "readonly" value = "${sessionScope.getMember.memName }"></td>
		   </c:otherwise>
		   
		  </c:choose>
		 </tr>
		 
		 <tr>
		  <td>제목 :</td>
		  <td><input type = "text" name = "boardSubject" id = "boardSubject" value = "${content.boardSubject }"></td>
		 </tr>
		 
		 <tr>
		  <td>내용 : </td>
		  <td><textarea rows = "6" cols = "24" name = "boardContent" id = "boardContent">${content.boardContent }</textarea></td>
		 </tr>
		 
		</table>
			
			<input type = "hidden" name = "aprvStatus" id = "aprvStatus" value = "s0">
			<input type = "hidden" name = "aprvName" id = "aprvName" value = "${sessionScope.getMember.memName }">
	</form>
	
	
	<div>
	
		<c:set var="memRank" value = "${param.adminRank eq '' ? sessionScope.getMember.memRank : param.adminRank}"/>
		<c:choose>
		
		 <c:when test = "${memRank eq 'R1' or  memRank eq 'R2'}">
		  	 <input type = "button" name = "tempBtn" id = "tempBtn" value = "임시저장">
			 <input type = "button" name = "aprvBtn" id = "aprvBtn" value = "결재요청">
		 </c:when>
		 
		 <c:when test = "${memRank eq 'R3' or  memRank eq 'R4'}">
		 	
		 	<input type = "button" name = "returnBtn" id = "returnBtn" value = "반려">
		 	
		 	
		  	<input type = "button" name = "tempBtn" id = "tempBtn" value = "임시저장">
		  	
			<input type = "button" name = "aprvBtn" id = "aprvBtn" value = "결재">
		 </c:when>
		 
		</c:choose>
	</div>
	
	
	<table name = "history" id = "history" border = "1" cellspacing = "0">
	
	 <thead>
	  <th>번호</th>
	  <th>결재일</th>
	  <th>결재자</th>
	  <th>결재상태</th>
	 </thead>
	 
	 <tbody>
	  <c:forEach items = "${history }" var = "list">
		  <tr>
		   <td>${list.hseq }</td>
		   <td>${list.regDate }</td>
		   <td>${list.aprvName }</td>
		   <td>${list.aprvStatus }</td>
	      </tr>
	  </c:forEach>
	  
	 </tbody>
	</table>
	<p>testtesttest${param}</p>
	<p>${history }</p>
</body>
</html>