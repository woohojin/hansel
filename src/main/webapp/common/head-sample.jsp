<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
  <div class="w3-bar w3-light-grey">
    <a href="${ pageContext.request.contextPath }/member/index" class="w3-bar-item w3-button w3-green">KIC Campus</a>
    
    <c:if test="${sessionScope.id == null}">
	    <a href="${ pageContext.request.contextPath }/member/joinForm" class="w3-bar-item w3-button w3-hide-small">회원가입</a>
	    <a href="${ pageContext.request.contextPath }/member/loginForm" class="w3-bar-item w3-button w3-hide-small">로그인</a>
    </c:if>
    <%-- ${ pageContext.request.contextPath } == <%= request.getContextPath() %> --%>
    <c:if test="${sessionScope.id != null}">
	    <a href="${ pageContext.request.contextPath }/member/memberInfo" class="w3-bar-item w3-button w3-hide-small">${ sessionScope.id }님 정보 확인</a>
	    <a href="${ pageContext.request.contextPath }/member/logout" class="w3-bar-item w3-button w3-hide-small">로그아웃</a>
    </c:if>
    
    <c:if test="${ sessionScope.id eq 'admin' }">
    	<a href="<%= request.getContextPath() %>/member/memberList" class="w3-bar-item w3-button w3-hide-small">회원리스트</a>
	</c:if>
	    
    <div class="w3-dropdown-hover">
      <button class="w3-button">
        게시판: ${ sessionScope.boardid } <i class="fa fa-caret-down"></i>
      </button>
      <div class="w3-dropdown-content w3-bar-block w3-white w3-card-4">
        <a href="${ pageContext.request.contextPath }/board/boardList?boardid=1" class="w3-bar-item w3-button w3-text-black">공지사항</a>
        <a href="${ pageContext.request.contextPath }/board/boardList?boardid=2" class="w3-bar-item w3-button w3-text-black">자유게시판</a>
        <a href="${ pageContext.request.contextPath }/board/boardList?boardid=3" class="w3-bar-item w3-button w3-text-black">Q&A</a>
      </div>
    </div>
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right"><i class="fa fa-search"></i></a>
  </div>
</body>
</html>