<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>단일 세션 정보</title>
</head>
<body>
Home > 단일 세션 정보 확인하기
<hr>
<%
	String u_id = (String) session.getAttribute("memberId");
	String u_pw = (String) session.getAttribute("memberPw");
	
	out.println("1. 아이디 세션 속성값 : " + u_id + "<br>");
	out.println("2. 비밀번호 세션 속성값 : " + u_pw + "<br>"); 
	%>
</body>
</html>