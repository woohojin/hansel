<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/qaBoard.css">
</head>
<body>
<%@ include file="../../common/cookielogin.jsp" %>
	<section class="module qa">

    <div class="inner">
      <h2 class="qaName center">
        Q&A 게시판
        <a href="${ pageContext.request.contextPath }/board/QBoardForm" class="btn white">
          글쓰기
        </a>
      </h2>

      <div class="qaContent">

        <div class="card fix">
          <ul class="center">
            <li class="subject">
              작성일
            </li>
            <li class="content">
              질문
            </li>
            <li class="userId">
              아이디
            </li>
          </ul>
        </div>
        
        <c:if test="${ boardCount == 0 }">
			<p>등록된 질문이 없습니다.</p>
		</c:if>
        
        <c:if test="${ boardCount > 0 }">
        
        <c:forEach var="b" items="${ list }">
        <div class="card">
          <ul class="center">
            <li class="subject center">
              ${ b.regDate }
            </li>
            <a href="${ pageContext.request.contextPath }/board/QBoardInfo?QId=${b.QId}">
            <li class="content">
              ${ b.subject }
            </li>
            </a>
            <li class="userId center">
              ${ b.userId }
            </li>
          </ul>
        </div>
        </c:forEach>
        
        </c:if>
        

      </div>
      
      

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

  </section>
</body>
</html>