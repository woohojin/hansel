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
	<h2>입양공고 게시물 작성</h2>
	
    <form action="${ pageContext.request.contextPath }/board/adoptBoardPro" name="f" method="post">

      <div class="inner center">
        
        <div class="formImg">
        	<input type="hidden" name="petImg" value="">
          <img src="${ pageContext.request.contextPath }/view/images/video_cover_pattern.png" id="pic" alt="">
          <a href="javascript:win_upload()" class="btn white">
            사진 넣기
          </a>
        </div>
        
        <div class="formContent">
          <div class="inner">

            <div class="conInput center">
              <div class="name center">
                이름
              </div>
              <input type="text" maxlength="10" name="petName">
            </div>
			
			<div class="conInput center">
              <div class="name center">
                종류
              </div>
              <label class="center">
                <input type="radio" name="petType" value="0"> 강아지
              </label>
              <label class="center">
                <input type="radio" name="petType" value="1"> 고양이
              </label>
            </div>
			
            <div class="conInput center">
              <div class="name center">
                성별
              </div>
              <label class="center">
                <input type="radio" name="petGender" value="1"> 수컷
              </label>
              <label class="center">
                <input type="radio" name="petGender" value="2"> 암컷
              </label>
            </div>

            <div class="conInput center">
              <div class="name center">
                특징
              </div>
              <input type="text" name="petDetail">
            </div>

            <div class="conInput center">
              <div class="name center">
                중성화
              </div>
              <label class="center">
                <input type="radio" name="neuter" value="0"> 미완료
              </label>
              <label class="center">
                <input type="radio" name="neuter" value="1"> 완료
              </label>
            </div>

            <div class="conInput center">
              <div class="name center">
                예방접종
              </div>
              <label class="center">
                <input type="radio" name="vaccin" value="0"> 미완료
              </label>
              <label class="center">
                <input type="radio" name="vaccin" value="1"> 완료
              </label>
            </div>
            
            <div class="conInput center">
              <div class="name center">
                전화번호
              </div>
              <input type="number" name="tel" oninput="maxLengthCheck(this)" maxlength="11" placeholder="예) 01012345678" required>
            </div>
            
            <div class="conInput explain">
              <div class="name">
                상세설명
              </div>
              <textarea name="content"></textarea>
              
            </div>


            <input type="submit" value="작성완료" class="btn white">
          </div>
        </div>
        
      </div>
    </form>
  </section>
  
  <script>
  
  function maxLengthCheck(object){
	    if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }    
	}
  </script>

</body>
</html>