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
	
	<h2>입양공고 게시물 수정</h2>
	
    <form action="${ pageContext.request.contextPath }/board/adoptBoardUpdatePro" name="f" method="post">
	  <input type="hidden" name="adoptId" value="${ pb.adoptId }" />
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
                <input type="radio" name="petGender" ${ pb.petGender == 1 ? "checked" : "" } value="1"> 남아
              </label>
              <label class="center">
                <input type="radio" name="petGender" ${ pb.petGender == 2 ? "checked" : "" } value="2"> 여아
              </label>
            </div>

            <div class="conInput center">
              <div class="name center">
                특징
              </div>
              <input type="text" name="petDetail" value="${ pb.petDetail }">
            </div>

            <div class="conInput center">
              <div class="name center">
                중성화
              </div>
              <label class="center">
                <input type="radio" name="neuter" ${ pb.neuter == 0 ? "checked" : "" } value="0"> 미완료
              </label>
              <label class="center">
                <input type="radio" name="neuter" ${ pb.neuter == 1 ? "checked" : "" } value="1"> 완료
              </label>
            </div>

            <div class="conInput center">
              <div class="name center">
                예방접종
              </div>
              <label class="center">
                <input type="radio" name="vaccin" ${ pb.vaccin == 0 ? "checked" : "" } value="0"> 미완료
              </label>
              <label class="center">
                <input type="radio" name="vaccin" ${ pb.vaccin == 1 ? "checked" : "" } value="1"> 완료
              </label>
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