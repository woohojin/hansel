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
				location.href = "${ pageContext.request.contextPath }/board/petBoardDelete?postId=${pb.postId}";
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
            <div class="name">${ bs.boardPlace } :</div>
            <div style="font-size: 16px">
              ${ pb.place }
            </div>
          </div>
          
          <div class="infoContent center">
            <div class="name">${ bs.boardDate } :</div>
            <div>
              ${ pb.petDate }
            </div>
          </div>
          
          <div class="infoContent center">
            <div class="name">보호자 전화번호 :</div>
            <div>
              ${ pb.tel }
            </div>
          </div>
          
          <div class="infoContent">
            <div class="name">상세설명</div>
            <textarea readonly style="width: 100%; height: 175px; outline: none; border: none; resize: none;">${ pb.content }</textarea>
          </div>
          
          <div class="infoContent center regDate">
            <div class="name">작성일 :</div>
            <div>
              ${ pb.regDate }
            </div>
          </div>
          
          <div class="infoContent center read">
              <div class="name">조회수 :</div> 
              <div>
                ${ pb.readCnt }
              </div>
            </div>
          <div class="buttons">
          	<c:if test="${ sessionScope.userId == pb.userId }">
          		<a href="${ pageContext.request.contextPath }/board/petBoardUpdate?postId=${pb.postId}" class="btn">
					수정 
				</a>
				<a href="javascript:confirmDisable()" class="btn">
					삭제
				</a>
		  	</c:if>
		   <a href="${ pageContext.request.contextPath }/board/petBoard" class="btn">
				목록
			</a>
          	<input type="submit" value="신고" class="btn">
          </div>
        </form>
        </div>
      </div>

      <div class="petComment">
        <div class="inner">
          <div class="commentName">
            덧글
          </div>

          <div class="commentCon">

            <div class="comment center">
              <form action="" method="post">

                <div class="userId">
                  웃음이주인
                </div>
                <div class="commentContent">
                  웃음이니?
                </div>
                <input type="submit" class="btn" value="유저 신고">
              </form>
            </div>  

          </div>

          <form action="" method="post">
            <div class="commentInput center">
              <textarea name="comment"></textarea>
              <input type="submit" value="입력">
            </div>
          </form>

        </div>
      </div>

    </div>
  </div>

</body>
</html>