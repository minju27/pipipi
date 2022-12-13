<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바코드 쓰도록 -->    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>게시글 삭제</title>
	<link rel="stylesheet" href="nav.css" />
	<style>
	/* <<공지사항 이용안내 Q&A 게시판>> 목록 부분  */
    .list a {
        font-size: 20px;
        text-decoration: none;
        color: black;
    }
    
    /* 컨테이너(테이블 부분) 크기 설정 */
    .container {
        width: 1500px;
        margin: 0 auto;
    }
    
    /* 공지사항 테이블 부분 */
    table {
        border-collapse: collapse;
        border-spacing: 0;
    }

    section.notice {
        padding: 80px 0;
    }

    /* title 제목 */
    .page-title {
        margin-bottom: 70px;
    }

    .page-title h3 {
        font-size: 28px;
        color: #333333;
        font-weight: 550;
        text-align: center;
    }
    
     /*게시글 수정/다시 버튼*/
    .button{
    	background: #555;
	    color: #fff;
	    text-decoration: none;
	    padding: 10px;
	    border-radius: 4px;
	    position: relative;
	    top:30px;
    }

    .button:hover,
    .button:focus {
        background: #373737;
        border-color: #373737;
        color: #fff;
    }
    
    /*게시글 수정 취소 버튼*/
    .modify-cancel{
   		background: #a9a9a9;
	    color: #fff;
	    text-decoration: none;
	    padding: 10px;
	    padding-right: 45px;
	    padding-left: 45px;
	    border-radius: 4px;
	    position: relative;
	    top:30px;
    }
    
    .modify-cancel:hover,
    .modify-cancel:focus {
        background: #373737;
        border-color: #373737;
        color: #fff;
    }
    
    .password{
     	 background-color: #fff;
		 border: solid 1px black;
		 padding: 0.9rem 0.9rem;
		 margin: 0.5rem 0;
		 width: 300px;
		 border-radius: 4px;
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

    <br><br><br><br><br><br>
    <div class="list">
        <center>
            <a href="board-list.jsp">공지사항</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="guide.jsp">이용안내</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="Q&A-list.jsp"><b>Q&A 게시판</b></a>
        </center>
    </div>
    <br>
    <hr>

    <section class="notice">
        <div class="page-title">
            <div class="container">
                <h3>Q&A 게시판</h3>
				<hr align="center" style="border: solid 1px; width:50%;">
            </div>
        </div>

<center><h2>패스워드를 입력하시오</h2></center>
<center><br><br>
	<form action = "Q&A-delete-db.jsp" method="post">
		<input type="password" name="passwd" size="30" class="password" placeholder="Password">
		<input type="hidden" name="id" value = "<%= request.getParameter("id") %>">
		
		<br><br><br>
		
		<input type="submit" value="삭제하기" class="button">
		<input type="reset" value="다시쓰기" class="button">
	</form>
	
	<br>
	
	<a href = "Q&A-read.jsp?id=<%= request.getParameter("id")%>" class="modify-cancel"> 삭제 취소 </a>
	
</center>
</section>

        <section>
            <!-- 대충 뭐 요소들이 가득차있음 -->
        </section>

<br><br><br><br><br><br><br><br><br><br><br><br>

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