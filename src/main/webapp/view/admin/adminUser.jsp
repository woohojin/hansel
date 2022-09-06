<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/adminUser.css">

<script type="text/javascript">
		const updateAuth = (userId, userType) => {
				
			const con = confirm(userId+"님에게 관리자권한을 업데이트 하겠습니까?");
			if(con) {
				console.log(con);
				location.href = "${ pageContext.request.contextPath }/admin/updateAuth?userId="+userId+"&userType="+userType;
			} else {
				console.log(con);
				return;
			}
			
		}
		
		const deleteUser = (userId, userType) => {
			
			const con = confirm(userId+"님을 삭제 하겠습니까?");
			if(con) {
				console.log(con);
				location.href = "${ pageContext.request.contextPath }/admin/deleteUser?userId="+userId+"&userType="+userType;
			} else {
				console.log(con);
				return;
			}
			
		}
		
	</script>

</head>
<body>
	 <section class="module admin user">
    
    <h2 class="center">
      멤버관리
      <div class="box center">
        <a href="${ pageContext.request.contextPath }/admin/adminUser?userType=normal" class="btn white">
          일반 회원
        </a>
        <a href="${ pageContext.request.contextPath }/admin/adminUser?userType=admin" class="btn white">
          관리자 계정
        </a>
      </div>
    </h2>

    <div class="inner">
      <ul class="userHeader center">
        <li class="center">아이디</li>
        <li class="center">이메일</li>
        <li class="center">전화번호</li>
        <li class="center">주소</li>
        <li class="center">가입일</li>
        <li class="center">신고받은 횟수</li>
        <li class="center">회원 구분</li>
        <c:if test="${ userType eq 'normal' }">
        	<li class="center">권한 부여</li>
        </c:if>
        <c:if test="${ userType eq 'admin' }">
        	<li class="center">권한 삭제</li>
        </c:if>
        <li class="center">회원 삭제</li>
      </ul>
      
      <c:if test="${ memList == null }">
      	<p>회원이 없습니다.</p>
      </c:if>
	<c:if test="${ memList != null }">
	<c:forEach var="b" items="${ memList }">
      <ul class="userInfo center">
        <li class="center">${ b.userId }</li>
        <li class="center">${ b.email }</li>
        <li class="center">${ b.tel }</li>
        <li class="center">${ b.address }</li>
        <li class="center">2022/09/05</li>
        <li class="center">${ b.userReportCnt }</li>
        <li class="center">${ b.userType == 0 ? "일반회원" : "관리자"}</li>
        <li class="center">
        <c:if test="${ userType eq 'normal' }">
          <a href="javascript:updateAuth('${ b.userId }', 2)" class="btn white">권한</a>
        </c:if>
        <c:if test="${ userType eq 'admin' }">
          <a href="javascript:updateAuth('${ b.userId }', 0)" class="btn white">권한</a>
        </c:if>
        </li>
        <li class="center">
          <a href="javascript:deleteUser('${ b.userId }', ${ b.userType })" class="btn white">삭제</a>
        </li>
      </ul>
    </c:forEach>
    </c:if>
    </div>
      
  </section>
</body>
</html>