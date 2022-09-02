<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoardForm.css">

<script type="text/javascript">
		function win_upload() {
			const op = "width=500, height=150, left=50, top=150";
			open("${pageContext.request.contextPath}/board/pictureimgForm", "", op);
		}
</script>
</head>
<body>

	<section class="module form">
	

	<h2>후기 게시물 수정</h2>
	
    <form action="${ pageContext.request.contextPath }/board/reviewBoardUpdatePro" name="f" method="post">
		<input type="hidden" name="userId" value="${ sessionScope.userId }">
		<input type="hidden" name="reviewId" value="${ pb.reviewId }">
      <div class="inner center">
        
        <div class="formImg">
        	<input type="hidden" name="petImg" value="${pb.petImg}">
          <img src="${ pageContext.request.contextPath }/view/board/img/${pb.petImg}" id="pic" alt="">
          <a href="javascript:win_upload()" class="btn white">
            사진 넣기
          </a>
        </div>
        
        <div class="formContent" style="height: 65%;">
          <div class="inner">

           <div class="conInput center">
              <div class="name center">
                제목
              </div>
              <input type="text" name="subject" value="${ pb.subject }">
            </div>
            
            <div class="conInput center">
              <div class="name center" style="width: 200px;">
                반려동물 이름
              </div>
              <input type="text" name="petName" value="${ pb.petName }">
            </div>
            
            <div class="conInput center">
              <div class="name center">
                종류
              </div>
              <label class="center">
                <input type="radio" name="petType" ${ pb.petType == 0 ? "checked" : "" } value="0"> 강아지
              </label>
              <label class="center">
                <input type="radio" name="petType" ${ pb.petType == 1 ? "checked" : "" } value="1"> 고양이
              </label>
            </div>

           <div class="conInput explain">
              <div class="name">
                상세설명
              </div>
              <textarea class="scrollbar" name="content">${ pb.content }</textarea>
            
            </div>

            <input type="submit" value="수정완료" class="btn white">
          </div>
        </div>
        
      </div>
    </form>
  </section>

</body>
</html>