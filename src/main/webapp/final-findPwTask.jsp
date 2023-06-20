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
	String u_id = request.getParameter("rid");
	String u_mail = request.getParameter("rmail");

	if(u_mail=="" || u_id=="")
	{
		
		response.setContentType("text/html; charset=UTF-8");
		 
		/* PrintWriter out = response.getWriter(); */
		 
		out.println("<script>alert('아이디와 이메일을 입력해주세요.'); location.href='final-findPw.jsp';</script>");
		 
		out.flush();	
	}
	else
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/brick_db", "root", "1234"); 
		
		
		Statement stmt2 = conn.createStatement();
	    
	    String sqlStr2 = "SELECT * FROM brick_table";
	    
	    ResultSet rset2 = stmt2.executeQuery(sqlStr2);
	    

	    int count = 0;
	    while(rset2.next())
	    {
	    	if(rset2.getString("email").equals(u_mail) && rset2.getString("name").equals(u_id))
	    	{
	    		count++;
	    	}
	    }
	    if(count == 0)
	    {
	    	response.setContentType("text/html; charset=UTF-8");

			out.println("<script>alert('아이디와 이메일이 맞지 않습니다'); location.href='final-findPw.jsp';</script>");
			 
			out.flush();
			
			return;
	    }
	    else
	    {
	    	Statement stmt = conn.createStatement();
			
		    String sqlStr = "SELECT * FROM brick_table where email='" + u_mail+"'";
		   
		    ResultSet rset = stmt.executeQuery(sqlStr);
		    
	    	String pwshow = "";
	    	
	    	while(rset.next())
		    {
	    		if(rset.getString("email").equals(u_mail))
		    	{
	    			pwshow = rset.getString("password");
	    			
		    	}
		    }
	    	response.setContentType("text/html; charset=UTF-8");

			out.println("<script>alert('비밀번호: "+pwshow+"'); location.href='final-findPw.jsp';</script>");
			 
			out.flush();

	    }
	}
	
%>
</body>
</html>