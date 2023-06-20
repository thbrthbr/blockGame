<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Jua&family=Nanum+Gothic&family=Noto+Sans+KR&family=Stylish&family=Sunflower:wght@300&display=swap");
            body
            {
                background-color: black;
            }
            
            #all
            {
                background-color: white;
                background: url('ezgif-1-0572411451.gif') no-repeat; 
                background-size : cover;
                background-position: center;
                align-self: center;

                height: 700px;
                border-style: solid;
                border-width: 10px;
                border-color: black;
                
            }
            
            #what
            {
                color: white;
                text-shadow:1px 1px 1px #000;
                font-family: "Black Han Sans", sans-serif;
                font-size: 100px;

            }
            #the
            {
                font-family: "Black Han Sans", sans-serif;
                font-size: 20px;
            }
            
            #containing
            {
                justify-content: center;
                align-items : center;
                display: flex;
                flex-direction: row;
                border-style: solid;
                border-width: 5px;
                border-color: black;
                width: 100px;
                height: 100px;
                margin-left: 10px;
                
            }
            
            
            #register
            {
                
            }
            .button
            {
                cursor:pointer;
                font-size: 20px;
                font-family: "Black Han Sans", sans-serif;
                width: 100px;
                height: 100px;

            }
            #gohome
            {
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
		#findid
		{
			margin-right: 10px;
		}
		#findpw
		{
			margin-left: 10px;
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
                
                
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <div id="exceptimg">
                    <div id="what">아이디/비밀번호 찾기</div>
                    <div id="the">
                      
                        <br>
                        <div id="containing">
                            <span>
                                <input type="button" id="findid" class="button" value="아이디 찾기" onclick="location.href='final-findId.jsp';">
                            </span>
                            <span>
                            <button type="submit" id="findpw" onclick="location.href='final-findPw.jsp';" class="button">비밀번호 찾기</button>
                            </span>
                        </div>         
            </div>
                </div>
		

                    
    </body>
</html>