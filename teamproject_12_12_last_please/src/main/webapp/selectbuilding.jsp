<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*" %>
        <%@page import="java.sql.*" %>
      <%@page import="java.io.PrintWriter" %>
    <%request.setCharacterEncoding("utf-8"); %>   
    <link rel="stylesheet" href="css/header.css"/>
    <link rel="stylesheet" href="css/resercheck.css"/>
    <link rel="stylesheet" href="nav.css" />
<!DOCTYPE html>
<html>
<head>
<style>
input[type=submit]{
	margin: 10px;	
	border:0px;
	height:10vw;
	padding:1vw 2vw 1vw 2vw;
	box-shadow: 0px 3px 3px #EEEEEE;
	color:black;
	font-size:5vw;
	border-radius: 1vw;
}
input[type=submit]:hover{
	background-color:#ff8000;
	color:white;
}
input[type=number]{
width:9vw;
height:6vw;
font-size:5vw;
text-align:right;
border:0px;
}
</style>
<meta charset="utf-8">
<%String building=request.getParameter("building");%>
<title><%=building%></title>
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

    <main>
    <div style="margin-top:130px">
    
<script>
	function go(building,floor){
		location.href=building+'.jsp?building='+building+'&floor='+floor;
	}
	function no(){
		if(alert("예약이 불가능한 강의실입니다.")){}
	}
</script>
<form action='<%=building%>.jsp' method="get">
<%
if("신공학관".equals(building)){
%>
<center>
<hr width="70%";>
<h1><%=building%> 몇층을 예약할까요?</h1>
<h3>1~5층 중 선택해주세요.</h3> 
<hr width="70%";>
<br>
<div style="font-size:5vw"><input type="number" value="1" name="floor" min="1" max="5">층<div>
<input type="hidden" name="building" value=<%=building%>>
<input type="submit" value="이동">
</center>
<%} %>
<%if("과학관".equals(building)){%>
<center>
<center>
 <hr width="70%";><h1><%=building%> 몇층을 예약할까요?</h1>
<h3>1~4층 중 선택해주세요.</h3> <hr width="70%";>
<div style="font-size:5vw"><input type="number" value="1" name="floor" min="1" max="4">층<div>
<input type="hidden" name="building" value=<%=building%>>
<input class="button" type="submit" value="이동">
</center>
<%} %> 
<%if("명진관".equals(building)){%>
<center>
 <hr width="70%";><h1><%=building%> 몇층을 예약할까요?</h1>
<h3>1~7층 중 선택해주세요.</h3> <hr width="70%";>
<div style="font-size:5vw"><input type="number" value="1" name="floor" min="1" max="7">층<div>
<input type="hidden" name="building" value=<%=building%>>
<input type="submit" value="이동">
</center>
<%} if("법학_만해관".equals(building)){%>
<center>
 <hr width="70%";><h1><%=building%> 몇층을 예약할까요?</h1>
<h3>1~5층 중 선택해주세요.</h3> <hr width="70%";>
<div style="font-size:5vw"><input type="number" value="1" name="floor" min="1" max="5">층<div>
<input type="hidden" name="building" value=<%=building%>>
<input type="submit" value="이동">
</center>
<%}if("본관".equals(building)){%>
<center>
 <hr width="70%";><h1><%=building%> 몇층을 예약할까요?</h1>
<h3>1~6층 중 선택해주세요.</h3> <hr width="70%";>
<div style="font-size:5vw"><input type="number" value="1" name="floor" min="1" max="6">층<div>
<input type="hidden" name="building" value=<%=building%>>
<input type="submit" value="이동">
</center>
<%}if("사회과학_경영관".equals(building)){%>
<center>
 <hr width="70%";><h1><%=building%> 몇층을 예약할까요?</h1>
<h3>1~4층 중 선택해주세요.</h3> <hr width="70%";>
<div style="font-size:5vw"><input type="number" value="1" name="floor" min="1" max="4">층<div>
<input type="hidden" name="building" value=<%=building%>>
<input type="submit" value="이동">
</center>
<%}if("원흥관".equals(building)){%>
<center>
 <hr width="70%";><h1><%=building%> 몇층을 예약할까요?</h1>
<h3>1~7층 중 선택해주세요.</h3> <hr width="70%";>
<div style="font-size:5vw"><input type="number" value="1" name="floor" min="1" max="7">층<div>
<input type="hidden" name="building" value=<%=building%>>
<input type="submit" value="이동">
</center>
<%}if("정보문화관 P".equals(building)){%>
<center>
 <hr width="70%";><h1><%=building%> 몇층을 예약할까요?</h1>
<h3>1~6층 중 선택해주세요.</h3> <hr width="70%";>
<div style="font-size:5vw"><input type="number" value="1" name="floor" min="1" max="6">층<div>
<input type="hidden" name="building" value=<%=building%>>
<input type="submit" value="이동">
</center>
<%}if("정보문화관 Q".equals(building)){%>
<center>
<hr width="70%";><h1><%=building%> 몇층을 예약할까요?</h1>
<h3>1~7층 중 선택해주세요.</h3> <hr width="70%";>
<div style="font-size:5vw"><input type="number" value="1" name="floor" min="1" max="7">층<div>
<input type="hidden" name="building" value=<%=building%>>
<input type="submit" value="이동">
</center>
<%}if("학림관".equals(building)){%>
<center>
<hr width="70%";><h1><%=building%> 몇층을 예약할까요?</h1>
<h3>1~8층 중 선택해주세요.</h3> <hr width="70%";>
<div style="font-size:5vw"><input type="number" value="1" name="floor" min="1" max="8">층<div>
<input type="hidden" name="building" value=<%=building%>>
<input type="submit" value="이동">
</center>
<%}if("학술_문화관".equals(building)){%>
<center>
<hr width="70%";><h1><%=building%> 몇층을 예약할까요?</h1>
<h3>1~4층 중 선택해주세요.</h3> <hr width="70%";>
<div style="font-size:5vw"><input type="number" value="1" name="floor" min="1" max="4">층<div>
<input type="hidden" name="building" value=<%=building%>>
<input type="submit" value="이동">
</center>
<%}if("혜화관".equals(building)){%>
<center>
<hr width="70%";><h1><%=building%> 몇층을 예약할까요?</h1>
<h3>1~7층 중 선택해주세요.</h3> <hr width="70%";>
<div style="font-size:5vw"><input type="number" value="1" name="floor" min="1" max="7">층<div>
<input type="hidden" name="building" value=<%=building%>>
<input type="submit" value="이동">
</center>
<%}%>
</form>

</div>
</main> 
      
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