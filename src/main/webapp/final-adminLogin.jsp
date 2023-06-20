<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	
	String u_id = request.getParameter("uid");
	String u_pw = request.getParameter("upswd");
	if(u_id == "" || u_pw == "")
	{
		session.invalidate();
		
		response.setContentType("text/html; charset=UTF-8");
		 
		/* PrintWriter out = response.getWriter(); */
		 
		out.println("<script>alert('아이디나 비밀번호가 잘못되었습니다.'); location.href='final-firstscreen.jsp';</script>");
		 
		out.flush();	
	}
	else
	{
		if(u_id.equals("admin") && u_pw.equals("1346"))
		{
			session.setAttribute("memberId", u_id);
			session.setAttribute("memberPw", u_pw);

			%>
			<script type ="text/javascript">
			location.href='final-firstscreenLoginSuccess.jsp';
			</script>
			<%
		}
		else
		{
			session.invalidate();
			
			response.setContentType("text/html; charset=UTF-8");
			 
			/* PrintWriter out = response.getWriter(); */
			 
			out.println("<script>alert('아이디나 비밀번호가 잘못되었습니다.'); location.href='final-firstscreen.jsp';</script>");
			 
			out.flush();	
		}	
	}
	
%>
</body>
</html>