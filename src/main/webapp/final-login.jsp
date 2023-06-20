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

<%-- <jsp:forward page="memberController"></jsp:forward> --%>
<%


	
	String u_id = request.getParameter("uid");
	String u_pw = request.getParameter("upswd");
	if(u_id == "" || u_pw == "")
	{
		session.invalidate();
		
		response.setContentType("text/html; charset=UTF-8");
		 
		out.println("<script>alert('아이디나 비밀번호가 잘못되었습니다.'); location.href='final-firstscreen.jsp';</script>");
		 
		out.flush();	
	}
	else
	{
		if(!u_id.equals("admin") && !u_pw.equals("1346"))
		{
			 	Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/brick_db", "root", "1234"); 
				
				Statement stmt = conn.createStatement();
				Statement stmt2 = conn.createStatement();
			    String sqlStr = "SELECT * FROM brick_table where name='" + u_id+"'";
			    String sqlStr2 = "SELECT * FROM brick_table";
			    ResultSet rset = stmt.executeQuery(sqlStr);
			    ResultSet rset2 = stmt2.executeQuery(sqlStr2);
			    int count = 0;
			    while(rset2.next())
			    {
			    	if(rset2.getString("name").equals(u_id))
			    	{
			    		count++;
			    	}
			    }
			    if(count == 0)
			    {
			    	response.setContentType("text/html; charset=UTF-8");

					out.println("<script>alert('등록되어있지 않은 아이디입니다'); location.href='final-firstscreen.jsp';</script>");
					 
					out.flush();
					
					return;
			    }
			    	
			    
			    while (rset.next()) 
			    {
					if (!rset.getString("password").equals(u_pw))
					{
						response.setContentType("text/html; charset=UTF-8");

						out.println("<script>alert('비밀번호가 맞지않습니다'); location.href='final-firstscreen.jsp';</script>");
						 
						out.flush();
						
						return;
					}
			    }
			
			
			session.setAttribute("memberId", u_id);
			session.setAttribute("memberPw", u_pw);

			response.setContentType("text/html; charset=UTF-8");
				
			out.println("<script>location.href='final-firstscreenLoginSuccess.jsp';</script>");
				
			out.flush();
		}
		else
		{
			if(u_id.equals("admin") && u_pw.equals("1346"))
			{
				session.setAttribute("memberId", u_id);
				session.setAttribute("memberPw", u_pw);
				
				response.setContentType("text/html; charset=UTF-8");
				
				out.println("<script>location.href='final-firstscreenLoginSuccess.jsp';</script>");
				
				out.flush();
				
			}
			else
			{
				response.setContentType("text/html; charset=UTF-8");
				 
				out.println("<script>alert('아이디나 비밀번호가 잘못되었습니다.'); location.href='final-firstscreen.jsp';</script>");
				 
				out.flush();	
			}
		}	
	} 
	
%>
</body>
</html>