<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	<%@ include file="css/error.css" %>
</style>

</head>
<body>
	<section class="main">
      <div class="errorText">
        <div class="test">오류가 발생했습니다.</div>
        <div>현재 페이지는 존재하지 않습니다.
        	<span></span>
        </div>
       	<div>현재 오류가 계속된다면 페이지 상단의<br>의견보내기 탭을 통해 알려주세요.</div>
       	<a href="${ pageContext.request.contextPath }/member/index">메인 페이지로 돌아가기</a>
	  </div>
    </section>
</body>
</html>