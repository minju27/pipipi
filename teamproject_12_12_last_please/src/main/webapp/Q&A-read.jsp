<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바코드 쓰도록 -->
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
	<link rel="stylesheet" href="nav.css" />
	<title> 게시판</title>
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
    
    .outer{
	    width:1000px;
	    height:1000px;
	    background:none;
	    
    }
    
    .noticeInfo{
    	width:700px;
	    height:700px;
	    margin:0 auto;
    	background-color: none;
    }
    
    .title{
    	font-size: 28px;
    	font-weight: bolder;
    	position: absolute;
    }
    
    .name{
	    font-size: 18px;
	    position: relative;
	    top: 50px;
	    color: gray;
	    text-align: left;
	    z-index:10;
    }
    
    .date{
    	font-size: 18px;
	    position: relative;
	    top: 30px;
	    color: gray;
	    text-align: right;
    }
    
    .content{
    	text-align: left;
    }
    
    /*게시글 수정 버튼*/
    .button-modify{
    	background: #555;
	    color: #fff;
	    text-decoration: none;
	    padding: 10px;
	    border-radius: 4px;
	    position: relative;
	    top:30px;
    }

    .button-modify:hover,
    .button-modify:focus {
        background: #373737;
        border-color: #373737;
        color: #fff;
    }
    
    /*게시글 삭제 버튼*/
    .button-delete {
    	background: #555;
	    color: #fff;
	    text-decoration: none;
	    padding: 10px;
	    border-radius: 4px;
	    position: relative;
	    top:30px;
    }
    
    .button-delete:hover,
    .button-delete:focus {
        background: #373737;
        border-color: #373737;
        color: #fff;
    }
    
    /*게시글 목록 보기*/
    .button-list {
    	background: #a9a9a9;
	    color: #fff;
	    text-decoration: none;
	    padding: 10px;
	    padding-right: 93px;
	    padding-left: 93px;
	    border-radius: 4px;
	    position: relative;
	    top:40px;
    }
    
    .button-list:hover,
    .button-list:focus {
        background: #373737;
        border-color: #373737;
        color: #fff;
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
        
<center>
	<%
		int id, ref=0;
		String name="", date="", title="", content="", date_out="";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		id = Integer.parseInt(request.getParameter("id"));
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sql = "select * from q_a_table";
		rs = stmt.executeQuery(sql);
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.:"+e.getMessage());
	}
	
	while(rs.next()){
		if(id == rs.getInt("id"))
		{
			name = rs.getString("name");
			date = rs.getString("date");
			title = rs.getString("title");
			content = rs.getString("content");
			ref = Integer.parseInt(rs.getString("ref"));
			
			String sp = "[-]";
			String []date2 = date.split(sp);
			
			date_out = date2[0] + "-" + date2[1] + "-" + date2[2];
		}
	}
%>

<div class="outer">
<div class = "noticeInfo">
	<div class="title"><%= title %></div><br>
		<div class="name"><%= name %></div>
		<div class="date"><%= date_out %></div>
	<br>
	<br>
	<hr align="center" style="border: solid 0.5px #d3d3d3; width:100%;">
		<br><br><br>
		<div class="content"><%= content %></div>
		<br><br><br>
	<hr align="center" style="border: solid 0.5px #d3d3d3; width:100%;">
<br><br>


	<%
		if(userID != null){
		if(userID.equals("admin")) {                 
	%>
	<a href="Q&A-insert.jsp?ref=<%= ref %>&flag=r" class="button-delete"> 답글 쓰기</a>

	<% 
		}}
	%>
	
	<%
		if(userID != null) {                 
	%> <!--로그인 되어있는 사람들이 보는 화면 -->
	

	<a href="Q&A-modify-pwd.jsp?id=<%= id %>" class="button-modify">게시글 수정</a>
	
	<a href="Q&A-delete-pwd.jsp?id=<%= id%>" class="button-delete">게시글 삭제</a>
	<br><br>
	<% 
		} 
	%>  

	<a href="Q&A-list.jsp" class="button-list"> 게시글 목록 보기</a>
</center>
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