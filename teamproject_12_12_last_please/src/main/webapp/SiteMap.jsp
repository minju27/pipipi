<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바코드 쓰도록 -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="nav.css" />
<style>

.title{
left: 680px;
top: 120px;
width: 214px;
height: 55px;
position: absolute;
font-style: normal;
font-weight: 400;
font-size: 40px;
line-height: 48px;
color: black;
}

.Rectangle0{
box-sizing: border-box;
left: 690px;
top: 230px;
position: absolute;
width: 195px;
height: 61px;

background: #CF5C3C;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 25px;
line-height: 50px;
text-decoration: none;
color: #FFFFFF;

}

.Rectangle1{
box-sizing: border-box;
left: 185px;
top: 370px;
position: absolute;
width: 195px;
height: 61px;

background: #FDAB3F;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #FFFFFF;
}

.Rectangle2{
box-sizing: border-box;
left: 445px;
top: 370px;
position: absolute;
width: 195px;
height: 61px;

background: #FDAB3F;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #FFFFFF;
}

.Rectangle3{
box-sizing: border-box;
left: 690px;
top: 370px;
position: absolute;
width: 195px;
height: 61px;

background: #FDAB3F;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #FFFFFF;
}

.Rectangle4{
box-sizing: border-box;
left: 935px;
top: 370px;
position: absolute;
width: 195px;
height: 61px;

background: #FDAB3F;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #FFFFFF;
}

.Rectangle5{
box-sizing: border-box;
left: 1185px;
top: 370px;
position: absolute;
width: 195px;
height: 61px;

background: #FDAB3F;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #FFFFFF;
}

.Rectangle1-1{
box-sizing: border-box;
left: 185px;
top: 470px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle1-2{
box-sizing: border-box;
left: 185px;
top: 570px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle1-3{
box-sizing: border-box;
left: 185px;
top: 670px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle2-1{
box-sizing: border-box;
left: 445px;
top: 470px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle2-2{
box-sizing: border-box;
left: 445px;
top: 570px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle2-3{
box-sizing: border-box;
left: 445px;
top: 670px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle3-1{
box-sizing: border-box;
left: 690px;
top: 470px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle3-2{
box-sizing: border-box;
left: 690px;
top: 570px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle3-3{
box-sizing: border-box;
left: 690px;
top: 670px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle4-1{
box-sizing: border-box;
left: 935px;
top: 470px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle4-2{
box-sizing: border-box;
left: 935px;
top: 570px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle4-3{
box-sizing: border-box;
left: 935px;
top: 670px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle5-1{
box-sizing: border-box;
left: 1185px;
top: 470px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle5-2{
box-sizing: border-box;
left: 1185px;
top: 570px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.Rectangle5-3{
box-sizing: border-box;
left: 1185px;
top: 670px;
position: absolute;
width: 195px;
height: 61px;

background: #EFD98A;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

font-weight: 700;
font-size: 20px;
line-height: 55px;
text-decoration: none;
color: #000000;
}

.line1{
	width: 0px;
	height: 280px;
	left: 280px;
	top: 330px;
	background-color: rgb(70, 68, 68);
	position: absolute;
	border: 1px solid rgb(70, 68, 68);
	z-index: -1;
}

.line1-1{
	width: 1000px;
	height: 0px;
	left: 280px;
	top: 330px;
	background-color: rgb(70, 68, 68);
	position: absolute;
	border: 1.3px solid rgb(70, 68, 68);
	z-index: -1;
}

.line2{
	width: 0px;
	height: 380px;
	left: 540px;
	top: 330px;
	background-color: rgb(70, 68, 68);
	position: absolute;
	border: 1px solid rgb(70, 68, 68);
	z-index: -1;
}

.line3{
	width: 0px;
	height: 230px;
	left: 790px;
	top: 250px;
	background-color: rgb(70, 68, 68);
	position: absolute;
	border: 1.4px solid rgb(70, 68, 68);
	z-index: -1;
}

.line4{
	width: 0px;
	height: 380px;
	left: 1030px;
	top: 330px;
	background-color: rgb(70, 68, 68);
	position: absolute;
	border: 1.4px solid rgb(70, 68, 68);
	z-index: -1;
}

.line5{
	width: 0px;
	height: 180px;
	left: 1280px;
	top: 330px;
	background-color: rgb(70, 68, 68);
	position: absolute;
	border: 1.4px solid rgb(70, 68, 68);
	z-index: -1;
}


</style>
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



<center>
    <div class="line1"></div>
    <div class="line1-1"></div>
    <div class="line2"></div>
    <div class="line3"></div>
    <div class="line4"></div>
    <div class="line5"></div>

    <h1 class="title">SITE MAP</h1>
    <a href="main.jsp" class="Rectangle0">메인화면</a>

    <a href="reserselectschool.jsp" class="Rectangle1">예약 페이지</a>
        <a href="seoulmap.jsp" class="Rectangle1-1">서울 캠퍼스 예약</a>
        <a href="Ilsan.jsp" class="Rectangle1-2">BMC 캠퍼스 예약</a>


    <a href="board-list.jsp" class="Rectangle2">고객 센터</a>
        <a href="board-list.jsp" class="Rectangle2-1">공지사항</a>
        <a href="guide.jsp" class="Rectangle2-2">이용안내</a>
        <a href="Q&A-list.jsp" class="Rectangle2-3">Q&A게시판</a>

    <a href="guest.jsp" class="Rectangle3">협업 페이지</a>
        <a href="write.jsp" class="Rectangle3-1">협업 글 작성</a>

<a href="mypage.jsp" class="Rectangle4">마이페이지</a>
        <a href="resernow.jsp" class="Rectangle4-1">현재 예약 내역</a>
        <a href="reserpre.jsp" class="Rectangle4-2">이전 예약 내역</a>
        <a href="myinfo.jsp" class="Rectangle4-3">나의 정보 보기</a>

    <a href="login.jsp" class="Rectangle5">로그인/회원가입</a>
        <a href="findPWview.jsp" class="Rectangle5-1">비밀번호 찾기</a>


</center>

        <section>
            <!-- 대충 뭐 요소들이 가득차있음 -->
        </section>
        <br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br>    
        <br><br><br><br><br><br>
        <footer>
          <p>
          	  <span class="brand"><b>DCR</b></span><br/><br/>
              <span>대표 : grade type=웹프A+</span><br/>
              <span>dongguk@dgu.ac.kr   &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp| &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   02-2260-3114</span><br/>
              <span>04620 서울특별시 중구 필동로 1길 30 동국대학교</span><br/>
              <span>Copyright 2022. grade type=웹프A+. All Rights Reserved.</span>
          </p>
      </footer>
</div>
</body>
</html>