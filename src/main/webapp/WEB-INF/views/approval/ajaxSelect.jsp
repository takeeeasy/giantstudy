<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		   <c:forEach items = "${getList }" var = "list"> 
		 		<tr onclick="location.href='viewContent?seq=${list.seq }&status=${list.aprvStatus}&adminRank=${param.adminRank}'"
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
