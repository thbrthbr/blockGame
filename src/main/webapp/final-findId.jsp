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
            .txt
            {
                align-self: center;
                width: 300px;
                height: 27px;
                font-size: 20px;
                border-style: solid;
                border-color:black;
                border-width: 5px;
                margin-top: 33px;
            }
            
            #idpsswd
            {
                color: white;
                text-shadow:1px 1px 1px #000;
                font-size: 30px;
            }
            .elem
            {
                margin-top: 5px;
                height: 27px;
            }
            #containing
            {
                justify-content: center;
                display: flex;
                flex-direction: row;
            }
            
            #txtArea
            {
                flex-direction: column;
                margin-left: 40px;
            }
            
            #foremail
            {
                margin-top: 34px;
            }
            #register
            {
                border-style: solid;
                border-width: 5px;
                border-color: black;
                width: 100px;
                height: 100px;
                margin-left: 10px;
            }
            #registerButton
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
                    <div id="what">아이디 찾기</div></div>
                    <div id="the">
                      
                        <br>
                        <form name="loginForm" action="final-findIdTask.jsp" method="post">
                        <div id="containing">
                            <div id="idpsswd">
                                
                                <div class="elem" id="foremail">E-MAIL</div>
                            </div>
                            <div id="txtArea">
                                
                        <input type="text" name="rmail" class="txt">
                            </div>
                            <div id="register">
                                <input type="submit" id="registerButton" value="아이디 찾기">
                            </div>
                        </div>
                        </form>
                     
                    
                        
                   
                    
                    
            </div>
                </div>
                    
        
    </body>
</html>