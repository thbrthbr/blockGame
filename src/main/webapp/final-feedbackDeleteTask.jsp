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
	            String postnum = request.getParameter("postnum");
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/brick_db", "root", "1234"); 
                Statement stmt = conn.createStatement();
           
                String sqlStr = "SELECT * FROM board_table";
                ResultSet rset = stmt.executeQuery(sqlStr);
                /* int count = 0; */
                int finalnum = Integer.parseInt(postnum);
      			while (rset.next()) {
      				if(rset.getInt("idnum") == finalnum)
      				{
      					PreparedStatement pstmt = null;
      					String sql = "";

      					sql = "delete from `brick_db`.`board_table` where idnum= '" + finalnum +"'";
      					pstmt = conn.prepareStatement(sql);

      					
      					pstmt.executeUpdate();
      					pstmt.close();
      					conn.close();
      				
      					out.println("<script>alert('글을 삭제하셨습니다.'); location.href='final-feedbackBoard.jsp';</script>");	
      					
      					out.flush();
      				}
      			}
      				%>
</body>
</html>