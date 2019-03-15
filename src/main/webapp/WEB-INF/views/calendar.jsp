<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link media="all" type="text/css" rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/calendar.css">
<script type="text/javascript">
	//toggle class scroll 
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$('.navbar-trans').addClass('afterscroll');
		} else {
			$('.navbar-trans').removeClass('afterscroll');
		}

	});

	// demo only 
	// open link in new tab without ugly target="_blank"
	$("a[href^='http']").attr("target", "_blank");

	$(document).ready(function() {
		$("#home").click(function() {
			setTimeout('$("#h").toggle(700)', '700');
			$("#n").hide(1000);
			$("#t").hide(1000);
		});
		$("#new").click(function() {
			setTimeout('$("#n").toggle(700)', '700');
			$("#h").hide(1000);
			$("#t").hide(1000);
		});
		$("#team").click(function() {
			setTimeout('$("#t").toggle(700)', '700');
			$("#n").hide(1000);
			$("#h").hide(1000);
		});
		
	     
		$('.fa-caret-left').click(function(){
			var tmp = $(this).attr('id').split('-');
			var month = $('.calendarMonth-Data').html();
			var year = $('.calendarYear-Data').html();
			if(tmp[0]=='calendarYear'){
				year -= 1;
			}else{
				month -= 1;
			}
			/////////////////////////////////////
			$.ajax({
		         type : "post",
		         url : '/proto/calendarAjax',
		         data : {month:month,year:year},
		         error: function() {
		         },
		         success : function(result){
		  				var calendarTmp = result.split(':');
		  				var yearTmp = calendarTmp[0];
		  				var monthTmp = calendarTmp[1];
		  				var calDMTmp = calendarTmp[2];
		  				var calDWTmp = calendarTmp[3];
		  				var lastCalDMTmp = calendarTmp[4];
		  				var countTmp = 0;
		  				var colorTmp = '';
		  				console.log(calDWTmp);
		  				$('.calendarMonth-Data').html(calendarTmp[1]);
			    		$('.calendarYear-Data').html(calendarTmp[0]);
		  				for(var i = 1; i<43; i++){
		  					if(i<=calDWTmp){
		  						countTmp = lastCalDMTmp-calDWTmp+i;
		  						colorTmp='color:gray';
		  					}else if(i>calDWTmp&&i<=calDMTmp*1+calDWTmp*1){
		  						countTmp = i-calDWTmp;	
		  						colorTmp='';
		  					}else{
		  						countTmp = i-calDMTmp*1-calDWTmp*1;
		  						colorTmp='color:gray';
		  					}
		  					$('#'+i).html(countTmp);
		  					$('#'+i).attr('style',colorTmp);
		  				}
		      	}
		   		});
	     });
		
		$('.fa-caret-right').click(function(){
			var tmp = $(this).attr('id').split('-');
			var month = $('.calendarMonth-Data').html();
			var year = $('.calendarYear-Data').html();
			
			console.log();
			if(tmp[0]=='calendarYear'){
				year *=1;
				year += 1;
			}else{
				month *=1;
				month += 1;
			}
			console.log(tmp[0]);
			console.log(month);
			console.log(year);
		     $.ajax({
		         type : "post",
		         url : '/proto/calendarAjax',
		         data : {month:month,year:year},
		         error: function() {
		         },
		         success : function(result){
		  				var calendarTmp = result.split(':');
		  				var yearTmp = calendarTmp[0];
		  				var monthTmp = calendarTmp[1];
		  				var calDMTmp = calendarTmp[2];
		  				var calDWTmp = calendarTmp[3];
		  				var lastCalDMTmp = calendarTmp[4];
		  				var countTmp = 0;
		  				var colorTmp = '';
		  				$('.calendarMonth-Data').html(calendarTmp[1]);
			    		$('.calendarYear-Data').html(calendarTmp[0]);
		  				for(var i = 1; i<43; i++){
		  					if(i<=calDWTmp){
		  						countTmp = lastCalDMTmp-calDWTmp+i;
		  						colorTmp='color:gray';
		  					}else if(i>calDWTmp&&i<=calDMTmp*1+calDWTmp*1){
		  						countTmp = i-calDWTmp;	
		  						colorTmp='';
		  					}else{
		  						countTmp = i-calDMTmp*1-calDWTmp*1;
		  						colorTmp='color:gray';
		  					}
		  					$('#'+i).html(countTmp);
		  					$('#'+i).attr('style',colorTmp);
		  				}
		      	}
		   		});
		     });


	});
</script>

<style type="text/css">
::-webkit-scrollbar {
	display: none;
}

body {
	background:url('../../../proto/resources/images/background.jpg') fixed;
	background-size: cover;
	background-repeat: no-repeat;
	padding: 0;
	margin: 0;
	background-repeat: no-repeat;
	height: 130vh;
}
</style>


<title>Insert title here</title>
</head>


<body>

	<jsp:include page="../main/chatting.jsp"></jsp:include>

	<div style="-ms-overflow-style: none;">
		<!--스크롤바 없이 스크롤 가능하게 함   -->

		<nav
			class="navbar navbar-default navbar-doublerow navbar-trans navbar-fixed-top">
		<!-- top nav --> <nav class="navbar navbar-top hidden-xs">
		<div class="container">
			<!-- left nav top -->
			<ul class="nav navbar-nav pull-left">
				<li id="home"><a href="#"><span class="text-white"><i
							class="fa fa-home"></i>&nbspHome</span></a></li>
				<li id="new"><a href="#"><span class="text-white"><i
							class="fa fa-newspaper-o"></i>&nbsp New</span></a></li>
				<li id="team"><a href="#"><span class="text-white"><i
							class="fa fa-users"></i>&nbsp Team</span></a></li>

			</ul>
			<!-- right nav top -->
			<ul class="nav navbar-nav pull-right">
				<li><a href="settings" class="text-white"><i
						class="fa fa-cog"></i>&nbspSettings</a></li>
				<li><a href="logout" class="text-white"><i
						class="fa fa-power-off"></i>&nbspLogout</a></li>
			</ul>
		</div>
		<div class="dividline light-grey"></div>
		</nav> <!-- down nav --> <nav class="navbar navbar-down">
		<div class="container">
			<div class="flex-container">
				<div class="navbar-header flex-item">
					<div class="navbar-brand">Project</div>
				</div>
				<ul id="h" class="nav navbar-nav flex-item hidden-xs"
					style="display: none;">
					<li><a href="typeA">Type - A</a></li>
					<li><a href="typeB">Type - B</a></li>

				</ul>

				<ul id="n" class="nav navbar-nav flex-item hidden-xs"
					style="display: none;">
					<li><a href="news">공지사항</a></li>
					<li><a href="event">행사</a></li>

				</ul>

				<ul id="t" class="nav navbar-nav flex-item hidden-xs"
					style="display: none;">
					<li><a href="list?teamNum=1">경영지원팀</a></li>
					<li><a href="list?teamNum=2">인사팀</a></li>
					<li><a href="list?teamNum=3">개발팀</a></li>
					<li><a href="list?teamNum=4">영업팀</a></li>
				</ul>
				<ul class="nav navbar-nav flex-item hidden-xs pull-right">
					<li class="chatON"><span class="text-white"><i
							class="fa fa-wechat"></i>&nbsp Messenser</span></li>
				</ul>
			</div>
		</div>
		</nav> </nav>

	</div>



	<div class="calendarContainer">
		<div class="calendarYear"><i class="fa fa-caret-left" id = "calendarYear-left"></i><div class = "calendarYear-Data">${year}</div><i class="fa fa-caret-right" id = "calendarYear-right"></i></div>
		<div class="calendarMonth"><i class="fa fa-caret-left" id = "calendarMonth-left"></i><div class = "calendarMonth-Data">${month}</div><i class="fa fa-caret-right" id = "calendarMonth-right"></i></div>
		<div class="calendarWeek">
			<div class="weekDay" style="color:red">일</div>
			<div class="weekDay">월</div>
			<div class="weekDay">화</div>
			<div class="weekDay">수</div>
			<div class="weekDay">목</div>
			<div class="weekDay">금</div>
			<div class="weekDay" style="color:blue">토</div>
		</div>
		<div class="calendarDay">
			<c:forEach begin="1" end="6" varStatus="status">
				<div class="week">
					<c:forEach begin="1" end="7" varStatus="status2">
						<c:choose>
							<c:when
								test="${((status.count-1)*7 +status2.count - calDW) > 0 && ((status.count-1)*7 +status2.count - calDW) <= calDM}">
								<div class="day" id = "${(status.count-1)*7 +status2.count}">${(status.count-1)*7 +status2.count - calDW}</div>
							</c:when>
							<c:when
								test="${((status.count-1)*7 +status2.count - calDW) <= 0}">
								<div class="day"style="color: gray" id = "${(status.count-1)*7 +status2.count}">${lastCalDM + (status.count-1)*7 +status2.count-calDW}</div>
							</c:when>
							<c:otherwise>
								<div class="day"style="color: gray" id = "${(status.count-1)*7 +status2.count}">${(status.count-1)*7 +status2.count-calDW-calDM}</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>