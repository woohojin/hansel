<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoard.css">
</head>
<body>
 <section class="module petBoard">
    <div class="inner">
      <div class="modHead center">
        <h2>입양공고</h2>
        <div class="box center">
          <div class="searchBox center">
            <input type="text">
            <div class="searchIcon">
              <svg viewBox="0 0 512 512">
                <path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"/>
              </svg>
            </div>
          </div>
          <div class="btn white">
            글쓰기
          </div>
        </div>
      </div>

      <div class="modContent center">
        
        <a href="${ pageContext.request.contextPath }/board/adoptBoardInfo?postid=${b.postId}">
        <div class="modCard">
          <div class="cardImg">
            <img src="${ pageContext.request.contextPath }/view/images/dog/profile1.jpg" alt="">
          </div>
          <div class="cardInfo">
            <div class="inner">

              <div class="infoContent center">
                <div class="name">조회수 :</div> 
                <div>
                  123
                </div>
              </div>

              <div class="infoContent center">
                <div class="name">이름 :</div>
                <div>
                  웃음이
                </div>
              </div>

              <div class="infoContent center">
                <div class="name">성별 :</div>
                <div>
                  남아
                </div>
              </div>

              <div class="infoContent center">
                <div class="name">특징 :</div>
                <div>
                  인간 같이 행동함
                </div>
              </div>

              <div class="infoContent center">
                <div class="name">중성화 :</div>
                <div>
                  완료
                </div>
              </div>

              <div class="infoContent center">
                <div class="name">접종 :</div>
                <div>
                  완료
                </div>
              </div>

              <div class="infoContent center regDate">
                <div class="name">작성일 :</div>
                <div>
                  2022.02.03
                </div>
              </div>

            </div>
          </div>
        </div>
        </a>
        
      </div>

      <div class="modPage center">
        12345
      </div>
    </div>
  </section>
</body>
</html>