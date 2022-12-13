<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE html>
<html>
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
%>
<head>
<meta charset="UTF-8">


<title>신공학관 <%=floor%>층</title>
</head>
<body>
<header>
<table border="0" width="100%">
<tr>
<td><a href="./menu.html" class="menu">menu</a></td>
<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
<td><h1>Reservation</h1></td>
</tr>
</table>
<hr>
</header>
<form action="신공학관.jsp?building=<%=building %>" method="post">
<input type="date" name="date" value=<%=dates %>>
<input type="time" name="time" value=<%=times %> min="09:00" max="21:00">
<input type="hidden" name="floor" value=<%=floor %>>
<input type="submit" value="검색"> 
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
<%
RequestDispatcher rd = request.getRequestDispatcher("Ilsan.jsp");
rd.forward(request, response);
 %>


</body>
</html>