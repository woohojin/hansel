<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/memberInfo.css">

<script type="text/javascript">
		const confirmDisable = () => {
				
			const con = confirm("게시물을 삭제하시겠습니까??");
			if(con) {
				console.log(con);
				location.href = "${ pageContext.request.contextPath }/member/memberDelete?userId=${mem.userId}";
				
				
			} else {
				console.log(con);
				return;
			}
			
		}
		
	</script>
</head>
<body>
<section class="module memberInfo center">
    <div class="inner center">
        <h2 class="subject center">
          회원정보
        </h2>
          <div class="name center">
            <h3>아이디 :</h3>
            <span>${sessionScope.userId }</span>
          </div>
          <div class="center">
            <h3>주소 :</h3>
            <span class="address">
              ${mem.address }
            </span>
          </div>
          <div class="center">
            <h3>이메일 :</h3>
            <span>
             ${mem.email }
            </span>
          </div>
          <div class="center">
            <h3>전화번호 :</h3>
            <span>
              ${mem.tel }
            </span>            
          </div>
          <div class="center">
            <h3>반려동물 이름 :</h3>
            ${mem.petName }
          </div>
          <div class="box center">

            <a class="btn white center" href="${ pageContext.request.contextPath }/member/memberUpdate?userId=${mem.userId}">
              회원수정
            </a>
            <a class="btn white center" href="javascript:confirmDisable()">
              회원탈퇴
            </a>
            <a class="btn white center" href="${ pageContext.request.contextPath }/member/memberPassUpdate">
              비밀번호 변경
            </a>
          </div>
  
      </div>
</section>
</body>
</html>