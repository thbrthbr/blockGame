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
        font-size: 20px;
      }
      #the {
        font-family: "Black Han Sans", sans-serif;
        font-size: 20px;
        width: 800px;
      }

      #containing {
        justify-content: center;
        background-color: white;
        background-color: rgba(255, 255, 255, 0.95);
        overflow: auto;
        overflow-x: hidden;
        width: 800px;
        height: 500px;
        padding-top: 8px;
        margin-bottom: 5px;
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

      #players {
        font-family: "Malgun Gothic";
        font-size: 20px;
        color: black;
        /* text-shadow: 1px 1px 1px #000; */
        text-align: left;
        display: flex;
        flex-direction: row;
        padding-right: 10px;
        padding-top: 3px;
        padding-bottom: 5px;
        padding-left: 10px;
      }

      #gohome {
        font-style: italic;
        font-family: "Black Han Sans", sans-serif;
        color: white;
        position: fixed;
      }
      

      #writer {
        text-align: left;
        margin-right: auto;
      }
      pre {
        padding: 10px;
        font-family: "Malgun Gothic";
      }

      #test {
        /* border: solid;
        border-color: rgba(0, 0, 0, 0.2); */
        font-style: italic;
        color: lightgreen;
        -webkit-text-stroke-width: 0.5px;
        -webkit-text-stroke-color: black;
        margin-left: auto;
      }
      .post {
        margin-bottom: 10px;
        margin-right: 10px;
        font-size: 17px;
        font-family: "Black Han Sans", sans-serif;
      }
      #by {
        color: black;
        font-family: "Black Han Sans", sans-serif;
      }
      #textarea1
      {
     	padding: 10px;
        font-family: "Malgun Gothic";
      	width: 600px;
      	height: 300px;
      	border: 0px;
      	background-color: rgba(255, 255, 255, 0);
      	resize: none;
      }
      a
      {
      color: white;
			  text-decoration-line: none;
		} 
		#dont
		{
		display: none;
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
          <div id="what">&nbsp;</div>
          <div id="the">
            <div id="containing">
              <div id="players">
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
      					%>
      					
      					<div id="writer">
                       <%=rset.getString("title")%>
                      </div>
                      <div id="test">
                  <span id="by">by</span> <br /><%=rset.getString("name")%>&nbsp;
                </div>
              </div>
              <hr /><div align="left">
                <textarea id="textarea1" disabled><%=rset.getString("contents")%></textarea>
                <div align="right">
                  
                  <%
      					
      				if(rset.getString("name").equals(u_id))
                  {
                	  %>
                  
                  
                  <form method="post" action="final-feedbackDeleteTask.jsp">
                  <input type="text" id="dont" name="postnum" value="<%=rset.getInt("idnum")%>">
                  <input class="post" type="submit" value="삭제"/>
                	</form>
                <%
                }
                %>
               
                
                <input class="post" type="button" value="게시판으로 돌아가기" onclick="location.href='final-feedbackBoard.jsp';"/>
                
                </div>
                      <%
      				}
      			}
  %>
              </div>
            </div>
          </div>
        </div>
      </div>

  </body>
</html>
