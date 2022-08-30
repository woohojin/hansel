<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	<%@ include file="../css/email.css" %>
</style>

</head>
<body>
	 <section class="email">
    <figure>
      <video src="${ pageContext.request.contextPath }/view/video/email.mp4" muted loop autoplay></video>
    </figure>
    <div class="video_cover"></div>
    <div class="inner center">
      <h2 class="subject">
        헨젤 & 빵조각 에게 메일 보내기
      </h2>
      <form id="contact-form" class="center">
  
        <div class="name">
          <h3>이름</h3>
          <input type="text" name="user_name" required>
        </div>
        <div class="inneremail">
          <h3>이메일</h3>
          <input type="email" name="user_email" required>
        </div>

        <div class="content">
          <h3>내용</h3>
          <textarea name="message" id="content" cols="30" rows="10" resize="false"></textarea>
        </div>

        <div class="submit">
          <input type="submit" value="전송">
        </div>
        <input type="hidden" name="contact_number">
  
      </form>
    </div>
  </section>	
  
  <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
</script>
<script type="text/javascript">
   (function(){
      emailjs.init("KYKRiRd7xK4iIMxod");
   })();
</script>
<script type="text/javascript">
        window.onload = function() {
            document.getElementById('contact-form').addEventListener('submit', function(event) {
                event.preventDefault();
                // generate a five digit number for the contact_number variable
                this.contact_number.value = Math.random() * 100000 | 0;
                // these IDs from the previous steps
                emailjs.sendForm('service_6whpfrp', 'template_r0le4qb', this)
                    .then(function() {
                        alert('소중한 의견 감사합니다.');
                        location.href = "${ pageContext.request.contextPath }/member/index";
                    }, function(error) {
                        alert('오류가 발생하였습니다. 다시 시도해주세요.');
                        location.href = "${ pageContext.request.contextPath }/member/email";
                    });
            });
        }
    </script>
</body>
</html>