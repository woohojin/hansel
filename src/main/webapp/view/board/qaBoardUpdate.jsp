<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoardForm.css">

</head>
<body>

	<section class="module form" style="height: 430px; width: 50%; margin: 100px auto;">
	
	<h2 style="padding-left: 150px;"> 질문 수정</h2>
	
    <form action="${ pageContext.request.contextPath }/board/QBoardUpdatePro" name="f" method="post">

      <div class="inner center">
        
        <div class="formContent">
          <div class="inner">

            <div class="conInput center" style="margin-bottom: 10px;">
              <div class="name center">
               	질문
              </div>
              <input type="text" name="subject" value="${ pb.subject }">
            </div>

            <div class="conInput explain">
              <div class="name">
                내용
              </div>
              <textarea name="content">${ pb.content }</textarea>
            </div>
           	<input type="hidden" name="userId" value="${ sessionScope.userId }"/>
			<input type="hidden" name="QId" value="${ pb.QId }"/>

            <input type="submit" value="작성완료" class="btn white">
          </div>
        </div>
        
      </div>
    </form>
  </section>

</body>
</html>