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
		
		const deleteUser = (userId) => {
			
			const con = confirm(userId+"님을 삭제 하겠습니까?");
			if(con) {
				console.log(con);
				location.href = "${ pageContext.request.contextPath }/admin/deleteUser?userId="+userId;
			} else {
				console.log(con);
				return;
			}
			
		}
		
	</script>

</head>
<body>
	<section class="module admin user">
    <h2 class="center">회원 관리 <div class="btn white">회원 조회</div></h2>
    <div class="inner center">
      
      <div class="userList userItem center">
        
        <div class="listNormal adlist">
          <h2 class="center">일반 회원 리스트</h2>
          <ul>
          	
          	<c:if test="${ normal == null }">
          		<li>
          			회원이 없습니다.
          		</li>
          	</c:if>
          	<c:if test="${ normal != null }">
          	
          	<c:forEach var="b" items="${ normal }">
          		<li class="center">
	              <div class="box">
	                id : ${ b.userId }
	              </div>
	              <div class="box center">
	                <div class="btn white">정보</div>
	                <a href="javascript:updateAuth('${ b.userId }', 2)" class="btn white">권한</a>
	                <a href="javascript:deleteUser('${ b.userId }')" class="btn white">삭제</a>
	              </div>
            	</li>
          	</c:forEach>
            
            </c:if>
          </ul>
        </div>

        <div class="listAdmin adlist">
          <h2 class="center">관리자 계정 리스트</h2>
          <ul>
            <c:if test="${ admin == null }">
          		<li>
          			관리자회원이 없습니다.
          		</li>
          	</c:if>
          	<c:if test="${ admin != null }">
          	
          	<c:forEach var="b" items="${ admin }">
          		<li class="center">
	              <div class="box">
	                id : ${ b.userId }
	              </div>
	              <div class="box center">
	                <div class="btn white">정보</div>
	                <a href="javascript:updateAuth('${ b.userId }', 0)" class="btn white">권한</a>
	                <a href="javascript:deleteUser('${ b.userId }')" class="btn white">삭제</a>
	              </div>
            	</li>
          	</c:forEach>
            
            </c:if>
          </ul>
        </div>
        
      </div>

    </div>
  </section>
</body>
</html>