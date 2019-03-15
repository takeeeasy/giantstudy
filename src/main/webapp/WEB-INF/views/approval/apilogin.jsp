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

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  
	  $('#info').append(profile.getName());
	  $('#googleProfile').attr("src", profile.getImageUrl());
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
    	Kakao.API.request({
    		url : "/v2/user/me",
    		success : function(data){
    			alert(data.properties.nickname+"님, 환영합니다!");
    			$('#kakaoProfile').html("nickname: "+data.properties.nickname);
    			$('#kakaoProfImg').attr("src", data.properties.profile_image);
    		}
    	})
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
<div class="g-signin2" data-onsuccess="onSignIn"></div>
<a href="#" onclick="signOut();">Sign out</a>
	<span id = "info" name = "info">
		</span>
		<span>
	</span>
		<img src = "" id = "googleProfile">
<br><br>
<a id="custom-login-btn" href="javascript:loginWithKakao()">
<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
<a href="http://developers.kakao.com/logout">카카오로그아웃</a>

<div>
	<p id = "kakaoProfile"></p>
	<img src="" id = "kakaoProfImg">
</div>
</body>
</html>