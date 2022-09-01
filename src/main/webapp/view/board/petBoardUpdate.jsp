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
	
	<h2>${ bs.boardName } 게시물 수정</h2>
	
    <form action="${ pageContext.request.contextPath }/board/petBoardUpdatePro" name="f" method="post">
	  <input type="hidden" name="postId" value="${ pb.postId }" />
      <div class="inner center">
        
        <div class="formImg">
        	<input type="hidden" name="petImg" value="">
          <img src="${ pageContext.request.contextPath }/view/board/img/${pb.petImg}" id="pic" alt="">
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
              <input type="text" name="petName" value="${ pb.petName }">
            </div>

            <div class="conInput center">
              <div class="name center">
                성별
              </div>
              <label class="center">
                <input type="radio" name="petGender" ${ pb.petGender == 1 ? "checked" : "" } value="1"> 수컷
              </label>
              <label class="center">
                <input type="radio" name="petGender" ${ pb.petGender == 2 ? "checked" : "" } value="2"> 암컷
              </label>
            </div>

            <div class="conInput center">
              <div class="name center">
                ${ bs.boardPlace }
              </div>
              <input type="text" name="place" value="${ pb.place }">
            </div>

            <div class="conInput center">
              <div class="name center">
                ${ bs.boardDate }
              </div>
              <input type="text" name="petDate" value="${ pb.petDate }">
            </div>

            <div class="conInput center">
              <div class="name center">
                특징
              </div>
              <input type="text" name="petDetail" value="${ pb.petDetail }">
            </div>

            <div class="conInput center">
              <div class="name center">
                전화번호
              </div>
              <input type="text" name="tel" value="${ pb.tel }">
            </div>

            <div class="conInput explain">
              <div class="name">
                상세설명
              </div>
              <textarea name="content">${ pb.content }</textarea>
            </div>


            <input type="submit" value="수정완료" class="btn white">
          </div>
        </div>
        
      </div>
    </form>
  </section>

</body>
</html>