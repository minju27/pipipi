<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<%
String idx = request.getParameter("idx");
String pwd = request.getParameter("pwd");
String content = request.getParameter("content");

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/USERINFO","root","0000");
String strSQL = "select pwd from guest where id = ?";
PreparedStatement pstmt = conn.prepareStatement(strSQL);
pstmt.setString(1,idx);
ResultSet rs = pstmt.executeQuery();
rs.next();
String goodpass = rs.getString("pwd").trim();
	if(pwd.equals(goodpass)){
		String SQL = "update guest set content = ? where id = ?";
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, content);
		pstmt.setString(2, idx);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		response.sendRedirect("guest.jsp");
	}
	else
	{
		%>
		<script language="javascript">
			alert("비밀번호가 일치하지 않습니다.");
			history.back();
		</script>
	<% 
	}
		
%>