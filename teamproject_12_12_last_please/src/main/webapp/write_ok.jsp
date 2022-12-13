
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%> 
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String pwd=request.getParameter("pwd");
	String content=request.getParameter("content");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/USERINFO","root","0000");
	String sql="insert into guest(name,pwd,email,content,writeday) values(?,?,?,?,now())";
	PreparedStatement pstm=conn.prepareStatement(sql);  
	//pstm.setString(1,name);
	//pstm.setString(2,pwd);
	//pstm.setString(3,email);
	//pstm.setString(4,content);
	//pstm.executeUpdate();
	//pstm.close();
	//conn.close();
	//response.sendRedirect("guest.jsp");  


	if ( name == "" || email == ""|| pwd == ""|| content == "") {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.');");
			script.println("history.back()");
			script.println("</script>");
	}
	else {
		pstm.setString(1,name);
		pstm.setString(2,pwd);
		pstm.setString(3,email);
		pstm.setString(4,content);
		pstm.executeUpdate();
		response.sendRedirect("guest.jsp");  
		pstm.close();
		conn.close();
%>		
		
	location.href = 'main.jsp';
<% 
	}
%>
