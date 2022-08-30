<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">
		const confirmDisable = () => {
				
			const con = confirm("게시물을 삭제하시겠습니까?");
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

            <div class="infoContent center read">
              <div class="name">조회수 :</div> 
              <div>
                ${ pb.readCnt }
              </div>
            </div>
            
            <div class="infoContent center">
              <div class="name">이름 :</div>
              <div>
                ${ pb.petName }
              </div>
            </div>
            
            <div class="infoContent center">
              <div class="name">성별 :</div>
              <div>
                ${ pb.petGender == 1 ? "남아" : "여아" }
            </div>
          </div>
          
          <div class="infoContent">
            <div class="name">${ bs.boardPlace }</div>
            <div>
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
            <div class="name">특징 :</div>
            <div>
              ${ pb.petDetail }
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
            <div>
              ${ pb.content }
            </div>
          </div>
          
          <div class="infoContent center regDate">
            <div class="name">작성일 :</div>
            <div>
              ${ pb.regDate }
            </div>
          </div>
          
          	<a href="${ pageContext.request.contextPath }/board/petBoardUpdate?postId=${pb.postId}">
				수정
			</a>
			<a href="javascript:confirmDisable()">
				삭제
			</a>
			<a href="${ pageContext.request.contextPath }/board/petBoard">
				목록
			</a>
          
          <input type="submit" class="btn" value="신고">
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