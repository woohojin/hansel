<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoard.css">
</head>
<body>
<%@ include file="../../common/cookielogin.jsp" %>
	<section class="module petBoard">
    <div class="inner">
      <div class="modHead center">
        <h2>${ bs.boardName }</h2>
        <div class="filter center">
          <form class="center">
            <label class="center">
         	  <input id="petTypeDog"type="radio" name="petType" ${ petType == 0 ? "checked" : "" } onchange="redirect(this)" value="0"> 강아지
            </label>
            <label class="center">
          	  <input id="petTypeCat"type="radio" name="petType" ${ petType == 1 ? "checked" : "" } onchange="redirect(this)" value="1"> 고양이
            </label>
            <div class="searchBox center">
              <input type="text">
              <div class="searchIcon">
              	<a href="${ pageContext.request.contextPath }/board/petBoard?boardid=${ sessionScope.boardid }&petType=1">
                  <svg viewBox="0 0 512 512">
                    <path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"/>
                  </svg>
                </a>
              </div>
            </div>
          </form>
          <a href="${ pageContext.request.contextPath }/board/petBoardForm">
	          <div class="btn white">
	            글쓰기
	          </div>
          </a>
        </div>
      </div>

      <div class="modContent center">
      
      	<c:if test="${ boardCount == 0 }">
			<p>등록된 게시물이 없습니다.</p>
		</c:if>
		
        <c:if test="${ boardCount > 0 }">
        
        <c:forEach var="b" items="${ list }">
        <a href="${ pageContext.request.contextPath }/board/petBoardInfo?boardid=${ sessionScope.boardid }&postId=${b.postId}">
        <div class="modCard">
          <div class="cardImg">
            <img src="${ pageContext.request.contextPath }/view/board/img/${ b.petImg }" alt="">
          </div>
          <div class="cardInfo">
            <div class="inner wrap">

              <div class="infoContent">
                <span class="name">이름 : </span> 
                <span>
                  ${ b.petName }
                </span>
              </div>
              
              <div class="infoContent">
                <span class="name">종류 :</span>
                <span>
                  ${ b.petType == 1 ? "고양이" : "강아지" }
                </span>
              </div>
              
              <div class="infoContent">
                <span class="name">성별 :</span>
                <span>
                  ${ b.petGender == 1 ? "남아" : "여아" }
                </span>
              </div>
              
              <div class="infoContent">
                <span class="name">특징 :</span>
                <span>
                  ${ b.petDetail }
                </span>
              </div>
              
              <div class="infoContent">
                <span class="name">${ bs.boardPlace } :</span>
                <span class="place">
                  ${ b.place }
                </span>
              </div>

              <div class="infoContent">
                <span class="name">${ bs.boardDate } :</span>
                <span>
                  ${ b.petDate }
                </span>
              </div>
              
  			  <div class="infoContent">
                <span class="name">작성일 :</span>
                <span>
                  ${ b.regDate }
                </span>
              </div>

 			  <div class="infoContent">
                <span class="name">조회수 :</span>
                <span>
                  ${ b.readCnt }
                </span>
              </div>
            </div>
          </div>
        </div>
      </a>  
      </c:forEach>
      </c:if>
      </div>
      
       <div class="modPage center">
          <div class="inner center">
            <a <c:if test="${ start >= 3}" >href="${ pageContext.request.contextPath }/board/petBoard?boardid=${ sessionScope.boardid }&pageNum=${start-3}" class="active"</c:if>>&laquo;</a>
            <c:forEach var="p" begin="${ start }" end="${ end }">
            <a class="active" href="${ pageContext.request.contextPath }/board/petBoard?boardid=${ sessionScope.boardid }&pageNum=${p}">${ p }</a>
            </c:forEach>
            <a <c:if test="${ end < maxPage }">href="${ pageContext.request.contextPath }/board/petBoard?boardid=${ sessionScope.boardid }&pageNum=${end + 3}" class="active"</c:if>>&raquo;</a>
          </div>
        </div>
    </div>
  </section>
  <script>
	function redirect(type) {
		window.location.href = 'http://localhost:8000/hanselMvc/board/petBoard?boardid=${sessionScope.boardid}&petType=' + type.value;
	}
  </script>
</body>
</html>