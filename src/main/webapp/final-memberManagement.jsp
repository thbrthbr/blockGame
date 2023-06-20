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
        font-family: "Malgun Gothic";
        justify-content: center;
        text-align: left;
        background-color: white;
        background-color: rgba(255, 255, 255, 0.9);
        overflow: auto;
        overflow-x: hidden;
        width: 600px;
        height: 600px;
        padding: 10px;
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

      #gohome {
        font-style: italic;
        font-family: "Black Han Sans", sans-serif;
        color: white;
        position: fixed;
      }
      #kill {
        cursor: pointer;
        border-radius: 100%;
      }
      #kill:hover {
        background-color: pink;
      }
      #kill:active {
        background-color: white;
        color: red;
      }
      a
      {
      color: white;
			  text-decoration-line: none;
		} 
	#opacity0
	{
	display: none;
	}
	form {
	display: inline;
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


        <br />
        <div id="exceptimg">
          <div id="what">회원관리</div>
          <div id="the">
            <br />
            <div id="containing">
              회원목록
              <hr>
              
              <%
              Class.forName("com.mysql.jdbc.Driver");

              Connection conn = DriverManager.getConnection(
                  "jdbc:mysql://localhost:3306/brick_db", "root", "1234"); 
              Statement stmt = conn.createStatement();
         
              String sqlStr = "SELECT * FROM brick_table";
              ResultSet rset = stmt.executeQuery(sqlStr);
              
              while (rset.next()) {

          %>
                  
                   
                   <%= rset.getString("name") %> 
                   <form method="post" action="final-kickout.jsp"> 
                   <input id="opacity0" name="thisguy" type="text" value="<%= rset.getString("name") %>"> 
                   <button type="submit" id="kill">X</button>
                   </form>

              <hr />
                    
          <%
              }
          %>

            </div>
          </div>
        </div>
      </div>

  </body>
</html>
