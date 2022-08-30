<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	<%@ include file="css/main.css" %>
</style>

	

</head>
<body>

<ul class="mainSlide"></ul>

	<section class="main">

    <div class="toLeft">
      <svg width="50" height="50" viewBox="0 0 86 86" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect x="43" y="85.4264" width="60" height="4" rx="2" transform="rotate(-135 43 85.4264)" fill="#F2EFE9" stroke="#000"/>
        <rect x="45.8284" y="3.40203" width="60" height="4" rx="2" transform="rotate(135 45.8284 3.40203)" fill="#F2EFE9" stroke="#000"/>
      </svg>
    </div>
    <div class="toRight">
      <svg width="50" height="50" viewBox="0 0 86 86" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect x="43" y="0.573608" width="60" height="4" rx="2" transform="rotate(45 43 0.573608)" fill="#F2EFE9" stroke="#000"/>
        <rect x="40.1716" y="82.598" width="60" height="4" rx="2" transform="rotate(-45 40.1716 82.598)" fill="#F2EFE9" stroke="#000"/>
      </svg>
    </div>

    <div class="mainText">
      <h1>주인님의 냄새가 나요!</h1>
      <h1>절 찾으러 오셨나봐요!</h1>
      <div class="btn">
        About us
      </div>
    </div>

  </section>

  <section class="module simIntro">
    <div class="inner center">
      <div class="simpleContent center">
        <div class="logoImg">
          <img src="${ pageContext.request.contextPath }/view/images/logo/dogcatwhite.png" alt="logo">
        </div>
        <div class="intro">
          헨젤과 그레텔은 집으로 돌아가기 위해 빵조각을 던졌어요. <br>
          그 빵조각은 단순한 빵조각이 아닌 돌아가기 위한 희망이였을거에요. <br> <br>
          헨젤 & 빵조각에서도 
          반려동물과 그 가족들의 희망이 되어 드릴게요.
        </div>
      </div>
    </div>
  </section>

  <section class="module choose center">
    <div class="box">
      <h2 class="boxName center">
        반려동물을 잃어 버리셨나요?
      </h2>
      <div class="boxImg">
        <img src="${ pageContext.request.contextPath }/view/images/find.jpg" alt="find">
      </div>
      <div class="btn">
        빵조각 보러가기
      </div>
    </div>
    <div class="box">
      <h2 class="boxName center">
        반려동물을 잃어 버리셨나요?
      </h2>
      <div class="boxImg">
        <img src="${ pageContext.request.contextPath }/view/images/protect.jpg" alt="find">
      </div>
      <div class="btn">
        빵조각 보러가기
      </div>
    </div>
  </section>

  <section class="module review">
    <div class="inner">

      <h2>입양&찾은 후기</h2>

      <div class="view">

        <div class="card">
          <div class="inner">
            <div class="reviewImg">
              <img src="${ pageContext.request.contextPath }/view/images/dog/profile1.jpg" alt="">
            </div>
            <div class="reviewText center">
              <div class="cardText">
                <div><span class="name">제목</span> : 부러스 부러스 찾아 부러스</div>
                <div class="box center">
                  <div><span class="name">닉네임 : </span>웃음이 주인</div>
                  <div><span class="name">반려동물 이름 : </span>웃음이</div>
                </div>
                <div>혹여나 못찾으면 어쩔까 하고 불안해 하고 있어는데 마침 ㅇㅇㅇ님이 보호중이라고 올려주셔서 찾을 수 있었습니다. 감사합니다.</div>
              </div>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="inner">
            <div class="reviewImg">
              <img src="${ pageContext.request.contextPath }/view/images/dog/profile2.jpg" alt="">
            </div>
            <div class="reviewText center">
              <div class="cardText">
                <div><span class="name">제목</span> : 홀리 몰리!! 애기가 너무 이뻐여!!</div>
                <div class="box center">
                  <div><span class="name">닉네임 : </span>귀여운덕후</div>
                  <div><span class="name">반려동물 이름 : </span>근육맨</div>
                </div>
                <div>이쁜아이 잘 구조해서 기부니가 좋습니다ㅎㅎ 잘 키울게여!!</div>
              </div>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="inner">
            <div class="reviewImg">
              <img src="${ pageContext.request.contextPath }/view/images/dog/profile3.jpg" alt="">
            </div>
            <div class="reviewText center">
              <div class="cardText">
                <div><span class="name">제목</span> : 서울 날씨</div>
                <div class="box center">
                  <div><span class="name">닉네임 : </span>기상청</div>
                  <div><span class="name">반려동물 이름 : </span>비</div>
                </div>
                <div>안녕하세요. 오늘 서울의 날씨는 화창한 날이 되겠습니다!</div>
              </div>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="inner">
            <div class="reviewImg">
              <img src="${ pageContext.request.contextPath }/view/images/dog/profile4.jpg" alt="">
            </div>
            <div class="reviewText center">
              <div class="cardText">
                <div><span class="name">제목</span> : goobye</div>
                <div class="box center">
                  <div><span class="name">닉네임 : </span>빡친효신</div>
                  <div><span class="name">반려동물 이름 : </span>보이스</div>
                </div>
                <div>멀어져 가는 오후를 바라보다~ 스쳐 지나가버린 그때 생각이나</div>
              </div>
            </div>
          </div>
        </div>

        <div class="card center">
          <div class="inner">
            <div class="reviewImg">
              <img src="${ pageContext.request.contextPath }/view/images/dog/profile5.jpg" alt="">
            </div>
            <div class="reviewText center">
              
              <div class="cardText">
                <div><span class="name">제목</span> : 강아지가 노는 모습 흐믓해서 충격</div>
                <div class="box center">
                  <div><span class="name">닉네임 : </span>전직 기자</div>
                  <div><span class="name">반려동물 이름 : </span>리포터</div>
                </div>
                <div>최근 유기동물을 입양하는 사람이 늘고 있는데요. 제가 한번 입양해보겠습니다.</div>
              </div>
            </div>
          </div>
        </div>

        <div class="card center">
          <div class="inner">
            <div class="reviewImg">
              <img src="${ pageContext.request.contextPath }/view/images/dog/profile1.jpg" alt="">
            </div>
            <div class="reviewText center">
              
              <div class="cardText">
                <div><span class="name">제목</span> : 강아지가 노는 모습 흐믓해서 충격</div>
                <div class="box center">
                  <div><span class="name">닉네임 : </span>전직 기자</div>
                  <div><span class="name">반려동물 이름 : </span>리포터</div>
                </div>
                <div>최근 유기동물을 입양하는 사람이 늘고 있는데요. 제가 한번 입양해보겠습니다.</div>
              </div>
            </div>
          </div>
        </div>
        <a href="/pages/review.html">
          <div class="btn">
            더보기
          </div>
        </a>
      </div>

      <div class="toRight showBtn" id="revBtnR">
        <svg width="50" height="50" viewBox="0 0 86 86" fill="none">
          <rect x="43" y="0.573608" width="60" height="4" rx="2" transform="rotate(45 43 0.573608)" fill="#F2EFE9" stroke="#42594A"/>
          <rect x="40.1716" y="82.598" width="60" height="4" rx="2" transform="rotate(-45 40.1716 82.598)" fill="#F2EFE9" stroke="#42594A"/>
        </svg>
      </div>

      <div class="toLeft" id="revBtnL">
        <svg width="50" height="50" viewBox="0 0 86 86" fill="none">
          <rect x="43" y="85.4264" width="60" height="4" rx="2" transform="rotate(-135 43 85.4264)" fill="#F2EFE9" stroke="#42594A"/>
          <rect x="45.8284" y="3.40203" width="60" height="4" rx="2" transform="rotate(135 45.8284 3.40203)" fill="#F2EFE9" stroke="#42594A"/>
        </svg>
      </div>

    </div>
  </section>

	<script defer>
		<%@ include file="js/main.js" %>
	</script>

</body>
</html>