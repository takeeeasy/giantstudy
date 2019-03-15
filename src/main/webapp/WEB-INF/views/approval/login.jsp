<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta name="google-signin-client_id" content="762544477250-48ea5ugs3kl5khp2lni9dkv0ecv9rbei.apps.googleusercontent.com">
<script>

var repStrNum = /[^a-z|^0-9]/gi;

$(function(){
	
	$('#memId').focus();

	$('#loginBtn').click(function(){
		loginValidateCheck();
	});
});

function Enter_Check(){
	
	if(event.keyCode == 13){
		loginValidateCheck();
	}
}

function regExp(rep, val){
	
	if((new RegExp(rep)).test(val)){
		
		return 0;
	}
	
	else{
		
		return 1;
	}
	
}


function loginValidateCheck(){
	var res = regExp(repStrNum, $('#memId').val());
	
	if (res == 0)
		{
			alert("영어, 숫자만 입력하세요.");
			
			$('#memId').val("");
			
			$('#memId').focus();
			
			return;
		}
	else if ($('#memId').val() == ''){
		alert('아이디를 입력하세요');
	}
	else if ($('#memPass').val() == ''){
		alert('비밀번호를 입력하세요')
	}
	else
		{
			fncGoSubmit();
		}
}


function fncGoSubmit(){
	
	$('#loginFrm').attr("action", "loginProc").attr("method", "post").submit();
}

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  
	  $('#info').append(profile.getName());
	  $('img').attr("src", profile.getImageUrl());
	}


  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
      location.href = "login";
    });
  }
 

  //<![CDATA[
  // 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('9b8ac0458a10ab4d97c97881bccddc6b');
  function loginWithKakao() {
    // 로그인 창을 띄웁니다.
    Kakao.Auth.login({
      success: function(authObj) {
        alert(JSON.stringify(authObj));
        alert(profile);
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  };
//]]>

  
  
</script>
</head>
<body>
<h1>로그인 페이지</h1>
<form name = "loginFrm" id = "loginFrm">
	<table>
		<thead>
		</thead>
		<tbody>
			<tr>
				<td>아이디 : </td> <td><input type = "text" name = "memId" id = "memId" placeholder = "아이디를 입력하세요"></td>
				<td>비밀번호 : </td> <td><input type = "password" name = "memPass" id = "memPass" onkeydown = "Enter_Check();"></td>	
			</tr>
		</tbody>
		<tfoot>
			<tr>
			</tr>
		</tfoot>
	</table>
</form>
<input type = "button" name = "loginBtn" id = "loginBtn" value = "로그인">
<div class="g-signin2" data-onsuccess="onSignIn"></div>
<a href="#" onclick="signOut();">Sign out</a>
	<span id = "info" name = "info">
		</span>
		<span>
		</span>
		<img src = "">
<a id="custom-login-btn" href="javascript:loginWithKakao()">
<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
</body>
</html>