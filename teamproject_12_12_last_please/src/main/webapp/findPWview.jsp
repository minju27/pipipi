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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"> 
   function pw_search() { 
	 	var frm = document.pwfindscreen;

	 	if (frm.userID.value.length != 10) {
		  alert("학번을 올바르게 입력해주세요");
		  return;
		 }

		if (frm.userPnum.value.length != 11) {
		  alert("핸드폰번호를 정확하게 입력해주세요");
		  return;
		 }

	 frm.method = "post";
	 frm.action = "findPW.jsp"; //넘어간화면
	 frm.submit();  
   }
   function goBack() {
		  window.history.back();
   }
</script> 
<div class="findPW-page">
  <div class="form">
   <h1>비밀번호 찾기</h1>
    <form class="pwfind" name="pwfindscreen" method="post" >
      <section class = "form-search">
      <div class = "find-name">
        <input type="number" name="userID" class="btn-ID" placeholder="학번" maxlength="20"/>
       </div>
       <div class = "find-pnum">
        <input type="number" onKeyup = "addHypen(this);" name="userPnum" class="btn-Pnum" placeholder="전화번호" maxlength="20"/>
       </div>
      </section>
		<button name="enter" onClick="pw_search()">찾기</button>
	 <style>
  		a {
  	  	text-decoration: none;
  	  	color: orange;
  	    }
 	</style>
		<h5> 로그인 회원가입 페이지로 돌아가고 싶나요?  <a href="javascript:history.back();">뒤로가기</a> </h5>
		
      </form>
      </div>
      </div>
      </body>