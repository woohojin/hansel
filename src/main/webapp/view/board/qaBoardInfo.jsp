<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">
		const confirmDisable = () => {
				
			const con = confirm("게시물을 삭제하시겠습니까??");
			if(con) {
				console.log(con);
				location.href = "${ pageContext.request.contextPath }/board/QBoardDelete?QId=${pb.QId}";
			} else {
				console.log(con);
				return;
			}
			
		}
		
	</script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoardInfo.css">
</head>
<body>

	<div class="module petBoardInfo">
    <div class="inner center">

      <div class="petInfo">
        <div class="inner">
          <form action="" method="post">

            <div class="infoContent center read">
              <div class="name">조회수 :</div> 
              <div>
                ${ pb.readCnt }
              </div>
            </div>
            
            <div class="infoContent center">
              <div class="name">질문 :</div>
              <div>
                ${ pb.subject }
              </div>
            </div>
          
          <div class="infoContent">
            <div class="name">내용</div>
            <div>
              <textarea class="scrollbar" readonly style="width: 100%; height: 450px; outline: none; border: none; resize: none;">${ pb.content }</textarea>
            </div>
          </div>
          
          <div class="infoContent center regDate">
            <div class="name">작성일 :</div>
            <div>
              ${ pb.regDate }
            </div>
          </div>
          <div class="buttons" >
          <c:if test="${ sessionScope.userId == pb.userId }">
          	<a href="${ pageContext.request.contextPath }/board/QBoardUpdate?QId=${pb.QId}" class="btn">
				수정 
			</a>
			<a href="javascript:confirmDisable()" class="btn">
				삭제
			</a>
			</c:if>
			<a href="${ pageContext.request.contextPath }/board/QBoard" class="btn">
				목록
			</a>
          	<input type="submit" class="btn" value="신고" class="btn">
          </div>
          
        </form>
        </div>
      </div>

      <div class="petComment">
        <div class="inner">
          <div class="commentName">
            답변 ${ commCount }
          </div>

          <div class="commentCon scrollbar">

            <div class="comment center">
              <c:if test="${ commCount == 0 }">
				<p>등록된 덧글이 없습니다.</p>
			</c:if>
			<c:if test="${ commCount > 0 }">
			
			<c:forEach var="b" items="${ commlist }">
              <form style="width: 100%;" action="" method="post">

                <div class="userId">
                  ${ b.userId }
                </div>
                <textarea style="width: 100%; outline: none; border: none; padding: 10px; resize: none;" readonly class="commentContent">${ b.content }</textarea>
                <input type="submit" class="btn" value="유저 신고">
              </form>
             </c:forEach>
              </c:if>
            </div>  

          </div>

          <form action="${ pageContext.request.contextPath }/board/commentPro" method="post">
          	<input type="hidden" name="boardType" value="5">
          	<input type="hidden" name="userId" value="${ sessionScope.userId }" />
          	<input type="hidden" name="commId" value="${ pb.QId }" />
            <div class="commentInput center">
              <textarea name="content"></textarea>
              <input type="submit" value="입력">
            </div>
          </form>

        </div>
      </div>

    </div>
  </div>

</body>
</html>