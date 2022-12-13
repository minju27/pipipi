<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSP 로그인</title>
	<link rel="stylesheet" href="css/login.css">
</head>
<body>
<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
%>
<script>
alert("이미 로그인되어 있습니다.");		
history.back();
</script>	
<%
		}
%>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<div class="login-page">
  <div class="form">
    <h1>동국 강의실대여</h1>
    <form class="register-form" method="post" action="joinAction.jsp">
      <input type="text" placeholder="학번" name="userID" maxlength="20"/>
      <input type="password" placeholder="비밀번호" name="userPassword" maxlength="20"/>
      <input type="email" placeholder="이메일주소" name="userEmail" maxlength="50"/>
      <input type="text" placeholder="전화번호" name="userPnum" maxlength="20"/>
      <input type="text" placeholder="이름" name="userName" maxlength="20"/>
      <button>create</button>
      <p class="message">이미 가입하셨나요? <a href="#">로그인하기</a></p>
    </form>
    <form class="login-form" method="post" action="loginAction.jsp">
      <input type="text" placeholder="학번" name="userID" maxlength="20"/>
      <input type="password" placeholder="비밀번호" name="userPassword" maxlength="20"/>
      <button>login</button>
      <p class="message">가입하지 않으셨나요? <a href="#">회원가입하기</a></p>
      <p class="message">비밀번호를 잊으셨나요? <a href="#" onclick="location.href='findPWview.jsp'">비밀번호찾기</a> </p>
    </form>
  </div>
</div>
<script type="text/javascript" src="js/login.js"></script>
</body>
</html>