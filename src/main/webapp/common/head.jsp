<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/common/reset.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/common/header.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/common/common.css">
</head>
<body>

	<header <c:if test="${ bs.boardName != null}">class='board'</c:if>>
	<a href="${ pageContext.request.contextPath }/member/index">
	    <div class="logoBox">
	      <img src="${ pageContext.request.contextPath }/view/images/logo/dogcat.png" alt="logo">
	      <h1>헨젤 & 빵조각</h1>
	    </div>
	</a>
	
    <ul class="menu headCommon">
      <a href="${ pageContext.request.contextPath }/board/petBoard?boardid=1&petType=0">
        <li>보호중인 동물</li>
      </a>
       
      <a href="${ pageContext.request.contextPath }/board/petBoard?boardid=2&petType=0">
        <li>찾고있는 동물</li>
      </a>

	  <a href="${ pageContext.request.contextPath }/board/adoptBoard">
        <li>입양공고</li>
      </a>
      
      <a href="${ pageContext.request.contextPath }/board/reviewBoard">
        <li>입양후기</li>
      </a>
      
      <a href="${ pageContext.request.contextPath }/member/email">
        <li>의견보내기</li>
      </a>
      
      <a href="${ pageContext.request.contextPath }/board/QBoard">
        <li>Q&A</li>
      </a>
    </ul>

    <ul class="signBox headCommon">
    <c:if test="${sessionScope.userId == null}">
      <a href="${ pageContext.request.contextPath }/member/signIn">
        <li>로그인</li>
      </a>
      
      <a href="${ pageContext.request.contextPath }/member/signUp">
        <li>회원가입</li>
      </a>
    </c:if>
    
    <c:if test="${sessionScope.userId != null}">
      <a href="${ pageContext.request.contextPath }/member/memberInfo">
        <li>내정보</li>
      </a>
      
      <a href="${ pageContext.request.contextPath }/member/logout">
        <li>로그아웃</li>
      </a>
    </c:if>
    </ul>
  </header>

</body>
</html>