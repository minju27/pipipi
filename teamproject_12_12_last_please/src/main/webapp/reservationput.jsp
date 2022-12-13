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
    .list a {
        font-size: 20px;
        text-decoration: none;
        color: black;
    }
    #wrap{
    min-height:90vh;
    </style>
<meta charset="utf-8">
<title>예약 결과</title>
</head>
<body>
<div id="wrap">
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

<center> <div style="padding-top:15vw;">
<% 

String timest=request.getParameter("timest");
String building=request.getParameter("building");
String[] time = timest.split(",");
int temp=0,cnt,no=0;
int new_k=0,ref=0;
String room, date;
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
String sql_update;
try{
	//입력
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/team?serverTimezone=UTC";
	conn=DriverManager.getConnection(url,"root","0000");
	stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	sql_update="select count(*) as cnt, max(k) as max from reser_table;";
	rs=stmt.executeQuery(sql_update);
}
catch(Exception e){
	out.println("DB 연동 오류임니다.:"+e.getMessage());
}
while(rs.next()){
	cnt=Integer.parseInt(rs.getString("cnt"));
	if(cnt!=0)
	new_k=Integer.parseInt(rs.getString("max"));
}
new_k++;
room=request.getParameter("room");
date=request.getParameter("date");
String startime=request.getParameter("startime");
String lastime=request.getParameter("lastime");
for(String st:time){
	if(startime.equals(st)){
		no=1;
		%>
		<script>
		alert("예약되지않은 시간을 입력하세요!");
		history.back();
		</script>
		<%
	}
}
if(Integer.parseInt(startime)>=Integer.parseInt(lastime)){%>
<script>
alert("시작시간이 종료시간보다 빨라야해요. 다시 입력해주세요!");
history.back();
</script>
<div style="background-color:white; ">
    <div class="list" style="padding:200px  10px 20px 10px;">
    <center>
<%
}else if(no==0){
	sql_update = "insert into reser_table values(" + new_k+ ",'"+userID+"','" + room + "', '" + date + "', " + startime + ","+lastime+",'"+building+"')";
	try{
	stmt.executeUpdate(sql_update);
	}catch(Exception e){
	out.println("DB 연동 오류임니다.:"+e.getMessage());
	}
	out.print("<hr><h1>"+building+"의 강의실 "+request.getParameter("room")+"에 대하여 "+date+"의 "+startime+"~"+lastime);
	out.print("시간을 예약했습니다.</h1>");
%>
<hr><br>
<a href="seoulmap.jsp"><button>다른 강의실 예약하기</button></a>
<a href="mypage.jsp"><button>내 예약 보러가기</button></a>  </center> </div>  
<%} %>  <BR><BR><BR>
</center>
       </main>
      </div>
 </div>   
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