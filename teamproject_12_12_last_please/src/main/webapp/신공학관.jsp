<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*" %>
        <%@page import="java.sql.*" %>
      <%@page import="java.io.PrintWriter" %>
    <%request.setCharacterEncoding("utf-8"); %>   
    <link rel="stylesheet" href="css/header.css"/>
    <link rel="stylesheet" href="css/resercheck.css"/>
	<link rel="stylesheet" href="css/NEH.css">
	<link rel="stylesheet" href="nav.css" />
<!DOCTYPE html>

<html>
<style>
    /* <<공지사항 이용안내 Q&A 게시판>> 목록 부분  */
    .list a {
        font-size: 20px;
        text-decoration: none;
        color: black;
    }
input[type=submit]{
	margin: 10px;	
	height:50px;
	padding:0px 10px;
	box-shadow: 1px 3px 3px #EEEEEE;
	backgrond:silver;
	color:black;
	font-size:25px;
	border-radius: 1vw;
	border:1px;
}
input[type=submit]:hover{
	background-color:#ff8000;
	color:white;
}
input[type=date]{
width:200px;
height:vw;
font-size:25px;
text-align:right;
box-shadow: 1px 3px 3px 3px #EEEEEE;
border:0px;
}
input[type=time]{
width:200px;
height:vw;
font-size:25px;
text-align:right;
box-shadow: 1px 3px 3px 3px #EEEEEE;
border:0px;
}
</style>
<% 
SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
String dates=ft.format(new Date());
if(request.getParameter("date")!=null){
	dates=request.getParameter("date");
}
String[] date_s = dates.split("-");
String date=""+date_s[0]+date_s[1]+date_s[2];
SimpleDateFormat fd = new SimpleDateFormat("HH");
String times="09:00";
if(request.getParameter("time")!=null){
	times=request.getParameter("time");
}
String[] time = times.split(":");
int floor=Integer.parseInt(request.getParameter("floor"));
String building=request.getParameter("building");
int room=0;
int stime,ltime;
Connection conn=null;
Statement stmt=null;
String sql=null;
ResultSet rs=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/team?serverTimezone=UTC";
	conn=DriverManager.getConnection(url,"root","0000");
	stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	sql="select *from reser_table where building='"+building+"' AND date='"+date+"' order by date asc, startime asc;";
	rs=stmt.executeQuery(sql);
}
catch(Exception e){
	out.println("DB 연동 오류입니다.:"+e.getMessage());}
rs.last();
rs.beforeFirst();
while(rs.next()){
	stime=Integer.parseInt(rs.getString("startime"));
	ltime=Integer.parseInt(rs.getString("lastime"));
	int temptime=Integer.parseInt(time[0]);
	if(temptime>=stime && temptime<ltime){
		room=Integer.parseInt(rs.getString("room"));
		%>
<style>

.r<%=room%>{
	background:lightgray;
}
.r<%=room%>:hover{
	background:darkgray;
}
.r<%=room%>:hover+.pop{
	background:darkgray;
}
</style>
<%	
}
}
%>

<head>
<meta charset="UTF-8">


<title>신공학관 <%=floor%>층</title>
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
<div style="background-color:white;">
    <div class="list" style="padding:50px 10px 10px 10px;">
    <center>
            <h2>예약하고자 하는 강의실을 선택하세요.</h2>
            날짜와 시간을 이용하여 검색하면 예약되어 있는 강의실을 확인할 수 있어요.
        </center>
    </div>    
</div><hr>



<form action="신공학관.jsp?building=<%=building %>" method="post" style="margin-left:5%">
<input type="date" name="date" value=<%=dates %> min=<%=ft.format(new Date())%>>
<input type="time" name="time" value=<%=times %> min="09:00" max="20:59">
<input type="hidden" name="floor" value=<%=floor %>>
<input type="submit" value=" 검색 "> 
</form>
<script>
	function go(num,date,time,building){
		if(confirm(num+" 강의실을 정말 예약하시겠어요?")){
			location.href='reservation.jsp?building='+building+'&room='+num+"&date="+date+"&time="+time;
		}
	}
	function no(){
		alert("예약이 불가능합니다.");
	}
	window.onload=function(){
		const sames=document.querySelectorAll('#same');
		for(same of sames){
			same.innerHTML+='<p style="text-align:left;">&emsp;&emsp;<b>수용인원</b>: 50</p>';
			same.innerHTML+='<p style="text-align:center;"><b>강의실 보유기자재</b>';
			same.innerHTML+='<ul><li>빔프로젝터</li>	<li>음향장비</li><li>전자교탁</li><li>컴퓨터</li><li>전동스크린</li><li>화이트보드</li></ul></p>';

		}
	}
</script>

<% if(floor==1){%>
<move>
<a href="#" class="r1108" onclick="go(1108,<%=date %>,<%=time[0]%>,'<%=building %>')">1108</a>
<div id="same" class="pop"><h2 style="text-align:center;">1108</h2></div>
<a href="#" class="r1101" onclick="go(1101,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1101 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1101</h2></div>
<a href="#" class="r1116" onclick="go(1116,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1116 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1116</h2></div>
<a href="#" class="r1117" onclick="go(1117,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1117 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1117</h2></div>
<a href="#" class="r1120" onclick="go(1120,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1120 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1120</h2></div>
<a href="#" class="r1174" onclick="go(1174,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1174 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1174</h2></div>
<a href="#" class="r1172" onclick="go(1172,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1172 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1172</h2></div>
<a href="#" class="r1170" onclick="go(1170,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1170 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1170</h2></div>
<a href="#" class="r1167" onclick="go(1167,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1167 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1167</h2></div>
<a href="#" class="r1128" onclick="go(1128,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1128 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1128</h2></div>
<a href="#" class="r1135" onclick="go(1135,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1135 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1135</h2></div>
<a href="#" class="r1137" onclick="go(1137,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1137 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1137</h2></div>
<a href="#" class="r1140" onclick="go(1140,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1140 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1140</h2></div>
<a href="#" class="r1145" onclick="go(1145,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1145 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1145</h2></div>

<a href="#" class="r1121" onclick="go(1121,<%=date %>,<%=time[0]%>,'<%=building %>')"> 1121 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1121</h2></div>
<a href="#" class="r1131" onclick="go(1131,<%=date %>,<%=time[0]%>,'<%=building %>')">1131 </a>
<div id="same" class="pop"><h2 style="text-align:center;">1131</h2></div>
<div class="tempg" onclick="no()"> 기숙사 </div>
<div class="tempr" onclick="no()"> 식당&카페 </div>
<line1_1></line1_1><line1_2></line1_2>
</move>

<%}else if(floor==3){ %>
<move>
<a href="#"  class="r3128" onclick="go(3128,<%=date %>,<%=time[0]%>,'<%=building %>','<%=building %>')"> 3128 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3128</h2></div>
<a href="#"  class="r3127"onclick="go(3127,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3127 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3127</h2></div>
<a href="#"  class="r3133"onclick="go(3133,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3133 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3133</h2></div>
<a href="#"  class="r3115"onclick="go(3115,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3115 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3115</h2></div>
<a href="#"  class="r3114"onclick="go(3114,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3114 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3114</h2></div>
<a href="#"  class="r3178"onclick="go(3178,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3178 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3178</h2></div>
<a href="#"  class="r3173"onclick="go(3173,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3173 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3173</h2></div>
<a href="#"  class="r3169"onclick="go(3169,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3169 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3169</h2></div>
<a href="#"  class="r3165"onclick="go(3165,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3165 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3165</h2></div>
<a href="#"  class="r3182" onclick="go(3182,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3182 </a>
<div class="pop">
<h2 style="text-align:center;">3182(실습실)</h2>
<p style="text-align:center;"><b>강의실 보유기자재</b>
<ul>
<li>빔프로젝터</li>
<li>음향장비</li>
<li>전자교탁</li>
<li>컴퓨터</li>
<li>전동스크린</li>
<li>화이트보드</li>
</ul></p></div>
<a href="#"  class="r3163" onclick="go(3163,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3163 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3163</h2></div>
<a href="#"  class="r3183" onclick="go(3183,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3183 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3183</h2></div>
<a href="#" class="r3189" onclick="go(3189,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3189 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3189</h2></div>
<a href="#"  class="r3193" onclick="go(3193,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3193 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3193</h2></div>
<a href="#"  class="r3166" onclick="go(3166,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3166 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3166</h2></div>
<a href="#"  class="r3194" onclick="go(3194,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3194 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3194</h2></div>
<a href="#" class="r3107" onclick="go(3107,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3107 </a>
<div class="pop">
<h2 style="text-align:center;">3107</h2>
<p style="text-align:left;">&emsp;&emsp;<b>수용인원</b>: 70</p>
<p style="text-align:center;"><b>강의실 보유기자재</b>
<ul>
<li>빔프로젝터</li>
<li>음향장비</li>
<li>전자교탁</li>
<li>컴퓨터</li>
<li>전동스크린</li>
<li>화이트보드</li>
</ul></p></div>
<a href="#"  class="r3106"onclick="go(3106,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3106 </a>
<div class="pop">
<h2 style="text-align:center;">3106</h2>
<p style="text-align:left;">&emsp;&emsp;<b>수용인원</b>: 86</p>
<p style="text-align:center;"><b>강의실 보유기자재</b>
<ul>
<li>빔프로젝터</li>
<li>음향장비</li>
<li>전자교탁</li>
<li>컴퓨터</li>
<li>전동스크린</li>
<li>화이트보드</li>
</ul></p></div>
<div  class="r3101" onclick="no()"> 3101 </div>
<div class="pop" style="background-color:lightgray;">
<h2 style="text-align:center;">3101</h2>
<p style="text-align:center;">대관불가</p>
</div>
<a href="#"  class="r3152" onclick="go(3152,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3152 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3152</h2></div>
<a href="#"  class="r3159" onclick="go(3159,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3159 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3159</h2></div>
<a href="#"  class="r3153" onclick="go(3153,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3153 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3153</h2></div>
<a href="#"  class="r3157" onclick="go(3157,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3157 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3157</h2></div>
<a href="#"  class="r3155" onclick="go(3155,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3155 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3155</h2></div>
<a href="#"  class="r3136" onclick="go(3136,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3136 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3136</h2></div>
<a href="#" class="r3138" onclick="go(3138,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3138 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3138</h2></div>
<a href="#"  class="r3140" onclick="go(3140,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3140 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3140</h2></div>
<a href="#"  class="r3139" onclick="go(3139,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3139 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3139</h2></div>
<a href="#"  class="r3141" onclick="go(3141,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3141 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3141</h2></div>
<a href="#"  class="r3147" onclick="go(3147,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3147 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3147</h2></div>
<a href="#"  class="r3142" onclick="go(3142,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3142 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3142</h2></div>
<a href="#"  class="r32281" onclick="go(32281,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3228-1 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3228-1</h2></div>
<a href="#"  class="r3228" onclick="go(3228,<%=date %>,<%=time[0]%>,'<%=building %>')"> 3228 </a>
<div id="same" class="pop"><h2 style="text-align:center;">3228</h2></div>
<line></line><line_t></line_t>
</move>
<%}else{ 
RequestDispatcher rd = request.getRequestDispatcher("Ilsan.jsp");
rd.forward(request, response);
} %>
<div style="padding:50vh"></div>
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