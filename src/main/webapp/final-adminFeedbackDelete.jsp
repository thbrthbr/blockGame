<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>

<style>


</style>

</head>
<body>

<%
	
    Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/brick_db", "root", "1234"); 
	
	String idnum = request.getParameter("thisguy");
	
	
	PreparedStatement pstmt = null;
	String sql = "";
	
	int finalnum = Integer.parseInt(idnum);
	
	sql = "delete from `brick_db`.`board_table` where idnum= " + finalnum;
	pstmt = conn.prepareStatement(sql);


	
	pstmt.executeUpdate();
	pstmt.close();
	conn.close();

	response.setContentType("text/html; charset=UTF-8");
	
	out.println("<script>location.href='final-feedbackManagement.jsp';</script>");	
	
	out.flush();
	

    
    
%>
</body>
</html>