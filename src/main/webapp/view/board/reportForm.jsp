<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<div class="w3-container w3-blue">
		<h2>신고 작성</h2>
	</div>
	<form class="w3-container" action="${ pageContext.request.contextPath }/board/reportPro" method="post">
		<input type="hidden" name="reportId" value="${ reportInfo.reportId }"/>
		<input type="hidden" name="boardType" value="${ reportInfo.boardType }"/>
		<input type="hidden" name="reportType" value="${ reportInfo.reportType }"/>
		<input type="hidden" name="userId" value="${ sessionScope.userId }"/>
		<div class="w3-container">
			<h2>신고이유</h2>
			<textarea name="reportText" style="resize: none; width: 300px; height: 200px;"></textarea>
		</div>
		<input class="w3-input" type="submit" value="신고" style="cursor:pointer;">
	</form>
</body>
</html>