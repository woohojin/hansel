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
	
	<h2>${ bs.boardName } 게시물 작성</h2>
	
    <form action="${ pageContext.request.contextPath }/board/reviewBoardUpdatePro" name="f" method="post">
	  <input type="hidden" name="reviewId" value="${ rb.reviewId }" />
      <div class="inner center">
        
        <div class="formImg">
        	<input type="hidden" name="petImg" value="">
          <img src="${ pageContext.request.contextPath }/view/board/img/${pb.petImg}" id="pic" alt="">
          <a href="javascript:win_upload()" class="btn white">
            사진 넣기 ${ rb.reviewId }
          </a>
        </div>
        
        <div class="formContent">
          <div class="inner">
			
            <div class="conInput center">
              <div class="name center">
                이름
              </div>
              <input type="text" name="petName" value="${ rb.petName }">
            </div>
			
			<div class="conInput center">
              <div class="name center">
               	질문
              </div>
              <input type="text" name="subject" value="${ rb.subject }">
            </div>
			
            <div class="conInput explain">
              <div class="name">
                내용
              </div>
              <textarea name="content">${ rb.content }</textarea>
            </div>

            <input type="submit" value="수정완료" class="btn white">
          </div>
        </div>
        
      </div>
    </form>
  </section>

</body>
</html>