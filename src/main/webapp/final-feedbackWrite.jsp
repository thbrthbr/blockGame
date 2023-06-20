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
        background-color: white;
        background-color: rgba(255, 255, 255, 0);
        width: 900px;
        height: 600px;
        padding-top: 20px;
      }

      #gohome {
        font-style: italic;
        font-family: "Black Han Sans", sans-serif;
        color: white;
        position: fixed;
      }

      #writer {
        text-align: left;
      }

      #test {
        margin-left: auto;
      }

      #area {
        font-family: "Malgun Gothic";
        background-color: rgba(255, 255, 255, 0.9);
        font-size: 20px;
        margin-top: 10px;
        margin-bottom: 10px;
        width: 492px;
        height: 500px;
        resize: none;
      }
      #area::-webkit-scrollbar {
        width: 10px;
        display: block;
      }
      #area::-webkit-scrollbar-thumb {
        background-color: #2f3542;
        border-radius: 10px;
      }
      #area::-webkit-scrollbar-track {
        background-color: grey;
        border-radius: 10px;
        box-shadow: inset 0px 0px 5px white;
        
      }
      #title {
        background-color: rgba(255, 255, 255, 0.9);
        width: 492px;
      }
      /* #sb {
        padding-right: -20px;
      } */
      #centerarea {
        width: 500px;
      }
      #submit {
        font-family: "Black Han Sans", sans-serif;
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
	response.setContentType("text/html; charset=UTF-8");

	out.println("<script>alert('로그인을 하셔야 작성가능합니다.'); location.href='final-feedbackBoard.jsp';</script>");
		 
	out.flush();
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
          <div id="what">피드백 게시판</div>
          <div id="the">
            <br />
            <div id="containing">
              <div id="centerarea">
              <form method="post" action="final-feedbackWriteTask.jsp">
              <div><input id="title" type="text" name="rtitle" spellcheck="false" /></div>
                
                <div>
                  <textarea id="area" name="rcontents" spellcheck="false"></textarea>
                </div>
                <div id="sb" align="right">
                  <input id="submit" type="submit" value="작성" />
                </div>
              </form>
                
              </div>
            </div>
          </div>
        </div>
      </div>

 
  </body>
</html>
