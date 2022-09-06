<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoardInfo.css">

<script type="text/javascript">
		const confirmDisable = () => {

			const con = confirm("게시물을 삭제하시겠습니까?");
			if(con) {
				console.log(con);
				location.href = "${ pageContext.request.contextPath }/board/adoptBoardDelete?adoptId=${pb.adoptId}";
			} else {
				console.log(con);
				return;
			}
			
		}
		
	</script>
	
	<script type="text/javascript">
		function win_report(reportType, reportId, repoUserId) {
			const op = "width=500, height=400, left=50, top=150";
			open("${pageContext.request.contextPath}/board/reportForm?reportId="+reportId+"&boardType=4&reportType="+reportType+"&repoUserId="+repoUserId, "", op);
		}
	</script>

</head>
<body>

	<div class="module petBoardInfo">
    <div class="inner center">

      <div class="petImg">
        <img src="${ pageContext.request.contextPath }/view/board/img/${ pb.petImg }" alt="pet">
      </div>

      <div class="petInfo">
        <div class="inner">
          <form action="" method="post">

            <div class="infoContent center">
              <div class="name">이름 :</div>
              <div>
                ${ pb.petName }
              </div>
            </div>
            
            <div class="infoContent center">
              <div class="name">종류 :</div>
              <div>
                 ${ pb.petType == 1 ? "고양이" : "강아지" }
            </div>
          </div>
            
            <div class="infoContent center">
              <div class="name">성별 :</div>
              <div>
                 ${ pb.petGender == 1 ? "남아" : "여아" }
            </div>
          </div>
          
          <div class="infoContent center">
            <div class="name">특징 :</div>
            <div>
              ${ pb.petDetail }
            </div>
          </div>

          <div class="infoContent center">
            <div class="name">중성화 :</div>
            <div>
              ${ pb.neuter == 0 ? "미완료" : "완료" }
            </div>
          </div>

          <div class="infoContent center">
            <div class="name">예방접종 :</div>
            <div>
              ${ pb.vaccin == 0 ? "미완료" : "완료" }
            </div>
          </div>
          
          <div class="infoContent center">
            <div class="name">보호자 전화번호 :</div>
            <div>
              ${ pb.tel }
            </div>
          </div>
          
          <div class="infoContent center read">
            <div class="name">조회수 :</div> 
            <div>
               ${ pb.readCnt }
            </div>
          </div>
          
          <div class="infoContent">
            <div class="name">상세설명</div>
            <textarea readonly style="width: 100%; height: 200px; outline: none; border: none; resize: none;">${ pb.content }</textarea>
          </div>
          
          <div class="infoContent center regDate">
            <div class="name">작성일 :</div>
            <div>
              ${ pb.regDate.substring(0,10) }
            </div>
          </div>
          <div class="buttons">
          <c:if test="${ sessionScope.userId == pb.userId }">
          	<a href="${ pageContext.request.contextPath }/board/adoptBoardUpdate?adoptId=${pb.adoptId}" class="btn">
				수정 
			</a>
			<a href="javascript:confirmDisable()" class="btn">
				삭제
			</a>
			</c:if>
			<a href="${ pageContext.request.contextPath }/board/adoptBoard?petType=${pb.petType}" class="btn">
				목록
			</a>
			<c:if test="${ sessionScope.userId != null }">
			<c:if test="${ sessionScope.userId != pb.userId }">
          		<a href="javascript:win_report(1, ${ pb.adoptId }, null)" class="btn">신고</a>
          	</c:if>
          	</c:if>
			
          </div>
        </form>
        </div>
      </div>

      <div class="petComment">
        <div class="inner">
          <div class="commentName">
            덧글 ${ commCount }
          </div>

          <div class="commentCon">

            
              <c:if test="${ commCount == 0 }">
              <div class="comment center">
				<p>등록된 덧글이 없습니다.</p>
				</div>
			</c:if>
			<c:if test="${ commCount > 0 }">
			
			<c:forEach var="b" items="${ commlist }">
			<div class="comment center">
              <form style="width: 100%;" action="" method="post">

                <div class="userId">
                  ${ b.userId }
                </div>
                <textarea style="width: 100%; outline: none; border: none; padding: 10px; resize: none;" readonly class="commentContent">${ b.content }</textarea>
                <c:if test="${ sessionScope.userId != null }">
                	<c:if test="${ sessionScope.userId != b.userId }">
                		<a href="javascript:win_report(2, ${ b.ref }, '${ b.userId }')" class="btn">유저신고</a>
                	</c:if>
                </c:if>
                
              </form>
              </div>
             </c:forEach>
              </c:if>
              

          </div>

          <form action="${ pageContext.request.contextPath }/board/commentPro" method="post">
          	<input type="hidden" name="boardType" value="3">
          	<input type="hidden" name="userId" value="${ sessionScope.userId }" />
          	<input type="hidden" name="commId" value="${ pb.adoptId }" />
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