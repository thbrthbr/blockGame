<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>

<style>

#blank
{
	display:none;
}

</style>

</head>
<body>
<input type="text" name="blank" id="blank" value="23">
<%
	
    Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/brick_db", "root", "1234"); 
	String u_id = request.getParameter("rid");
	String u_pw = request.getParameter("rpswd");


	String u_id2 = (String) session.getAttribute("memberId");
	String u_pw2 = (String) session.getAttribute("memberPw");
	
	
	if(u_id.equals(u_id2) && u_pw.equals(u_pw2))
	{
		if(u_id.equals("admin"))
		{
			response.setContentType("text/html; charset=UTF-8");

			out.println("<script>alert('관리자는 탈퇴할 수 없습니다.'); location.href='final-outMember.jsp';</script>");
			 
			out.flush();
		}
		else
		{
			PreparedStatement pstmt = null;
			String sql = "";

			sql = "delete from `brick_db`.`brick_table` where name= '" + u_id2 +"'";
			pstmt = conn.prepareStatement(sql);

			session.invalidate();
			
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		
			out.println("<script>alert('회원 탈퇴 하셨습니다.'); location.href='final-firstscreen.jsp';</script>");	
			
			out.flush();
		}
		
	}
		
	else
	{
		response.setContentType("text/html; charset=UTF-8");

		out.println("<script>alert('아이디나 비밀번호가 잘못되었습니다.'); location.href='final-outMember.jsp';</script>");
		 
		out.flush();
	}

    
    
%>
</body>
</html>