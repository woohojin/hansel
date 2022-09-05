<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/adminReport.css">
</head>
<body>
	<section class="module admin report">
    <h2 class="center">신고 관리</h2>
    <div class="inner center">
      
      <div class="userList reportItem center">
        
        <div class="listNormal adlist">
          <h2 class="center">유저 신고</h2>
          <ul>
            <li class="center">
              <div class="box">
                <h3>신고한 유저 : test123</h3>
                <textarea readonly>걍 맘에 안들어여</textarea>
              </div>
              <div class="box center">
                <div class="btn white">덧글</div>
                <div class="btn white">경고</div>
                <div class="btn white">삭제</div>
              </div>
            </li>
          </ul>
        </div>

        <div class="listAdmin adlist">
          <h2 class="center">게시물 신고</h2>
          <ul>
            <li class="center">
              <div class="box">
                <h3>신고한 유저 : test123</h3>
                <textarea readonly>걍 맘에 안들어여</textarea>
              </div>
              <div class="box center">
                <div class="btn white">게시물</div>
                <div class="btn white">경고</div>
                <div class="btn white">삭제</div>
              </div>
            </li>
          </ul>
        </div>
        
      </div>

    </div>
  </section>
</body>
</html>