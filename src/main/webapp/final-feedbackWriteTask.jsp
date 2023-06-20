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
	
	String u_title = request.getParameter("rtitle");
	String u_contents = request.getParameter("rcontents");
	String u_id = (String) session.getAttribute("memberId");
	/* Statement stmt = conn.createStatement(); */
     
   /*  String sqlStr = "SELECT * FROM board_table";
    ResultSet rset = stmt.executeQuery(sqlStr);
      */
  
    if(u_title != "" && u_contents != "")
    {
    	PreparedStatement pstmt = null;
    	String sql = "";
    	sql = "INSERT INTO `brick_db`.`board_table` (title, name, contents) VALUES (?, ?, ?)";
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, u_title);
    	pstmt.setString(2, u_id);
    	pstmt.setString(3, u_contents);

    	pstmt.executeUpdate();
    	pstmt.close();
    	conn.close();
    }
    else
    {
    	response.setContentType("text/html; charset=UTF-8");

		out.println("<script>alert('제목/내용을 입력해주세요'); location.href='final-feedbackWrite.jsp';</script>");
		 
		out.flush();
    }
 
%>

<script type ="text/javascript">
		alert("글을 작성하셨습니다.");
		location.href='final-feedbackBoard.jsp';
		</script>
</body>
</html>