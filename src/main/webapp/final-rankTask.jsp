<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<style>
      @import url("https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Jua&family=Nanum+Gothic&family=Noto+Sans+KR&family=Stylish&family=Sunflower:wght@300&display=swap");
      @import url("http://fonts.cdnfonts.com/css/char-bb");
      body {
        background-color: black;
      }

      #all {
        background-color: white;
        background: url("ezgif-1-0572411451.gif") no-repeat;
        background-size: cover;
        background-position: center;
        align-self: center;

        height: 700px;
        border-style: solid;
        border-width: 10px;
        border-color: black;
      }

      #what {
        color: white;
        text-shadow: 1px 1px 1px #000;
        font-family: "Black Han Sans", sans-serif;
        font-size: 100px;
      }
      #the {
        font-family: "Black Han Sans", sans-serif;
        font-size: 20px;
      }

      #containing {
        justify-content: center;
        font-size: 40px;
        background-color: white;
        background-color: rgba(255, 255, 255, 0.9);
        overflow: auto;
        overflow-x: hidden;
        width: 600px;
        height: 200px;
      }
      #containing::-webkit-scrollbar {
        width: 10px;
        display: none;
      }
      #containing::-webkit-scrollbar-thumb {
        background-color: #2f3542;
        border-radius: 10px;
      }
      #containing::-webkit-scrollbar-track {
        background-color: grey;
        border-radius: 10px;
        box-shadow: inset 0px 0px 5px white;
      }
      #co1 {
        font-style: italic;
        color: #ffeb3b;
      }
      #co2 {
        font-style: italic;
        color: #3f51b5;
      }
      #co3 {
        font-style: italic;
        color: #40ff1d;
      }
      #co4 {
        font-style: italic;
        color: #dc0eff;
      }
      #co5 {
        font-style: italic;
        color: #ff3e7f;
      }
      #co6 {
        font-style: italic;
        color: #ff9800;
      }

      #players {
        font-size: 30px;
        color: white;
        text-shadow: 1px 1px 1px #000;
      }
      #playerCo {
        font-family: "Char BB", sans-serif;
        font-size: 140px;
        color: red;
        text-shadow: 1px 1px 1px #000;
        /* -webkit-text-stroke: 4px black; */
      }
      #first {
        color: gold;
        text-shadow: 4px 4px 4px #000;
      }
      #second {
        color: silver;
      }
      #third {
        color: #800000;
      }
      #gohome {
        font-style: italic;
        font-family: "Black Han Sans", sans-serif;
        color: white;
        position: fixed;
      }
      a
      {
      color: white;
			  text-decoration-line: none;
		} 
    </style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String u_id = (String) session.getAttribute("memberId");
if(u_id == null)
{
	%>
	<div id="gohome"><a href="final-firstscreen.jsp">메인화면으로</a></div>
	<% 
}

else
{
	if(u_id.equals("admin"))
	{
		%>
		<div id="gohome"><a href="final-firstscreenLoginSuccess.jsp">메인화면으로</a> <a href="final-admin.jsp"> | 관리자페이지로</a></div>
		<%
	}
	else
	{
		%>
		<div id="gohome"><a href="final-firstscreenLoginSuccess.jsp">메인화면으로 </a></div>
		<%
	}
}
%>
      <div align="center" id="all">


        <br />
        <div id="exceptimg">
          <div id="what">
            <div id="playerCo">RECORD</div>
          </div>
          <div id="the">
            <br />
            <div id="containing">
            <%
	
	

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/brick_db", "root", "1234"); 
	String record = request.getParameter("thisguy");
	/* String u_id = (String) session.getAttribute("memberId"); */
	Statement stmt = conn.createStatement();
	String recordArr = "";

	for(int i = 0; i < record.length()-1; i++)
	{
		if(!record.substring(i, i+1).equals(":"))
		{
			recordArr += record.substring(i, i+1);
		}
	}
	
	record.charAt(record.length() - 1);
	recordArr += record.charAt(record.length() - 1);
			
	String prev = "";
	prev = "SELECT record FROM `brick_db`.`brick_table` WHERE (`name` = '"+ u_id + "')";
	
	ResultSet rset = stmt.executeQuery(prev);
	String pre ="";
	while(rset.next())
	{
		pre = rset.getString("record");
	}
	
	
	String recordArr2 = "";
	for(int i = 0; i < pre.length()-1; i++)
	{
		if(!pre.substring(i, i+1).equals(":"))
		{
			recordArr2 += pre.substring(i, i+1);
		}
	}
	pre.charAt(pre.length() - 1);
	recordArr2 += pre.charAt(pre.length() - 1);
	
	String perfect1 = "";
	
	for(int i = 0; i < recordArr.length(); i++)
	{
		if(!recordArr.substring(i, i+1).equals("0"))
		{
			perfect1 = recordArr.substring(i);
			break;
		}
	}
	String perfect2 = "";
	
	for(int i = 0; i < recordArr2.length(); i++)
	{
		if(!recordArr2.substring(i, i+1).equals("0"))
		{
			perfect2 = recordArr2.substring(i);
			break;
		}
	}
	
	int sample1 = Integer.parseInt(perfect1);
	int sample2 = Integer.parseInt(perfect2);
	
	String sqlStr = "SELECT * FROM brick_table where name='"+u_id+"'";
    ResultSet rs = stmt.executeQuery(sqlStr);
  	int trial = 0;
    while (rs.next()) 
	{
    	trial = rs.getInt("try");
	}

int sum = trial + 1;

PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
String sql = "";
String sql2 = "";
	
	
	
	if(sample1 < sample2)
	{
		
		
		sql = "UPDATE `brick_db`.`brick_table` SET `record` = '" + record + "' WHERE (`name` = '"+ u_id + "')";
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		    			
		    			
		sql2 = "UPDATE `brick_db`.`brick_table` SET `try` ='" + sum + "' WHERE (`name` = '"+ u_id + "')";
		pstmt2 = conn.prepareStatement(sql2);
		pstmt2.executeUpdate();
		pstmt.close();
		pstmt2.close();
		conn.close();
		
		%>
		<br>신기록! -> <%=record %>
		<%
	}
	else
	{
		sql2 = "UPDATE `brick_db`.`brick_table` SET `try` ='" + sum + "' WHERE (`name` = '"+ u_id + "')";
		pstmt2 = conn.prepareStatement(sql2);
		pstmt2.executeUpdate();
		pstmt.close();
		pstmt2.close();
		conn.close();
				
		%>
		<br>기존기록을 넘지 못했습니다... <br>기존기록 -> <%=pre %>
		<%
	}
%>
             
            </div>
          </div>
        </div>
      </div>

</body>
</html>