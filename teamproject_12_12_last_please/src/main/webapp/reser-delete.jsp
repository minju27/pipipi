<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<body>
<%int k=Integer.parseInt(request.getParameter("k")); %>
<script>
if(confirm("예약을 정말 취소하시겠어요?")){

	location.replace("reser-delete-db.jsp?k=<%=k%>");
}else{
	history.back();
}
</script>
</body>
</html>