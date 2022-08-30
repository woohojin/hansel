<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoardInfo.css">
</head>
<body>

	<div class="module petBoardInfo">
    <div class="inner center">

      <div class="petImg">
        <img src="${ pageContext.request.contextPath }/view/images/dog/profile1.jpg" alt="pet">
      </div>

      <div class="petInfo">
        <div class="inner">
          <form action="" method="post">

            <div class="infoContent center read">
              <div class="name">조회수 :</div> 
              <div>
                123
              </div>
            </div>
            
            <div class="infoContent center">
              <div class="name">이름 :</div>
              <div>
                웃음이
              </div>
            </div>
            
            <div class="infoContent center">
              <div class="name">성별 :</div>
              <div>
                수컷
            </div>
          </div>
          
          <div class="infoContent center">
            <div class="name">특징 :</div>
            <div>
              인간 같이 행동함
            </div>
          </div>

          <div class="infoContent center">
            <div class="name">중성화 :</div>
            <div>
              완료
            </div>
          </div>

          <div class="infoContent center">
            <div class="name">예방접종 :</div>
            <div>
              완료
            </div>
          </div>
          
          <div class="infoContent center">
            <div class="name">보호자 전화번호 :</div>
            <div>
              010-7777-7777
            </div>
          </div>
          
          <div class="infoContent">
            <div class="name">상세설명</div>
            <div>
              건강하게 자랐수다
            </div>
          </div>
          
          <div class="infoContent center regDate">
            <div class="name">작성일 :</div>
            <div>
              2022.02.03
            </div>
          </div>
          
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