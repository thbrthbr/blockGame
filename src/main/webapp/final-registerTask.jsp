<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	
    Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/brick_db", "root", "1234"); 
	
	String u_id = request.getParameter("rid");
	String u_pw = request.getParameter("rpswd");
	String u_mail = request.getParameter("rmail");

	Statement stmt = conn.createStatement();
     
    String sqlStr = "SELECT * FROM brick_table";
    ResultSet rset = stmt.executeQuery(sqlStr);
     
    while (rset.next()) 
    {
		if (rset.getString("name").equals(u_id))
		{
			response.setContentType("text/html; charset=UTF-8");

			out.println("<script>alert('이미 존재하는 아이디입니다.'); location.href='final-register.jsp';</script>");
			 
			out.flush();
			
			return;
		}
    }
	PreparedStatement pstmt = null;
	String sql = "";
	sql = "INSERT INTO `brick_db`.`brick_table` (name, password, email, record, try) VALUES (?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, u_id);
	pstmt.setString(2, u_pw);
	pstmt.setString(3, u_mail);
	pstmt.setString(4, "99:59:99");
	pstmt.setInt(5, 0);
	pstmt.executeUpdate();
	pstmt.close();
	conn.close();
	
	session.setAttribute("memberId", u_id);
	session.setAttribute("memberPw", u_pw);
 
%>

<script type ="text/javascript">
		alert("회원가입에 성공하셨습니다.");
		location.href='final-firstscreenLoginSuccess.jsp';
		</script>
</body>
</html>