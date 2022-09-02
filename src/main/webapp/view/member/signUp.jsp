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
          <h3>비밀번호<br>확인</h3>
          <input type="password" name="pwdOk" required>
        </div>
        <div class="">
          <h3 style="width: 110px;">주소</h3>
          <div class="address" style="width: 323px;margin-bottom: 0; border-radius: 0;">
            <input style="border-radius: 0; width: 220px;" type="text" id="roadAddress" name="address" placeholder="예)서울 관악구" value="">
          	<input style="width: 80px; padding-left: 0; text-align: center;" type="button" onclick="execDaumPostcode()" value="주소 검색">
          </div>
        </div>
        <div class="">
          <h3>이메일</h3>
          <input type="email" name="email">
        </div>
        <div class="">
          <h3>전화번호</h3>
          <input type="number" name="tel" oninput="maxLengthCheck(this)" maxlength="11" placeholder="예) 01012345678" required>
        </div>
        <div class="">
          <h3>반려동물 이름</h3>
          <input type="text" maxlength="10" name="petName" placeholder="반려동물이 없으면 빈칸으로 입력해 주세요">
        </div>

        <div class="submit center">
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
  
  	function maxLengthCheck(object){
	    if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }    
	}
  </script>
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("roadAddress").value = roadAddr;
              
                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                
               <%-- if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }
				--%>
				<%--
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                --%>
            }
        }).open();
    }
</script>
</body>
</html>