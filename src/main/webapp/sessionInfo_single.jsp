<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ����</title>
</head>
<body>
Home > ���� ���� ���� Ȯ���ϱ�
<hr>
<%
	String u_id = (String) session.getAttribute("memberId");
	String u_pw = (String) session.getAttribute("memberPw");
	
	out.println("1. ���̵� ���� �Ӽ��� : " + u_id + "<br>");
	out.println("2. ��й�ȣ ���� �Ӽ��� : " + u_pw + "<br>"); 
	%>
</body>
</html>