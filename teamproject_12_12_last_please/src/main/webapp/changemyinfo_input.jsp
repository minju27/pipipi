<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*" %>
        <%@page import="java.sql.*" %>
      <%@page import="java.io.PrintWriter" %>
    <%request.setCharacterEncoding("utf-8"); %>   
    <link rel="stylesheet" href="css/header.css"/>
    <link rel="stylesheet" href="css/resercheck.css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>내 정보 변경 결과</title>
</head>
<body>
		<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%> <!--   로그인을 하면 userID가 담기고 아니면 널값이 담긴다 -->
	
	<div id="wrap">
    <nav class="navbar">
        <div class="navbar_logo">
            <a href="main.jsp">
                <h1>Brand</h1>
            </a>
        </div>

        <ul class="navbar_menu">
            <li><a href="reserselectschool.jsp">예약 페이지</a></li>
            <li><a href="board-list.jsp">고객센터</a></li>
            <li><a href="">쪽지</a></li>
            <li><a href="SiteMap.jsp">사이트맵</a></li>
        </ul>

	<%
		if(userID == null) {                 
	%> <!--로그인 안되어 있는 사람들이 보는 화면 -->
		<ul class="navbar_icon">
            <li><a href="login.jsp">로그인/회원가입</a></li>
        </ul>
	<% 
		} else {
	%>  <!-- 로그인 된  사람이 보는 화면, 로그아웃버튼 -->
		<ul class="navbar_icon">
			<li><a href="logoutAction.jsp">로그아웃</a></li>
			<li><a href="">마이페이지</a></li>
		</ul>
	<%
		}
	%>
	

        <input type="checkbox" id="menuicon">
        <label for="menuicon" class="menubtn">
        	<span></span>
        	<span></span>
        	<span></span>
        </label>
        
        <div class="sidebar">
        	<span class="area_desc">
        		<div class="menu">
				    <input type="checkbox" id="expand-menu" name="expand-menu">
				    <ul>
				        <li><a href="#" class="item"><div><b>예약 페이지</b></div></a></li>
				        <br>
				        <li><a href="board-list.jsp" class="item"><div><b>고객센터</b></div></a></li>
				        <li><a href="board-list.jsp" class="item"><div class="sub_menu">공지사항</div></a></li>
				        <li><a href="guide.jsp" class="item"><div class="sub_menu">이용안내</div></a></li>
				        <li><a href="Q&A-list.jsp" class="item"><div class="sub_menu">Q&A</div></a></li>
				        <br>
				        <li><a href="#" class="item"><div><b>쪽지</b></div></a></li>
				        <br>
				        <li><a href="SiteMap.jsp" class="item"><div><b>사이트맵</b></div></a></li>
				        <br>
				        <li><a href="#" class="item"><div class="main-menu"><b>마이페이지</b></div></a></li>
				        <li><a href="#" class="item"><div class="sub_menu">나의 정보 확인</div></a></li>
				        <li><a href="#" class="item"><div class="sub_menu">이전 예약 정보</div></a></li>
				        <li><a href="#" class="item"><div class="sub_menu">현재 예약 정보</div></a></li>
				        
    				</ul>
				</div>
        	
        	</span>
        </div>
        
    </nav>

    <main> 
   <center> <div style="margin-top:15vw;">
   <table class="whiteback" border="0" width="70%" >
 <%
String passwd=request.getParameter("passwd");
String e_mail=request.getParameter("e_mail");
String phone=request.getParameter("phone");
String name =request.getParameter("name");
Connection conn=null;
Statement stmt=null;
String sql="update user set ";
ResultSet rs=null;
if(name.equals("")&&phone.equals("")&&e_mail.equals("")&&passwd.equals("")){%>
	<script> alert("한 가지 이상 입력해 주세요.");
	history.back();</script>
<%
}
if(name.equals("")){
	out.print("<tr><td>이름은 변경되지 않았습니다."+"</td></tr>");
}else{
	//데이터 베이스 변경 코드 넣기
	out.print("<tr><td>이름이 "+name+"(으)로 변경되었습니다.</td></tr>");
	sql+=" userName='"+name+"'";
}if(phone.equals("")){
	out.print("<tr><td>전화번호는 변경되지 않았습니다."+"<br>");
}else{
	//데이터 베이스 변경
	out.print("<tr><td>전화번호가 "+phone+"(으)로 변경되었습니다.</td></tr>");
	if(sql.charAt(sql.length() - 1)=='\''){
		sql+=',';
	}
	sql+=" userPnum='"+phone+"'";
}if(e_mail.equals("")){
	out.print("<tr><td>이메일은 변경되지 않았습니다."+"</td></tr>");
}else{
	//데이터 베이스 변경
	out.print("<tr><td>이메일이 "+e_mail+"(으)로 변경되었습니다.</td></tr>");
	if(sql.charAt(sql.length() - 1)=='\''){
		sql+=',';
	}
	sql+=" userEmail='"+e_mail+"'";
}if(passwd.equals("")){
	out.print("<tr><td>비밀번호는 변경되지 않았습니다."+"</td></tr>");
}else{
	//데이터 베이스 변경
	out.print("<tr><td>비밀번호가 "+passwd+"(으)로 변경되었습니다.</td></tr>");
	if(sql.charAt(sql.length() - 1)=='\''){
		sql+=',';
	}
	sql+=" userPassword='"+passwd+"' ";
}
try{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/userinfo?serverTimezone=UTC";
	conn=DriverManager.getConnection(url,"root","0000");
	stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	sql+=" where userID='"+userID+"'";
	stmt.executeUpdate(sql);
}
catch(Exception e){
	out.println("DB 연동 오류입니다.:"+e.getMessage());}
stmt.close();
conn.close();
%>
</table></div></center>
<div style="text-align:right;margin-right: 13%;margin-top: 2vw;">
<button onclick="location.href='myinfo.jsp';">수정된 개인 정보 보러가기</button>
      
      </main> 
      
    	<section>
        	<!-- 대충 뭐 요소들이 가득차있음 -->
        </section>
        	<%--위에꺼를 아래롯 쉉 --%>
        <footer>
          <p>
          	  <span class="brand"><b>Brand</b></span><br/><br/><br/>
              <span>대표 : grade type=웹프A+</span><br/>
              <span>dongguk@dgu.ac.kr   &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp| &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   02-2260-3114</span><br/>
              <span>04620 서울특별시 중구 필동로 1길 30 동국대학교</span><br/>
              <span>Copyright 2022. grade type=웹프A+. All Rights Reserved.</span>
          </p>
      </footer>

</body>
</html>







