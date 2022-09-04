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
	
	<h2>후기 게시물 작성</h2>
	
    <form action="${ pageContext.request.contextPath }/board/reviewBoardPro" name="f" method="post">
		<input type="hidden" name="userId" value="${ sessionScope.userId }">
      <div class="inner center">
        
        <div class="formImg">
        	<input type="hidden" name="petImg" value="">
          <img src="${ pageContext.request.contextPath }/view/images/video_cover_pattern.png" id="pic" alt="">
          <a href="javascript:win_upload()" class="btn white">
            사진 넣기
          </a>
        </div>
        
        <div class="formContent" style="height: 67%;">
          <div class="inner">

           <div class="conInput center">
              <div class="name center">
                제목
              </div>
              <input type="text" name="subject" required>
            </div>
            
            <div class="conInput center">
              <div class="name center" style="width: 200px;">
                반려동물 이름
              </div>
              <input type="text" name="petName" required>
            </div>
            
            <div class="conInput center">
              <div class="name center">
                종류
              </div>
              <label class="center">
                <input type="radio" name="petType" value="0" required> 강아지
              </label>
              <label class="center">
                <input type="radio" name="petType" value="1" required> 고양이
              </label>
            </div>

           <div class="conInput explain">
              <div class="name">
                상세설명
              </div>
              <textarea name="content" required></textarea>
              
            </div>

            


            <input type="submit" value="작성완료" class="btn white">
          </div>
        </div>
        
      </div>
    </form>
  </section>

</body>
</html>