<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바코드 쓰도록 -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="nav.css" />
<style>
img{
    display:block;
    margin:auto;
    width: 660px;
}
</style>
<meta charset="utf-8">
<title>준비중입니다</title>
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
    
	<br><br><br><br><br><br><br><br><br><br>
<img src="service.PNG" alt=""/>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <footer>
          <p>
          	  <span class="brand"><b>DCR</b></span><br/><br/><br/>
              <span>대표 : grade type=웹프A+</span><br/>
              <span>dongguk@dgu.ac.kr   &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp| &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   02-2260-3114</span><br/>
              <span>04620 서울특별시 중구 필동로 1길 30 동국대학교</span><br/>
              <span>Copyright 2022. grade type=웹프A+. All Rights Reserved.</span>
          </p>
      </footer>
</div>
</body>
</html>