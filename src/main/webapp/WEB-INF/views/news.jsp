<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>공지 사항</title>

<jsp:include page="../main_header.jsp" />
<link rel="stylesheet" href="resources/css/news.css">

</head>
<body>

	<jsp:include page="../main/chatting.jsp"></jsp:include>

	<jsp:include page="../main_navigation.jsp" />

	<div class="container">

		<div class="row" style="margin-bottom: 3%;">
			<div class="col-md-12"
				style="overflow: auto; height: 860px; padding-bottom: 10px; margin-top: 50px">
				<font size="18"
					style="color: #00ff68c7; margin-left: 10px; margin-bottom: 20px; width: 30%"
					id="news">News </font> <input type="password" id="newsPasswd"
					placeholder="비밀번호를 입력해주세요" maxlength="8"
					style="display: none; background: inherit; border-radius: 10px; border: solid 1px; padding-left: 8px; border-color: #ffffffad;"
					onkeyup="pass_ck()">

				<div class="opt">
					<div id="Message">&nbsp</div>
					<div style="text-align: right; margin-top: -15px;">
						Change theme:</font> <a href="#" class="dark">Dark</a> &mdash; <a
							href="#" class="light">Light</a>
					</div>
				</div>
				<ul id="feed">
					<c:forEach items="${noticeList}" var="list" begin="0" end="4">

						<li class="content" onclick="conCk(this)"><a
							href='${list.link }' target='_blank'>${list.title }</a><br>
							<i>${list.author }</i> <%-- <a href='${list.link }' class='apply' target='_blank'>보기</a> --%>
							<div>${list.content }</div></li>
						<c:set var="num" value="${list.num-1 }" />


					</c:forEach>
				</ul>
				<!-- 게시글리스트 위치 -->
				<center>

					<c:if test="${num > 0}">
						<div id="more"
							style="font-size: 12px; text-align: center; color: #fff; background: rgba(0, 0, 0, 0.8); max-width: 100%; width: 30vw; opacity: 0.9; padding: 5px 0;">
							<span style="font-size: 14px;"> + More</span>
						</div>
					</c:if>
				</center>
			</div>
		</div>

		<div class="row"></div>

	</div>

	<script src="resources/js/news.js"></script>

	<script type="text/javascript">
		$(function() {
			var currentPageNum = ${num}
			;// 컨트롤 쉬프트f하면 안먹음
			$("#more").click(function() { // dark 클래스 클릭하면
								$.ajax({type : "GET",
										url : "/proto/newsData",
										data : {currentPageNum : currentPageNum},
										dataType : 'text',
										error : function() {
											$("#feed").after(
													"<center>Unable to load feed, Incorrect path or invalid feed</center>");

											},
											success : function(result) {
												// console.log(values[i]);

												$("#feed").append(result);
												if (currentPageNum < 5) {
													currentPageNum -= ${num};
												} else {
													currentPageNum -= 5;
												}
												if (currentPageNum == 0) {
													$('#more').css('display','none');
												}
											}
										});
							});
		});
	</script>
	<jsp:include page="../main_footer.jsp" />


</body>
</html>