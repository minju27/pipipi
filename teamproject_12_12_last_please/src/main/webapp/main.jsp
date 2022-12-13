<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바코드 쓰도록 -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="nav.css" />
<style>
img:hover{
		mix-blend-mode: normal;
		opacity: 0.5;
}
input[id="menuicon"] {
	display:none;
}

.area_desc {
	position:absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 20px;
}

.area_desc a{
	padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 20px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

/*메뉴버튼*/
.menubtn {
	display: block;
	width: 50px;
	height: 50px;
	position: absolute;
	top: 50%;
	right: 10px;
	transform: translateY(-50%);
	cursor:pointer;
}

.menubtn span {
	display: block;
	position: absolute;
	width: 80%;
	height: 5px;
	border-radius: 30px;
	background: white;
	transition: all .35s;
}

.menubtn span:nth-child(1){
	top: 20%;
	left: 50%;
	transform: translateX(-50%);
}

.menubtn span:nth-child(2){
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.menubtn span:nth-child(3){
	bottom: 20%;
	left: 50%;
	transform: translateX(-50%);
}


.sidebar {
	width: 300px;
	height: 100%;
	background: #222;
	position: fixed;
	top: 0;
	right: -300px;
	z-index: 1;
	transition: .35s;
}

/* 체크 변환값 */
input[id="menuicon"]:checked ~ .menubtn {z-index:2;}



input[id="menuicon"]:checked ~ .menubtn span:nth-child(1){
	top:50%;
	left:50%;
	transform:translate(-50%, -50%) rotate(135deg);
	
}

input[id="menuicon"]:checked ~ .menubtn span:nth-child(2){
	left:50%;
	transform:translate(-50%, -50%) scale(2);
	opacity:0;
}

input[id="menuicon"]:checked ~ .menubtn span:nth-child(3){
	bottom:50%;
	left:50%;
	transform:translate(-50%, 50%) rotate(-135deg);
}

input[id="menuicon"]:checked ~ .sidebar{
	right:0;
}


.intro{
    display:flex;
    justify-content: center;
    align-items: center;
    max-width: 1200px;
    margin: auto;
}

.intro .card{
    flex:1;
    text-align: center;
    margin: 200px 40px;
}

.intro .card i{
    font-size:70px;
    color: #444;
    margin-bottom:30px;
}

.intro .card img
{
    width:550px;
    margin-top: 30px;
    border-radius: 20px;
}




#expand-menu { /* 체크박스 폼 요소 감춤 */
    display: none;
}
#expand-menu:checked ~ ul { /* 체크박스 체크되었으면 메뉴 목록 표시 - 반응형 표시용 */
    display: block;
    height: auto;
}

.menu {
/*     display: block;
    width: 200px;
    background-color: white;
    color: #fff;
    border-radius: 20px;
    padding: 10px;
    box-sizing: border-box; */
    overflow: hidden; /* 반응형 애니메이션용 */
    transition: all 0.5s ease; /* 반응형 애니메이션 */
}
.menu ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
.menu a, .menu > label {
    display: block;
    height: 35px;
    width:200px;
    padding: 8px;
    cursor: pointer;
    color: #fff;
    text-decoration: none;
    text-align: center;
}

.sub_menu{
	padding-top:5px;
 	font-size: 15px;
 	color: #C0C0C0;
}

.sub_menu:hover{
	
 	color: #000;
}

.menu a:hover {
    color: #000;
}
.menu ul li:hover, .menu > label:hover {
    background-color: #fff;
    color: #000;
    border-radius: 10px;
}
.menu .main-menu {
    line-height: 1.5;
    font-size: 1em;
    font-family: 'Noto Sans KR';
   /* padding: 0 0 0 50px; 아이콘과 텍스트 사이 여백 */
}


/* 푸터 */
html, body {
  margin: 0;
  padding: 0;
}

#wrap {
    min-height: 100%;
    position: relative;
    
}

section {
  padding-bottom: 105px;
}

footer {
  background-color: #444;
  width: 100%;
  height: 150px;
  bottom: 0px;
  position: absolute;
  border-top: 1px solid #c4c4c4;
  padding-top: 15px;
  color: white;
  font-size: 11px;
}

footer a {
  display: inline-block;
  margin: 0 20px 10px 20px;
  color: #808080; font-size: 11px;
}

footer a:visited {
  color: #808080;
}

footer p {
  margin-top: 5px; 
  margin-bottom: 0px;
  margin-left: 50px;   
}

footer p span {
  display: inline-block;
  margin-left: 20px;
  margin-top: 3px; 
  margin-bottom: 3px;  
}

.brand{
	font-size: 15px;
}


</style>
<title>메인페이지</title>
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
        <section class="intro">
            <div class="card">
  
                <h1>서울 캠퍼스</h1>
                <a href="seoulmap.jsp">
                    <img src="seoul.jpg" alt=""/>
                </a>
            </div>
            <div class="card">
 
                <h1>일산 캠퍼스</h1>
                <a href="Ilsan.jsp">
                    <img src="Ilsan.jpg" alt=""/>
                </a>
            </div>
        </section>
      </main> 
              <br>  <br>  <br> 
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