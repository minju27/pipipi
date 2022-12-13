<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바코드 쓰도록 -->
<meta charset="utf-8">
<title>공지사항</title>
<link rel="stylesheet" href="nav.css">
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

    .board-table {
        font-size: 13px;
        width: 100%;
        border-top: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }

    .board-table a {
        color: #333;
        display: inline-block;
        line-height: 1.4;
        word-break: break-all;
        vertical-align: middle;
    }

    .board-table a:hover {
        text-decoration: underline;
    }

    .board-table th {
        text-align: center;
    }

    .board-table .th-num {
        width: 100px;
        text-align: center;
    }

    .board-table .th-date {
        width: 200px;
    }

    .board-table th,
    .board-table td {
        padding: 20px 0;
    }

    .board-table tbody td {
        border-top: 1px solid #e7e7e7;
        text-align: center;
    }

    .board-table tbody th {
        padding-left: 28px;
        padding-right: 14px;
        border-top: 1px solid #e7e7e7;
        text-align: left;
    }

    .board-table tbody th p {
        display: none;
    }

    /* 검색 부분 */
    
    /* 검색 버튼 */
    .btn-dark {
        background: #555;
        color: #fff;
    }

    .btn-dark:hover,
    .btn-dark:focus {
        background: #373737;
        border-color: #373737;
        color: #fff;
    }

    /* 검색창 */
    #board-search .search-wrap {
        position: relative;
        float: right;
        margin: 20 auto;
        width: 80%;
        max-width: 564px;
    }

    #board-search .search-wrap input {
        height: 40px;
        width: 465px;
        font-size: 14px;
        padding: 7px 14px;
        border: 1px solid #ccc;
    }

    #board-search .search-wrap input:focus {
        border-color: #333;
        outline: 0;
        border-width: 1px;
    }

    #board-search .search-wrap .btn {
        position: absolute;
        right: 0;
        top: 0;
        bottom: 0;
        width: 100px;
        padding: 0;
        font-size: 16px;
    }

    .container .page-wrap {
        width:1500px;
    }

    .container .page-wrap .page{
        width: 500px;
        margin: auto;
        margin-right: 21%;
        padding: 50px;
    }

    .container .page .pre{
        padding-right: 10px;
    }


    .container .page a {
        padding-left: 10px;
        margin: auto;
        position: center;
        font-size: 16px;
        color: black;
        text-decoration-line: none;
    }
    
     /* 게시글 쓰기 버튼*/
    .btn-write{
	    background: #555;
	    color: #fff;
	    text-decoration: none;
	    padding: 10px;
	    border-radius: 4px;
	    position: relative;
	    top:30px;
    }
    
    .btn-write:hover,
    .btn-write:focus {
        background: #373737;
        border-color: #373737;
        color: #fff;
    }
</style>


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
            <a href=""><b>공지사항</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="guide.jsp">이용안내</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="Q&A-list.jsp">Q&A 게시판</a>
        </center>
    </div>
    <br>
    <hr>

    <section class="notice">
        <div class="page-title">
            <div class="container">
                <h3>공지사항</h3>
                
            </div>
        </div>

        <!-- board list area -->
        <div id="board-list">
            <div class="container">
                <table class="board-table">
                    <tr>
                        	<td align="center" bgcolor="silver" width="75" class="th-num">번호</td>
                            <td align="center" bgcolor="silver" width="275" class="th-title">제목</td>
                        	<td align="center" bgcolor="silver" width="75" class="th-date">등록일</td>
                    </tr>
<%
		int id;
		int rownum = 0;
		Connection conn = null;
		Statement stmt = null;
		String sql = null;
		ResultSet rs = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "root", "0000");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			sql = "select * from board_table order by id desc";
			rs = stmt.executeQuery(sql);
		}
		catch(Exception e) {
			out.println("DB 연동 오류입니다.: "+e.getMessage());
		}
			rs.last();
			rownum = rs.getRow();
			rs.beforeFirst();
			
			while(rs.next())
			{
				id = Integer.parseInt(rs.getString("id"));
				
				String date = rs.getString("date");
				String sp = "[-]";
				String []date2 = date.split(sp);
				
				String date_out = date2[0] + "-" + date2[1] + "-" + date2[2];
%>
	<tr>
		<td align="center"><%= rownum %></td>
		<td>
		<a href = "board-read.jsp?id=<%= rs.getString("id") %>">
				<%= rs.getString("title") %>
		</a>
		</td>
		<td align="center"><%= date_out%></td>
	</tr>
	
	<%
		rownum--;
			}
	%>
	</table>
	<%
		stmt.close();
		conn.close();
	%>
	
	
	<%
		if(userID != null){
		if(userID.equals("admin")) {                 
	%>
	<a href="board-insert.jsp" class="btn-write">게시글 쓰기</a> 

	<% 
		}} 
	%>

    </section>


        <section>
            <!-- 대충 뭐 요소들이 가득차있음 -->
        </section>
        
<br><br><br><br><br><br><br><br><br><br>

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