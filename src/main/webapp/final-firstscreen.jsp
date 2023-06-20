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
                /* width: 1200px; */
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
                display: inline-block;
                /* vertical-align: top; */
                border-style: solid;
                border-width: 5px;
                border-color: black;
                /* flex-basis: auto; */
                width: 200px;
                /* height: 33px; */
                
            }
            #forpswd
            {
                margin-top: 1px;
            }
            #admin
            {
                display: inline-block;
                
                border-style: solid;
                border-width: 5px;
                border-color: black;
                width: 200px;
                margin-top: 15px;
                /* height: 33px; */
                /* flex-basis: auto; */
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
  				width: 440px;
  				padding-top: 2px;
  				padding-bottom: 2px;
            }
            #findme
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
  				width: 440px;
  				padding-top: 2px;
  				padding-bottom: 2px;
            }
            
            #loginButton
            {
                text-shadow:1px 1px 1px #000;
                cursor:pointer;
                font-size: 30px;
                color: white;
                background-color: orange;
                font-family: "Black Han Sans", sans-serif;
                width: 200px;

            }
            #loginButton:hover
            {
                background-color: #eb8621;
            }
            #loginButton:active
            {
                font-style: italic;
                background-color: orange;
            }
            #adminLogin
            {
                cursor:pointer;
                font-size: 20px;
                font-family: "Black Han Sans", sans-serif;
                width: 200px;

            }
            
        </style>

    </head>
    <body>
       <!--  <center> -->
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
                        <form name="loginForm" method="post" action="final-login.jsp">
                        <div id="containing">
                            <div id="idpsswd">
                                <div class="elem" id="forid">ID</div>
                                <br>
                   
                                <div class="elem" id="forpswd">PASSWORD</div>
                            </div>
                            <div id="txtArea">
                                <input type="text" name="uid" class="txt" spellcheck="false">
                       <br>
                       <br>
                        <input type="password" name="upswd" class="txt">
                            </div>
                        </div>
                        
                        
                    <br>
                    <br>
                    <div class="container">
                        <div id="rank" onclick="location.href='final-rank.jsp';"> 랭킹보기 </div>
                        
                       
                        <div id="column">
                            <span id="start"> <input type="submit" id="loginButton" formaction="final-login.jsp" value="로그인"> </span> <br> <span id="admin"><input type="submit" id="adminLogin" formaction="final-adminLogin.jsp" value="관리자 로그인"></span>
                        </div>
                        
                        
                        <div id="register" onclick="location.href='final-register.jsp';"> 회원<br>가입</div>
                    </div>
                    <br>
                    <div id="feedback" onclick="location.href='final-feedbackBoard.jsp';"> 피드백 게시판</div>
                    <div id="findme" onclick="location.href='final-findMe.jsp';"> 아이디/비밀번호 찾기</div>
                    </form>
            </div>
                </div>
                    
        <!-- </center> -->
    </body>
</html>