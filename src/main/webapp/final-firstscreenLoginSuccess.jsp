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
            #txt
            {
                align-self: center;
                width: 300px;
                height: 27px;
                font-size: 20px;
                border-style: solid;
                border-color:black;
                border-width: 5px;
            }
            .container
            {
                font-family: "Black Han Sans", sans-serif;
                justify-content: center;
                /* align-item: center; */
                display: flex;
                flex-direction: row;
            }
            #idpsswd
            {
                color: white;
                text-shadow:1px 1px 1px #000;
                font-size: 30px;
            }
            .elem
            {
                height: 27px;
            }
            #containing
            {
                justify-content: center;
                display: flex;
                flex-direction: row;
            }
            #column
            {
                /* justify-content: space-between; */
                flex-direction: column;
                
            }

            #txtArea
            {
                flex-direction: column;
                margin-left: 40px;
            }
            #rank
            {
            	cursor:pointer;
                background-color: #EFEFEF; 
                display: inline-block;
                border-style: solid;
                border-width: 5px;
                border-color: black;
                display : flex;
  				justify-content : center;
  				font-size: 20px;
  				font-family: "Black Han Sans", sans-serif;
  				align-items : center;
                width: 100px;
                height: 100px;
                margin-right: 10px;
            }
            #register
            {
	            cursor:pointer;
                background-color: #EFEFEF; 
                display: inline-block;
                border-style: solid;
                border-width: 5px;
                border-color: black;
                display : flex;
  				justify-content : center;
  				align-items : center;
  				font-size: 20px;
  				font-family: "Black Han Sans", sans-serif;
                width: 100px;
                height: 100px;
                margin-left: 10px;
            }
            #start
            {
                display: block;
                
                /* vertical-align: top; */
                border-style: solid;
                border-width: 5px;
                border-color: black;
                /* flex-basis: auto; */
                width: 200px;
                height: 40px;
                /* height: 33px; */
                
            }
            
            
           
            
            
            
            
            #logout
            {
                display: block;
                
                border-style: solid;
                border-width: 5px;
                border-color: black;
                width: 200px;
                height: 40px;
                margin-top: 7px;
                /* height: 33px; */
                /* flex-basis: auto; */
            }
            #forpswd
            {
                margin-top: 1px;
            }
            
            #feedback
            {
            	cursor:pointer;
                background-color: #EFEFEF; 
                display: inline-block;
                border-style: solid;
                border-width: 5px;
                border-color: black;
                display : flex;
  				justify-content : center;
  				align-items : center;
  				font-size: 20px;
  				font-family: "Black Han Sans", sans-serif;
  				padding-top: 2px;
  				padding-bottom: 2px;
                width: 440px;
            }
            #admin
            {
            	cursor:pointer;
                background-color: #EFEFEF; 
                display: inline-block;
                border-style: solid;
                border-width: 5px;
                border-color: black;
                display : flex;
  				justify-content : center;
  				align-items : center;
  				font-size: 20px;
  				font-family: "Black Han Sans", sans-serif;
  				padding-top: 2px;
  				padding-bottom: 2px;
                width: 440px;
            }
            #rankButton
            {
                cursor:pointer;
                font-size: 20px;
                font-family: "Black Han Sans", sans-serif;   
                width: 100px;
                height: 100px;
            }
            #logoutButton
            {
                
                cursor:pointer;
                font-size: 30px;
                
                
                font-family: "Black Han Sans", sans-serif;
                width: 200px;
                
            }
            
            #startButton
            {
                
                cursor:pointer;
                font-size: 30px;
                text-shadow:1px 1px 1px #000;
                color: white;
                background-color: orange;
                font-family: "Black Han Sans", sans-serif;
                width: 200px;
                
                
            }
            
            #startButton:hover
            {
                background-color: #eb8621;
            }
            #startButton:active
            {
                font-style: italic;
                background-color: orange;
            }
            
            
            
            /* #loginButton:hover
            {
                background-color: #eb8621;
            }
            #loginButton:active
            {
                font-style: italic;
                background-color: orange;
            } */
            #adminLogin
            {
                cursor:pointer;
                font-size: 20px;
                font-family: "Black Han Sans", sans-serif;
                width: 200px;

            }
            /* #registerButton
            {
                cursor:pointer;
                font-size: 20px;
                font-family: "Black Han Sans", sans-serif;
                width: 100px;
                height: 100px;
                

            } */
            /* #feedbackButton
            {
                cursor:pointer;
                font-family: "Black Han Sans", sans-serif;
                font-size: 20px;
                width: 440px;
            } */
            #welcome
            {
                font-style: italic;
                color: white;
                font-size: 50px;
            }
        </style>

    </head>
    <body>
    

            <div align="center" id="all">
                <!-- <img id="backimg" src="20220512_170318.png"> -->
                <br>
                <br>
                <br>
                <br>
                <br>
                <div id="exceptimg">
                    <div id="what">벽돌깨기 게임</div>
                    <div id="the">
                      
                        <br>
                        <div id="containing">
                            <div id="welcome">
                             <%
	String u_id = (String) session.getAttribute("memberId");

	
	out.println(u_id);

	%>   님 환영합니다
                            </div>
                        </div>
                        
                        
                    <br>
                    <br>
                    <div class="container">
                        <div id="rank" onclick="location.href='final-rank.jsp';"> 랭킹보기 </div>
                        <div id="column">
	                        <span id="start"> <input type="button" id="startButton" class="button" value="게임시작" onclick="location.href='final-game.jsp';"> </span>
                            <span id="logout"> <input type="button" id="logoutButton" class="button" value="로그아웃" onclick="location.href='final-logout.jsp';"> </span> <br>
                        </div>
                        <div id="register" onclick="location.href='final-outMember.jsp';"> 회원<br>탈퇴</div>
                    </div>
                    <br>
                    <div id="feedback" onclick="location.href='final-feedbackBoard.jsp';"> 피드백 게시판</div>
                    
                    <%
                    if(u_id != null)
					{
						%>
						<div id="admin" onclick="location.href='final-memberInfo.jsp';"> 회원정보</div>
						<%
					}
					%>
                    
                    <%
                    if(u_id.equals("admin"))
					{
						%>
							<div id="admin" onclick="location.href='final-admin.jsp';"> 관리자 페이지</div>
						<%
					}
					%>
                    
                    
            </div>
                </div>
                    

    </body>
</html>