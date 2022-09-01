<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/memberInfo.css">
</head>
<body>
<section class="module memberInfo center">
    <div class="inner center">
        <h2 class="subject center">
          회원정보
        </h2>
          <div class="name center">
            <h3>아이디</h3>
            <span>${sessionScope.userId }</span>
          </div>
          <div class="center">
            <h3>비밀번호</h3>
            <input type="password" name="pwd" placeholder="8자리 이상의 비밀번호를 입력해 주세요" required>
          </div>
          <div class="center">
            <h3>주소</h3>
            <span class="address">
              ${mem.address }
            </span>
          </div>
          <div class="center">
            <h3>이메일</h3>
            <span>
             ${mem.email }
            </span>
          </div>
          <div class="center">
            <h3>전화번호</h3>
            <span>
              ${mem.tel }
            </span>            
          </div>
          <div class="center">
            <h3>반려동물 이름</h3>
            ${mem.petName }
          </div>
          <div class="box">

            <a  href="${ pageContext.request.contextPath }/board/adoptBoardUpdate?adoptId=${pb.adoptId}">
              회원수정
            </a>
            <a href="javascript:confirmDisable()">
              회원탈퇴
            </a>
            <a href="${ pageContext.request.contextPath }/board/adoptBoard">
              비밀번호 변경
            </a>
          </div>
  
      </div>
</section>
</body>
</html>