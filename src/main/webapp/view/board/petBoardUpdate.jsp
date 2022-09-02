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
        	<input type="hidden" name="petImg" value="${pb.petImg}">
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
                종류
              </div>
              <label class="center">
                <input type="radio" name="petType" ${ pb.petType == 0 ? "checked" : "" } value="0"> 강아지
              </label>
              <label class="center">
                <input type="radio" name="petType" ${ pb.petType == 1 ? "checked" : "" } value="1"> 고양이
              </label>
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
                특징
              </div>
              <input type="text" name="petDetail" value="${ pb.petDetail }">
            </div>

            <div class="conInput center">
              <div class="name center">
                ${ bs.boardPlace }
              </div>
              <div class="address">
	              <input type="text" id="roadAddress" name="place" placeholder="예)서울 관악구" value="${ pb.place }">
	              <input type="button" onclick="execDaumPostcode()" value="주소 검색">
              </div>
            </div>

            <div class="conInput center">
              <div class="name center">
                ${ bs.boardDate }
              </div>
              <input type="date" value="${ pb.petDate }" name="petDate">
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
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("roadAddress").value = roadAddr;
              
                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                
               <%-- if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }
				--%>
				<%--
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                --%>
            }
        }).open();
    }
</script>

</body>
</html>