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
    /* <<공지사항 이용안내 Q&A 게시판>> 목록 부분  */
    .list a {
        font-size: 20px;
        text-decoration: none;
        color: black;
    }
input[type=submit], input[type=reset]{	
	background-color:silver;
	height:3vw;
	padding:0px 1vw;
	box-shadow: 1px 3px 3px #EEEEEE;
	
	color:black;
	font-size:2vw;
	border-radius: 1vw;
	border:1px;
}
input[type=submit]:hover,input[type=reset]:hover {
	background-color:#ff8000;
	color:white;
}
input[type=number]{
width:50px;
height:vw;
font-size:25px;
text-align:right;
box-shadow: 1px 3px 3px 3px #EEEEEE;
border:0px;
}
input[type=number]:hover{
	background-color:lightgray;
	color:black;
}
</style>
<meta charset="utf-8">
<title>예약하고자하는 시간을 정해주세요.</title>
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
<center><div style="background-color:white;">
<div class="list" style="padding:100px 10px 10px 10px;">
<center>
<%String room=request.getParameter("room"); 
String building=request.getParameter("building"); 
String date=request.getParameter("date"); 
String[] date_s = date.split("");
String month=""+date_s[4]+date_s[5];
String day=""+date_s[6]+date_s[7];
out.print("<h2>"+month+"월 "+day+"일 "+building+"의 <"+room+"> 강의실을 예약하는 페이지 입니다.</h2>");
out.print("<b>예약되지 않은 시간을 선택해주세요!</b><br>");
out.print("<br><div>시간 예약은 한시간 단위로 가능해요!!</div>");
//여기에 데이터베이스에 room과 시간 출력 
%>
<hr></center>



<% 
int stime[],ltime[],i=0,full[];
stime=new int[12];
ltime=new int[12];
full=new int[12];
Connection conn=null;
Statement stmt=null;
String sql=null,fullst="";
ResultSet rs=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/team?serverTimezone=UTC";
	conn=DriverManager.getConnection(url,"root","0000");
	stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	sql="select *from reser_table where building='"+building+"' AND room='"+room+"' order by date asc, startime asc;";
	rs=stmt.executeQuery(sql);
}
catch(Exception e){
	out.println("DB 연동 오류입니다.:"+e.getMessage());}
rs.last();
rs.beforeFirst();
while(rs.next()){
	int reserdate=Integer.parseInt(rs.getString("date"));
		if(reserdate==Integer.parseInt(date)){
			stime[i]=Integer.parseInt(rs.getString("startime"));
			ltime[i]=Integer.parseInt(rs.getString("lastime"));
			i++;	
	}
}int u=0;
for(int j=0;j<i;j++){
	for(int k=stime[j];k<ltime[j];k++){
		full[u]=k-8;
		fullst+=k+",";
		u++;
	}
}
%>
</center>
<center>
<div class="divide">
   <div class="harf">
<table border="1px" width="100%">
<tr>
<th>time</th>
<th>시간</th>
<th>예약여부</th>
</tr>
<%u=0;
for(int num=1;num<13;num++){ %>
<tr>
<td>time. <%=num %></td>
<td><%=num+8 %>~<%=num+9 %>시</td>
<%if(full[u]==num){ u++;%>
<td>예약 중...</td></tr>
<%}else{ %>
<td>예약 가능</td></tr>
<%}} %>
<script>
//표로 시간별 예약여부 파악
//예약이 이미되있을 경우 쪽기 보낼 수 있게 연결
</script>
</tr>
</table>
<%
stmt.close();
conn.close();
%>
</div><div class="harf">
<form action="reservationput.jsp" method="post">
<table width="100%" border="0">
<tr><td colspan="2" style="background-color:silver;">시작시간과 종료시간을 입력하고 <b>예약 버튼</b>을 눌러주세요.</td></tr>

<tr><td>시작 시간(24h): </td><td><input type="number" value="9" name="startime" min="9" max="20">시</td></tr>
<tr><td>종료 시간(24h): </td><td><input type="number" value="10"name="lastime" min="10" max="21">시</td></tr>
</table>

<input type="hidden" name="building" value=<%=building%>>
<input type="hidden" name="date" value=<%=date%>>
<input type="hidden" name="room" value=<%=room%>>
<input type="hidden" name="timest" value=<%=fullst%>><br>
<input style="margin:0" type="submit" value="예약">&emsp;&emsp;<input type="reset" value="초기화">
</form></div> 

</center>
</main>
<sention></sention>
<br><br><br><br><br><br><br><br><br><br><br><br>
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