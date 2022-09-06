<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<section class="signInForm">
    <figure>
      <video src="${ pageContext.request.contextPath }/view/video/cat2.mp4" muted loop autoplay></video>
    </figure>
    <div class="video_cover"></div>
    <div class="inner center">
      <h2 class="subject">
        비밀번호 변경
      </h2>
      <form action="${ pageContext.request.contextPath }/member/memberPassUpdatePro" class="center" method="post" onsubmit="return inputCheck(this)">

        <div class="name">
          <h3>현재 비밀번호</h3>
          <input type="password" name="pwd" required>
        </div>
        
        <div class="inneremail">
          <h3>신규 비밀번호</h3>
          <input type="password" name="chgPwd" required>
        </div>
        
        <div class="inneremail">
          <h3>신규 비밀번호 확인</h3>
          <input type="password" name="pwdOk" required>
        </div>
         
        <div class="submit center">
          <input type="submit" value="비밀번호 변경">
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
	} else if (form.chgPwd.value != form.pwdOk.value) {
		alert("변경 비밀번호 와 재입력 비밀번호가 일치하지 않습니다.");
		form.pwdOk.value = "";
		form.pwdOk.focus();
		return false;
	} else if (form.pwd.value.length < 8) {
		alert("비밀번호의 자리수를 확인해주세요.");
		form.pwd.focus();
		return false;
	}
	return true;
}

</script>
</body>
</html>