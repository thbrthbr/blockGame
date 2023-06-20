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
        font-size: 25px;
        background-color: white;
        background-color: rgba(255, 255, 255, 0.9);
        overflow: auto;
        overflow-x: hidden;
        width: 600px;
        height: 160px;
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
        font-size: 50px;
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
        <!-- <img id="backimg" src="20220512_170318.png"> -->

        <br />
        <div id="exceptimg">
          <div id="what">
            회원정보
          </div>
          <div id="the">
            <br />
            <div id="containing">
            <br>
              아이디: <%out.println(u_id);%>
              <br>
              <% Class.forName("com.mysql.jdbc.Driver");
              
          			Connection conn = DriverManager.getConnection(
          			"jdbc:mysql://localhost:3306/brick_db", "root", "1234"); 
          			
          			Statement stmt = conn.createStatement();
          		     
          		    String sqlStr = "SELECT * FROM brick_table where name='"+u_id+"'";
          		    ResultSet rset = stmt.executeQuery(sqlStr);
          		  
          		    while (rset.next()) 
          	    	{
          		    	if(rset.getString("record").equals("99:59:99"))
          		    	{
          		    		if(rset.getString("try").equals("0"))
          		    		{
          		    			out.println("이메일: " + rset.getString("email"));
          		    			out.println("<br>기록없음");
          		    				
          		    		}
          		    		else
          		    		{
          		    			out.println("이메일: " + rset.getString("email"));
          		    			out.println("<br>기록: "+rset.getString("record"));	
          		    		}
          		    		
          		    	}
          		    	else
          		    	{
          		    		out.println("이메일: " + rset.getString("email"));
          		    		out.println("<br>기록: "+rset.getString("record"));	
          		    	}
          	    	}
          		    
              %>
            </div>
          </div>
        </div>
      </div>

  </body>
</html>
