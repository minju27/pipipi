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
<style>
    /* <<공지사항 이용안내 Q&A 게시판>> 목록 부분  */
    .list a {
        font-size: 20px;
        text-decoration: none;
        color: black;
    }
    </style>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>내 예약 보기</title>
</head>
<body>
<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}else{
%>
	<script>
	alert("로그인이 필요한 서비스 입니다.");		
	history.back();
	</script>	
<%
		}
%> 
	
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
<% 
SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
String dates=ft.format(new Date());
String[] date_s = dates.split("-");
String date=""+date_s[0]+date_s[1]+date_s[2];
int datenum=Integer.parseInt(date);
if(session.getAttribute("userID")!=null){
	userID=(String) session.getAttribute("userID");
} %>
<div style="background-color:white; ">
    <div class="list" style="padding:125px  10px 20px 10px;">
    <center>
            <a href="resercheck.jsp">모아 보기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="resernow.jsp">현재 예약 내역</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="reserpre.jsp"><b>이전 예약 내역</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <a href="myinfo.jsp">나의 정보 보기</a>
        </center>
    </div>    
</div><hr>
<br><div class="intro" style="margin-top:4vw;">
<div class="box" >
<h2>이전 예약 현황</h2>
<hr width="96%"><br>

<table border="3" width="95%" class="table">
<tr>
<th align="center" bgcolor="lightgray" width="5%"> no </th>
<th align="center" bgcolor="lightgray" width="25%"> 예약된 장소 </th>
<th align="center" bgcolor="lightgray" width="25%"> 예약된 강의실 </th>
<th align="center" bgcolor="lightgray" width="25%"> 날짜 </th>
<th align="center" bgcolor="lightgray" width="25%"> 시간 </th>
</tr>
<% 
int rownum=1,room,stime,ltime;
int time[];
Connection conn=null;
Statement stmt=null;
String sql=null;
ResultSet rs=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/team?serverTimezone=UTC";
	conn=DriverManager.getConnection(url,"root","0000");
	stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	sql="select *from reser_table where userID='"+userID+"' order by date desc, startime desc;";
	rs=stmt.executeQuery(sql);
}
catch(Exception e){
	out.println("DB 연동 오류입니다.:"+e.getMessage());}
rs.last();
//rownum=rs.getRow();
rs.beforeFirst();
while(rs.next()){
	int reserdate=Integer.parseInt(rs.getString("date"));
	room=Integer.parseInt(rs.getString("room"));
	stime=Integer.parseInt(rs.getString("startime"));
	ltime=Integer.parseInt(rs.getString("lastime"));
	if(reserdate<datenum){
%>
<script>
//로그인 들어오면 아이디 일치할 때 출력되게 수정 지금은 확인을 위해 다 보이게 설정
</script>
<tr>
<td> <%=rownum %> </td>
<td> <%=rs.getString("building") %> </td>
<td> <%=room %> </td>
<td> <%=rs.getString("date") %> </td>
<td> 
<%=stime %>~<%=ltime %> </td>
</tr>
<%rownum++;}} 
stmt.close();
conn.close();
%>
</table>
<div style="text-align:right;margin: 1.5vw 2vw;">
<button onclick="location.href='seoulmap.jsp'">예약하러 가기</button>
</div>
</div></div>      </main> 
      
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









