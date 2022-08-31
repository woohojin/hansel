<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/signUp.css">
</head>
<body>
	<section class="signInForm">
    <figure>
      <video src="${ pageContext.request.contextPath }/view/video/cat1.mp4" muted loop autoplay></video>
    </figure>
    <div class="video_cover"></div>
    <div class="inner center">
      <h2 class="subject">
        회원가입
      </h2>
      <form action="${ pageContext.request.contextPath }/member/signUpPro" method="post" class="form center" onsubmit="return inputCheck(this)">
  
        <div class="name">
          <h3>아이디</h3>
          <input type="text" name="userId" placeholder="6자리이상의 아이디를 입력해주세요." required>
        </div>
        <div class="">
          <h3>비밀번호</h3>
          <input type="password" name="pwd" placeholder="8자리 이상의 비밀번호를 입력해 주세요" required>
        </div>
        <div class="">
          <h3>비밀번호 확인</h3>
          <input type="password" name="pwdOk" required>
        </div>
        <div class="">
          <h3>주소</h3>
          <input type="text" name="address">
        </div>
        <div class="">
          <h3>이메일</h3>
          <input type="email" name="email">
        </div>
        <div class="">
          <h3>전화번호</h3>
          <input type="text" name="tel" required>
        </div>
        <div class="">
          <h3>반려동물 이름</h3>
          <input type="text" name="petName" placeholder="반려동물이 없으면 빈칸으로 입력해 주세요">
        </div>

        <div class="submit">
          <input type="submit" value="회원가입">
        </div>
  
      </form>
    </div>
  </section>
  
  <script type="text/javascript">
  const inputCheck = (form) => {
		if(form.pwd.value == "") {
			alert("비밀번호를 입력하세요.");
			form.pwd.focus();
			return false;
		} else if (form.pwd.value != form.pwdOk.value) {
			alert("변경 비밀번호 와 재입력 비밀번호가 일치하지 않습니다.");
			form.pwdOk.value = "";
			form.pwdOk.focus();
			return false;
		} else if (form.pwd.value.length < 8 || form.userId.value.length < 6) {
			alert("아이디 또는 비밀번호의 자리수를 확인해주세요.");
			form.userId.focus();
			return false;
		}
		return true;
	}
  </script>
</body>
</html>