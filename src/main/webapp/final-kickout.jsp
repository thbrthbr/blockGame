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
	String u_id = request.getParameter("thisguy");
	
	if(u_id.equals("admin"))
	{
		response.setContentType("text/html; charset=UTF-8");

		out.println("<script>alert('관리자는 탈퇴시킬 수 없습니다.'); location.href='final-memberManagement.jsp';</script>");
		 
		out.flush();
	
	}
	else
	{
		response.setContentType("text/html; charset=UTF-8");
		PreparedStatement pstmt = null;
		String sql = "";

		sql = "delete from `brick_db`.`brick_table` where name= '" + u_id +"'";
		pstmt = conn.prepareStatement(sql);


		
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();

		out.println("<script>location.href='final-memberManagement.jsp';</script>");	
		
		out.flush();
	}
	

    
    
%>
</body>
</html>