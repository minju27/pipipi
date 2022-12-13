<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String idx = request.getParameter("idx");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/USERINFO","root","0000");
String strSql = "SELECT * FROM guest WHERE id = ?";
PreparedStatement pstmt = conn.prepareStatement(strSql);
pstmt.setString(1,idx);
ResultSet rs = pstmt.executeQuery();

while(rs.next()){
	int id = rs.getInt("id");
	String name = rs.getString("name");
	String email = rs.getString("email");
	String pwd = rs.getString("pwd");
	String writeday = rs.getString("writeday");
	String content = rs.getString("content");
			
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/guest.css">
<link rel="stylesheet" href="nav.css">
<title>Insert title here</title>

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
                <h1>DCR</h1>
            </a>
        </div>

        <ul class="navbar_menu">
            <li><a href="reserselectschool.jsp">예약 페이지</a></li>
            <li><a href="board-list.jsp">고객센터</a></li>
            <li><a href="guest.jsp">협업</a></li>
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
            <li><a href="mypage.jsp">마이페이지</a></li>
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
                        <li><a href="reserselectschool.jsp" class="item"><div><b>예약 페이지</b></div></a></li>
                        <br>
                        <li><a href="board-list.jsp" class="item"><div><b>고객센터</b></div></a></li>
                        <li><a href="board-list.jsp" class="item"><div class="sub_menu">공지사항</div></a></li>
                        <li><a href="guide.jsp" class="item"><div class="sub_menu">이용안내</div></a></li>
                        <li><a href="Q&A-list.jsp" class="item"><div class="sub_menu">Q&A</div></a></li>
                        <br>
                        <li><a href="guest.jsp" class="item"><div><b>협업</b></div></a></li>
                        <br>
                        <li><a href="SiteMap.jsp" class="item"><div><b>사이트맵</b></div></a></li>
                        <br>
                        <li><a href="mypage.jsp" class="item"><div class="main-menu"><b>마이페이지</b></div></a></li>
                        <li><a href="myinfo.jsp" class="item"><div class="sub_menu">나의 정보 확인</div></a></li>
                        <li><a href="reserpre.jsp" class="item"><div class="sub_menu">이전 예약 정보</div></a></li>
                        <li><a href="resernow.jsp" class="item"><div class="sub_menu">현재 예약 정보</div></a></li>

                    </ul>
                </div>

            </span>
        </div>
    </nav>
<br><br><br><br>
<div style="background-color:white; ">
    <div class="list" style="padding:50px  10px 20px 10px;">
<center>
<font size=5>협업 글 수정</font><br><br>
<hr></center></div></div>
<br><br>
<form action="edit_ok.jsp" method="post"><center>

	<input type="hidden" name="idx" value=<%=idx %>>
	연럭처 : &nbsp;&nbsp;<input type="text" name="name" value=<%=name%>>  &nbsp;&nbsp;
	비밀번호 :&nbsp;&nbsp; <input type="password" name="pwd"><br><br>
	E-mail:&nbsp;&nbsp; <input type="text" name="email" size=54 value=<%=email%>><br><br><br>
	<textarea wrap="hard" rows="10" cols="70" name="content"></textarea><br><br><br>
	<input type="submit" value="수정 ">&nbsp;&nbsp;&nbsp;
	<input type="button" onclick= "history.back()" value="취소 "> </center><br>
	<center>
	<h5> 메인페이지로 <a href="javascript:history.back();">돌아가기</a> </h5>
<h5> 작성된 글목록으로 <a href="guest.jsp">이동하기</a> </h5><br></center>
<%
}

rs.close();
pstmt.close();
conn.close();

%>
</form>

<br><br><br><br><br><br>

<section>
        	<!-- 대충 뭐 요소들이 가득차있음 -->
        </section>
        	<%--위에꺼를 아래롯 쉉 --%>
        <footer>
          <p>
          	  <span class="brand"><b>DCR</b></span><br/><br/><br/>
              <span>대표 : grade type=웹프A+</span><br/>
              <span>dongguk@dgu.ac.kr   &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp| &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   02-2260-3114</span><br/>
              <span>04620 서울특별시 중구 필동로 1길 30 동국대학교</span><br/>
              <span>Copyright 2022. grade type=웹프A+. All Rights Reserved.</span>
          </p>
      </footer>
</body>
</html>