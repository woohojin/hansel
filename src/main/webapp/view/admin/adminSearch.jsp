<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/adminSearch.css">
</head>
<body>
	<section class="module admin search">
    
    <h2 class="center">
      회원 조회
	
	<form action="${ pageContext.request.contextPath }/admin/adminSearch" method="get">
      <div class="searchBox center">
      	<input type="hidden" name="boardType" value="1"/>
        <input type="text" name="userId" placeholder="회원 아이디를 검색해주세요">
        <div class="searchIcon">
          <svg viewBox="0 0 512 512">
            <path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"/>
          </svg>
        </div>
        <input type="submit" class="btn" />
      </div>
     </form>

      <div></div>
    </h2>

    <article class="userContent center">
      <div class="userInfo">
        <h2 class="center">회원 정보</h2>
	  <c:if test="${ mem == null }">
	  	<p>조회된 회원이 없습니다.</p>
	  </c:if>
	  <c:if test="${ mem != null }">
        <ul>
          <li>유저 아이디 : ${ mem.userId }</li>
          <li>전화번호 : ${ mem.tel }</li>
          <li>이메일 : ${ mem.email }</li>
          <li>주소 : ${ mem.address }</li>
          <li>반려동물 이름 : ${ mem.petName }</li>
          <li>회원 구분 : ${ mem.userType == 0 ? "일반회원" : "관리자"}</li>
          <li>신고 횟수 : ${ mem.userReportCnt }</li>
          <li>
            <div class="btn white">유저 삭제</div>
            <div class="btn white">권한 부여</div>
          </li>
        </ul>
      </c:if>
      </div>

      <div class="userInfo userComm">
        <h2 class="center">덧글 기록</h2>
		<c:if test="${ comm == null }">
	  		<p>조회된 덧글이 없습니다.</p>
	  	</c:if>
	  	
	  	<c:if test="${ comm != null }">
	  		<ul>
	  		<c:forEach var="b" items="${ comm }">
	          <li>
	            <div class="name center">
	              덧글 내용-${ b.regdate }
	              <div class="btn white">
	                삭제
	              </div>
	            </div>
	            <textarea readonly>${ b.content }</textarea>
	          </li>
	         </c:forEach>
        	</ul>
	  	</c:if>
        
      </div>

      <div class="userInfo userPost">
        <h2 class="center">
          게시물 기록

          <div class="box center">
          <c:if test="${ mem != null }">
            <a href="${ pageContext.request.contextPath }/admin/adminSearch?userId=${ mem.userId }&boardType=1" class="btn white">보호</a>
            <a href="${ pageContext.request.contextPath }/admin/adminSearch?userId=${ mem.userId }&boardType=2" class="btn white">찾기</a>
            <a href="${ pageContext.request.contextPath }/admin/adminSearch?userId=${ mem.userId }&boardType=3" class="btn white">입양</a>
            <a href="${ pageContext.request.contextPath }/admin/adminSearch?userId=${ mem.userId }&boardType=4" class="btn white">후기</a>
          </c:if>
          </div>
        </h2>
		
		<c:if test="${ board == null }">
	  		<p>조회된 게시물이 없습니다.</p>
	  	</c:if>
	  	
	  	<c:if test="${ board != null }">
        <ul>
          <h3>
          	<c:if test="${ boardType == 1 }">
          	보호 게시판
          	</c:if>
          	<c:if test="${ boardType == 2 }">
          	찾기 게시판
          	</c:if>
          	<c:if test="${ boardType == 3 }">
          	입양 게시판
          	</c:if>
          	<c:if test="${ boardType == 4 }">
          	후기 게시판
          	</c:if>
          </h3>
          <c:forEach var="b" items="${ board }">
          <li>
            <div class="postId">
	            <c:if test="${ boardType == 1 }">
	          	게시물 번호 : ${ b.postId }
	          	</c:if>
	          	<c:if test="${ boardType == 2 }">
	          	게시물 번호 : ${ b.postId }
	          	</c:if>
	          	<c:if test="${ boardType == 3 }">
	          	게시물 번호 : ${ b.adoptId }
	          	</c:if>
	          	<c:if test="${ boardType == 4 }">
	          	게시물 번호 : ${ b.reviewId }
	          	</c:if>
            </div>

            <div class="btn white">게시물 보기</div>
          </li>
          </c:forEach>
        </ul>
        </c:if>
      </div>
    </article>
      
  </section>
</body>
</html>