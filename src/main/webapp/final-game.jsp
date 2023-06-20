<%@ page import="java.sql.*" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Jua&family=Nanum+Gothic&family=Noto+Sans+KR&family=Stylish&family=Sunflower:wght@300&display=swap");

      body {
        background-color: black;
        width: 100%;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
      }
      .game_msg {
        position: absolute;
        width: 720px;
        height: 480px;
        background-color: rgba(0, 0, 0, 0.7);
        text-align: center;
        line-height: 480px;
        font-size: 30px;
        color: #ffffff;
        font-weight: bold;
        display: none;
      }
      .game_msg.show {
        display: block;
      }
      .playGame {
        position: absolute;
       
       width: 100px;
        top:30px;
		right: -55px;
        display: none;
      }
      .playGame.show {
        display: block;
      }
      .playGame2 {
        position: absolute;
       width: 100px;
       top: 60px;
       right: -55px;
        
        display: none;
      }
      .playGame2.show {
        display: block;
      }
      #audio {
        height: 90px;
        width: 130px;
        position: fixed;
        right: 0;
        top: 1px;
      }
      #gohome {
        color: white;
        position: fixed;
        top: 7px;
        left: 7px;
        padding: 1px;
        font-style: italic;
        font-family: "Black Han Sans", sans-serif;
      }
      p {
        right: 34px;
        color: white;
        position: fixed;
        top: -12px;
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
	  form
	  {
	  
	  }
	  #column
            {
                position: absolute;
                flex-direction: column;
                justify-content: center;
                
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
    <canvas id="canvas" style="border: solid 1px #363636"></canvas>
    <iframe src="src/main/resources/templates/user/bgm.mp3" frameborder="0" allow="autoplay" id="audio"></iframe>
    <p>음악재생</p>
    <div class="game_msg"></div>
    <div id="column">
    <button type="button" class="playGame"></button>
    <form name="get" method="post" action="final-rankTask.jsp"> 
    <input id="opacity0" class="temprecord" name="thisguy" type="text" value=""> 
    <button type="submit" class="playGame2"></button>
    </form>
    </div>
    
    
    

    <script type ="text/javascript">
      
    const gameMsg = document.querySelector(".game_msg");
    const playGame = document.querySelector(".playGame");
    const playGame2 = document.querySelector(".playGame2");
    const temprecord = document.querySelector(".temprecord");
    const canvas = document.getElementById("canvas");
    const ctx = canvas.getContext("2d");
    const width = 720;
    const height = 480;
    const radius = 5;
    let score = 0;
    let lives = 3;

    let timerId;
    let time = 0;
    let hour, sec;
    var min = 0;

    var complete = 0;

    //setTimer();
    const SHOW = "show";
    // canvas 크기 지정
    canvas.width = width;
    canvas.height = height;
    // 키보드 이벤트를 위한 변수.
    let rightBtnPressed = false;
    let leftBtnPressed = false;
    // 공
    const ballRadius = 8;
    // 공의 위치를 담고 있는 좌표 값.
    let x = canvas.width / 2;
    let y = canvas.height - 50;
    let dx = 2;
    let dy = -2;
    // 라켓
    const racketWidth = 80;
    const racketHeight = 10;
    let racketX = (canvas.width - racketWidth) / 2;
    let racketY = canvas.height - 30;
    // 벽돌
    let bricks = [];
    const brickRowCount = 3;
    const brickColCount = 11;
    const brickWidth = 50;
    const brickHeight = 50;
    const brickpadding = 11;
    const brickOffsetTop = 30;
    const brickOffsetLeft = 30;
    const brickColors = [
      "#ffeb3b",
      "#00bcd4",
      "#40ff1d",
      "#dc0eff",
      "#ff3e7f",
      "#ff9800",
      "#3f51b5",
    ];
    // 벽돌 충돌 감지
    // bricks.status 가 0이면 다시 벽돌을 그리지 않음.
    function collisionDetection() {
      for (let col = 0; col < brickColCount; col += 1) {
        for (let row = 0; row < brickRowCount; row += 1) {
          let block = bricks[col][row];
          if (bricks[col][row].status === 1) {
            // 벽돌 충돌 시 status 값이 0이 됌.
            if (
              x > block.x &&
              x < block.x + brickWidth &&
              y > block.y &&
              y < block.y + brickHeight
            ) {
              dy = -dy;
              block.status = 0;
              score += 1;
              // 벽돌을 전부 깨면 게임 승리 메세지와 함께 게임 다시 시작.
              if (score === brickRowCount * brickColCount) {
                gameMsg.innerHTML = `YOU WIN! CONGRATULATIONS`;
                playGame.innerHTML = `다시 하기`;
                playGame2.innerHTML = `랭킹등록 하기`;
                recordScore();
                playGame.classList.add(SHOW);
                gameMsg.classList.add(SHOW);
                playGame2.classList.add(SHOW);
                clearInterval(drawInterval);
              }
            }
          }
        }
      }
    }

    // 타이머 함수
    function printTime() {
      time++;
    }

    function minutecounter() {
      if (timerId % 12000 == 0) {
        min++;
      }
    }

    function startClock() {
      //time++;
      printTime();
      //timerId = setTimeout(printTime, 10);
      if (timerId) clearTimeout(timerId);
      timerId = setTimeout(printTime, 1000);
      setTimeout(minutecounter, 1000);
    }

    function getTimeFormatString() {
      complete =
        String(min).padStart(2, "0") +
        ":" +
        String(Math.floor(time / 100) % 60).padStart(2, "0") +
        ":" +
        (time % 100);
    }

    // 스코어 계산 함수
    function drawScore() {
      ctx.font = `16px Arial`;
      ctx.fillStyle = `#ffffff`;
      ctx.fillText("Score: " + score, 8, 20);
    }
    // 생명
    function drawLives() {
      ctx.font = "16px Arial";
      ctx.fillStyle = "#ffffff";
      ctx.fillText("Lives: " + lives, canvas.width - 65, 20);
    }
    //타이머
    function drawTimer() {
      ctx.font = "16px Arial";
      ctx.fillStyle = "#ffffff";
      ctx.fillText(complete, 330, 20);
    }

    // 캔버스에 벽돌을 만듬.
    for (let col = 0; col < brickColCount; col += 1) {
      bricks[col] = [];

      for (let row = 0; row < brickRowCount; row += 1) {
        bricks[col][row] = {
          x: 0,
          y: 0,
          status: 1,
          color:
            brickColors[Math.floor(Math.random() * brickColors.length) + 1],
        };
      }
    }
    // 캔버스에 벽돌 그리기
    function drawBrick() {
      for (let col = 0; col < brickColCount; col += 1) {
        for (let row = 0; row < brickRowCount; row += 1) {
          if (bricks[col][row].status === 1) {
            let brickX = col * (brickWidth + brickpadding) + brickOffsetLeft;
            let brickY = row * (brickHeight + brickpadding) + brickOffsetTop;
            bricks[col][row].x = brickX;
            bricks[col][row].y = brickY;
            ctx.beginPath();
            roundedRect(ctx, brickX, brickY, brickWidth, brickHeight, radius);
            ctx.fillStyle = bricks[col][row].color;
            ctx.closePath();
            ctx.fill();
          }
        }
      }
    }
    // 라켓을 그리는 함수
    function drawRacket() {
      ctx.beginPath();
      // 모서리가 둥근 사각형을 만들어줌.
      roundedRect(ctx, racketX, racketY, racketWidth, racketHeight, radius);
      ctx.fillStyle = `#ffeb3b`;
      ctx.closePath();
      ctx.fill();
    }
    // 공을 그리는 함수.
    function drawBall() {
      ctx.fillStyle = `#000000`;
      ctx.fillRect(0, 0, width, height);
      // 캔버스 배경색 지정
      ctx.beginPath(); // 경로 생성
      ctx.arc(x, y, ballRadius, 0, Math.PI * 2, false);
      // arc(x, y, 반지름, 시작각도, 종료각도, 그리는 방향)
      ctx.fillStyle = `#0095DD`; // 배경색 지정
      ctx.closePath(); // 경로 종료
      ctx.fill(); // 채색
    }
    // 드로잉 함수
    function draw() {
      ctx.clearRect(0, 0, width, height);
      // 사각형으로, 캔버스의 내용을 지워주는 메소드.
      // clearRect(x, y, width, height);
      // 함수가 실행될 때마다 캔버스의 내용을 지움.
      drawBall();
      drawRacket();
      drawBrick();
      drawScore();
      drawLives();
      startClock();
      getTimeFormatString();
      drawTimer();
      collisionDetection();
      // 공이 벽에 부딪히면 반대방향으로 이동
      if (x + dx > canvas.width - ballRadius || x + dx < ballRadius) {
        dx = -dx;
      }
      if (y + dy < ballRadius) {
        dy = -dy;
      } else if (y + dy > canvas.height - ballRadius - 30) {
        if (x > racketX && x < racketX + racketWidth) {
          dy = -dy;
        } else {
          lives -= 1;
          if (!lives) {
            console.log(`GAME OVER`);
            gameMsg.innerHTML = `GAME OVER`;
            playGame.innerHTML = `다시 시작`;
            /* playGame2.innerHTML = `랭킹등록 하기`;
            temprecord.innerHTML = complete;
            recordScore(); */
            playGame.classList.add(SHOW);
            /* playGame2.classList.add(SHOW); */
            gameMsg.classList.add(SHOW);
            clearInterval(drawInterval);
          } else {
            x = canvas.width / 2;
            y = canvas.height - 50;
            dx = 2;
            dy = -2;
            racketX = (canvas.width - racketWidth) / 2;
          }
        }
      }
      // 오른쪽 방향키를 누르면 오른쪽으로 5, 왼쪽 방향키를 누르면 왼쪽으로 -5만큼 이동
      if (rightBtnPressed && racketX < canvas.width - racketWidth) {
        racketX += 5;
      } else if (leftBtnPressed && racketX > 0) {
        racketX -= 5;
      }
      x += dx;
      y += dy;
    }
    const drawInterval = setInterval(draw, 10);
    // 모서리가 둥근 사각형을 만들어주는 함수.
    function roundedRect(ctx, x, y, width, height, radius) {
      ctx.beginPath();
      ctx.moveTo(x, y + radius);
      ctx.lineTo(x, y + height - radius);
      ctx.arcTo(x, y + height, x + radius, y + height, radius);
      ctx.lineTo(x + width - radius, y + height);
      ctx.arcTo(
        x + width,
        y + height,
        x + width,
        y + height - radius,
        radius
      );
      ctx.lineTo(x + width, y + radius);
      ctx.arcTo(x + width, y, x + width - radius, y, radius);
      ctx.lineTo(x + radius, y);
      ctx.arcTo(x, y, x, y + radius, radius);
      ctx.stroke();
    }
    // keyup
    // 키보드 오른쪽, 왼쪽 방향키 누를 때 이벤트 발생.
    function keyupHandlr(event) {
      if (event.keyCode === 37) {
        leftBtnPressed = false;
      } else if (event.keyCode === 39) {
        rightBtnPressed = false;
      }
    }
    // keydown
    // 키보드 오른쪽, 왼쪽 방향키 누를 때 이벤트 발생.
    // 키보드 누르고 있을 때 leftBtnPressed, rightBtnPressed 값 변경
    function keydownHandlr(event) {
      if (event.keyCode === 37) {
        leftBtnPressed = true;
      } else if (event.keyCode === 39) {
        rightBtnPressed = true;
      }
    }
    // 게임 재시작
    function gameStart() {
      document.location.reload();
    }
    function showScore() {
      alert(complete);
    }
    function recordScore() {
      document.get.thisguy.value = complete;
      }
    // 마우스 이벤트
    function mouseMoveHandler(event) {
      const relativeX = event.clientX - canvas.offsetLeft;
      if (relativeX > 0 && relativeX < canvas.width) {
        racketX = relativeX - racketWidth / 2;
      }
    }
    // 키보드 클릭 시 발생하는 이벤트.
    document.addEventListener("keyup", keyupHandlr, false);
    document.addEventListener("keydown", keydownHandlr, false);
    // 마우스 움직이면 발생하는 이벤트
    document.addEventListener("mousemove", mouseMoveHandler, false);
    // 게임을 클리어 및 실패 시 나타나는 버튼
    // 버튼 누르면 페이지 새로고침.
    playGame.addEventListener("click", gameStart);
    /* playGame2.addEventListener("click", showScore); */

    </script>
  </body>
</html>
