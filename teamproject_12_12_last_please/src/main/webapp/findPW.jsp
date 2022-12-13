<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO" %>
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<head>
  <link rel="stylesheet" href="css/findPW.css">
</head>
<body>
<%
    String userID = request.getParameter("userID");
     String userPnum = request.getParameter("userPnum");
     
UserDAO userDAO = new UserDAO();
 String userPassword = userDAO.findpw(userID, userPnum); //아이디를 디비에서 가져옴..실패시 널
 
%>

<form name="pwsearch" method="post">
      <%
       if (userPassword != null) {
      %>
      <div class = "container">
      	<div class = "found-success">
	      <h2>  회원님의 비밀번호: </h2>  
	      <div class ="found-id"><%=userPassword%></div><br><br>
	     </div>
	     <div class = "found-login">
 		    <h5>찾은 아이디로 <a href="#" onclick="location.href='login.jsp'">로그인하기</a> </h5>
       	</div>
       </div>
      <%
  } else {
 %>
        <div class = "container">
      	<div class = "found-fail">
	      <h2>  등록된 정보가 없습니다 </h2><br><br>  
	     </div>
	     <div class = "found-login">
 			  <h5> 비밀번호를 다시 찾고 싶나요?  <a href="javascript:history.back();">다시찾기</a> </h5>
 			 <h5> 로그인-회원가입 페이지로 넘어가고싶나요? <a href="#" onclick="location.href='login.jsp'">회원가입</a> </h5> 
       	</div>
       </div>
  
 <%
  }
 %> 
</form>
</body>